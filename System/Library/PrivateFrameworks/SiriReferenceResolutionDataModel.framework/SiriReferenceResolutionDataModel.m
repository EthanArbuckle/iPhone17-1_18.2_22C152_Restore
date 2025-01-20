ValueMetadata *type metadata accessor for RRConstants()
{
  return &type metadata for RRConstants;
}

ValueMetadata *type metadata accessor for RRConstants.RBSConstants()
{
  return &type metadata for RRConstants.RBSConstants;
}

uint64_t RREntity.id.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RREntity.appBundleId.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RREntity.usoEntity.getter()
{
  return swift_retain();
}

uint64_t RREntity.typedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RREntity() + 28);
  return sub_2292E2230(v3, a1);
}

uint64_t type metadata accessor for RREntity()
{
  uint64_t result = qword_26AEC9160;
  if (!qword_26AEC9160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2292E2230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t RREntity.dataType.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RREntity.data.getter()
{
  type metadata accessor for RREntity();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  sub_2292E2354(v0, v1);
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2292E2354(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2292E2368(a1, a2);
  }
  return a1;
}

uint64_t sub_2292E2368(uint64_t a1, unint64_t a2)
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

uint64_t RREntity.group.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RREntity() + 40);
  *(void *)a1 = *(void *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  return swift_bridgeObjectRetain();
}

__n128 RREntity.group.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  uint64_t v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for RREntity() + 40));
  swift_bridgeObjectRelease();
  __n128 result = v5;
  *uint64_t v3 = v5;
  v3[1].n128_u64[0] = v2;
  return result;
}

uint64_t (*RREntity.group.modify())()
{
  return nullsub_1;
}

uint64_t RREntity.metadata.getter()
{
  type metadata accessor for RREntity();
  return swift_bridgeObjectRetain();
}

uint64_t RREntity.metadata.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_36() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*RREntity.metadata.modify())()
{
  return nullsub_1;
}

uint64_t RREntity.restrictedEntityKey.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RREntity.restrictedEntityKey.setter(uint64_t a1, uint64_t a2)
{
  __n128 v5 = (void *)(v2 + *(int *)(type metadata accessor for RREntity() + 48));
  uint64_t result = swift_bridgeObjectRelease();
  *__n128 v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*RREntity.restrictedEntityKey.modify())()
{
  return nullsub_1;
}

uint64_t RREntity.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v3 = OUTLINED_FUNCTION_5(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_22();
  uint64_t v6 = v4 - v5;
  MEMORY[0x270FA5388](v7);
  v9 = (char *)&v22 - v8;
  uint64_t v23 = 0;
  *(void *)&long long v24 = 0xE000000000000000;
  sub_229309170();
  uint64_t v25 = v23;
  uint64_t v26 = v24;
  sub_229309020();
  swift_bridgeObjectRetain();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRetain();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  sub_229308E30();
  sub_229308DE0();
  swift_release();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  uint64_t v10 = type metadata accessor for RREntity();
  sub_2292E2230(v0 + *(int *)(v10 + 28), (uint64_t)v9);
  uint64_t v11 = sub_229308F90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  sub_2292E2AE0((uint64_t)v9);
  if (EnumTagSinglePayload == 1)
  {
    unint64_t v13 = 0xE300000000000000;
    uint64_t v14 = 7104878;
  }
  else
  {
    uint64_t v15 = OUTLINED_FUNCTION_42();
    sub_2292E2230(v15, v16);
    if (__swift_getEnumTagSinglePayload(v6, 1, v11) == 1)
    {
      sub_2292E2AE0(v6);
      uint64_t v14 = 0;
      unint64_t v13 = 0;
    }
    else
    {
      uint64_t v14 = sub_229308F80();
      unint64_t v13 = v17;
      OUTLINED_FUNCTION_27();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v6, v11);
    }
  }
  uint64_t v23 = v14;
  *(void *)&long long v24 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E70);
  sub_2293091C0();
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRetain();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  uint64_t v19 = v1 + *(int *)(v10 + 40);
  uint64_t v23 = *(void *)v19;
  long long v24 = *(_OWORD *)(v19 + 8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F08);
  sub_229309000();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  uint64_t v20 = swift_bridgeObjectRetain();
  MEMORY[0x22A6B55A0](v20, &type metadata for RRMetadata);
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  sub_229309020();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t UsoEntity.debugString.getter()
{
  sub_229308E30();
  uint64_t v0 = sub_229308DE0();
  swift_release();
  return v0;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_2292E2AE0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void RREntity.init(id:appBundleId:usoEntity:dataType:data:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_30();
  uint64_t v10 = OUTLINED_FUNCTION_41();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v10);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(v11, v14, v15, a6, a7, a8);
  *(void *)(v9 + v12) = MEMORY[0x263F8EE78];
  *unint64_t v13 = 0;
  v13[1] = 0;
}

void RREntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_30();
  uint64_t v13 = OUTLINED_FUNCTION_41();
  __swift_storeEnumTagSinglePayload(v11, 1, 1, v13);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(v14, v17, a6, a11, a7, a8);
  *(void *)(v12 + v15) = v19;
  *uint64_t v16 = 0;
  v16[1] = 0;
}

void RREntity.init(id:appBundleId:typedValue:dataType:data:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21,uint64_t *a22)
{
  OUTLINED_FUNCTION_2();
  uint64_t v81 = v24;
  uint64_t v82 = v25;
  uint64_t v77 = v26;
  uint64_t v78 = v27;
  uint64_t v29 = v28;
  uint64_t v80 = v30;
  uint64_t v76 = v31;
  v33 = v32;
  unint64_t v84 = a21;
  uint64_t v85 = v34;
  sub_229308F70();
  OUTLINED_FUNCTION_0();
  v72[1] = v36;
  v72[2] = v35;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_3();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v38 = OUTLINED_FUNCTION_5(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_22();
  uint64_t v75 = v39 - v40;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v41);
  v43 = (char *)v72 - v42;
  uint64_t v44 = sub_229308F90();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v45;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_11();
  uint64_t v48 = *a22;
  uint64_t v79 = a22[1];
  uint64_t v73 = a22[2];
  uint64_t v74 = v48;
  uint64_t v83 = v29;
  sub_2292E2230(v29, (uint64_t)v43);
  if (__swift_getEnumTagSinglePayload((uint64_t)v43, 1, v44) == 1)
  {
    sub_2292E2AE0((uint64_t)v43);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v23, v43, v44);
    v86[3] = v44;
    __swift_allocate_boxed_opaque_existential_0(v86);
    OUTLINED_FUNCTION_19();
    v49();
    sub_229308F30();
    sub_229308F60();
    sub_229308F40();
    sub_229308F50();
    if (!v22)
    {
      uint64_t v56 = OUTLINED_FUNCTION_32();
      v57(v56);
      uint64_t v58 = OUTLINED_FUNCTION_31();
      v59(v58);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v86);
      uint64_t v55 = a10;
      goto LABEL_9;
    }

    uint64_t v50 = OUTLINED_FUNCTION_32();
    v51(v50);
    uint64_t v52 = OUTLINED_FUNCTION_31();
    v53(v52);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v86);
  }
  sub_229308DA0();
  OUTLINED_FUNCTION_18();
  sub_229308D90();
  uint64_t v54 = MEMORY[0x22A6B5330]();
  if (v54)
  {
    uint64_t v55 = v54;
    swift_release();
LABEL_9:
    uint64_t v60 = v83;
    uint64_t v61 = v75;
    sub_2292E2230(v83, v75);
    sub_2292E2AE0(v60);
    v62 = (int *)type metadata accessor for RREntity();
    v63 = (void *)((char *)v33 + v62[10]);
    v64 = (void *)((char *)v33 + v62[12]);
    uint64_t v65 = v80;
    void *v33 = v76;
    v33[1] = v65;
    uint64_t v66 = v81;
    v33[2] = v77;
    v33[3] = v66;
    v33[4] = v55;
    sub_2292E31CC(v61, (uint64_t)v33 + v62[7]);
    v67 = (void *)((char *)v33 + v62[8]);
    uint64_t v68 = v82;
    void *v67 = v78;
    v67[1] = v68;
    v69 = (void *)((char *)v33 + v62[9]);
    unint64_t v70 = v84;
    void *v69 = v85;
    v69[1] = v70;
    uint64_t v71 = v79;
    void *v63 = v74;
    v63[1] = v71;
    v63[2] = v73;
    *(void *)((char *)v33 + v62[11]) = MEMORY[0x263F8EE78];
    void *v64 = 0;
    v64[1] = 0;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2292E3114();
  OUTLINED_FUNCTION_29();
  swift_willThrow();
  sub_2292E3160(v85, v84);
  swift_release();
  sub_2292E2AE0(v83);
LABEL_10:
  OUTLINED_FUNCTION_1();
}

__n128 RREntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:restrictedEntityKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_8();
  __n128 v27 = *a11;
  unint64_t v26 = a11[1].n128_u64[0];
  uint64_t v20 = (int *)type metadata accessor for RREntity();
  v21 = (__n128 *)((char *)v19 + v20[10]);
  uint64_t v22 = (void *)((char *)v19 + v20[12]);
  *uint64_t v19 = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v14;
  sub_2292E31CC(a6, (uint64_t)v19 + v20[7]);
  uint64_t v23 = (void *)((char *)v19 + v20[8]);
  *uint64_t v23 = a7;
  v23[1] = a8;
  uint64_t v24 = (void *)((char *)v19 + v20[9]);
  *uint64_t v24 = a9;
  v24[1] = a10;
  __n128 result = v27;
  __n128 *v21 = v27;
  v21[1].n128_u64[0] = v26;
  *(void *)((char *)v19 + v20[11]) = a12;
  *uint64_t v22 = a13;
  v22[1] = a14;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_2292E3114()
{
  unint64_t result = qword_26830FB50;
  if (!qword_26830FB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FB50);
  }
  return result;
}

uint64_t sub_2292E3160(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2292E3174(a1, a2);
  }
  return a1;
}

uint64_t sub_2292E3174(uint64_t a1, unint64_t a2)
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

uint64_t sub_2292E31CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v25 = v5;
  uint64_t v26 = v6;
  uint64_t v23 = v7;
  uint64_t v24 = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_4();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v17 = OUTLINED_FUNCTION_5(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_23();
  uint64_t v18 = sub_229308F90();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v18);
  OUTLINED_FUNCTION_19();
  v19();
  OUTLINED_FUNCTION_38();
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v10, v23, v24, v25, v26, v0, v20, v12, v21, v22, 0);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v2);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_2();
  uint64_t v20 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v15 = OUTLINED_FUNCTION_5(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_9();
  uint64_t v16 = sub_229308F90();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v16);
  OUTLINED_FUNCTION_38();
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v11, v9, v7, v5, v3, v0, v20, v17, v13, v18, v19, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X7>, void *a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v37 = a7[1];
  uint64_t v33 = a7[2];
  uint64_t v34 = *a7;
  uint64_t v18 = (int *)type metadata accessor for RREntity();
  uint64_t v19 = (void *)((char *)a8 + v18[10]);
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v38 = v19;
  v19[2] = 0;
  uint64_t v20 = (void *)((char *)a8 + v18[12]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v39 = v20;
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  uint64_t v35 = (uint64_t)a8 + v18[7];
  sub_2292E2230(a6, v35);
  swift_getMetatypeMetadata();
  swift_retain();
  uint64_t v21 = sub_229309000();
  uint64_t v22 = (void *)((char *)a8 + v18[8]);
  *uint64_t v22 = v21;
  v22[1] = v23;
  sub_229308CD0();
  OUTLINED_FUNCTION_18();
  sub_229308CC0();
  uint64_t v24 = sub_229308CB0();
  uint64_t v26 = v25;
  swift_release();
  if (v36)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27();
    uint64_t v27 = OUTLINED_FUNCTION_34();
    v28(v27);
    sub_2292E2AE0(a6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_2292E2AE0(v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_27();
    uint64_t v30 = OUTLINED_FUNCTION_34();
    v31(v30);
    sub_2292E2AE0(a6);
    v32 = (void *)((char *)a8 + v18[9]);
    uint64_t *v32 = v24;
    v32[1] = v26;
    swift_bridgeObjectRelease();
    *uint64_t v38 = v34;
    v38[1] = v37;
    v38[2] = v33;
    *(void *)((char *)a8 + v18[11]) = a9;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v39 = a10;
    v39[1] = a11;
  }
  return result;
}

void RREntity.init<A>(id:appBundleId:typedValue:intentEntity:group:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v1;
  uint64_t v3 = v2;
  uint64_t v20 = v4;
  uint64_t v21 = v5;
  uint64_t v23 = v6;
  uint64_t v19 = v7;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  sub_229308DA0();
  OUTLINED_FUNCTION_18();
  sub_229308D90();
  uint64_t v11 = MEMORY[0x22A6B5330]();
  if (v11)
  {
    uint64_t v12 = v11;
    sub_2292E2230(v3, v0);
    OUTLINED_FUNCTION_19();
    v13();
    OUTLINED_FUNCTION_38();
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v20, v23, v21, v22, v12, v0, v14, v19, v17, v18, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E3114();
    OUTLINED_FUNCTION_29();
    swift_willThrow();
  }
  swift_release();
  uint64_t v15 = OUTLINED_FUNCTION_28();
  v16(v15);
  sub_2292E2AE0(v3);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_2();
  uint64_t v29 = v1;
  uint64_t v30 = v0;
  uint64_t v26 = v2;
  uint64_t v27 = v3;
  uint64_t v5 = v4;
  uint64_t v34 = v6;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v28 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v15 = OUTLINED_FUNCTION_5(v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *v5;
  uint64_t v18 = v5[1];
  uint64_t v20 = v5[2];
  sub_229308DA0();
  OUTLINED_FUNCTION_18();
  sub_229308D90();
  uint64_t v21 = MEMORY[0x22A6B5330]();
  if (v21)
  {
    uint64_t v22 = v21;
    sub_2292E2230(v8, (uint64_t)v17);
    uint64_t v31 = v19;
    v32 = v18;
    uint64_t v33 = v20;
    OUTLINED_FUNCTION_38();
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v28, v12, v29, v10, v22, (uint64_t)v17, v34, v23, v27, v24, v25, 0);
    sub_2292E2AE0(v8);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E3114();
    OUTLINED_FUNCTION_29();
    swift_willThrow();
    swift_release();
    swift_unknownObjectRelease();
    sub_2292E2AE0(v8);
  }
  OUTLINED_FUNCTION_1();
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:restrictedEntityKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_2();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v46 = v27;
  uint64_t v47 = v28;
  uint64_t v44 = v29;
  uint64_t v45 = v30;
  uint64_t v42 = v32;
  uint64_t v43 = v31;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_4();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v35 = OUTLINED_FUNCTION_5(v34);
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_3();
  long long v41 = *v26;
  uint64_t v36 = *((void *)v26 + 2);
  uint64_t v37 = sub_229308F90();
  OUTLINED_FUNCTION_20(v37);
  OUTLINED_FUNCTION_19();
  v38();
  long long v48 = v41;
  uint64_t v49 = v36;
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v43, v44, v45, v46, v47, v22, (uint64_t *)&v48, v42, MEMORY[0x263F8EE78], v24, a21);
  uint64_t v39 = OUTLINED_FUNCTION_37();
  v40(v39, a22);
  OUTLINED_FUNCTION_1();
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_2();
  uint64_t v41 = v23;
  uint64_t v42 = v22;
  uint64_t v39 = v24;
  uint64_t v40 = v25;
  uint64_t v38 = v26;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_4();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v33 = OUTLINED_FUNCTION_5(v32);
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  uint64_t v34 = sub_229308F90();
  OUTLINED_FUNCTION_20(v34);
  OUTLINED_FUNCTION_19();
  v35();
  memset(v43, 0, sizeof(v43));
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v28, v38, v39, v40, v42, v21, v43, v30, v41, 0, 0);
  uint64_t v36 = OUTLINED_FUNCTION_37();
  v37(v36, a21);
  OUTLINED_FUNCTION_1();
}

void RREntity.init<A>(id:appBundleId:typedValue:intentEntity:group:metadata:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v22 = v2;
  uint64_t v23 = v1;
  uint64_t v25 = v3;
  uint64_t v20 = v4;
  uint64_t v21 = v5;
  uint64_t v7 = v6;
  uint64_t v19 = v8;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v11 = OUTLINED_FUNCTION_5(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10();
  swift_bridgeObjectRelease();
  sub_229308DA0();
  OUTLINED_FUNCTION_18();
  sub_229308D90();
  uint64_t v12 = MEMORY[0x22A6B5330]();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_2292E2230(v25, v0);
    OUTLINED_FUNCTION_19();
    v14();
    memset(v24, 0, sizeof(v24));
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v20, v7, v21, v23, v13, v0, v24, v19, v22, 0, 0);
    swift_release();
    uint64_t v15 = OUTLINED_FUNCTION_26();
    v16(v15);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E3114();
    OUTLINED_FUNCTION_29();
    swift_willThrow();
    swift_release();
    uint64_t v17 = OUTLINED_FUNCTION_26();
    v18(v17);
  }
  sub_2292E2AE0(v25);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];
  uint64_t v26;

  OUTLINED_FUNCTION_2();
  uint64_t v24 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v26 = v8;
  uint64_t v22 = v9;
  uint64_t v23 = v10;
  uint64_t v12 = v11;
  uint64_t v21 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v15 = OUTLINED_FUNCTION_5(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_23();
  uint64_t v16 = *v3;
  uint64_t v17 = v3[1];
  uint64_t v18 = v3[2];
  sub_229308DA0();
  OUTLINED_FUNCTION_18();
  sub_229308D90();
  uint64_t v19 = MEMORY[0x22A6B5330]();
  if (v19)
  {
    uint64_t v20 = v19;
    sub_2292E2230(v7, v0);
    v25[0] = v16;
    v25[1] = v17;
    v25[2] = v18;
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v22, v12, v23, v26, v20, v0, v5, v25, v21, v24, 0, 0);
    sub_2292E2AE0(v7);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E3114();
    OUTLINED_FUNCTION_29();
    swift_willThrow();
    swift_release();
    swift_unknownObjectRelease();
    sub_2292E2AE0(v7);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v34 = a8[1];
  uint64_t v29 = a8[2];
  uint64_t v30 = *a8;
  uint64_t v18 = (int *)type metadata accessor for RREntity();
  uint64_t v19 = (void *)((char *)a9 + v18[10]);
  *uint64_t v19 = 0;
  v19[1] = 0;
  v19[2] = 0;
  uint64_t v20 = (void *)((char *)a9 + v18[12]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v37 = v20;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  uint64_t v36 = a6;
  uint64_t v31 = (uint64_t)a9 + v18[7];
  sub_2292E2230(a6, v31);
  swift_getMetatypeMetadata();
  swift_retain();
  uint64_t v21 = sub_229309000();
  uint64_t v22 = (void *)((char *)a9 + v18[8]);
  *uint64_t v22 = v21;
  v22[1] = v23;
  uint64_t v24 = static RRCoder.encode<A>(_:)(a7);
  uint64_t v26 = v25;
  swift_release();
  swift_unknownObjectRelease();
  if (v33)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E2AE0(v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_2292E2AE0(v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2292E2AE0(v36);
    uint64_t v28 = (void *)((char *)a9 + v18[9]);
    *uint64_t v28 = v24;
    v28[1] = v26;
    swift_bridgeObjectRelease();
    *uint64_t v19 = v30;
    v19[1] = v34;
    v19[2] = v29;
    *(void *)((char *)a9 + v18[11]) = a10;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v37 = a11;
    v37[1] = a12;
  }
  return result;
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:restrictedEntityKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v42 = v26;
  uint64_t v43 = v27;
  uint64_t v41 = v28;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v38 = OUTLINED_FUNCTION_5(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_9();
  uint64_t v39 = *(void *)(v25 + 16);
  uint64_t v40 = sub_229308F90();
  OUTLINED_FUNCTION_40(v40);
  v44[2] = v39;
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v34, v32, v30, v41, v42, v21, v43, v44, v36, MEMORY[0x263F8EE78], v23, a21);
  OUTLINED_FUNCTION_1();
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:metadata:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v18 = OUTLINED_FUNCTION_5(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_9();
  uint64_t v19 = *(void *)(v4 + 16);
  uint64_t v20 = sub_229308F90();
  OUTLINED_FUNCTION_40(v20);
  v23[2] = v19;
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v14, v12, v10, v8, v21, v0, v22, v23, v16, v2, 0, 0);
  OUTLINED_FUNCTION_1();
}

uint64_t static RREntity.== infix(_:_:)(void *a1, void *a2)
{
  v98 = (int *)type metadata accessor for RREntity();
  OUTLINED_FUNCTION_27();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_22();
  uint64_t v7 = v5 - v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_16();
  uint64_t v107 = v9;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_16();
  uint64_t v102 = v11;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_16();
  uint64_t v101 = v13;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_16();
  uint64_t v103 = v15;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_16();
  uint64_t v100 = v17;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_16();
  uint64_t v104 = v19;
  OUTLINED_FUNCTION_14();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_16();
  uint64_t v105 = v21;
  OUTLINED_FUNCTION_14();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v98 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v98 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = (char *)&v98 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v98 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v98 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v39 = (char *)&v98 - v38;
  BOOL v40 = *a1 == *a2 && a1[1] == a2[1];
  v106 = a2;
  uint64_t v41 = (uint64_t)a1;
  uint64_t v99 = v7;
  if (v40)
  {
    sub_2292E64AC((uint64_t)a1, (uint64_t)&v98 - v38);
    sub_2292E64AC((uint64_t)a2, (uint64_t)v37);
  }
  else
  {
    char v42 = sub_229309350();
    uint64_t v43 = (uint64_t)a1;
    char v44 = v42;
    sub_2292E64AC(v43, (uint64_t)v39);
    sub_2292E64AC((uint64_t)a2, (uint64_t)v37);
    if ((v44 & 1) == 0)
    {
      sub_2292E6510((uint64_t)v39);
      sub_2292E6510((uint64_t)v37);
      uint64_t v45 = v41;
      sub_2292E64AC(v41, (uint64_t)v34);
      uint64_t v46 = (uint64_t)v106;
      sub_2292E64AC((uint64_t)v106, (uint64_t)v31);
LABEL_13:
      sub_2292E6510((uint64_t)v34);
      sub_2292E6510((uint64_t)v31);
      sub_2292E64AC(v45, (uint64_t)v28);
      sub_2292E64AC(v46, (uint64_t)v25);
      uint64_t v50 = v101;
      uint64_t v49 = v102;
      uint64_t v51 = v100;
LABEL_20:
      sub_2292E6510((uint64_t)v25);
      sub_2292E6510((uint64_t)v28);
LABEL_34:
      uint64_t v69 = v103;
      uint64_t v68 = v104;
      uint64_t v67 = v105;
      sub_2292E64AC(v45, v105);
      sub_2292E64AC(v46, v68);
      goto LABEL_35;
    }
  }
  if (*((void *)v39 + 2) == *((void *)v37 + 2) && *((void *)v39 + 3) == *((void *)v37 + 3))
  {
    sub_2292E6510((uint64_t)v39);
    sub_2292E6510((uint64_t)v37);
    sub_2292E64AC(v41, (uint64_t)v34);
    sub_2292E64AC((uint64_t)v106, (uint64_t)v31);
  }
  else
  {
    char v48 = sub_229309350();
    sub_2292E6510((uint64_t)v39);
    sub_2292E6510((uint64_t)v37);
    uint64_t v45 = v41;
    sub_2292E64AC(v41, (uint64_t)v34);
    uint64_t v46 = (uint64_t)v106;
    sub_2292E64AC((uint64_t)v106, (uint64_t)v31);
    if ((v48 & 1) == 0) {
      goto LABEL_13;
    }
  }
  sub_229308E30();
  uint64_t v52 = sub_229308DE0();
  uint64_t v54 = v53;
  swift_release();
  sub_229308E30();
  uint64_t v55 = sub_229308DE0();
  uint64_t v57 = v56;
  swift_release();
  if (v52 == v55 && v54 == v57)
  {
    swift_bridgeObjectRelease_n();
    sub_2292E6510((uint64_t)v34);
    sub_2292E6510((uint64_t)v31);
    uint64_t v45 = v41;
    sub_2292E64AC(v41, (uint64_t)v28);
    uint64_t v46 = (uint64_t)v106;
    sub_2292E64AC((uint64_t)v106, (uint64_t)v25);
    uint64_t v50 = v101;
    uint64_t v49 = v102;
    uint64_t v51 = v100;
  }
  else
  {
    char v59 = sub_229309350();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2292E6510((uint64_t)v34);
    sub_2292E6510((uint64_t)v31);
    uint64_t v45 = v41;
    sub_2292E64AC(v41, (uint64_t)v28);
    uint64_t v46 = (uint64_t)v106;
    sub_2292E64AC((uint64_t)v106, (uint64_t)v25);
    uint64_t v50 = v101;
    uint64_t v49 = v102;
    uint64_t v51 = v100;
    if ((v59 & 1) == 0) {
      goto LABEL_20;
    }
  }
  uint64_t v60 = v98[8];
  uint64_t v61 = &v28[v60];
  uint64_t v62 = *(void *)&v28[v60 + 8];
  v63 = &v25[v60];
  uint64_t v64 = *((void *)v63 + 1);
  if (!v62)
  {
    swift_bridgeObjectRetain();
    sub_2292E6510((uint64_t)v25);
    sub_2292E6510((uint64_t)v28);
    if (!v64)
    {
LABEL_45:
      uint64_t v67 = v105;
      sub_2292E64AC(v45, v105);
      uint64_t v68 = v104;
      sub_2292E64AC(v46, v104);
      goto LABEL_46;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  if (!v64)
  {
    swift_bridgeObjectRetain();
    sub_2292E6510((uint64_t)v25);
    sub_2292E6510((uint64_t)v28);
    goto LABEL_33;
  }
  if (*(void *)v61 == *(void *)v63 && v62 == v64)
  {
    swift_bridgeObjectRetain();
    sub_2292E6510((uint64_t)v25);
    sub_2292E6510((uint64_t)v28);
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  char v66 = sub_229309350();
  swift_bridgeObjectRetain();
  sub_2292E6510((uint64_t)v25);
  sub_2292E6510((uint64_t)v28);
  swift_bridgeObjectRelease();
  uint64_t v67 = v105;
  sub_2292E64AC(v45, v105);
  uint64_t v68 = v104;
  sub_2292E64AC(v46, v104);
  uint64_t v69 = v103;
  if ((v66 & 1) == 0)
  {
LABEL_35:
    sub_2292E6510(v68);
    sub_2292E6510(v67);
LABEL_36:
    sub_2292E64AC(v45, v51);
    sub_2292E64AC(v46, v69);
LABEL_37:
    sub_2292E6510(v69);
    sub_2292E6510(v51);
LABEL_38:
    uint64_t v70 = v99;
LABEL_39:
    sub_2292E64AC(v45, v50);
    sub_2292E64AC(v46, v49);
LABEL_40:
    sub_2292E6510(v50);
    sub_2292E6510(v49);
    sub_2292E64AC(v45, v107);
    sub_2292E64AC(v46, v70);
LABEL_41:
    sub_2292E6510(v70);
    sub_2292E6510(v107);
LABEL_42:
    LOBYTE(v71) = 0;
    return v71 & 1;
  }
LABEL_46:
  uint64_t v73 = v98[9];
  uint64_t v74 = v67;
  uint64_t v75 = *(void *)(v67 + v73);
  unint64_t v76 = *(void *)(v67 + v73 + 8);
  uint64_t v77 = (uint64_t *)(v68 + v73);
  uint64_t v78 = *v77;
  unint64_t v79 = v77[1];
  if (v76 >> 60 == 15)
  {
    v106 = (void *)v75;
    sub_2292E2354(v78, v79);
    sub_2292E6510(v68);
    sub_2292E6510(v74);
    if (v79 >> 60 == 15)
    {
      sub_2292E3160((uint64_t)v106, v76);
      sub_2292E64AC(v45, v51);
      uint64_t v69 = v103;
      sub_2292E64AC(v46, v103);
      goto LABEL_53;
    }
LABEL_51:
    sub_2292E3160((uint64_t)v106, v76);
    sub_2292E3160(v78, v79);
    uint64_t v69 = v103;
    goto LABEL_36;
  }
  if (v79 >> 60 == 15)
  {
    uint64_t v80 = v75;
    sub_2292E2368(v75, v76);
    sub_2292E2368(v80, v76);
    sub_2292E6510(v104);
    sub_2292E6510(v105);
    v106 = (void *)v80;
    sub_2292E3160(v80, v76);
    goto LABEL_51;
  }
  uint64_t v81 = v75;
  sub_2292E2354(v75, v76);
  sub_2292E2354(v78, v79);
  sub_2292E2354(v81, v76);
  char v82 = MEMORY[0x22A6B5220](v81, v76, v78, v79);
  sub_2292E3160(v78, v79);
  sub_2292E3160(v81, v76);
  sub_2292E6510(v104);
  sub_2292E6510(v105);
  sub_2292E3160(v81, v76);
  sub_2292E64AC(v45, v51);
  uint64_t v69 = v103;
  sub_2292E64AC(v46, v103);
  if ((v82 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_53:
  uint64_t v83 = v98[10];
  unint64_t v84 = (void *)(v51 + v83);
  uint64_t v85 = *(void *)(v51 + v83 + 8);
  v86 = (void *)(v69 + v83);
  uint64_t v87 = v86[1];
  if (!v85)
  {
    swift_bridgeObjectRetain();
    sub_2292E6510(v69);
    sub_2292E6510(v51);
    if (!v87)
    {
      swift_bridgeObjectRelease();
      sub_2292E64AC(v45, v50);
      sub_2292E64AC(v46, v49);
      uint64_t v70 = v99;
      goto LABEL_68;
    }
LABEL_66:
    uint64_t v70 = v99;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  if (!v87)
  {
    swift_bridgeObjectRetain_n();
    sub_2292E6510(v69);
    sub_2292E6510(v51);
    swift_bridgeObjectRelease();
    goto LABEL_66;
  }
  uint64_t v88 = v84[2];
  uint64_t v89 = v86[2];
  BOOL v90 = *v84 == *v86 && v85 == v87;
  if (!v90 && (sub_229309350() & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    sub_2292E6510(v69);
    sub_2292E6510(v51);
    swift_bridgeObjectRelease_n();
    goto LABEL_38;
  }
  swift_bridgeObjectRetain_n();
  sub_2292E6510(v69);
  sub_2292E6510(v51);
  swift_bridgeObjectRelease_n();
  sub_2292E64AC(v45, v50);
  sub_2292E64AC(v46, v49);
  BOOL v40 = v88 == v89;
  uint64_t v70 = v99;
  if (!v40) {
    goto LABEL_40;
  }
LABEL_68:
  v91 = v98;
  char v92 = sub_2292E4E70(*(void *)(v50 + v98[11]), *(void *)(v49 + v98[11]));
  sub_2292E6510(v50);
  sub_2292E6510(v49);
  sub_2292E64AC(v45, v107);
  sub_2292E64AC(v46, v70);
  if ((v92 & 1) == 0) {
    goto LABEL_41;
  }
  uint64_t v93 = v91[12];
  v94 = (void *)(v107 + v93);
  uint64_t v95 = *(void *)(v107 + v93 + 8);
  v96 = (void *)(v70 + v93);
  uint64_t v71 = v96[1];
  if (!v95)
  {
    swift_bridgeObjectRetain();
    sub_2292E6510(v70);
    sub_2292E6510(v107);
    if (!v71)
    {
      LOBYTE(v71) = 1;
      return v71 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  if (v71)
  {
    if (*v94 == *v96 && v95 == v71) {
      LOBYTE(v71) = 1;
    }
    else {
      LOBYTE(v71) = sub_229309350();
    }
  }
  swift_bridgeObjectRetain();
  sub_2292E6510(v70);
  sub_2292E6510(v107);
  swift_bridgeObjectRelease();
  return v71 & 1;
}

uint64_t sub_2292E4E70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 32;
    uint64_t v5 = a2 + 32;
    uint64_t v75 = a1 + 32;
    uint64_t v76 = *(void *)(a1 + 16);
    uint64_t v74 = a2 + 32;
    while (1)
    {
      uint64_t v6 = 56 * v3++;
      uint64_t v7 = (float64x2_t *)(v4 + v6);
      uint64_t v8 = *(uint64_t *)(v4 + v6 + 32);
      uint64_t v9 = *(uint64_t *)(v4 + v6 + 40);
      uint64_t v10 = *(unsigned __int8 *)(v4 + v6 + 48);
      uint64_t v11 = v5 + v6;
      float64x2_t v12 = *v7;
      float64x2_t v13 = v7[1];
      float64x2_t v14 = *(float64x2_t *)v11;
      float64x2_t v15 = *(float64x2_t *)(v11 + 16);
      double v16 = *(double *)(v11 + 32);
      double v17 = *(double *)(v11 + 40);
      int v18 = *(unsigned __int8 *)(v11 + 48);
      unsigned __int8 v19 = veorq_s8((int8x16_t)v14, (int8x16_t)v12).u8[0];
      uint64_t v20 = *(void *)&v12.f64[1];
      uint64_t v21 = *(void *)&v13.f64[1];
      int32x4_t v22 = (int32x4_t)vceqq_f64(v12, v14);
      int32x4_t v23 = (int32x4_t)vceqq_f64(v13, v15);
      float64_t v24 = v15.f64[1];
      switch(v10)
      {
        case 1:
          if (v18 != 1) {
            return 0;
          }
          uint64_t v82 = *(void *)&v15.f64[1];
          uint64_t v26 = *(void *)&v12.f64[0];
          uint64_t v27 = *(void *)&v14.f64[0];
          if (*(void *)(*(void *)&v12.f64[0] + 16) != *(void *)(*(void *)&v14.f64[0] + 16)) {
            return 0;
          }
          uint64_t v84 = *(void *)&v15.f64[0];
          uint64_t v79 = *(void *)&v14.f64[1];
          uint64_t v80 = *(void *)&v16;
          uint64_t v81 = *(void *)&v17;
          uint64_t v28 = *(void *)&v13.f64[0];
          uint64_t v29 = OUTLINED_FUNCTION_15();
          sub_2292E7B24(v29, v30, v31, v32, v33, v34, v35);
          sub_2292E7B78();
          uint64_t v36 = sub_2293090D0();
          uint64_t v87 = v36;
          uint64_t v37 = *(void *)(v26 + 16);
          if (v37)
          {
            uint64_t v77 = v28;
            uint64_t v38 = (long long *)(v26 + 32);
            do
            {
              long long v39 = *v38;
              long long v40 = v38[2];
              v89[1] = v38[1];
              v89[2] = v40;
              v89[0] = v39;
              sub_2292E7BC4((uint64_t)v89);
              sub_2292FF65C((uint64_t)v86, (uint64_t)v89);
              swift_bridgeObjectRelease();
              v38 += 3;
              --v37;
            }
            while (v37);
            sub_2292E7BF0(v26, v20, v77, v21, v8, v9, 1);
            uint64_t v78 = v87;
          }
          else
          {
            uint64_t v78 = v36;
            uint64_t v45 = OUTLINED_FUNCTION_15();
            sub_2292E7BF0(v45, v46, v47, v48, v49, v50, v51);
          }
          uint64_t v2 = v76;
          OUTLINED_FUNCTION_43();
          sub_2292E7B24(v52, v53, v54, v55, v56, v57, v58);
          uint64_t v59 = sub_2293090D0();
          uint64_t v87 = v59;
          uint64_t v60 = *(void *)(v27 + 16);
          if (v60)
          {
            uint64_t v61 = (long long *)(v27 + 32);
            do
            {
              long long v62 = *v61;
              long long v63 = v61[2];
              v88[1] = v61[1];
              v88[2] = v63;
              v88[0] = v62;
              sub_2292E7BC4((uint64_t)v88);
              sub_2292FF65C((uint64_t)v86, (uint64_t)v88);
              swift_bridgeObjectRelease();
              v61 += 3;
              --v60;
            }
            while (v60);
            sub_2292E7BF0(v27, v79, v84, v82, v80, v81, 1);
            uint64_t v64 = v87;
          }
          else
          {
            uint64_t v64 = v59;
            OUTLINED_FUNCTION_43();
            sub_2292E7BF0(v65, v66, v67, v68, v69, v70, v71);
          }
          uint64_t v5 = v74;
          uint64_t v4 = v75;
          sub_2292FAB60(v78, v64);
          char v73 = v72;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v73 & 1) == 0) {
            return 0;
          }
          goto LABEL_45;
        case 2:
          if (v18 != 2 || v19) {
            return 0;
          }
          goto LABEL_45;
        case 3:
          if (v18 != 3) {
            return 0;
          }
          uint64_t result = 0;
          if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32(v22, v23)), 0xFuLL))) & 1) == 0
            || *(double *)&v8 != v16
            || *(double *)&v9 != v17)
          {
            return result;
          }
          goto LABEL_45;
        case 4:
          if (v18 != 4 || v19 != 0) {
            return 0;
          }
          goto LABEL_45;
        case 5:
          if (v18 != 5) {
            return 0;
          }
          int32x4_t v42 = (int32x4_t)vceqq_s64((int64x2_t)v12, (int64x2_t)v14);
          *(int32x2_t *)v42.i8 = vmovn_s64((int64x2_t)v42);
          v42.i32[0] = vmovn_s32(v42).u32[0];
          if ((v42.i16[0] & v42.i16[1] & 1) == 0)
          {
            float64x2_t v83 = v13;
            float64x2_t v85 = v15;
            char v43 = sub_229309350();
            float64x2_t v13 = v83;
            float64x2_t v15 = v85;
            if ((v43 & 1) == 0) {
              return 0;
            }
          }
          if (v21)
          {
            if (v24 == 0.0) {
              return 0;
            }
            int64x2_t v44 = vceqq_s64((int64x2_t)v13, (int64x2_t)v15);
            *(int16x4_t *)v44.i8 = vmovn_s32(vmovn_hight_s64(*(int32x2_t *)v44.i8, v44));
            if ((v44.i16[2] & v44.i16[3] & 1) == 0 && (sub_229309350() & 1) == 0) {
              return 0;
            }
          }
          else if (v24 != 0.0)
          {
            return 0;
          }
LABEL_45:
          if (v3 == v2) {
            return 1;
          }
          break;
        default:
          uint64_t result = 0;
          if (v18
            || (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32(v22, v23)), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) != 0)
          {
            return result;
          }
          goto LABEL_45;
      }
    }
  }
  return 1;
}

void RREntity.convertData<A>(to:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t *)(v0 + *(int *)(type metadata accessor for RREntity() + 36));
  unint64_t v7 = v6[1];
  if (v7 >> 60 == 15)
  {
    __swift_storeEnumTagSinglePayload(v5, 1, 1, v3);
  }
  else
  {
    uint64_t v8 = *v6;
    sub_229308CA0();
    OUTLINED_FUNCTION_18();
    sub_2292E2368(v8, v7);
    sub_229308C90();
    sub_229308C80();
    if (v1)
    {
      swift_release();
      sub_2292E3160(v8, v7);
    }
    else
    {
      sub_2292E3160(v8, v7);
      swift_release();
      __swift_storeEnumTagSinglePayload(v5, 0, 1, v3);
    }
  }
  OUTLINED_FUNCTION_1();
}

uint64_t RREntity.convertData<A>(to:)()
{
  if (*(void *)(v0 + *(int *)(type metadata accessor for RREntity() + 36) + 8) >> 60 == 15) {
    return 0;
  }
  uint64_t v2 = OUTLINED_FUNCTION_42();
  sub_2292E2368(v2, v3);
  uint64_t v1 = static RRCoder.decode<A>(_:from:)();
  uint64_t v4 = OUTLINED_FUNCTION_42();
  sub_2292E3160(v4, v5);
  return v1;
}

BOOL sub_2292E5454(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2292E5464()
{
  return sub_2293093F0();
}

uint64_t sub_2292E548C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
    if (v6 || (sub_229309350() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7469746E456F7375 && a2 == 0xE900000000000079;
      if (v7 || (sub_229309350() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
        if (v8 || (sub_229309350() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6570795461746164 && a2 == 0xE800000000000000;
          if (v9 || (sub_229309350() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 1635017060 && a2 == 0xE400000000000000;
            if (v10 || (sub_229309350() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x70756F7267 && a2 == 0xE500000000000000;
              if (v11 || (sub_229309350() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
                if (v12 || (sub_229309350() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0xD000000000000013 && a2 == 0x8000000229309B20)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  char v13 = sub_229309350();
                  swift_bridgeObjectRelease();
                  if (v13) {
                    return 8;
                  }
                  else {
                    return 9;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2292E581C()
{
  return 9;
}

uint64_t sub_2292E5824()
{
  return sub_229309420();
}

uint64_t sub_2292E586C()
{
  return 0;
}

unint64_t sub_2292E5878(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C646E7542707061;
      break;
    case 2:
      unint64_t result = 0x7469746E456F7375;
      break;
    case 3:
      unint64_t result = 0x6C61566465707974;
      break;
    case 4:
      unint64_t result = 0x6570795461746164;
      break;
    case 5:
      unint64_t result = 1635017060;
      break;
    case 6:
      unint64_t result = 0x70756F7267;
      break;
    case 7:
      unint64_t result = 0x617461646174656DLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_2292E5994(char *a1, char *a2)
{
  return sub_2292E5454(*a1, *a2);
}

uint64_t sub_2292E59A0()
{
  return sub_2292E5824();
}

uint64_t sub_2292E59A8()
{
  return sub_2292E5464();
}

uint64_t sub_2292E59B0()
{
  return sub_229309420();
}

unint64_t sub_2292E59F4()
{
  return sub_2292E5878(*v0);
}

uint64_t sub_2292E59FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292E548C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292E5A24()
{
  return sub_2292E586C();
}

uint64_t sub_2292E5A44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292E581C();
  *a1 = result;
  return result;
}

uint64_t sub_2292E5A6C(uint64_t a1)
{
  unint64_t v2 = sub_2292E65B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E5AA8(uint64_t a1)
{
  unint64_t v2 = sub_2292E65B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RREntity.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FB58);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292E65B0();
  sub_229309470();
  OUTLINED_FUNCTION_35();
  if (!v1)
  {
    OUTLINED_FUNCTION_35();
    sub_229308F30();
    sub_2292E6778(&qword_26830FB68, MEMORY[0x263F737A0]);
    OUTLINED_FUNCTION_17();
    type metadata accessor for RREntity();
    sub_229308F90();
    sub_2292E6778(&qword_26830FB70, MEMORY[0x263F80508]);
    sub_2293092E0();
    OUTLINED_FUNCTION_25(4);
    sub_2292E65FC();
    OUTLINED_FUNCTION_24();
    sub_2292E6648();
    OUTLINED_FUNCTION_24();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FB88);
    sub_2292E6858(&qword_26830FB90, (void (*)(void))sub_2292E66DC);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_25(8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void RREntity.init(from:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v35 = v0;
  unint64_t v3 = v2;
  v33[0] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v6 = OUTLINED_FUNCTION_5(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FBA0);
  OUTLINED_FUNCTION_0();
  v33[1] = v8;
  v33[2] = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11();
  type metadata accessor for RREntity();
  OUTLINED_FUNCTION_27();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  BOOL v12 = (uint64_t *)((char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v13 = (char *)v12 + *(int *)(v10 + 40);
  *(void *)char v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v36 = v13;
  *((void *)v13 + 2) = 0;
  float64x2_t v14 = (int *)v10;
  float64x2_t v15 = v12;
  double v16 = (char *)v12 + *(int *)(v10 + 48);
  *(void *)double v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v34 = v16;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2292E65B0();
  uint64_t v17 = v35;
  sub_229309450();
  if (v17)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v35 = v1;
    LOBYTE(v37) = 0;
    uint64_t v18 = (uint64_t)v15;
    *float64x2_t v15 = sub_229309260();
    v15[1] = v19;
    OUTLINED_FUNCTION_39(1);
    v15[2] = sub_229309260();
    v15[3] = v20;
    sub_229308F30();
    sub_2292E6778(&qword_26830FBA8, MEMORY[0x263F737A0]);
    OUTLINED_FUNCTION_33();
    sub_2293092A0();
    v15[4] = v37;
    sub_229308F90();
    LOBYTE(v37) = 3;
    sub_2292E6778(&qword_26830FBB0, MEMORY[0x263F80508]);
    uint64_t v21 = v35;
    OUTLINED_FUNCTION_33();
    sub_229309250();
    sub_2292E31CC(v21, v18 + v14[7]);
    OUTLINED_FUNCTION_39(4);
    uint64_t v22 = sub_229309230();
    int32x4_t v23 = (uint64_t *)(v18 + v14[8]);
    *int32x4_t v23 = v22;
    v23[1] = v24;
    sub_2292E67C0();
    sub_229309250();
    *(_OWORD *)(v18 + v14[9]) = v37;
    sub_2292E680C();
    sub_229309250();
    uint64_t v25 = v38;
    uint64_t v26 = v36;
    *(_OWORD *)uint64_t v36 = v37;
    *((void *)v26 + 2) = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FB88);
    sub_2292E6858(&qword_26830FBC8, (void (*)(void))sub_2292E68C4);
    sub_2293092A0();
    *(void *)(v18 + v14[11]) = v37;
    LOBYTE(v37) = 8;
    uint64_t v27 = sub_229309230();
    uint64_t v29 = v28;
    uint64_t v30 = OUTLINED_FUNCTION_13();
    v31(v30);
    uint64_t v32 = (uint64_t *)v34;
    swift_bridgeObjectRelease();
    uint64_t *v32 = v27;
    v32[1] = v29;
    sub_2292E64AC(v18, v33[0]);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
    sub_2292E6510(v18);
  }
  OUTLINED_FUNCTION_1();
}

void sub_2292E6378()
{
}

uint64_t sub_2292E6390(void *a1)
{
  return RREntity.encode(to:)(a1);
}

uint64_t static RREntityError.== infix(_:_:)()
{
  return 1;
}

uint64_t RREntityError.hash(into:)()
{
  return sub_2293093F0();
}

uint64_t RREntityError.hashValue.getter()
{
  return sub_229309420();
}

uint64_t sub_2292E6424()
{
  return 1;
}

uint64_t sub_2292E642C()
{
  return RREntityError.hashValue.getter();
}

uint64_t sub_2292E6444()
{
  return RREntityError.hash(into:)();
}

uint64_t sub_2292E645C()
{
  return sub_229309420();
}

uint64_t sub_2292E64AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292E6510(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2292E65B0()
{
  unint64_t result = qword_26830FB60;
  if (!qword_26830FB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FB60);
  }
  return result;
}

unint64_t sub_2292E65FC()
{
  unint64_t result = qword_26830FB78;
  if (!qword_26830FB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FB78);
  }
  return result;
}

unint64_t sub_2292E6648()
{
  unint64_t result = qword_26830FB80;
  if (!qword_26830FB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FB80);
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

unint64_t sub_2292E66DC()
{
  unint64_t result = qword_26830FB98;
  if (!qword_26830FB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FB98);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2292E6778(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2292E67C0()
{
  unint64_t result = qword_26830FBB8;
  if (!qword_26830FBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBB8);
  }
  return result;
}

unint64_t sub_2292E680C()
{
  unint64_t result = qword_26830FBC0;
  if (!qword_26830FBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBC0);
  }
  return result;
}

uint64_t sub_2292E6858(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FB88);
    a2();
    OUTLINED_FUNCTION_42();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2292E68C4()
{
  unint64_t result = qword_26830FBD0;
  if (!qword_26830FBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBD0);
  }
  return result;
}

unint64_t sub_2292E6914()
{
  unint64_t result = qword_26830FBD8;
  if (!qword_26830FBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBD8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RREntity(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    a1[4] = a2[4];
    uint64_t v12 = sub_229308F90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v15 = a3[8];
    uint64_t v16 = a3[9];
    uint64_t v17 = (uint64_t *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = (char *)v4 + v16;
    uint64_t v21 = (_OWORD *)((char *)a2 + v16);
    unint64_t v22 = *(uint64_t *)((char *)a2 + v16 + 8);
    swift_bridgeObjectRetain();
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v20 = *v21;
    }
    else
    {
      uint64_t v23 = *(void *)v21;
      sub_2292E2368(v23, v22);
      *(void *)uint64_t v20 = v23;
      *((void *)v20 + 1) = v22;
    }
    uint64_t v24 = a3[10];
    uint64_t v25 = a3[11];
    uint64_t v26 = (uint64_t *)((char *)v4 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[2];
    v26[1] = v27[1];
    v26[2] = v28;
    *uint64_t v26 = *v27;
    *(uint64_t *)((char *)v4 + v25) = *(uint64_t *)((char *)a2 + v25);
    uint64_t v29 = a3[12];
    uint64_t v30 = (uint64_t *)((char *)v4 + v29);
    uint64_t v31 = (uint64_t *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for RREntity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_229308F90();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 36));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_2292E3174(*v6, v7);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RREntity(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_229308F90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (void *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (char *)a1 + v14;
  uint64_t v19 = (_OWORD *)((char *)a2 + v14);
  unint64_t v20 = *(void *)((char *)a2 + v14 + 8);
  swift_bridgeObjectRetain();
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v18 = *v19;
  }
  else
  {
    uint64_t v21 = *(void *)v19;
    sub_2292E2368(v21, v20);
    *(void *)uint64_t v18 = v21;
    *((void *)v18 + 1) = v20;
  }
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)((char *)a1 + v22);
  uint64_t v25 = (void *)((char *)a2 + v22);
  uint64_t v26 = v25[2];
  v24[1] = v25[1];
  v24[2] = v26;
  *uint64_t v24 = *v25;
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  uint64_t v27 = a3[12];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RREntity(void *a1, void *a2, int *a3)
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
  swift_retain();
  swift_release();
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_229308F90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  unint64_t v20 = *(void *)((char *)a2 + v17 + 8);
  if (*(void *)((char *)a1 + v17 + 8) >> 60 != 15)
  {
    if (v20 >> 60 != 15)
    {
      uint64_t v22 = *v19;
      sub_2292E2368(v22, v20);
      uint64_t v23 = *v18;
      unint64_t v24 = v18[1];
      *uint64_t v18 = v22;
      v18[1] = v20;
      sub_2292E3174(v23, v24);
      goto LABEL_14;
    }
    sub_2292E7114((uint64_t)v18);
    goto LABEL_12;
  }
  if (v20 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    goto LABEL_14;
  }
  uint64_t v21 = *v19;
  sub_2292E2368(v21, v20);
  *uint64_t v18 = v21;
  v18[1] = v20;
LABEL_14:
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *(void *)((char *)a2 + v25);
  v26[1] = *(void *)((char *)a2 + v25 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26[2] = *((void *)v27 + 2);
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[12];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (void *)((char *)a2 + v28);
  *uint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2292E7114(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for RREntity(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_229308F90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[10];
  uint64_t v14 = a3[11];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = (long long *)(a2 + v13);
  long long v17 = *v16;
  *(void *)(v15 + 16) = *((void *)v16 + 2);
  *(_OWORD *)uint64_t v15 = v17;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  return a1;
}

void *assignWithTake for RREntity(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_229308F90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = a3[8];
  long long v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *long long v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  unint64_t v24 = *(void *)((char *)a1 + v21 + 8);
  if (v24 >> 60 != 15)
  {
    unint64_t v25 = v23[1];
    if (v25 >> 60 != 15)
    {
      uint64_t v26 = *v22;
      *uint64_t v22 = *v23;
      v22[1] = v25;
      sub_2292E3174(v26, v24);
      goto LABEL_12;
    }
    sub_2292E7114((uint64_t)v22);
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
LABEL_12:
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = *(void *)((char *)a2 + v27 + 8);
  *uint64_t v28 = *(void *)((char *)a2 + v27);
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v28[2] = *((void *)v29 + 2);
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  void *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RREntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2292E7508);
}

uint64_t sub_2292E7508(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for RREntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2292E75A8);
}

uint64_t sub_2292E75A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_2292E762C()
{
  sub_2292E7700();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2292E7700()
{
  if (!qword_26AEC9318)
  {
    sub_229308F90();
    unint64_t v0 = sub_229309100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AEC9318);
    }
  }
}

uint64_t getEnumTagSinglePayload for RREntityError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for RREntityError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2292E784CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292E7874()
{
  return 0;
}

ValueMetadata *type metadata accessor for RREntityError()
{
  return &type metadata for RREntityError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RREntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RREntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292E79ECLL);
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

uint64_t sub_2292E7A14(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2292E7A1C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RREntity.CodingKeys()
{
  return &type metadata for RREntity.CodingKeys;
}

unint64_t sub_2292E7A38()
{
  unint64_t result = qword_26830FBE0;
  if (!qword_26830FBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBE0);
  }
  return result;
}

unint64_t sub_2292E7A88()
{
  unint64_t result = qword_26830FBE8;
  if (!qword_26830FBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBE8);
  }
  return result;
}

unint64_t sub_2292E7AD8()
{
  unint64_t result = qword_26830FBF0;
  if (!qword_26830FBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBF0);
  }
  return result;
}

uint64_t sub_2292E7B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 != 1)
  {
    if (a7 != 5) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_2292E7B78()
{
  unint64_t result = qword_26830FBF8;
  if (!qword_26830FBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FBF8);
  }
  return result;
}

uint64_t sub_2292E7BC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2292E7BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 != 1)
  {
    if (a7 != 5) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_7@<Q0>(__n128 *a1@<X8>, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *unsigned int v6 = v7;
  v6[1] = a5;
  uint64_t v12 = (void *)(v10 + *(int *)(v11 + 36));
  *uint64_t v12 = a6;
  v12[1] = v8;
  __n128 result = a2;
  *a1 = a2;
  a1[1].n128_u64[0] = v9;
  return result;
}

void OUTLINED_FUNCTION_12()
{
  *uint64_t v5 = v4;
  v5[1] = v3;
  v5[2] = v2;
  v5[3] = v1;
  v5[4] = v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_229309330();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v2, 1, 1, a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_2293092E0();
}

uint64_t OUTLINED_FUNCTION_25@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2293092D0();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return type metadata accessor for RREntity();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_2293092F0();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return type metadata accessor for RREntity();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 112) = a1;
  return v1 - 112;
}

__n128 OUTLINED_FUNCTION_40(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  __n128 result = *(__n128 *)(v2 - 144);
  *(__n128 *)(v2 - 104) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_229308F90();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return v0;
}

uint64_t RRResult.description.getter()
{
  uint64_t v2 = type metadata accessor for RRCandidate(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RRResult(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_16_0();
  sub_2292EA828(v0, (uint64_t)v1, (void (*)(void))type metadata accessor for RRResult);
  uint64_t v7 = 0x686374616D206F4ELL;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = *v1;
      OUTLINED_FUNCTION_13_0();
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_0();
      uint64_t v11 = v10 | 0xC;
      goto LABEL_5;
    case 2u:
      uint64_t v9 = *v1;
      OUTLINED_FUNCTION_13_0();
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_0();
LABEL_5:
      OUTLINED_FUNCTION_20_0(v11);
      MEMORY[0x22A6B55A0](v9, v2);
      sub_229309020();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3u:
      uint64_t v12 = *v1;
      OUTLINED_FUNCTION_13_0();
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_20_0(v13 + 10);
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC00);
      MEMORY[0x22A6B55A0](v12, v14);
      sub_229309020();
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
      uint64_t v7 = v17;
      break;
    case 4u:
      return v7;
    default:
      sub_2292EA64C((uint64_t)v1, (uint64_t)v5, (void (*)(void))type metadata accessor for RRCandidate);
      uint64_t v17 = 0;
      unint64_t v18 = 0xE000000000000000;
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_20_0(v8 + 2);
      v16[0] = 0;
      v16[1] = 0xE000000000000000;
      RREntity.description.getter();
      sub_229309020();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_0();
      sub_2293090C0();
      sub_229309020();
      swift_bridgeObjectRelease();
      uint64_t v7 = v17;
      sub_2292EA8D4((uint64_t)v5, (void (*)(void))type metadata accessor for RRCandidate);
      break;
  }
  return v7;
}

uint64_t type metadata accessor for RRCandidate(uint64_t a1)
{
  return sub_2292E83B4(a1, (uint64_t *)&unk_26AEC9150);
}

uint64_t type metadata accessor for RRResult(uint64_t a1)
{
  return sub_2292E83B4(a1, (uint64_t *)&unk_26AEC8D48);
}

uint64_t sub_2292E83B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2292E83E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74614D646E756F66 && a2 == 0xEA00000000006863;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000229309BF0 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000229309C10 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000229309C30 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x686374614D6F6ELL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_2292E85F4()
{
  return 5;
}

unint64_t sub_2292E85FC(char a1)
{
  unint64_t result = 0x74614D646E756F66;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0x686374614D6F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292E86C0()
{
  return sub_2293093F0();
}

uint64_t sub_2292E86E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74616469646E6163 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_229309350();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2292E877C()
{
  return 0x74616469646E6163;
}

uint64_t sub_2292E8798()
{
  return 0x74616469646E6163;
}

uint64_t sub_2292E87B4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_229309350();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2292E8848()
{
  return sub_229309420();
}

uint64_t sub_2292E888C()
{
  return 1;
}

uint64_t sub_2292E88AC()
{
  return 0;
}

unint64_t sub_2292E88B8()
{
  return sub_2292E85FC(*v0);
}

uint64_t sub_2292E88C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292E83E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292E88E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292E85F4();
  *a1 = result;
  return result;
}

uint64_t sub_2292E8910(uint64_t a1)
{
  unint64_t v2 = sub_2292EA3E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E894C(uint64_t a1)
{
  unint64_t v2 = sub_2292EA3E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292E898C()
{
  return sub_2292E8848();
}

uint64_t sub_2292E89B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292E86E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2292E89DC(uint64_t a1)
{
  unint64_t v2 = sub_2292EA600();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E8A18(uint64_t a1)
{
  unint64_t v2 = sub_2292EA600();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292E8A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292E87B4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2292E8A84(uint64_t a1)
{
  unint64_t v2 = sub_2292EA568();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E8AC0(uint64_t a1)
{
  unint64_t v2 = sub_2292EA568();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292E8AFC(uint64_t a1)
{
  unint64_t v2 = sub_2292EA5B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E8B38(uint64_t a1)
{
  unint64_t v2 = sub_2292EA5B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292E8B74(uint64_t a1)
{
  unint64_t v2 = sub_2292EA47C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E8BB0(uint64_t a1)
{
  unint64_t v2 = sub_2292EA47C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292E8BF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292E888C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2292E8C1C()
{
  return sub_2292E586C();
}

uint64_t sub_2292E8C38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292E6424();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2292E8C64(uint64_t a1)
{
  unint64_t v2 = sub_2292EA430();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E8CA0(uint64_t a1)
{
  unint64_t v2 = sub_2292EA430();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRResult.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E88);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11_0(v5, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8EA8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E98);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8EA0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E90);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  type metadata accessor for RRCandidate(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E80);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292EA3E4();
  sub_229309470();
  sub_2292EA828(v25, (uint64_t)v1, (void (*)(void))type metadata accessor for RRResult);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v17 = *v1;
      LOBYTE(v26) = 1;
      sub_2292EA5B4();
      OUTLINED_FUNCTION_6_0((uint64_t)&type metadata for RRResult.NeedsDisambiguationCodingKeys, (uint64_t)&v26);
      uint64_t v26 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC00);
      sub_2292EA74C(&qword_26830FC20, &qword_26830FC28);
      OUTLINED_FUNCTION_10_0();
      goto LABEL_6;
    case 2u:
      uint64_t v18 = *v1;
      LOBYTE(v26) = 2;
      sub_2292EA568();
      OUTLINED_FUNCTION_6_0((uint64_t)&type metadata for RRResult.FoundMatchPluralCodingKeys, (uint64_t)&v26);
      uint64_t v26 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC00);
      sub_2292EA74C(&qword_26830FC20, &qword_26830FC28);
      OUTLINED_FUNCTION_10_0();
      goto LABEL_6;
    case 3u:
      uint64_t v19 = *v1;
      LOBYTE(v26) = 3;
      sub_2292EA47C();
      OUTLINED_FUNCTION_6_0((uint64_t)&type metadata for RRResult.NeedsDisambiguationPluralCodingKeys, (uint64_t)&v26);
      uint64_t v26 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC10);
      sub_2292EA4C8();
      OUTLINED_FUNCTION_10_0();
LABEL_6:
      OUTLINED_FUNCTION_4_0();
      v20();
      OUTLINED_FUNCTION_4_0();
      v21();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4u:
      LOBYTE(v26) = 4;
      sub_2292EA430();
      OUTLINED_FUNCTION_23_0((uint64_t)&type metadata for RRResult.NoMatchCodingKeys, (uint64_t)&v26);
      OUTLINED_FUNCTION_4_0();
      v22();
      OUTLINED_FUNCTION_4_0();
      uint64_t result = v23();
      break;
    default:
      sub_2292EA64C((uint64_t)v1, v2, (void (*)(void))type metadata accessor for RRCandidate);
      LOBYTE(v26) = 0;
      sub_2292EA600();
      OUTLINED_FUNCTION_23_0((uint64_t)&type metadata for RRResult.FoundMatchCodingKeys, (uint64_t)&v26);
      sub_2292EA7E0(&qword_26830FC28, (void (*)(uint64_t))type metadata accessor for RRCandidate);
      sub_229309330();
      uint64_t v13 = OUTLINED_FUNCTION_2_0();
      v14(v13);
      sub_2292EA8D4(v2, (void (*)(void))type metadata accessor for RRCandidate);
      OUTLINED_FUNCTION_4_0();
      uint64_t result = v15();
      break;
  }
  return result;
}

uint64_t RRResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC48);
  OUTLINED_FUNCTION_0_0();
  uint64_t v82 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_0();
  uint64_t v88 = v6;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC50);
  OUTLINED_FUNCTION_0_0();
  uint64_t v89 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_11_0(v9, v75[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC58);
  OUTLINED_FUNCTION_0_0();
  uint64_t v83 = v11;
  uint64_t v84 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_0();
  uint64_t v94 = v12;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC60);
  OUTLINED_FUNCTION_0_0();
  uint64_t v77 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1_0();
  uint64_t v93 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC68);
  OUTLINED_FUNCTION_0_0();
  uint64_t v78 = v17;
  uint64_t v79 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_0();
  uint64_t v87 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC70);
  OUTLINED_FUNCTION_0_0();
  uint64_t v91 = v20;
  uint64_t v92 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v90 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)v75 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)v75 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)v75 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v75 - v34;
  uint64_t v36 = a1[3];
  uint64_t v95 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v36);
  sub_2292EA3E4();
  uint64_t v37 = (uint64_t)v96;
  sub_229309450();
  if (v37) {
    goto LABEL_7;
  }
  uint64_t v76 = v33;
  v75[2] = (uint64_t)v30;
  v75[3] = (uint64_t)v24;
  v75[4] = (uint64_t)v27;
  v96 = v35;
  uint64_t v38 = v92;
  uint64_t v39 = sub_2293092B0();
  uint64_t v40 = *(void *)(v39 + 16);
  if (!v40
    || (v75[1] = 0,
        uint64_t v41 = *(unsigned __int8 *)(v39 + 32),
        sub_2292ECEF4(1, v40, v39, v39 + 32, 0, (2 * v40) | 1),
        uint64_t v43 = v42,
        unint64_t v45 = v44,
        swift_bridgeObjectRelease(),
        v43 != v45 >> 1))
  {
    uint64_t v49 = v90;
    uint64_t v50 = sub_2293091B0();
    swift_allocError();
    uint64_t v52 = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC78);
    *uint64_t v52 = v49;
    sub_229309220();
    sub_229309190();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v50 - 8) + 104))(v52, *MEMORY[0x263F8DCB0], v50);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v2, v38);
LABEL_7:
    uint64_t v53 = (uint64_t)v95;
    return __swift_destroy_boxed_opaque_existential_0Tm(v53);
  }
  uint64_t v46 = v41;
  uint64_t v47 = v89;
  switch(v46)
  {
    case 1:
      LOBYTE(v97) = 1;
      sub_2292EA5B4();
      OUTLINED_FUNCTION_5_0();
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC00);
      sub_2292EA74C(&qword_26830FC88, &qword_26830FC90);
      OUTLINED_FUNCTION_9_0();
      uint64_t v71 = OUTLINED_FUNCTION_2_0();
      v72(v71);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_4_0();
      v73();
      OUTLINED_FUNCTION_8_0(v97);
      goto LABEL_13;
    case 2:
      LOBYTE(v97) = 2;
      sub_2292EA568();
      OUTLINED_FUNCTION_5_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC00);
      sub_2292EA74C(&qword_26830FC88, &qword_26830FC90);
      OUTLINED_FUNCTION_9_0();
      uint64_t v47 = v91;
      uint64_t v58 = OUTLINED_FUNCTION_2_0();
      v59(v58);
      swift_unknownObjectRelease();
      uint64_t v60 = OUTLINED_FUNCTION_7_0();
      v61(v60);
      OUTLINED_FUNCTION_8_0(v97);
      goto LABEL_13;
    case 3:
      LOBYTE(v97) = 3;
      sub_2292EA47C();
      OUTLINED_FUNCTION_5_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC10);
      sub_2292EA6AC();
      sub_2293092A0();
      uint64_t v62 = OUTLINED_FUNCTION_18_0();
      v63(v62);
      swift_unknownObjectRelease();
      uint64_t v64 = OUTLINED_FUNCTION_14_0();
      v65(v64);
      OUTLINED_FUNCTION_8_0(v97);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      uint64_t v70 = v47;
      goto LABEL_14;
    case 4:
      LOBYTE(v97) = 4;
      sub_2292EA430();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_4_0();
      v55();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_4_0();
      v56();
      uint64_t v57 = (uint64_t)v96;
      swift_storeEnumTagMultiPayload();
      goto LABEL_15;
    default:
      LOBYTE(v97) = 0;
      sub_2292EA600();
      OUTLINED_FUNCTION_5_0();
      type metadata accessor for RRCandidate(0);
      sub_2292EA7E0(&qword_26830FC90, (void (*)(uint64_t))type metadata accessor for RRCandidate);
      uint64_t v48 = (uint64_t)v76;
      OUTLINED_FUNCTION_9_0();
      uint64_t v66 = OUTLINED_FUNCTION_2_0();
      v67(v66);
      swift_unknownObjectRelease();
      uint64_t v68 = OUTLINED_FUNCTION_7_0();
      v69(v68);
      swift_storeEnumTagMultiPayload();
      uint64_t v70 = v48;
LABEL_14:
      uint64_t v57 = (uint64_t)v96;
      sub_2292EA64C(v70, (uint64_t)v96, (void (*)(void))type metadata accessor for RRResult);
LABEL_15:
      uint64_t v74 = (uint64_t)v95;
      sub_2292EA64C(v57, v86, (void (*)(void))type metadata accessor for RRResult);
      uint64_t v53 = v74;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(v53);
}

uint64_t sub_2292E9BA8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RRResult.init(from:)(a1, a2);
}

uint64_t sub_2292E9BC0(void *a1)
{
  return RRResult.encode(to:)(a1);
}

uint64_t RRCandidate.entity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2292EA828(v1, a1, (void (*)(void))type metadata accessor for RREntity);
}

double RRCandidate.score.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for RRCandidate(0) + 20));
}

uint64_t RRCandidate.init(entity:score:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_2292EA64C(a1, a2, (void (*)(void))type metadata accessor for RREntity);
  uint64_t result = type metadata accessor for RRCandidate(0);
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  return result;
}

uint64_t RRCandidate.description.getter()
{
  return 0;
}

BOOL sub_2292E9D10(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2292E9D20()
{
  return sub_2293093F0();
}

uint64_t sub_2292E9D48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2292E9E28()
{
  return 2;
}

uint64_t sub_2292E9E30()
{
  return sub_229309420();
}

uint64_t sub_2292E9E78(char a1)
{
  if (a1) {
    return 0x65726F6373;
  }
  else {
    return 0x797469746E65;
  }
}

BOOL sub_2292E9EA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2292E9D10(*a1, *a2);
}

uint64_t sub_2292E9EB4()
{
  return sub_2292E9E30();
}

uint64_t sub_2292E9EBC()
{
  return sub_2292E9D20();
}

uint64_t sub_2292E9EC4()
{
  return sub_2292E9E78(*v0);
}

uint64_t sub_2292E9ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292E9D48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292E9EF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292E9E28();
  *a1 = result;
  return result;
}

uint64_t sub_2292E9F1C(uint64_t a1)
{
  unint64_t v2 = sub_2292EA888();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292E9F58(uint64_t a1)
{
  unint64_t v2 = sub_2292EA888();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRCandidate.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC98);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292EA888();
  sub_229309470();
  type metadata accessor for RREntity();
  sub_2292EA7E0(&qword_26830FCA8, (void (*)(uint64_t))type metadata accessor for RREntity);
  sub_229309330();
  if (!v1)
  {
    type metadata accessor for RRCandidate(0);
    sub_229309310();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t RRCandidate.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for RREntity();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_0();
  uint64_t v16 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FCB0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = type metadata accessor for RRCandidate(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292EA888();
  sub_229309450();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  sub_2292EA7E0(&qword_26830FCB8, (void (*)(uint64_t))type metadata accessor for RREntity);
  sub_2293092A0();
  sub_2292EA64C(v16, v3, (void (*)(void))type metadata accessor for RREntity);
  sub_229309280();
  uint64_t v11 = v10;
  uint64_t v12 = OUTLINED_FUNCTION_22_0();
  v13(v12);
  *(void *)(v3 + *(int *)(v8 + 20)) = v11;
  sub_2292EA828(v3, a2, (void (*)(void))type metadata accessor for RRCandidate);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return sub_2292EA8D4(v3, (void (*)(void))type metadata accessor for RRCandidate);
}

uint64_t sub_2292EA3B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RRCandidate.init(from:)(a1, a2);
}

uint64_t sub_2292EA3C8(void *a1)
{
  return RRCandidate.encode(to:)(a1);
}

unint64_t sub_2292EA3E4()
{
  unint64_t result = qword_26AEC8E00;
  if (!qword_26AEC8E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E00);
  }
  return result;
}

unint64_t sub_2292EA430()
{
  unint64_t result = qword_26AEC8E18;
  if (!qword_26AEC8E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E18);
  }
  return result;
}

unint64_t sub_2292EA47C()
{
  unint64_t result = qword_26830FC08;
  if (!qword_26830FC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC08);
  }
  return result;
}

unint64_t sub_2292EA4C8()
{
  unint64_t result = qword_26830FC18;
  if (!qword_26830FC18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FC10);
    sub_2292EA74C(&qword_26830FC20, &qword_26830FC28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC18);
  }
  return result;
}

unint64_t sub_2292EA568()
{
  unint64_t result = qword_26830FC30;
  if (!qword_26830FC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC30);
  }
  return result;
}

unint64_t sub_2292EA5B4()
{
  unint64_t result = qword_26830FC38;
  if (!qword_26830FC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC38);
  }
  return result;
}

unint64_t sub_2292EA600()
{
  unint64_t result = qword_26830FC40;
  if (!qword_26830FC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC40);
  }
  return result;
}

uint64_t sub_2292EA64C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_2292EA6AC()
{
  unint64_t result = qword_26830FC80;
  if (!qword_26830FC80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FC10);
    sub_2292EA74C(&qword_26830FC88, &qword_26830FC90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FC80);
  }
  return result;
}

uint64_t sub_2292EA74C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FC00);
    sub_2292EA7E0(a2, (void (*)(uint64_t))type metadata accessor for RRCandidate);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2292EA7E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2292EA828(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_2292EA888()
{
  unint64_t result = qword_26830FCA0;
  if (!qword_26830FCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCA0);
  }
  return result;
}

uint64_t sub_2292EA8D4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  v3();
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for RRResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        uint64_t v8 = a2[3];
        a1[2] = a2[2];
        a1[3] = v8;
        a1[4] = a2[4];
        uint64_t v9 = (int *)type metadata accessor for RREntity();
        uint64_t v10 = v9[7];
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_229308F90();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
          memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
        uint64_t v16 = v9[8];
        uint64_t v17 = (uint64_t *)((char *)a1 + v16);
        uint64_t v18 = (uint64_t *)((char *)a2 + v16);
        uint64_t v19 = v18[1];
        *uint64_t v17 = *v18;
        v17[1] = v19;
        uint64_t v20 = v9[9];
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (_OWORD *)((char *)a2 + v20);
        unint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 8);
        swift_bridgeObjectRetain();
        if (v23 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v21 = *v22;
        }
        else
        {
          uint64_t v24 = *(void *)v22;
          sub_2292E2368(v24, v23);
          *(void *)uint64_t v21 = v24;
          *((void *)v21 + 1) = v23;
        }
        uint64_t v25 = v9[10];
        uint64_t v26 = (uint64_t *)((char *)a1 + v25);
        uint64_t v27 = (uint64_t *)((char *)a2 + v25);
        uint64_t v28 = v27[1];
        *uint64_t v26 = *v27;
        v26[1] = v28;
        v26[2] = v27[2];
        *(uint64_t *)((char *)a1 + v9[11]) = *(uint64_t *)((char *)a2 + v9[11]);
        uint64_t v29 = v9[12];
        uint64_t v30 = (uint64_t *)((char *)a1 + v29);
        uint64_t v31 = (uint64_t *)((char *)a2 + v29);
        uint64_t v32 = v31[1];
        *uint64_t v30 = *v31;
        v30[1] = v32;
        uint64_t v33 = type metadata accessor for RRCandidate(0);
        *(uint64_t *)((char *)a1 + *(int *)(v33 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v33 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_13;
      case 1u:
      case 2u:
      case 3u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_13:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for RRResult(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if ((result - 1) >= 3)
  {
    if (result) {
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = type metadata accessor for RREntity();
    uint64_t v4 = a1 + *(int *)(v3 + 28);
    uint64_t v5 = sub_229308F90();
    if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = (uint64_t *)(a1 + *(int *)(v3 + 36));
    unint64_t v7 = v6[1];
    if (v7 >> 60 != 15) {
      sub_2292E3174(*v6, v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RRResult(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = a2[3];
      a1[2] = a2[2];
      a1[3] = v7;
      a1[4] = a2[4];
      uint64_t v8 = (int *)type metadata accessor for RREntity();
      uint64_t v9 = v8[7];
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_229308F90();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      uint64_t v14 = v8[8];
      uint64_t v15 = (void *)((char *)a1 + v14);
      uint64_t v16 = (void *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      uint64_t v18 = v8[9];
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (_OWORD *)((char *)a2 + v18);
      unint64_t v21 = *(void *)((char *)a2 + v18 + 8);
      swift_bridgeObjectRetain();
      if (v21 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v19 = *v20;
      }
      else
      {
        uint64_t v22 = *(void *)v20;
        sub_2292E2368(v22, v21);
        *(void *)uint64_t v19 = v22;
        *((void *)v19 + 1) = v21;
      }
      uint64_t v23 = v8[10];
      uint64_t v24 = (void *)((char *)a1 + v23);
      uint64_t v25 = (void *)((char *)a2 + v23);
      uint64_t v26 = v25[1];
      *uint64_t v24 = *v25;
      v24[1] = v26;
      v24[2] = v25[2];
      *(void *)((char *)a1 + v8[11]) = *(void *)((char *)a2 + v8[11]);
      uint64_t v27 = v8[12];
      uint64_t v28 = (void *)((char *)a1 + v27);
      uint64_t v29 = (void *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      uint64_t v31 = type metadata accessor for RRCandidate(0);
      *(void *)((char *)a1 + *(int *)(v31 + 20)) = *(void *)((char *)a2 + *(int *)(v31 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 1u:
    case 2u:
    case 3u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for RRResult(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2292EA8D4((uint64_t)a1, (void (*)(void))type metadata accessor for RRResult);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        uint64_t v6 = (int *)type metadata accessor for RREntity();
        uint64_t v7 = v6[7];
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_229308F90();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
          memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
          __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
        }
        uint64_t v12 = v6[8];
        uint64_t v13 = (void *)((char *)a1 + v12);
        uint64_t v14 = (void *)((char *)a2 + v12);
        *uint64_t v13 = *v14;
        v13[1] = v14[1];
        uint64_t v15 = v6[9];
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (_OWORD *)((char *)a2 + v15);
        unint64_t v18 = *(void *)((char *)a2 + v15 + 8);
        swift_bridgeObjectRetain();
        if (v18 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v16 = *v17;
        }
        else
        {
          uint64_t v19 = *(void *)v17;
          sub_2292E2368(v19, v18);
          *(void *)uint64_t v16 = v19;
          *((void *)v16 + 1) = v18;
        }
        uint64_t v20 = v6[10];
        unint64_t v21 = (void *)((char *)a1 + v20);
        uint64_t v22 = (void *)((char *)a2 + v20);
        void *v21 = *v22;
        v21[1] = v22[1];
        v21[2] = v22[2];
        *(void *)((char *)a1 + v6[11]) = *(void *)((char *)a2 + v6[11]);
        uint64_t v23 = v6[12];
        uint64_t v24 = (void *)((char *)a1 + v23);
        uint64_t v25 = (void *)((char *)a2 + v23);
        *uint64_t v24 = *v25;
        v24[1] = v25[1];
        uint64_t v26 = type metadata accessor for RRCandidate(0);
        *(void *)((char *)a1 + *(int *)(v26 + 20)) = *(void *)((char *)a2 + *(int *)(v26 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 1u:
      case 2u:
      case 3u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_12:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *initializeWithTake for RRResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    uint64_t v7 = (int *)type metadata accessor for RREntity();
    uint64_t v8 = v7[7];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_229308F90();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
    *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
    uint64_t v13 = v7[10];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    *((void *)v14 + 2) = *((void *)v15 + 2);
    *(void *)((char *)a1 + v7[11]) = *(void *)((char *)a2 + v7[11]);
    *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
    uint64_t v16 = type metadata accessor for RRCandidate(0);
    *(void *)((char *)a1 + *(int *)(v16 + 20)) = *(void *)((char *)a2 + *(int *)(v16 + 20));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for RRResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2292EA8D4((uint64_t)a1, (void (*)(void))type metadata accessor for RRResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v7 = (int *)type metadata accessor for RREntity();
      uint64_t v8 = v7[7];
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_229308F90();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
        memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      }
      *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
      *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
      uint64_t v13 = v7[10];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      *((void *)v14 + 2) = *((void *)v15 + 2);
      *(void *)((char *)a1 + v7[11]) = *(void *)((char *)a2 + v7[11]);
      *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
      uint64_t v16 = type metadata accessor for RRCandidate(0);
      *(void *)((char *)a1 + *(int *)(v16 + 20)) = *(void *)((char *)a2 + *(int *)(v16 + 20));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2292EB694()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2292EB6A4()
{
  uint64_t result = type metadata accessor for RRCandidate(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RRCandidate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
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
    a1[4] = a2[4];
    uint64_t v9 = (int *)type metadata accessor for RREntity();
    uint64_t v10 = v9[7];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_229308F90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    uint64_t v16 = v9[8];
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    unint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = v9[9];
    unint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (_OWORD *)((char *)a2 + v20);
    unint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 8);
    swift_bridgeObjectRetain();
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)unint64_t v21 = *v22;
    }
    else
    {
      uint64_t v24 = *(void *)v22;
      sub_2292E2368(v24, v23);
      *(void *)unint64_t v21 = v24;
      *((void *)v21 + 1) = v23;
    }
    uint64_t v25 = v9[10];
    uint64_t v26 = (uint64_t *)((char *)v4 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    v26[2] = v27[2];
    *(uint64_t *)((char *)v4 + v9[11]) = *(uint64_t *)((char *)a2 + v9[11]);
    uint64_t v29 = v9[12];
    uint64_t v30 = (uint64_t *)((char *)v4 + v29);
    uint64_t v31 = (uint64_t *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for RRCandidate(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = type metadata accessor for RREntity();
  uint64_t v3 = a1 + *(int *)(v2 + 28);
  uint64_t v4 = sub_229308F90();
  if (!__swift_getEnumTagSinglePayload(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  swift_bridgeObjectRelease();
  int v5 = (uint64_t *)(a1 + *(int *)(v2 + 36));
  unint64_t v6 = v5[1];
  if (v6 >> 60 != 15) {
    sub_2292E3174(*v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RRCandidate(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = (int *)type metadata accessor for RREntity();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_229308F90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  uint64_t v14 = v8[8];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v8[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (_OWORD *)((char *)a2 + v18);
  unint64_t v21 = *(void *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *v20;
  }
  else
  {
    uint64_t v22 = *(void *)v20;
    sub_2292E2368(v22, v21);
    *(void *)uint64_t v19 = v22;
    *((void *)v19 + 1) = v21;
  }
  uint64_t v23 = v8[10];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  v24[2] = v25[2];
  *(void *)((char *)a1 + v8[11]) = *(void *)((char *)a2 + v8[11]);
  uint64_t v27 = v8[12];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RRCandidate(void *a1, void *a2, uint64_t a3)
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
  swift_retain();
  swift_release();
  uint64_t v6 = (int *)type metadata accessor for RREntity();
  uint64_t v7 = v6[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_229308F90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = v6[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v6[9];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  unint64_t v21 = *(void *)((char *)a2 + v18 + 8);
  if (*(void *)((char *)a1 + v18 + 8) >> 60 != 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v23 = *v20;
      sub_2292E2368(v23, v21);
      uint64_t v24 = *v19;
      unint64_t v25 = v19[1];
      *uint64_t v19 = v23;
      v19[1] = v21;
      sub_2292E3174(v24, v25);
      goto LABEL_14;
    }
    sub_2292E7114((uint64_t)v19);
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  uint64_t v22 = *v20;
  sub_2292E2368(v22, v21);
  *uint64_t v19 = v22;
  v19[1] = v21;
LABEL_14:
  uint64_t v26 = v6[10];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (char *)a2 + v26;
  *uint64_t v27 = *(void *)((char *)a2 + v26);
  v27[1] = *(void *)((char *)a2 + v26 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27[2] = *((void *)v28 + 2);
  *(void *)((char *)a1 + v6[11]) = *(void *)((char *)a2 + v6[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = v6[12];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for RRCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = (int *)type metadata accessor for RREntity();
  uint64_t v8 = v7[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_229308F90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + v7[8]) = *(_OWORD *)(a2 + v7[8]);
  *(_OWORD *)(a1 + v7[9]) = *(_OWORD *)(a2 + v7[9]);
  uint64_t v13 = v7[10];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  *(void *)(a1 + v7[11]) = *(void *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for RRCandidate(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_release();
  uint64_t v8 = (int *)type metadata accessor for RREntity();
  uint64_t v9 = v8[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_229308F90();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v17 = v8[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v8[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  unint64_t v25 = *(void *)((char *)a1 + v22 + 8);
  if (v25 >> 60 != 15)
  {
    unint64_t v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      uint64_t v27 = *v23;
      *uint64_t v23 = *v24;
      v23[1] = v26;
      sub_2292E3174(v27, v25);
      goto LABEL_12;
    }
    sub_2292E7114((uint64_t)v23);
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
LABEL_12:
  uint64_t v28 = v8[10];
  uint64_t v29 = (void *)((char *)a1 + v28);
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)((char *)a2 + v28 + 8);
  *uint64_t v29 = *(void *)((char *)a2 + v28);
  v29[1] = v31;
  swift_bridgeObjectRelease();
  v29[2] = *((void *)v30 + 2);
  *(void *)((char *)a1 + v8[11]) = *(void *)((char *)a2 + v8[11]);
  swift_bridgeObjectRelease();
  uint64_t v32 = v8[12];
  uint64_t v33 = (void *)((char *)a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  void *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for RRCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2292EC330);
}

uint64_t sub_2292EC330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RREntity();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RRCandidate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2292EC38C);
}

uint64_t sub_2292EC38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RREntity();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_2292EC3D8()
{
  uint64_t result = type metadata accessor for RREntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RRCandidate.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RRCandidate.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292EC5C4);
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

unsigned char *sub_2292EC5EC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RRCandidate.CodingKeys()
{
  return &type metadata for RRCandidate.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RRResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RRResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292EC75CLL);
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

ValueMetadata *type metadata accessor for RRResult.CodingKeys()
{
  return &type metadata for RRResult.CodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.FoundMatchCodingKeys()
{
  return &type metadata for RRResult.FoundMatchCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.NeedsDisambiguationCodingKeys()
{
  return &type metadata for RRResult.NeedsDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.FoundMatchPluralCodingKeys()
{
  return &type metadata for RRResult.FoundMatchPluralCodingKeys;
}

unsigned char *_s32SiriReferenceResolutionDataModel8RRResultO20FoundMatchCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2292EC868);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RRResult.NeedsDisambiguationPluralCodingKeys()
{
  return &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.NoMatchCodingKeys()
{
  return &type metadata for RRResult.NoMatchCodingKeys;
}

unint64_t sub_2292EC8B4()
{
  unint64_t result = qword_26830FCC0;
  if (!qword_26830FCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCC0);
  }
  return result;
}

unint64_t sub_2292EC904()
{
  unint64_t result = qword_26830FCC8;
  if (!qword_26830FCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCC8);
  }
  return result;
}

unint64_t sub_2292EC954()
{
  unint64_t result = qword_26830FCD0;
  if (!qword_26830FCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCD0);
  }
  return result;
}

unint64_t sub_2292EC9A4()
{
  unint64_t result = qword_26830FCD8;
  if (!qword_26830FCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCD8);
  }
  return result;
}

unint64_t sub_2292EC9F4()
{
  unint64_t result = qword_26830FCE0;
  if (!qword_26830FCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCE0);
  }
  return result;
}

unint64_t sub_2292ECA44()
{
  unint64_t result = qword_26830FCE8;
  if (!qword_26830FCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCE8);
  }
  return result;
}

unint64_t sub_2292ECA94()
{
  unint64_t result = qword_26830FCF0;
  if (!qword_26830FCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCF0);
  }
  return result;
}

unint64_t sub_2292ECAE4()
{
  unint64_t result = qword_26830FCF8;
  if (!qword_26830FCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FCF8);
  }
  return result;
}

unint64_t sub_2292ECB34()
{
  unint64_t result = qword_26AEC8E38;
  if (!qword_26AEC8E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E38);
  }
  return result;
}

unint64_t sub_2292ECB84()
{
  unint64_t result = qword_26AEC8E30;
  if (!qword_26AEC8E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E30);
  }
  return result;
}

unint64_t sub_2292ECBD4()
{
  unint64_t result = qword_26AEC8E58;
  if (!qword_26AEC8E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E58);
  }
  return result;
}

unint64_t sub_2292ECC24()
{
  unint64_t result = qword_26AEC8E50;
  if (!qword_26AEC8E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E50);
  }
  return result;
}

unint64_t sub_2292ECC74()
{
  unint64_t result = qword_26AEC8E48;
  if (!qword_26AEC8E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E48);
  }
  return result;
}

unint64_t sub_2292ECCC4()
{
  unint64_t result = qword_26AEC8E40;
  if (!qword_26AEC8E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E40);
  }
  return result;
}

unint64_t sub_2292ECD14()
{
  unint64_t result = qword_26AEC8E68;
  if (!qword_26AEC8E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E68);
  }
  return result;
}

unint64_t sub_2292ECD64()
{
  unint64_t result = qword_26AEC8E60;
  if (!qword_26AEC8E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E60);
  }
  return result;
}

unint64_t sub_2292ECDB4()
{
  unint64_t result = qword_26AEC8E28;
  if (!qword_26AEC8E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E28);
  }
  return result;
}

unint64_t sub_2292ECE04()
{
  unint64_t result = qword_26AEC8E20;
  if (!qword_26AEC8E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E20);
  }
  return result;
}

unint64_t sub_2292ECE54()
{
  unint64_t result = qword_26AEC8E10;
  if (!qword_26AEC8E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E10);
  }
  return result;
}

unint64_t sub_2292ECEA4()
{
  unint64_t result = qword_26AEC8E08;
  if (!qword_26AEC8E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8E08);
  }
  return result;
}

uint64_t sub_2292ECEF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_229309210();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 - 112);
  return MEMORY[0x270F9F390](a1, a2, v4, a1);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_8_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 - 256);
  *uint64_t v2 = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_2293092A0();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_229309330();
}

void OUTLINED_FUNCTION_11_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return type metadata accessor for RRResult(0);
}

void OUTLINED_FUNCTION_13_0()
{
  *(void *)(v0 - 64) = 0;
  *(void *)(v0 - 56) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_229309020();
}

void OUTLINED_FUNCTION_20_0(uint64_t a1@<X8>)
{
  *(void *)(v2 - 64) = a1;
  *(void *)(v2 - 56) = (v1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 - 112);
  return MEMORY[0x270F9F390](a1, a2, v4, a1);
}

uint64_t GroupIdentifier.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GroupIdentifier.seq.getter()
{
  return *(void *)(v0 + 16);
}

SiriReferenceResolutionDataModel::GroupIdentifier __swiftcall GroupIdentifier.init(id:seq:)(Swift::String id, Swift::Int seq)
{
  *uint64_t v2 = id;
  v2[1]._countAndFlagsBits = seq;
  result.id = id;
  result.seq = seq;
  return result;
}

uint64_t GroupIdentifier.description.getter()
{
  return 540697705;
}

BOOL static GroupIdentifier.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_229309350();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_2292ED2F0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7431539 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2292ED3B8(char a1)
{
  if (a1) {
    return 7431539;
  }
  else {
    return 25705;
  }
}

uint64_t sub_2292ED3DC()
{
  return sub_2292ED3B8(*v0);
}

uint64_t sub_2292ED3E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292ED2F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292ED40C(uint64_t a1)
{
  unint64_t v2 = sub_2292ED5C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292ED448(uint64_t a1)
{
  unint64_t v2 = sub_2292ED5C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GroupIdentifier.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD00);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292ED5C8();
  sub_229309470();
  sub_2293092F0();
  if (!v10) {
    sub_229309320();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

unint64_t sub_2292ED5C8()
{
  unint64_t result = qword_26830FD08;
  if (!qword_26830FD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD08);
  }
  return result;
}

uint64_t GroupIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292ED5C8();
  sub_229309450();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v6 = sub_229309260();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_229309290();
  uint64_t v10 = OUTLINED_FUNCTION_2_1();
  v11(v10);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v9;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292ED7A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GroupIdentifier.init(from:)(a1, a2);
}

uint64_t sub_2292ED7BC(void *a1)
{
  return GroupIdentifier.encode(to:)(a1);
}

uint64_t GroupIdentifierGenerator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  GroupIdentifierGenerator.init()();
  return v0;
}

void *GroupIdentifierGenerator.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_229308D80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = v7 - v6;
  v1[4] = -1;
  sub_229308D70();
  uint64_t v9 = sub_229308D60();
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  v1[2] = v9;
  v1[3] = v11;
  return v1;
}

uint64_t sub_2292ED8CC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[4];
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v4;
    uint64_t v5 = v1[3];
    *a1 = v1[2];
    a1[1] = v5;
    a1[2] = v4;
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t GroupIdentifierGenerator.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t GroupIdentifierGenerator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t destroy for GroupIdentifier()
{
  return swift_bridgeObjectRelease();
}

void *_s32SiriReferenceResolutionDataModel15GroupIdentifierVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GroupIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for GroupIdentifier(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupIdentifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GroupIdentifier()
{
  return &type metadata for GroupIdentifier;
}

uint64_t type metadata accessor for GroupIdentifierGenerator()
{
  return self;
}

uint64_t method lookup function for GroupIdentifierGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GroupIdentifierGenerator);
}

uint64_t dispatch thunk of GroupIdentifierGenerator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of GroupIdentifierGenerator.addGroupIdentifier()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

unsigned char *storeEnumTagSinglePayload for GroupIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292EDC08);
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

ValueMetadata *type metadata accessor for GroupIdentifier.CodingKeys()
{
  return &type metadata for GroupIdentifier.CodingKeys;
}

unint64_t sub_2292EDC44()
{
  unint64_t result = qword_26830FD18;
  if (!qword_26830FD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD18);
  }
  return result;
}

unint64_t sub_2292EDC94()
{
  unint64_t result = qword_26830FD20;
  if (!qword_26830FD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD20);
  }
  return result;
}

unint64_t sub_2292EDCE4()
{
  unint64_t result = qword_26830FD28;
  if (!qword_26830FD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD28);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t RRAnnotatedEntity.id.getter()
{
  return OUTLINED_FUNCTION_21();
}

id sub_2292EDDB4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  int v3 = (void *)sub_229308FE0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t RRAnnotatedEntity.appBundleId.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RRAnnotatedEntity.usoEntity.getter()
{
  return swift_retain();
}

uint64_t RRAnnotatedEntity.typedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2292F63F8(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue, a1, &qword_26AEC8D78);
}

uint64_t RRAnnotatedEntity.dataType.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RRAnnotatedEntity.data.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_21();
  sub_2292E2354(v0, v1);
  return OUTLINED_FUNCTION_21();
}

uint64_t RRAnnotatedEntity.group.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group;
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v2 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2292EDF80()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2292EDFB8(v0);
}

uint64_t sub_2292EDFAC()
{
  return sub_2292EE500();
}

uint64_t sub_2292EDFB8(uint64_t a1)
{
  return sub_2292EE548(a1, &OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata);
}

uint64_t (*sub_2292EDFC4())()
{
  return j_j__swift_endAccess;
}

double sub_2292EE030()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score;
  OUTLINED_FUNCTION_1_2();
  return *(double *)v1;
}

uint64_t sub_2292EE090(double a1)
{
  int v3 = (double *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score);
  uint64_t result = OUTLINED_FUNCTION_16_1();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_2292EE0DC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292EE218()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v0 = OUTLINED_FUNCTION_71();
  return sub_2292F63F8(v0, v1, v2);
}

uint64_t sub_2292EE280()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  sub_2292EE2D0(v0, v1);
  return swift_endAccess();
}

uint64_t sub_2292EE2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_2292EE338())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292EE380@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2292EE3E8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2292EE3B4(uint64_t a1)
{
  return sub_2292EE428(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_2292EE3E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment;
  OUTLINED_FUNCTION_1_2();
  return *(void *)v1;
}

uint64_t sub_2292EE428(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment;
  uint64_t result = OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_2292EE480())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292EE4C8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2292EE53C(v0);
}

uint64_t sub_2292EE4F4()
{
  return sub_2292EE500();
}

uint64_t sub_2292EE500()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2292EE53C(uint64_t a1)
{
  return sub_2292EE548(a1, &OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
}

uint64_t sub_2292EE548(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2292EE590())()
{
  return j__swift_endAccess;
}

id sub_2292EE5F4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v3)
  {
    uint64_t v4 = (void *)sub_229308FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_2292EE650()
{
  return OUTLINED_FUNCTION_71();
}

uint64_t sub_2292EE718(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292EE770(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2292EE718(v1, v2);
}

uint64_t (*sub_2292EE7B0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292EE860()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4();
  sub_229309170();
  sub_229309020();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_57();
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_57();
  swift_bridgeObjectRelease();
  sub_229309020();
  sub_229308E30();
  sub_229308DE0();
  swift_release();
  OUTLINED_FUNCTION_57();
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_57();
  swift_bridgeObjectRelease();
  sub_229309020();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F08);
  sub_229309000();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = swift_bridgeObjectRetain();
  MEMORY[0x22A6B55A0](v1, &type metadata for RRMetadata);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_57();
  swift_bridgeObjectRelease();
  sub_229309020();
  OUTLINED_FUNCTION_2_2();
  sub_2293090C0();
  sub_229309020();
  OUTLINED_FUNCTION_2_2();
  uint64_t v2 = OUTLINED_FUNCTION_42();
  sub_2292F63F8(v2, v3, v4);
  sub_229309000();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9038);
  sub_229309000();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  OUTLINED_FUNCTION_2_2();
  type metadata accessor for RRAnnotationValue(0);
  swift_bridgeObjectRetain();
  sub_229308FA0();
  sub_229309020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_229309020();
  OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRetain();
  sub_229309020();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for RRAnnotationValue(uint64_t a1)
{
  return sub_2292E83B4(a1, (uint64_t *)&unk_26AEC8F10);
}

uint64_t sub_2292EED58()
{
  uint64_t v0 = OUTLINED_FUNCTION_56();
  return sub_2292EF250(v0, v1, v2);
}

uint64_t sub_2292EED80(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_56();
  sub_2292EFB60(v2, v3, a1);
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

uint64_t sub_2292EEDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v9 = OUTLINED_FUNCTION_5(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_16_0();
  sub_2292F63F8(a1, v5, &qword_26AEC8D60);
  return a5(v5);
}

unint64_t RRAnnotationName.rawValue.getter()
{
  unint64_t result = 0x656E6F69746E656DLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6E65657263736E6FLL;
      break;
    case 2:
      unint64_t result = 0x756F726765726F66;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x6979616C50776F6ELL;
      break;
    case 5:
      unint64_t result = 0x744179627261656ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292EEF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_2292F61D0(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = type metadata accessor for RRAnnotationValue(0);
    sub_2292EEFEC(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, a4);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = type metadata accessor for RRAnnotationValue(0);
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

uint64_t sub_2292EEFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292EF050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_2292F61D0(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t RRAnnotationValue.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v4 = OUTLINED_FUNCTION_5(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_32_0(v5, v12);
  uint64_t v6 = sub_229308D50();
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, v1, v6);
  OUTLINED_FUNCTION_66();
  return __swift_storeEnumTagSinglePayload(v8, v9, v10, v6);
}

uint64_t sub_2292EF138(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*sub_2292EF194(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EED58();
  return sub_2292EF208;
}

void sub_2292EF208(uint64_t a1, char a2)
{
}

uint64_t sub_2292EF240()
{
  uint64_t v0 = OUTLINED_FUNCTION_69();
  return sub_2292EF250(v0, v1, v2);
}

uint64_t sub_2292EF250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v9 = type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F20);
  uint64_t v12 = OUTLINED_FUNCTION_5(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_23();
  uint64_t v13 = (uint64_t *)(v3 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
  OUTLINED_FUNCTION_2_2();
  uint64_t v14 = *v13;
  swift_bridgeObjectRetain();
  sub_2292EEF3C(a1, a2, v14, v4);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v4, 1, v9))
  {
    sub_2292F26C8(v4, &qword_26AEC8F20);
    uint64_t v15 = sub_229308D50();
    return OUTLINED_FUNCTION_13_1(a3, v16, v17, v15);
  }
  else
  {
    sub_2292EEFEC(v4, v5);
    sub_2292F26C8(v4, &qword_26AEC8F20);
    RRAnnotationValue.date.getter(a3);
    return sub_2292EF138(v5);
  }
}

uint64_t sub_2292EF3C4(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_69();
  sub_2292EFB60(v2, v3, a1);
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

void (*sub_2292EF400(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EF240();
  return sub_2292EF474;
}

void sub_2292EF474(uint64_t a1, char a2)
{
}

void sub_2292EF490(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v7 = *(void **)(a1 + 16);
  if (a2)
  {
    uint64_t v8 = OUTLINED_FUNCTION_65();
    sub_2292F63F8(v8, v9, &qword_26AEC8D60);
    sub_2292EFB60(a3, a4, (uint64_t)v6);
    sub_2292F26C8((uint64_t)v6, &qword_26AEC8D60);
  }
  else
  {
    sub_2292EFB60(a3, a4, (uint64_t)v7);
  }
  sub_2292F26C8((uint64_t)v7, &qword_26AEC8D60);
  free(v7);
  free(v6);
}

uint64_t sub_2292EF558()
{
  uint64_t v0 = OUTLINED_FUNCTION_43_0();
  return sub_2292EF250(v0, v1, v2);
}

uint64_t sub_2292EF580(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_43_0();
  sub_2292EFB60(v2, v3, a1);
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

void (*sub_2292EF5BC(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EF558();
  return sub_2292EF630;
}

void sub_2292EF630(uint64_t a1, char a2)
{
}

uint64_t sub_2292EF66C@<X0>(uint64_t a1@<X8>)
{
  return sub_2292EF250(0x744179627261656ELL, 0xE800000000000000, a1);
}

uint64_t sub_2292EF69C(uint64_t a1)
{
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

void (*sub_2292EF6E8(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EF66C(v5);
  return sub_2292EF75C;
}

void sub_2292EF75C(uint64_t a1, char a2)
{
}

uint64_t sub_2292EF78C@<X0>(uint64_t a1@<X8>)
{
  return sub_2292EF250(0xD000000000000016, 0x8000000229309A90, a1);
}

uint64_t sub_2292EF7C0(uint64_t a1)
{
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

void (*sub_2292EF810(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EF78C(v5);
  return sub_2292EF884;
}

void sub_2292EF884(uint64_t a1, char a2)
{
}

id sub_2292EF8B8(void *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v7 = OUTLINED_FUNCTION_5(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_20_1();
  id v8 = a1;
  a3();

  uint64_t v9 = sub_229308D50();
  uint64_t v10 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v9) != 1)
  {
    uint64_t v10 = (void *)sub_229308D20();
    OUTLINED_FUNCTION_27();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
  }
  return v10;
}

uint64_t sub_2292EF9A8()
{
  uint64_t v0 = OUTLINED_FUNCTION_52();
  return sub_2292EF250(v0, v1, v2);
}

void sub_2292EF9D0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v9 = OUTLINED_FUNCTION_5(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_18_1();
  if (a3)
  {
    sub_229308D40();
    uint64_t v10 = sub_229308D50();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_229308D50();
    uint64_t v11 = 1;
  }
  __swift_storeEnumTagSinglePayload(v4, v11, 1, v10);
  id v12 = a1;
  a4(v4);
}

uint64_t sub_2292EFA90(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_52();
  sub_2292EFB60(v2, v3, a1);
  return sub_2292F26C8(a1, &qword_26AEC8D60);
}

void (*sub_2292EFACC(void *a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_44(a1);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  OUTLINED_FUNCTION_5(v1);
  uint64_t v3 = malloc(*(void *)(v2 + 64));
  uint64_t v4 = OUTLINED_FUNCTION_39_0((uint64_t)v3);
  OUTLINED_FUNCTION_12_1((uint64_t)v4);
  sub_2292EF9A8();
  return sub_2292EFB40;
}

void sub_2292EFB40(uint64_t a1, char a2)
{
}

uint64_t sub_2292EFB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F20);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v12 = OUTLINED_FUNCTION_5(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_46();
  uint64_t v13 = sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_23();
  sub_2292F63F8(a3, v5, &qword_26AEC8D60);
  if (__swift_getEnumTagSinglePayload(v5, 1, v13) == 1)
  {
    sub_2292F26C8(v5, &qword_26AEC8D60);
    uint64_t v17 = type metadata accessor for RRAnnotationValue(0);
    OUTLINED_FUNCTION_13_1(v3, v18, v19, v17);
    sub_2292EFE5C(a1, a2, v3);
    return sub_2292F26C8(v3, &qword_26AEC8F20);
  }
  else
  {
    OUTLINED_FUNCTION_64();
    v21();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v3, v4, v13);
    type metadata accessor for RRAnnotationValue(0);
    OUTLINED_FUNCTION_66();
    __swift_storeEnumTagSinglePayload(v22, v23, v24, v25);
    sub_2292EFE5C(a1, a2, v3);
    sub_2292F26C8(v3, &qword_26AEC8F20);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v4, v13);
  }
}

uint64_t sub_2292EFE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a1;
  uint64_t v48 = sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  uint64_t v50 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_62();
  uint64_t v47 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = &v44[-v12];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F20);
  uint64_t v14 = OUTLINED_FUNCTION_5(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_38_0();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v44[-v17];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v44[-v19];
  uint64_t v21 = type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_45();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = &v44[-v24];
  sub_2292F63F8(a3, (uint64_t)v20, &qword_26AEC8F20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1)
  {
    sub_2292F26C8((uint64_t)v20, &qword_26AEC8F20);
    OUTLINED_FUNCTION_70();
    __swift_storeEnumTagSinglePayload(v26, v27, v28, v21);
    OUTLINED_FUNCTION_11_1();
    swift_bridgeObjectRetain();
    sub_2292F0208(v4, v51, a2);
    return swift_endAccess();
  }
  sub_2292F6394((uint64_t)v20, (uint64_t)v25);
  sub_2292EEFEC((uint64_t)v25, v5);
  uint64_t v30 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v50 + 32);
  uint64_t v31 = v5;
  uint64_t v32 = v48;
  v30(v49, v31, v48);
  uint64_t v33 = (uint64_t *)(v3 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
  OUTLINED_FUNCTION_2_2();
  uint64_t v34 = *v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2292EEF3C(v51, a2, v34, (uint64_t)v18);
  uint64_t v46 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v21) == 1)
  {
    sub_2292F26C8((uint64_t)v18, &qword_26AEC8F20);
    uint64_t v35 = v32;
    uint64_t v37 = v49;
    uint64_t v36 = v50;
LABEL_7:
    sub_2292EEFEC((uint64_t)v25, v4);
    OUTLINED_FUNCTION_66();
    __swift_storeEnumTagSinglePayload(v40, v41, v42, v21);
    OUTLINED_FUNCTION_11_1();
    uint64_t v43 = v46;
    swift_bridgeObjectRetain();
    sub_2292F0208(v4, v51, v43);
    swift_endAccess();
    (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v37, v35);
    return sub_2292EF138((uint64_t)v25);
  }
  v30(v47, (uint64_t)v18, v32);
  uint64_t v37 = v49;
  int v45 = sub_229308D30();
  uint64_t v36 = v50;
  uint64_t v35 = v32;
  uint64_t v38 = *(void (**)(uint64_t))(v50 + 8);
  uint64_t v39 = OUTLINED_FUNCTION_65();
  v38(v39);
  if ((v45 & 1) == 0) {
    goto LABEL_7;
  }
  ((void (*)(unsigned char *, uint64_t))v38)(v37, v35);
  return sub_2292EF138((uint64_t)v25);
}

uint64_t sub_2292F0208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8F20);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RRAnnotationValue(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) == 1)
  {
    sub_2292F26C8(a1, &qword_26AEC8F20);
    sub_2292F6450(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    return sub_2292F26C8((uint64_t)v8, &qword_26AEC8F20);
  }
  else
  {
    sub_2292F6394(a1, (uint64_t)v11);
    sub_2292F65B4((uint64_t)v11, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2292F034C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, long long a10, long long a11, long long a12, uint64_t a13)
{
  id v23 = objc_allocWithZone(v13);
  return RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((long long **)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13);
}

id RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, long long *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_47();
  uint64_t v49 = v23;
  long long v47 = *a11;
  uint64_t v46 = *((void *)a11 + 2);
  uint64_t v24 = (uint64_t)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  uint64_t v25 = sub_229308D50();
  OUTLINED_FUNCTION_13_1(v24, v26, v27, v25);
  uint64_t v28 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(void *)uint64_t v28 = 0;
  v28[8] = 1;
  uint64_t v29 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(void *)uint64_t v29 = 0;
  *((void *)v29 + 1) = 0;
  uint64_t v30 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(void *)uint64_t v30 = a1;
  *((void *)v30 + 1) = a2;
  uint64_t v31 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *(void *)uint64_t v31 = a3;
  *((void *)v31 + 1) = a4;
  *(void *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  uint64_t v32 = (uint64_t)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue];
  uint64_t v33 = sub_229308F90();
  OUTLINED_FUNCTION_13_1(v32, v34, v35, v33);
  uint64_t v36 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(void *)uint64_t v36 = a6;
  *((void *)v36 + 1) = a7;
  uint64_t v37 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *(void *)uint64_t v37 = a8;
  *((void *)v37 + 1) = a10;
  uint64_t v38 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group];
  *(_OWORD *)uint64_t v38 = v47;
  *((void *)v38 + 2) = v46;
  *(void *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = v49;
  *(double *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_11_1();
  uint64_t v39 = v16;
  swift_retain();
  uint64_t v40 = OUTLINED_FUNCTION_72();
  sub_2292E2354(v40, v41);
  sub_2292F06DC(v52, v24);
  swift_endAccess();
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v28 = 0;
  v28[8] = 1;
  *(void *)&v39[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = v53;
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v29 = a15;
  *((void *)v29 + 1) = a16;

  swift_bridgeObjectRelease();
  v54.receiver = v39;
  v54.super_class = (Class)type metadata accessor for RRAnnotatedEntity(0);
  id v42 = objc_msgSendSuper2(&v54, sel_init);
  uint64_t v43 = OUTLINED_FUNCTION_72();
  sub_2292E3160(v43, v44);
  swift_release();
  sub_2292F26C8(v52, &qword_26AEC8D60);
  return v42;
}

uint64_t sub_2292F06DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RRAnnotatedEntity(uint64_t a1)
{
  return sub_2292E83B4(a1, (uint64_t *)&unk_26AEC8D68);
}

id RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  OUTLINED_FUNCTION_17_0();
  id v19 = objc_allocWithZone(v17);
  double v20 = OUTLINED_FUNCTION_23_1();
  return RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v21, v22, v23, v24, v25, a6, a7, a8, v20, v27, v28, v29, v30, a13, a14 & 1, a15, a16, a17);
}

id RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, unint64_t a10, __n128 *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_47();
  uint64_t v48 = v26;
  __n128 v47 = *a11;
  uint64_t v46 = a11[1].n128_i64[0];
  uint64_t v27 = (uint64_t)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  uint64_t v28 = sub_229308D50();
  OUTLINED_FUNCTION_13_1(v27, v29, v30, v28);
  uint64_t v31 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(void *)uint64_t v31 = 0;
  v31[8] = 1;
  uint64_t v32 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(void *)uint64_t v32 = 0;
  *((void *)v32 + 1) = 0;
  uint64_t v33 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(void *)uint64_t v33 = a1;
  *((void *)v33 + 1) = a2;
  uint64_t v34 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *(void *)uint64_t v34 = a3;
  *((void *)v34 + 1) = a4;
  *(void *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  uint64_t v35 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(void *)uint64_t v35 = a6;
  *((void *)v35 + 1) = a7;
  uint64_t v36 = (uint64_t)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue];
  uint64_t v37 = sub_229308F90();
  OUTLINED_FUNCTION_13_1(v36, v38, v39, v37);
  uint64_t v40 = (uint64_t *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *uint64_t v40 = a8;
  v40[1] = a10;
  OUTLINED_FUNCTION_73(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group, v44, a7, a10, v46, v47);
  *(void *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = v48;
  *(double *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_11_1();
  unint64_t v41 = v18;
  swift_retain();
  sub_2292E2354(a8, a10);
  sub_2292F06DC(v50, v27);
  swift_endAccess();
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v31 = v51;
  v31[8] = a15 & 1;
  *(void *)&v41[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = a16;
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v32 = a17;
  *((void *)v32 + 1) = a18;

  swift_bridgeObjectRelease();
  v52.receiver = v41;
  v52.super_class = (Class)type metadata accessor for RRAnnotatedEntity(0);
  id v42 = objc_msgSendSuper2(&v52, sel_init);
  sub_2292E3160(a8, a10);
  swift_release();
  sub_2292F26C8(v50, &qword_26AEC8D60);
  return v42;
}

id RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_17_0();
  id v19 = objc_allocWithZone(v18);
  double v20 = OUTLINED_FUNCTION_23_1();
  return RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v21, v22, v23, v24, v25, a6, a7, a8, v20, v27, v28, v29, v30, a13, a14, a15 & 1, a16, a17, a18);
}

id RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, unint64_t a11, __n128 *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  __n128 v42 = *a12;
  uint64_t v27 = (uint64_t)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  uint64_t v41 = a12[1].n128_i64[0];
  uint64_t v28 = sub_229308D50();
  OUTLINED_FUNCTION_13_1(v27, v29, v30, v28);
  uint64_t v31 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(void *)uint64_t v31 = 0;
  v31[8] = 1;
  uint64_t v32 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(void *)uint64_t v32 = 0;
  *((void *)v32 + 1) = 0;
  uint64_t v33 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(void *)uint64_t v33 = a1;
  *((void *)v33 + 1) = a2;
  uint64_t v34 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *(void *)uint64_t v34 = a3;
  *((void *)v34 + 1) = a4;
  *(void *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  sub_2292F63F8(a6, (uint64_t)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue], &qword_26AEC8D78);
  uint64_t v35 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(void *)uint64_t v35 = a7;
  *((void *)v35 + 1) = a8;
  uint64_t v36 = (uint64_t *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *uint64_t v36 = a10;
  v36[1] = a11;
  OUTLINED_FUNCTION_73(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group, v40, a10, v41, a11, v42);
  *(void *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = a13;
  *(double *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_11_1();
  uint64_t v37 = v19;
  swift_retain();
  sub_2292E2354(a10, a11);
  sub_2292F06DC(a14, v27);
  swift_endAccess();
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v31 = a15;
  v31[8] = a16 & 1;
  *(void *)&v37[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = a17;
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v32 = a18;
  *((void *)v32 + 1) = a19;

  swift_bridgeObjectRelease();
  v45.receiver = v37;
  v45.super_class = (Class)type metadata accessor for RRAnnotatedEntity(0);
  id v38 = objc_msgSendSuper2(&v45, sel_init);
  sub_2292E3160(a10, a11);
  swift_release();
  sub_2292F26C8(a14, &qword_26AEC8D60);
  sub_2292F26C8(a6, &qword_26AEC8D78);
  return v38;
}

void *RRAnnotatedEntity.__allocating_init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v4 = OUTLINED_FUNCTION_5(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_62();
  uint64_t v75 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v76 = (uint64_t)v62 - v7;
  sub_229308F90();
  OUTLINED_FUNCTION_0_0();
  unint64_t v77 = v9;
  uint64_t v78 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v13 = OUTLINED_FUNCTION_5(v12);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_45();
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)v62 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD48);
  OUTLINED_FUNCTION_0_0();
  uint64_t v79 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_20_1();
  uint64_t v23 = a1[3];
  uint64_t v80 = a1;
  uint64_t v24 = __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_2292F18A4();
  uint64_t v25 = (uint64_t)v81;
  sub_229309450();
  if (v25)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v80);
  }
  else
  {
    uint64_t v26 = v1;
    char v73 = v16;
    unint64_t v74 = (unint64_t)v11;
    uint64_t v27 = v78;
    uint64_t v81 = v19;
    v82.n128_u8[0] = 0;
    uint64_t v28 = sub_229309260();
    uint64_t v30 = v29;
    OUTLINED_FUNCTION_22_1(1);
    uint64_t v31 = sub_229309260();
    uint64_t v33 = v32;
    uint64_t v72 = v31;
    sub_229308F30();
    char v84 = 2;
    sub_2292F18F0(&qword_26830FBA8, MEMORY[0x263F737A0]);
    sub_2293092A0();
    uint64_t v71 = v33;
    uint64_t v69 = v28;
    uint64_t v70 = v82.n128_u64[0];
    OUTLINED_FUNCTION_70();
    uint64_t v35 = v27;
    __swift_storeEnumTagSinglePayload(v36, v37, v38, v27);
    v82.n128_u8[0] = 3;
    sub_2292F18F0(&qword_26830FBB0, MEMORY[0x263F80508]);
    sub_2293092A0();
    __swift_storeEnumTagSinglePayload(v26, 0, 1, v27);
    uint64_t v39 = (uint64_t)v81;
    sub_2292F26C8((uint64_t)v81, &qword_26AEC8D78);
    uint64_t v40 = *(void (**)(unint64_t, uint64_t, uint64_t))(v77 + 32);
    v40(v74, v26, v35);
    uint64_t v41 = OUTLINED_FUNCTION_42();
    ((void (*)(uint64_t))v40)(v41);
    __swift_storeEnumTagSinglePayload(v39, 0, 1, v35);
    v82.n128_u8[0] = 4;
    uint64_t v68 = sub_229309230();
    uint64_t v78 = v42;
    char v84 = 5;
    sub_2292E67C0();
    OUTLINED_FUNCTION_37_0();
    if (v82.n128_u64[1] >> 60 == 15)
    {
      uint64_t v43 = v30;
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD58);
      char v84 = 5;
      sub_2292F19E4(&qword_26830FD60);
      sub_229309250();
      unint64_t v45 = v82.n128_u64[0];
      if (v82.n128_u64[0])
      {
        swift_bridgeObjectRelease();
        v82.n128_u64[0] = v44;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD80);
        uint64_t v46 = sub_229309000();
        uint64_t v48 = v47;
        sub_229308CD0();
        swift_allocObject();
        sub_229308CC0();
        v82.n128_u64[0] = v45;
        sub_2292F19E4(&qword_26830FD88);
        unint64_t v74 = sub_229308CB0();
        unint64_t v77 = v49;
        uint64_t v78 = v48;
        uint64_t v68 = v46;
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        unint64_t v74 = 0;
        unint64_t v77 = 0xF000000000000000;
      }
      uint64_t v30 = v43;
    }
    else
    {
      unint64_t v77 = v82.n128_u64[1];
      unint64_t v74 = v82.n128_u64[0];
    }
    char v84 = 6;
    sub_2292E680C();
    OUTLINED_FUNCTION_37_0();
    unint64_t v50 = v82.n128_u64[1];
    unint64_t v51 = v82.n128_u64[0];
    uint64_t v52 = v83;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FB88);
    char v84 = 7;
    sub_2292F4800(&qword_26830FBC8, (void (*)(void))sub_2292E68C4);
    OUTLINED_FUNCTION_29_0();
    unint64_t v53 = v82.n128_u64[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD68);
    char v84 = 8;
    sub_2292F1938();
    OUTLINED_FUNCTION_29_0();
    unint64_t v67 = v51;
    unint64_t v54 = v82.n128_u64[0];
    OUTLINED_FUNCTION_22_1(9);
    uint64_t v65 = sub_229309230();
    uint64_t v66 = v55;
    OUTLINED_FUNCTION_22_1(10);
    uint64_t v64 = sub_229309240();
    int v63 = v56;
    sub_229308D50();
    v82.n128_u8[0] = 11;
    sub_2292F18F0(&qword_26AEC8EB8, MEMORY[0x263F07490]);
    v62[1] = v20;
    sub_229309250();
    sub_2292F63F8((uint64_t)v81, (uint64_t)v73, &qword_26AEC8D78);
    v82.n128_u64[0] = v67;
    v82.n128_u64[1] = v50;
    uint64_t v83 = v52;
    if (v53) {
      uint64_t v57 = v53;
    }
    else {
      uint64_t v57 = MEMORY[0x263F8EE78];
    }
    if (v63) {
      double v58 = 0.0;
    }
    else {
      double v58 = *(double *)&v64;
    }
    sub_2292F63F8(v76, v75, &qword_26AEC8D60);
    if (!v54)
    {
      type metadata accessor for RRAnnotationValue(0);
      unint64_t v54 = sub_229308FB0();
    }
    id v59 = objc_allocWithZone((Class)type metadata accessor for RRAnnotatedEntity(0));
    uint64_t v24 = RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v69, v30, v72, v71, v70, (uint64_t)v73, v68, v78, v58, v74, v77, &v82, v57, v75, 0, 1, v54, v65, v66);
    sub_2292F26C8(v76, &qword_26AEC8D60);
    sub_2292F26C8((uint64_t)v81, &qword_26AEC8D78);
    uint64_t v60 = OUTLINED_FUNCTION_48();
    v61(v60);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v80);
  }
  return v24;
}

unint64_t sub_2292F18A4()
{
  unint64_t result = qword_26830FD50;
  if (!qword_26830FD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD50);
  }
  return result;
}

uint64_t sub_2292F18F0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2292F1938()
{
  unint64_t result = qword_26830FD70;
  if (!qword_26830FD70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FD68);
    sub_2292F18F0(&qword_26830FD78, (void (*)(uint64_t))type metadata accessor for RRAnnotationValue);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FD70);
  }
  return result;
}

uint64_t sub_2292F19E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FD58);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2292F1A48()
{
  unint64_t v0 = sub_229309200();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC) {
    return 12;
  }
  else {
    return v0;
  }
}

uint64_t sub_2292F1A98(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_26_0();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_31_0();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_30_0();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_34_0();
      break;
    case 5:
      uint64_t result = OUTLINED_FUNCTION_61();
      break;
    case 6:
      uint64_t result = OUTLINED_FUNCTION_42_0();
      break;
    case 7:
      uint64_t result = OUTLINED_FUNCTION_33_0();
      break;
    case 8:
      uint64_t result = OUTLINED_FUNCTION_24_0();
      break;
    case 9:
      uint64_t result = OUTLINED_FUNCTION_40_0();
      break;
    case 10:
      uint64_t result = OUTLINED_FUNCTION_41_0();
      break;
    case 11:
      uint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292F1B3C(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_26_0();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_31_0();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_30_0();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_34_0();
      break;
    case 5:
      uint64_t result = OUTLINED_FUNCTION_61();
      break;
    case 6:
      uint64_t result = OUTLINED_FUNCTION_42_0();
      break;
    case 7:
      uint64_t result = OUTLINED_FUNCTION_33_0();
      break;
    case 8:
      uint64_t result = OUTLINED_FUNCTION_24_0();
      break;
    case 9:
      uint64_t result = OUTLINED_FUNCTION_40_0();
      break;
    case 10:
      uint64_t result = OUTLINED_FUNCTION_41_0();
      break;
    case 11:
      uint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292F1BE0(char *a1, char *a2)
{
  return sub_2292F8610(*a1, *a2);
}

uint64_t sub_2292F1BEC()
{
  return sub_2292F8C64(*v0);
}

uint64_t sub_2292F1BF4()
{
  return sub_2292F8E50();
}

uint64_t sub_2292F1BFC(uint64_t a1)
{
  return sub_2292F9334(a1, *v1);
}

uint64_t sub_2292F1C04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292F1A48();
  *a1 = result;
  return result;
}

uint64_t sub_2292F1C34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2292F1A98(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2292F1C60()
{
  return sub_2292F1B3C(*v0);
}

uint64_t sub_2292F1C68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292F1A94();
  *a1 = result;
  return result;
}

void sub_2292F1C90(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_2292F1C9C(uint64_t a1)
{
  unint64_t v2 = sub_2292F18A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292F1CD8(uint64_t a1)
{
  unint64_t v2 = sub_2292F18A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292F1D14@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id + 8);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8);
  uint64_t v22 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
  uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity);
  uint64_t v6 = v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue;
  uint64_t v7 = (int *)type metadata accessor for RREntity();
  sub_2292F63F8(v6, (uint64_t)a1 + v7[7], &qword_26AEC8D78);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data);
  unint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8);
  uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
  uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType);
  uint64_t v19 = *(void *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 16);
  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata);
  OUTLINED_FUNCTION_2_2();
  uint64_t v13 = *v12;
  uint64_t v14 = (void *)((char *)a1 + v7[10]);
  uint64_t v15 = (void *)((char *)a1 + v7[12]);
  *a1 = v23;
  a1[1] = v3;
  a1[2] = v22;
  a1[3] = v4;
  a1[4] = v5;
  uint64_t v16 = (void *)((char *)a1 + v7[8]);
  *uint64_t v16 = v21;
  v16[1] = v8;
  uint64_t v17 = (void *)((char *)a1 + v7[9]);
  *uint64_t v17 = v9;
  v17[1] = v10;
  *uint64_t v14 = v20;
  v14[1] = v11;
  v14[2] = v19;
  *(void *)((char *)a1 + v7[11]) = v13;
  *uint64_t v15 = 0;
  v15[1] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2292E2354(v9, v10);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2292F1EA8@<X0>(void *a1@<X8>)
{
  sub_2292F1D14(a1);
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score);
  OUTLINED_FUNCTION_2_2();
  uint64_t v4 = *v3;
  uint64_t result = type metadata accessor for RRCandidate(0);
  *(void *)((char *)a1 + *(int *)(result + 20)) = v4;
  return result;
}

uint64_t sub_2292F1F08(uint64_t a1)
{
  uint64_t v7 = sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_18_1();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD90);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v14 = OUTLINED_FUNCTION_5(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_38_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_45();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v85 - v17;
  sub_2292F63F8(a1, (uint64_t)v92, &qword_26830FD98);
  if (!v93)
  {
    sub_2292F26C8((uint64_t)v92, &qword_26830FD98);
    goto LABEL_58;
  }
  type metadata accessor for RRAnnotatedEntity(0);
  if (swift_dynamicCast())
  {
    uint64_t v88 = v2;
    uint64_t v19 = v91;
    OUTLINED_FUNCTION_55(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
    BOOL v22 = v22 && v20 == v21;
    if (!v22 && (sub_229309350() & 1) == 0) {
      goto LABEL_57;
    }
    OUTLINED_FUNCTION_55(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
    BOOL v25 = v22 && v23 == v24;
    if (!v25 && (sub_229309350() & 1) == 0) {
      goto LABEL_57;
    }
    uint64_t v85 = v9;
    uint64_t v87 = v3;
    uint64_t v86 = v7;
    uint64_t v89 = v1;
    sub_229308E30();
    uint64_t v26 = sub_229308DE0();
    uint64_t v28 = v27;
    swift_release();
    uint64_t v90 = v19;
    sub_229308E30();
    uint64_t v29 = sub_229308DE0();
    uint64_t v31 = v30;
    swift_release();
    if (v26 == v29 && v28 == v31)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v33 = sub_229309350();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
      {
LABEL_18:

        goto LABEL_58;
      }
    }
    uint64_t v34 = v89;
    uint64_t v35 = *(void *)(v89 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8);
    uint64_t v19 = v90;
    uint64_t v36 = *(void *)&v90[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8];
    if (v35)
    {
      if (!v36) {
        goto LABEL_57;
      }
      BOOL v37 = *(void *)(v89 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType) == *(void *)&v90[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType]
         && v35 == v36;
      if (!v37 && (sub_229309350() & 1) == 0) {
        goto LABEL_57;
      }
    }
    else if (v36)
    {
      goto LABEL_57;
    }
    uint64_t v38 = *(void *)(v34 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data);
    unint64_t v39 = *(void *)(v34 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8);
    uint64_t v40 = *(void *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
    unint64_t v41 = *(void *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8];
    if (v39 >> 60 == 15)
    {
      if (v41 >> 60 == 15) {
        goto LABEL_36;
      }
    }
    else if (v41 >> 60 != 15)
    {
      uint64_t v44 = OUTLINED_FUNCTION_59();
      char v45 = MEMORY[0x22A6B5220](v44);
      sub_2292E3160(v40, v41);
      sub_2292E3160(v38, v39);
      if ((v45 & 1) == 0) {
        goto LABEL_57;
      }
LABEL_36:
      uint64_t v46 = v89;
      uint64_t v47 = (void *)(v89 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
      uint64_t v48 = *(void *)(v89 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8);
      unint64_t v49 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group];
      uint64_t v50 = *(void *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8];
      if (v48)
      {
        if (v50)
        {
          uint64_t v51 = v47[2];
          uint64_t v52 = *((void *)v49 + 2);
          BOOL v53 = *v47 == *(void *)v49 && v48 == v50;
          if (!v53 && (sub_229309350() & 1) == 0 || v51 != v52) {
            goto LABEL_57;
          }
          goto LABEL_46;
        }
        swift_bridgeObjectRetain();
      }
      else if (!v50)
      {
LABEL_46:
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_2_2();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v54 = OUTLINED_FUNCTION_21();
        int v56 = v19;
        char v57 = sub_2292E4E70(v54, v55);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v57 & 1) == 0
          || (double v58 = (double *)(v46 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score),
              OUTLINED_FUNCTION_1_2(),
              double v59 = *v58,
              uint64_t v60 = (double *)&v56[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score],
              OUTLINED_FUNCTION_1_2(),
              v59 != *v60))
        {

          goto LABEL_58;
        }
        uint64_t v61 = v46 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt;
        OUTLINED_FUNCTION_1_2();
        sub_2292F63F8(v61, (uint64_t)v18, &qword_26AEC8D60);
        uint64_t v19 = v90;
        uint64_t v62 = &v90[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
        OUTLINED_FUNCTION_1_2();
        sub_2292F63F8((uint64_t)v62, v5, &qword_26AEC8D60);
        uint64_t v63 = v87;
        uint64_t v64 = v87 + *(int *)(v11 + 48);
        sub_2292F63F8((uint64_t)v18, v87, &qword_26AEC8D60);
        sub_2292F63F8(v5, v64, &qword_26AEC8D60);
        uint64_t v65 = v86;
        if (__swift_getEnumTagSinglePayload(v63, 1, v86) == 1)
        {
          sub_2292F26C8(v5, &qword_26AEC8D60);
          sub_2292F26C8((uint64_t)v18, &qword_26AEC8D60);
          if (__swift_getEnumTagSinglePayload(v64, 1, v65) == 1)
          {
            sub_2292F26C8(v87, &qword_26AEC8D60);
            goto LABEL_61;
          }
          goto LABEL_56;
        }
        sub_2292F63F8(v63, v4, &qword_26AEC8D60);
        if (__swift_getEnumTagSinglePayload(v64, 1, v65) == 1)
        {
          sub_2292F26C8(v5, &qword_26AEC8D60);
          sub_2292F26C8((uint64_t)v18, &qword_26AEC8D60);
          (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v4, v65);
LABEL_56:
          sub_2292F26C8(v87, &qword_26830FD90);
          goto LABEL_57;
        }
        uint64_t v68 = v85;
        uint64_t v69 = v88;
        OUTLINED_FUNCTION_64();
        v70();
        sub_2292F18F0(&qword_26830FDA0, MEMORY[0x263F07490]);
        char v71 = sub_229308FD0();
        uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
        v72(v69, v65);
        sub_2292F26C8(v5, &qword_26AEC8D60);
        uint64_t v73 = OUTLINED_FUNCTION_72();
        sub_2292F26C8(v73, v74);
        v72(v4, v65);
        uint64_t v19 = v90;
        sub_2292F26C8(v63, &qword_26AEC8D60);
        if (v71)
        {
LABEL_61:
          uint64_t v75 = v46 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment;
          OUTLINED_FUNCTION_1_2();
          double v76 = *(double *)v75;
          unint64_t v77 = v19;
          char v78 = *(unsigned char *)(v75 + 8);
          uint64_t v79 = &v77[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
          OUTLINED_FUNCTION_1_2();
          if (v78)
          {
            if ((v79[8] & 1) == 0) {
              goto LABEL_18;
            }
          }
          else if ((v79[8] & 1) != 0 || v76 != *(double *)v79)
          {
            goto LABEL_18;
          }
          uint64_t v80 = (uint64_t *)(v46 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
          OUTLINED_FUNCTION_1_2();
          uint64_t v81 = *v80;
          id v82 = v90;
          uint64_t v83 = (uint64_t *)&v90[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations];
          OUTLINED_FUNCTION_1_2();
          uint64_t v84 = *v83;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char v66 = sub_2292F271C(v81, v84);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v66 & 1;
        }
LABEL_57:

        goto LABEL_58;
      }

      swift_bridgeObjectRelease();
      goto LABEL_58;
    }
    uint64_t v42 = OUTLINED_FUNCTION_59();
    sub_2292E3160(v42, v43);
    sub_2292E3160(v40, v41);
    goto LABEL_57;
  }
LABEL_58:
  char v66 = 0;
  return v66 & 1;
}

uint64_t sub_2292F26C8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_2292F271C(uint64_t a1, uint64_t a2)
{
  uint64_t v73 = sub_229308D50();
  uint64_t v4 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  char v71 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v72 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v58 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v58 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FDF8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (uint64_t *)((char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (uint64_t *)((char *)&v58 - v20);
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v74 = 0;
  uint64_t v62 = a1;
  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v22 = v24;
  uint64_t v25 = 1 << *(unsigned char *)(v23 - 32);
  uint64_t v26 = -1;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  unint64_t v27 = v26 & v22;
  uint64_t v69 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v70 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  uint64_t v60 = v23;
  int64_t v61 = (unint64_t)(v25 + 63) >> 6;
  int64_t v59 = v61 - 1;
  uint64_t v67 = v7;
  uint64_t v68 = a2;
  uint64_t v65 = (uint64_t *)((char *)&v58 - v20);
  char v66 = v18;
  uint64_t v63 = v14;
  uint64_t v64 = v12;
  while (1)
  {
    if (v27)
    {
      uint64_t v78 = (v27 - 1) & v27;
      unint64_t v28 = __clz(__rbit64(v27)) | (v74 << 6);
LABEL_8:
      uint64_t v29 = *(void *)(v62 + 56);
      uint64_t v30 = (void *)(*(void *)(v62 + 48) + 16 * v28);
      uint64_t v31 = v30[1];
      *uint64_t v18 = *v30;
      v18[1] = v31;
      uint64_t v32 = v29 + *(void *)(v7 + 72) * v28;
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FE00);
      sub_2292EEFEC(v32, (uint64_t)v18 + *(int *)(v33 + 48));
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v33);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    int64_t v34 = v74 + 1;
    if (__OFADD__(v74, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v34 < v61)
    {
      unint64_t v35 = *(void *)(v60 + 8 * v34);
      if (v35) {
        goto LABEL_12;
      }
      int64_t v36 = v74 + 2;
      ++v74;
      if (v34 + 1 < v61)
      {
        unint64_t v35 = *(void *)(v60 + 8 * v36);
        if (v35) {
          goto LABEL_15;
        }
        int64_t v74 = v34 + 1;
        if (v34 + 2 < v61)
        {
          unint64_t v35 = *(void *)(v60 + 8 * (v34 + 2));
          if (v35)
          {
            v34 += 2;
            goto LABEL_12;
          }
          int64_t v74 = v34 + 2;
          if (v34 + 3 < v61)
          {
            unint64_t v35 = *(void *)(v60 + 8 * (v34 + 3));
            if (v35)
            {
              v34 += 3;
              goto LABEL_12;
            }
            int64_t v36 = v34 + 4;
            int64_t v74 = v34 + 3;
            if (v34 + 4 < v61) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FE00);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v37);
    uint64_t v78 = 0;
LABEL_30:
    sub_2292F632C((uint64_t)v18, (uint64_t)v21);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FE00);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v38);
    uint64_t v40 = EnumTagSinglePayload == 1;
    if (EnumTagSinglePayload == 1) {
      return v40;
    }
    uint64_t v41 = (uint64_t)v21 + *(int *)(v38 + 48);
    uint64_t v42 = *v21;
    uint64_t v43 = v21[1];
    sub_2292F6394(v41, (uint64_t)v14);
    unint64_t v44 = sub_2292F61D0(v42, v43);
    char v46 = v45;
    swift_bridgeObjectRelease();
    if ((v46 & 1) == 0)
    {
      sub_2292EF138((uint64_t)v14);
      return 0;
    }
    unsigned int v75 = v40;
    sub_2292EEFEC(*(void *)(a2 + 56) + *(void *)(v7 + 72) * v44, (uint64_t)v12);
    uint64_t v47 = (uint64_t)v12;
    uint64_t v48 = v72;
    sub_2292EEFEC(v47, v72);
    unint64_t v77 = *v70;
    uint64_t v49 = (uint64_t)v14;
    uint64_t v50 = v71;
    uint64_t v51 = v73;
    v77(v71, v48, v73);
    uint64_t v79 = 0x2865746164;
    unint64_t v80 = 0xE500000000000000;
    sub_2292F18F0(&qword_26AEC8EC0, MEMORY[0x263F07490]);
    sub_229309340();
    sub_229309020();
    swift_bridgeObjectRelease();
    sub_229309020();
    unint64_t v52 = v80;
    uint64_t v76 = v79;
    BOOL v53 = *v69;
    (*v69)(v50, v51);
    sub_2292EEFEC(v49, v48);
    v77(v50, v48, v51);
    uint64_t v79 = 0x2865746164;
    unint64_t v80 = 0xE500000000000000;
    sub_229309340();
    sub_229309020();
    swift_bridgeObjectRelease();
    sub_229309020();
    uint64_t v55 = v79;
    unint64_t v54 = v80;
    v53(v50, v51);
    if (v76 == v55 && v52 == v54)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v12 = v64;
      sub_2292EF138((uint64_t)v64);
      uint64_t v14 = v63;
      uint64_t result = sub_2292EF138((uint64_t)v63);
      uint64_t v7 = v67;
      a2 = v68;
      uint64_t v21 = v65;
      uint64_t v18 = v66;
      unint64_t v27 = v78;
    }
    else
    {
      char v57 = sub_229309350();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = v64;
      sub_2292EF138((uint64_t)v64);
      uint64_t v14 = v63;
      uint64_t result = sub_2292EF138((uint64_t)v63);
      uint64_t v7 = v67;
      a2 = v68;
      uint64_t v21 = v65;
      uint64_t v18 = v66;
      unint64_t v27 = v78;
      uint64_t v40 = v75;
      if ((v57 & 1) == 0) {
        return v40;
      }
    }
  }
  unint64_t v35 = *(void *)(v60 + 8 * v36);
  if (v35)
  {
LABEL_15:
    int64_t v34 = v36;
LABEL_12:
    uint64_t v78 = (v35 - 1) & v35;
    unint64_t v28 = __clz(__rbit64(v35)) + (v34 << 6);
    int64_t v74 = v34;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v34 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v34 >= v61)
    {
      int64_t v74 = v59;
      goto LABEL_29;
    }
    unint64_t v35 = *(void *)(v60 + 8 * v34);
    ++v36;
    if (v35) {
      goto LABEL_12;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

double sub_2292F2E54()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata;
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = *(void *)(*(void *)v1 + 16);
  if (v3)
  {
    for (uint64_t i = *(void *)v1 + 48; *(unsigned char *)(i + 32); i += 56)
    {
      if (!--v3) {
        return result;
      }
    }
    return *(double *)i * *(double *)(i + 8);
  }
  return result;
}

id RRAnnotatedEntity.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void RRAnnotatedEntity.init()()
{
}

id RRAnnotatedEntity.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RRAnnotatedEntity(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2292F307C(void *a1)
{
  uint64_t v5 = v1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v8 = OUTLINED_FUNCTION_5(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_23();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FDA8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2292F18A4();
  sub_229309470();
  sub_2293092F0();
  if (!v2)
  {
    OUTLINED_FUNCTION_51(1);
    sub_2293092F0();
    sub_229308F30();
    sub_2292F18F0(&qword_26830FB68, MEMORY[0x263F737A0]);
    OUTLINED_FUNCTION_36_0();
    sub_229308F90();
    sub_2292F18F0(&qword_26830FB70, MEMORY[0x263F80508]);
    sub_2293092E0();
    OUTLINED_FUNCTION_51(4);
    sub_2293092D0();
    sub_2292E65FC();
    OUTLINED_FUNCTION_49();
    sub_2292E6648();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_28_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FB88);
    sub_2292F4800(&qword_26830FB90, (void (*)(void))sub_2292E66DC);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_28_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD68);
    sub_2292F486C();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_28_0();
    swift_bridgeObjectRetain();
    sub_2293092D0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_28_0();
    sub_229309310();
    uint64_t v14 = v5 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt;
    OUTLINED_FUNCTION_28_0();
    sub_2292F63F8(v14, v4, &qword_26AEC8D60);
    sub_229308D50();
    sub_2292F18F0(&qword_26AEC8EB0, MEMORY[0x263F07490]);
    sub_2293092E0();
    sub_2292F26C8(v4, &qword_26AEC8D60);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v3, v9);
}

void *sub_2292F358C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  double result = RRAnnotatedEntity.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2292F35B8(void *a1)
{
  return sub_2292F307C(a1);
}

SiriReferenceResolutionDataModel::RRAnnotationName_optional __swiftcall RRAnnotationName.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_229309200();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_2292F3638(unsigned __int8 *a1, char *a2)
{
  return sub_2292F8938(*a1, *a2);
}

uint64_t sub_2292F3644()
{
  return sub_2292F8CAC(*v0);
}

uint64_t sub_2292F364C(uint64_t a1)
{
  return sub_2292F8FF4(a1, *v1);
}

uint64_t sub_2292F3654(uint64_t a1)
{
  return sub_2292F931C(a1, *v1);
}

SiriReferenceResolutionDataModel::RRAnnotationName_optional sub_2292F365C(Swift::String *a1)
{
  return RRAnnotationName.init(rawValue:)(*a1);
}

unint64_t sub_2292F3668@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = RRAnnotationName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t RRAnnotationValue.description.getter()
{
  sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_18_1();
  uint64_t v1 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v2 = OUTLINED_FUNCTION_5(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_42();
  sub_2292EEFEC(v3, v4);
  OUTLINED_FUNCTION_64();
  v5();
  sub_2292F18F0(&qword_26AEC8EC0, MEMORY[0x263F07490]);
  sub_229309340();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  uint64_t v6 = OUTLINED_FUNCTION_65();
  v7(v6);
  return OUTLINED_FUNCTION_42();
}

uint64_t RRAnnotationValue.init(date:)()
{
  sub_229308D50();
  OUTLINED_FUNCTION_3_0();
  uint64_t v0 = OUTLINED_FUNCTION_71();
  return v1(v0);
}

uint64_t RRAnnotationValue.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2293091A0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v26 = v7;
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_46();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v9 = OUTLINED_FUNCTION_5(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  uint64_t v29 = v10;
  uint64_t v11 = sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_72();
  sub_229309440();
  if (!v2)
  {
    uint64_t v24 = v4;
    __swift_project_boxed_opaque_existential_1(v28, v28[3]);
    sub_2292F18F0(&qword_26AEC8EB8, MEMORY[0x263F07490]);
    uint64_t v15 = v29;
    sub_229309360();
    OUTLINED_FUNCTION_66();
    __swift_storeEnumTagSinglePayload(v16, v17, v18, v11);
    if (__swift_getEnumTagSinglePayload(v15, 1, v11) == 1)
    {
      sub_2292F26C8(v15, &qword_26AEC8D60);
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      sub_229309430();
      sub_229309190();
      sub_2293091B0();
      swift_allocError();
      uint64_t v20 = v19;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v19, v24, v27);
      OUTLINED_FUNCTION_27();
      (*(void (**)(uint64_t))(v21 + 104))(v20);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v27);
    }
    else
    {
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
      v22(v3, v15, v11);
      v22(a2, v3, v11);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v28);
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
}

uint64_t RRAnnotationValue.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_229308D50();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_16_0();
  uint64_t v6 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v7 = OUTLINED_FUNCTION_5(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229309460();
  sub_2292EEFEC(v3, v2);
  OUTLINED_FUNCTION_64();
  v8();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  sub_2292F18F0(&qword_26AEC8EB0, MEMORY[0x263F07490]);
  sub_229309370();
  uint64_t v9 = OUTLINED_FUNCTION_50();
  v10(v9);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
}

uint64_t static RRAnnotationValue.== infix(_:_:)()
{
  uint64_t v0 = RRAnnotationValue.description.getter();
  uint64_t v2 = v1;
  if (v0 == RRAnnotationValue.description.getter() && v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_65();
    char v5 = sub_229309350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t RRAnnotationValue.hash(into:)()
{
  uint64_t v1 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v2 = OUTLINED_FUNCTION_5(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_32_0(v3, v7);
  sub_2293093F0();
  uint64_t v4 = sub_229308D50();
  sub_2292F18F0(&qword_26830FDC0, MEMORY[0x263F07490]);
  sub_229308FC0();
  OUTLINED_FUNCTION_27();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v0, v4);
}

uint64_t RRAnnotationValue.hashValue.getter()
{
  uint64_t v1 = type metadata accessor for RRAnnotationValue(0);
  uint64_t v2 = OUTLINED_FUNCTION_5(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_20_1();
  sub_2293093E0();
  uint64_t v3 = OUTLINED_FUNCTION_71();
  sub_2292EEFEC(v3, v4);
  sub_2293093F0();
  uint64_t v5 = sub_229308D50();
  sub_2292F18F0(&qword_26830FDC0, MEMORY[0x263F07490]);
  sub_229308FC0();
  OUTLINED_FUNCTION_27();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v5);
  return sub_229309420();
}

uint64_t sub_2292F3F8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RRAnnotationValue.init(from:)(a1, a2);
}

uint64_t sub_2292F3FA4(void *a1)
{
  return RRAnnotationValue.encode(to:)(a1);
}

uint64_t sub_2292F3FC4(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2293093E0();
  sub_2292EEFEC(v1, (uint64_t)v3);
  sub_2293093F0();
  uint64_t v4 = sub_229308D50();
  sub_2292F18F0(&qword_26830FDC0, MEMORY[0x263F07490]);
  sub_229308FC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return sub_229309420();
}

id RREntity.toAnnotatedEntity(addUsoIdentifierIfNotPresent:configuration:)(int a1, uint64_t *a2)
{
  uint64_t v4 = (uint64_t)v2;
  LODWORD(v115) = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  uint64_t v7 = OUTLINED_FUNCTION_5(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D78);
  uint64_t v9 = OUTLINED_FUNCTION_5(v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_229308DD0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_0();
  uint64_t v16 = *a2;
  uint64_t v17 = a2[1];
  if (v17 == 1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = *a2;
  }
  if (v17 == 1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = a2[1];
  }
  uint64_t v20 = *v2;
  uint64_t v21 = v2[1];
  uint64_t v22 = v2[2];
  uint64_t v23 = v2[3];
  v116 = v11;
  uint64_t v117 = v22;
  uint64_t v113 = v18;
  uint64_t v114 = v20;
  uint64_t v112 = v19;
  if (v115)
  {
    uint64_t v115 = v15;
    uint64_t v24 = v16;
    uint64_t v25 = v14;
    sub_2292F4968(v24, v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v26 = v25;
    sub_229308DC0();
    uint64_t v110 = *(void *)(v4 + 32);
    uint64_t v27 = sub_229308F10();
    unint64_t v28 = (int *)v27;
    uint64_t v29 = *(void *)(v27 + 16);
    uint64_t v111 = v3;
    uint64_t v107 = v23;
    if (v29)
    {
      unint64_t v30 = v27 + ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80));
      uint64_t v31 = *(void *)(v115 + 72);
      sub_2292F18F0(&qword_26830FDC8, MEMORY[0x263F72710]);
      while ((sub_229308FD0() & 1) == 0)
      {
        v30 += v31;
        if (!--v29)
        {
          swift_bridgeObjectRelease();
          uint64_t v32 = v111;
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v72 = type metadata accessor for RREntity();
      uint64_t v73 = OUTLINED_FUNCTION_54(v72);
      sub_2292F63F8(v73, (uint64_t)v116, &qword_26AEC8D78);
      uint64_t v74 = v28[9];
      unsigned int v75 = (uint64_t *)(v4 + v28[8]);
      unint64_t v76 = v75[1];
      uint64_t v109 = *v75;
      v108.n128_u64[0] = v76;
      unint64_t v78 = *(void *)(v4 + v74 + 8);
      v105.n128_u64[0] = *(void *)(v4 + v74);
      uint64_t v77 = v105.n128_u64[0];
      __n128 v104 = OUTLINED_FUNCTION_14_1(v28[10]);
      uint64_t v79 = OUTLINED_FUNCTION_35_0(v104);
      unint64_t v80 = v111;
      OUTLINED_FUNCTION_13_1(v111, v81, v82, v79);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2292E2354(v77, v78);
      type metadata accessor for RRAnnotationValue(0);
      OUTLINED_FUNCTION_67();
      swift_bridgeObjectRetain();
      sub_229308FB0();
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_15_0();
      __n128 v105 = (__n128)v80;
      v104.n128_u64[0] = v83;
      v104.n128_u64[1] = v4;
      v103.n128_u64[1] = v78;
      v103.n128_u64[0] = v80;
      uint64_t v84 = OUTLINED_FUNCTION_25_0();
      id v49 = RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v84, v85, v86, v87, v88, v89, v109, v108.n128_i64[0], v90, v103.n128_i64[0], v103.n128_u64[1], (__n128 *)v104.n128_u64[0], v104.n128_i64[1], v105.n128_i64[0], v105.n128_i64[1], v106, v107, v108.n128_i64[0], v108.n128_i64[1]);
      (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v26, v12);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = v3;
LABEL_15:
      uint64_t v50 = (int *)sub_229308F20();
      sub_229308E00();
      swift_allocObject();
      OUTLINED_FUNCTION_21();
      uint64_t v51 = sub_229308DF0();
      sub_229308E20();
      uint64_t v109 = v26;
      sub_229308DB0();
      if (MEMORY[0x22A6B5330](v51))
      {
        uint64_t v52 = type metadata accessor for RREntity();
        uint64_t v53 = OUTLINED_FUNCTION_54(v52);
        sub_2292F63F8(v53, (uint64_t)v116, &qword_26AEC8D78);
        uint64_t v54 = v50[9];
        uint64_t v55 = (uint64_t *)(v4 + v50[8]);
        unint64_t v56 = v55[1];
        uint64_t v110 = *v55;
        v108.n128_u64[0] = v56;
        uint64_t v57 = *(void *)(v4 + v54);
        unint64_t v58 = *(void *)(v4 + v54 + 8);
        __n128 v105 = OUTLINED_FUNCTION_14_1(v50[10]);
        uint64_t v59 = OUTLINED_FUNCTION_35_0(v105);
        OUTLINED_FUNCTION_13_1(v32, v60, v61, v59);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2292E2354(v57, v58);
        type metadata accessor for RRAnnotationValue(0);
        OUTLINED_FUNCTION_67();
        swift_bridgeObjectRetain();
        sub_229308FB0();
        OUTLINED_FUNCTION_53();
        OUTLINED_FUNCTION_8_1();
        v103.n128_u64[1] = v58;
        v104.n128_u64[0] = v62;
        v103.n128_u64[0] = v57;
        uint64_t v63 = OUTLINED_FUNCTION_25_0();
        uint64_t v70 = v110;
        uint64_t v71 = v108.n128_u64[0];
      }
      else
      {
        uint64_t v91 = type metadata accessor for RREntity();
        uint64_t v92 = OUTLINED_FUNCTION_54(v91);
        sub_2292F63F8(v92, (uint64_t)v116, &qword_26AEC8D78);
        uint64_t v93 = v50[9];
        uint64_t v94 = (unint64_t *)(v4 + v50[8]);
        unint64_t v95 = v94[1];
        v108.n128_u64[0] = *v94;
        v105.n128_u64[0] = v95;
        unint64_t v97 = *(void *)(v4 + v93 + 8);
        v104.n128_u64[0] = *(void *)(v4 + v93);
        uint64_t v96 = v104.n128_u64[0];
        __n128 v103 = OUTLINED_FUNCTION_14_1(v50[10]);
        uint64_t v98 = OUTLINED_FUNCTION_35_0(v103);
        OUTLINED_FUNCTION_13_1(v32, v99, v100, v98);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        sub_2292E2354(v96, v97);
        type metadata accessor for RRAnnotationValue(0);
        OUTLINED_FUNCTION_67();
        swift_bridgeObjectRetain();
        sub_229308FB0();
        OUTLINED_FUNCTION_53();
        OUTLINED_FUNCTION_8_1();
        v103.n128_u64[1] = v97;
        v104.n128_u64[0] = v101;
        v103.n128_u64[0] = v101;
        uint64_t v63 = OUTLINED_FUNCTION_25_0();
        uint64_t v70 = v108.n128_u64[0];
        uint64_t v71 = v105.n128_u64[0];
      }
      id v49 = RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v63, v64, v65, v66, v67, v68, v70, v71, v69, v103.n128_i64[0], v103.n128_u64[1], (__n128 *)v104.n128_u64[0], v104.n128_i64[1], v105.n128_i64[0], v105.n128_i64[1], v106, v107, v108.n128_i64[0], v108.n128_i64[1]);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v109, v12);
    }
  }
  else
  {
    uint64_t v110 = *(void *)(v4 + 32);
    uint64_t v33 = v3;
    int64_t v34 = (int *)type metadata accessor for RREntity();
    sub_2292F63F8(v4 + v34[7], (uint64_t)v11, &qword_26AEC8D78);
    uint64_t v35 = v34[9];
    int64_t v36 = (uint64_t *)(v4 + v34[8]);
    uint64_t v37 = v36[1];
    uint64_t v115 = *v36;
    unint64_t v38 = *(void *)(v4 + v35 + 8);
    uint64_t v109 = *(void *)(v4 + v35);
    __n128 v108 = OUTLINED_FUNCTION_14_1(v34[10]);
    uint64_t v39 = OUTLINED_FUNCTION_35_0(v108);
    OUTLINED_FUNCTION_13_1(v33, v40, v41, v39);
    sub_2292F4968(v16, v17);
    uint64_t v42 = v37;
    swift_bridgeObjectRetain();
    uint64_t v43 = v21;
    swift_bridgeObjectRetain();
    uint64_t v44 = v23;
    swift_bridgeObjectRetain();
    uint64_t v45 = v110;
    swift_retain();
    uint64_t v46 = v109;
    sub_2292E2354(v109, v38);
    type metadata accessor for RRAnnotationValue(0);
    OUTLINED_FUNCTION_67();
    swift_bridgeObjectRetain();
    sub_229308FB0();
    OUTLINED_FUNCTION_53();
    double v47 = OUTLINED_FUNCTION_15_0();
    return RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v114, v43, v117, v44, v45, (uint64_t)v116, v115, v42, v47, v46, v38, v48, v4, v33, 0, v106, v107, v108.n128_i64[0], v108.n128_i64[1]);
  }
  return v49;
}

uint64_t sub_2292F4800(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FB88);
    a2();
    OUTLINED_FUNCTION_42();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2292F486C()
{
  unint64_t result = qword_26830FDB0;
  if (!qword_26830FDB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FD68);
    sub_2292F18F0(&qword_26830FDB8, (void (*)(uint64_t))type metadata accessor for RRAnnotationValue);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FDB0);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2292F4968(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2292F4980()
{
  unint64_t result = qword_26830FDD0;
  if (!qword_26830FDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FDD0);
  }
  return result;
}

uint64_t sub_2292F49CC()
{
  return sub_2292F18F0(&qword_26830FDD8, (void (*)(uint64_t))type metadata accessor for RRAnnotationValue);
}

uint64_t sub_2292F4A14()
{
  OUTLINED_FUNCTION_68();
  uint64_t result = sub_2292EDFAC();
  *uint64_t v0 = result;
  return result;
}

void sub_2292F4A40()
{
  OUTLINED_FUNCTION_68();
  *uint64_t v0 = sub_2292EE030();
}

uint64_t sub_2292F4A68(double *a1)
{
  return sub_2292EE090(*a1);
}

uint64_t sub_2292F4A90()
{
  return sub_2292EE218();
}

uint64_t sub_2292F4AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_2292EE280);
}

uint64_t sub_2292F4AE8()
{
  OUTLINED_FUNCTION_68();
  uint64_t result = sub_2292EE4F4();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_2292F4B14()
{
  OUTLINED_FUNCTION_68();
  uint64_t result = sub_2292EE650();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2292F4B40()
{
  return sub_2292EED58();
}

uint64_t sub_2292F4B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EED80);
}

uint64_t sub_2292F4B90()
{
  return sub_2292EF240();
}

uint64_t sub_2292F4BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EF3C4);
}

uint64_t sub_2292F4BE0()
{
  return sub_2292EF558();
}

uint64_t sub_2292F4C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EF580);
}

uint64_t sub_2292F4C30@<X0>(uint64_t a1@<X8>)
{
  return sub_2292EF66C(a1);
}

uint64_t sub_2292F4C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EF69C);
}

uint64_t sub_2292F4C80@<X0>(uint64_t a1@<X8>)
{
  return sub_2292EF78C(a1);
}

uint64_t sub_2292F4CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EF7C0);
}

uint64_t sub_2292F4CD0()
{
  return sub_2292EF9A8();
}

uint64_t sub_2292F4CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2292EEDBC(a1, a2, a3, a4, sub_2292EFA90);
}

uint64_t sub_2292F4D20()
{
  return type metadata accessor for RRAnnotatedEntity(0);
}

void sub_2292F4D28()
{
  sub_2292F598C(319, (unint64_t *)&qword_26AEC9318, MEMORY[0x263F80508]);
  if (v0 <= 0x3F)
  {
    sub_2292F598C(319, &qword_26AEC8EC8, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for RRAnnotatedEntity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RRAnnotatedEntity);
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0x108))(a1, a2 & 1);
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.setDateAnnotation(key:value:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)()
{
  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 504))(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 512))(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.toRREntity()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.toRRCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.computeBoundingBoxArea()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

void sub_2292F598C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_229309100();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for RRAnnotationName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RRAnnotationName(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x2292F5B34);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRAnnotationName()
{
  return &type metadata for RRAnnotationName;
}

uint64_t *initializeBufferWithCopyOfBuffer for RRAnnotationValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = sub_229308D50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for RRAnnotationValue(uint64_t a1)
{
  uint64_t v2 = sub_229308D50();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_229308D50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_229308D50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_229308D50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_229308D50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_229308D50();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RRAnnotationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_229308D50();
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v6);
}

uint64_t sub_2292F5EB0(uint64_t a1)
{
  uint64_t result = sub_229308D50();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RRAnnotatedEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RRAnnotatedEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292F60A8);
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

ValueMetadata *type metadata accessor for RRAnnotatedEntity.CodingKeys()
{
  return &type metadata for RRAnnotatedEntity.CodingKeys;
}

unint64_t sub_2292F60E4()
{
  unint64_t result = qword_26830FDE0;
  if (!qword_26830FDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FDE0);
  }
  return result;
}

unint64_t sub_2292F6134()
{
  unint64_t result = qword_26830FDE8;
  if (!qword_26830FDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FDE8);
  }
  return result;
}

unint64_t sub_2292F6184()
{
  unint64_t result = qword_26830FDF0;
  if (!qword_26830FDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FDF0);
  }
  return result;
}

unint64_t sub_2292F61D0(uint64_t a1, uint64_t a2)
{
  sub_2293093E0();
  sub_229309010();
  uint64_t v4 = sub_229309420();
  return sub_2292F6248(a1, a2, v4);
}

unint64_t sub_2292F6248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_229309350() & 1) == 0)
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
      while (!v14 && (sub_229309350() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2292F632C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292F6394(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292F63F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = OUTLINED_FUNCTION_21();
  v5(v4);
  return a2;
}

uint64_t sub_2292F6450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2292F61D0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9040);
    sub_2293091D0();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v16 + 56);
    uint64_t v11 = type metadata accessor for RRAnnotationValue(0);
    sub_2292F6394(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v8, a3);
    sub_2293091E0();
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease();
    uint64_t v12 = a3;
    uint64_t v13 = 0;
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = type metadata accessor for RRAnnotationValue(0);
    uint64_t v12 = a3;
    uint64_t v13 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v12, v13, 1, v14);
}

uint64_t sub_2292F65B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_2292F6644(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F6644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_2292F61D0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9040);
  if ((sub_2293091D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_2292F61D0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_229309390();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = v16 + *(void *)(*(void *)(type metadata accessor for RRAnnotationValue(0) - 8) + 72) * v11;
    return sub_2292F682C(a1, v17);
  }
  else
  {
    sub_2292F6794(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2292F6794(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for RRAnnotationValue(0);
  uint64_t result = sub_2292F6394(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_2292F682C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_8_1()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

__n128 OUTLINED_FUNCTION_14_1@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + a1;
  *(void *)(v2 - 112) = *(void *)v3;
  return *(__n128 *)(v3 + 8);
}

double OUTLINED_FUNCTION_15_0()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_beginAccess();
}

__n128 OUTLINED_FUNCTION_17_0()
{
  return v0[2];
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
  return v1 - 120;
}

double OUTLINED_FUNCTION_23_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return 0x697461746F6E6E61;
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return *(void *)(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return 0x6C646E7542707061;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_229309250();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return 0x6C61566465707974;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return 0x7469746E456F7375;
}

uint64_t OUTLINED_FUNCTION_32_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_2292EEFEC(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return 0x617461646174656DLL;
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return 0x6570795461746164;
}

uint64_t OUTLINED_FUNCTION_35_0(__n128 a1)
{
  *(__n128 *)(v1 - 104) = a1;
  return sub_229308D50();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return sub_229309330();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_229309250();
}

void *OUTLINED_FUNCTION_39_0(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return malloc(v2);
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return 0x644972657375;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return 0x65726F6373;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return 0x70756F7267;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return 0x756F726765726F66;
}

void *OUTLINED_FUNCTION_44(void *result)
{
  *uint64_t result = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_2293092E0();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return v0;
}

void OUTLINED_FUNCTION_51(char a1@<W8>)
{
  *(unsigned char *)(v1 - 112) = a1;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return 0x6979616C50776F6ELL;
}

id OUTLINED_FUNCTION_53()
{
  uint64_t v0 = (objc_class *)type metadata accessor for RRAnnotatedEntity(0);
  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_54(uint64_t a1)
{
  return v1 + *(int *)(a1 + 28);
}

uint64_t OUTLINED_FUNCTION_55@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return 0x656E6F69746E656DLL;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_229309020();
}

uint64_t OUTLINED_FUNCTION_59()
{
  sub_2292E2354(v0, v3);
  sub_2292E2354(v1, v2);
  return v0;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return 1635017060;
}

uint64_t OUTLINED_FUNCTION_65()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return 0x6E65657263736E6FLL;
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_73@<Q0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __n128 a6)
{
  uint64_t v8 = (__n128 *)(v7 + a1);
  __n128 result = a6;
  *uint64_t v8 = a6;
  v8[1].n128_u64[0] = v6;
  return result;
}

void *static RRCoder.encode<A>(_:)(uint64_t a1)
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  v5[0] = 0;
  id v1 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v5);
  id v2 = v5[0];
  if (v1)
  {
    unint64_t v3 = (void *)sub_229308D10();
  }
  else
  {
    unint64_t v3 = v2;
    sub_229308CE0();

    swift_willThrow();
  }
  return v3;
}

uint64_t static RRCoder.decode<A>(_:from:)()
{
  sub_2292F70A8();
  uint64_t result = sub_2293090F0();
  if (!v0)
  {
    if (v4)
    {
      if (swift_dynamicCast()) {
        return v2;
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_2292F70E8((uint64_t)v3);
      return 0;
    }
  }
  return result;
}

unint64_t sub_2292F70A8()
{
  unint64_t result = qword_26830FE08;
  if (!qword_26830FE08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26830FE08);
  }
  return result;
}

uint64_t sub_2292F70E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for RRCoder()
{
  return &type metadata for RRCoder;
}

uint64_t RRQuery.description.getter()
{
  sub_2292F7644(v0, (uint64_t)v15);
  switch(v16[32])
  {
    case 1:
      uint64_t v3 = v15[0];
      id v1 = (void *)v15[2];
      OUTLINED_FUNCTION_0_1();
      sub_229309170();
      OUTLINED_FUNCTION_2_3();
      sub_229309020();
      v12[0] = v3;
      sub_229309340();
      sub_229309020();
      swift_bridgeObjectRelease();
      sub_229309020();
      sub_229309020();
      swift_bridgeObjectRelease();
      sub_229309020();
      if (!v1) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 2:
      OUTLINED_FUNCTION_0_1();
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_3();
      uint64_t v13 = v4 + 12;
      unint64_t v14 = 0x8000000229309EC0;
      sub_229308E30();
      sub_229308DE0();
      swift_release();
      sub_229309020();
      swift_release();
      goto LABEL_11;
    case 3:
      sub_2292F767C((uint64_t)v15, (uint64_t)&v13);
      sub_2292F767C((uint64_t)v16, (uint64_t)v12);
      v9[0] = 0;
      v9[1] = 0xE000000000000000;
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_3();
      uint64_t v10 = v5;
      unint64_t v11 = 0x8000000229309EA0;
      sub_2292F76E4((uint64_t)&v13, (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD98);
      sub_229309000();
      sub_229309020();
      swift_bridgeObjectRelease();
      sub_229309020();
      sub_2292F76E4((uint64_t)v12, (uint64_t)v9);
      sub_229309000();
      sub_229309020();
      swift_bridgeObjectRelease();
      uint64_t v6 = v10;
      sub_2292F70E8((uint64_t)v12);
      sub_2292F70E8((uint64_t)&v13);
      return v6;
    default:
      id v1 = (void *)v15[0];
      OUTLINED_FUNCTION_0_1();
      sub_229309170();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_3();
      uint64_t v13 = v2;
      unint64_t v14 = 0x8000000229309F10;
      if (v1)
      {
LABEL_9:
        id v7 = objc_msgSend(v1, sel_predicateFormat);
        sub_229308FF0();
      }
LABEL_10:
      sub_229309020();

LABEL_11:
      swift_bridgeObjectRelease();
      return v13;
  }
}

unint64_t RROrdinalDirection.rawValue.getter()
{
  unint64_t result = 1413891404;
  switch(*v0)
  {
    case 1:
      uint64_t v2 = 1212631378;
      goto LABEL_6;
    case 2:
      unint64_t result = 5263188;
      break;
    case 3:
      unint64_t result = 0x4D4F54544F42;
      break;
    case 4:
      uint64_t v2 = 1313821254;
LABEL_6:
      unint64_t result = v2 & 0xFFFF0000FFFFFFFFLL | 0x5400000000;
      break;
    case 5:
      unint64_t result = 1262698818;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292F7644(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2292F767C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292F76E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26830FD98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t RRQueryOption.description.getter()
{
  if (*v0) {
    return 0x446564756C636E49;
  }
  else {
    return 0x656C706D6953;
  }
}

SiriReferenceResolutionDataModel::RRQueryOption_optional __swiftcall RRQueryOption.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *id v1 = v2;
  return (SiriReferenceResolutionDataModel::RRQueryOption_optional)rawValue;
}

uint64_t RRQueryOption.rawValue.getter()
{
  return *v0;
}

uint64_t sub_2292F77B4()
{
  return sub_2292F8CC4();
}

uint64_t sub_2292F77BC()
{
  return sub_2292F9274();
}

SiriReferenceResolutionDataModel::RRQueryOption_optional sub_2292F77C4(Swift::Int *a1)
{
  return RRQueryOption.init(rawValue:)(*a1);
}

uint64_t sub_2292F77CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RRQueryOption.rawValue.getter();
  *a1 = result;
  return result;
}

SiriReferenceResolutionDataModel::RROrdinalDirection_optional __swiftcall RROrdinalDirection.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_229309200();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *char v2 = v5;
  return result;
}

uint64_t sub_2292F7854(unsigned __int8 *a1, char *a2)
{
  return sub_2292F847C(*a1, *a2);
}

uint64_t sub_2292F7860()
{
  return sub_2292F8D04(*v0);
}

uint64_t sub_2292F7868()
{
  return sub_2292F8D7C();
}

uint64_t sub_2292F7870(uint64_t a1)
{
  return sub_2292F9380(a1, *v1);
}

SiriReferenceResolutionDataModel::RROrdinalDirection_optional sub_2292F7878(Swift::String *a1)
{
  return RROrdinalDirection.init(rawValue:)(*a1);
}

unint64_t sub_2292F7884@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = RROrdinalDirection.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2292F78AC()
{
  return sub_229309050();
}

uint64_t sub_2292F790C()
{
  return sub_229309030();
}

uint64_t RRExperimentFilter.appBundleId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RRExperimentFilter.actions.getter()
{
  return swift_bridgeObjectRetain();
}

SiriReferenceResolutionDataModel::RRExperimentFilter __swiftcall RRExperimentFilter.init(appBundleId:actions:)(Swift::String appBundleId, Swift::OpaquePointer actions)
{
  *(Swift::String *)uint64_t v2 = appBundleId;
  *(Swift::OpaquePointer *)(v2 + 16) = actions;
  result.appBundleId = appBundleId;
  result.actions = actions;
  return result;
}

unint64_t sub_2292F79A4()
{
  unint64_t result = qword_26830FE10;
  if (!qword_26830FE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE10);
  }
  return result;
}

unint64_t sub_2292F79F4()
{
  unint64_t result = qword_26830FE18;
  if (!qword_26830FE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE18);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RRMetadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for RRQuery(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 >= 4) {
    unsigned int v2 = *(_DWORD *)a1 + 4;
  }
  switch(v2)
  {
    case 1u:
      uint64_t v3 = *(void **)(a1 + 16);
      goto LABEL_6;
    case 2u:
      swift_release();
      break;
    case 3u:
      if (*(void *)(a1 + 24)) {
        __swift_destroy_boxed_opaque_existential_0Tm(a1);
      }
      if (*(void *)(a1 + 56))
      {
        __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
      }
      break;
    default:
      uint64_t v3 = *(void **)a1;
LABEL_6:

      break;
  }
}

uint64_t initializeWithCopy for RRQuery(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 64);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a2 + 4;
  }
  switch(v4)
  {
    case 1u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      char v5 = *(void **)(a2 + 16);
      *(void *)(a1 + 16) = v5;
      *(unsigned char *)(a1 + 64) = 1;
      goto LABEL_6;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 64) = 2;
      swift_retain();
      break;
    case 3u:
      uint64_t v7 = *(void *)(a2 + 24);
      if (v7)
      {
        *(void *)(a1 + 24) = v7;
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      }
      else
      {
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
      }
      uint64_t v9 = (_OWORD *)(a1 + 32);
      uint64_t v10 = (_OWORD *)(a2 + 32);
      uint64_t v11 = *(void *)(a2 + 56);
      if (v11)
      {
        *(void *)(a1 + 56) = v11;
        (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v9, v10);
      }
      else
      {
        long long v12 = *(_OWORD *)(a2 + 48);
        _OWORD *v9 = *v10;
        *(_OWORD *)(a1 + 48) = v12;
      }
      *(unsigned char *)(a1 + 64) = 3;
      break;
    default:
      char v5 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 64) = 0;
LABEL_6:
      id v6 = v5;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for RRQuery(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 64);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
        char v5 = *(void **)(a1 + 16);
        goto LABEL_7;
      case 2u:
        swift_release();
        break;
      case 3u:
        if (*(void *)(a1 + 24)) {
          __swift_destroy_boxed_opaque_existential_0Tm(a1);
        }
        if (*(void *)(a1 + 56)) {
          __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
        }
        break;
      default:
        char v5 = *(void **)a1;
LABEL_7:

        break;
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 64);
    if (v6 >= 4) {
      unsigned int v6 = *(_DWORD *)a2 + 4;
    }
    switch(v6)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        uint64_t v7 = *(void **)(a2 + 16);
        *(void *)(a1 + 16) = v7;
        *(unsigned char *)(a1 + 64) = 1;
        goto LABEL_18;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 64) = 2;
        swift_retain();
        break;
      case 3u:
        uint64_t v9 = *(void *)(a2 + 24);
        if (v9)
        {
          *(void *)(a1 + 24) = v9;
          (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
        }
        else
        {
          long long v10 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v10;
        }
        uint64_t v11 = (_OWORD *)(a1 + 32);
        long long v12 = (_OWORD *)(a2 + 32);
        uint64_t v13 = *(void *)(a2 + 56);
        if (v13)
        {
          *(void *)(a1 + 56) = v13;
          (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
        }
        else
        {
          long long v14 = *(_OWORD *)(a2 + 48);
          *uint64_t v11 = *v12;
          *(_OWORD *)(a1 + 48) = v14;
        }
        *(unsigned char *)(a1 + 64) = 3;
        break;
      default:
        uint64_t v7 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 64) = 0;
LABEL_18:
        id v8 = v7;
        break;
    }
  }
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t assignWithTake for RRQuery(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 64);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
        char v5 = *(void **)(a1 + 16);
        goto LABEL_7;
      case 2u:
        swift_release();
        break;
      case 3u:
        if (*(void *)(a1 + 24)) {
          __swift_destroy_boxed_opaque_existential_0Tm(a1);
        }
        if (*(void *)(a1 + 56)) {
          __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
        }
        break;
      default:
        char v5 = *(void **)a1;
LABEL_7:

        break;
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 64);
    if (v6 >= 4) {
      unsigned int v6 = *(_DWORD *)a2 + 4;
    }
    switch(v6)
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        char v7 = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v7 = 2;
        break;
      case 3u:
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        long long v9 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v9;
        char v7 = 3;
        break;
      default:
        char v7 = 0;
        *(void *)a1 = *(void *)a2;
        break;
    }
    *(unsigned char *)(a1 + 64) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RRQuery(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 >= 4) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RRQuery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2292F8080(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 64);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_2292F809C(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 64) = a2;
  return result;
}

void type metadata accessor for RRQuery()
{
}

unsigned char *storeEnumTagSinglePayload for RRQueryOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2292F819CLL);
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

void type metadata accessor for RRQueryOption()
{
}

unsigned char *storeEnumTagSinglePayload for RROrdinalDirection(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x2292F829CLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void type metadata accessor for RROrdinalDirection()
{
}

uint64_t destroy for RRExperimentFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s32SiriReferenceResolutionDataModel18RRExperimentFilterVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RRExperimentFilter(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RRExperimentFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for RRExperimentFilter()
{
}

unint64_t sub_2292F840C()
{
  unint64_t result = qword_26830FE20;
  if (!qword_26830FE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE20);
  }
  return result;
}

uint64_t sub_2292F847C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1413891404;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1413891404;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v6 = 1212631378;
      goto LABEL_6;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 5263188;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x4D4F54544F42;
      break;
    case 4:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v6 = 1313821254;
LABEL_6:
      unint64_t v5 = v6 & 0xFFFF0000FFFFFFFFLL | 0x5400000000;
      break;
    case 5:
      unint64_t v5 = 1262698818;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE500000000000000;
      uint64_t v8 = 1212631378;
      goto LABEL_13;
    case 2:
      unint64_t v7 = 0xE300000000000000;
      unint64_t v2 = 5263188;
      break;
    case 3:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v2 = 0x4D4F54544F42;
      break;
    case 4:
      unint64_t v7 = 0xE500000000000000;
      uint64_t v8 = 1313821254;
LABEL_13:
      unint64_t v2 = v8 & 0xFFFF0000FFFFFFFFLL | 0x5400000000;
      break;
    case 5:
      unint64_t v2 = 1262698818;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_229309350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_2292F8610(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  unint64_t v4 = 25705;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x6C646E7542707061;
      uint64_t v5 = 6572389;
      goto LABEL_10;
    case 2:
      unint64_t v4 = 0x7469746E456F7375;
      unint64_t v3 = 0xE900000000000079;
      break;
    case 3:
      unint64_t v4 = 0x6C61566465707974;
      unint64_t v3 = 0xEA00000000006575;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v4 = 0x6570795461746164;
      break;
    case 5:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1635017060;
      break;
    case 6:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v4 = 0x70756F7267;
      break;
    case 7:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v4 = 0x617461646174656DLL;
      break;
    case 8:
      unint64_t v4 = 0x697461746F6E6E61;
      uint64_t v5 = 7564911;
LABEL_10:
      unint64_t v3 = v5 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    case 9:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v4 = 0x644972657375;
      break;
    case 10:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v4 = 0x65726F6373;
      break;
    case 11:
      unint64_t v3 = 0x8000000229309A60;
      unint64_t v4 = 0xD000000000000012;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE200000000000000;
  unint64_t v7 = 25705;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x6C646E7542707061;
      uint64_t v8 = 6572389;
      goto LABEL_23;
    case 2:
      unint64_t v7 = 0x7469746E456F7375;
      unint64_t v6 = 0xE900000000000079;
      break;
    case 3:
      unint64_t v7 = 0x6C61566465707974;
      unint64_t v6 = 0xEA00000000006575;
      break;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v7 = 0x6570795461746164;
      break;
    case 5:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v7 = 1635017060;
      break;
    case 6:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v7 = 0x70756F7267;
      break;
    case 7:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v7 = 0x617461646174656DLL;
      break;
    case 8:
      unint64_t v7 = 0x697461746F6E6E61;
      uint64_t v8 = 7564911;
LABEL_23:
      unint64_t v6 = v8 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    case 9:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v7 = 0x644972657375;
      break;
    case 10:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v7 = 0x65726F6373;
      break;
    case 11:
      unint64_t v6 = 0x8000000229309A60;
      unint64_t v7 = 0xD000000000000012;
      break;
    default:
      break;
  }
  if (v4 == v7 && v3 == v6) {
    char v10 = 1;
  }
  else {
    char v10 = sub_229309350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_2292F8938(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB00000000744164;
  unint64_t v3 = 0x656E6F69746E656DLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x656E6F69746E656DLL;
  unint64_t v6 = 0xEB00000000744164;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x6E65657263736E6FLL;
      unint64_t v6 = 0xEA00000000007441;
      break;
    case 2:
      unint64_t v5 = 0x756F726765726F66;
      unint64_t v6 = 0xEE0074416465646ELL;
      break;
    case 3:
      unint64_t v6 = 0x8000000229309A90;
      unint64_t v5 = 0xD000000000000016;
      break;
    case 4:
      unint64_t v5 = 0x6979616C50776F6ELL;
      unint64_t v6 = 0xEC0000007441676ELL;
      break;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x744179627261656ELL;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x6E65657263736E6FLL;
      unint64_t v2 = 0xEA00000000007441;
      break;
    case 2:
      OUTLINED_FUNCTION_44_0();
      break;
    case 3:
      unint64_t v2 = 0x8000000229309A90;
      unint64_t v3 = 0xD000000000000016;
      break;
    case 4:
      unint64_t v3 = 0x6979616C50776F6ELL;
      unint64_t v2 = 0xEC0000007441676ELL;
      break;
    case 5:
      unint64_t v2 = 0xE800000000000000;
      unint64_t v3 = 0x744179627261656ELL;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_229309350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2292F8B58(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 1769105779;
  }
  else {
    uint64_t v2 = 1919251317;
  }
  if (a2) {
    uint64_t v3 = 1769105779;
  }
  else {
    uint64_t v3 = 1919251317;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_229309350();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_2292F8BC8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64616F6C796170;
  }
  else {
    uint64_t v3 = 1702060386;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64616F6C796170;
  }
  else {
    uint64_t v5 = 1702060386;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_229309350();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2292F8C64(char a1)
{
  return sub_229309420();
}

uint64_t sub_2292F8CAC(uint64_t a1)
{
  return sub_2292F8D1C(a1, (void (*)(unsigned char *, uint64_t))sub_2292F8FF4);
}

uint64_t sub_2292F8CC4()
{
  return sub_229309420();
}

uint64_t sub_2292F8D04(uint64_t a1)
{
  return sub_2292F8D1C(a1, (void (*)(unsigned char *, uint64_t))sub_2292F8D7C);
}

uint64_t sub_2292F8D1C(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_14_2();
  a2(v5, a1);
  return sub_229309420();
}

uint64_t sub_2292F8D64()
{
  return sub_2292F91B8();
}

uint64_t sub_2292F8D70()
{
  return sub_2292F92B8();
}

uint64_t sub_2292F8D7C()
{
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F8E50()
{
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F8FF4(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 2:
      OUTLINED_FUNCTION_44_0();
      break;
    default:
      break;
  }
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F910C()
{
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F9154()
{
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292F91B8()
{
  return sub_229309420();
}

uint64_t sub_2292F9230()
{
  return sub_229309420();
}

uint64_t sub_2292F9274()
{
  return sub_229309420();
}

uint64_t sub_2292F92B8()
{
  return sub_229309420();
}

uint64_t sub_2292F931C(uint64_t a1, uint64_t a2)
{
  return sub_2292F9398(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2292F8FF4);
}

uint64_t sub_2292F9334(uint64_t a1, char a2)
{
  return sub_229309420();
}

uint64_t sub_2292F9380(uint64_t a1, uint64_t a2)
{
  return sub_2292F9398(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2292F8D7C);
}

uint64_t sub_2292F9398(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_2293093E0();
  a3(v6, a2);
  return sub_229309420();
}

BOOL static RRMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a1;
  double v5 = *(double *)(a1 + 8);
  double v6 = *(double *)(a1 + 16);
  double v7 = *(double *)(a1 + 24);
  double v9 = *(double *)a2;
  double v8 = *(double *)(a2 + 8);
  double v11 = *(double *)(a2 + 16);
  double v10 = *(double *)(a2 + 24);
  long long v12 = *(_OWORD *)(a2 + 32);
  int v13 = *(unsigned __int8 *)(a2 + 48);
  switch(*(unsigned char *)(a1 + 48))
  {
    case 1:
      if (v13 != 1 || *(void *)(*(void *)&v4 + 16) != *(void *)(*(void *)&v9 + 16)) {
        return 0;
      }
      uint64_t v17 = swift_bridgeObjectRetain();
      sub_2292FAAA4(v17);
      uint64_t v18 = swift_bridgeObjectRetain();
      sub_2292FAAA4(v18);
      uint64_t v19 = OUTLINED_FUNCTION_21();
      sub_2292FAB60(v19, v20);
      char v22 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v22 & 1;
    case 2:
      BOOL v24 = LOBYTE(v9) == LOBYTE(v4);
      BOOL v25 = v13 == 2;
      return v25 && v24;
    case 3:
      if (v13 != 3) {
        return 0;
      }
      v33.f64[0] = v4;
      v33.f64[1] = v5;
      double v34 = v6;
      double v35 = v7;
      long long v36 = *(_OWORD *)(a1 + 32);
      v29.f64[0] = v9;
      v29.f64[1] = v8;
      double v30 = v11;
      double v31 = v10;
      long long v32 = v12;
      return static RRViewLocationMetadataValue.== infix(_:_:)(&v33, &v29);
    case 4:
      BOOL v24 = LOBYTE(v9) == LOBYTE(v4);
      BOOL v25 = v13 == 4;
      return v25 && v24;
    case 5:
      if (v13 != 5) {
        return 0;
      }
      if (*(void *)&v4 != *(void *)&v9 || *(void *)&v5 != *(void *)&v8)
      {
        char v27 = sub_229309350();
        BOOL v16 = 0;
        if ((v27 & 1) == 0) {
          return v16;
        }
      }
      if (v7 == 0.0)
      {
        if (v10 == 0.0) {
          return 1;
        }
      }
      else if (v10 != 0.0)
      {
        BOOL v28 = *(void *)&v6 == *(void *)&v11 && *(void *)&v7 == *(void *)&v10;
        if (v28 || (sub_229309350() & 1) != 0) {
          return 1;
        }
      }
      return 0;
    default:
      if (v13) {
        return 0;
      }
      BOOL v14 = v4 == v9 && v5 == v8;
      if (!v14 || v6 != v11) {
        return 0;
      }
      return v7 == v10;
  }
}

BOOL static RRBoundingBoxMetadataValue.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t static RRSurroundingTextsMetadataValue.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) != *(void *)(*(void *)a2 + 16)) {
    return 0;
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_2292FAAA4(v2);
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_2292FAAA4(v4);
  sub_2292FAB60(v3, v5);
  char v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

BOOL static RRDataSourceMetadataValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL static RRViewLocationMetadataValue.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  BOOL result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), (int32x4_t)vceqq_f64(a1[1], a2[1]))), 0xFuLL))) & 1) != 0&& a1[2].f64[0] == a2[2].f64[0])
  {
    return a1[2].f64[1] == a2[2].f64[1];
  }
  return result;
}

BOOL static RRViewState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t static RRDisplayRepresentation.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_229309350(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if (v4)
      {
        BOOL v9 = v2 == v5 && v3 == v4;
        if (v9 || (sub_229309350() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v4)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t RRMetadata.hash(into:)(uint64_t a1)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  switch(*(unsigned char *)(v1 + 48))
  {
    case 1:
      sub_2293093F0();
      swift_bridgeObjectRetain();
      sub_22930016C(a1, v2);
      uint64_t result = sub_2292E7BF0(v2, v3, v5, v4, v6, v7, 1);
      break;
    case 2:
    case 4:
      sub_2293093F0();
      uint64_t result = sub_2293093F0();
      break;
    case 3:
      sub_2293093F0();
      uint64_t result = RRViewLocationMetadataValue.hash(into:)();
      break;
    case 5:
      sub_2293093F0();
      swift_bridgeObjectRetain();
      sub_229309010();
      swift_bridgeObjectRelease();
      if (v4)
      {
        sub_229309400();
        swift_bridgeObjectRetain();
        sub_229309010();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t result = sub_229309400();
      }
      break;
    default:
      sub_2293093F0();
      sub_229309410();
      sub_229309410();
      sub_229309410();
      uint64_t result = sub_229309410();
      break;
  }
  return result;
}

uint64_t RRMetadata.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 48);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  long long v7 = v0[2];
  char v8 = v1;
  OUTLINED_FUNCTION_14_2();
  RRMetadata.hash(into:)((uint64_t)v4);
  return sub_229309420();
}

uint64_t sub_2292F9A1C()
{
  uint64_t v0 = sub_229309200();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_2292F9A74(char a1)
{
  if (a1) {
    return 0x64616F6C796170;
  }
  else {
    return 1702060386;
  }
}

unint64_t sub_2292F9AA4(unint64_t result)
{
  if (result >= 6) {
    return 6;
  }
  return result;
}

uint64_t sub_2292F9AB4(uint64_t result)
{
  return result;
}

uint64_t sub_2292F9AC8()
{
  char v1 = *((unsigned char *)v0 + 48);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  long long v7 = v0[2];
  char v8 = v1;
  sub_2293093E0();
  RRMetadata.hash(into:)((uint64_t)v4);
  return sub_229309420();
}

uint64_t sub_2292F9B20(char *a1, char *a2)
{
  return sub_2292F8BC8(*a1, *a2);
}

uint64_t sub_2292F9B2C()
{
  return sub_2292F8D64();
}

uint64_t sub_2292F9B34()
{
  return sub_2292F9154();
}

uint64_t sub_2292F9B3C()
{
  return sub_2292F91B8();
}

uint64_t sub_2292F9B44@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292F9A1C();
  *a1 = result;
  return result;
}

uint64_t sub_2292F9B74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2292F9A74(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2292F9BA0()
{
  return sub_2292F9A74(*v0);
}

uint64_t sub_2292F9BA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292F9A70();
  *a1 = result;
  return result;
}

uint64_t sub_2292F9BD0(uint64_t a1)
{
  unint64_t v2 = sub_22930022C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292F9C0C(uint64_t a1)
{
  unint64_t v2 = sub_22930022C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292F9C48()
{
  return sub_2292F9230();
}

unint64_t sub_2292F9C50@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_2292F9AA4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_2292F9C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2292F9AB4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2292F9CA8()
{
  return sub_229309060();
}

uint64_t sub_2292F9D08()
{
  return sub_229309040();
}

void RRMetadata.init(from:)()
{
  OUTLINED_FUNCTION_2();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9048);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_46();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_22930022C();
  sub_229309450();
  if (!v0)
  {
    sub_229300278();
    OUTLINED_FUNCTION_1_4();
    switch((char)v22)
    {
      case 1:
        OUTLINED_FUNCTION_25_1();
        sub_2293003F4();
        OUTLINED_FUNCTION_1_4();
        uint64_t v8 = OUTLINED_FUNCTION_12_2();
        v9(v8);
        uint64_t v10 = 0;
        uint64_t v11 = v22;
        goto LABEL_11;
      case 2:
        OUTLINED_FUNCTION_25_1();
        sub_2293003A8();
        OUTLINED_FUNCTION_1_4();
        uint64_t v12 = OUTLINED_FUNCTION_12_2();
        v13(v12);
        goto LABEL_10;
      case 3:
        OUTLINED_FUNCTION_25_1();
        sub_22930035C();
        OUTLINED_FUNCTION_1_4();
        uint64_t v14 = OUTLINED_FUNCTION_12_2();
        v15(v14);
        uint64_t v11 = v22;
        uint64_t v10 = v23;
        long long v16 = v24;
        long long v17 = v25;
        goto LABEL_14;
      case 4:
        OUTLINED_FUNCTION_25_1();
        sub_229300310();
        OUTLINED_FUNCTION_1_4();
        uint64_t v18 = OUTLINED_FUNCTION_26_1();
        v19(v18);
LABEL_10:
        uint64_t v10 = 0;
        uint64_t v11 = v22;
LABEL_11:
        long long v16 = 0uLL;
        long long v17 = 0uLL;
        goto LABEL_14;
      case 5:
        OUTLINED_FUNCTION_25_1();
        sub_2293002C4();
        OUTLINED_FUNCTION_1_4();
        uint64_t v20 = OUTLINED_FUNCTION_26_1();
        v21(v20);
        goto LABEL_13;
      default:
        sub_229300440();
        OUTLINED_FUNCTION_1_4();
        uint64_t v6 = OUTLINED_FUNCTION_12_2();
        v7(v6);
LABEL_13:
        uint64_t v11 = v22;
        uint64_t v10 = v23;
        long long v17 = 0uLL;
        long long v16 = v24;
LABEL_14:
        *(void *)uint64_t v4 = v11;
        *(void *)(v4 + 8) = v10;
        *(_OWORD *)(v4 + 16) = v16;
        *(_OWORD *)(v4 + 32) = v17;
        *(unsigned char *)(v4 + 48) = v22;
        break;
    }
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_1();
}

uint64_t RRMetadata.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9090);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4();
  uint64_t v5 = *(unsigned __int8 *)(v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22930022C();
  sub_229309470();
  switch(v5)
  {
    case 1:
      sub_22930048C();
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        sub_229300608();
        goto LABEL_14;
      }
      break;
    case 2:
      OUTLINED_FUNCTION_46_0(2);
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        OUTLINED_FUNCTION_25_1();
        sub_2293005BC();
        goto LABEL_14;
      }
      break;
    case 3:
      OUTLINED_FUNCTION_46_0(3);
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        OUTLINED_FUNCTION_25_1();
        sub_229300570();
        goto LABEL_14;
      }
      break;
    case 4:
      OUTLINED_FUNCTION_46_0(4);
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        OUTLINED_FUNCTION_25_1();
        sub_229300524();
        goto LABEL_14;
      }
      break;
    case 5:
      OUTLINED_FUNCTION_46_0(5);
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        OUTLINED_FUNCTION_25_1();
        sub_2293004D8();
        goto LABEL_14;
      }
      break;
    default:
      sub_22930048C();
      OUTLINED_FUNCTION_3_1();
      if (!v2)
      {
        sub_229300654();
LABEL_14:
        OUTLINED_FUNCTION_3_1();
      }
      break;
  }
  OUTLINED_FUNCTION_4_0();
  return v6();
}

void sub_2292FA2D4()
{
}

uint64_t sub_2292FA2EC(void *a1)
{
  return RRMetadata.encode(to:)(a1);
}

double RRBoundingBoxMetadataValue.xCoordinate.getter()
{
  return *(double *)v0;
}

double RRBoundingBoxMetadataValue.yCoordinate.getter()
{
  return *(double *)(v0 + 8);
}

double RRBoundingBoxMetadataValue.width.getter()
{
  return *(double *)(v0 + 16);
}

double RRBoundingBoxMetadataValue.height.getter()
{
  return *(double *)(v0 + 24);
}

void RRBoundingBoxMetadataValue.init(xCoordinate:yCoordinate:width:height:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

uint64_t RRBoundingBoxMetadataValue.hash(into:)()
{
  return sub_229309410();
}

uint64_t sub_2292FA39C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_229309350() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
      if (v7 || (sub_229309350() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x746867696568 && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_229309350();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_2292FA54C()
{
  return 4;
}

uint64_t sub_2292FA554(char a1)
{
  uint64_t result = 0x6E6964726F6F4378;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E6964726F6F4379;
      break;
    case 2:
      uint64_t result = 0x6874646977;
      break;
    case 3:
      uint64_t result = 0x746867696568;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292FA5DC()
{
  return sub_2292FA554(*v0);
}

uint64_t sub_2292FA5E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FA39C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FA60C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292FA54C();
  *a1 = result;
  return result;
}

uint64_t sub_2292FA634(uint64_t a1)
{
  unint64_t v2 = sub_2293006A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FA670(uint64_t a1)
{
  unint64_t v2 = sub_2293006A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRBoundingBoxMetadataValue.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FE78);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_28_1();
  sub_2293006A0();
  OUTLINED_FUNCTION_27_0();
  sub_2293006EC();
  OUTLINED_FUNCTION_4_2();
  if (!v0)
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
  }
  OUTLINED_FUNCTION_23_2();
  return v2();
}

uint64_t RRBoundingBoxMetadataValue.hashValue.getter()
{
  return sub_229309420();
}

uint64_t RRBoundingBoxMetadataValue.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FE90);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_1();
  sub_2293006A0();
  sub_229309450();
  if (!v2)
  {
    sub_229300738();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_17_1();
    v7();
    *a2 = v8;
    a2[1] = v8;
    a2[2] = v8;
    a2[3] = v8;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_2292FAA10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return RRBoundingBoxMetadataValue.init(from:)(a1, a2);
}

uint64_t sub_2292FAA28()
{
  return RRBoundingBoxMetadataValue.encode(to:)();
}

uint64_t sub_2292FAA4C()
{
  return sub_229309420();
}

uint64_t RRSurroundingTextsMetadataValue.texts.getter()
{
  return swift_bridgeObjectRetain();
}

SiriReferenceResolutionDataModel::RRSurroundingTextsMetadataValue __swiftcall RRSurroundingTextsMetadataValue.init(texts:)(SiriReferenceResolutionDataModel::RRSurroundingTextsMetadataValue texts)
{
  v1->texts._rawValue = texts.texts._rawValue;
  return texts;
}

uint64_t sub_2292FAAA4(uint64_t a1)
{
  sub_2292E7B78();
  uint64_t v2 = sub_2293090D0();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 32;
    do
    {
      long long v5 = *(_OWORD *)(a1 + v4 + 16);
      v10[0] = *(_OWORD *)(a1 + v4);
      v10[1] = v5;
      v10[2] = *(_OWORD *)(a1 + v4 + 32);
      sub_2292E7BC4((uint64_t)v10);
      sub_2292FF65C((uint64_t)v8, (uint64_t)v10);
      swift_bridgeObjectRelease();
      v4 += 48;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_2292FAB60(uint64_t a1, uint64_t a2)
{
  if (a1 != a2 && *(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v33 = a1 + 56;
    uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & v5;
    int64_t v34 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v9 = a2 + 56;
    if ((v7 & v5) != 0) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
    }
    else
    {
      if (v12 >= v34) {
        return;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v12);
      int64_t v14 = v4 + 1;
      if (v13) {
        goto LABEL_27;
      }
      OUTLINED_FUNCTION_42_1();
      if (v15 == v16) {
        return;
      }
      OUTLINED_FUNCTION_41_1();
      if (v13) {
        goto LABEL_27;
      }
      OUTLINED_FUNCTION_42_1();
      if (v15 == v16) {
        return;
      }
      OUTLINED_FUNCTION_41_1();
      if (v13) {
        goto LABEL_27;
      }
      OUTLINED_FUNCTION_42_1();
      if (v15 == v16) {
        return;
      }
      OUTLINED_FUNCTION_41_1();
      if (v13) {
        goto LABEL_27;
      }
      int64_t v18 = v17 + 4;
      if (v18 >= v34) {
        return;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v18);
      if (v13)
      {
        int64_t v14 = v18;
LABEL_27:
        unint64_t v8 = (v13 - 1) & v13;
        int64_t v35 = v14;
        for (unint64_t i = __clz(__rbit64(v13)) + (v14 << 6); ; unint64_t i = v10 | (v4 << 6))
        {
          uint64_t v20 = *(void *)(a1 + 48) + 48 * i;
          uint64_t v22 = *(void *)v20;
          uint64_t v21 = *(void *)(v20 + 8);
          float64x2_t v38 = *(float64x2_t *)(v20 + 16);
          float64x2_t v39 = *(float64x2_t *)(v20 + 32);
          sub_2293093E0();
          swift_bridgeObjectRetain();
          RRSurroundingText.hash(into:)();
          uint64_t v23 = sub_229309420();
          uint64_t v24 = -1 << *(unsigned char *)(a2 + 32);
          unint64_t v25 = v23 & ~v24;
          if (((*(void *)(v9 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          {
LABEL_43:
            swift_bridgeObjectRelease();
            return;
          }
          uint64_t v26 = ~v24;
          uint64_t v27 = *(void *)(a2 + 48);
          while (1)
          {
            uint64_t v28 = v27 + 48 * v25;
            if (*(void *)v28 != v22 || *(void *)(v28 + 8) != v21) {
              break;
            }
            OUTLINED_FUNCTION_18_2((int32x4_t)vceqq_f64(*(float64x2_t *)(v28 + 16), v38), (int32x4_t)vceqq_f64(*(float64x2_t *)(v28 + 32), v39));
            if (v32) {
              goto LABEL_40;
            }
LABEL_38:
            unint64_t v25 = (v25 + 1) & v26;
            if (((*(void *)(v9 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0) {
              goto LABEL_43;
            }
          }
          float64x2_t v36 = *(float64x2_t *)(v28 + 16);
          float64x2_t v37 = *(float64x2_t *)(v28 + 32);
          sub_229309350();
          OUTLINED_FUNCTION_18_2((int32x4_t)vceqq_f64(v36, v38), (int32x4_t)vceqq_f64(v37, v39));
          if ((v31 & 1) == 0 || (v30 & 1) == 0) {
            goto LABEL_38;
          }
LABEL_40:
          swift_bridgeObjectRelease();
          uint64_t v4 = v35;
          if (!v8) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v10 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          int64_t v35 = v4;
        }
      }
      while (!__OFADD__(v18, 1))
      {
        OUTLINED_FUNCTION_42_1();
        if (v15 == v16) {
          return;
        }
        OUTLINED_FUNCTION_41_1();
        int64_t v18 = v19 + 1;
        if (v13) {
          goto LABEL_27;
        }
      }
    }
    __break(1u);
  }
}

uint64_t RRSurroundingTextsMetadataValue.hash(into:)()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  sub_22930016C(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292FAE54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7374786574 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_229309350();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2292FAED4()
{
  return 0x7374786574;
}

uint64_t sub_2292FAEE8()
{
  return sub_2292FC3E4();
}

uint64_t sub_2292FAF04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FAE54(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2292FAF30(uint64_t a1)
{
  unint64_t v2 = sub_229300784();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FAF6C(uint64_t a1)
{
  unint64_t v2 = sub_229300784();
  return MEMORY[0x270FA00B8](a1, v2);
}

void RRSurroundingTextsMetadataValue.encode(to:)()
{
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEA0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_28_1();
  sub_229300784();
  OUTLINED_FUNCTION_27_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEB0);
  sub_22930081C(&qword_26830FEB8, (void (*)(void))sub_2293007D0);
  sub_229309330();
  OUTLINED_FUNCTION_23_2();
  v1();
  OUTLINED_FUNCTION_1();
}

uint64_t RRSurroundingTextsMetadataValue.hashValue.getter()
{
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_14_2();
  swift_bridgeObjectRetain();
  sub_22930016C((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_229309420();
}

void RRSurroundingTextsMetadataValue.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11;
  int64_t v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_10_1();
  sub_229300784();
  OUTLINED_FUNCTION_37_1();
  if (!v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEB0);
    sub_22930081C(&qword_26830FED0, (void (*)(void))sub_22930088C);
    sub_2293092A0();
    OUTLINED_FUNCTION_17_1();
    v16();
    *int64_t v14 = a10;
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v12);
  OUTLINED_FUNCTION_1();
}

void sub_2292FB254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RRSurroundingTextsMetadataValue.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_2292FB26C()
{
}

uint64_t sub_2292FB290()
{
  uint64_t v1 = *v0;
  sub_2293093E0();
  swift_bridgeObjectRetain();
  sub_22930016C((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_229309420();
}

uint64_t RRSurroundingText.text.getter()
{
  return OUTLINED_FUNCTION_21();
}

__n128 RRSurroundingText.boundingBox.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 16);
  long long v3 = *(_OWORD *)(v1 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 RRSurroundingText.init(text:boundingBox:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  __n128 result = *(__n128 *)a3;
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(a4 + 32) = v5;
  return result;
}

uint64_t static RRSurroundingText.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  float64x2_t v2 = *(float64x2_t *)(a1 + 16);
  float64x2_t v3 = *(float64x2_t *)(a1 + 32);
  float64x2_t v5 = *(float64x2_t *)(a2 + 16);
  float64x2_t v4 = *(float64x2_t *)(a2 + 32);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    goto LABEL_6;
  }
  float64x2_t v13 = *(float64x2_t *)(a1 + 32);
  float64x2_t v11 = *(float64x2_t *)(a2 + 32);
  float64x2_t v12 = *(float64x2_t *)(a1 + 16);
  float64x2_t v10 = *(float64x2_t *)(a2 + 16);
  char v7 = sub_229309350();
  float64x2_t v5 = v10;
  float64x2_t v4 = v11;
  float64x2_t v2 = v12;
  float64x2_t v3 = v13;
  char v8 = 0;
  if (v7) {
LABEL_6:
  }
    OUTLINED_FUNCTION_18_2((int32x4_t)vceqq_f64(v2, v5), (int32x4_t)vceqq_f64(v3, v4));
  return v8 & 1;
}

uint64_t RRSurroundingText.hash(into:)()
{
  return sub_229309410();
}

uint64_t sub_2292FB440(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69646E756F62 && a2 == 0xEB00000000786F42)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2292FB538(char a1)
{
  if (a1) {
    return 0x676E69646E756F62;
  }
  else {
    return 1954047348;
  }
}

uint64_t sub_2292FB570()
{
  return sub_2292F8CC4();
}

uint64_t sub_2292FB58C()
{
  return sub_2292FB538(*v0);
}

uint64_t sub_2292FB594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FB440(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FB5BC(uint64_t a1)
{
  unint64_t v2 = sub_2293008D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FB5F8(uint64_t a1)
{
  unint64_t v2 = sub_2293008D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRSurroundingText.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2293008D8();
  sub_229309470();
  sub_2293092F0();
  if (!v1)
  {
    sub_229300654();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_4_0();
  return v4();
}

uint64_t RRSurroundingText.hashValue.getter()
{
  return sub_229309420();
}

void RRSurroundingText.init(from:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_1();
  sub_2293008D8();
  OUTLINED_FUNCTION_24_1();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
  }
  else
  {
    LOBYTE(v10) = 0;
    uint64_t v6 = sub_229309260();
    uint64_t v8 = v7;
    sub_229300440();
    swift_bridgeObjectRetain();
    sub_2293092A0();
    OUTLINED_FUNCTION_17_1();
    v9();
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + 8) = v8;
    *(_OWORD *)(v4 + 16) = v10;
    *(_OWORD *)(v4 + 32) = v11;
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1();
}

void sub_2292FB96C()
{
}

uint64_t sub_2292FB984(void *a1)
{
  return RRSurroundingText.encode(to:)(a1);
}

uint64_t sub_2292FB9A8()
{
  return sub_229309420();
}

double RRViewLocationMetadataValue.xCoordinate.getter()
{
  return *(double *)v0;
}

double RRViewLocationMetadataValue.yCoordinate.getter()
{
  return *(double *)(v0 + 8);
}

double RRViewLocationMetadataValue.zCoordinate.getter()
{
  return *(double *)(v0 + 16);
}

double RRViewLocationMetadataValue.width.getter()
{
  return *(double *)(v0 + 24);
}

double RRViewLocationMetadataValue.height.getter()
{
  return *(double *)(v0 + 32);
}

double RRViewLocationMetadataValue.depth.getter()
{
  return *(double *)(v0 + 40);
}

void RRViewLocationMetadataValue.init(xCoordinate:yCoordinate:zCoordinate:width:height:depth:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
}

uint64_t RRViewLocationMetadataValue.hash(into:)()
{
  return sub_229309410();
}

uint64_t sub_2292FBAC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_229309350() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6964726F6F437ALL && a2 == 0xEB00000000657461;
      if (v7 || (sub_229309350() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
        if (v8 || (sub_229309350() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x746867696568 && a2 == 0xE600000000000000;
          if (v9 || (sub_229309350() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6874706564 && a2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_229309350();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2292FBD20()
{
  return 6;
}

uint64_t sub_2292FBD28(char a1)
{
  uint64_t result = 0x6E6964726F6F4378;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E6964726F6F4379;
      break;
    case 2:
      uint64_t result = 0x6E6964726F6F437ALL;
      break;
    case 3:
      uint64_t result = 0x6874646977;
      break;
    case 4:
      uint64_t result = 0x746867696568;
      break;
    case 5:
      uint64_t result = 0x6874706564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292FBDD0()
{
  return sub_2292FBD28(*v0);
}

uint64_t sub_2292FBDD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FBAC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FBE00@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292FBD20();
  *a1 = result;
  return result;
}

uint64_t sub_2292FBE28(uint64_t a1)
{
  unint64_t v2 = sub_229300924();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FBE64(uint64_t a1)
{
  unint64_t v2 = sub_229300924();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRViewLocationMetadataValue.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FEF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_28_1();
  sub_229300924();
  OUTLINED_FUNCTION_27_0();
  sub_2293006EC();
  OUTLINED_FUNCTION_4_2();
  if (!v0)
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
  }
  OUTLINED_FUNCTION_23_2();
  return v2();
}

uint64_t RRViewLocationMetadataValue.hashValue.getter()
{
  return sub_229309420();
}

uint64_t RRViewLocationMetadataValue.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_1();
  sub_229300924();
  OUTLINED_FUNCTION_24_1();
  if (!v2)
  {
    sub_229300738();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_17_1();
    v7();
    *a2 = v8;
    a2[1] = v8;
    a2[2] = v8;
    a2[3] = v8;
    a2[4] = v8;
    a2[5] = v8;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_2292FC294@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return RRViewLocationMetadataValue.init(from:)(a1, a2);
}

uint64_t sub_2292FC2AC()
{
  return RRViewLocationMetadataValue.encode(to:)();
}

uint64_t sub_2292FC2D0()
{
  return sub_229309420();
}

void RRViewState.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

SiriReferenceResolutionDataModel::RRViewState __swiftcall RRViewState.init(state:)(SiriReferenceResolutionDataModel::RRViewState state)
{
  *uint64_t v1 = *(unsigned char *)state.state;
  return state;
}

uint64_t RRViewState.hash(into:)()
{
  return sub_2293093F0();
}

uint64_t sub_2292FC364(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_229309350();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2292FC3E4()
{
  return sub_229309420();
}

uint64_t sub_2292FC420()
{
  return 0x6574617473;
}

uint64_t sub_2292FC438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FC364(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2292FC464(uint64_t a1)
{
  unint64_t v2 = sub_229300970();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FC4A0(uint64_t a1)
{
  unint64_t v2 = sub_229300970();
  return MEMORY[0x270FA00B8](a1, v2);
}

void RRViewState.encode(to:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_23();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_229300970();
  OUTLINED_FUNCTION_27_0();
  sub_2293009BC();
  sub_229309330();
  OUTLINED_FUNCTION_23_2();
  v3();
  OUTLINED_FUNCTION_1();
}

uint64_t RRViewState.hashValue.getter()
{
  return sub_229309420();
}

void RRViewState.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_10_1();
  sub_229300970();
  OUTLINED_FUNCTION_37_1();
  if (!v13)
  {
    sub_229300A08();
    sub_2293092A0();
    OUTLINED_FUNCTION_17_1();
    v19();
    *uint64_t v17 = a13;
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v15);
  OUTLINED_FUNCTION_1();
}

void sub_2292FC708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RRViewState.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_2292FC720()
{
}

uint64_t sub_2292FC744(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64657463656C6573 && a2 == 0xE800000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6867696C68676968 && a2 == 0xEB00000000646574;
    if (v6 || (sub_229309350() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x64657375636F66 && a2 == 0xE700000000000000;
      if (v7 || (sub_229309350() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
        if (v8 || (sub_229309350() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x676E6974696465 && a2 == 0xE700000000000000;
          if (v9 || (sub_229309350() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x7972616D697270 && a2 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_229309350();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2292FC9D4(char a1)
{
  uint64_t result = 0x64657463656C6573;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6867696C68676968;
      break;
    case 2:
      uint64_t result = 0x64657375636F66;
      break;
    case 3:
      uint64_t result = 0x64656C6261736964;
      break;
    case 4:
      uint64_t result = 0x676E6974696465;
      break;
    case 5:
      uint64_t result = 0x7972616D697270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292FCAA4()
{
  return sub_2292FC9D4(*v0);
}

uint64_t sub_2292FCAAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FC744(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FCAD4(uint64_t a1)
{
  unint64_t v2 = sub_229300A54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCB10(uint64_t a1)
{
  unint64_t v2 = sub_229300A54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCB4C(uint64_t a1)
{
  unint64_t v2 = sub_229300B38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCB88(uint64_t a1)
{
  unint64_t v2 = sub_229300B38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCBC4(uint64_t a1)
{
  unint64_t v2 = sub_229300AEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCC00(uint64_t a1)
{
  unint64_t v2 = sub_229300AEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCC3C(uint64_t a1)
{
  unint64_t v2 = sub_229300B84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCC78(uint64_t a1)
{
  unint64_t v2 = sub_229300B84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCCB4(uint64_t a1)
{
  unint64_t v2 = sub_229300BD0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCCF0(uint64_t a1)
{
  unint64_t v2 = sub_229300BD0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCD2C(uint64_t a1)
{
  unint64_t v2 = sub_229300AA0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCD68(uint64_t a1)
{
  unint64_t v2 = sub_229300AA0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FCDA4(uint64_t a1)
{
  unint64_t v2 = sub_229300C1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FCDE0(uint64_t a1)
{
  unint64_t v2 = sub_229300C1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void RRState.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, char a11, char a12, char a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_2();
  a25 = v27;
  a26 = v28;
  char v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF38);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_32_1(v32, v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF40);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_20_2(v34, v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF48);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF50);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF58);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF60);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FF68);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_23();
  uint64_t v40 = *v26;
  __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  sub_229300A54();
  sub_229309470();
  switch(v40)
  {
    case 1:
      a12 = 1;
      sub_229300BD0();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.HighlightedCodingKeys, (uint64_t)&a12);
      break;
    case 2:
      a13 = 2;
      sub_229300B84();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.FocusedCodingKeys, (uint64_t)&a13);
      break;
    case 3:
      a14 = 3;
      sub_229300B38();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.DisabledCodingKeys, (uint64_t)&a14);
      break;
    case 4:
      a15 = 4;
      sub_229300AEC();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.EditingCodingKeys, (uint64_t)&a15);
      break;
    case 5:
      a16 = 5;
      sub_229300AA0();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.PrimaryCodingKeys, (uint64_t)&a16);
      break;
    default:
      a11 = 0;
      sub_229300C1C();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRState.SelectedCodingKeys, (uint64_t)&a11);
      break;
  }
  OUTLINED_FUNCTION_4_0();
  v43(v41, v42);
  OUTLINED_FUNCTION_4_0();
  v46(v44, v45);
  OUTLINED_FUNCTION_1();
}

void RRState.init(from:)()
{
  OUTLINED_FUNCTION_2();
  unint64_t v2 = v1;
  uint64_t v35 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFA8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_33_1(v5, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFB0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_30_1(v7, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFB8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_29_1(v9, v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFC0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_20_2(v11, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFC8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_46();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFD0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFD8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_16_0();
  uint64_t v36 = v2;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_229300A54();
  sub_229309450();
  if (v0) {
    goto LABEL_12;
  }
  uint64_t v15 = sub_2293092B0();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16
    || (uint64_t v34 = *(unsigned __int8 *)(v15 + 32),
        sub_2292ECEF0(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
        uint64_t v18 = v17,
        unint64_t v20 = v19,
        swift_bridgeObjectRelease(),
        v18 != v20 >> 1))
  {
    sub_2293091B0();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC78);
    *uint64_t v22 = &type metadata for RRState;
    sub_229309220();
    sub_229309190();
    uint64_t v23 = OUTLINED_FUNCTION_45_0();
    v24(v23);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_4_0();
    v25();
LABEL_12:
    uint64_t v26 = (uint64_t)v36;
    goto LABEL_13;
  }
  switch(v34)
  {
    case 1:
      sub_229300BD0();
      OUTLINED_FUNCTION_21_1();
      goto LABEL_14;
    case 2:
      sub_229300B84();
      OUTLINED_FUNCTION_21_1();
      goto LABEL_14;
    case 3:
      sub_229300B38();
      OUTLINED_FUNCTION_21_1();
      goto LABEL_15;
    case 4:
      sub_229300AEC();
      OUTLINED_FUNCTION_21_1();
      goto LABEL_14;
    case 5:
      sub_229300AA0();
      OUTLINED_FUNCTION_21_1();
      goto LABEL_14;
    default:
      sub_229300C1C();
      OUTLINED_FUNCTION_21_1();
LABEL_14:
      OUTLINED_FUNCTION_34_1();
LABEL_15:
      OUTLINED_FUNCTION_4_0();
      v27();
      swift_unknownObjectRelease();
      uint64_t v28 = OUTLINED_FUNCTION_40_1();
      v29(v28);
      uint64_t v26 = (uint64_t)v36;
      *uint64_t v35 = v34;
      break;
  }
LABEL_13:
  __swift_destroy_boxed_opaque_existential_0Tm(v26);
  OUTLINED_FUNCTION_1();
}

void sub_2292FD7F4()
{
}

#error "2292FD818: call analysis failed (funcsize=6)"

uint64_t RRDisplayRepresentation.title.getter()
{
  return OUTLINED_FUNCTION_21();
}

uint64_t RRDisplayRepresentation.subtitle.getter()
{
  return OUTLINED_FUNCTION_21();
}

SiriReferenceResolutionDataModel::RRDisplayRepresentation __swiftcall RRDisplayRepresentation.init(title:subtitle:)(Swift::String title, Swift::String_optional subtitle)
{
  v2->value = title;
  v2[1] = subtitle;
  result.subtitle = subtitle;
  result.title = title;
  return result;
}

uint64_t RRDisplayRepresentation.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_229309010();
  swift_bridgeObjectRelease();
  if (!v1) {
    return sub_229309400();
  }
  sub_229309400();
  swift_bridgeObjectRetain();
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292FD940(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2292FDA28(char a1)
{
  if (a1) {
    return 0x656C746974627573;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_2292FDA5C()
{
  return sub_229309420();
}

uint64_t sub_2292FDA98()
{
  return sub_2292FDA28(*v0);
}

uint64_t sub_2292FDAA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FD940(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FDAC8(uint64_t a1)
{
  unint64_t v2 = sub_229300C68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FDB04(uint64_t a1)
{
  unint64_t v2 = sub_229300C68();
  return MEMORY[0x270FA00B8](a1, v2);
}

void RRDisplayRepresentation.encode(to:)()
{
  OUTLINED_FUNCTION_2();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFE0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_229300C68();
  sub_229309470();
  sub_2293092F0();
  if (!v0) {
    sub_2293092D0();
  }
  OUTLINED_FUNCTION_23_2();
  v4();
  OUTLINED_FUNCTION_1();
}

uint64_t RRDisplayRepresentation.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_14_2();
  swift_bridgeObjectRetain();
  sub_229309010();
  swift_bridgeObjectRelease();
  sub_229309400();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_229309010();
    swift_bridgeObjectRelease();
  }
  return sub_229309420();
}

void RRDisplayRepresentation.init(from:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830FFF0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_1();
  sub_229300C68();
  OUTLINED_FUNCTION_24_1();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
  }
  else
  {
    uint64_t v6 = sub_229309260();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_229309230();
    uint64_t v11 = v10;
    uint64_t v13 = v9;
    OUTLINED_FUNCTION_17_1();
    v12();
    *uint64_t v4 = v6;
    v4[1] = v8;
    v4[2] = v13;
    v4[3] = v11;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0Tm(v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1();
}

void sub_2292FDEA0()
{
}

void sub_2292FDEB8()
{
}

uint64_t sub_2292FDEDC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_2293093E0();
  swift_bridgeObjectRetain();
  sub_229309010();
  swift_bridgeObjectRelease();
  sub_229309400();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_229309010();
    swift_bridgeObjectRelease();
  }
  return sub_229309420();
}

uint64_t RRDataSourceMetadataValue.hash(into:)()
{
  return sub_2293093F0();
}

uint64_t sub_2292FDFB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x61737265766E6F63 && a2 == 0xEE006C616E6F6974;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x756F726765726F66 && a2 == 0xEC0000006465646ELL;
    if (v6 || (sub_229309350() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E65657263536E6FLL && a2 == 0xE800000000000000;
      if (v7 || (sub_229309350() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6163696669746F6ELL && a2 == 0xEC0000006E6F6974;
        if (v8 || (sub_229309350() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x65636E756F6E6E61 && a2 == 0xEC000000746E656DLL;
          if (v9 || (sub_229309350() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x657551616964656DLL && a2 == 0xEF65746174536575;
            if (v10 || (sub_229309350() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x6C6175736976 && a2 == 0xE600000000000000;
              if (v11 || (sub_229309350() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0x79627261656ELL && a2 == 0xE600000000000000)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                char v13 = sub_229309350();
                swift_bridgeObjectRelease();
                if (v13) {
                  return 7;
                }
                else {
                  return 8;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2292FE368()
{
  return 8;
}

uint64_t sub_2292FE370()
{
  return sub_229309420();
}

uint64_t sub_2292FE3B0(char a1)
{
  uint64_t result = 0x61737265766E6F63;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x756F726765726F66;
      break;
    case 2:
      uint64_t result = 0x6E65657263536E6FLL;
      break;
    case 3:
      uint64_t result = 0x6163696669746F6ELL;
      break;
    case 4:
      uint64_t result = 0x65636E756F6E6E61;
      break;
    case 5:
      uint64_t result = 0x657551616964656DLL;
      break;
    case 6:
      uint64_t result = 0x6C6175736976;
      break;
    case 7:
      uint64_t result = 0x79627261656ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2292FE4DC(uint64_t a1)
{
  unint64_t v2 = sub_229300DE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE518(uint64_t a1)
{
  unint64_t v2 = sub_229300DE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE554()
{
  return sub_2292FE370();
}

uint64_t sub_2292FE570()
{
  return sub_2292FE3B0(*v0);
}

uint64_t sub_2292FE578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2292FDFB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2292FE5A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2292FE368();
  *a1 = result;
  return result;
}

uint64_t sub_2292FE5C8(uint64_t a1)
{
  unint64_t v2 = sub_229300CB4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE604(uint64_t a1)
{
  unint64_t v2 = sub_229300CB4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE640(uint64_t a1)
{
  unint64_t v2 = sub_229300F14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE67C(uint64_t a1)
{
  unint64_t v2 = sub_229300F14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE6B8(uint64_t a1)
{
  unint64_t v2 = sub_229300EC8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE6F4(uint64_t a1)
{
  unint64_t v2 = sub_229300EC8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE730(uint64_t a1)
{
  unint64_t v2 = sub_229300D98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE76C(uint64_t a1)
{
  unint64_t v2 = sub_229300D98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE7A8(uint64_t a1)
{
  unint64_t v2 = sub_229300D00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE7E4(uint64_t a1)
{
  unint64_t v2 = sub_229300D00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE820(uint64_t a1)
{
  unint64_t v2 = sub_229300E30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE85C(uint64_t a1)
{
  unint64_t v2 = sub_229300E30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE898(uint64_t a1)
{
  unint64_t v2 = sub_229300E7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE8D4(uint64_t a1)
{
  unint64_t v2 = sub_229300E7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2292FE910(uint64_t a1)
{
  unint64_t v2 = sub_229300D4C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2292FE94C(uint64_t a1)
{
  unint64_t v2 = sub_229300D4C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void RRDataSourceMetadataValue.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  OUTLINED_FUNCTION_2();
  a26 = v28;
  a27 = v29;
  uint64_t v31 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90A0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90A8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_31_1(v34, v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90D0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90B8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90C0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90B0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8E78);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC90C8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9098);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_23();
  uint64_t v42 = *v27;
  __swift_project_boxed_opaque_existential_1(v31, v31[3]);
  sub_229300CB4();
  sub_229309470();
  switch(v42)
  {
    case 1:
      a11 = 1;
      sub_229300EC8();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys, (uint64_t)&a11);
      break;
    case 2:
      a12 = 2;
      sub_229300E7C();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys, (uint64_t)&a12);
      break;
    case 3:
      a13 = 3;
      sub_229300E30();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.NotificationCodingKeys, (uint64_t)&a13);
      break;
    case 4:
      a14 = 4;
      sub_229300DE4();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys, (uint64_t)&a14);
      break;
    case 5:
      a15 = 5;
      sub_229300D98();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys, (uint64_t)&a15);
      break;
    case 6:
      a16 = 6;
      sub_229300D4C();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.VisualCodingKeys, (uint64_t)&a16);
      break;
    case 7:
      a17 = 7;
      sub_229300D00();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.NearbyCodingKeys, (uint64_t)&a17);
      break;
    default:
      a10 = 0;
      sub_229300F14();
      OUTLINED_FUNCTION_5_1((uint64_t)&type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys, (uint64_t)&a10);
      break;
  }
  OUTLINED_FUNCTION_4_0();
  v43();
  OUTLINED_FUNCTION_4_0();
  v44();
  OUTLINED_FUNCTION_1();
}

uint64_t _s32SiriReferenceResolutionDataModel7RRStateO9hashValueSivg_0()
{
  return sub_229309420();
}

void RRDataSourceMetadataValue.init(from:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v76 = v0;
  uint64_t v3 = v2;
  uint64_t v74 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9058);
  OUTLINED_FUNCTION_0_0();
  uint64_t v72 = v6;
  uint64_t v73 = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_33_1(v7, v57[0]);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9060);
  OUTLINED_FUNCTION_0_0();
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_29_1(v10, v57[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9088);
  OUTLINED_FUNCTION_0_0();
  uint64_t v70 = v12;
  uint64_t v71 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_30_1(v13, v57[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9070);
  OUTLINED_FUNCTION_0_0();
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_20_2(v16, v57[0]);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9078);
  OUTLINED_FUNCTION_0_0();
  uint64_t v67 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_31_1(v19, v57[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9068);
  OUTLINED_FUNCTION_0_0();
  uint64_t v65 = v21;
  uint64_t v66 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_32_1(v22, v57[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D58);
  OUTLINED_FUNCTION_0_0();
  uint64_t v62 = v24;
  uint64_t v63 = v23;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_16_0();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9080);
  OUTLINED_FUNCTION_0_0();
  uint64_t v61 = v26;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)v57 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC9050);
  OUTLINED_FUNCTION_0_0();
  uint64_t v32 = v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)v57 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v3[3];
  unsigned int v75 = v3;
  __swift_project_boxed_opaque_existential_1(v3, v36);
  sub_229300CB4();
  uint64_t v37 = v76;
  sub_229309450();
  if (v37)
  {
LABEL_2:
    uint64_t v38 = (uint64_t)v75;
LABEL_10:
    uint64_t v53 = v38;
    goto LABEL_11;
  }
  v57[2] = (uint64_t)v29;
  v57[1] = v25;
  v57[3] = v1;
  uint64_t v76 = v32;
  uint64_t v39 = sub_2293092B0();
  uint64_t v40 = *(void *)(v39 + 16);
  if (!v40)
  {
    uint64_t v47 = v30;
LABEL_9:
    uint64_t v38 = (uint64_t)v75;
    uint64_t v48 = v76;
    sub_2293091B0();
    swift_allocError();
    uint64_t v50 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830FC78);
    *uint64_t v50 = &type metadata for RRDataSourceMetadataValue;
    sub_229309220();
    sub_229309190();
    uint64_t v51 = OUTLINED_FUNCTION_45_0();
    v52(v51);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v35, v47);
    goto LABEL_10;
  }
  uint64_t v58 = v30;
  v57[0] = 0;
  uint64_t v41 = *(unsigned __int8 *)(v39 + 32);
  sub_2292ECEF0(1, v40, v39, v39 + 32, 0, (2 * v40) | 1);
  uint64_t v43 = v42;
  unint64_t v45 = v44;
  swift_bridgeObjectRelease();
  if (v43 != v45 >> 1)
  {
    uint64_t v47 = v58;
    goto LABEL_9;
  }
  uint64_t v46 = v57[0];
  switch(v41)
  {
    case 1:
      sub_229300EC8();
      OUTLINED_FUNCTION_13_2();
      goto LABEL_22;
    case 2:
      sub_229300E7C();
      sub_229309210();
      if (!v46) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 3:
      sub_229300E30();
      OUTLINED_FUNCTION_13_2();
      goto LABEL_22;
    case 4:
      sub_229300DE4();
      OUTLINED_FUNCTION_13_2();
      goto LABEL_22;
    case 5:
      sub_229300D98();
      sub_229309210();
      if (!v46) {
        goto LABEL_22;
      }
LABEL_21:
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_4_0();
      v54();
      goto LABEL_2;
    case 6:
      sub_229300D4C();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_34_1();
      goto LABEL_23;
    case 7:
      sub_229300D00();
      OUTLINED_FUNCTION_13_2();
LABEL_22:
      OUTLINED_FUNCTION_34_1();
      goto LABEL_23;
    default:
      sub_229300F14();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_34_1();
LABEL_23:
      OUTLINED_FUNCTION_4_0();
      v55();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_4_0();
      v56();
      uint64_t v53 = (uint64_t)v75;
      *uint64_t v74 = v41;
      break;
  }
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0Tm(v53);
  OUTLINED_FUNCTION_1();
}

void sub_2292FF610()
{
}

#error "2292FF634: call analysis failed (funcsize=6)"

uint64_t sub_2292FF640(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_2292FF65C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_2293093E0();
  swift_bridgeObjectRetain();
  RRSurroundingText.hash(into:)();
  uint64_t v7 = sub_229309420();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v11 = *(void *)(v6 + 48);
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = *(void *)(a2 + 8);
    double v14 = *(double *)(a2 + 16);
    double v15 = *(double *)(a2 + 24);
    double v16 = *(double *)(a2 + 32);
    double v17 = *(double *)(a2 + 40);
    while (1)
    {
      uint64_t v18 = v11 + 48 * v9;
      double v20 = *(double *)(v18 + 16);
      double v19 = *(double *)(v18 + 24);
      double v22 = *(double *)(v18 + 32);
      double v21 = *(double *)(v18 + 40);
      BOOL v23 = *(void *)v18 == v12 && *(void *)(v18 + 8) == v13;
      if (v23 || (sub_229309350() & 1) != 0)
      {
        BOOL v24 = v20 == v14 && v19 == v15;
        BOOL v25 = v24 && v22 == v16;
        if (v25 && v21 == v17) {
          break;
        }
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
    sub_2293032A4(a2);
    uint64_t v30 = *(void *)(*v3 + 48) + 48 * v9;
    uint64_t v31 = *(void *)(v30 + 8);
    *(void *)a1 = *(void *)v30;
    *(void *)(a1 + 8) = v31;
    long long v32 = *(_OWORD *)(v30 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v30 + 16);
    *(_OWORD *)(a1 + 32) = v32;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_19:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2292E7BC4(a2);
    sub_2292FFB74(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v33;
    swift_bridgeObjectRelease();
    long long v28 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v28;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_2292FF854()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310188);
  uint64_t v3 = sub_229309160();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v34 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v33 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      double v16 = (uint64_t *)(*(void *)(v2 + 48) + 48 * i);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v19 = v16[2];
      uint64_t v20 = v16[3];
      uint64_t v21 = v16[4];
      uint64_t v22 = v16[5];
      sub_2293093E0();
      RRSurroundingText.hash(into:)();
      uint64_t result = sub_229309420();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v8 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      uint64_t v31 = (void *)(*(void *)(v4 + 48) + 48 * v26);
      *uint64_t v31 = v17;
      v31[1] = v18;
      v31[2] = v19;
      v31[3] = v20;
      v31[4] = v21;
      v31[5] = v22;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_38;
      }
      if (v13 >= v33) {
        goto LABEL_32;
      }
      unint64_t v14 = v34[v13];
      ++v10;
      if (!v14)
      {
        int64_t v10 = v13 + 1;
        if (v13 + 1 >= v33) {
          goto LABEL_32;
        }
        unint64_t v14 = v34[v10];
        if (!v14)
        {
          int64_t v10 = v13 + 2;
          if (v13 + 2 >= v33) {
            goto LABEL_32;
          }
          unint64_t v14 = v34[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v33)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v32 = 1 << *(unsigned char *)(v2 + 32);
              if (v32 > 63) {
                sub_2292FF640(0, (unint64_t)(v32 + 63) >> 6, v34);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v34[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_39;
                }
                if (v10 >= v33) {
                  goto LABEL_32;
                }
                unint64_t v14 = v34[v10];
                ++v15;
                if (v14) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v10 = v15;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v14 - 1) & v14;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2292FFB74(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_26;
  }
  if (a3)
  {
    sub_2292FF854();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_2292FFD44();
      goto LABEL_26;
    }
    sub_2292FFF04();
  }
  uint64_t v9 = *v3;
  sub_2293093E0();
  RRSurroundingText.hash(into:)();
  uint64_t result = sub_229309420();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  uint64_t v11 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v12 = ~v10;
    uint64_t v13 = *(void *)(v9 + 48);
    uint64_t v14 = *(void *)v6;
    uint64_t v15 = *(void *)(v6 + 8);
    double v16 = *(double *)(v6 + 16);
    double v17 = *(double *)(v6 + 24);
    double v18 = *(double *)(v6 + 32);
    double v19 = *(double *)(v6 + 40);
    do
    {
      uint64_t v20 = v13 + 48 * a2;
      uint64_t result = *(void *)v20;
      double v22 = *(double *)(v20 + 16);
      double v21 = *(double *)(v20 + 24);
      double v24 = *(double *)(v20 + 32);
      double v23 = *(double *)(v20 + 40);
      BOOL v25 = *(void *)v20 == v14 && *(void *)(v20 + 8) == v15;
      if (v25 || (uint64_t result = sub_229309350(), (result & 1) != 0))
      {
        BOOL v26 = v22 == v16 && v21 == v17;
        BOOL v27 = v26 && v24 == v18;
        if (v27 && v23 == v19) {
          goto LABEL_29;
        }
      }
      a2 = (a2 + 1) & v12;
    }
    while (((*(void *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_26:
  uint64_t v29 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v30 = (_OWORD *)(*(void *)(v29 + 48) + 48 * a2);
  long long v31 = *(_OWORD *)(v6 + 16);
  *uint64_t v30 = *(_OWORD *)v6;
  v30[1] = v31;
  v30[2] = *(_OWORD *)(v6 + 32);
  uint64_t v32 = *(void *)(v29 + 16);
  BOOL v33 = __OFADD__(v32, 1);
  uint64_t v34 = v32 + 1;
  if (!v33)
  {
    *(void *)(v29 + 16) = v34;
    return result;
  }
  __break(1u);
LABEL_29:
  uint64_t result = sub_229309380();
  __break(1u);
  return result;
}

void *sub_2292FFD44()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310188);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_229309150();
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = 3 * i;
    uint64_t v21 = *(void *)(v2 + 48) + 16 * v20;
    uint64_t v22 = *(void *)(v21 + 8);
    long long v23 = *(_OWORD *)(v21 + 16);
    long long v24 = *(_OWORD *)(v21 + 32);
    uint64_t v25 = *(void *)(v4 + 48) + 16 * v20;
    *(void *)uint64_t v25 = *(void *)v21;
    *(void *)(v25 + 8) = v22;
    *(_OWORD *)(v25 + 16) = v23;
    *(_OWORD *)(v25 + 32) = v24;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_2292FFF04()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310188);
  uint64_t v2 = sub_229309160();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_24:
    unint64_t result = swift_release();
    *uint64_t v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v24 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  unint64_t result = swift_retain();
  int64_t v10 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v11 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    double v16 = (uint64_t *)(*(void *)(v1 + 48) + 48 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = v16[2];
    uint64_t v20 = v16[3];
    uint64_t v21 = v16[4];
    uint64_t v22 = v16[5];
    sub_2293093E0();
    swift_bridgeObjectRetain();
    RRSurroundingText.hash(into:)();
    sub_229309420();
    unint64_t result = sub_229309140();
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v23 = (void *)(*(void *)(v3 + 48) + 48 * result);
    *long long v23 = v18;
    v23[1] = v17;
    v23[2] = v19;
    uint64_t v23[3] = v20;
    v23[4] = v21;
    v23[5] = v22;
    ++*(void *)(v3 + 16);
    if (v6) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v6 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v7)
  {
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  unint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22930016C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_2293093F0();
  if (v3)
  {
    uint64_t v5 = a2 + 72;
    do
    {
      swift_bridgeObjectRetain();
      sub_229309010();
      sub_229309410();
      sub_229309410();
      sub_229309410();
      sub_229309410();
      uint64_t result = swift_bridgeObjectRelease();
      v5 += 48;
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_22930022C()
{
  unint64_t result = qword_26AEC8ED0;
  if (!qword_26AEC8ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8ED0);
  }
  return result;
}

unint64_t sub_229300278()
{
  unint64_t result = qword_26AEC8EF8;
  if (!qword_26AEC8EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8EF8);
  }
  return result;
}

unint64_t sub_2293002C4()
{
  unint64_t result = qword_26830FE28;
  if (!qword_26830FE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE28);
  }
  return result;
}

unint64_t sub_229300310()
{
  unint64_t result = qword_26830FE30;
  if (!qword_26830FE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE30);
  }
  return result;
}

unint64_t sub_22930035C()
{
  unint64_t result = qword_26830FE38;
  if (!qword_26830FE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE38);
  }
  return result;
}

unint64_t sub_2293003A8()
{
  unint64_t result = qword_26AEC9030;
  if (!qword_26AEC9030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9030);
  }
  return result;
}

unint64_t sub_2293003F4()
{
  unint64_t result = qword_26830FE40;
  if (!qword_26830FE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE40);
  }
  return result;
}

unint64_t sub_229300440()
{
  unint64_t result = qword_26830FE48;
  if (!qword_26830FE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE48);
  }
  return result;
}

unint64_t sub_22930048C()
{
  unint64_t result = qword_26AEC8EE8;
  if (!qword_26AEC8EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8EE8);
  }
  return result;
}

unint64_t sub_2293004D8()
{
  unint64_t result = qword_26830FE50;
  if (!qword_26830FE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE50);
  }
  return result;
}

unint64_t sub_229300524()
{
  unint64_t result = qword_26830FE58;
  if (!qword_26830FE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE58);
  }
  return result;
}

unint64_t sub_229300570()
{
  unint64_t result = qword_26830FE60;
  if (!qword_26830FE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE60);
  }
  return result;
}

unint64_t sub_2293005BC()
{
  unint64_t result = qword_26AEC9028;
  if (!qword_26AEC9028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9028);
  }
  return result;
}

unint64_t sub_229300608()
{
  unint64_t result = qword_26830FE68;
  if (!qword_26830FE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE68);
  }
  return result;
}

unint64_t sub_229300654()
{
  unint64_t result = qword_26830FE70;
  if (!qword_26830FE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE70);
  }
  return result;
}

unint64_t sub_2293006A0()
{
  unint64_t result = qword_26830FE80;
  if (!qword_26830FE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE80);
  }
  return result;
}

unint64_t sub_2293006EC()
{
  unint64_t result = qword_26830FE88;
  if (!qword_26830FE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE88);
  }
  return result;
}

unint64_t sub_229300738()
{
  unint64_t result = qword_26830FE98;
  if (!qword_26830FE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FE98);
  }
  return result;
}

unint64_t sub_229300784()
{
  unint64_t result = qword_26830FEA8;
  if (!qword_26830FEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FEA8);
  }
  return result;
}

unint64_t sub_2293007D0()
{
  unint64_t result = qword_26830FEC0;
  if (!qword_26830FEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FEC0);
  }
  return result;
}

uint64_t sub_22930081C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830FEB0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22930088C()
{
  unint64_t result = qword_26830FED8;
  if (!qword_26830FED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FED8);
  }
  return result;
}

unint64_t sub_2293008D8()
{
  unint64_t result = qword_26830FEE8;
  if (!qword_26830FEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FEE8);
  }
  return result;
}

unint64_t sub_229300924()
{
  unint64_t result = qword_26830FF00;
  if (!qword_26830FF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF00);
  }
  return result;
}

unint64_t sub_229300970()
{
  unint64_t result = qword_26830FF18;
  if (!qword_26830FF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF18);
  }
  return result;
}

unint64_t sub_2293009BC()
{
  unint64_t result = qword_26830FF20;
  if (!qword_26830FF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF20);
  }
  return result;
}

unint64_t sub_229300A08()
{
  unint64_t result = qword_26830FF30;
  if (!qword_26830FF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF30);
  }
  return result;
}

unint64_t sub_229300A54()
{
  unint64_t result = qword_26830FF70;
  if (!qword_26830FF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF70);
  }
  return result;
}

unint64_t sub_229300AA0()
{
  unint64_t result = qword_26830FF78;
  if (!qword_26830FF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF78);
  }
  return result;
}

unint64_t sub_229300AEC()
{
  unint64_t result = qword_26830FF80;
  if (!qword_26830FF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF80);
  }
  return result;
}

unint64_t sub_229300B38()
{
  unint64_t result = qword_26830FF88;
  if (!qword_26830FF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF88);
  }
  return result;
}

unint64_t sub_229300B84()
{
  unint64_t result = qword_26830FF90;
  if (!qword_26830FF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF90);
  }
  return result;
}

unint64_t sub_229300BD0()
{
  unint64_t result = qword_26830FF98;
  if (!qword_26830FF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FF98);
  }
  return result;
}

unint64_t sub_229300C1C()
{
  unint64_t result = qword_26830FFA0;
  if (!qword_26830FFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FFA0);
  }
  return result;
}

unint64_t sub_229300C68()
{
  unint64_t result = qword_26830FFE8;
  if (!qword_26830FFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FFE8);
  }
  return result;
}

unint64_t sub_229300CB4()
{
  unint64_t result = qword_26AEC8F98;
  if (!qword_26AEC8F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8F98);
  }
  return result;
}

unint64_t sub_229300D00()
{
  unint64_t result = qword_26830FFF8;
  if (!qword_26830FFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830FFF8);
  }
  return result;
}

unint64_t sub_229300D4C()
{
  unint64_t result = qword_268310000;
  if (!qword_268310000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310000);
  }
  return result;
}

unint64_t sub_229300D98()
{
  unint64_t result = qword_26AEC9010;
  if (!qword_26AEC9010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9010);
  }
  return result;
}

unint64_t sub_229300DE4()
{
  unint64_t result = qword_268310008;
  if (!qword_268310008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310008);
  }
  return result;
}

unint64_t sub_229300E30()
{
  unint64_t result = qword_26AEC9100;
  if (!qword_26AEC9100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9100);
  }
  return result;
}

unint64_t sub_229300E7C()
{
  unint64_t result = qword_268310010;
  if (!qword_268310010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310010);
  }
  return result;
}

unint64_t sub_229300EC8()
{
  unint64_t result = qword_268310018;
  if (!qword_268310018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310018);
  }
  return result;
}

unint64_t sub_229300F14()
{
  unint64_t result = qword_268310020;
  if (!qword_268310020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310020);
  }
  return result;
}

unint64_t sub_229300F64()
{
  unint64_t result = qword_26AEC8F00;
  if (!qword_26AEC8F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8F00);
  }
  return result;
}

unint64_t sub_229300FB4()
{
  unint64_t result = qword_268310028;
  if (!qword_268310028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310028);
  }
  return result;
}

unint64_t sub_229301004()
{
  unint64_t result = qword_268310030;
  if (!qword_268310030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310030);
  }
  return result;
}

unint64_t sub_229301054()
{
  unint64_t result = qword_268310038;
  if (!qword_268310038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310038);
  }
  return result;
}

unint64_t sub_2293010A4()
{
  unint64_t result = qword_268310040;
  if (!qword_268310040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310040);
  }
  return result;
}

unint64_t sub_2293010F4()
{
  unint64_t result = qword_268310048;
  if (!qword_268310048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310048);
  }
  return result;
}

unint64_t sub_229301144()
{
  unint64_t result = qword_268310050;
  if (!qword_268310050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310050);
  }
  return result;
}

unint64_t sub_229301194()
{
  unint64_t result = qword_268310058;
  if (!qword_268310058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310058);
  }
  return result;
}

unint64_t sub_2293011E4()
{
  unint64_t result = qword_268310060;
  if (!qword_268310060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310060);
  }
  return result;
}

uint64_t destroy for RRMetadata(uint64_t a1)
{
  return sub_2292E7BF0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t initializeWithCopy for RRMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_2292E7B24(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for RRMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_2292E7B24(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_2292E7BF0(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RRMetadata(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_2292E7BF0(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRMetadata(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 49))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
      if (v3 <= 5) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RRMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22930145C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_229301464(uint64_t result, char a2)
{
  *(unsigned char *)(result + 48) = a2;
  return result;
}

void type metadata accessor for RRMetadata()
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for RRBoundingBoxMetadataValue(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RRBoundingBoxMetadataValue(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for RRBoundingBoxMetadataValue()
{
}

void type metadata accessor for RRSurroundingTextsMetadataValue()
{
}

uint64_t initializeWithCopy for RRSurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RRSurroundingText(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for RRSurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for RRSurroundingText(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RRSurroundingText(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRSurroundingText()
{
}

uint64_t getEnumTagSinglePayload for RRViewLocationMetadataValue(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RRViewLocationMetadataValue(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for RRViewLocationMetadataValue()
{
}

void type metadata accessor for RRViewState()
{
}

void type metadata accessor for RRState()
{
}

uint64_t destroy for RRDisplayRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RRDisplayRepresentation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RRDisplayRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for RRDisplayRepresentation(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RRDisplayRepresentation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RRDisplayRepresentation(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRDisplayRepresentation()
{
}

void type metadata accessor for RRDataSourceMetadataValue()
{
}

uint64_t _s32SiriReferenceResolutionDataModel25RRDataSourceMetadataValueOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52_0(-1);
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 8);
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
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 8);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 8);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_52_0(v8);
}

unsigned char *_s32SiriReferenceResolutionDataModel25RRDataSourceMetadataValueOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_51_0((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_48_0((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x229301A14);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_49_0((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_50_0(result, a2 + 7);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.CodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.CodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.ConversationalCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.ForegroundedCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.OnScreenCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.NotificationCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.NotificationCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.AnnouncementCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.MediaQueueStateCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.VisualCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.VisualCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.NearbyCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.NearbyCodingKeys;
}

ValueMetadata *type metadata accessor for RRDisplayRepresentation.CodingKeys()
{
  return &type metadata for RRDisplayRepresentation.CodingKeys;
}

ValueMetadata *type metadata accessor for RRState.CodingKeys()
{
  return &type metadata for RRState.CodingKeys;
}

ValueMetadata *type metadata accessor for RRState.SelectedCodingKeys()
{
  return &type metadata for RRState.SelectedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.HighlightedCodingKeys()
{
  return &type metadata for RRState.HighlightedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.FocusedCodingKeys()
{
  return &type metadata for RRState.FocusedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.DisabledCodingKeys()
{
  return &type metadata for RRState.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.EditingCodingKeys()
{
  return &type metadata for RRState.EditingCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.PrimaryCodingKeys()
{
  return &type metadata for RRState.PrimaryCodingKeys;
}

ValueMetadata *type metadata accessor for RRViewState.CodingKeys()
{
  return &type metadata for RRViewState.CodingKeys;
}

ValueMetadata *type metadata accessor for RRViewLocationMetadataValue.CodingKeys()
{
  return &type metadata for RRViewLocationMetadataValue.CodingKeys;
}

ValueMetadata *type metadata accessor for RRSurroundingText.CodingKeys()
{
  return &type metadata for RRSurroundingText.CodingKeys;
}

unsigned char *_s32SiriReferenceResolutionDataModel11RRViewStateV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x229301C24);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RRSurroundingTextsMetadataValue.CodingKeys()
{
  return &type metadata for RRSurroundingTextsMetadataValue.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RRBoundingBoxMetadataValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RRBoundingBoxMetadataValue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x229301DB0);
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

ValueMetadata *type metadata accessor for RRBoundingBoxMetadataValue.CodingKeys()
{
  return &type metadata for RRBoundingBoxMetadataValue.CodingKeys;
}

uint64_t _s32SiriReferenceResolutionDataModel7RRStateOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52_0(-1);
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
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 6);
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
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 6);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 6);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_52_0(v8);
}

unsigned char *_s32SiriReferenceResolutionDataModel7RRStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_51_0((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_48_0((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x229301F28);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_49_0((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_50_0(result, a2 + 5);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRMetadata.Base()
{
  return &type metadata for RRMetadata.Base;
}

uint64_t _s32SiriReferenceResolutionDataModel23RRDisplayRepresentationV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52_0(-1);
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
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_52_0((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_52_0(v8);
}

unsigned char *_s32SiriReferenceResolutionDataModel23RRDisplayRepresentationV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_51_0((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_48_0((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2293020A0);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_49_0((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_50_0(result, a2 + 1);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRMetadata.CodingKeys()
{
  return &type metadata for RRMetadata.CodingKeys;
}

unint64_t sub_2293020DC()
{
  unint64_t result = qword_268310068;
  if (!qword_268310068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310068);
  }
  return result;
}

unint64_t sub_22930212C()
{
  unint64_t result = qword_268310070;
  if (!qword_268310070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310070);
  }
  return result;
}

unint64_t sub_22930217C()
{
  unint64_t result = qword_268310078;
  if (!qword_268310078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310078);
  }
  return result;
}

unint64_t sub_2293021CC()
{
  unint64_t result = qword_268310080;
  if (!qword_268310080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310080);
  }
  return result;
}

unint64_t sub_22930221C()
{
  unint64_t result = qword_268310088;
  if (!qword_268310088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310088);
  }
  return result;
}

unint64_t sub_22930226C()
{
  unint64_t result = qword_268310090;
  if (!qword_268310090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310090);
  }
  return result;
}

unint64_t sub_2293022BC()
{
  unint64_t result = qword_268310098;
  if (!qword_268310098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310098);
  }
  return result;
}

unint64_t sub_22930230C()
{
  unint64_t result = qword_2683100A0;
  if (!qword_2683100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100A0);
  }
  return result;
}

unint64_t sub_22930235C()
{
  unint64_t result = qword_2683100A8;
  if (!qword_2683100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100A8);
  }
  return result;
}

unint64_t sub_2293023AC()
{
  unint64_t result = qword_2683100B0;
  if (!qword_2683100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100B0);
  }
  return result;
}

unint64_t sub_2293023FC()
{
  unint64_t result = qword_26AEC9008;
  if (!qword_26AEC9008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9008);
  }
  return result;
}

unint64_t sub_22930244C()
{
  unint64_t result = qword_26AEC9000;
  if (!qword_26AEC9000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9000);
  }
  return result;
}

unint64_t sub_22930249C()
{
  unint64_t result = qword_26AEC8D40;
  if (!qword_26AEC8D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8D40);
  }
  return result;
}

unint64_t sub_2293024EC()
{
  unint64_t result = qword_26AEC8DF8;
  if (!qword_26AEC8DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8DF8);
  }
  return result;
}

unint64_t sub_22930253C()
{
  unint64_t result = qword_26AEC8FD8;
  if (!qword_26AEC8FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FD8);
  }
  return result;
}

unint64_t sub_22930258C()
{
  unint64_t result = qword_26AEC8FD0;
  if (!qword_26AEC8FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FD0);
  }
  return result;
}

unint64_t sub_2293025DC()
{
  unint64_t result = qword_26AEC8FF8;
  if (!qword_26AEC8FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FF8);
  }
  return result;
}

unint64_t sub_22930262C()
{
  unint64_t result = qword_26AEC8FF0;
  if (!qword_26AEC8FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FF0);
  }
  return result;
}

unint64_t sub_22930267C()
{
  unint64_t result = qword_26AEC8FE8;
  if (!qword_26AEC8FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FE8);
  }
  return result;
}

unint64_t sub_2293026CC()
{
  unint64_t result = qword_26AEC8FE0;
  if (!qword_26AEC8FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FE0);
  }
  return result;
}

unint64_t sub_22930271C()
{
  unint64_t result = qword_26AEC9020;
  if (!qword_26AEC9020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9020);
  }
  return result;
}

unint64_t sub_22930276C()
{
  unint64_t result = qword_26AEC9018;
  if (!qword_26AEC9018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC9018);
  }
  return result;
}

unint64_t sub_2293027BC()
{
  unint64_t result = qword_26AEC8FC8;
  if (!qword_26AEC8FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FC8);
  }
  return result;
}

unint64_t sub_22930280C()
{
  unint64_t result = qword_26AEC8FC0;
  if (!qword_26AEC8FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FC0);
  }
  return result;
}

unint64_t sub_22930285C()
{
  unint64_t result = qword_26AEC8FB8;
  if (!qword_26AEC8FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FB8);
  }
  return result;
}

unint64_t sub_2293028AC()
{
  unint64_t result = qword_26AEC8FB0;
  if (!qword_26AEC8FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FB0);
  }
  return result;
}

unint64_t sub_2293028FC()
{
  unint64_t result = qword_26AEC8FA8;
  if (!qword_26AEC8FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FA8);
  }
  return result;
}

unint64_t sub_22930294C()
{
  unint64_t result = qword_26AEC8FA0;
  if (!qword_26AEC8FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8FA0);
  }
  return result;
}

unint64_t sub_22930299C()
{
  unint64_t result = qword_2683100B8;
  if (!qword_2683100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100B8);
  }
  return result;
}

unint64_t sub_2293029EC()
{
  unint64_t result = qword_2683100C0;
  if (!qword_2683100C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100C0);
  }
  return result;
}

unint64_t sub_229302A3C()
{
  unint64_t result = qword_2683100C8;
  if (!qword_2683100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100C8);
  }
  return result;
}

unint64_t sub_229302A8C()
{
  unint64_t result = qword_2683100D0;
  if (!qword_2683100D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100D0);
  }
  return result;
}

unint64_t sub_229302ADC()
{
  unint64_t result = qword_2683100D8;
  if (!qword_2683100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100D8);
  }
  return result;
}

unint64_t sub_229302B2C()
{
  unint64_t result = qword_2683100E0;
  if (!qword_2683100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100E0);
  }
  return result;
}

unint64_t sub_229302B7C()
{
  unint64_t result = qword_2683100E8;
  if (!qword_2683100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100E8);
  }
  return result;
}

unint64_t sub_229302BCC()
{
  unint64_t result = qword_2683100F0;
  if (!qword_2683100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100F0);
  }
  return result;
}

unint64_t sub_229302C1C()
{
  unint64_t result = qword_2683100F8;
  if (!qword_2683100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683100F8);
  }
  return result;
}

unint64_t sub_229302C6C()
{
  unint64_t result = qword_268310100;
  if (!qword_268310100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310100);
  }
  return result;
}

unint64_t sub_229302CBC()
{
  unint64_t result = qword_268310108;
  if (!qword_268310108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310108);
  }
  return result;
}

unint64_t sub_229302D0C()
{
  unint64_t result = qword_268310110;
  if (!qword_268310110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310110);
  }
  return result;
}

unint64_t sub_229302D5C()
{
  unint64_t result = qword_268310118;
  if (!qword_268310118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310118);
  }
  return result;
}

unint64_t sub_229302DAC()
{
  unint64_t result = qword_268310120;
  if (!qword_268310120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310120);
  }
  return result;
}

unint64_t sub_229302DFC()
{
  unint64_t result = qword_268310128;
  if (!qword_268310128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310128);
  }
  return result;
}

unint64_t sub_229302E4C()
{
  unint64_t result = qword_268310130;
  if (!qword_268310130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310130);
  }
  return result;
}

unint64_t sub_229302E9C()
{
  unint64_t result = qword_268310138;
  if (!qword_268310138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310138);
  }
  return result;
}

unint64_t sub_229302EEC()
{
  unint64_t result = qword_268310140;
  if (!qword_268310140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310140);
  }
  return result;
}

unint64_t sub_229302F3C()
{
  unint64_t result = qword_268310148;
  if (!qword_268310148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310148);
  }
  return result;
}

unint64_t sub_229302F8C()
{
  unint64_t result = qword_268310150;
  if (!qword_268310150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310150);
  }
  return result;
}

unint64_t sub_229302FDC()
{
  unint64_t result = qword_268310158;
  if (!qword_268310158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310158);
  }
  return result;
}

unint64_t sub_22930302C()
{
  unint64_t result = qword_268310160;
  if (!qword_268310160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310160);
  }
  return result;
}

unint64_t sub_22930307C()
{
  unint64_t result = qword_268310168;
  if (!qword_268310168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310168);
  }
  return result;
}

unint64_t sub_2293030CC()
{
  unint64_t result = qword_268310170;
  if (!qword_268310170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310170);
  }
  return result;
}

unint64_t sub_22930311C()
{
  unint64_t result = qword_268310178;
  if (!qword_268310178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310178);
  }
  return result;
}

unint64_t sub_22930316C()
{
  unint64_t result = qword_268310180;
  if (!qword_268310180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310180);
  }
  return result;
}

unint64_t sub_2293031BC()
{
  unint64_t result = qword_26AEC8EE0;
  if (!qword_26AEC8EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8EE0);
  }
  return result;
}

unint64_t sub_22930320C()
{
  unint64_t result = qword_26AEC8ED8;
  if (!qword_26AEC8ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8ED8);
  }
  return result;
}

unint64_t sub_229303258()
{
  unint64_t result = qword_26AEC8EF0;
  if (!qword_26AEC8EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8EF0);
  }
  return result;
}

uint64_t sub_2293032A4(uint64_t a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_2293092A0();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_2293092A0();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_229309330();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_229309330();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F390](a1, a2, v2, a1);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_2293092A0();
}

void *OUTLINED_FUNCTION_10_1()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_229309210();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_2293093E0();
}

unsigned __int16 OUTLINED_FUNCTION_18_2@<H0>(int32x4_t a1@<Q0>, int32x4_t a2@<Q1>)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32(a1, a2)), 0xFuLL)));
}

void OUTLINED_FUNCTION_20_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_229309210();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return sub_229309450();
}

void OUTLINED_FUNCTION_25_1()
{
  *(unsigned char *)(v0 - 65) = 1;
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_229309470();
}

void *OUTLINED_FUNCTION_28_1()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

void OUTLINED_FUNCTION_29_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_30_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_31_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_32_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_33_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return sub_229309450();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_229309010();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_46_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 144) = a1;
  *(unsigned char *)(v1 - 65) = 0;
  return sub_22930048C();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_2293093F0();
}

uint64_t OUTLINED_FUNCTION_48_0@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_49_0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *OUTLINED_FUNCTION_50_0@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_51_0@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t RRHandoffURL.init(key:appBundleId:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (!String.isValidContinuityKey()())
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v6 = sub_229303908();
  swift_bridgeObjectRelease();
  if (!v6)
  {
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(a3 + 64) = 0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  BOOL v7 = (void *)sub_2292EF050(0x646970756F7267, 0xE700000000000000, v6);
  if (v7)
  {
    if (v7[2])
    {
      uint64_t v8 = v7[5];
      uint64_t v19 = v7[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = 0;
  uint64_t v8 = 0;
LABEL_10:
  long long v10 = (void *)sub_2292EF050(0x6E79616C70736964, 0xEB00000000656D61, v6);
  if (v10)
  {
    if (v10[2])
    {
      uint64_t v12 = v10[4];
      uint64_t v11 = v10[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = 0;
  uint64_t v11 = 0;
LABEL_15:
  uint64_t v13 = (void *)sub_2292EF050(0x65636976726573, 0xE700000000000000, v6);
  if (!v13)
  {
LABEL_19:
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  if (!v13[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v15 = v13[4];
  uint64_t v14 = v13[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t v16 = OUTLINED_FUNCTION_15_1();
  uint64_t v17 = sub_2292EF050(v16, 0xE900000000000074, v6);
  if (!v17)
  {
    uint64_t v18 = OUTLINED_FUNCTION_15_1();
    uint64_t v17 = sub_2292EF050(v18, 0xEA00000000007374, v6);
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = v15;
  *(void *)(a3 + 24) = v14;
  *(void *)(a3 + 32) = v19;
  *(void *)(a3 + 40) = v8;
  *(void *)(a3 + 48) = v12;
  *(void *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v17;
  return result;
}

Swift::Bool __swiftcall String.isValidContinuityKey()()
{
  return OUTLINED_FUNCTION_4_3(v0, v1, 39, 0x8000000229309F50);
}

uint64_t sub_229303908()
{
  unint64_t v0 = sub_229304954();
  uint64_t v7 = OUTLINED_FUNCTION_9_3(v0, MEMORY[0x263F8D310], v1, v2, v3, v4, v5, v6, v43, v47);
  sub_229303D18(v7);
  uint64_t v9 = v8;
  uint64_t v10 = swift_bridgeObjectRelease();
  if (!v9) {
    return 0;
  }
  uint64_t v63 = 38;
  uint64_t v65 = 0xE100000000000000;
  uint64_t v17 = OUTLINED_FUNCTION_9_3(v10, MEMORY[0x263F8D310], v11, v12, v13, v14, v15, v16, v44, v48);
  swift_bridgeObjectRelease();
  uint64_t v55 = *(void *)(v17 + 16);
  if (!v55)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  unint64_t v18 = 0;
  uint64_t v53 = v17 + 32;
  uint64_t v19 = (void *)MEMORY[0x263F8EE80];
  uint64_t v49 = v17;
  uint64_t v51 = v0;
  while (v18 < *(void *)(v17 + 16))
  {
    uint64_t v20 = (void *)OUTLINED_FUNCTION_7_1(61, v45, v49, v51, v53, v55, v57, v59, v61, v63, v65);
    if (!v20[2])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v60 = v20[4];
    uint64_t v62 = v20[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v21 = OUTLINED_FUNCTION_7_1(44, v46, v50, v52, v54, v56, v58, v60, v62, v64, v66);
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void *)(v21 + 16);
    uint64_t v57 = v21;
    if (v22)
    {
      long long v23 = (uint64_t *)(v21 + 40);
      uint64_t v24 = MEMORY[0x263F8EE78];
      do
      {
        uint64_t v26 = *(v23 - 1);
        uint64_t v25 = *v23;
        uint64_t v27 = HIBYTE(*v23) & 0xF;
        if ((*v23 & 0x2000000000000000) == 0) {
          uint64_t v27 = v26 & 0xFFFFFFFFFFFFLL;
        }
        if (v27)
        {
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_229304B30(0, *(void *)(v24 + 16) + 1, 1);
          }
          unint64_t v29 = *(void *)(v24 + 16);
          unint64_t v28 = *(void *)(v24 + 24);
          if (v29 >= v28 >> 1) {
            sub_229304B30(v28 > 1, v29 + 1, 1);
          }
          *(void *)(v24 + 16) = v29 + 1;
          uint64_t v30 = v24 + 16 * v29;
          *(void *)(v30 + 32) = v26;
          *(void *)(v30 + 40) = v25;
        }
        v23 += 2;
        --v22;
      }
      while (v22);
    }
    else
    {
      uint64_t v24 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v31 = sub_2292F61D0(v59, v61);
    if (__OFADD__(v19[2], (v32 & 1) == 0)) {
      goto LABEL_34;
    }
    unint64_t v33 = v31;
    char v34 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683101B8);
    if (sub_2293091D0())
    {
      unint64_t v35 = sub_2292F61D0(v59, v61);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_36;
      }
      unint64_t v33 = v35;
    }
    if (v34)
    {
      uint64_t v37 = v19[7];
      swift_bridgeObjectRelease();
      *(void *)(v37 + 8 * v33) = v24;
    }
    else
    {
      v19[(v33 >> 6) + 8] |= 1 << v33;
      uint64_t v38 = (uint64_t *)(v19[6] + 16 * v33);
      *uint64_t v38 = v59;
      v38[1] = v61;
      *(void *)(v19[7] + 8 * v33) = v24;
      uint64_t v39 = v19[2];
      BOOL v40 = __OFADD__(v39, 1);
      uint64_t v41 = v39 + 1;
      if (v40) {
        goto LABEL_35;
      }
      v19[2] = v41;
      swift_bridgeObjectRetain();
    }
    ++v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = v49;
    if (v18 == v55)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v19;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  uint64_t result = sub_229309390();
  __break(1u);
  return result;
}

unint64_t sub_229303C8C()
{
  unint64_t result = qword_268310190;
  if (!qword_268310190)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268310190);
  }
  return result;
}

unint64_t sub_229303CCC()
{
  unint64_t result = qword_2683101A0;
  if (!qword_2683101A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101A0);
  }
  return result;
}

uint64_t sub_229303D18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

id RRHandoffURL.toAnnotatedEntity()()
{
  uint64_t v1 = type metadata accessor for RREntity();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683101A8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 32);
  uint64_t v13 = *(void *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 64);
  *(void *)&long long v24 = *(void *)v0;
  *((void *)&v24 + 1) = v11;
  long long v25 = *(_OWORD *)(v0 + 16);
  uint64_t v26 = v12;
  long long v23 = *(_OWORD *)(v0 + 40);
  long long v27 = v23;
  uint64_t v28 = v13;
  uint64_t v29 = v14;
  if (!sub_229303FCC()) {
    return 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v1);
  if ((void)v23)
  {
    uint64_t v15 = sub_229308F90();
    OUTLINED_FUNCTION_0_2(v15);
    OUTLINED_FUNCTION_16_2(v16, (__n128)xmmword_22930D4F0);
    OUTLINED_FUNCTION_8_2(v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
LABEL_8:
    sub_2293046A4((uint64_t)v8, (uint64_t)v10);
    goto LABEL_9;
  }
  if (v14 && *(void *)(v14 + 16))
  {
    uint64_t v19 = sub_229308F90();
    OUTLINED_FUNCTION_0_2(v19);
    OUTLINED_FUNCTION_16_2(v20, (__n128)xmmword_22930D4F0);
    OUTLINED_FUNCTION_8_2(v21);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
LABEL_9:
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1))
  {
    swift_release();
    id v18 = 0;
  }
  else
  {
    sub_2292E64AC((uint64_t)v10, v4);
    long long v24 = xmmword_22930D500;
    LOBYTE(v25) = 0;
    id v18 = RREntity.toAnnotatedEntity(addUsoIdentifierIfNotPresent:configuration:)(0, (uint64_t *)&v24);
    swift_release();
    sub_2292E6510(v4);
  }
  sub_229304644((uint64_t)v10);
  return v18;
}

uint64_t sub_229303FCC()
{
  uint64_t v33 = sub_229308DD0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = v0[8];
  if (v0[5])
  {
    uint64_t v29 = v0[8];
    uint64_t v8 = v0[7];
    sub_229308E70();
    OUTLINED_FUNCTION_18();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_229308E60();
    swift_bridgeObjectRetain();
    uint64_t v10 = v9;
    OUTLINED_FUNCTION_1_5();
    sub_229308DB0();
    char v32 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v32(v6, v33);
    if (v8) {
      sub_229308E50();
    }
    if (v29)
    {
      uint64_t v11 = *(void *)(v29 + 16);
      if (v11)
      {
        sub_229303C8C();
        sub_229308EA0();
        swift_bridgeObjectRetain();
        uint64_t v12 = v29 + 40;
        uint64_t v13 = 0x1F6E74000;
        uint64_t v31 = v6;
        uint64_t v30 = v10;
        while (1)
        {
          uint64_t v34 = v11;
          OUTLINED_FUNCTION_18();
          swift_bridgeObjectRetain();
          sub_229308E90();
          sub_229304954();
          uint64_t v14 = v13;
          uint64_t v15 = MEMORY[0x263F8D310];
          sub_229309120();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268310198);
          uint64_t v16 = swift_allocObject();
          *(_OWORD *)(v16 + 16) = xmmword_22930D510;
          *(void *)(v16 + 56) = v15;
          unint64_t v17 = sub_229303CCC();
          *(void *)(v16 + 64) = v17;
          *(void *)(v16 + 32) = 0xD00000000000001ALL;
          *(void *)(v16 + 40) = 0x8000000229309F80;
          id v18 = (void *)sub_2293090E0();
          uint64_t v19 = (void *)sub_229308FE0();
          LODWORD(v14) = objc_msgSend(v18, (SEL)(v14 + 3224), v19);
          swift_bridgeObjectRelease();

          if (v14) {
            break;
          }
          uint64_t v21 = swift_allocObject();
          *(_OWORD *)(v21 + 16) = xmmword_22930D510;
          *(void *)(v21 + 56) = v15;
          *(void *)(v21 + 64) = v17;
          *(void *)(v21 + 32) = 0xD00000000000002BLL;
          *(void *)(v21 + 40) = 0x8000000229309FA0;
          uint64_t v22 = (void *)sub_2293090E0();
          long long v23 = (void *)sub_229308FE0();
          uint64_t v13 = (uint64_t)&selRef_setScore_;
          unsigned __int8 v24 = objc_msgSend(v22, sel_evaluateWithObject_, v23);

          uint64_t v20 = v31;
          if (v24)
          {
            sub_229308F00();
            OUTLINED_FUNCTION_18();
            sub_229308EF0();
            OUTLINED_FUNCTION_10_2();
            sub_229308EE0();
            swift_retain();
            sub_229308E80();
            goto LABEL_11;
          }
LABEL_12:
          v12 += 16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_1_5();
          sub_229308DB0();
          v32(v20, v33);
          swift_bridgeObjectRelease();
          swift_retain();
          uint64_t v10 = v30;
          sub_229308E40();
          swift_release_n();
          uint64_t v11 = v34 - 1;
          if (v34 == 1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_14;
          }
        }
        sub_229308ED0();
        OUTLINED_FUNCTION_18();
        sub_229308EC0();
        OUTLINED_FUNCTION_10_2();
        sub_229308EB0();
        swift_retain();
        sub_229308E80();
        uint64_t v20 = v31;
        uint64_t v13 = 0x1F6E74000;
LABEL_11:
        swift_release_n();
        goto LABEL_12;
      }
    }
LABEL_14:
    uint64_t v25 = MEMORY[0x22A6B5330](v10);
    goto LABEL_15;
  }
  if (!v7 || !*(void *)(v7 + 16)) {
    return 0;
  }
  sub_229308EA0();
  OUTLINED_FUNCTION_18();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_229308E90();
  OUTLINED_FUNCTION_13_3();
  sub_229304954();
  OUTLINED_FUNCTION_2_5();
  Swift::Bool valid = String.isValidPhoneNumber()();
  swift_bridgeObjectRelease();
  if (valid)
  {
    sub_229308ED0();
    OUTLINED_FUNCTION_18();
    sub_229308EC0();
    OUTLINED_FUNCTION_12_3();
    sub_229308EB0();
    swift_retain();
    sub_229308E80();
LABEL_24:
    swift_release_n();
    goto LABEL_25;
  }
  if (String.isValidEmailAddress()())
  {
    sub_229308F00();
    OUTLINED_FUNCTION_18();
    sub_229308EF0();
    OUTLINED_FUNCTION_12_3();
    sub_229308EE0();
    swift_retain();
    sub_229308E80();
    goto LABEL_24;
  }
LABEL_25:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_5();
  sub_229308DB0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v33);
  uint64_t v25 = MEMORY[0x22A6B5330](v26);
  swift_bridgeObjectRelease();
LABEL_15:
  swift_release();
  return v25;
}

uint64_t sub_229304644(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683101A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2293046A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683101A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t static RRHandoffURL.messageRecipientToUSOEntityBuilder(recipient:appBundleId:uniqueId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = sub_229308DD0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_1();
  uint64_t v13 = v12 - v11;
  sub_229308EA0();
  OUTLINED_FUNCTION_18();
  uint64_t v14 = sub_229308E90();
  OUTLINED_FUNCTION_13_3();
  sub_229304954();
  OUTLINED_FUNCTION_2_5();
  Swift::Bool valid = String.isValidPhoneNumber()();
  swift_bridgeObjectRelease();
  if (valid)
  {
    sub_229308ED0();
    OUTLINED_FUNCTION_18();
    sub_229308EC0();
    OUTLINED_FUNCTION_14_3();
    sub_229308EB0();
    swift_retain();
  }
  else
  {
    if (!String.isValidEmailAddress()()) {
      goto LABEL_6;
    }
    sub_229308F00();
    OUTLINED_FUNCTION_18();
    sub_229308EF0();
    OUTLINED_FUNCTION_14_3();
    sub_229308EE0();
    swift_retain();
  }
  sub_229308E80();
  swift_release_n();
LABEL_6:
  if (!a6) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_5();
  sub_229308DB0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  return v14;
}

uint64_t String.cleanPhoneNumber.getter()
{
  return OUTLINED_FUNCTION_2_5();
}

unint64_t sub_229304954()
{
  unint64_t result = qword_2683101B0;
  if (!qword_2683101B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101B0);
  }
  return result;
}

Swift::Bool __swiftcall String.isValidPhoneNumber()()
{
  return OUTLINED_FUNCTION_4_3(v0, v1, 26, 0x8000000229309F80);
}

Swift::Bool __swiftcall String.isValidEmailAddress()()
{
  return OUTLINED_FUNCTION_4_3(v0, v1, 43, 0x8000000229309FA0);
}

id sub_2293049D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_229303C8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310198);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22930D510;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_229303CCC();
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  uint64_t v7 = (void *)sub_2293090E0();
  uint64_t v8 = (void *)sub_229308FE0();
  id v9 = objc_msgSend(v7, sel_evaluateWithObject_, v8);

  return v9;
}

Swift::Bool __swiftcall String.isValidContact()()
{
  if (String.isValidEmailAddress()())
  {
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_2_5();
    Swift::Bool valid = String.isValidPhoneNumber()();
    swift_bridgeObjectRelease();
  }
  return valid;
}

uint64_t sub_229304B30(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_229304B50(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_229304B50(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683101C0);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_229307874((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t destroy for RRHandoffURL()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RRHandoffURL(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RRHandoffURL(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for RRHandoffURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RRHandoffURL(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RRHandoffURL(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRHandoffURL()
{
  return &type metadata for RRHandoffURL;
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1)
{
  uint64_t result = __swift_storeEnumTagSinglePayload(v6, 1, 1, a1);
  *uint64_t v4 = v8;
  v4[1] = v1;
  v4[2] = v7;
  v4[3] = v5;
  v4[4] = v3;
  uint64_t v10 = (void *)((char *)v4 + *(int *)(v2 + 32));
  *uint64_t v10 = 0;
  v10[1] = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return sub_229308DC0();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_229309120();
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2293049D0(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4);
}

unint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_229304954();
}

uint64_t OUTLINED_FUNCTION_7_1@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  a10 = a1;
  a11 = v12;
  return MEMORY[0x270EF23E8](&a10, v13, v13, v11, v11);
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v4 + a1) = v2;
  *uint64_t v1 = 0;
  v1[1] = 0;
  return __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return MEMORY[0x270EF23E8](va, a2, a2, v10, v10);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return 0x6E65697069636572;
}

void OUTLINED_FUNCTION_16_2(void *a1@<X8>, __n128 a2@<Q0>)
{
  *(__n128 *)(v3 + v2) = a2;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t RRVisualGroup.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t RRVisualGroup.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_22930510C(void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v7 = sub_229308F20();
  uint64_t v8 = v6;
  if (v7 == 0xD000000000000014 && v6 == 0x8000000229309FD0
    || (OUTLINED_FUNCTION_0_3() & 1) != 0
    || v7 == 0xD000000000000012 && v8 == 0x8000000229309FF0
    || (OUTLINED_FUNCTION_0_3() & 1) != 0
    || v7 == 0xD000000000000013 && v8 == 0x800000022930A010
    || (OUTLINED_FUNCTION_0_3() & 1) != 0
    || (v7 == 0x505F6E6F6D6D6F63 ? (BOOL v12 = v8 == 0xED00006E6F737265) : (BOOL v12 = 0),
        v12
     || (OUTLINED_FUNCTION_0_3() & 1) != 0
     || v7 == 0xD000000000000014 && v8 == 0x800000022930A030
     || (OUTLINED_FUNCTION_0_3() & 1) != 0
     || (v7 == 0x555F6E6F6D6D6F63 ? (BOOL v13 = v8 == 0xEA00000000006972) : (BOOL v13 = 0), v13)))
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = OUTLINED_FUNCTION_0_3();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v14 & 1) == 0) {
      return result;
    }
  }
  if (a2 > 0.0)
  {
    swift_beginAccess();
    id v10 = a1;
    MEMORY[0x22A6B5590]();
    sub_22930563C(*(void *)((*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_2293090B0();
    sub_229309090();
    uint64_t result = swift_endAccess();
    double v11 = *(double *)(v3 + 24);
    if (v11 <= a2) {
      double v11 = a2;
    }
    *(double *)(v3 + 24) = v11;
  }
  return result;
}

uint64_t sub_229305390()
{
  uint64_t v2 = v0;
  uint64_t v3 = (uint64_t *)(v0 + 16);
  uint64_t result = swift_beginAccess();
  unint64_t v5 = *(void *)(v2 + 16);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2293091F0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6 >= 2)
  {
    uint64_t v7 = *v3;
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_2293091F0();
      uint64_t v8 = result;
      if (result) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_6:
        if (v8 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = 0;
        OUTLINED_FUNCTION_1_6();
        do
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v10 = (char *)MEMORY[0x22A6B56A0](v9, v7);
          }
          else {
            id v10 = (char *)*(id *)(v7 + 8 * v9 + 32);
          }
          double v11 = v10;
          sub_2292F2E54();
          if ((v13 & 1) == 0)
          {
            double v14 = v12;
            BOOL v15 = *(void *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId] == 0x6C7070612E6D6F63
               && *(void *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8] == (void)v1;
            if (v15 || (sub_229309350() & 1) != 0)
            {
              uint64_t v16 = (double *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
              double v17 = v14 / *(double *)(v2 + 24);
              swift_beginAccess();
              *uint64_t v16 = v17;
              id v18 = v16 + 1;
            }
            else
            {
              uint64_t v1 = &v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
              swift_beginAccess();
              double v19 = *(double *)v1;
              id v18 = v1 + 8;
              if (v1[8]) {
                double v19 = 1.0;
              }
              *(double *)uint64_t v1 = v19 * (v14 / *(double *)(v2 + 24) + 999.0) / 1000.0;
              OUTLINED_FUNCTION_1_6();
            }
            *id v18 = 0;
          }
          ++v9;
        }
        while (v8 != v9);
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t RRVisualGroup.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RRVisualGroup.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_22930563C(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

uint64_t type metadata accessor for RRVisualGroup()
{
  return self;
}

uint64_t method lookup function for RRVisualGroup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RRVisualGroup);
}

uint64_t dispatch thunk of RRVisualGroup.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of RRVisualGroup.addAnnotatedEntity(annotatedEntity:entityValue:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of RRVisualGroup.setEntitiesSaliencyAdjustments()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_229309350();
}

uint64_t ResolveQuery.referenceEntity.getter()
{
  return swift_retain();
}

uint64_t ResolveQuery.alternativeEntityTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ResolveQuery.restrictedEntitiesKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void ResolveQuery.matchedResultsSetting.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 48);
}

uint64_t ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = a4;
  *(unsigned char *)(result + 48) = 0;
  return result;
}

uint64_t ResolveQuery.init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 40) = a4;
  *(unsigned char *)(v4 + 48) = 0;
  return v4;
}

uint64_t ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t result = swift_allocObject();
  char v11 = *a5;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = a4;
  *(unsigned char *)(result + 48) = v11;
  return result;
}

uint64_t ResolveQuery.init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v6 = *a5;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(unsigned char *)(v5 + 48) = v6;
  return v5;
}

uint64_t sub_229305860()
{
  BYTE8(v2) = 0;
  sub_229309170();
  sub_229309020();
  sub_229308E30();
  sub_229308DE0();
  swift_release();
  sub_229309020();
  swift_bridgeObjectRelease();
  sub_229309020();
  sub_2293059D0();
  sub_229309020();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  swift_bridgeObjectRetain();
  sub_229309020();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  *(void *)&long long v2 = *(unsigned __int8 *)(v0 + 48);
  sub_2293091C0();
  return *(void *)((char *)&v2 + 1);
}

uint64_t sub_2293059D0()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (!v1) {
    return 7104878;
  }
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_4;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2293091F0();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_4:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A6B56A0](v4, v1);
      }
      else {
        swift_retain();
      }
      ++v4;
      sub_229308E30();
      sub_229308DE0();
      swift_release();
      swift_bridgeObjectRetain();
      sub_229309020();
      swift_bridgeObjectRelease();
      sub_229309020();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t ResolveQuery.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResolveQuery.__deallocating_deinit()
{
  ResolveQuery.deinit();
  return MEMORY[0x270FA0228](v0, 49, 7);
}

uint64_t sub_229305B9C()
{
  return sub_229305860();
}

BOOL static MatchedResultsSetting.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MatchedResultsSetting.hash(into:)()
{
  return sub_2293093F0();
}

uint64_t MatchedResultsSetting.hashValue.getter()
{
  return sub_229309420();
}

unint64_t sub_229305C58()
{
  unint64_t result = qword_2683101C8;
  if (!qword_2683101C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101C8);
  }
  return result;
}

uint64_t type metadata accessor for ResolveQuery()
{
  return self;
}

uint64_t method lookup function for ResolveQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ResolveQuery);
}

uint64_t dispatch thunk of ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ResolveQuery.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t getEnumTagSinglePayload for MatchedResultsSetting(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MatchedResultsSetting(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x229305E80);
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

ValueMetadata *type metadata accessor for MatchedResultsSetting()
{
  return &type metadata for MatchedResultsSetting;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_229309020();
}

uint64_t static RRSiriReader.getReaderContent()()
{
  return sub_229305F18(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 0, 0);
}

uint64_t sub_229305F18(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t RRSiriReader.deinit()
{
  return v0;
}

uint64_t RRSiriReader.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for RRSiriReader()
{
  return self;
}

uint64_t method lookup function for RRSiriReader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RRSiriReader);
}

SiriReferenceResolutionDataModel::RREntityKey __swiftcall RREntityKey.init(appBundleId:entityId:)(Swift::String appBundleId, Swift::String entityId)
{
  *int v2 = appBundleId;
  v2[1] = entityId;
  result.entityId = entityId;
  result.appBundleId = appBundleId;
  return result;
}

uint64_t RREntityKey.appBundleId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RREntityKey.entityId.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RREntityKey.description.getter()
{
  return 0x6449797469746E65;
}

uint64_t static RREntityKey.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_229309350(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_229309350();
    }
  }
  return result;
}

uint64_t RREntityKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_229309010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_229309010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2293061F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6449797469746E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2293062FC(char a1)
{
  if (a1) {
    return 0x6449797469746E65;
  }
  else {
    return 0x6C646E7542707061;
  }
}

uint64_t sub_22930633C()
{
  return sub_2293062FC(*v0);
}

uint64_t sub_229306344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2293061F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22930636C(uint64_t a1)
{
  unint64_t v2 = sub_229306534();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2293063A8(uint64_t a1)
{
  unint64_t v2 = sub_229306534();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RREntityKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683101D8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229306534();
  sub_229309470();
  char v14 = 0;
  uint64_t v10 = v12[3];
  sub_2293092F0();
  if (!v10)
  {
    char v13 = 1;
    sub_2293092F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_229306534()
{
  unint64_t result = qword_2683101E0;
  if (!qword_2683101E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101E0);
  }
  return result;
}

uint64_t RREntityKey.hashValue.getter()
{
  return sub_229309420();
}

uint64_t RREntityKey.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2683101E8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229306534();
  sub_229309450();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v6 = sub_229309260();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_229309260();
  uint64_t v11 = v10;
  uint64_t v15 = v9;
  uint64_t v12 = OUTLINED_FUNCTION_1_7();
  v13(v12);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v15;
  a2[3] = v11;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2293067CC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return RREntityKey.init(from:)(a1, a2);
}

uint64_t sub_2293067E4(void *a1)
{
  return RREntityKey.encode(to:)(a1);
}

uint64_t sub_229306808()
{
  return sub_229309420();
}

unint64_t sub_229306890()
{
  unint64_t result = qword_26AEC8DF0;
  if (!qword_26AEC8DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AEC8DF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for RREntityKey()
{
  return &type metadata for RREntityKey;
}

unsigned char *storeEnumTagSinglePayload for RREntityKey.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2293069BCLL);
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

ValueMetadata *type metadata accessor for RREntityKey.CodingKeys()
{
  return &type metadata for RREntityKey.CodingKeys;
}

unint64_t sub_2293069F8()
{
  unint64_t result = qword_2683101F0;
  if (!qword_2683101F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101F0);
  }
  return result;
}

unint64_t sub_229306A48()
{
  unint64_t result = qword_2683101F8;
  if (!qword_2683101F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683101F8);
  }
  return result;
}

unint64_t sub_229306A98()
{
  unint64_t result = qword_268310200;
  if (!qword_268310200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310200);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

SiriReferenceResolutionDataModel::RRMentionAuthor_optional __swiftcall RRMentionAuthor.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_229309200();
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

uint64_t RRMentionAuthor.rawValue.getter()
{
  if (*v0) {
    return 1769105779;
  }
  else {
    return 1919251317;
  }
}

uint64_t sub_229306B80(char *a1, char *a2)
{
  return sub_2292F8B58(*a1, *a2);
}

uint64_t sub_229306B8C()
{
  return sub_2292F8D70();
}

uint64_t sub_229306B94()
{
  return sub_2292F910C();
}

uint64_t sub_229306B9C()
{
  return sub_2292F92B8();
}

SiriReferenceResolutionDataModel::RRMentionAuthor_optional sub_229306BA4(Swift::String *a1)
{
  return RRMentionAuthor.init(rawValue:)(*a1);
}

uint64_t sub_229306BB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RRMentionAuthor.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE400000000000000;
  return result;
}

uint64_t sub_229306BDC()
{
  return sub_229309050();
}

uint64_t sub_229306C3C()
{
  return sub_229309030();
}

void RRMentionedEvent.mentionedAuthor.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t RRMentionedEvent.entities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_229306CA0()
{
  BYTE8(v4) = 0;
  sub_229309170();
  sub_229309020();
  *(void *)&long long v4 = *(unsigned __int8 *)(v0 + 16);
  sub_2293091C0();
  sub_229309020();
  uint64_t v1 = type metadata accessor for RREntity();
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x22A6B55A0](v2, v1);
  sub_229309020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v4 + 1);
}

uint64_t RRMentionedEvent.__allocating_init(entities:mentionedBy:)()
{
  uint64_t result = OUTLINED_FUNCTION_1_8();
  char v3 = *v0;
  *(void *)(result + 24) = v1;
  *(unsigned char *)(result + 16) = v3;
  return result;
}

uint64_t RRMentionedEvent.init(entities:mentionedBy:)(uint64_t a1, char *a2)
{
  char v3 = *a2;
  *(void *)(v2 + 24) = a1;
  *(unsigned char *)(v2 + 16) = v3;
  return v2;
}

uint64_t RRMentionedEvent.__allocating_init(entitiesInGroup:mentionedBy:)()
{
  uint64_t v2 = OUTLINED_FUNCTION_1_8();
  RRMentionedEvent.init(entitiesInGroup:mentionedBy:)(v1, v0);
  return v2;
}

uint64_t RRMentionedEvent.init(entitiesInGroup:mentionedBy:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = type metadata accessor for RREntity();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v47[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  char v14 = &v47[-v13];
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (uint64_t *)&v47[-v15];
  int v17 = *a2;
  type metadata accessor for GroupIdentifierGenerator();
  swift_initStackObject();
  id v18 = GroupIdentifierGenerator.init()();
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19)
  {
    int v48 = v17;
    uint64_t v50 = v3;
    unint64_t v20 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v49 = a1;
    unint64_t v53 = v20;
    uint64_t v21 = a1 + v20;
    uint64_t v52 = *(void *)(v7 + 72);
    size_t v22 = MEMORY[0x263F8EE78];
    uint64_t v54 = v18;
    uint64_t v51 = v11;
    do
    {
      size_t v65 = v22;
      uint64_t v66 = v19;
      uint64_t v64 = v21;
      sub_2292E64AC(v21, (uint64_t)v16);
      uint64_t v23 = *v16;
      uint64_t v24 = v16[1];
      uint64_t v62 = v16[2];
      uint64_t v63 = v23;
      uint64_t v25 = v16[4];
      uint64_t v60 = v16[3];
      uint64_t v61 = v25;
      uint64_t v26 = (int *)v55;
      uint64_t v27 = *(int *)(v55 + 36);
      uint64_t v28 = (uint64_t *)((char *)v16 + *(int *)(v55 + 32));
      uint64_t v29 = v28[1];
      uint64_t v59 = *v28;
      unint64_t v31 = *(uint64_t *)((char *)v16 + v27 + 8);
      uint64_t v56 = *(uint64_t *)((char *)v16 + v27);
      uint64_t v30 = v56;
      sub_2292ED8CC(&v67);
      long long v58 = v67;
      uint64_t v32 = v68;
      uint64_t v57 = *(uint64_t *)((char *)v16 + v26[11]);
      uint64_t v33 = (uint64_t)v14 + v26[7];
      uint64_t v34 = sub_229308F90();
      __swift_storeEnumTagSinglePayload(v33, 1, 1, v34);
      unint64_t v35 = (char *)v14 + v26[10];
      char v36 = (void *)((char *)v14 + v26[12]);
      *char v14 = v63;
      v14[1] = v24;
      uint64_t v37 = v61;
      uint64_t v38 = v59;
      uint64_t v39 = v60;
      v14[2] = v62;
      v14[3] = v39;
      v14[4] = v37;
      BOOL v40 = (void *)((char *)v14 + v26[8]);
      *BOOL v40 = v38;
      v40[1] = v29;
      uint64_t v41 = (void *)((char *)v14 + v26[9]);
      *uint64_t v41 = v30;
      v41[1] = v31;
      *(_OWORD *)unint64_t v35 = v58;
      *((void *)v35 + 2) = v32;
      size_t v22 = v65;
      *(void *)((char *)v14 + v26[11]) = v57;
      *char v36 = 0;
      v36[1] = 0;
      uint64_t v42 = (uint64_t)v51;
      sub_2292E64AC((uint64_t)v14, (uint64_t)v51);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2292E2354(v56, v31);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        size_t v22 = sub_229307974(0, *(void *)(v22 + 16) + 1, 1, v22);
      }
      unint64_t v44 = *(void *)(v22 + 16);
      unint64_t v43 = *(void *)(v22 + 24);
      if (v44 >= v43 >> 1) {
        size_t v22 = sub_229307974(v43 > 1, v44 + 1, 1, v22);
      }
      *(void *)(v22 + 16) = v44 + 1;
      uint64_t v45 = v52;
      sub_229307B24(v42, v22 + v53 + v44 * v52);
      sub_2292E6510((uint64_t)v14);
      sub_2292E6510((uint64_t)v16);
      uint64_t v21 = v64 + v45;
      uint64_t v19 = v66 - 1;
    }
    while (v66 != 1);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = v50;
    LOBYTE(v17) = v48;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    size_t v22 = MEMORY[0x263F8EE78];
  }
  *(void *)(v3 + 24) = v22;
  *(unsigned char *)(v3 + 16) = v17;
  return v3;
}

uint64_t sub_2293071B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656E6F69746E656DLL && a2 == 0xEF726F6874754164;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7365697469746E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2293072CC(char a1)
{
  if (a1) {
    return 0x7365697469746E65;
  }
  else {
    return 0x656E6F69746E656DLL;
  }
}

uint64_t sub_229307310()
{
  return sub_2293072CC(*v0);
}

uint64_t sub_229307318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2293071B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_229307340(uint64_t a1)
{
  unint64_t v2 = sub_229307B88();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22930737C(uint64_t a1)
{
  unint64_t v2 = sub_229307B88();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRMentionedEvent.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RRMentionedEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_229307410(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268310208);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229307B88();
  sub_229309470();
  char v15 = *(unsigned char *)(v3 + 16);
  char v14 = 0;
  sub_229307BD4();
  sub_229309330();
  if (!v2)
  {
    uint64_t v13 = *(void *)(v3 + 24);
    v12[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268310220);
    sub_229307C90(&qword_268310228, &qword_26830FCA8);
    sub_229309330();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t RRMentionedEvent.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  RRMentionedEvent.init(from:)(a1);
  return v2;
}

uint64_t RRMentionedEvent.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310230);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229307B88();
  sub_229309450();
  if (v2)
  {
    type metadata accessor for RRMentionedEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_229307C44();
    sub_2293092A0();
    *(unsigned char *)(v1 + 16) = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268310220);
    sub_229307C90(&qword_268310240, &qword_26830FCB8);
    sub_2293092A0();
    uint64_t v6 = OUTLINED_FUNCTION_2_6();
    v7(v6);
    *(void *)(v1 + 24) = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return v1;
}

uint64_t sub_229307800@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = RRMentionedEvent.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_22930782C(void *a1)
{
  return sub_229307410(a1);
}

uint64_t sub_229307850()
{
  return sub_229306CA0();
}

char *sub_229307874(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[16 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2293078A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1
    || (uint64_t result = type metadata accessor for RREntity(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for RREntity();
    return MEMORY[0x270FA01D8](a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return MEMORY[0x270FA01D0](a3, a1, a2, result);
  }
  return result;
}

size_t sub_229307974(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310270);
  uint64_t v10 = *(void *)(type metadata accessor for RREntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for RREntity() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_2293078A0(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_229307B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_229307B88()
{
  unint64_t result = qword_268310210;
  if (!qword_268310210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310210);
  }
  return result;
}

unint64_t sub_229307BD4()
{
  unint64_t result = qword_268310218;
  if (!qword_268310218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310218);
  }
  return result;
}

uint64_t type metadata accessor for RRMentionedEvent()
{
  return self;
}

unint64_t sub_229307C44()
{
  unint64_t result = qword_268310238;
  if (!qword_268310238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310238);
  }
  return result;
}

uint64_t sub_229307C90(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268310220);
    sub_229307D10(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_229307D10(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RREntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_229307D58()
{
  unint64_t result = qword_268310248;
  if (!qword_268310248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310248);
  }
  return result;
}

ValueMetadata *type metadata accessor for RRMentionAuthor()
{
  return &type metadata for RRMentionAuthor;
}

uint64_t method lookup function for RRMentionedEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RRMentionedEvent);
}

uint64_t dispatch thunk of RRMentionedEvent.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(entities:mentionedBy:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(entitiesInGroup:mentionedBy:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of RRMentionedEvent.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unsigned char *_s32SiriReferenceResolutionDataModel15RRMentionAuthorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x229307F4CLL);
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

ValueMetadata *type metadata accessor for RRMentionedEvent.CodingKeys()
{
  return &type metadata for RRMentionedEvent.CodingKeys;
}

unint64_t sub_229307F88()
{
  unint64_t result = qword_268310250;
  if (!qword_268310250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310250);
  }
  return result;
}

unint64_t sub_229307FD8()
{
  unint64_t result = qword_268310258;
  if (!qword_268310258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310258);
  }
  return result;
}

unint64_t sub_229308028()
{
  unint64_t result = qword_268310260;
  if (!qword_268310260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310260);
  }
  return result;
}

unint64_t sub_229308074()
{
  unint64_t result = qword_268310268;
  if (!qword_268310268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310268);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

uint64_t RRFilter.userId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RRFilter.isFollowUpTurn.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

SiriReferenceResolutionDataModel::RRFilter __swiftcall RRFilter.init(userId:)(Swift::String userId)
{
  *(Swift::String *)uint64_t v1 = userId;
  *(unsigned char *)(v1 + 16) = 0;
  result.userId.value = userId;
  return result;
}

uint64_t static RRFilter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (!v3)
  {
    if (!v5) {
      return v4 ^ v6 ^ 1u;
    }
    return 0;
  }
  if (!v5) {
    return 0;
  }
  if (*(void *)a1 == *(void *)a2 && v3 == v5) {
    return v4 ^ v6 ^ 1u;
  }
  char v8 = sub_229309350();
  uint64_t result = 0;
  if (v8) {
    return v4 ^ v6 ^ 1u;
  }
  return result;
}

uint64_t RRFilter.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_229309400();
    swift_bridgeObjectRetain();
    sub_229309010();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_229309400();
  }
  return sub_229309400();
}

uint64_t sub_22930822C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x644972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_229309350() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x776F6C6C6F467369 && a2 == 0xEE006E7275547055)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_229309350();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_229308338(char a1)
{
  if (a1) {
    return 0x776F6C6C6F467369;
  }
  else {
    return 0x644972657375;
  }
}

uint64_t sub_229308378()
{
  return sub_229308338(*v0);
}

uint64_t sub_229308380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22930822C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2293083A8(uint64_t a1)
{
  unint64_t v2 = sub_22930856C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2293083E4(uint64_t a1)
{
  unint64_t v2 = sub_22930856C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RRFilter.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268310278);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22930856C();
  sub_229309470();
  char v14 = 0;
  uint64_t v9 = v11[1];
  sub_2293092D0();
  if (!v9)
  {
    char v13 = 1;
    sub_229309300();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_22930856C()
{
  unint64_t result = qword_268310280;
  if (!qword_268310280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310280);
  }
  return result;
}

uint64_t RRFilter.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2293093E0();
  sub_229309400();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_229309010();
    swift_bridgeObjectRelease();
  }
  sub_229309400();
  return sub_229309420();
}

uint64_t RRFilter.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268310288);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22930856C();
  sub_229309450();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v6 = sub_229309230();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  char v9 = sub_229309270();
  uint64_t v10 = OUTLINED_FUNCTION_2_6();
  v11(v10);
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v9 & 1;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2293087D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RRFilter.init(from:)(a1, a2);
}

uint64_t sub_2293087EC(void *a1)
{
  return RRFilter.encode(to:)(a1);
}

uint64_t sub_229308810()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_2293093E0();
  sub_229309400();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_229309010();
    swift_bridgeObjectRelease();
  }
  sub_229309400();
  return sub_229309420();
}

unint64_t sub_2293088A0()
{
  unint64_t result = qword_268310290;
  if (!qword_268310290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310290);
  }
  return result;
}

uint64_t sub_2293088F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RRFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RRFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRFilter(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RRFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RRFilter()
{
  return &type metadata for RRFilter;
}

unsigned char *storeEnumTagSinglePayload for RRFilter.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x229308B58);
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

ValueMetadata *type metadata accessor for RRFilter.CodingKeys()
{
  return &type metadata for RRFilter.CodingKeys;
}

unint64_t sub_229308B94()
{
  unint64_t result = qword_268310298;
  if (!qword_268310298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268310298);
  }
  return result;
}

unint64_t sub_229308BE4()
{
  unint64_t result = qword_2683102A0;
  if (!qword_2683102A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683102A0);
  }
  return result;
}

unint64_t sub_229308C34()
{
  unint64_t result = qword_2683102A8;
  if (!qword_2683102A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683102A8);
  }
  return result;
}

uint64_t sub_229308C80()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_229308C90()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_229308CA0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_229308CB0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_229308CC0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_229308CD0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_229308CE0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_229308CF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_229308D00()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_229308D10()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_229308D20()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_229308D30()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_229308D40()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_229308D50()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_229308D60()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_229308D70()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_229308D80()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_229308D90()
{
  return MEMORY[0x270F6BFF8]();
}

uint64_t sub_229308DA0()
{
  return MEMORY[0x270F6C000]();
}

uint64_t sub_229308DB0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_229308DC0()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_229308DD0()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_229308DE0()
{
  return MEMORY[0x270F6C9E0]();
}

uint64_t sub_229308DF0()
{
  return MEMORY[0x270F6CCE8]();
}

uint64_t sub_229308E00()
{
  return MEMORY[0x270F6CCF8]();
}

uint64_t sub_229308E10()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_229308E20()
{
  return MEMORY[0x270F6D230]();
}

uint64_t sub_229308E30()
{
  return MEMORY[0x270F6D238]();
}

uint64_t sub_229308E40()
{
  return MEMORY[0x270F6D8B8]();
}

uint64_t sub_229308E50()
{
  return MEMORY[0x270F6D8C8]();
}

uint64_t sub_229308E60()
{
  return MEMORY[0x270F6D8D0]();
}

uint64_t sub_229308E70()
{
  return MEMORY[0x270F6D8D8]();
}

uint64_t sub_229308E80()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t sub_229308E90()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_229308EA0()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_229308EB0()
{
  return MEMORY[0x270F6E618]();
}

uint64_t sub_229308EC0()
{
  return MEMORY[0x270F6E620]();
}

uint64_t sub_229308ED0()
{
  return MEMORY[0x270F6E628]();
}

uint64_t sub_229308EE0()
{
  return MEMORY[0x270F6E7A8]();
}

uint64_t sub_229308EF0()
{
  return MEMORY[0x270F6E7B0]();
}

uint64_t sub_229308F00()
{
  return MEMORY[0x270F6E7B8]();
}

uint64_t sub_229308F10()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_229308F20()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_229308F30()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_229308F40()
{
  return MEMORY[0x270F72AF0]();
}

uint64_t sub_229308F50()
{
  return MEMORY[0x270F72B00]();
}

uint64_t sub_229308F60()
{
  return MEMORY[0x270F72B08]();
}

uint64_t sub_229308F70()
{
  return MEMORY[0x270F72B18]();
}

uint64_t sub_229308F80()
{
  return MEMORY[0x270F7FFD0]();
}

uint64_t sub_229308F90()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_229308FA0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_229308FB0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_229308FC0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_229308FD0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_229308FE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_229308FF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_229309000()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_229309010()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_229309020()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_229309030()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_229309040()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_229309050()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_229309060()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_229309070()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_229309080()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_229309090()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2293090B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2293090C0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2293090D0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2293090E0()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_2293090F0()
{
  return MEMORY[0x270EF1FA8]();
}

uint64_t sub_229309100()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_229309120()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_229309130()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_229309140()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_229309150()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_229309160()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_229309170()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_229309180()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_229309190()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2293091A0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_2293091B0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2293091C0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2293091D0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2293091E0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2293091F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_229309200()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_229309210()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_229309220()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_229309230()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_229309240()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_229309250()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_229309260()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_229309270()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_229309280()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_229309290()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2293092A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2293092B0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2293092D0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2293092E0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2293092F0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_229309300()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_229309310()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_229309320()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_229309330()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_229309340()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_229309350()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_229309360()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_229309370()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_229309380()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_229309390()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2293093A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2293093B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2293093C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2293093D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2293093E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2293093F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_229309400()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_229309410()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_229309420()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_229309430()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_229309440()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_229309450()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_229309460()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_229309470()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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