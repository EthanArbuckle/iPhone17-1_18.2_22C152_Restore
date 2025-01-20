uint64_t OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, *(void *)(v1 - 304));
  return MEMORY[0x270EF65C0](v0);
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_23BD20858();
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

uint64_t OUTLINED_FUNCTION_24_1@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(v2, a2, 1, v3);
}

unint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return *(void *)(v0 - 168);
}

void OUTLINED_FUNCTION_4_3()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return sub_23BD203E8();
}

uint64_t OUTLINED_FUNCTION_4_5@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_23BD20738();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

void OUTLINED_FUNCTION_5_0()
{
  JUMPOUT(0x23ECD4DF0);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_23BD208C8();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_23BD20AB8();
}

unint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v1 = *(void *)(v0 - 88);
  *(void *)(v0 - 96) = *(void *)(v0 - 96);
  *(void *)(v0 - 88) = v1;
  return 0xD000000000000027;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  *(void *)(v1 - 160) = v0;
  return dynamic_cast_existential_1_unconditional(v0);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return *(void *)(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_23BD20758();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_23BD20928();
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_23BD20878();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return *(void *)(v0 - 432);
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return v0;
}

id OUTLINED_FUNCTION_1_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13)
{
  v18 = *(void **)(v16 - 216);
  uint64_t v19 = *(void *)(v16 - 208);
  uint64_t v20 = *(void *)(v16 - 192);
  uint64_t v21 = *(void *)(v16 - 168);
  uint64_t v22 = *(void *)(v16 - 144);
  return sub_23BD1E35C(v18, v19, v20, v15, v21, v14, v13, v22, a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  *(_DWORD *)(v9 - 216) = a8;
  *(void *)(v9 - 176) = a7;
  *(void *)(v9 - 168) = a3;
  *(void *)(v9 - 152) = a5;
  *(void *)(v9 - 144) = a6;
  *(void *)(v9 - 160) = a4;
  *(void *)(v9 - 192) = a1;
  *(void *)(v9 - 184) = a2;
  *(void *)(v9 - 136) = a9;
  *(void *)(v9 - 224) = *(void *)(v9 + 40);
  *(void *)(v9 - 208) = *(void *)(v9 + 32);
  return sub_23BD203E8();
}

uint64_t OUTLINED_FUNCTION_18_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(v2 - 144);
  return sub_23BD0773C(v4, a2);
}

uint64_t OUTLINED_FUNCTION_18_2(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 120) = v1;
  return MEMORY[0x270F4CB88](v2 - 120);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return *(void *)(v0 - 464);
}

char *OUTLINED_FUNCTION_3_5@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - a1;
}

uint64_t OUTLINED_FUNCTION_28()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
  return sub_23BD20B18();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return sub_23BD20498();
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result = swift_conformsToProtocol2();
  if (result) {
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

double OUTLINED_FUNCTION_53()
{
  *(void *)(v0 - 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return v0;
}

void OUTLINED_FUNCTION_17_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_23BD204C8();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_23BD20BB8();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_23BD203E8();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_23BD20168();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_23BD20758();
}

void OUTLINED_FUNCTION_7_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_29()
{
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_23BD20928();
}

void OUTLINED_FUNCTION_27_0()
{
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_23BD200B8();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_23BD20928();
}

double OUTLINED_FUNCTION_26_1()
{
  *(void *)(v0 - 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_23BD204F8();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_23BD20368();
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

void OUTLINED_FUNCTION_30()
{
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return *(void *)(v0 - 608);
}

uint64_t Track.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82A28);
  uint64_t v4 = OUTLINED_FUNCTION_5(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_23BD20778();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C20);
  uint64_t v15 = OUTLINED_FUNCTION_5(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_0();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_23BD204D8();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_0();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = sub_23BD207C8();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1_0();
  uint64_t v30 = v29 - v28;
  if (objc_msgSend(a1, sel_hasVideo)
    && (objc_msgSend(a1, sel_isArtistUploadedContent) & 1) == 0)
  {
    id v37 = a1;
    sub_23BD06DCC((uint64_t)v37, &qword_26AD82C20, MEMORY[0x263F13880], (void (*)(uint64_t, void))sub_23BD1850C);
    if (__swift_getEnumTagSinglePayload(v18, 1, v19) != 1)
    {

      v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
      v35(v24, v18, v19);
      v35(v30, v24, v19);
      v34 = (unsigned int *)MEMORY[0x263F13C00];
      goto LABEL_12;
    }
    sub_23BD0773C(v18, &qword_26AD82C20);
  }
  if ((objc_msgSend(a1, sel_hasVideo) & 1) == 0)
  {
    sub_23BD06DCC((uint64_t)a1, (uint64_t *)&unk_26AD82A28, MEMORY[0x263F13B48], (void (*)(uint64_t, void))sub_23BD18764);
    if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
    {
      uint64_t v31 = sub_23BD0773C(v7, (uint64_t *)&unk_26AD82A28);
      goto LABEL_9;
    }
    v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32);
    v33(v13, v7, v8);
    v33(v30, v13, v8);
    v34 = (unsigned int *)MEMORY[0x263F13C08];
LABEL_12:
    (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v30, *v34, v25);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(a2, v30, v25);
    uint64_t v32 = 0;
    return OUTLINED_FUNCTION_4(v31, v32);
  }

LABEL_9:
  uint64_t v32 = 1;
  return OUTLINED_FUNCTION_4(v31, v32);
}

uint64_t sub_23BD06DCC(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), void (*a4)(uint64_t, void))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = a3(0);
  a4(a1, MEMORY[0x263F8EE78]);
  if (__swift_getEnumTagSinglePayload(v4, 1, v11))
  {
    uint64_t v12 = sub_23BD0773C(v4, a2);
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_3();
    uint64_t v12 = v15(v14);
    uint64_t v13 = 0;
  }
  return OUTLINED_FUNCTION_4(v12, v13);
}

uint64_t sub_23BD06EBC(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82C70, MEMORY[0x263F13DF0], (void (*)(uint64_t, void))sub_23BD18BD0);
}

uint64_t sub_23BD06EF0(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82C60, (void (*)(uint64_t, void))sub_23BD18BB0, MEMORY[0x263F13D20]);
}

uint64_t sub_23BD06F24(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82C20, (void (*)(uint64_t, void))sub_23BD1850C, MEMORY[0x263F13880]);
}

uint64_t sub_23BD06F58(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, void), uint64_t (*a4)(void))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2();
  a3(a1, MEMORY[0x263F8EE78]);
  uint64_t v11 = a4(0);
  if (__swift_getEnumTagSinglePayload(v4, 1, v11))
  {
    uint64_t v12 = sub_23BD0773C(v4, a2);
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_3();
    uint64_t v12 = v15(v14);
    uint64_t v13 = 0;
  }
  return OUTLINED_FUNCTION_4(v12, v13);
}

uint64_t sub_23BD07050(uint64_t a1)
{
  return sub_23BD06F58(a1, qword_26AD82A38, (void (*)(uint64_t, void))sub_23BD18948, MEMORY[0x263F13BB8]);
}

uint64_t sub_23BD07084(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82BC0, MEMORY[0x263F56C80], (void (*)(uint64_t, void))sub_23BD17ED4);
}

uint64_t sub_23BD070B8(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_268A82FB0, MEMORY[0x263F13D98], (void (*)(uint64_t, void))sub_23BD18C38);
}

uint64_t sub_23BD070EC(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82BA0, (void (*)(uint64_t, void))sub_23BD17C54, MEMORY[0x263F56C38]);
}

uint64_t sub_23BD07120(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82BE8, (void (*)(uint64_t, void))sub_23BD183EC, MEMORY[0x263F56D30]);
}

uint64_t sub_23BD07154(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82C30, (void (*)(uint64_t, void))sub_23BD18744, MEMORY[0x263F13928]);
}

uint64_t sub_23BD07188(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82C78, (void (*)(uint64_t, void))sub_23BD18EA4, MEMORY[0x263F13E20]);
}

uint64_t sub_23BD071BC(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82BF0, (void (*)(uint64_t, void))sub_23BD1847C, MEMORY[0x263F56D78]);
}

uint64_t sub_23BD071F0(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82BC8, (void (*)(uint64_t, void))sub_23BD17F1C, MEMORY[0x263F56CB8]);
}

uint64_t sub_23BD07224(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82BB0, (void (*)(uint64_t, void))sub_23BD17C9C, MEMORY[0x263F56C60]);
}

uint64_t sub_23BD07258(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82C48, (void (*)(uint64_t, void))sub_23BD189A8, MEMORY[0x263F13C80]);
}

uint64_t sub_23BD0728C(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82C70, (void (*)(uint64_t, void))sub_23BD18BD0, MEMORY[0x263F13DF0]);
}

uint64_t sub_23BD072C0(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82BF8, (void (*)(uint64_t, void))sub_23BD184C4, MEMORY[0x263F56DC8]);
}

uint64_t sub_23BD072F4(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82B90, (void (*)(uint64_t, void))sub_23BD179A4, MEMORY[0x263F56B10]);
}

uint64_t sub_23BD07328(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_268A82FB8, (void (*)(uint64_t, void))sub_23BD18434, MEMORY[0x263F56D50]);
}

uint64_t sub_23BD0735C(uint64_t a1)
{
  return sub_23BD06DCC(a1, qword_26AD82A38, MEMORY[0x263F13BB8], (void (*)(uint64_t, void))sub_23BD18948);
}

uint64_t sub_23BD07390(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_26AD82C48, MEMORY[0x263F13C80], (void (*)(uint64_t, void))sub_23BD189A8);
}

uint64_t sub_23BD073C4(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_26AD82BA0, MEMORY[0x263F56C38], (void (*)(uint64_t, void))sub_23BD17C54);
}

uint64_t sub_23BD073F8(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82C58, MEMORY[0x263F13CF8], (void (*)(uint64_t, void))sub_23BD189C8);
}

uint64_t sub_23BD0742C(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82C78, MEMORY[0x263F13E20], (void (*)(uint64_t, void))sub_23BD18EA4);
}

uint64_t sub_23BD07460(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_26AD82BB0, MEMORY[0x263F56C60], (void (*)(uint64_t, void))sub_23BD17C9C);
}

uint64_t sub_23BD07494(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_26AD82B90, MEMORY[0x263F56B10], (void (*)(uint64_t, void))sub_23BD179A4);
}

uint64_t sub_23BD074C8(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82C30, MEMORY[0x263F13928], (void (*)(uint64_t, void))sub_23BD18744);
}

uint64_t sub_23BD074FC(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_26AD82C60, MEMORY[0x263F13D20], (void (*)(uint64_t, void))sub_23BD18BB0);
}

uint64_t sub_23BD07530(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82BF8, MEMORY[0x263F56DC8], (void (*)(uint64_t, void))sub_23BD184C4);
}

uint64_t sub_23BD07564(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82BF0, MEMORY[0x263F56D78], (void (*)(uint64_t, void))sub_23BD1847C);
}

uint64_t sub_23BD07598(uint64_t a1)
{
  return sub_23BD06DCC(a1, &qword_26AD82BE8, MEMORY[0x263F56D30], (void (*)(uint64_t, void))sub_23BD183EC);
}

uint64_t sub_23BD075CC(uint64_t a1)
{
  return sub_23BD06DCC(a1, (uint64_t *)&unk_268A82FA0, MEMORY[0x263F571D8], (void (*)(uint64_t, void))sub_23BD18BF0);
}

uint64_t sub_23BD07600(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82A28, (void (*)(uint64_t, void))sub_23BD18764, MEMORY[0x263F13B48]);
}

uint64_t sub_23BD07634(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_268A82FB0, (void (*)(uint64_t, void))sub_23BD18C38, MEMORY[0x263F13D98]);
}

uint64_t sub_23BD07668(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82C58, (void (*)(uint64_t, void))sub_23BD189C8, MEMORY[0x263F13CF8]);
}

uint64_t sub_23BD0769C(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_268A82FA0, (void (*)(uint64_t, void))sub_23BD18BF0, MEMORY[0x263F571D8]);
}

uint64_t sub_23BD076D0(uint64_t a1)
{
  return sub_23BD06F58(a1, (uint64_t *)&unk_26AD82BD8, (void (*)(uint64_t, void))sub_23BD18184, MEMORY[0x263F56CE8]);
}

uint64_t sub_23BD07704(uint64_t a1)
{
  return sub_23BD06F58(a1, &qword_26AD82BC0, (void (*)(uint64_t, void))sub_23BD17ED4, MEMORY[0x263F56C80]);
}

uint64_t sub_23BD0773C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t MusicCollaborativePlaylist.EndCollaborationRequest.init(playlist:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BD20878();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  id v14 = a1;
  sub_23BD06EBC((uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {

    sub_23BD0797C((uint64_t)v6);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_23BD1FE88();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_23BD1FEA8();
  return __swift_storeEnumTagSinglePayload(a2, v15, 1, v16);
}

uint64_t sub_23BD0797C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MusicCollaborativePlaylist.EndCollaborationRequest.perform()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BD07A6C;
  return MEMORY[0x270F4CAE8]();
}

uint64_t sub_23BD07A6C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23BD07BA0, 0, 0);
  }
}

uint64_t sub_23BD07BA0()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = v0[6];
    sub_23BD20B18();
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    sub_23BD20928();
    v0[4] = v3;
    sub_23BD20B98();
    sub_23BD20928();
    return sub_23BD20BB8();
  }
}

uint64_t Artwork.init(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82B50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[4] = &type metadata for SoftLinking_ArtworkCatalog;
  v7[5] = sub_23BD07DC8();
  v7[1] = a1;
  uint64_t v5 = sub_23BD207F8();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  return sub_23BD20808();
}

unint64_t sub_23BD07DC8()
{
  unint64_t result = qword_26AD82B00;
  if (!qword_26AD82B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD82B00);
  }
  return result;
}

id static MusicVideo.canBeConverted(from:)(void *a1)
{
  id result = objc_msgSend(a1, sel_hasVideo);
  if (result) {
    return (id)(objc_msgSend(a1, sel_isArtistUploadedContent) ^ 1);
  }
  return result;
}

uint64_t LegacyModelObjectConvertible<>.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_23BD20AB8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - v12;
  sub_23BD200C8();
  uint64_t v14 = sub_23BD20A28();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, v14, a2, a3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, a2))
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a2 - 8) + 32))(a4, v13, a2);
    uint64_t v15 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a4, v15, 1, a2);
}

uint64_t LegacyModelObjectConvertible<>.init(_:requestedRelationshipProperties:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v39 = a6;
  uint64_t v11 = sub_23BD20468();
  OUTLINED_FUNCTION_0_0();
  uint64_t v36 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_0();
  uint64_t v14 = sub_23BD203E8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v37 = v15;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v35 - v20;
  if (((*(uint64_t (**)(void *, uint64_t, uint64_t))(a5 + 32))(a1, a3, a5) & 1) == 0)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    uint64_t v26 = 1;
    return __swift_storeEnumTagSinglePayload(v39, v26, 1, a3);
  }
  uint64_t v35 = a2;
  if (!dynamic_cast_existential_1_conditional(a3))
  {
    swift_bridgeObjectRelease();
    if (qword_26AD82C88 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_23BD200A8();
    __swift_project_value_buffer(v28, (uint64_t)qword_26AD82D20);
    uint64_t v29 = sub_23BD20088();
    os_log_type_t v30 = sub_23BD20A98();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(void *)&v40[0] = v32;
      *(_DWORD *)uint64_t v31 = 136446210;
      uint64_t v33 = sub_23BD20CA8();
      uint64_t v42 = sub_23BD088E0(v33, v34, (uint64_t *)v40);
      sub_23BD20AD8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23BD04000, v29, v30, "Cannot create a MusicIdentifierSet for item type %{public}s, that does not conform to MusicItemTypeValueProviding.", v31, 0xCu);
      uint64_t v26 = 1;
      swift_arrayDestroy();
      MEMORY[0x23ECD4DF0](v32, -1, -1);
      MEMORY[0x23ECD4DF0](v31, -1, -1);

      return __swift_storeEnumTagSinglePayload(v39, v26, 1, a3);
    }

    goto LABEL_5;
  }
  uint64_t v22 = a1;
  id v23 = objc_msgSend(a1, sel_identifiers);
  sub_23BD20498();
  sub_23BD08618(v6, (uint64_t)v21);

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v6, v11);
  uint64_t v24 = v37;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v19, v21, v14);
  uint64_t v41 = 0;
  memset(v40, 0, sizeof(v40));
  sub_23BD200C8();
  sub_23BD200B8();
  id v25 = v22;
  sub_23BD20B88();
  swift_bridgeObjectRelease();
  sub_23BD20758();

  (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v14);
  uint64_t v26 = 0;
  return __swift_storeEnumTagSinglePayload(v39, v26, 1, a3);
}

uint64_t LegacyModelObjectConvertible<>.convertToLegacyModelObject(reason:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_0();
  id v10 = sub_23BD0F570(v8, v9);
  id v11 = objc_msgSend(v10, sel__underlyingModelObject);
  swift_getAssociatedTypeWitness();
  uint64_t v12 = swift_dynamicCastUnknownClass();
  if (v12)
  {
    uint64_t v13 = v12;

    return v13;
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v2, a2);
    sub_23BD20B18();
    sub_23BD20928();
    id v15 = objc_msgSend(v10, sel__underlyingModelObject, 0, 0xE000000000000000);
    id v16 = objc_msgSend(v15, sel_description);
    sub_23BD208E8();

    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    swift_getDynamicType();
    sub_23BD20CA8();
    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    sub_23BD20CA8();
    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    uint64_t result = sub_23BD20BB8();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BD08618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B18);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = sub_23BD204B8();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BD20468();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v3, a1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B70);
  uint64_t v12 = sub_23BD20488();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23BD21280;
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v16 + v15, *MEMORY[0x263F13788], v12);
  sub_23BD204A8();
  uint64_t v17 = sub_23BD20478();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v17);
  uint64_t v18 = (void *)swift_unknownObjectRetain();
  return sub_23BD120F0(v18, v3, (uint64_t)v9, v2, a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23BD088E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23BD089B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23BD090BC((uint64_t)v12, *a3);
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
      sub_23BD090BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23BD089B4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23BD08B0C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23BD20AE8();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_23BD08BE4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_23BD20B38();
    if (!v8)
    {
      uint64_t result = sub_23BD20BA8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_23BD08B0C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23BD20BD8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_23BD08BE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23BD08C7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23BD08DF0(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23BD08DF0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23BD08C7C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_23BD20938();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_23BD0C4C8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_23BD20B28();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_23BD20BD8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_23BD20BA8();
  __break(1u);
  return result;
}

char *sub_23BD08DF0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_268A83028);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_23BD08FA0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23BD08EC8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23BD08EC8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23BD20BD8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_23BD08FA0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23BD20BD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t dispatch thunk of LegacyModelObjectConvertible.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of LegacyModelObjectConvertible.init(_:requestedRelationshipProperties:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of static LegacyModelObjectConvertible.canBeConverted(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
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

uint64_t sub_23BD090BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for SoftLinking_ArtworkCatalog()
{
  return &type metadata for SoftLinking_ArtworkCatalog;
}

uint64_t sub_23BD0912C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_23BD208A8();

  return v4;
}

uint64_t sub_23BD09198(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_23BD208E8();

  return v4;
}

id sub_23BD091F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82B50);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BD207F8();
  __swift_storeEnumTagSinglePayload(a2, 1, 1, v7);
  id result = objc_msgSend(a1, sel_musicKit_existingColorAnalysis);
  if (result)
  {
    int64_t v9 = result;
    id v10 = objc_msgSend(result, sel_musicKit_backgroundColor);
    id v11 = objc_msgSend(v9, sel_musicKit_primaryTextColor);
    id v12 = objc_msgSend(v9, sel_musicKit_secondaryTextColor);
    id v13 = objc_msgSend(v9, sel_musicKit_tertiaryTextColor);
    sub_23BD207E8();
    swift_unknownObjectRelease();
    sub_23BD09FD4(a2);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
    return (id)sub_23BD0A034((uint64_t)v6, a2, qword_26AD82B50);
  }
  return result;
}

id sub_23BD09378(void *a1)
{
  return objc_msgSend(a1, sel_musicKit_fittingSize);
}

id sub_23BD09384()
{
  return objc_msgSend(*v0, sel_musicKit_setFittingSize_);
}

uint64_t sub_23BD09394(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  return OUTLINED_FUNCTION_1((uint64_t)sub_23BD093AC);
}

uint64_t sub_23BD093AC()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_23BD094A4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23BD09614;
  v0[13] = &block_descriptor_4;
  v0[14] = v2;
  objc_msgSend(v1, sel_musicKit_requestImageDataWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23BD094A4()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 144) = v1;
  if (v1) {
    uint64_t v3 = sub_23BD095AC;
  }
  else {
    uint64_t v3 = sub_23BD09590;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_23BD09590()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 120), *(void *)(v0 + 128));
}

uint64_t sub_23BD095AC()
{
  OUTLINED_FUNCTION_3_1();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23BD09614(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return sub_23BD096A0(v3, (uint64_t)a3);
  }
  id v5 = a2;
  uint64_t v6 = sub_23BD1FD98();
  uint64_t v8 = v7;

  return sub_23BD09704(v3, v6, v8);
}

uint64_t sub_23BD096A0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A83058);
  uint64_t v4 = swift_allocError();
  *id v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_23BD09704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 40);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return swift_continuation_throwingResume();
}

uint64_t sub_23BD09728(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return OUTLINED_FUNCTION_1((uint64_t)sub_23BD09740);
}

uint64_t sub_23BD09740()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_23BD09838;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23BD09A40;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_musicKit_requestColorAnalysisWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23BD09838()
{
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v2 = v1;
  return MEMORY[0x270FA2498](sub_23BD09910, 0, 0);
}

uint64_t sub_23BD09910()
{
  uint64_t v1 = *(void **)(v0 + 120);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 120), sel_musicKit_backgroundColor);
    id v3 = objc_msgSend(v1, sel_musicKit_primaryTextColor);
    id v4 = objc_msgSend(v1, sel_musicKit_secondaryTextColor);
    id v5 = objc_msgSend(v1, sel_musicKit_tertiaryTextColor);
  }
  uint64_t v6 = *(void *)(v0 + 128);
  sub_23BD207E8();
  swift_unknownObjectRelease();
  uint64_t v7 = sub_23BD207F8();
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v7);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_23BD09A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  swift_unknownObjectRetain();

  return sub_23BD09A84(v3, a2);
}

uint64_t sub_23BD09A84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  sub_23BD0A034((uint64_t)&v3, *(void *)(*(void *)(a1 + 64) + 40), &qword_268A83048);
  return swift_continuation_resume();
}

id sub_23BD09AE0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_musicKit_artworkCatalogWithFittingSize_);

  return v1;
}

uint64_t sub_23BD09B14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  a2[3] = swift_getObjectType();
  *a2 = a1;

  return swift_unknownObjectRetain();
}

uint64_t sub_23BD09B58()
{
  return sub_23BD09198(*v0, (SEL *)&selRef_musicKit_artworkDataSourceShortDescription);
}

uint64_t sub_23BD09B7C()
{
  return sub_23BD09198(*v0, (SEL *)&selRef_musicKit_artworkDataSourceIdentifier);
}

uint64_t sub_23BD09BA0()
{
  return sub_23BD0912C(*v0, (SEL *)&selRef_musicKit_artworkTokenParameters);
}

uint64_t sub_23BD09BD8()
{
  return sub_23BD0912C(*v0, (SEL *)&selRef_musicKit_artworkDictionary);
}

uint64_t sub_23BD09C18()
{
  return sub_23BD09198(*v0, (SEL *)&selRef_musicKit_visualIdenticalityIdentifier);
}

id sub_23BD09C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_23BD091F8(*v1, a1);
}

id sub_23BD09C44()
{
  return sub_23BD09378(*v0);
}

id (*sub_23BD09C50(void *a1))()
{
  a1[2] = v1;
  sub_23BD09378(*v1);
  *a1 = v3;
  a1[1] = v4;
  return sub_23BD09C9C;
}

id sub_23BD09C9C()
{
  return sub_23BD09384();
}

id sub_23BD09CC4@<X0>(void *a1@<X8>)
{
  id result = sub_23BD09AE0(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_23BD09CF0()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_23BD09D84;
  return sub_23BD09394(v2);
}

uint64_t sub_23BD09D84()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v7 = v6;
  uint64_t v8 = swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v0)
  {
    uint64_t v8 = v5;
    uint64_t v9 = v3;
  }
  return v10(v8, v9);
}

uint64_t sub_23BD09E64(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23BD09F04;
  return sub_23BD09728(a1, v4);
}

uint64_t sub_23BD09F04()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_23BD09FCC@<X0>(void *a1@<X8>)
{
  return sub_23BD09B14(*v1, a1);
}

uint64_t sub_23BD09FD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BD0A034(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_23BD0A098()
{
}

void sub_23BD0A0D4()
{
  OUTLINED_FUNCTION_18();
  uint64_t v21 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  v6(0);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v20 - v11;
  sub_23BD20738();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v0, v5);
  unint64_t v15 = *(void (**)(void))(v8 + 16);
  OUTLINED_FUNCTION_19();
  v15();
  uint64_t v16 = (void *)v3(v12, v0);
  id v17 = objc_msgSend(v16, sel__underlyingModelObject);
  self;
  if (!swift_dynamicCastObjCClass())
  {

    OUTLINED_FUNCTION_19();
    v15();
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_23BD20B18();
    sub_23BD20928();
    id v18 = objc_msgSend(v16, sel__underlyingModelObject);
    id v19 = objc_msgSend(v18, sel_description);
    sub_23BD208E8();

    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    sub_23BD20CA8();
    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    sub_23BD0C15C(0, v21);
    sub_23BD20CA8();
    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    OUTLINED_FUNCTION_8();
    uint64_t v20 = 33;
    sub_23BD20BB8();
    OUTLINED_FUNCTION_29();
  }

  OUTLINED_FUNCTION_17();
}

void MusicLibraryPlaylistEditViewModel.init(_:authorProfile:mediaLibrary:)()
{
  OUTLINED_FUNCTION_18();
  uint64_t v30 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BC0);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_2();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_13();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  uint64_t v16 = OUTLINED_FUNCTION_5(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_3_2();
  uint64_t v19 = v17 - v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_23();
  MEMORY[0x270FA5388](v21);
  unint64_t v23 = (char *)&v29 - v22;
  uint64_t v24 = sub_23BD20878();
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, v24);
  if (v8)
  {
    sub_23BD06EBC((uint64_t)v8);
    sub_23BD0B75C((uint64_t)v23, &qword_26AD82C70);
    sub_23BD0A620(v2, (uint64_t)v23, &qword_26AD82C70);
  }
  uint64_t v25 = sub_23BD20028();
  OUTLINED_FUNCTION_25(v25);
  if (v6)
  {
    sub_23BD07084((uint64_t)v6);
    sub_23BD0B75C(v1, &qword_26AD82BC0);
    sub_23BD0A620(v13, v1, &qword_26AD82BC0);
  }
  sub_23BD20558();
  id v26 = v4;
  sub_23BD0CFA4(v26);
  sub_23BD0A5C4((uint64_t)v23, v19, &qword_26AD82C70);
  sub_23BD0A5C4(v1, v13, &qword_26AD82BC0);
  uint64_t v27 = v6;
  id v28 = v8;
  sub_23BD1FFE8();

  sub_23BD0B75C(v1, &qword_26AD82BC0);
  sub_23BD0B75C((uint64_t)v23, &qword_26AD82C70);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD0A5C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_23BD0A620(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

void MusicLibraryPlaylistEditViewModel.init(_:initialTracklist:authorProfile:mediaLibrary:)()
{
  OUTLINED_FUNCTION_18();
  unint64_t v34 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BC0);
  uint64_t v11 = OUTLINED_FUNCTION_5(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_24();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_13();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  uint64_t v16 = OUTLINED_FUNCTION_5(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_24();
  uint64_t v33 = v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v32 - v19;
  uint64_t v21 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_14();
  id v35 = v9;
  sub_23BD06EBC((uint64_t)v35);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1)
  {
    sub_23BD0B75C((uint64_t)v20, &qword_26AD82C70);
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    sub_23BD20B18();
    OUTLINED_FUNCTION_26();
    id v31 = objc_msgSend(v35, sel_description);
    sub_23BD208E8();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_22();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    OUTLINED_FUNCTION_8();
    v32[0] = 43;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_29();
  }
  uint64_t v36 = v0;
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v2, v20, v21);
  uint64_t v25 = sub_23BD20028();
  OUTLINED_FUNCTION_25(v25);
  if (v5)
  {
    sub_23BD07084((uint64_t)v5);
    sub_23BD0B75C(v1, &qword_26AD82BC0);
    sub_23BD0A620(v13, v1, &qword_26AD82BC0);
  }
  sub_23BD20558();
  unint64_t v34 = v34;
  v32[1] = sub_23BD0CFA4(v34);
  uint64_t v26 = v33;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v33, v2, v21);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v21);
  sub_23BD0A5C4(v1, v13, &qword_26AD82BC0);
  uint64_t v27 = v5;
  id v28 = v35;
  id v29 = v7;
  v32[0] = v2;
  id v30 = v29;
  sub_23BD1FFE8();

  sub_23BD0B75C(v1, &qword_26AD82BC0);
  (*(void (**)(void, uint64_t))(v23 + 8))(v32[0], v21);
  OUTLINED_FUNCTION_17();
}

uint64_t MusicLibraryPlaylistEditViewModel.tracklist.getter()
{
  uint64_t result = sub_23BD1FFB8();
  if (result)
  {
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (!result)
    {
      uint64_t result = sub_23BD20BB8();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23BD0AA7C()
{
  return MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.setter();
}

uint64_t (*MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvg_0();
  a1[1] = v3;
  return sub_23BD0AB08;
}

uint64_t sub_23BD0AB08(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvs_0();
  }
  swift_bridgeObjectRetain();
  _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvs_0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23BD0AB7C()
{
  sub_23BD1FF88();
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = sub_23BD20BB8();
    __break(1u);
  }
  return result;
}

uint64_t MusicLibraryPlaylistEditViewModel.append(_:)(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return OUTLINED_FUNCTION_1((uint64_t)sub_23BD0AC30);
}

uint64_t sub_23BD0AC30()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)sub_23BD0AB7C();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_23BD0AD30;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23BD0AECC;
  v0[13] = &block_descriptor_0;
  v0[14] = v3;
  objc_msgSend(v2, sel_appendItem_completion_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23BD0AD30()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 144) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_23BD0AE0C()
{
  OUTLINED_FUNCTION_4_0();

  OUTLINED_FUNCTION_11();
  return v1();
}

uint64_t sub_23BD0AE64()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  OUTLINED_FUNCTION_20();
  return v2();
}

uint64_t sub_23BD0AECC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_23BD0969C(v2, v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t MusicLibraryPlaylistEditViewModel.insert(_:after:)(uint64_t a1, uint64_t a2)
{
  v3[24] = a2;
  v3[25] = v2;
  v3[23] = a1;
  return OUTLINED_FUNCTION_1((uint64_t)sub_23BD0AF48);
}

uint64_t sub_23BD0AF48()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 18;
  id v3 = (void *)v1[24];
  uint64_t v4 = v1[23];
  if (v3)
  {
    uint64_t v5 = v1 + 10;
    id v6 = v3;
    uint64_t v7 = (void *)sub_23BD0AB7C();
    v1[26] = v7;
    v1[10] = v1;
    v1[11] = sub_23BD0B118;
    uint64_t v8 = swift_continuation_init();
    v1[18] = MEMORY[0x263EF8330];
    v1[19] = 0x40000000;
    v1[20] = sub_23BD0AECC;
    v1[21] = &block_descriptor_4_0;
    v1[22] = v8;
    objc_msgSend(v7, sel_insertItem_afterEntry_completion_, v4, v6, v2);
  }
  else
  {
    uint64_t v5 = v1 + 2;
    uint64_t v9 = (void *)sub_23BD0AB7C();
    v1[28] = v9;
    v1[2] = v1;
    v1[3] = sub_23BD0B254;
    uint64_t v10 = swift_continuation_init();
    v1[18] = MEMORY[0x263EF8330];
    v1[19] = 0x40000000;
    v1[20] = sub_23BD0AECC;
    v1[21] = &block_descriptor_2;
    v1[22] = v10;
    objc_msgSend(v9, sel_insertItemAtStart_completion_, v4, v2);
  }
  return MEMORY[0x270FA23F0](v5);
}

uint64_t sub_23BD0B118()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 216) = *(void *)(v3 + 112);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_23BD0B1F4()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = *(void **)(v0 + 192);

  OUTLINED_FUNCTION_11();
  return v2();
}

uint64_t sub_23BD0B254()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 232) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_23BD0B330()
{
  OUTLINED_FUNCTION_4_0();

  OUTLINED_FUNCTION_11();
  return v1();
}

uint64_t sub_23BD0B388()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(void **)(v0 + 192);
  swift_willThrow();

  OUTLINED_FUNCTION_20();
  return v3();
}

uint64_t sub_23BD0B3F8()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = *(void **)(v0 + 224);
  swift_willThrow();

  OUTLINED_FUNCTION_20();
  return v2();
}

void MusicLibraryPlaylistEditViewModel.move(_:after:)()
{
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_23BD20868();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_2();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A82FB0);
  uint64_t v14 = OUTLINED_FUNCTION_5(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_2();
  uint64_t v17 = v15 - v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_23();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_13();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v6);
  id v20 = v5;
  sub_23BD070B8((uint64_t)v20);
  if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
  {
    sub_23BD0B75C(v1, &qword_268A82FB0);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_26();
    id v23 = objc_msgSend(v20, sel_description);
    sub_23BD208E8();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_22();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_8();
    uint64_t v24 = 103;
    goto LABEL_8;
  }
  uint64_t v21 = *(void (**)(void))(v8 + 32);
  OUTLINED_FUNCTION_10_0();
  v21();
  if (v3)
  {
    id v22 = v3;
    sub_23BD070B8((uint64_t)v22);
    if (__swift_getEnumTagSinglePayload(v17, 1, v6) != 1)
    {
      sub_23BD0B75C(v0, &qword_268A82FB0);

      OUTLINED_FUNCTION_10_0();
      v21();
      OUTLINED_FUNCTION_10_0();
      v21();
      __swift_storeEnumTagSinglePayload(v0, 0, 1, v6);
      goto LABEL_5;
    }
    sub_23BD0B75C(v17, &qword_268A82FB0);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_26();
    id v25 = objc_msgSend(v22, sel_description);
    sub_23BD208E8();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_22();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_8();
    uint64_t v24 = 107;
LABEL_8:
    uint64_t v26 = v24;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_29();
  }
LABEL_5:
  sub_23BD1FFC8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v6);
  sub_23BD0B75C(v0, &qword_268A82FB0);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD0B75C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t MusicLibraryPlaylistEditViewModel.remove(_:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A82FB0);
  uint64_t v3 = OUTLINED_FUNCTION_5(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23BD20868();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a1;
  sub_23BD070B8((uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_23BD0B75C((uint64_t)v5, &qword_268A82FB0);
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    sub_23BD20B18();
    OUTLINED_FUNCTION_26();
    id v14 = objc_msgSend(v12, sel_description);
    sub_23BD208E8();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_22();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_29();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v5, v6);
  sub_23BD1FFD8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v6);
}

uint64_t MusicLibraryPlaylistEditViewModel.commit()()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = sub_23BD20738();
  v0[2] = v1;
  OUTLINED_FUNCTION_2_2(v1);
  v0[3] = v2;
  v0[4] = swift_task_alloc();
  uint64_t v3 = sub_23BD20878();
  v0[5] = v3;
  OUTLINED_FUNCTION_2_2(v3);
  v0[6] = v4;
  uint64_t v5 = swift_task_alloc();
  v0[7] = v5;
  uint64_t v8 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F56AB8] + MEMORY[0x263F56AB8]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_23BD0BAC4;
  return v8(v5);
}

uint64_t sub_23BD0BAC4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  *(void *)(v1 + 72) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_23BD0BBA4()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v4, *MEMORY[0x263F13AC0], v5);
  sub_23BD0A0D4();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v8);
}

uint64_t sub_23BD0BCD4()
{
  OUTLINED_FUNCTION_4_0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  return v0();
}

uint64_t MusicLibraryPlaylistEditViewModel.Error.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23BD20BE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static MusicLibraryPlaylistEditViewModel.Error.allCases.getter()
{
  return &unk_26EF28660;
}

uint64_t MusicLibraryPlaylistEditViewModel.Error.rawValue.getter()
{
  return 0x6C62616464616E75;
}

uint64_t sub_23BD0BDC4@<X0>(BOOL *a1@<X8>)
{
  return MusicLibraryPlaylistEditViewModel.Error.init(rawValue:)(a1);
}

uint64_t sub_23BD0BDD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MusicLibraryPlaylistEditViewModel.Error.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_23BD0BE0C()
{
  unint64_t result = qword_268A83078;
  if (!qword_268A83078)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A83080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A83078);
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

void sub_23BD0BEA8(void *a1@<X8>)
{
  *a1 = &unk_26EF28660;
}

unint64_t sub_23BD0BEBC()
{
  unint64_t result = qword_268A83088;
  if (!qword_268A83088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A83088);
  }
  return result;
}

uint64_t sub_23BD0BF0C()
{
  return sub_23BD20C98();
}

uint64_t sub_23BD0BF70()
{
  return sub_23BD20918();
}

uint64_t sub_23BD0BF98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _s5ErrorOwet(unsigned int *a1, int a2)
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

unsigned char *_s5ErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23BD0C0BCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23BD0C0E4()
{
  return 0;
}

ValueMetadata *type metadata accessor for MusicLibraryPlaylistEditViewModel.Error()
{
  return &type metadata for MusicLibraryPlaylistEditViewModel.Error;
}

uint64_t sub_23BD0C100()
{
  return sub_23BD20C98();
}

uint64_t sub_23BD0C15C(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_11()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0 + 8;
}

uint64_t sub_23BD0C1C4()
{
  uint64_t result = sub_23BD20178();
  uint64_t v3 = v2;
  uint64_t v4 = HIBYTE(v2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
LABEL_49:
    sub_23BD0C674();
    sub_23BD20148();
    return (uint64_t)sub_23BD0C44C(v25);
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (uint64_t)sub_23BD0C58C(result, v3, 10);
    char v0 = v28;
LABEL_46:
    swift_bridgeObjectRelease();
    if (v0) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v8;
    }
    goto LABEL_49;
  }
  if ((v3 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)sub_23BD20B38();
    }
    uint64_t v8 = (uint64_t)sub_23BD0C6B4(v7, v5, 10);
    char v0 = v9 & 1;
    goto LABEL_46;
  }
  if (result == 43)
  {
    if (!v4) {
      goto LABEL_61;
    }
    if (v4 == 1) {
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_1_2();
    if (!v14 & v13) {
      goto LABEL_32;
    }
    uint64_t v8 = v16;
    if (v15 != 2)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13) {
        goto LABEL_32;
      }
      uint64_t v8 = 10 * v8 + v18;
      if (v17 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_3();
          if (!v14 & v13) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_0_2();
          if (!v14) {
            goto LABEL_32;
          }
          uint64_t v8 = v20 + v19;
          if (__OFADD__(v20, v19)) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_2_3();
          if (v14) {
            goto LABEL_46;
          }
        }
      }
    }
LABEL_45:
    char v0 = 0;
    goto LABEL_46;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v8 = (result - 48);
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13) {
        goto LABEL_32;
      }
      uint64_t v8 = 10 * v8 + v22;
      if (v21 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_3();
          if (!v14 & v13) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_0_2();
          if (!v14) {
            goto LABEL_32;
          }
          uint64_t v8 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_2_3();
          if (v14) {
            goto LABEL_46;
          }
        }
      }
    }
    goto LABEL_45;
  }
  if (v4)
  {
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!(!v14 & v13))
      {
        if (v11 == 2)
        {
          char v0 = 0;
          uint64_t v8 = -(uint64_t)v12;
          goto LABEL_46;
        }
        if ((v10 - 48) <= 9u)
        {
          uint64_t v8 = -10 * v12 - (v10 - 48);
          if (v11 == 3) {
            goto LABEL_45;
          }
          while (1)
          {
            OUTLINED_FUNCTION_3_3();
            if (!v14 & v13) {
              break;
            }
            OUTLINED_FUNCTION_0_2();
            if (!v14) {
              break;
            }
            uint64_t v8 = v27 - v26;
            if (__OFSUB__(v27, v26)) {
              break;
            }
            OUTLINED_FUNCTION_2_3();
            if (v14) {
              goto LABEL_46;
            }
          }
        }
      }
    }
LABEL_32:
    uint64_t v8 = 0;
    char v0 = 1;
    goto LABEL_46;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

id sub_23BD0C44C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_23BD208D8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithValue_databaseID_, a1, v3);

  return v4;
}

void *sub_23BD0C4C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_268A83028);
  id v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23BD0C530(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_23BD20988();
    OUTLINED_FUNCTION_4_1(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x23ECD4610](15, a1 >> 16);
    OUTLINED_FUNCTION_4_1(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_23BD0C58C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_23BD20998();
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  uint64_t v6 = sub_23BD0C930(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = (unsigned __int8 *)sub_23BD20B38();
  }
LABEL_7:
  unsigned __int8 v12 = sub_23BD0C6B4(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_23BD0C674()
{
  unint64_t result = qword_268A830A0;
  if (!qword_268A830A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A830A0);
  }
  return result;
}

unsigned __int8 *sub_23BD0C6B4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          unsigned __int8 v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23BD0C930(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_23BD0C99C((uint64_t)sub_23BD0C998, 0, a1, a2);
  uint64_t v6 = sub_23BD0C9D0(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_23BD0C99C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x270F9D8F0](15, v5 | (v4 << 16));
}

uint64_t sub_23BD0C9D0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_23BD0CB28(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_23BD0C4C8(v9, 0);
      unint64_t v12 = sub_23BD0CC28((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_23BD20B38();
LABEL_4:
        JUMPOUT(0x23ECD45C0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x23ECD45C0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23ECD45C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_23BD0CB28(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_23BD0C530(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_23BD0C530(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_23BD0CC28(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_23BD0C530(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_23BD20978();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_23BD20B38();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_23BD0C530(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_23BD20948();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id MPStoreLyricsRequest.init(song:)(uint64_t a1)
{
  uint64_t v2 = sub_23BD20738();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F13A90], v2);
  id v7 = v6;
  sub_23BD0A098();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_setSong_, v9);

  uint64_t v10 = sub_23BD20778();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v7;
}

uint64_t sub_23BD0CFA4(void *a1)
{
  v7[3] = sub_23BD0D424();
  v7[0] = a1;
  id v2 = objc_allocWithZone(MEMORY[0x263F13E50]);
  id v3 = a1;
  id v4 = sub_23BD0D348(v7);
  uint64_t v5 = sub_23BD20518();

  return v5;
}

uint64_t MusicLibrary.mediaLibrary.getter()
{
  if (sub_23BD20538()) {
    goto LABEL_8;
  }
  if (qword_26AD82B80 != -1) {
    swift_once();
  }
  if (byte_26AD82C28 != 1)
  {
LABEL_8:
    uint64_t v3 = sub_23BD20548();
    sub_23BD0D2F8();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v3 - 8) + 104))(v4, *MEMORY[0x263F138B8], v3);
    return swift_willThrow();
  }
  else
  {
    if (sub_23BD20528())
    {
      self;
      char v0 = (void *)swift_dynamicCastObjCClass();
      if (v0)
      {
        id v1 = objc_msgSend(v0, sel__underlyingMediaLibrary);
        swift_unknownObjectRelease();
        return (uint64_t)v1;
      }
      swift_unknownObjectRelease();
    }
    sub_23BD20B18();
    swift_bridgeObjectRelease();
    sub_23BD20528();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A830B0);
    sub_23BD208F8();
    sub_23BD20928();
    swift_bridgeObjectRelease();
    sub_23BD20928();
    uint64_t result = sub_23BD20BB8();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BD0D230()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  uint64_t result = sub_23BD0D3B4(v0);
  if (v2)
  {
    if (result == 0x6C7070612E6D6F63 && v2 == 0xEF636973754D2E65) {
      char v4 = 1;
    }
    else {
      char v4 = sub_23BD20C08();
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v4 = 0;
  }
  byte_26AD82C28 = v4 & 1;
  return result;
}

unint64_t sub_23BD0D2F8()
{
  unint64_t result = qword_268A830A8;
  if (!qword_268A830A8)
  {
    sub_23BD20548();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A830A8);
  }
  return result;
}

id sub_23BD0D348(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  id v3 = objc_msgSend(v1, sel_initWithUnderlyingMediaLibrary_, sub_23BD20BF8());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_23BD0D3B4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_23BD208E8();

  return v3;
}

unint64_t sub_23BD0D424()
{
  unint64_t result = qword_268A830B8;
  if (!qword_268A830B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A830B8);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t MusicCollaborativePlaylist.StartCollaborationRequest.init(playlist:invitationMode:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v5 = sub_23BD20848();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  unsigned int v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v32 - v21;
  id v23 = a1;
  sub_23BD06EBC((uint64_t)v23);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
  {

    uint64_t v24 = OUTLINED_FUNCTION_1_3();
    v25(v24);
    sub_23BD0797C((uint64_t)v13);
    uint64_t v26 = 1;
    uint64_t v27 = v33;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v22, v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v5);
    uint64_t v27 = v33;
    sub_23BD1FEE8();

    uint64_t v28 = OUTLINED_FUNCTION_1_3();
    v29(v28);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v14);
    uint64_t v26 = 0;
  }
  uint64_t v30 = sub_23BD1FF08();
  return __swift_storeEnumTagSinglePayload(v27, v26, 1, v30);
}

uint64_t MusicCollaborativePlaylist.StartCollaborationRequest.perform()()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *id v1 = v0;
  v1[1] = sub_23BD0D790;
  return MEMORY[0x270F4CB18]();
}

uint64_t sub_23BD0D790(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
  {
    char v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23BD0D8C4, 0, 0);
  }
}

uint64_t sub_23BD0D8C4()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = v0[6];
    sub_23BD20B18();
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    sub_23BD20928();
    v0[4] = v3;
    sub_23BD20B98();
    sub_23BD20928();
    return sub_23BD20BB8();
  }
}

BOOL static RadioShow.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorSubKind) == (id)3;
}

id static UploadedAudio.canBeConverted(from:)(void *a1)
{
  if (objc_msgSend(a1, sel_hasVideo)) {
    return 0;
  }
  else {
    return objc_msgSend(a1, sel_isArtistUploadedContent);
  }
}

uint64_t sub_23BD0DA9C(uint64_t a1)
{
  return sub_23BD0DADC(a1, qword_26AD82D20);
}

uint64_t sub_23BD0DAB8(uint64_t a1)
{
  return sub_23BD0DADC(a1, qword_268A83810);
}

uint64_t sub_23BD0DADC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23BD200A8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23BD20098();
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

uint64_t MusicSiriRepresentation.init(for:title:authorName:artwork:contentRating:url:isLibraryAdded:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v150 = a8;
  uint64_t v151 = a9;
  uint64_t v140 = a2;
  uint64_t v141 = a4;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830C8);
  uint64_t v16 = OUTLINED_FUNCTION_5(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_4();
  uint64_t v139 = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830D0);
  uint64_t v19 = OUTLINED_FUNCTION_5(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1_4();
  uint64_t v138 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830D8);
  uint64_t v22 = OUTLINED_FUNCTION_5(v21);
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1_4();
  uint64_t v137 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830E0);
  uint64_t v25 = OUTLINED_FUNCTION_5(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1_4();
  uint64_t v136 = v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B18);
  uint64_t v28 = OUTLINED_FUNCTION_5(v27);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_1_4();
  uint64_t v135 = v29;
  OUTLINED_FUNCTION_6_0();
  uint64_t v30 = sub_23BD204B8();
  uint64_t v31 = OUTLINED_FUNCTION_5(v30);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_1_4();
  uint64_t v134 = v32;
  OUTLINED_FUNCTION_6_0();
  uint64_t v33 = sub_23BD20468();
  uint64_t v34 = OUTLINED_FUNCTION_5(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_4();
  uint64_t v133 = v35;
  OUTLINED_FUNCTION_6_0();
  uint64_t v142 = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v147 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_24();
  uint64_t v145 = v38;
  MEMORY[0x270FA5388](v39);
  uint64_t v146 = (uint64_t)&v116 - v40;
  OUTLINED_FUNCTION_6_0();
  uint64_t v149 = sub_23BD1FE08();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v41;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_24();
  uint64_t v143 = v44;
  MEMORY[0x270FA5388](v45);
  v47 = (char *)&v116 - v46;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830E8);
  uint64_t v49 = OUTLINED_FUNCTION_5(v48);
  MEMORY[0x270FA5388](v49);
  v51 = (char *)&v116 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830F0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_24();
  v144 = v54;
  uint64_t v56 = MEMORY[0x270FA5388](v55);
  v58 = (char *)&v116 - v57;
  MEMORY[0x270FA5388](v56);
  uint64_t v148 = (uint64_t)&v116 - v59;
  id v60 = objc_msgSend(a1, sel_modelKind);
  if (!v60)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26AD82C88 != -1) {
      swift_once();
    }
    uint64_t v70 = sub_23BD200A8();
    __swift_project_value_buffer(v70, (uint64_t)qword_26AD82D20);
    id v71 = a1;
    v72 = sub_23BD20088();
    os_log_type_t v73 = sub_23BD20A88();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v132 = a6;
      v74 = (uint8_t *)swift_slowAlloc();
      v75 = (void *)swift_slowAlloc();
      *(_DWORD *)v74 = 138412290;
      id v152 = v71;
      id v76 = v71;
      sub_23BD20AD8();
      void *v75 = v71;

      _os_log_impl(&dword_23BD04000, v72, v73, "Failed to create a Siri representation from legacy identifier set: %@", v74, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A830F8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_5_0();

      a6 = v132;
    }
    else
    {
    }
    goto LABEL_17;
  }
  id v131 = v60;
  sub_23BD0E7B8(v60, (uint64_t)v51);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v51, 1, v52);
  id v130 = a1;
  if (EnumTagSinglePayload == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23BD0B75C((uint64_t)v51, &qword_268A830E8);
    if (qword_26AD82C88 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_23BD200A8();
    __swift_project_value_buffer(v62, (uint64_t)qword_26AD82D20);
    id v63 = v131;
    id v64 = v131;
    v65 = sub_23BD20088();
    os_log_type_t v66 = sub_23BD20A88();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v132 = a6;
      v69 = (void *)v68;
      *(_DWORD *)v67 = 138543362;
      id v152 = v64;
      id v64 = v64;
      sub_23BD20AD8();
      void *v69 = v63;

      _os_log_impl(&dword_23BD04000, v65, v66, "Failed to derive a Siri representation kind from legacy model kind: %{public}@.", v67, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A830F8);
      swift_arrayDestroy();
      a6 = v132;
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_5_0();
    }
    else
    {
    }
LABEL_17:
    sub_23BD0B75C(v150, &qword_268A830C8);
    sub_23BD0B75C(a7, &qword_268A830D0);
    sub_23BD0B75C(a6, &qword_268A830D8);
    uint64_t v108 = 1;
    goto LABEL_20;
  }
  uint64_t v126 = a3;
  uint64_t v127 = a5;
  int v125 = a10;
  uint64_t v77 = *(int *)(v52 + 48);
  uint64_t v78 = v148;
  uint64_t v132 = a6;
  uint64_t v79 = v148 + v77;
  uint64_t v128 = a7;
  v80 = &v51[v77];
  v118 = *(void (**)(uint64_t, char *, uint64_t))(v42 + 32);
  v129 = v47;
  uint64_t v81 = v42;
  v118(v148, v51, v149);
  uint64_t v82 = sub_23BD20718();
  uint64_t v83 = *(void *)(v82 - 8);
  v123 = *(void (**)(uint64_t, char *, uint64_t))(v83 + 32);
  uint64_t v124 = v83 + 32;
  uint64_t v84 = v79;
  uint64_t v122 = v79;
  v123(v79, v80, v82);
  v85 = &v58[*(int *)(v52 + 48)];
  uint64_t v117 = v81;
  v120 = *(void (**)(void))(v81 + 16);
  uint64_t v121 = v81 + 16;
  uint64_t v86 = v78;
  uint64_t v87 = v149;
  ((void (*)(char *, uint64_t, uint64_t))v120)(v58, v86, v149);
  v88 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 16);
  uint64_t v119 = v83 + 16;
  v88(v85, v84, v82);
  v118((uint64_t)v129, v58, v87);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  id v89 = v130;
  uint64_t v90 = v133;
  sub_23BD1FDF8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B70);
  uint64_t v91 = sub_23BD20488();
  OUTLINED_FUNCTION_0();
  uint64_t v93 = v92;
  unint64_t v94 = (*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  uint64_t v95 = swift_allocObject();
  *(_OWORD *)(v95 + 16) = xmmword_23BD21280;
  uint64_t v96 = v91;
  v97 = v89;
  (*(void (**)(unint64_t, void, uint64_t))(v93 + 104))(v95 + v94, *MEMORY[0x263F13788], v96);
  uint64_t v98 = v134;
  sub_23BD204A8();
  uint64_t v99 = sub_23BD20478();
  uint64_t v100 = v135;
  __swift_storeEnumTagSinglePayload(v135, 1, 1, v99);
  uint64_t v101 = v146;
  sub_23BD120F0(v97, v90, v98, v100, v146);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v145, v101, v142);
  v102 = v120;
  ((void (*)(uint64_t, char *, uint64_t))v120)(v143, v129, v87);
  v103 = &v144[*(int *)(v52 + 48)];
  v102();
  v88(v103, v122, v82);
  uint64_t v104 = v132;
  uint64_t v105 = v136;
  v123(v136, v103, v82);
  __swift_storeEnumTagSinglePayload(v105, 0, 1, v82);
  sub_23BD0A5C4(v104, v137, &qword_268A830D8);
  sub_23BD0A5C4(v128, v138, &qword_268A830D0);
  uint64_t v106 = v150;
  sub_23BD0A5C4(v150, v139, &qword_268A830C8);
  if (v125 == 2)
  {
    v107 = v97;
    if (objc_msgSend(v97, sel_library)) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    v107 = v97;
  }
  uint64_t v109 = v117;
  v110 = v129;
  uint64_t v111 = v142;
  sub_23BD1FDE8();

  sub_23BD0B75C(v106, &qword_268A830C8);
  sub_23BD0B75C(v128, &qword_268A830D0);
  sub_23BD0B75C(v104, &qword_268A830D8);
  (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v146, v111);
  v112 = *(void (**)(char *, uint64_t))(v109 + 8);
  uint64_t v113 = v149;
  v112(v110, v149);
  sub_23BD0B75C(v148, &qword_268A830F0);
  v112(v144, v113);
  uint64_t v108 = 0;
LABEL_20:
  uint64_t v114 = sub_23BD1FE28();
  return __swift_storeEnumTagSinglePayload(v151, v108, 1, v114);
}

void sub_23BD0E7B8(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830E8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830F0);
  __swift_storeEnumTagSinglePayload(a2, 1, 1, v7);
  id v82 = objc_msgSend(a1, sel_identityKind);
  sub_23BD0C15C(0, &qword_268A83100);
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v9 = objc_msgSend(v82, sel_isEqual_, v8);

  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F56948];
    uint64_t v11 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v6, v10, v11);
    sub_23BD20668();
LABEL_29:

    sub_23BD0B75C(a2, &qword_268A830E8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
    sub_23BD0F4D0((uint64_t)v6, a2);
    return;
  }
  sub_23BD0C15C(0, &qword_268A83108);
  id v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v13 = objc_msgSend(v82, sel_isEqual_, v12);

  if (v13)
  {
    uint64_t v14 = *MEMORY[0x263F56958];
    uint64_t v15 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v6, v14, v15);
    sub_23BD20688();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83110);
  id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v17 = objc_msgSend(v82, sel_isEqual_, v16);

  if (v17)
  {
    uint64_t v18 = *MEMORY[0x263F56978];
    uint64_t v19 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v6, v18, v19);
    sub_23BD206C8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83118);
  id v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v21 = objc_msgSend(v82, sel_isEqual_, v20);

  if (v21)
  {
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClass();
    if (!v22)
    {
LABEL_14:
      uint64_t v25 = *MEMORY[0x263F56968];
      uint64_t v26 = sub_23BD1FE08();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v6, v25, v26);
      sub_23BD206A8();
LABEL_15:

      goto LABEL_29;
    }
    id v23 = a1;
    unsigned __int8 v24 = objc_msgSend(v22, sel_variants);
    if (v24)
    {
      uint64_t v35 = (unsigned int *)MEMORY[0x263F56968];
    }
    else if ((v24 & 4) != 0)
    {
      uint64_t v35 = (unsigned int *)MEMORY[0x263F56990];
    }
    else
    {
      if ((v24 & 2) == 0)
      {
        if ((v24 & 8) != 0)
        {
          uint64_t v50 = *MEMORY[0x263F56968];
          uint64_t v51 = sub_23BD1FE08();
          (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 104))(v6, v50, v51);
          sub_23BD206A8();
        }
        else
        {
          if ((v24 & 0x20) == 0) {
            goto LABEL_14;
          }
          uint64_t v58 = *MEMORY[0x263F56920];
          uint64_t v59 = sub_23BD1FE08();
          (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 104))(v6, v58, v59);
          sub_23BD20618();
        }
        goto LABEL_28;
      }
      uint64_t v35 = (unsigned int *)MEMORY[0x263F56950];
    }
    uint64_t v44 = *v35;
    uint64_t v45 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v6, v44, v45);
    sub_23BD20608();
    goto LABEL_28;
  }
  sub_23BD0C15C(0, &qword_268A83120);
  id v27 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v28 = objc_msgSend(v82, sel_isEqual_, v27);

  if (v28)
  {
    uint64_t v29 = *MEMORY[0x263F56950];
    uint64_t v30 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v6, v29, v30);
    sub_23BD20678();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83128);
  id v31 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v32 = objc_msgSend(v82, sel_isEqual_, v31);

  if (v32)
  {
    uint64_t v33 = *MEMORY[0x263F56908];
    uint64_t v34 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v6, v33, v34);
    sub_23BD205D8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83130);
  id v36 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v37 = objc_msgSend(v82, sel_isEqual_, v36);

  if (v37)
  {
    uint64_t v38 = *MEMORY[0x263F56980];
    uint64_t v39 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v6, v38, v39);
    sub_23BD206D8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83138);
  id v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v41 = objc_msgSend(v82, sel_isEqual_, v40);

  if (v41)
  {
    uint64_t v42 = *MEMORY[0x263F56928];
    uint64_t v43 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v6, v42, v43);
    sub_23BD20628();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83140);
  id v46 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v47 = objc_msgSend(v82, sel_isEqual_, v46);

  if (v47)
  {
    uint64_t v48 = *MEMORY[0x263F56918];
    uint64_t v49 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v6, v48, v49);
    sub_23BD205F8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83148);
  id v52 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v53 = objc_msgSend(v82, sel_isEqual_, v52);

  if (v53)
  {
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClass();
    if (!v22) {
      goto LABEL_37;
    }
    id v23 = a1;
    unsigned __int8 v54 = objc_msgSend(v22, sel_variants);
    unsigned __int8 v55 = v54;
    if ((v54 & 4) != 0)
    {
      uint64_t v68 = sub_23BD1FE08();
      v69 = *(void (**)(char *, void, uint64_t))(*(void *)(v68 - 8) + 104);
      if ((v55 & 2) != 0)
      {
        v69(v6, *MEMORY[0x263F56938], v68);
        sub_23BD20648();
      }
      else
      {
        v69(v6, *MEMORY[0x263F56930], v68);
        sub_23BD20638();
      }
      goto LABEL_28;
    }
    if ((v54 & 2) == 0)
    {
LABEL_37:
      uint64_t v56 = *MEMORY[0x263F56940];
      uint64_t v57 = sub_23BD1FE08();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v6, v56, v57);
      sub_23BD20658();
      goto LABEL_15;
    }
    uint64_t v74 = *MEMORY[0x263F56910];
    uint64_t v75 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104))(v6, v74, v75);
    sub_23BD205E8();
LABEL_28:

    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83150);
  id v60 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v61 = objc_msgSend(v82, sel_isEqual_, v60);

  if (v61)
  {
    uint64_t v62 = *MEMORY[0x263F56970];
    uint64_t v63 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 104))(v6, v62, v63);
    sub_23BD206B8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83158);
  id v64 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v65 = objc_msgSend(v82, sel_isEqual_, v64);

  if (v65)
  {
    uint64_t v66 = *MEMORY[0x263F56998];
    uint64_t v67 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v6, v66, v67);
    sub_23BD20708();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83160);
  id v70 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v71 = objc_msgSend(v82, sel_isEqual_, v70);

  if (v71)
  {
    uint64_t v72 = *MEMORY[0x263F56988];
    uint64_t v73 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v73 - 8) + 104))(v6, v72, v73);
    sub_23BD206F8();
    goto LABEL_29;
  }
  sub_23BD0C15C(0, &qword_268A83168);
  id v76 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  unsigned int v77 = objc_msgSend(v82, sel_isEqual_, v76);

  if (v77)
  {
    uint64_t v78 = *MEMORY[0x263F56960];
    uint64_t v79 = sub_23BD1FE08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 104))(v6, v78, v79);
    sub_23BD20698();
    goto LABEL_29;
  }
  id v80 = v82;
}

uint64_t sub_23BD0F4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A830E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return 0;
}

BOOL static EditorialItem.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorKind) == (id)4;
}

id sub_23BD0F570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_23BD20738();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_0();
  uint64_t v18 = v17 - v16;
  unint64_t v19 = sub_23BD0FE80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v18, a1, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, v3, a2);
  return sub_23BD0FEC0(v11, v18, v19, a2);
}

uint64_t sub_23BD0F6A8()
{
  uint64_t v1 = sub_23BD20728();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6 - v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6 - v5, v0, v1);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v7, v1);
  uint64_t v9 = 0;
  if (v8 == *MEMORY[0x263F13A18]) {
    return v9;
  }
  if (v8 == *MEMORY[0x263F13998]) {
    return 1;
  }
  if (v8 == *MEMORY[0x263F13A30]) {
    return 2;
  }
  if (v8 == *MEMORY[0x263F13A58]) {
    return 3;
  }
  if (v8 == *MEMORY[0x263F139A0]) {
    return 4;
  }
  if (v8 == *MEMORY[0x263F13A48]) {
    return 5;
  }
  if (v8 == *MEMORY[0x263F139A8]) {
    return 6;
  }
  if (v8 == *MEMORY[0x263F139B0]) {
    return 7;
  }
  if (v8 == *MEMORY[0x263F13A20]) {
    return 9;
  }
  if (v8 == *MEMORY[0x263F13A08]) {
    return 11;
  }
  if (v8 == *MEMORY[0x263F13A38]) {
    return 12;
  }
  if (v8 == *MEMORY[0x263F13980]) {
    return 13;
  }
  if (v8 == *MEMORY[0x263F13988]) {
    return 14;
  }
  if (v8 == *MEMORY[0x263F13A60]) {
    return 15;
  }
  if (v8 == *MEMORY[0x263F139E8]) {
    return 16;
  }
  if (v8 == *MEMORY[0x263F139B8]) {
    return 17;
  }
  if (v8 == *MEMORY[0x263F13A00]) {
    return 18;
  }
  if (v8 == *MEMORY[0x263F139F0]) {
    return 19;
  }
  if (v8 == *MEMORY[0x263F139F8]) {
    return 20;
  }
  if (v8 == *MEMORY[0x263F13A70]) {
    return 22;
  }
  if (v8 == *MEMORY[0x263F139C0]) {
    return 23;
  }
  if (v8 == *MEMORY[0x263F13990]) {
    return 24;
  }
  if (v8 == *MEMORY[0x263F139C8]) {
    return 25;
  }
  if (v8 == *MEMORY[0x263F13A10]) {
    return 26;
  }
  if (v8 == *MEMORY[0x263F13A50]) {
    return 27;
  }
  if (v8 == *MEMORY[0x263F139D0]) {
    return 29;
  }
  if (v8 == *MEMORY[0x263F13A28]) {
    return 30;
  }
  if (v8 == *MEMORY[0x263F13A78]) {
    return 31;
  }
  if (v8 == *MEMORY[0x263F13A68]) {
    return 32;
  }
  if (v8 == *MEMORY[0x263F13A40]) {
    return 33;
  }
  if (v8 == *MEMORY[0x263F139D8]) {
    return 34;
  }
  if (v8 == *MEMORY[0x263F139E0]) {
    return 35;
  }
  uint64_t result = sub_23BD20BB8();
  __break(1u);
  return result;
}

uint64_t sub_23BD0FB24()
{
  uint64_t v0 = sub_23BD20738();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v11 - v5;
  uint64_t v7 = *(void (**)(void))(v2 + 16);
  OUTLINED_FUNCTION_2_4();
  v7();
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v6, v0);
  uint64_t v9 = 0;
  if (v8 == *MEMORY[0x263F13AF8]) {
    return v9;
  }
  if (v8 == *MEMORY[0x263F13AA8]) {
    return 1;
  }
  if (v8 == *MEMORY[0x263F13A88]) {
    return 2;
  }
  if (v8 == *MEMORY[0x263F13AC0]) {
    return 3;
  }
  if (v8 == *MEMORY[0x263F13AB0]) {
    return 4;
  }
  if (v8 == *MEMORY[0x263F13A98]) {
    return 5;
  }
  if (v8 == *MEMORY[0x263F13AB8]) {
    return 6;
  }
  if (v8 == *MEMORY[0x263F13A90]) {
    return 7;
  }
  if (v8 == *MEMORY[0x263F13AA0]) {
    return 8;
  }
  if (v8 == *MEMORY[0x263F13AE8]) {
    return 9;
  }
  if (v8 == *MEMORY[0x263F13AE0]) {
    return 10;
  }
  if (v8 == *MEMORY[0x263F13AD8]) {
    return 11;
  }
  if (v8 == *MEMORY[0x263F13A80]) {
    return 12;
  }
  if (v8 == *MEMORY[0x263F13AC8]) {
    return 13;
  }
  if (v8 == *MEMORY[0x263F13AF0]) {
    return 14;
  }
  if (v8 == *MEMORY[0x263F13AD0]) {
    return 15;
  }
  OUTLINED_FUNCTION_2_4();
  v7();
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_23BD20B18();
  sub_23BD20928();
  sub_23BD20B98();
  sub_23BD20928();
  uint64_t result = sub_23BD20BB8();
  __break(1u);
  return result;
}

unint64_t sub_23BD0FE80()
{
  unint64_t result = qword_268A83170;
  if (!qword_268A83170)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A83170);
  }
  return result;
}

id sub_23BD0FEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v7 = sub_23BD203E8();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_23BD20728();
  uint64_t v10 = *(void *)(v25 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v15, a1, a4);
  sub_23BD20768();
  sub_23BD20748();
  uint64_t v17 = (void *)sub_23BD0F6A8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v25);
  sub_23BD204C8();
  id v18 = sub_23BD141BC(v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  id v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v20 = (void *)sub_23BD20898();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v19, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v18, v17, v20);
  swift_unknownObjectRelease();

  uint64_t v22 = sub_23BD20738();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(a2, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v15, a4);
  return v21;
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.mainID.getter()
{
  sub_23BD1FDD8();
  OUTLINED_FUNCTION_16();
  uint64_t v0 = OUTLINED_FUNCTION_11_0();

  return v1(v0);
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.musicIdentifierSet.getter()
{
  type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16();
  uint64_t v0 = OUTLINED_FUNCTION_11_0();

  return v1(v0);
}

uint64_t type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers()
{
  uint64_t result = qword_268A831A0;
  if (!qword_268A831A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t static MusicSiriRepresentation.ParsedIdentifiers.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_23BD1FDC8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  if ((sub_23BD20308() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(int *)(v4 + 24);
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  if (v6 == *v8 && v7 == v8[1]) {
    return 1;
  }

  return sub_23BD20C08();
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.hash(into:)()
{
  sub_23BD1FDD8();
  sub_23BD11C7C(&qword_268A83180, MEMORY[0x263F568F8]);
  sub_23BD208B8();
  type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  OUTLINED_FUNCTION_7_0();
  sub_23BD11C7C(&qword_268A83188, MEMORY[0x263F136F8]);
  sub_23BD208B8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11_0();
  sub_23BD20918();

  return swift_bridgeObjectRelease();
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.hashValue.getter()
{
  return sub_23BD20C98();
}

uint64_t sub_23BD105C0()
{
  return sub_23BD20C98();
}

uint64_t sub_23BD106DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_4();
  uint64_t v115 = v4;
  sub_23BD20738();
  OUTLINED_FUNCTION_0();
  uint64_t v111 = v6;
  uint64_t v112 = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_4();
  uint64_t v110 = v7;
  uint64_t v105 = sub_23BD20718();
  OUTLINED_FUNCTION_0();
  uint64_t v104 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24();
  uint64_t v101 = v10;
  MEMORY[0x270FA5388](v11);
  v103 = (char *)&v100 - v12;
  uint64_t v13 = sub_23BD1FDD8();
  OUTLINED_FUNCTION_0();
  uint64_t v124 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_24();
  v102 = v16;
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v100 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A831B0);
  uint64_t v21 = v20 - 8;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1_0();
  uint64_t v24 = v23 - v22;
  int v125 = (char *)(v23 - v22);
  uint64_t v25 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v26;
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  id v31 = (char *)&v100 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v100 - v32;
  sub_23BD20728();
  OUTLINED_FUNCTION_0();
  uint64_t v120 = v35;
  uint64_t v121 = v34;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_4();
  uint64_t v119 = v36;
  uint64_t v107 = v2;
  uint64_t v109 = v1 + *(int *)(v2 + 20);
  sub_23BD203D8();
  uint64_t v37 = v24 + *(int *)(v21 + 56);
  uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v27 + 16);
  uint64_t v116 = v33;
  v38(v24, v33, v25);
  uint64_t v39 = v124;
  id v40 = *(void (**)(char *, uint64_t, uint64_t))(v124 + 16);
  uint64_t v41 = v1;
  uint64_t v42 = v31;
  uint64_t v43 = v27;
  uint64_t v113 = v41;
  uint64_t v108 = v40;
  ((void (*)(uint64_t))v40)(v37);
  uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t))(v39 + 88);
  uint64_t v122 = v37;
  uint64_t v123 = v13;
  uint64_t v106 = v44;
  unsigned int v45 = v44(v37, v13);
  int v46 = *MEMORY[0x263F568E8];
  uint64_t v114 = v25;
  uint64_t v117 = v27;
  if (v45 == v46)
  {
    uint64_t v47 = v123;
    v108(v19, v122, v123);
    (*(void (**)(char *, uint64_t))(v124 + 96))(v19, v47);
    swift_bridgeObjectRelease();
    uint64_t v48 = *((void *)v19 + 2);
    uint64_t v49 = *((void *)v19 + 3);
    sub_23BD20458();
    sub_23BD11C7C(&qword_268A831B8, MEMORY[0x263F13708]);
    LOBYTE(v47) = sub_23BD208C8();
    v118 = *(void (**)(char *, uint64_t))(v27 + 8);
    v118(v42, v25);
    if (v47)
    {
      uint64_t v50 = v103;
      sub_23BD20608();
      uint64_t v51 = sub_23BD206E8();
      uint64_t v53 = v52;
      (*(void (**)(char *, uint64_t))(v104 + 8))(v50, v105);
      if (v51 == v48 && v53 == v49)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v25 = v114;
LABEL_20:
        uint64_t v70 = OUTLINED_FUNCTION_4_2();
        v71(v70);
        uint64_t v72 = OUTLINED_FUNCTION_9();
        v73(v72);
        v118(v125, v25);
        goto LABEL_26;
      }
      char v55 = sub_23BD20C08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v25 = v114;
      uint64_t v43 = v117;
      if (v55) {
        goto LABEL_20;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v25 = v114;
      uint64_t v43 = v117;
    }
  }
  sub_23BD20458();
  sub_23BD11C7C(&qword_268A831B8, MEMORY[0x263F13708]);
  char v56 = OUTLINED_FUNCTION_5_1();
  uint64_t v57 = *(void (**)(uint64_t))(v43 + 8);
  uint64_t v58 = OUTLINED_FUNCTION_2_5();
  v57(v58);
  v118 = (void (*)(char *, uint64_t))v57;
  if (v56) {
    goto LABEL_25;
  }
  if (v106(v122, v123) == v46)
  {
    uint64_t v59 = v102;
    uint64_t v60 = v123;
    v108(v102, v122, v123);
    (*(void (**)(char *, uint64_t))(v124 + 96))(v59, v60);
    swift_bridgeObjectRelease();
    uint64_t v62 = *((void *)v59 + 2);
    uint64_t v61 = *((void *)v59 + 3);
    sub_23BD20448();
    LOBYTE(v59) = sub_23BD208C8();
    uint64_t v63 = OUTLINED_FUNCTION_2_5();
    v57(v63);
    if (v59)
    {
      uint64_t v64 = v101;
      sub_23BD20608();
      uint64_t v65 = sub_23BD206E8();
      uint64_t v67 = v66;
      (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v64, v105);
      if (v65 == v62 && v67 == v61)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_25;
      }
      OUTLINED_FUNCTION_11_0();
      char v69 = sub_23BD20C08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v69) {
        goto LABEL_25;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_23BD20448();
  char v74 = OUTLINED_FUNCTION_5_1();
  uint64_t v75 = OUTLINED_FUNCTION_2_5();
  v57(v75);
  if ((v74 & 1) == 0)
  {
    uint64_t v42 = v119;
    sub_23BD203F8();
    sub_23BD11CC4((uint64_t)v125);
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v76 = OUTLINED_FUNCTION_4_2();
  v77(v76);
  uint64_t v78 = OUTLINED_FUNCTION_9();
  v79(v78);
  ((void (*)(char *, uint64_t))v57)(v125, v25);
LABEL_26:
  uint64_t v80 = v115;
  uint64_t v82 = v111;
  uint64_t v81 = v112;
  uint64_t v83 = v110;
  uint64_t v84 = (void *)sub_23BD0F6A8();
  (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))(v83, *MEMORY[0x263F13AC8], v81);
  id v85 = sub_23BD141BC(v84);
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v83, v81);
  self;
  uint64_t v86 = swift_dynamicCastObjCClass();
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = qword_268A82ED0;
    swift_unknownObjectRetain();
    if (v88 != -1) {
      swift_once();
    }
    uint64_t v89 = sub_23BD200A8();
    __swift_project_value_buffer(v89, (uint64_t)qword_268A83810);
    sub_23BD11D24(v113, v80);
    swift_unknownObjectRetain_n();
    uint64_t v90 = sub_23BD20088();
    os_log_type_t v91 = sub_23BD20AA8();
    if (os_log_type_enabled(v90, v91))
    {
      uint64_t v92 = swift_slowAlloc();
      uint64_t v93 = (void *)swift_slowAlloc();
      int v125 = (char *)swift_slowAlloc();
      v127[0] = (uint64_t)v125;
      *(_DWORD *)uint64_t v92 = 136446466;
      unint64_t v94 = (uint64_t *)(v80 + *(int *)(v107 + 24));
      uint64_t v95 = v80;
      uint64_t v97 = *v94;
      unint64_t v96 = v94[1];
      swift_bridgeObjectRetain();
      uint64_t v126 = sub_23BD088E0(v97, v96, v127);
      sub_23BD20AD8();
      swift_bridgeObjectRelease();
      sub_23BD11D88(v95);
      *(_WORD *)(v92 + 12) = 2112;
      uint64_t v126 = v87;
      swift_unknownObjectRetain();
      sub_23BD20AD8();
      *uint64_t v93 = v87;
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_23BD04000, v90, v91, "Converted Siri representation ID \"%{public}s\" to identifier set %@.", (uint8_t *)v92, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A830F8);
      swift_arrayDestroy();
      MEMORY[0x23ECD4DF0](v93, -1, -1);
      uint64_t v98 = (uint64_t)v125;
      swift_arrayDestroy();
      MEMORY[0x23ECD4DF0](v98, -1, -1);
      MEMORY[0x23ECD4DF0](v92, -1, -1);
      swift_unknownObjectRelease();

      v118(v116, v114);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v119, v121);
    }
    else
    {
      swift_unknownObjectRelease_n();

      sub_23BD11D88(v80);
      swift_unknownObjectRelease();
      v118(v116, v25);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v42, v121);
    }
    return v87;
  }
  else
  {
    v127[0] = 0;
    v127[1] = 0xE000000000000000;
    sub_23BD20B18();
    sub_23BD20928();
    uint64_t v126 = (uint64_t)v85;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C90);
    sub_23BD20B98();
    sub_23BD20928();
    uint64_t result = sub_23BD20BB8();
    __break(1u);
  }
  return result;
}

unint64_t MusicSiriRepresentation.ParsedIdentifiers.description.getter()
{
  return 0xD00000000000002ALL;
}

uint64_t static MusicSiriRepresentation.parse(_:includeExtendedIdentifierSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_23BD1FDD8();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1_0();
  uint64_t v20 = v19 - v18;
  if (a3)
  {
    uint64_t result = sub_23BD1FE18();
    if (!v4)
    {
      sub_23BD1FDB8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(a4, v20, v14);
      uint64_t v22 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(a4 + *(int *)(v22 + 20), v13, v8);
      uint64_t v23 = (void *)(a4 + *(int *)(v22 + 24));
      *uint64_t v23 = a1;
      v23[1] = a2;
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    uint64_t result = sub_23BD20BB8();
    __break(1u);
  }
  return result;
}

uint64_t sub_23BD1147C()
{
  return sub_23BD11C7C((unint64_t *)&unk_268A83190, (void (*)(uint64_t))type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers);
}

uint64_t *_s17ParsedIdentifiersVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23BD1FDD8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23BD203E8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s17ParsedIdentifiersVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23BD1FDD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_23BD203E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_bridgeObjectRelease();
}

uint64_t _s17ParsedIdentifiersVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BD1FDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23BD203E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BD1FDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23BD203E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BD1FDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23BD203E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t _s17ParsedIdentifiersVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23BD1FDD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23BD203E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23BD11A2C);
}

uint64_t sub_23BD11A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23BD1FDD8();
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_23BD203E8();
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t _s17ParsedIdentifiersVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23BD11AF8);
}

void sub_23BD11AF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_23BD1FDD8();
  OUTLINED_FUNCTION_1_5();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_23BD203E8();
    OUTLINED_FUNCTION_1_5();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_23BD11BAC()
{
  uint64_t result = sub_23BD1FDD8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23BD203E8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23BD11C7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23BD11CC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A831B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BD11D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BD11D88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0;
}

uint64_t Genre.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t v15 = sub_23BD207B8();
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = objc_msgSend(a1, sel_identifiers);
  sub_23BD20448();
  sub_23BD08618((uint64_t)v8, (uint64_t)v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    id v23 = a1;
    if (objc_msgSend(v22, sel_curatorSubKind) == (id)2)
    {
      uint64_t v24 = OUTLINED_FUNCTION_1_6();
      uint64_t v25 = v35;
      v26(v24);
      uint64_t v39 = 0;
      long long v37 = 0u;
      long long v38 = 0u;
      sub_23BD20798();

      (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v25);
      goto LABEL_7;
    }
  }
  self;
  if (!swift_dynamicCastObjCClass())
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v35);
    uint64_t v31 = 1;
    uint64_t v30 = v36;
    return __swift_storeEnumTagSinglePayload(v30, v31, 1, v15);
  }
  uint64_t v27 = OUTLINED_FUNCTION_1_6();
  uint64_t v28 = v35;
  v29(v27);
  sub_23BD207A8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v28);
LABEL_7:
  uint64_t v30 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v36, v19, v15);
  uint64_t v31 = 0;
  return __swift_storeEnumTagSinglePayload(v30, v31, 1, v15);
}

uint64_t sub_23BD120F0@<X0>(id a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v305 = a4;
  uint64_t v327 = a5;
  uint64_t v328 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B18);
  uint64_t v8 = OUTLINED_FUNCTION_5(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_4();
  uint64_t v301 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C10);
  uint64_t v11 = OUTLINED_FUNCTION_5(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_4();
  uint64_t v282 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B10);
  uint64_t v14 = OUTLINED_FUNCTION_5(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_15_0();
  v300 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v18 = OUTLINED_FUNCTION_5(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v20);
  uint64_t v317 = sub_23BD20188();
  OUTLINED_FUNCTION_0();
  uint64_t v273 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v24);
  uint64_t v25 = sub_23BD204B8();
  OUTLINED_FUNCTION_0();
  uint64_t v311 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v265 - v30;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v32);
  uint64_t v312 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v309 = v33;
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  long long v37 = (char *)&v265 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v38);
  uint64_t v304 = sub_23BD205B8();
  OUTLINED_FUNCTION_0();
  uint64_t v283 = v39;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v43);
  uint64_t v322 = sub_23BD20578();
  OUTLINED_FUNCTION_0();
  uint64_t v289 = v44;
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v47);
  v341 = (void (*)(char *, uint64_t))sub_23BD20478();
  OUTLINED_FUNCTION_0();
  uint64_t v335 = v48;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_1_4();
  uint64_t v340 = v50;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82A88);
  uint64_t v52 = OUTLINED_FUNCTION_5(v51);
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_22_0();
  uint64_t v333 = v54;
  MEMORY[0x270FA5388](v55);
  OUTLINED_FUNCTION_22_0();
  v324 = v56;
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v58);
  uint64_t v60 = (uint64_t *)((char *)&v265 - v59);
  sub_23BD20488();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v62);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v63);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v64);
  uint64_t v66 = (char *)&v265 - v65;
  uint64_t v68 = v67;
  char v69 = *(void (**)(void))(v67 + 104);
  int v278 = *MEMORY[0x263F13788];
  unsigned int v71 = v70;
  uint64_t v293 = v67 + 104;
  v292 = v69;
  v69((char *)&v265 - v65);
  uint64_t v72 = sub_23BD1729C((unint64_t *)&unk_26AD82B30, MEMORY[0x263F13808]);
  uint64_t v325 = a3;
  uint64_t v323 = v25;
  uint64_t v291 = v72;
  sub_23BD209D8();
  OUTLINED_FUNCTION_33();
  id v326 = a1;
  v275 = v37;
  if (v209)
  {
    OUTLINED_FUNCTION_32();
    MEMORY[0x270FA5388](v74);
    OUTLINED_FUNCTION_14_0();
    *(void *)(v75 - 16) = v66;
    sub_23BD155FC((uint64_t (*)(char *))sub_23BD16734, v76);
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    LOBYTE(v25) = v73 & 1;
  }
  v285 = v31;
  uint64_t v286 = 0;
  unsigned int v77 = *(void (**)(void, void))(v68 + 8);
  uint64_t v294 = v68 + 8;
  v290 = v77;
  v77(v66, v71);
  if ((v25 & 1) == 0)
  {
    OUTLINED_FUNCTION_11_1();
    uint64_t v265 = 36;
    goto LABEL_147;
  }
  uint64_t v78 = (uint64_t *)objc_msgSend(a1, sel_musicKit_catalogID);
  id v79 = objc_msgSend(a1, sel_musicKit_libraryID);
  uint64_t v80 = v335;
  if (v79)
  {
    uint64_t v81 = v79;
    uint64_t v306 = sub_23BD208E8();
    uint64_t v83 = v82;
  }
  else
  {
    uint64_t v306 = 0;
    uint64_t v83 = 0;
  }
  uint64_t v84 = v71;
  id v85 = objc_msgSend(a1, sel_musicKit_cloudAlbumLibraryID);
  uint64_t v86 = v333;
  if (v85)
  {
    uint64_t v87 = v85;
    uint64_t v281 = sub_23BD208E8();
    uint64_t v303 = v88;
  }
  else
  {
    uint64_t v281 = 0;
    uint64_t v303 = 0;
  }
  id v334 = objc_msgSend(a1, sel_musicKit_deviceLocalID);
  id v89 = objc_msgSend(a1, sel_musicKit_occurrenceID);
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v288 = sub_23BD208E8();
    uint64_t v318 = v91;
  }
  else
  {
    uint64_t v288 = 0;
    uint64_t v318 = 0;
  }
  uint64_t v310 = v83;
  uint64_t v92 = sub_23BD201A8();
  uint64_t v93 = type metadata accessor for MusicPreferredID();
  __swift_storeEnumTagSinglePayload((uint64_t)v60, 1, 1, v93);
  uint64_t v94 = *(void *)(v92 + 16);
  v331 = v60;
  v332 = v78;
  v297 = v84;
  if (!v94)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  unint64_t v96 = *(void (**)(uint64_t, unint64_t, void (*)(void, void)))(v80 + 16);
  uint64_t v95 = v80 + 16;
  v339 = v96;
  unint64_t v97 = (*(unsigned __int8 *)(v95 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v95 + 64);
  uint64_t v277 = v92;
  unint64_t v98 = v92 + v97;
  v338 = (uint64_t (**)(uint64_t, uint64_t))(v95 + 72);
  int v337 = *MEMORY[0x263F13730];
  int v330 = *MEMORY[0x263F13728];
  int v307 = *MEMORY[0x263F13738];
  int v295 = *MEMORY[0x263F13720];
  int v272 = *MEMORY[0x263F138C8];
  v316 = (void (**)(uint64_t, uint64_t, uint64_t))(v289 + 104);
  int v271 = *MEMORY[0x263F138E8];
  int v270 = *MEMORY[0x263F138D0];
  int v269 = *MEMORY[0x263F138E0];
  int v268 = *MEMORY[0x263F138F0];
  int v267 = *MEMORY[0x263F138D8];
  int v266 = *MEMORY[0x263F13908];
  v315 = (void (**)(uint64_t, uint64_t, uint64_t))(v289 + 16);
  uint64_t v314 = v289 + 8;
  unsigned int v313 = *MEMORY[0x263F138F8];
  uint64_t v99 = *(void *)(v95 + 56);
  uint64_t v335 = v95;
  uint64_t v336 = v99;
  while (1)
  {
    uint64_t v100 = v340;
    uint64_t v92 = (uint64_t)v341;
    v339(v340, v98, (void (*)(void, void))v341);
    int v101 = (*v338)(v100, v92);
    if (v101 != v337)
    {
      if (v101 == v330)
      {
        if (!v334) {
          goto LABEL_40;
        }
        id v107 = v334;
        objc_msgSend(v107, sel_value);
        uint64_t v308 = sub_23BD20508();
        id v108 = objc_msgSend(v107, sel_databaseID);
        sub_23BD208E8();

        uint64_t v109 = v332;
        uint64_t v86 = v333;
        sub_23BD204F8();
        uint64_t v110 = v324;
        uint64_t v60 = v331;
        sub_23BD20168();

        sub_23BD17248((uint64_t)v60, qword_26AD82A88);
        swift_storeEnumTagMultiPayload();
        uint64_t v92 = (uint64_t)v110;
        uint64_t v78 = v109;
        goto LABEL_39;
      }
      if (v101 == v307)
      {
        uint64_t v92 = v310;
        if (v310)
        {
          swift_bridgeObjectRetain();
          uint64_t v111 = (uint64_t)v60;
          uint64_t v112 = v78;
          uint64_t v113 = sub_23BD204F8();
          uint64_t v115 = v114;
          sub_23BD17248(v111, qword_26AD82A88);
          uint64_t v92 = (uint64_t)v324;
          uint64_t *v324 = v113;
          *(void *)(v92 + 8) = v115;
          uint64_t v78 = v112;
          uint64_t v60 = (uint64_t *)v111;
          swift_storeEnumTagMultiPayload();
LABEL_39:
          __swift_storeEnumTagSinglePayload(v92, 0, 1, v93);
          sub_23BD167FC(v92, (uint64_t)v60);
          goto LABEL_40;
        }
        if (!v303) {
          goto LABEL_40;
        }
LABEL_30:
        swift_bridgeObjectRetain();
        sub_23BD204F8();
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_20_0();
        swift_storeEnumTagMultiPayload();
        uint64_t v92 = (uint64_t)v78;
        uint64_t v78 = v60;
        uint64_t v60 = qword_26AD82A88;
        goto LABEL_39;
      }
      if (v101 == v295)
      {
        if (!v318) {
          goto LABEL_40;
        }
        goto LABEL_30;
      }
      OUTLINED_FUNCTION_11_1();
      uint64_t v265 = 70;
LABEL_147:
      sub_23BD20BB8();
      __break(1u);
      JUMPOUT(0x23BD14184);
    }
    if (v78)
    {
      v102 = v78;
      id v103 = objc_msgSend(v102, sel_value);
      sub_23BD208E8();

      sub_23BD204F8();
      id v104 = objc_msgSend(v102, sel_kind);
      uint64_t v105 = v313;
      switch((unint64_t)v104)
      {
        case 0uLL:
          goto LABEL_38;
        case 1uLL:
          uint64_t v106 = (uint64_t *)((char *)&v297 + 4);
          goto LABEL_37;
        case 2uLL:
          uint64_t v106 = (uint64_t *)&v298;
          goto LABEL_37;
        case 3uLL:
          uint64_t v106 = (uint64_t *)((char *)&v298 + 4);
          goto LABEL_37;
        case 4uLL:
          uint64_t v106 = &v299;
          goto LABEL_37;
        case 5uLL:
          uint64_t v106 = (uint64_t *)((char *)&v299 + 4);
          goto LABEL_37;
        case 6uLL:
          uint64_t v106 = (uint64_t *)&v300;
          goto LABEL_37;
        case 7uLL:
          uint64_t v106 = (uint64_t *)((char *)&v300 + 4);
LABEL_37:
          uint64_t v105 = *((unsigned int *)v106 - 64);
LABEL_38:
          uint64_t v116 = v320;
          uint64_t v117 = v322;
          (*v316)(v320, v105, v322);
          (*v315)(v321, v116, v117);
          uint64_t v118 = v319;
          sub_23BD20598();

          OUTLINED_FUNCTION_19_0();
          v119();
          uint64_t v60 = v331;
          sub_23BD17248((uint64_t)v331, qword_26AD82A88);
          swift_storeEnumTagMultiPayload();
          uint64_t v92 = v118;
          uint64_t v78 = v332;
          uint64_t v86 = v333;
          goto LABEL_39;
        case 8uLL:
          OUTLINED_FUNCTION_11_1();
          uint64_t v265 = 49;
          goto LABEL_147;
        default:
          goto LABEL_147;
      }
    }
LABEL_40:
    sub_23BD1679C((uint64_t)v60, v86, qword_26AD82A88);
    if (__swift_getEnumTagSinglePayload(v86, 1, v93) != 1) {
      break;
    }
    sub_23BD17248(v86, qword_26AD82A88);
    v98 += v336;
    if (!--v94)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v326;
      uint64_t v84 = v297;
      goto LABEL_45;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23BD17248(v86, qword_26AD82A88);
  a1 = v326;
  uint64_t v84 = v297;
LABEL_45:
  swift_bridgeObjectRelease();
  uint64_t v120 = v296;
  sub_23BD1679C((uint64_t)v60, v296, qword_26AD82A88);
  if (__swift_getEnumTagSinglePayload(v120, 1, v93) != 1)
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v175 = OUTLINED_FUNCTION_1_7();
        v176(v175);
        uint64_t v177 = OUTLINED_FUNCTION_3_4();
        v178(v177);
        OUTLINED_FUNCTION_12();
        sub_23BD203A8();
        break;
      case 2u:
        uint64_t v166 = OUTLINED_FUNCTION_1_7();
        v167(v166);
        uint64_t v168 = OUTLINED_FUNCTION_3_4();
        v169(v168);
        OUTLINED_FUNCTION_12();
        sub_23BD202A8();
        break;
      case 3u:
        uint64_t v170 = v273;
        uint64_t v84 = v276;
        OUTLINED_FUNCTION_29_0();
        v171();
        OUTLINED_FUNCTION_5_2();
        v172();
        OUTLINED_FUNCTION_28_0();
        OUTLINED_FUNCTION_2_6();
        v173();
        OUTLINED_FUNCTION_5_2();
        v174();
        sub_23BD20228();
        (*(void (**)(void *, uint64_t))(v170 + 8))(v84, v92);
        break;
      case 4u:
        uint64_t v162 = OUTLINED_FUNCTION_1_7();
        v163(v162);
        uint64_t v164 = OUTLINED_FUNCTION_3_4();
        v165(v164);
        OUTLINED_FUNCTION_12();
        sub_23BD20208();
        break;
      default:
        uint64_t v127 = v283;
        uint64_t v128 = v280;
        OUTLINED_FUNCTION_29_0();
        v129();
        OUTLINED_FUNCTION_5_2();
        v130();
        uint64_t v131 = OUTLINED_FUNCTION_1_7();
        v132(v131);
        uint64_t v133 = OUTLINED_FUNCTION_3_4();
        v134(v133);
        sub_23BD20358();
        (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v128, v92);
        break;
    }
    goto LABEL_100;
  }
  OUTLINED_FUNCTION_25_0((uint64_t)&v314);
  OUTLINED_FUNCTION_8_0();
  v121();
  sub_23BD209D8();
  OUTLINED_FUNCTION_33();
  if (v209)
  {
    OUTLINED_FUNCTION_32();
    MEMORY[0x270FA5388](v123);
    OUTLINED_FUNCTION_14_0();
    *(void *)(v124 - 16) = v93;
    OUTLINED_FUNCTION_30_0();
    sub_23BD155FC(v125, v126);
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    LOBYTE(v92) = v122 & 1;
    OUTLINED_FUNCTION_30_0();
  }
  uint64_t v135 = v285;
  uint64_t v136 = v284;
  OUTLINED_FUNCTION_10_1();
  v137();
  uint64_t v138 = v311;
  uint64_t v139 = v323;
  uint64_t v340 = *(void *)(v311 + 16);
  v341 = (void (*)(char *, uint64_t))(v311 + 16);
  OUTLINED_FUNCTION_5_2();
  v140();
  if (v92)
  {
    (*(void (**)(char *, uint64_t))(v138 + 8))(v135, v139);
    goto LABEL_53;
  }
  uint64_t v145 = v279;
  OUTLINED_FUNCTION_8_0();
  v146();
  sub_23BD209D8();
  OUTLINED_FUNCTION_33();
  if (v209)
  {
    OUTLINED_FUNCTION_32();
    MEMORY[0x270FA5388](v148);
    OUTLINED_FUNCTION_14_0();
    *(void *)(v149 - 16) = v145;
    sub_23BD155FC((uint64_t (*)(char *))sub_23BD172E4, v150);
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    LOBYTE(v92) = v147 & 1;
  }
  uint64_t v151 = v311;
  OUTLINED_FUNCTION_10_1();
  v152();
  uint64_t v153 = v323;
  OUTLINED_FUNCTION_5_2();
  v154();
  if ((v92 & 1) == 0)
  {
    v161 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
    v161(v136, v153);
    v161((uint64_t)v135, v153);
    goto LABEL_68;
  }
  uint64_t v155 = v274;
  OUTLINED_FUNCTION_8_0();
  v156();
  sub_23BD209D8();
  OUTLINED_FUNCTION_33();
  if (v209)
  {
    OUTLINED_FUNCTION_32();
    MEMORY[0x270FA5388](v158);
    OUTLINED_FUNCTION_14_0();
    *(void *)(v159 - 16) = v155;
    sub_23BD155FC((uint64_t (*)(char *))sub_23BD172E4, v160);
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    LOBYTE(v92) = v157 & 1;
  }
  OUTLINED_FUNCTION_10_1();
  v179();
  v180 = *(void (**)(uint64_t, uint64_t))(v311 + 8);
  uint64_t v181 = v323;
  v180(v136, v323);
  v180((uint64_t)v135, v181);
  if ((v92 & 1) == 0)
  {
LABEL_53:
    id v141 = objc_msgSend(a1, sel_musicKit_playbackID);
    if (!v141) {
      goto LABEL_68;
    }
    uint64_t v142 = v141;
    sub_23BD208E8();

    sub_23BD204F8();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_2_6();
    v143();
    uint64_t v84 = v298;
    OUTLINED_FUNCTION_5_2();
    v144();
    sub_23BD201B8();
    goto LABEL_99;
  }
LABEL_68:
  id v182 = objc_msgSend(a1, sel_musicKit_playbackID);
  uint64_t v84 = &_swift_FORCE_LOAD___swiftDispatch____MusicKitInternal_MediaPlayer;
  if (!v182) {
    goto LABEL_77;
  }
  v183 = v182;
  sub_23BD208E8();

  id v184 = objc_msgSend(a1, sel_musicKit_identifierSetSources);
  if (!v184)
  {
LABEL_76:
    swift_bridgeObjectRelease();
    goto LABEL_77;
  }
  v185 = v184;
  v186 = (void *)sub_23BD20A08();

  if (!v186[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_76;
  }
  uint64_t v188 = v186[4];
  uint64_t v187 = v186[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v188 == 0xD000000000000010 && v187 == 0x800000023BD22480)
  {
    swift_bridgeObjectRelease();
    goto LABEL_90;
  }
  char v211 = sub_23BD20C08();
  swift_bridgeObjectRelease();
  if (v211)
  {
LABEL_90:
    sub_23BD204F8();
    uint64_t v212 = OUTLINED_FUNCTION_1_7();
    v213(v212);
    OUTLINED_FUNCTION_5_2();
    v214();
    sub_23BD201B8();
    a1 = v326;
    goto LABEL_99;
  }
  swift_bridgeObjectRelease();
  a1 = v326;
LABEL_77:
  uint64_t v189 = v302;
  sub_23BD20408();
  char v190 = sub_23BD20428();
  v191 = *(void (**)(uint64_t, uint64_t))(v309 + 8);
  v191(v189, v312);
  if (v190)
  {
    id v192 = objc_msgSend(a1, sel_musicKit_containedDeviceLocalID);
    if (v192)
    {
      id v193 = v192;
      objc_msgSend(v193, sel_value);
      sub_23BD20508();
      OUTLINED_FUNCTION_26_0();
      id v194 = objc_msgSend(v193, sel_databaseID);
      sub_23BD208E8();
      OUTLINED_FUNCTION_27_0();
      a1 = v326;
      sub_23BD204F8();
      sub_23BD20168();

      uint64_t v195 = OUTLINED_FUNCTION_1_7();
      v196(v195);
      OUTLINED_FUNCTION_25_0((uint64_t)v329);
      OUTLINED_FUNCTION_5_2();
      v197();
      sub_23BD202D8();

      goto LABEL_98;
    }
  }
  sub_23BD204E8();
  (*(void (**)(uint64_t, void, uint64_t))(v289 + 104))(v321, *MEMORY[0x263F138F8], v322);
  sub_23BD20598();
  OUTLINED_FUNCTION_5_2();
  v198();
  v199 = *(void (**)(uint64_t, uint64_t, uint64_t))(v309 + 16);
  uint64_t v200 = OUTLINED_FUNCTION_25_0((uint64_t)&v334);
  v199(v200, v328, v312);
  OUTLINED_FUNCTION_5_2();
  v201();
  sub_23BD20358();
  unsigned __int8 v202 = objc_msgSend(a1, sel_musicKit_hasValidIdentifier);
  v203 = v275;
  if ((v202 & 1) == 0)
  {
    id v204 = objc_msgSend(v326, sel_musicKit_identifierSetSources);
    if (v204)
    {
      v205 = v204;
      v206 = (void *)sub_23BD20A08();

      if (v206[2])
      {
        uint64_t v84 = (void *)0xEB0000000065746FLL;
        uint64_t v208 = v206[4];
        uint64_t v207 = v206[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        BOOL v209 = v208 == 0x6D6552616964654DLL && v207 == 0xEB0000000065746FLL;
        if (v209)
        {
          swift_bridgeObjectRelease();
          goto LABEL_143;
        }
        char v210 = sub_23BD20C08();
        swift_bridgeObjectRelease();
        if (v210)
        {
LABEL_143:
          uint64_t v263 = OUTLINED_FUNCTION_13_0();
          v264(v263);
          a1 = v326;
          goto LABEL_98;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  if (qword_26AD82C88 != -1) {
    swift_once();
  }
  uint64_t v215 = sub_23BD200A8();
  __swift_project_value_buffer(v215, (uint64_t)qword_26AD82D20);
  uint64_t v84 = (void *)v312;
  v199((uint64_t)v203, v328, v312);
  id v216 = v326;
  swift_unknownObjectRetain_n();
  v217 = sub_23BD20088();
  os_log_type_t v218 = sub_23BD20A98();
  if (os_log_type_enabled(v217, v218))
  {
    uint64_t v219 = swift_slowAlloc();
    uint64_t v220 = swift_slowAlloc();
    uint64_t v342 = (uint64_t)v216;
    uint64_t v343 = v220;
    *(_DWORD *)uint64_t v219 = 136315394;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C90);
    v341 = (void (*)(char *, uint64_t))v191;
    uint64_t v221 = sub_23BD208F8();
    uint64_t v342 = sub_23BD088E0(v221, v222, &v343);
    sub_23BD20AD8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v219 + 12) = 2080;
    uint64_t v84 = (void *)(v219 + 14);
    uint64_t v223 = sub_23BD20418();
    uint64_t v342 = sub_23BD088E0(v223, v224, &v343);
    sub_23BD20AD8();
    swift_bridgeObjectRelease();
    v341(v203, v312);
    _os_log_impl(&dword_23BD04000, v217, v218, "No catalogID, libraryID, or deviceLocalID was found from underlying identifier set %s. A MusicIdentifierSet with empty string, for type %s, is being used.", (uint8_t *)v219, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECD4DF0](v220, -1, -1);
    MEMORY[0x23ECD4DF0](v219, -1, -1);
  }
  else
  {

    v191((uint64_t)v203, (uint64_t)v84);
    swift_unknownObjectRelease_n();
  }
  uint64_t v225 = OUTLINED_FUNCTION_13_0();
  v226(v225);
  a1 = v216;
LABEL_98:
  uint64_t v60 = v331;
LABEL_99:
  uint64_t v78 = v332;
LABEL_100:
  sub_23BD203B8();
  uint64_t v228 = v227;
  swift_bridgeObjectRelease();
  if (v228)
  {
    swift_bridgeObjectRelease();
  }
  else if (v310)
  {
    sub_23BD204F8();
    sub_23BD203C8();
  }
  uint64_t v229 = v299;
  sub_23BD20368();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v229, 1, v304);
  sub_23BD17248(v229, &qword_26AD82B48);
  if (EnumTagSinglePayload == 1 && v78)
  {
    v231 = v78;
    uint64_t v232 = v287;
    sub_23BD1F80C(v231);
    __swift_storeEnumTagSinglePayload(v232, 0, 1, v304);
    sub_23BD20378();
  }
  v233 = v300;
  sub_23BD20238();
  int v234 = __swift_getEnumTagSinglePayload((uint64_t)v233, 1, v317);
  sub_23BD17248((uint64_t)v233, &qword_26AD82B10);
  if (v234 == 1 && v334)
  {
    id v235 = v334;
    objc_msgSend(v235, sel_value);
    sub_23BD20508();
    OUTLINED_FUNCTION_26_0();
    a1 = objc_msgSend(v235, sel_databaseID);
    sub_23BD208E8();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_7_1();

    OUTLINED_FUNCTION_21_0();
  }
  if (objc_msgSend(a1, sel_musicKit_cloudID))
  {
    sub_23BD20508();
    sub_23BD20348();
  }
  id v236 = objc_msgSend(a1, sel_musicKit_cloudAlbumLibraryID);
  if (v236)
  {
    v237 = v236;
    sub_23BD208E8();
    v233 = v238;

    sub_23BD204F8();
    sub_23BD202C8();
  }
  if (objc_msgSend(a1, sel_musicKit_reportingAdamID))
  {
    sub_23BD20508();
    sub_23BD20298();
  }
  if (objc_msgSend(a1, sel_musicKit_purchasedAdamID))
  {
    sub_23BD20508();
    sub_23BD20278();
  }
  if (objc_msgSend(a1, sel_musicKit_assetAdamID))
  {
    sub_23BD20508();
    sub_23BD201F8();
  }
  id v239 = objc_msgSend(a1, sel_musicKit_deviceLocalID);
  if (v239)
  {
    id v240 = v239;
    objc_msgSend(v240, sel_value);
    sub_23BD20508();
    OUTLINED_FUNCTION_26_0();
    a1 = objc_msgSend(v240, sel_databaseID);
    sub_23BD208E8();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_7_1();

    OUTLINED_FUNCTION_21_0();
  }
  id v241 = objc_msgSend(a1, sel_musicKit_formerIDs);
  if (v241)
  {
    v242 = v241;
    uint64_t v243 = sub_23BD20A08();

    v233 = *(char **)(v243 + 16);
    if (v233)
    {
      uint64_t v343 = MEMORY[0x263F8EE78];
      sub_23BD153D4(0, (int64_t)v233, 0);
      uint64_t v244 = v343;
      uint64_t v245 = v243 + 40;
      do
      {
        swift_bridgeObjectRetain();
        uint64_t v246 = sub_23BD204F8();
        uint64_t v248 = v247;
        uint64_t v343 = v244;
        unint64_t v250 = *(void *)(v244 + 16);
        unint64_t v249 = *(void *)(v244 + 24);
        uint64_t v84 = (void *)(v250 + 1);
        if (v250 >= v249 >> 1)
        {
          sub_23BD153D4((void *)(v249 > 1), v250 + 1, 1);
          uint64_t v244 = v343;
        }
        v245 += 16;
        *(void *)(v244 + 16) = v84;
        uint64_t v251 = v244 + 16 * v250;
        *(void *)(v251 + 32) = v246;
        *(void *)(v251 + 40) = v248;
        --v233;
      }
      while (v233);
      swift_bridgeObjectRelease();
      a1 = v326;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v244 = MEMORY[0x263F8EE78];
    }
    sub_23BD147EC(v244);
    sub_23BD20398();
  }
  id v252 = objc_msgSend(a1, sel_musicKit_containedDeviceLocalID);
  if (v252)
  {
    id v253 = v252;
    objc_msgSend(v253, sel_value);
    sub_23BD20508();
    OUTLINED_FUNCTION_26_0();
    a1 = objc_msgSend(v253, sel_databaseID);
    sub_23BD208E8();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_7_1();

    __swift_storeEnumTagSinglePayload((uint64_t)v84, 0, 1, v317);
    sub_23BD202F8();
  }
  id v254 = objc_msgSend(a1, sel_musicKit_playbackID);
  if (v254)
  {
    v255 = v254;
    sub_23BD208E8();
    v233 = v256;

    sub_23BD204F8();
    sub_23BD201D8();
  }
  if (objc_msgSend(a1, sel_musicKit_syncID))
  {
    sub_23BD20508();
    sub_23BD20328();
  }
  uint64_t v257 = sub_23BD20438();
  if (dynamic_cast_existential_1_conditional(v257))
  {
    id v258 = objc_msgSend(a1, sel_musicKit_modelKind);
    if (v258)
    {
      v233 = (char *)v258;
      sub_23BD20138();

      sub_23BD20258();
    }
  }
  uint64_t v259 = OUTLINED_FUNCTION_25_0((uint64_t)&v338);
  sub_23BD1679C(v259, v301, (uint64_t *)&unk_26AD82B18);
  sub_23BD20198();

  swift_unknownObjectRelease();
  sub_23BD17248((uint64_t)v233, (uint64_t *)&unk_26AD82B18);
  OUTLINED_FUNCTION_19_0();
  v260();
  OUTLINED_FUNCTION_19_0();
  v261();
  return sub_23BD17248((uint64_t)v60, qword_26AD82A88);
}

id sub_23BD141BC(id a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B10);
  uint64_t v3 = OUTLINED_FUNCTION_5(v2);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v53 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BD20368();
  uint64_t v13 = sub_23BD205B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_23BD17248((uint64_t)v12, &qword_26AD82B48);
    id v59 = 0;
  }
  else
  {
    id v59 = sub_23BD1FAAC();
    OUTLINED_FUNCTION_24_0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }
  sub_23BD203B8();
  if (v15)
  {
    id v60 = (id)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v60 = 0;
  }
  sub_23BD202B8();
  if (v16)
  {
    uint64_t v57 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v57 = 0;
  }
  sub_23BD20338();
  if (v17)
  {
    char v56 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v56 = 0;
  }
  sub_23BD20288();
  if (v18)
  {
    uint64_t v55 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = 0;
  }
  sub_23BD20268();
  if (v19)
  {
    uint64_t v20 = sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  sub_23BD201E8();
  if (v21)
  {
    uint64_t v54 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v54 = 0;
  }
  sub_23BD20238();
  uint64_t v22 = sub_23BD20188();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v22);
  id v58 = a1;
  if (EnumTagSinglePayload == 1)
  {
    sub_23BD17248((uint64_t)v8, &qword_26AD82B10);
    uint64_t v53 = 0;
  }
  else
  {
    uint64_t v53 = (void *)sub_23BD0C1C4();
    OUTLINED_FUNCTION_24_0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v22);
  }
  sub_23BD20218();
  if (v25)
  {
    uint64_t v26 = sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = 0;
  }
  sub_23BD202E8();
  uint64_t v27 = (void *)v20;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v22) == 1)
  {
    sub_23BD17248((uint64_t)v6, &qword_26AD82B10);
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = sub_23BD0C1C4();
    OUTLINED_FUNCTION_24_0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v22);
  }
  sub_23BD20318();
  if (v30)
  {
    uint64_t v31 = sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v31 = 0;
  }
  sub_23BD201C8();
  if (v32)
  {
    uint64_t v33 = sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v34 = self;
  uint64_t v35 = sub_23BD20388();
  uint64_t v36 = sub_23BD14674(v35);
  swift_bridgeObjectRelease();
  uint64_t v37 = sub_23BD0FB24();
  uint64_t v52 = (void *)v34;
  uint64_t v51 = v36;
  uint64_t v49 = v31;
  uint64_t v50 = v33;
  *(void *)&long long v48 = v26;
  *((void *)&v48 + 1) = v28;
  uint64_t v38 = v57;
  uint64_t v39 = (void *)v26;
  uint64_t v40 = v56;
  uint64_t v41 = (void *)v28;
  uint64_t v42 = v55;
  uint64_t v43 = (void *)v31;
  uint64_t v44 = v54;
  uint64_t v45 = (void *)v33;
  uint64_t v46 = v53;
  id v58 = sub_23BD164E8((uint64_t)v59, (uint64_t)v60, (uint64_t)v57, (uint64_t)v56, (uint64_t)v55, (uint64_t)v27, (uint64_t)v54, (uint64_t)v53, v48, v49, v50, v51, (uint64_t)v58, v37, v52);

  return v58;
}

uint64_t sub_23BD14674(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_23BD15424(0, v1, 0);
  uint64_t v2 = v19;
  uint64_t result = sub_23BD166A8(a1);
  int64_t v5 = result;
  int v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_14;
    }
    char v18 = v9;
    uint64_t v10 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    unint64_t v14 = *(void *)(v19 + 16);
    unint64_t v13 = *(void *)(v19 + 24);
    swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1) {
      sub_23BD15424((void *)(v13 > 1), v14 + 1, 1);
    }
    *(void *)(v19 + 16) = v14 + 1;
    uint64_t v15 = v19 + 16 * v14;
    *(void *)(v15 + 32) = v11;
    *(void *)(v15 + 40) = v12;
    uint64_t result = sub_23BD165C4(v5, v7, v18 & 1, a1);
    int64_t v5 = result;
    int v7 = v16;
    char v9 = v17 & 1;
    if (!--v1)
    {
      sub_23BD16728(result, v16, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_23BD147EC(uint64_t a1)
{
  sub_23BD16864();
  uint64_t v2 = sub_23BD20A48();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23BD15A08(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_23BD148A4(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = a2;
  uint64_t v3 = sub_23BD20188();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v45 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23BD205B8();
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MusicPreferredID();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v45 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  char v17 = (uint64_t *)((char *)&v45 - v16);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (uint64_t *)((char *)&v45 - v19);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v45 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A83240);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = &v26[*(int *)(v24 + 56)];
  sub_23BD171E4(a1, (uint64_t)v26);
  sub_23BD171E4(v50, (uint64_t)v27);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_23BD171E4((uint64_t)v26, (uint64_t)v20);
      uint64_t v29 = *v20;
      uint64_t v28 = v20[1];
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_20;
      }
      goto LABEL_7;
    case 2u:
      sub_23BD171E4((uint64_t)v26, (uint64_t)v17);
      uint64_t v33 = *v17;
      uint64_t v32 = v17[1];
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_20;
      }
      if (v33 == *(void *)v27 && v32 == *((void *)v27 + 1)) {
        goto LABEL_23;
      }
      char v35 = sub_23BD20C08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_24;
    case 3u:
      sub_23BD171E4((uint64_t)v26, (uint64_t)v14);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v37 = v48;
        uint64_t v36 = v49;
        uint64_t v38 = v45;
        (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v45, v27, v49);
        char v39 = sub_23BD20158();
        uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
        v40(v38, v36);
        v40(v14, v36);
        goto LABEL_29;
      }
      (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v49);
      goto LABEL_26;
    case 4u:
      sub_23BD171E4((uint64_t)v26, (uint64_t)v11);
      uint64_t v29 = *v11;
      uint64_t v28 = v11[1];
      if (swift_getEnumCaseMultiPayload() != 4)
      {
LABEL_20:
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
LABEL_7:
      if (v29 == *(void *)v27 && v28 == *((void *)v27 + 1))
      {
LABEL_23:
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v31 = sub_23BD20C08();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0)
        {
LABEL_19:
          sub_23BD16E34((uint64_t)v26);
          goto LABEL_27;
        }
      }
LABEL_24:
      sub_23BD16E34((uint64_t)v26);
      char v39 = 1;
      break;
    default:
      sub_23BD171E4((uint64_t)v26, (uint64_t)v22);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v46 + 8))(v22, v47);
LABEL_26:
        sub_23BD17248((uint64_t)v26, &qword_268A83240);
LABEL_27:
        char v39 = 0;
      }
      else
      {
        uint64_t v42 = v46;
        uint64_t v41 = v47;
        (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v7, v27, v47);
        char v39 = sub_23BD20568();
        uint64_t v43 = *(void (**)(char *, uint64_t))(v42 + 8);
        v43(v7, v41);
        v43(v22, v41);
LABEL_29:
        sub_23BD16E34((uint64_t)v26);
      }
      break;
  }
  return v39 & 1;
}

uint64_t sub_23BD14DC4()
{
  uint64_t v1 = sub_23BD20188();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23BD205B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MusicPreferredID();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BD171E4(v0, (uint64_t)v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 4u:
      sub_23BD20C88();
      swift_bridgeObjectRetain();
      sub_23BD20918();
      uint64_t result = swift_bridgeObjectRelease_n();
      break;
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v11, v1);
      sub_23BD20C88();
      sub_23BD1729C(&qword_268A83248, MEMORY[0x263F136E8]);
      sub_23BD208B8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
      sub_23BD20C88();
      sub_23BD1729C((unint64_t *)&unk_268A83250, MEMORY[0x263F13910]);
      sub_23BD208B8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      break;
  }
  return result;
}

uint64_t sub_23BD150F8()
{
  return sub_23BD20C98();
}

uint64_t sub_23BD15144()
{
  return sub_23BD20C98();
}

char *sub_23BD15180(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23BD20BD8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_23BD15214(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * a2 > a1) ? (v6 = a1 + 16 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_23BD20BD8();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x270FA01C8](v7, v5);
}

uint64_t sub_23BD152F4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * a2 > a1) ? (v6 = a1 + 16 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_23BD20BD8();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x270FA01C8](v7, v5);
}

void *sub_23BD153D4(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_23BD15474(a1, a2, a3, *v3, &qword_268A83230, (void (*)(uint64_t, uint64_t, void *))sub_23BD15180, (void (*)(uint64_t, uint64_t, void *))sub_23BD15214);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void *sub_23BD15424(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_23BD15474(a1, a2, a3, *v3, &qword_268A83220, (void (*)(uint64_t, uint64_t, void *))sub_23BD15180, (void (*)(uint64_t, uint64_t, void *))sub_23BD152F4);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void *sub_23BD15474(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, void *), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = (void *)swift_allocObject();
    size_t v16 = _swift_stdlib_malloc_size(v15);
    void v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  }
  char v17 = v15 + 4;
  uint64_t v18 = a4 + 32;
  if (v10)
  {
    a6(v18, v13, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    a7(v18, v13, v17);
  }
  swift_release();
  return v15;
}

uint64_t sub_23BD1556C()
{
  return sub_23BD208C8() & 1;
}

BOOL sub_23BD155FC(uint64_t (*a1)(char *), uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v41 = sub_23BD20488();
  uint64_t v5 = *(void *)(v41 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v39 = (char *)&v32 - v8;
  uint64_t v9 = sub_23BD204B8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  int64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B68);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  size_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v36(v12, v2, v9);
  char v17 = (void (*)(uint64_t))MEMORY[0x263F13808];
  sub_23BD1729C((unint64_t *)&unk_26AD82B30, MEMORY[0x263F13808]);
  uint64_t v37 = v12;
  sub_23BD209B8();
  uint64_t v45 = &v16[*(int *)(v14 + 44)];
  sub_23BD1729C(&qword_26AD82B40, v17);
  uint64_t v38 = v10 + 16;
  uint64_t v33 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v34 = (void (**)(char *))(v5 + 16);
  uint64_t v18 = v16;
  uint64_t v32 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  char v35 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v19 = v41;
  while (1)
  {
    uint64_t v20 = *(void *)v45;
    sub_23BD20A58();
    uint64_t v21 = v46[0];
    uint64_t v44 = v20;
    if (v20 == v46[0])
    {
LABEL_5:
      uint64_t v30 = (uint64_t)v18;
      goto LABEL_7;
    }
    uint64_t v22 = (void (*)(uint64_t *, void))sub_23BD20A78();
    uint64_t v23 = *v34;
    uint64_t v47 = v4;
    uint64_t v24 = v39;
    v23(v39);
    v22(v46, 0);
    uint64_t v25 = v37;
    v36(v37, (uint64_t)v18, v9);
    sub_23BD20A68();
    (*v33)(v25, v9);
    uint64_t v26 = v40;
    (*v32)(v40, v24, v19);
    uint64_t v27 = v47;
    char v28 = v42(v26);
    uint64_t v4 = v27;
    if (v27) {
      break;
    }
    char v29 = v28;
    (*v35)(v26, v19);
    if (v29) {
      goto LABEL_5;
    }
  }
  (*v35)(v26, v19);
  uint64_t v30 = (uint64_t)v18;
LABEL_7:
  sub_23BD17248(v30, &qword_26AD82B68);
  return v44 != v21;
}

uint64_t sub_23BD15A08(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_23BD20C78();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23BD20918();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_23BD20C98();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    int64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23BD20C08() & 1) != 0)
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
      if (v19 || (sub_23BD20C08() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23BD15EB4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23BD15BC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A83228);
  uint64_t v3 = sub_23BD20B08();
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_23BD20C78();
      swift_bridgeObjectRetain();
      sub_23BD20918();
      swift_bridgeObjectRelease();
      uint64_t result = sub_23BD20C98();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *char v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_23BD16060(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_23BD15EB4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23BD15BC8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_23BD1607C();
      goto LABEL_22;
    }
    sub_23BD16230();
  }
  uint64_t v11 = *v4;
  sub_23BD20C78();
  swift_bridgeObjectRetain();
  sub_23BD20918();
  swift_bridgeObjectRelease();
  uint64_t result = sub_23BD20C98();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_23BD20C08(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_23BD20C28();
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
          uint64_t result = sub_23BD20C08();
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

uint64_t sub_23BD16060(uint64_t result, uint64_t a2, void *a3)
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

void *sub_23BD1607C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A83228);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23BD20AF8();
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
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
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

uint64_t sub_23BD16230()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A83228);
  uint64_t v3 = sub_23BD20B08();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_23BD20C78();
    swift_bridgeObjectRetain_n();
    sub_23BD20918();
    swift_bridgeObjectRelease();
    uint64_t result = sub_23BD20C98();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *char v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_23BD164E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  uint64_t v18 = (void *)sub_23BD209F8();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(a15, sel_identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source_, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, a13, a14);

  return v19;
}

int64_t sub_23BD165C4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23BD166A8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_23BD16728(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23BD16734()
{
  return sub_23BD1556C() & 1;
}

uint64_t type metadata accessor for MusicPreferredID()
{
  uint64_t result = qword_26AD82A70;
  if (!qword_26AD82A70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23BD1679C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_24_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_23BD167FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23BD16864()
{
  unint64_t result = qword_26AD82A20;
  if (!qword_26AD82A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD82A20);
  }
  return result;
}

uint64_t *sub_23BD168B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
      case 4u:
        uint64_t v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v8 = sub_23BD20188();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        break;
      default:
        uint64_t v6 = sub_23BD205B8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23BD16A64(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_23BD205B8();
      goto LABEL_7;
    case 1:
    case 2:
    case 4:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 3:
      uint64_t v3 = sub_23BD20188();
LABEL_7:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_23BD16B44(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 4u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v5 = sub_23BD20188();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      break;
    default:
      uint64_t v4 = sub_23BD205B8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_23BD16CA8(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_23BD16E34((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v5 = sub_23BD20188();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        break;
      default:
        uint64_t v4 = sub_23BD205B8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23BD16E34(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MusicPreferredID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_23BD16E90(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v8 = sub_23BD20188();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_23BD205B8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_23BD16F98(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_23BD16E34((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v8 = sub_23BD20188();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_23BD205B8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23BD170BC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23BD170CC()
{
  uint64_t result = sub_23BD205B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23BD20188();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23BD1719C()
{
  return sub_23BD1729C(&qword_268A83238, (void (*)(uint64_t))type metadata accessor for MusicPreferredID);
}

uint64_t sub_23BD171E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MusicPreferredID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BD17248(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v3();
  return a1;
}

uint64_t sub_23BD1729C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23BD172E4()
{
  return sub_23BD16734() & 1;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

void *OUTLINED_FUNCTION_20_0()
{
  uint64_t v3 = *(void **)(v2 - 248);
  *uint64_t v3 = v0;
  v3[1] = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_23BD17248(v1, v0);
}

uint64_t MusicCollaborativePlaylist.UpdateInvitationModeRequest.init(playlist:updatedInvitationMode:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23BD20848();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a1, sel_identifiers);
  id v11 = objc_msgSend(v10, sel_library);

  if (v11)
  {
    objc_msgSend(v11, sel_persistentID);
    swift_unknownObjectRelease();
    sub_23BD20508();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    sub_23BD1FF38();

    uint64_t v12 = OUTLINED_FUNCTION_0_3();
    v13(v12);
    uint64_t v14 = sub_23BD1FF48();
    return __swift_storeEnumTagSinglePayload(a3, 0, 1, v14);
  }
  else
  {

    uint64_t v16 = OUTLINED_FUNCTION_0_3();
    v17(v16);
    uint64_t v18 = sub_23BD1FF48();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v18);
  }
}

uint64_t MusicCollaborativePlaylist.ReactionRequest.init(playlist:entry:reaction:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v45 = a2;
  uint64_t v46 = a4;
  uint64_t v44 = a3;
  uint64_t v47 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A82FB0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23BD20868();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v43 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v21;
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  BOOL v26 = (char *)&v42 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  char v28 = (char *)&v42 - v27;
  id v29 = a1;
  sub_23BD06EBC((uint64_t)v29);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20) == 1)
  {

    swift_bridgeObjectRelease();
    uint64_t v30 = &qword_26AD82C70;
    uint64_t v31 = (uint64_t)v19;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v19, v20);
    id v32 = v45;
    sub_23BD070B8((uint64_t)v32);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
    {
      uint64_t v37 = *(void (**)(char *, char *))(v11 + 32);
      uint64_t v42 = v9;
      v37(v16, v8);
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v26, v28, v20);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v43, v16, v9);
      uint64_t v36 = v47;
      sub_23BD1FE68();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v42);
      uint64_t v38 = OUTLINED_FUNCTION_1_8();
      v39(v38);
      uint64_t v35 = 0;
      goto LABEL_7;
    }

    swift_bridgeObjectRelease();
    uint64_t v33 = OUTLINED_FUNCTION_1_8();
    v34(v33);
    uint64_t v30 = &qword_268A82FB0;
    uint64_t v31 = (uint64_t)v8;
  }
  sub_23BD0773C(v31, v30);
  uint64_t v35 = 1;
  uint64_t v36 = v47;
LABEL_7:
  uint64_t v40 = sub_23BD1FE78();
  return __swift_storeEnumTagSinglePayload(v36, v35, 1, v40);
}

id sub_23BD178A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_23BD17900()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKitInternal_MediaPlayer_FinalClass()
{
  return self;
}

void sub_23BD1795C()
{
}

void sub_23BD179A4()
{
}

void sub_23BD179EC()
{
  OUTLINED_FUNCTION_18();
  uint64_t v34 = v2;
  uint64_t v35 = v3;
  id v32 = v4;
  uint64_t v33 = v5;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v37 = v10;
  uint64_t v11 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_50();
  uint64_t v15 = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v16;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v31 - v19;
  dynamic_cast_existential_1_unconditional(v0);
  OUTLINED_FUNCTION_43();
  id v36 = v9;
  id v21 = objc_msgSend(v9, sel_identifiers);
  sub_23BD20498();
  sub_23BD08618(v1, (uint64_t)v20);

  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  uint64_t v22 = v13 + 8;
  uint64_t v24 = v1;
  uint64_t v25 = v31;
  v23(v24, v11);
  OUTLINED_FUNCTION_5_2();
  v26();
  OUTLINED_FUNCTION_53();
  if (v7 >> 62)
  {
    sub_23BD200B8();
    id v27 = v36;
    id v30 = v36;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v27 = v36;
    id v28 = v36;
    swift_bridgeObjectRetain();
    sub_23BD20C18();
    sub_23BD200B8();
  }
  swift_bridgeObjectRelease();
  uint64_t v29 = v32(0);
  sub_23BD1BD34(v33, v34);
  OUTLINED_FUNCTION_44();
  sub_23BD20758();

  (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v15);
  __swift_storeEnumTagSinglePayload(v22, 0, 1, v29);
  OUTLINED_FUNCTION_17();
}

void sub_23BD17C54()
{
}

void sub_23BD17C9C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_1();
  if (objc_msgSend(v0, sel_curatorKind) == (id)4)
  {
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_43();
    id v6 = OUTLINED_FUNCTION_61(v5, sel_identifiers);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_40();

    OUTLINED_FUNCTION_45();
    v7();
    uint64_t v8 = OUTLINED_FUNCTION_14_1();
    v9(v8);
    OUTLINED_FUNCTION_42();
    if (v10)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_58();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v11 = v19;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_23BD20018();
    sub_23BD1BD34(&qword_268A832B0, MEMORY[0x263F56C60]);
    OUTLINED_FUNCTION_7_2();

    OUTLINED_FUNCTION_45();
    v13();
    __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v12);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_23BD20018();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v14, v15, v16, v17);
  }
}

void sub_23BD17ED4()
{
}

void sub_23BD17F1C()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_21_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_47();
  if ((objc_msgSend(v1, sel_hasVideo) & 1) != 0
    || (objc_msgSend(v1, sel_isArtistUploadedContent) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    sub_23BD20038();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v12, v13, v14, v15);
  }
  else
  {
    uint64_t v18 = (uint64_t)v0;
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_46();
    id v5 = objc_msgSend(v1, sel_identifiers);
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_56();

    OUTLINED_FUNCTION_45();
    v6();
    OUTLINED_FUNCTION_5_2();
    v7();
    OUTLINED_FUNCTION_42();
    if (v8)
    {
      OUTLINED_FUNCTION_36();
      id v17 = v1;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v9 = v1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_23BD20038();
    sub_23BD1BD34(&qword_268A832B8, MEMORY[0x263F56CB8]);
    OUTLINED_FUNCTION_9_1();

    OUTLINED_FUNCTION_45();
    v11();
    __swift_storeEnumTagSinglePayload(v18, 0, 1, v10);
    OUTLINED_FUNCTION_17();
  }
}

void sub_23BD18184()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_21_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_47();
  if (objc_msgSend(v1, sel_hasVideo)
    && (objc_msgSend(v1, sel_isArtistUploadedContent) & 1) != 0)
  {
    uint64_t v18 = (uint64_t)v0;
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_46();
    id v5 = objc_msgSend(v1, sel_identifiers);
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_56();

    OUTLINED_FUNCTION_45();
    v6();
    OUTLINED_FUNCTION_5_2();
    v7();
    OUTLINED_FUNCTION_42();
    if (v8)
    {
      OUTLINED_FUNCTION_36();
      id v17 = v1;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v9 = v1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_23BD20048();
    sub_23BD1BD34(&qword_268A83280, MEMORY[0x263F56CE8]);
    OUTLINED_FUNCTION_9_1();

    OUTLINED_FUNCTION_45();
    v11();
    __swift_storeEnumTagSinglePayload(v18, 0, 1, v10);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_23BD20048();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v12, v13, v14, v15);
  }
}

void sub_23BD183EC()
{
}

void sub_23BD18434()
{
}

void sub_23BD1847C()
{
}

void sub_23BD184C4()
{
}

void sub_23BD1850C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v4 = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_21_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_47();
  if (objc_msgSend(v1, sel_hasVideo) && !objc_msgSend(v1, sel_isArtistUploadedContent))
  {
    uint64_t v22 = (uint64_t)v0;
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_46();
    id v16 = objc_msgSend(v1, sel_identifiers);
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_56();

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v4);
    OUTLINED_FUNCTION_5_2();
    v17();
    OUTLINED_FUNCTION_26_1();
    if (v18)
    {
      OUTLINED_FUNCTION_27_1();
      id v21 = v1;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_57();
    }
    else
    {
      id v19 = v1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_23BD204D8();
    OUTLINED_FUNCTION_9_1();

    (*(void (**)(uint64_t))(v23 + 8))(v2);
    __swift_storeEnumTagSinglePayload(v22, 0, 1, v20);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_23BD204D8();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
  }
}

void sub_23BD18744()
{
}

void sub_23BD18764()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_1();
  if (objc_msgSend(v0, sel_hasVideo))
  {
    swift_bridgeObjectRelease();

    sub_23BD20778();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_43();
    id v11 = OUTLINED_FUNCTION_61(v10, sel_identifiers);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_40();

    uint64_t v12 = OUTLINED_FUNCTION_32_0();
    v13(v12);
    uint64_t v14 = OUTLINED_FUNCTION_14_1();
    v15(v14);
    OUTLINED_FUNCTION_26_1();
    if (v16)
    {
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_58();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_57();
    }
    else
    {
      id v17 = v21;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_23BD20778();
    OUTLINED_FUNCTION_7_2();

    uint64_t v19 = OUTLINED_FUNCTION_33_0();
    v20(v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v18);
    OUTLINED_FUNCTION_17();
  }
}

void sub_23BD18948()
{
}

void sub_23BD18968()
{
}

void sub_23BD18988()
{
}

void sub_23BD189A8()
{
}

void sub_23BD189C8()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_1();
  if (objc_msgSend(v0, sel_curatorSubKind) == (id)1)
  {
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_43();
    id v6 = OUTLINED_FUNCTION_61(v5, sel_identifiers);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_40();

    uint64_t v7 = OUTLINED_FUNCTION_32_0();
    v8(v7);
    uint64_t v9 = OUTLINED_FUNCTION_14_1();
    v10(v9);
    OUTLINED_FUNCTION_26_1();
    if (v11)
    {
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_58();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_57();
    }
    else
    {
      id v12 = v21;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_23BD20818();
    OUTLINED_FUNCTION_7_2();

    uint64_t v14 = OUTLINED_FUNCTION_33_0();
    v15(v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v13);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_23BD20818();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v16, v17, v18, v19);
  }
}

void sub_23BD18BB0()
{
}

void sub_23BD18BD0()
{
}

void sub_23BD18BF0()
{
}

void sub_23BD18C38()
{
}

void sub_23BD18C58()
{
  OUTLINED_FUNCTION_18();
  BOOL v26 = v1;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v25 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_43();
  id v27 = v5;
  id v17 = objc_msgSend(v5, sel_identifiers);
  sub_23BD20498();
  sub_23BD08618(v11, v0);

  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  uint64_t v18 = v7 + 8;
  v19(v11, v25);
  OUTLINED_FUNCTION_5_2();
  v20();
  OUTLINED_FUNCTION_53();
  if (v3 >> 62)
  {
    sub_23BD200B8();
    id v21 = v27;
    id v24 = v27;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v21 = v27;
    id v22 = v27;
    swift_bridgeObjectRetain();
    sub_23BD20C18();
    sub_23BD200B8();
  }
  swift_bridgeObjectRelease();
  uint64_t v23 = v26(0);
  OUTLINED_FUNCTION_44();
  sub_23BD20758();

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v12);
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v23);
  OUTLINED_FUNCTION_17();
}

void sub_23BD18EA4()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_1();
  if (objc_msgSend(v0, sel_curatorSubKind) == (id)3)
  {
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_43();
    id v6 = OUTLINED_FUNCTION_61(v5, sel_identifiers);
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_40();

    uint64_t v7 = OUTLINED_FUNCTION_32_0();
    v8(v7);
    uint64_t v9 = OUTLINED_FUNCTION_14_1();
    v10(v9);
    OUTLINED_FUNCTION_26_1();
    if (v11)
    {
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_58();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_57();
    }
    else
    {
      id v12 = v21;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_23BD20888();
    OUTLINED_FUNCTION_7_2();

    uint64_t v14 = OUTLINED_FUNCTION_33_0();
    v15(v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v0, 0, 1, v13);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    swift_bridgeObjectRelease();

    sub_23BD20888();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v16, v17, v18, v19);
  }
}

uint64_t sub_23BD1908C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23BD20468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23BD203E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  if (objc_msgSend(a1, sel_hasVideo)
    && (objc_msgSend(a1, sel_isArtistUploadedContent) & 1) != 0)
  {
    uint64_t v31 = a3;
    uint64_t v30 = sub_23BD20048();
    dynamic_cast_existential_1_unconditional(v30);
    uint64_t v29 = v11;
    uint64_t v18 = v10;
    id v19 = objc_msgSend(a1, sel_identifiers, v17);
    sub_23BD20498();
    sub_23BD08618((uint64_t)v9, (uint64_t)v16);

    uint64_t v20 = v18;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v21 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v18);
    uint64_t v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    if (a2 >> 62)
    {
      sub_23BD200B8();
      id v27 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v22 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    sub_23BD1BD34(&qword_268A83280, MEMORY[0x263F56CE8]);
    uint64_t v23 = v31;
    uint64_t v24 = v30;
    sub_23BD20758();

    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v20);
    return __swift_storeEnumTagSinglePayload(v23, 0, 1, v24);
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v26 = sub_23BD20048();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v26);
  }
}

uint64_t sub_23BD1941C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23BD20468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23BD203E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  if (objc_msgSend(a1, sel_hasVideo) && !objc_msgSend(a1, sel_isArtistUploadedContent))
  {
    uint64_t v31 = a3;
    uint64_t v30 = sub_23BD204D8();
    dynamic_cast_existential_1_unconditional(v30);
    uint64_t v29 = v11;
    uint64_t v20 = v10;
    id v21 = objc_msgSend(a1, sel_identifiers, v19);
    sub_23BD20498();
    sub_23BD08618((uint64_t)v9, (uint64_t)v16);

    uint64_t v22 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v23 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v20);
    uint64_t v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    if (a2 >> 62)
    {
      sub_23BD200B8();
      id v27 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v24 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v25 = v31;
    uint64_t v26 = v30;
    sub_23BD20758();

    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v22);
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v26);
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v17 = sub_23BD204D8();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v17);
  }
}

uint64_t sub_23BD1977C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23BD20468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23BD203E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  if ((objc_msgSend(a1, sel_hasVideo) & 1) != 0
    || (objc_msgSend(a1, sel_isArtistUploadedContent) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    uint64_t v26 = sub_23BD20038();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v26);
  }
  else
  {
    uint64_t v31 = a3;
    uint64_t v30 = sub_23BD20038();
    dynamic_cast_existential_1_unconditional(v30);
    uint64_t v29 = v11;
    uint64_t v18 = v10;
    id v19 = objc_msgSend(a1, sel_identifiers, v17);
    sub_23BD20498();
    sub_23BD08618((uint64_t)v9, (uint64_t)v16);

    uint64_t v20 = v18;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v21 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v18);
    uint64_t v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    if (a2 >> 62)
    {
      sub_23BD200B8();
      id v27 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v22 = a1;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    sub_23BD1BD34(&qword_268A832B8, MEMORY[0x263F56CB8]);
    uint64_t v23 = v31;
    uint64_t v24 = v30;
    sub_23BD20758();

    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v20);
    return __swift_storeEnumTagSinglePayload(v23, 0, 1, v24);
  }
}

uint64_t sub_23BD19B0C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23BD20468();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23BD203E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v30 - v15;
  if (objc_msgSend(a1, sel_hasVideo))
  {
    swift_bridgeObjectRelease();

    uint64_t v17 = sub_23BD20778();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v17);
  }
  else
  {
    uint64_t v33 = a3;
    uint64_t v32 = sub_23BD20778();
    dynamic_cast_existential_1_unconditional(v32);
    uint64_t v30 = v6;
    id v31 = a1;
    id v19 = objc_msgSend(a1, sel_identifiers);
    unint64_t v20 = a2;
    uint64_t v21 = v14;
    uint64_t v22 = v11;
    uint64_t v23 = v10;
    id v24 = v19;
    sub_23BD20498();
    sub_23BD08618((uint64_t)v9, (uint64_t)v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v21, v16, v23);
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    if (v20 >> 62)
    {
      sub_23BD200B8();
      id v25 = v31;
      id v29 = v31;
      swift_bridgeObjectRetain();
      sub_23BD20BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v25 = v31;
      id v26 = v31;
      swift_bridgeObjectRetain();
      sub_23BD20C18();
      sub_23BD200B8();
    }
    swift_bridgeObjectRelease();
    uint64_t v27 = v33;
    uint64_t v28 = v32;
    sub_23BD20758();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    return __swift_storeEnumTagSinglePayload(v27, 0, 1, v28);
  }
}

void GenericMusicItem.init(_:)()
{
  OUTLINED_FUNCTION_18();
  v339 = v1;
  uint64_t v342 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BE8);
  uint64_t v4 = OUTLINED_FUNCTION_5(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v5);
  uint64_t v289 = sub_23BD20058();
  OUTLINED_FUNCTION_0();
  uint64_t v287 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BF0);
  uint64_t v10 = OUTLINED_FUNCTION_5(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v11);
  uint64_t v295 = sub_23BD20068();
  OUTLINED_FUNCTION_0();
  uint64_t v288 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BF8);
  uint64_t v16 = OUTLINED_FUNCTION_5(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v17);
  uint64_t v300 = sub_23BD20078();
  OUTLINED_FUNCTION_0();
  uint64_t v292 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v20);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82A28);
  uint64_t v22 = OUTLINED_FUNCTION_5(v21);
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v23);
  uint64_t v302 = sub_23BD20778();
  OUTLINED_FUNCTION_0();
  uint64_t v294 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v26);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82BC8);
  uint64_t v28 = OUTLINED_FUNCTION_5(v27);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v29);
  uint64_t v297 = sub_23BD20038();
  OUTLINED_FUNCTION_0();
  uint64_t v291 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v32);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C20);
  uint64_t v34 = OUTLINED_FUNCTION_5(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v35);
  uint64_t v301 = sub_23BD204D8();
  OUTLINED_FUNCTION_0();
  uint64_t v293 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v38);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82BD8);
  uint64_t v40 = OUTLINED_FUNCTION_5(v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v41);
  uint64_t v296 = sub_23BD20048();
  OUTLINED_FUNCTION_0();
  uint64_t v290 = v42;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v44);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C60);
  uint64_t v46 = OUTLINED_FUNCTION_5(v45);
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v47);
  uint64_t v305 = sub_23BD20828();
  OUTLINED_FUNCTION_0();
  uint64_t v303 = v48;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v50);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82BC0);
  uint64_t v52 = OUTLINED_FUNCTION_5(v51);
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v53);
  uint64_t v307 = sub_23BD20028();
  OUTLINED_FUNCTION_0();
  v304[1] = v54;
  MEMORY[0x270FA5388](v55);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v56);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C30);
  uint64_t v58 = OUTLINED_FUNCTION_5(v57);
  MEMORY[0x270FA5388](v58);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v59);
  v309[0] = sub_23BD205C8();
  OUTLINED_FUNCTION_0();
  v306[1] = v60;
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v62);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  uint64_t v64 = OUTLINED_FUNCTION_5(v63);
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v65);
  v313[0] = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  v310[1] = v66;
  MEMORY[0x270FA5388](v67);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v68);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82B90);
  uint64_t v70 = OUTLINED_FUNCTION_5(v69);
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v71);
  uint64_t v319 = sub_23BD1FFF8();
  OUTLINED_FUNCTION_0();
  uint64_t v317 = v72;
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v74);
  uint64_t v325 = sub_23BD20468();
  OUTLINED_FUNCTION_0();
  uint64_t v324 = v75;
  MEMORY[0x270FA5388](v76);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v77);
  sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  uint64_t v329 = v79;
  uint64_t v330 = v78;
  MEMORY[0x270FA5388](v78);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v80);
  OUTLINED_FUNCTION_15_0();
  uint64_t v327 = v81;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82BB0);
  uint64_t v83 = OUTLINED_FUNCTION_5(v82);
  MEMORY[0x270FA5388](v83);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v84);
  uint64_t v322 = sub_23BD20018();
  OUTLINED_FUNCTION_0();
  uint64_t v318 = v85;
  MEMORY[0x270FA5388](v86);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v87);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C38);
  uint64_t v89 = OUTLINED_FUNCTION_5(v88);
  MEMORY[0x270FA5388](v89);
  OUTLINED_FUNCTION_24();
  uint64_t v328 = v90;
  MEMORY[0x270FA5388](v91);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v92);
  sub_23BD207B8();
  OUTLINED_FUNCTION_0();
  uint64_t v331 = v94;
  uint64_t v332 = v93;
  MEMORY[0x270FA5388](v93);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v95);
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v96);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0(v97);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C78);
  uint64_t v99 = OUTLINED_FUNCTION_5(v98);
  MEMORY[0x270FA5388](v99);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_0(v100);
  uint64_t v315 = sub_23BD20888();
  OUTLINED_FUNCTION_0();
  uint64_t v312 = v101;
  MEMORY[0x270FA5388](v102);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_17_0(v103);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C58);
  uint64_t v105 = OUTLINED_FUNCTION_5(v104);
  MEMORY[0x270FA5388](v105);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v106);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_9_0(v107);
  v323[0] = sub_23BD20818();
  OUTLINED_FUNCTION_0();
  uint64_t v333 = v108;
  MEMORY[0x270FA5388](v109);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x270FA5388](v110);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0(v111);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82BA0);
  uint64_t v113 = OUTLINED_FUNCTION_5(v112);
  MEMORY[0x270FA5388](v113);
  OUTLINED_FUNCTION_1_4();
  uint64_t v337 = v114;
  uint64_t v336 = sub_23BD20008();
  OUTLINED_FUNCTION_0();
  uint64_t v334 = v115;
  MEMORY[0x270FA5388](v116);
  OUTLINED_FUNCTION_1_0();
  uint64_t v119 = (void *)(v118 - v117);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C48);
  uint64_t v121 = OUTLINED_FUNCTION_5(v120);
  MEMORY[0x270FA5388](v121);
  OUTLINED_FUNCTION_1_0();
  uint64_t v124 = v123 - v122;
  uint64_t v125 = sub_23BD207D8();
  OUTLINED_FUNCTION_0();
  uint64_t v335 = v126;
  MEMORY[0x270FA5388](v127);
  OUTLINED_FUNCTION_50();
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD82A38);
  uint64_t v129 = OUTLINED_FUNCTION_5(v128);
  MEMORY[0x270FA5388](v129);
  OUTLINED_FUNCTION_1_0();
  uint64_t v132 = v131 - v130;
  uint64_t v133 = sub_23BD20788();
  OUTLINED_FUNCTION_0();
  uint64_t v135 = v134;
  MEMORY[0x270FA5388](v136);
  OUTLINED_FUNCTION_1_0();
  uint64_t v139 = v138 - v137;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B88);
  uint64_t v141 = OUTLINED_FUNCTION_5(v140);
  MEMORY[0x270FA5388](v141);
  OUTLINED_FUNCTION_24();
  uint64_t v340 = v142;
  uint64_t v144 = MEMORY[0x270FA5388](v143);
  uint64_t v146 = (char *)v285 - v145;
  MEMORY[0x270FA5388](v144);
  uint64_t v148 = (char *)v285 - v147;
  uint64_t v149 = sub_23BD1FDA8();
  v341 = v148;
  uint64_t v150 = (uint64_t)v148;
  uint64_t v151 = v339;
  v338 = (void *)v149;
  __swift_storeEnumTagSinglePayload(v150, 1, 1, v149);
  self;
  id v152 = (void *)swift_dynamicCastObjCClass();
  if (!v152)
  {
    uint64_t v286 = v135;
    v285[1] = v0;
    id v157 = (id)v336;
    uint64_t v159 = v337;
    v285[0] = v119;
    self;
    uint64_t v119 = v151;
    uint64_t v160 = swift_dynamicCastObjCClass();
    if (v160)
    {
      v161 = (void *)v160;
      id v162 = v119;
      id v163 = objc_msgSend(v161, sel_flattenedGenericObject);
      uint64_t v119 = v341;
      if (v163)
      {
        uint64_t v164 = v163;
        id v165 = objc_msgSend(v163, sel_anyObject);

        uint64_t v158 = v340;
        if (v165)
        {
          GenericMusicItem.init(_:)(v165);

          sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
          sub_23BD1BCC8((uint64_t)v146, (uint64_t)v119);
        }
        else
        {
        }
        goto LABEL_21;
      }

      uint64_t v166 = v342;
      id v157 = v338;
LABEL_43:
      uint64_t v158 = v340;
      goto LABEL_10;
    }
    self;
    uint64_t v169 = OUTLINED_FUNCTION_60();
    if (v169)
    {
      uint64_t v170 = v132;
      sub_23BD0735C(v169);
      uint64_t v171 = OUTLINED_FUNCTION_10(v132, 1, v133);
      uint64_t v166 = v342;
      if (!v167)
      {
        OUTLINED_FUNCTION_18_1(v171, &qword_26AD82B88);
        id v157 = (id)(v286 + 32);
        v176 = *(void (**)(uint64_t, uint64_t, uint64_t))(v286 + 32);
        v176(v139, v170, v133);
        v176((uint64_t)v151, v139, v133);
LABEL_42:
        OUTLINED_FUNCTION_19_1();
        uint64_t v190 = OUTLINED_FUNCTION_23_1();
        v191(v190);
        OUTLINED_FUNCTION_59();
        goto LABEL_43;
      }
      v172 = qword_26AD82A38;
      uint64_t v173 = v132;
      goto LABEL_31;
    }
    self;
    uint64_t v174 = OUTLINED_FUNCTION_60();
    uint64_t v166 = v342;
    if (v174)
    {
      id v157 = (id)v124;
      sub_23BD07390(v174);
      uint64_t v175 = OUTLINED_FUNCTION_10(v124, 1, v125);
      if (!v167)
      {
        OUTLINED_FUNCTION_18_1(v175, &qword_26AD82B88);
        v180 = *(void (**)(uint64_t, uint64_t, uint64_t))(v335 + 32);
        uint64_t v181 = OUTLINED_FUNCTION_24_1((uint64_t)v304);
        v180(v181, v124, v125);
        v180((uint64_t)v119, v132, v125);
        uint64_t v166 = v342;
        goto LABEL_42;
      }
      v172 = (uint64_t *)&unk_26AD82C48;
      uint64_t v173 = v124;
      goto LABEL_31;
    }
    self;
    uint64_t v177 = OUTLINED_FUNCTION_60();
    if (v177)
    {
      sub_23BD073C4(v177);
      id v178 = v157;
      uint64_t v179 = OUTLINED_FUNCTION_10(v159, 1, (uint64_t)v157);
      if (!v167)
      {
        OUTLINED_FUNCTION_18_1(v179, &qword_26AD82B88);
        id v157 = *(id *)(v334 + 32);
        uint64_t v189 = v285[0];
        ((void (*)(void, uint64_t, id))v157)(v285[0], v159, v178);
        ((void (*)(void *, uint64_t, id))v157)(v151, v189, v178);
        goto LABEL_42;
      }
      v172 = (uint64_t *)&unk_26AD82BA0;
      uint64_t v173 = v159;
LABEL_31:
      sub_23BD0773C(v173, v172);
LABEL_32:
      id v157 = v338;
      uint64_t v158 = v340;
      uint64_t v119 = v341;
      goto LABEL_10;
    }
    self;
    uint64_t v182 = OUTLINED_FUNCTION_60();
    v183 = v151;
    if (v182)
    {
      id v184 = (void *)v182;
      id v185 = v119;
      id v186 = objc_msgSend(v184, sel_curatorKind);
      uint64_t v158 = v340;
      uint64_t v119 = v341;
      if (v186 == (id)4)
      {
        uint64_t v203 = OUTLINED_FUNCTION_49();
        sub_23BD07460(v203);

        OUTLINED_FUNCTION_10(v139, 1, v322);
        if (!v167) {
          goto LABEL_51;
        }
        id v204 = (uint64_t *)&unk_26AD82BB0;
      }
      else
      {
        if (v186 == (id)2)
        {
          uint64_t v188 = v321;
          sub_23BD073F8((uint64_t)v184);

          OUTLINED_FUNCTION_10(v188, 1, v323[0]);
          uint64_t v139 = v333;
          if (!v167) {
            goto LABEL_41;
          }
LABEL_56:
          id v204 = &qword_26AD82C58;
LABEL_57:
          uint64_t v205 = v188;
          goto LABEL_67;
        }
        uint64_t v139 = v333;
        if (v186 != (id)1) {
          goto LABEL_48;
        }
        id v187 = objc_msgSend(v184, sel_curatorSubKind);
        if (v187 != (id)3)
        {
          if (v187 == (id)2)
          {
            uint64_t v188 = v316;
            Genre.init(_:)(v184, v316);

            OUTLINED_FUNCTION_10(v188, 1, v332);
            if (!v167)
            {
              sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
              id v157 = *(id *)(v331 + 32);
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              goto LABEL_68;
            }
            id v204 = (uint64_t *)&unk_26AD82C38;
            goto LABEL_57;
          }
          if (v187 == (id)1)
          {
            uint64_t v188 = v314;
            sub_23BD073F8((uint64_t)v184);

            OUTLINED_FUNCTION_10(v188, 1, v323[0]);
            if (!v167)
            {
LABEL_41:
              sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
              id v157 = *(id *)(v139 + 32);
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
LABEL_68:
              OUTLINED_FUNCTION_19_1();
              uint64_t v215 = OUTLINED_FUNCTION_23_1();
              v216(v215);
              __swift_storeEnumTagSinglePayload((uint64_t)v119, 0, 1, (uint64_t)v157);
              uint64_t v166 = v342;
              goto LABEL_10;
            }
            goto LABEL_56;
          }
LABEL_48:

          uint64_t v166 = v342;
LABEL_49:

          id v157 = v338;
          goto LABEL_13;
        }
        uint64_t v220 = OUTLINED_FUNCTION_49();
        sub_23BD0742C(v220);

        OUTLINED_FUNCTION_10(v139, 1, v315);
        if (!v167)
        {
LABEL_51:
          sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
          OUTLINED_FUNCTION_51();
          OUTLINED_FUNCTION_20_1();
          ((void (*)(void))v157)();
          OUTLINED_FUNCTION_20_1();
          ((void (*)(void))v157)();
          goto LABEL_68;
        }
        id v204 = &qword_26AD82C78;
      }
      uint64_t v205 = v139;
LABEL_67:
      sub_23BD0773C(v205, v204);
LABEL_21:
      uint64_t v166 = v342;
LABEL_22:
      id v157 = v338;
      goto LABEL_10;
    }
    self;
    uint64_t v192 = OUTLINED_FUNCTION_30_1();
    uint64_t v158 = v340;
    uint64_t v119 = v341;
    if (v192)
    {
      id v193 = (void *)v192;
      id v194 = v151;
      id v195 = objc_msgSend(v193, sel_identifiers);
      uint64_t v196 = v323[2];
      sub_23BD20448();
      uint64_t v197 = v327;
      sub_23BD08618(v196, v327);

      (*(void (**)(uint64_t, uint64_t))(v324 + 8))(v196, v325);
      self;
      uint64_t v198 = swift_dynamicCastObjCClass();
      uint64_t v200 = v329;
      uint64_t v199 = v330;
      if (v198)
      {
        v201 = (void *)v198;
        v193;
        if (objc_msgSend(v201, sel_curatorSubKind) == (id)2)
        {
          OUTLINED_FUNCTION_5_2();
          v202();
          OUTLINED_FUNCTION_53();
          OUTLINED_FUNCTION_49();
          sub_23BD20798();

LABEL_64:
          (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v197, v199);
          uint64_t v212 = *(void (**)(void))(v331 + 32);
          uint64_t v213 = v328;
          uint64_t v214 = v332;
          OUTLINED_FUNCTION_16_0();
          v212();
          __swift_storeEnumTagSinglePayload(v213, 0, 1, v214);

          OUTLINED_FUNCTION_10(v213, 1, v214);
          id v157 = v326;
          if (!v167)
          {
            sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
            OUTLINED_FUNCTION_16_0();
            v212();
            ((void (*)(void *, id, uint64_t))v212)(v119, v157, v214);
            goto LABEL_68;
          }
          id v204 = (uint64_t *)&unk_26AD82C38;
          uint64_t v205 = v213;
          goto LABEL_67;
        }
      }
      OUTLINED_FUNCTION_5_2();
      v211();
      sub_23BD207A8();
      goto LABEL_64;
    }
    self;
    uint64_t v206 = OUTLINED_FUNCTION_30_1();
    if (v206)
    {
      uint64_t v207 = v320;
      sub_23BD07494(v206);
      uint64_t v208 = OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_10(v208, v209, v319);
      uint64_t v166 = v342;
      if (!v167) {
        goto LABEL_81;
      }
      char v210 = (uint64_t *)&unk_26AD82B90;
      goto LABEL_83;
    }
    self;
    uint64_t v217 = OUTLINED_FUNCTION_30_1();
    uint64_t v166 = v342;
    if (v217)
    {
      uint64_t v207 = v313[1];
      sub_23BD06EBC(v217);
      uint64_t v218 = OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_10(v218, v219, v313[0]);
      if (!v167) {
        goto LABEL_81;
      }
      char v210 = &qword_26AD82C70;
      goto LABEL_83;
    }
    id v157 = v151;
    self;
    uint64_t v221 = OUTLINED_FUNCTION_30_1();
    if (v221)
    {
      uint64_t v207 = v309[1];
      sub_23BD074C8(v221);
      uint64_t v222 = OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_10(v222, v223, v309[0]);
      if (!v167)
      {
LABEL_81:
        sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
        OUTLINED_FUNCTION_51();
        OUTLINED_FUNCTION_16_0();
        ((void (*)(void))v157)();
        OUTLINED_FUNCTION_16_0();
        ((void (*)(void))v157)();
        OUTLINED_FUNCTION_19_1();
        uint64_t v230 = OUTLINED_FUNCTION_23_1();
        v231(v230);
        OUTLINED_FUNCTION_59();
        goto LABEL_10;
      }
      char v210 = &qword_26AD82C30;
LABEL_83:
      sub_23BD0773C(v207, v210);
      goto LABEL_22;
    }
    self;
    if (swift_dynamicCastObjCClass())
    {
      OUTLINED_FUNCTION_52();
      sub_23BD07084(v224);
      uint64_t v225 = OUTLINED_FUNCTION_55();
      uint64_t v227 = OUTLINED_FUNCTION_10(v225, v226, v307);
      if (!v167)
      {
        OUTLINED_FUNCTION_18_1(v227, &qword_26AD82B88);
        OUTLINED_FUNCTION_29_1();
        OUTLINED_FUNCTION_24_1((uint64_t)v323);
        OUTLINED_FUNCTION_2_7();
        ((void (*)(void))v151)();
        OUTLINED_FUNCTION_2_7();
        ((void (*)(void))v151)();
LABEL_102:
        OUTLINED_FUNCTION_19_1();
        uint64_t v254 = OUTLINED_FUNCTION_23_1();
        v255(v254);
        __swift_storeEnumTagSinglePayload((uint64_t)v119, 0, 1, (uint64_t)v157);
        uint64_t v166 = v342;
        goto LABEL_43;
      }
      uint64_t v228 = &qword_26AD82BC0;
      uint64_t v229 = &v327;
    }
    else
    {
      self;
      if (OUTLINED_FUNCTION_30_1())
      {
        OUTLINED_FUNCTION_52();
        sub_23BD074FC(v232);
        uint64_t v233 = OUTLINED_FUNCTION_55();
        uint64_t v235 = OUTLINED_FUNCTION_10(v233, v234, v305);
        if (!v167)
        {
          OUTLINED_FUNCTION_18_1(v235, &qword_26AD82B88);
          OUTLINED_FUNCTION_29_1();
          OUTLINED_FUNCTION_24_1((uint64_t)&v322);
          OUTLINED_FUNCTION_2_7();
          ((void (*)(void))v151)();
          OUTLINED_FUNCTION_2_7();
          ((void (*)(void))v151)();
          goto LABEL_102;
        }
        uint64_t v228 = (uint64_t *)&unk_26AD82C60;
        uint64_t v229 = &v324;
      }
      else
      {
        self;
        uint64_t v236 = OUTLINED_FUNCTION_30_1();
        if (v236)
        {
          v237 = (void *)v236;
          id v157 = v151;
          unsigned int v238 = objc_msgSend(v237, sel_hasVideo);
          unsigned int v239 = objc_msgSend(v237, sel_isArtistUploadedContent);
          if (v238)
          {
            if (v239)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C80);
              uint64_t v240 = swift_allocObject();
              *(_OWORD *)(v240 + 16) = xmmword_23BD217B0;
              __swift_instantiateConcreteTypeFromMangledName(&qword_268A83270);
              id v241 = v157;
              *(void *)(v240 + 32) = sub_23BD200E8();
              uint64_t v343 = v240;
              sub_23BD20A18();
              v242 = (void *)OUTLINED_FUNCTION_38();
              sub_23BD1908C(v242, v243, v244);
              uint64_t v245 = OUTLINED_FUNCTION_37();
              OUTLINED_FUNCTION_10(v245, v246, v296);
              if (!v167)
              {

                OUTLINED_FUNCTION_18_1(v278, &qword_26AD82B88);
                OUTLINED_FUNCTION_29_1();
                OUTLINED_FUNCTION_24_1((uint64_t)v309);
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v157)();
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v157)();
                goto LABEL_102;
              }
              sub_23BD0773C(v298, (uint64_t *)&unk_26AD82BD8);
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C80);
            uint64_t v247 = swift_allocObject();
            *(_OWORD *)(v247 + 16) = xmmword_23BD217C0;
            __swift_instantiateConcreteTypeFromMangledName(&qword_268A83268);
            *(void *)(v247 + 32) = sub_23BD200F8();
            *(void *)(v247 + 40) = sub_23BD20108();
            uint64_t v343 = v247;
            sub_23BD20A18();
            uint64_t v248 = (void *)OUTLINED_FUNCTION_38();
            sub_23BD1941C(v248, v249, v250);

            uint64_t v251 = OUTLINED_FUNCTION_37();
            uint64_t v253 = OUTLINED_FUNCTION_10(v251, v252, v301);
            if (!v167)
            {
              OUTLINED_FUNCTION_18_1(v253, &qword_26AD82B88);
              OUTLINED_FUNCTION_29_1();
              OUTLINED_FUNCTION_24_1((uint64_t)&v312);
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              goto LABEL_102;
            }
            uint64_t v228 = &qword_26AD82C20;
            uint64_t v229 = &v320;
          }
          else
          {
            if (v239)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C80);
              uint64_t v260 = swift_allocObject();
              *(_OWORD *)(v260 + 16) = xmmword_23BD217B0;
              __swift_instantiateConcreteTypeFromMangledName(&qword_268A83260);
              id v261 = v157;
              *(void *)(v260 + 32) = sub_23BD200D8();
              uint64_t v343 = v260;
              sub_23BD20A18();
              v262 = (void *)OUTLINED_FUNCTION_38();
              sub_23BD1977C(v262, v263, v264);
              uint64_t v265 = OUTLINED_FUNCTION_37();
              OUTLINED_FUNCTION_10(v265, v266, v297);
              if (!v167)
              {

                OUTLINED_FUNCTION_18_1(v279, &qword_26AD82B88);
                OUTLINED_FUNCTION_29_1();
                OUTLINED_FUNCTION_24_1((uint64_t)v310);
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v157)();
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v157)();
                goto LABEL_102;
              }
              sub_23BD0773C(v299, (uint64_t *)&unk_26AD82BC8);
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C80);
            uint64_t v267 = swift_allocObject();
            *(_OWORD *)(v267 + 16) = xmmword_23BD217C0;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD82C00);
            *(void *)(v267 + 32) = sub_23BD20118();
            *(void *)(v267 + 40) = sub_23BD20128();
            uint64_t v343 = v267;
            sub_23BD20A18();
            int v268 = (void *)OUTLINED_FUNCTION_38();
            sub_23BD19B0C(v268, v269, v270);

            uint64_t v271 = OUTLINED_FUNCTION_37();
            uint64_t v273 = OUTLINED_FUNCTION_10(v271, v272, v302);
            if (!v167)
            {
              OUTLINED_FUNCTION_18_1(v273, &qword_26AD82B88);
              OUTLINED_FUNCTION_29_1();
              OUTLINED_FUNCTION_24_1((uint64_t)v313);
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v157)();
              goto LABEL_102;
            }
            uint64_t v228 = (uint64_t *)&unk_26AD82A28;
            uint64_t v229 = &v321;
          }
        }
        else
        {
          self;
          if (OUTLINED_FUNCTION_30_1())
          {
            OUTLINED_FUNCTION_52();
            sub_23BD07530(v256);
            uint64_t v257 = OUTLINED_FUNCTION_55();
            uint64_t v259 = OUTLINED_FUNCTION_10(v257, v258, v300);
            if (!v167)
            {
              OUTLINED_FUNCTION_18_1(v259, &qword_26AD82B88);
              OUTLINED_FUNCTION_29_1();
              OUTLINED_FUNCTION_24_1((uint64_t)&v311);
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v151)();
              OUTLINED_FUNCTION_2_7();
              ((void (*)(void))v151)();
              goto LABEL_102;
            }
            uint64_t v228 = &qword_26AD82BF8;
            uint64_t v229 = &v319;
          }
          else
          {
            self;
            if (OUTLINED_FUNCTION_30_1())
            {
              OUTLINED_FUNCTION_52();
              sub_23BD07564(v274);
              uint64_t v275 = OUTLINED_FUNCTION_55();
              uint64_t v277 = OUTLINED_FUNCTION_10(v275, v276, v295);
              if (!v167)
              {
                OUTLINED_FUNCTION_18_1(v277, &qword_26AD82B88);
                OUTLINED_FUNCTION_29_1();
                OUTLINED_FUNCTION_24_1((uint64_t)v306);
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v151)();
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v151)();
                goto LABEL_102;
              }
              uint64_t v228 = &qword_26AD82BF0;
              uint64_t v229 = &v314;
            }
            else
            {
              self;
              uint64_t v280 = OUTLINED_FUNCTION_30_1();
              uint64_t v119 = v341;
              uint64_t v166 = v342;
              if (!v280) {
                goto LABEL_49;
              }
              OUTLINED_FUNCTION_52();
              sub_23BD07598(v281);
              uint64_t v282 = OUTLINED_FUNCTION_55();
              uint64_t v284 = OUTLINED_FUNCTION_10(v282, v283, v289);
              if (!v167)
              {
                OUTLINED_FUNCTION_18_1(v284, &qword_26AD82B88);
                OUTLINED_FUNCTION_29_1();
                OUTLINED_FUNCTION_24_1((uint64_t)&v305);
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v151)();
                OUTLINED_FUNCTION_2_7();
                ((void (*)(void))v151)();
                goto LABEL_102;
              }
              uint64_t v228 = &qword_26AD82BE8;
              uint64_t v229 = &v308;
            }
          }
        }
      }
    }
    sub_23BD0773C(*(v229 - 32), v228);
    uint64_t v166 = v342;
    goto LABEL_32;
  }
  uint64_t v153 = v151;
  uint64_t v154 = v342;
  id v155 = objc_msgSend(v152, sel_innerObject);
  if (v155)
  {
    GenericMusicItem.init(_:)(v155);

    OUTLINED_FUNCTION_18_1(v156, &qword_26AD82B88);
    sub_23BD1BCC8((uint64_t)v146, (uint64_t)v119);
    id v157 = v338;
    uint64_t v158 = v340;
  }
  else
  {

    id v157 = v338;
    uint64_t v158 = v340;
    uint64_t v119 = v341;
  }
  uint64_t v166 = v154;
LABEL_10:
  sub_23BD1BCC8((uint64_t)v119, v158);
  OUTLINED_FUNCTION_10(v158, 1, (uint64_t)v157);
  if (v167)
  {
    uint64_t v119 = (void *)v158;
LABEL_13:
    sub_23BD0773C((uint64_t)v119, &qword_26AD82B88);
    uint64_t v168 = 1;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, id))(*((void *)v157 - 1) + 32))(v166, v158, v157);
  uint64_t v168 = 0;
LABEL_14:
  __swift_storeEnumTagSinglePayload(v166, v168, 1, (uint64_t)v157);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD1BCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BD1BD34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_23BD20BC8();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_23BD200B8();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_23BD20498();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_23BD08618(v1, v0);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_23BD20468();
}

double OUTLINED_FUNCTION_42()
{
  *(void *)(v0 - 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

void OUTLINED_FUNCTION_46()
{
  *(void *)(v1 - 144) = v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_23BD20468();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_23BD08618(v1, v0);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_58()
{
  uint64_t v2 = *(void **)(v0 - 136);
  return v2;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_dynamicCastObjCClass();
}

id OUTLINED_FUNCTION_61(uint64_t a1, const char *a2)
{
  *(void *)(v3 - 136) = v2;
  return [v2 a2];
}

uint64_t MusicCollaborativePlaylist.RemoveCollaboratorRequest.init(collaborator:playlist:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v42 = a1;
  uint64_t v43 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A82FA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BD20838();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v40 - v25;
  id v27 = a2;
  sub_23BD06EBC((uint64_t)v27);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
  {

    uint64_t v28 = &qword_26AD82C70;
    uint64_t v29 = (uint64_t)v17;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v17, v18);
    id v30 = v42;
    sub_23BD075CC((uint64_t)v30);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) != 1)
    {
      uint64_t v35 = *(void (**)(char *, char *))(v9 + 32);
      uint64_t v40 = v7;
      v35(v14, v6);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v41, v14, v7);
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v26, v18);
      uint64_t v34 = v43;
      sub_23BD1FEB8();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v40);
      uint64_t v36 = OUTLINED_FUNCTION_1_9();
      v37(v36);
      uint64_t v33 = 0;
      goto LABEL_7;
    }

    uint64_t v31 = OUTLINED_FUNCTION_1_9();
    v32(v31);
    uint64_t v28 = (uint64_t *)&unk_268A82FA0;
    uint64_t v29 = (uint64_t)v6;
  }
  sub_23BD0773C(v29, v28);
  uint64_t v33 = 1;
  uint64_t v34 = v43;
LABEL_7:
  uint64_t v38 = sub_23BD1FED8();
  return __swift_storeEnumTagSinglePayload(v34, v33, 1, v38);
}

uint64_t MusicCollaborativePlaylist.RemoveCollaboratorRequest.perform()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BD1C398;
  return MEMORY[0x270F4CB00]();
}

uint64_t sub_23BD1C398(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23BD1C4CC, 0, 0);
  }
}

uint64_t sub_23BD1C4CC()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = v0[6];
    sub_23BD20B18();
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    sub_23BD20928();
    v0[4] = v3;
    sub_23BD20B98();
    sub_23BD20928();
    return sub_23BD20BB8();
  }
}

#error "23BD1C668: call analysis failed (funcsize=18)"

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:songs:folder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(v30, v31, v32, v33, v34, v35, v36, v37, v38);
  OUTLINED_FUNCTION_0();
  uint64_t v107 = v39;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_6_2(v41, v98);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C58);
  uint64_t v43 = OUTLINED_FUNCTION_5(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_7_3(v44, v99);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v46 = OUTLINED_FUNCTION_5(v45);
  MEMORY[0x270FA5388](v46);
  uint64_t v48 = OUTLINED_FUNCTION_21_2(v47, v100);
  OUTLINED_FUNCTION_0();
  uint64_t v104 = v49;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_4_5(v51, v101);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_32_1();
  MEMORY[0x270FA5388](v53);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A832E0);
  uint64_t v55 = OUTLINED_FUNCTION_5(v54);
  MEMORY[0x270FA5388](v55);
  uint64_t v56 = OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x270FA5388](v57);
  uint64_t v59 = OUTLINED_FUNCTION_3_5(v58, v102);
  v60(v59);
  OUTLINED_FUNCTION_10(v26, 1, v29);
  if (v84)
  {
    uint64_t v66 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v56 = a26;
    uint64_t v61 = sub_23BD0C15C(0, (unint64_t *)&qword_268A83170);
    OUTLINED_FUNCTION_38_0((void (*)(char *, char *))sub_23BD1CAE8, v62, v63, v61, MEMORY[0x263F8E628], v64, MEMORY[0x263F8E658], v65);
    OUTLINED_FUNCTION_24_0();
    uint64_t v66 = OUTLINED_FUNCTION_26_2();
  }
  v67(v66);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_35(v68, v69, &qword_268A832E0);
  OUTLINED_FUNCTION_10(v27, 1, v48);
  if (v84)
  {
    sub_23BD17248(v27, &qword_268A832E0);
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    v70();
    OUTLINED_FUNCTION_5_2();
    v71();
    OUTLINED_FUNCTION_5_2();
    v72();
    sub_23BD1E54C(v103, v28);
    OUTLINED_FUNCTION_27_2();
    v73();
    uint64_t v74 = OUTLINED_FUNCTION_43_0();
    v75(v74);
  }
  OUTLINED_FUNCTION_25_2();
  if (!v84) {
    sub_23BD20A38();
  }
  OUTLINED_FUNCTION_40_0();
  if (!v84) {
    uint64_t v76 = sub_23BD20A38();
  }
  OUTLINED_FUNCTION_42_0(v76, v77, &qword_26AD82C58);
  uint64_t v78 = sub_23BD20818();
  OUTLINED_FUNCTION_12_1(v78);
  if (v84)
  {
    uint64_t v79 = &qword_26AD82C58;
LABEL_17:
    sub_23BD17248(v56, v79);
    OUTLINED_FUNCTION_34_0();
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v80();
  OUTLINED_FUNCTION_23_2();
  uint64_t v81 = OUTLINED_FUNCTION_11_2();
  v82(v81);
  uint64_t v83 = sub_23BD205B8();
  OUTLINED_FUNCTION_10_2(v83);
  if (v84)
  {
    uint64_t v79 = &qword_26AD82B48;
    goto LABEL_17;
  }
  sub_23BD205A8();
  OUTLINED_FUNCTION_24_0();
  uint64_t v85 = OUTLINED_FUNCTION_24_2();
  v86(v85);
LABEL_18:
  id v87 = objc_allocWithZone(MEMORY[0x263F572E8]);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_45_0();
  id v88 = v108;
  OUTLINED_FUNCTION_1_10((uint64_t)v88, v89, v90, v91, v92, v93, v94, v95, v103, v104, v105, v106, v107);
  OUTLINED_FUNCTION_41_0();
  uint64_t v97 = OUTLINED_FUNCTION_39_0(v96, &qword_268A832E8);
  OUTLINED_FUNCTION_18_2(v97);
  OUTLINED_FUNCTION_17();
}

id sub_23BD1CAE8@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_23BD1D66C(a1, a2);
}

uint64_t sub_23BD1CB00(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v56 = a4;
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v53 = (char *)v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v41 = (char *)v40 - v17;
  uint64_t v18 = sub_23BD20AB8();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v51 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v40[1] = (char *)v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v50 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  uint64_t v52 = v15;
  uint64_t v59 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v30 = (char *)v40 - v29;
  uint64_t v31 = sub_23BD209C8();
  uint64_t v60 = sub_23BD20B68();
  uint64_t v56 = sub_23BD20B78();
  sub_23BD20B48();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v50, v48, v52);
  uint64_t result = sub_23BD209B8();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_23BD20AC8();
      uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v33)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v33)(v23, AssociatedTypeWitness);
      sub_23BD20B58();
      if (!--v31)
      {
        uint64_t v34 = v54;
        uint64_t v35 = (uint64_t)v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v34 = v54;
  uint64_t v35 = (uint64_t)v51;
LABEL_9:
  sub_23BD20AC8();
  if (__swift_getEnumTagSinglePayload(v35, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v36 = (uint64_t)v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v36, v46);
    return v60;
  }
  else
  {
    int v37 = *(char **)(v34 + 32);
    uint64_t v54 = v34 + 32;
    uint64_t v55 = v37;
    uint64_t v38 = (void (**)(char *, uint64_t))(v34 + 8);
    uint64_t v39 = v41;
    uint64_t v36 = (uint64_t)v51;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v55)(v39, v36, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_23BD20B58();
      sub_23BD20AC8();
      if (__swift_getEnumTagSinglePayload(v36, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:songs:parent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(v29, v30, v31, v32, v33, v34, v35, v36, v37);
  OUTLINED_FUNCTION_0();
  uint64_t v106 = v38;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_6_2(v40, v97);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C58);
  uint64_t v42 = OUTLINED_FUNCTION_5(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_7_3(v43, v98);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v45 = OUTLINED_FUNCTION_5(v44);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = OUTLINED_FUNCTION_22_1(v46, v99);
  OUTLINED_FUNCTION_0();
  uint64_t v103 = v48;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_4_5(v50, v100);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  uint64_t v54 = OUTLINED_FUNCTION_5(v53);
  MEMORY[0x270FA5388](v54);
  uint64_t v55 = OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x270FA5388](v56);
  uint64_t v58 = OUTLINED_FUNCTION_3_5(v57, v101);
  v59(v58);
  OUTLINED_FUNCTION_10(v26, 1, v28);
  if (v83)
  {
    uint64_t v65 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v55 = a26;
    uint64_t v60 = sub_23BD0C15C(0, (unint64_t *)&qword_268A83170);
    OUTLINED_FUNCTION_38_0((void (*)(char *, char *))sub_23BD1CAE8, v61, v62, v60, MEMORY[0x263F8E628], v63, MEMORY[0x263F8E658], v64);
    OUTLINED_FUNCTION_24_0();
    uint64_t v65 = OUTLINED_FUNCTION_26_2();
  }
  v66(v65);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_35(v67, v68, &qword_26AD82C70);
  OUTLINED_FUNCTION_10(v27, 1, v47);
  if (v83)
  {
    sub_23BD17248(v27, &qword_26AD82C70);
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    v69();
    OUTLINED_FUNCTION_5_2();
    v70();
    OUTLINED_FUNCTION_5_2();
    v71();
    sub_23BD1E8BC();
    OUTLINED_FUNCTION_27_2();
    v72();
    uint64_t v73 = OUTLINED_FUNCTION_44_0();
    v74(v73);
  }
  OUTLINED_FUNCTION_25_2();
  if (!v83) {
    sub_23BD20A38();
  }
  OUTLINED_FUNCTION_40_0();
  if (!v83) {
    uint64_t v75 = sub_23BD20A38();
  }
  OUTLINED_FUNCTION_42_0(v75, v76, &qword_26AD82C58);
  uint64_t v77 = sub_23BD20818();
  OUTLINED_FUNCTION_12_1(v77);
  if (v83)
  {
    uint64_t v78 = &qword_26AD82C58;
LABEL_17:
    sub_23BD17248(v55, v78);
    OUTLINED_FUNCTION_34_0();
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v79();
  OUTLINED_FUNCTION_23_2();
  uint64_t v80 = OUTLINED_FUNCTION_11_2();
  v81(v80);
  uint64_t v82 = sub_23BD205B8();
  OUTLINED_FUNCTION_10_2(v82);
  if (v83)
  {
    uint64_t v78 = &qword_26AD82B48;
    goto LABEL_17;
  }
  sub_23BD205A8();
  OUTLINED_FUNCTION_24_0();
  uint64_t v84 = OUTLINED_FUNCTION_24_2();
  v85(v84);
LABEL_18:
  id v86 = objc_allocWithZone(MEMORY[0x263F572E8]);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_45_0();
  id v87 = v107;
  OUTLINED_FUNCTION_1_10((uint64_t)v87, v88, v89, v90, v91, v92, v93, v94, v102, v103, v104, v105, v106);
  OUTLINED_FUNCTION_41_0();
  uint64_t v96 = OUTLINED_FUNCTION_39_0(v95, &qword_268A832E8);
  OUTLINED_FUNCTION_18_2(v96);
  OUTLINED_FUNCTION_17();
}

id sub_23BD1D66C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  v7[3] = sub_23BD0C15C(0, &qword_268A83090);
  v7[0] = v3;
  id v4 = objc_allocWithZone(MEMORY[0x263F13E58]);
  id v5 = v3;
  id result = sub_23BD1E2F0(v7);
  *a2 = result;
  return result;
}

#error "23BD1D724: call analysis failed (funcsize=18)"

void sub_23BD1D734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, char, uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_18();
  unsigned int v48 = v26;
  uint64_t v46 = v27;
  uint64_t v47 = v28;
  uint64_t v44 = v29;
  uint64_t v45 = v30;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v43 = a26;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A832E0);
  uint64_t v38 = OUTLINED_FUNCTION_5(v37);
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v43 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_23BD20858();
  __swift_storeEnumTagSinglePayload((uint64_t)v40, 1, 1, v41);
  v43(v36, v34, v32, v44, v45, v46, v47, v48, a21, a22, a23, v40, a24, a25);
  sub_23BD17248((uint64_t)v40, &qword_268A832E0);
  OUTLINED_FUNCTION_17();
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:tracks:folder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(v30, v31, v32, v33, v34, v35, v36, v37, v38);
  OUTLINED_FUNCTION_0();
  uint64_t v105 = v39;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_6_2(v41, v96);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C58);
  uint64_t v43 = OUTLINED_FUNCTION_5(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_7_3(v44, v97);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v46 = OUTLINED_FUNCTION_5(v45);
  MEMORY[0x270FA5388](v46);
  uint64_t v48 = OUTLINED_FUNCTION_21_2(v47, v98);
  OUTLINED_FUNCTION_0();
  uint64_t v102 = v49;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_4_5(v51, v99);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_32_1();
  MEMORY[0x270FA5388](v53);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A832E0);
  uint64_t v55 = OUTLINED_FUNCTION_5(v54);
  MEMORY[0x270FA5388](v55);
  uint64_t v56 = OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x270FA5388](v57);
  uint64_t v59 = OUTLINED_FUNCTION_3_5(v58, v100);
  v60(v59);
  OUTLINED_FUNCTION_10(v26, 1, v29);
  if (v82)
  {
    uint64_t v64 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v56 = a26;
    uint64_t v61 = sub_23BD0C15C(0, (unint64_t *)&qword_268A83170);
    OUTLINED_FUNCTION_37_0((uint64_t)sub_23BD1DCA8, v62, v63, v61);
    OUTLINED_FUNCTION_24_0();
    uint64_t v64 = OUTLINED_FUNCTION_26_2();
  }
  v65(v64);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_35(v66, v67, &qword_268A832E0);
  OUTLINED_FUNCTION_10(v27, 1, v48);
  if (v82)
  {
    sub_23BD17248(v27, &qword_268A832E0);
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    v68();
    OUTLINED_FUNCTION_5_2();
    v69();
    OUTLINED_FUNCTION_5_2();
    v70();
    sub_23BD1E54C(v101, v28);
    OUTLINED_FUNCTION_27_2();
    v71();
    uint64_t v72 = OUTLINED_FUNCTION_43_0();
    v73(v72);
  }
  OUTLINED_FUNCTION_25_2();
  if (!v82) {
    sub_23BD20A38();
  }
  OUTLINED_FUNCTION_40_0();
  if (!v82) {
    uint64_t v74 = sub_23BD20A38();
  }
  OUTLINED_FUNCTION_42_0(v74, v75, &qword_26AD82C58);
  uint64_t v76 = sub_23BD20818();
  OUTLINED_FUNCTION_12_1(v76);
  if (v82)
  {
    uint64_t v77 = &qword_26AD82C58;
LABEL_17:
    sub_23BD17248(v56, v77);
    OUTLINED_FUNCTION_34_0();
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v78();
  OUTLINED_FUNCTION_23_2();
  uint64_t v79 = OUTLINED_FUNCTION_11_2();
  v80(v79);
  uint64_t v81 = sub_23BD205B8();
  OUTLINED_FUNCTION_10_2(v81);
  if (v82)
  {
    uint64_t v77 = &qword_26AD82B48;
    goto LABEL_17;
  }
  sub_23BD205A8();
  OUTLINED_FUNCTION_24_0();
  uint64_t v83 = OUTLINED_FUNCTION_24_2();
  v84(v83);
LABEL_18:
  id v85 = objc_allocWithZone(MEMORY[0x263F572E8]);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_45_0();
  id v86 = v106;
  OUTLINED_FUNCTION_1_10((uint64_t)v86, v87, v88, v89, v90, v91, v92, v93, v101, v102, v103, v104, v105);
  OUTLINED_FUNCTION_41_0();
  uint64_t v95 = OUTLINED_FUNCTION_39_0(v94, &qword_268A832E8);
  OUTLINED_FUNCTION_18_2(v95);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD1DCA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_23BD1E144(a1, a2);
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:tracks:parent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_8(v29, v30, v31, v32, v33, v34, v35, v36, v37);
  OUTLINED_FUNCTION_0();
  uint64_t v104 = v38;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_6_2(v40, v95);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C58);
  uint64_t v42 = OUTLINED_FUNCTION_5(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_7_3(v43, v96);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82B48);
  uint64_t v45 = OUTLINED_FUNCTION_5(v44);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = OUTLINED_FUNCTION_22_1(v46, v97);
  OUTLINED_FUNCTION_0();
  uint64_t v101 = v48;
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_4_5(v50, v98);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  uint64_t v54 = OUTLINED_FUNCTION_5(v53);
  MEMORY[0x270FA5388](v54);
  uint64_t v55 = OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x270FA5388](v56);
  uint64_t v58 = OUTLINED_FUNCTION_3_5(v57, v99);
  v59(v58);
  OUTLINED_FUNCTION_10(v26, 1, v28);
  if (v81)
  {
    uint64_t v63 = OUTLINED_FUNCTION_1_3();
  }
  else
  {
    uint64_t v55 = a26;
    uint64_t v60 = sub_23BD0C15C(0, (unint64_t *)&qword_268A83170);
    OUTLINED_FUNCTION_37_0((uint64_t)sub_23BD1DCA8, v61, v62, v60);
    OUTLINED_FUNCTION_24_0();
    uint64_t v63 = OUTLINED_FUNCTION_26_2();
  }
  v64(v63);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_35(v65, v66, &qword_26AD82C70);
  OUTLINED_FUNCTION_10(v27, 1, v47);
  if (v81)
  {
    sub_23BD17248(v27, &qword_26AD82C70);
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    v67();
    OUTLINED_FUNCTION_5_2();
    v68();
    OUTLINED_FUNCTION_5_2();
    v69();
    sub_23BD1E8BC();
    OUTLINED_FUNCTION_27_2();
    v70();
    uint64_t v71 = OUTLINED_FUNCTION_44_0();
    v72(v71);
  }
  OUTLINED_FUNCTION_25_2();
  if (!v81) {
    sub_23BD20A38();
  }
  OUTLINED_FUNCTION_40_0();
  if (!v81) {
    uint64_t v73 = sub_23BD20A38();
  }
  OUTLINED_FUNCTION_42_0(v73, v74, &qword_26AD82C58);
  uint64_t v75 = sub_23BD20818();
  OUTLINED_FUNCTION_12_1(v75);
  if (v81)
  {
    uint64_t v76 = &qword_26AD82C58;
LABEL_17:
    sub_23BD17248(v55, v76);
    OUTLINED_FUNCTION_34_0();
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v77();
  OUTLINED_FUNCTION_23_2();
  uint64_t v78 = OUTLINED_FUNCTION_11_2();
  v79(v78);
  uint64_t v80 = sub_23BD205B8();
  OUTLINED_FUNCTION_10_2(v80);
  if (v81)
  {
    uint64_t v76 = &qword_26AD82B48;
    goto LABEL_17;
  }
  sub_23BD205A8();
  OUTLINED_FUNCTION_24_0();
  uint64_t v82 = OUTLINED_FUNCTION_24_2();
  v83(v82);
LABEL_18:
  id v84 = objc_allocWithZone(MEMORY[0x263F572E8]);
  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_45_0();
  id v85 = v105;
  OUTLINED_FUNCTION_1_10((uint64_t)v85, v86, v87, v88, v89, v90, v91, v92, v100, v101, v102, v103, v104);
  OUTLINED_FUNCTION_41_0();
  uint64_t v94 = OUTLINED_FUNCTION_39_0(v93, &qword_268A832E8);
  OUTLINED_FUNCTION_18_2(v94);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD1E144@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_23BD207C8();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_30_2();
  uint64_t v9 = sub_23BD20738();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v20 - v14;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))((char *)&v20 - v14, *MEMORY[0x263F13AC0], v9);
  OUTLINED_FUNCTION_5_2();
  v16();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v2, a1, v5);
  sub_23BD1E8BC();
  uint64_t v18 = v17;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v9);
  *a2 = v18;
  return result;
}

id sub_23BD1E2F0(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  id v3 = objc_msgSend(v1, sel_initWithUnderlyingModelObject_, sub_23BD20BF8());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

id sub_23BD1E35C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = v13;
  if (a2)
  {
    sub_23BD0C15C(0, (unint64_t *)&qword_268A83170);
    uint64_t v18 = (void *)sub_23BD209F8();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      uint64_t v19 = (void *)sub_23BD208D8();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  if (a6)
  {
    uint64_t v20 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (a9)
  {
    uint64_t v21 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (a13)
  {
    uint64_t v22 = (void *)sub_23BD208D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v23 = objc_msgSend(v14, sel_initWithParentPlaylist_playlistEntries_playlistName_playlistDescription_playlistUserImage_coverArtworkRecipe_publicPlaylist_visiblePlaylist_authorStoreIdentifier_, a1, v18, v19, v20, a7, v21, a10, a11, v22);

  return v23;
}

void sub_23BD1E4FC()
{
}

void sub_23BD1E524()
{
}

id sub_23BD1E54C(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = sub_23BD203E8();
  uint64_t v22 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23BD20728();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23BD20858();
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v12, a1, v10);
  sub_23BD1EB40(&qword_268A832F0);
  sub_23BD20768();
  sub_23BD20748();
  uint64_t v14 = (void *)sub_23BD0F6A8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23BD1EB40(&qword_268A832F8);
  sub_23BD204C8();
  id v15 = sub_23BD141BC(v14);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v24);
  id v16 = objc_allocWithZone(MEMORY[0x263F13E58]);
  uint64_t v17 = (void *)sub_23BD20898();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v15, v14, v17);
  swift_unknownObjectRelease();

  uint64_t v19 = sub_23BD20738();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(a2, v19);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  return v18;
}

void sub_23BD1E8BC()
{
  OUTLINED_FUNCTION_18();
  v24[2] = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  v24[3] = sub_23BD203E8();
  OUTLINED_FUNCTION_0();
  v24[1] = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_30_2();
  v24[0] = sub_23BD20728();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2(0);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  OUTLINED_FUNCTION_33_1();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v24 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))((char *)v24 - v16, v4, v12);
  sub_23BD20768();
  sub_23BD20748();
  id v18 = (void *)sub_23BD0F6A8();
  (*(void (**)(char *, void))(v8 + 8))(v11, v24[0]);
  sub_23BD204C8();
  id v19 = sub_23BD141BC(v18);
  OUTLINED_FUNCTION_19_0();
  v20();
  id v21 = objc_allocWithZone(MEMORY[0x263F13E58]);
  uint64_t v22 = (void *)sub_23BD20898();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v19, v18, v22);
  swift_unknownObjectRelease();

  sub_23BD20738();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_19_0();
  v23();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v12);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23BD1EB40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23BD20858();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void OUTLINED_FUNCTION_6_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *(void *)(v4 - 224);
  return sub_23BD1679C(v6, v3, a3);
}

uint64_t OUTLINED_FUNCTION_37_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9D938](a1, 0, v5, a4, v4);
}

uint64_t OUTLINED_FUNCTION_38_0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_23BD1CB00(a1, 0, v9, a4, a5, v8, a7, a8);
}

uint64_t OUTLINED_FUNCTION_39_0(uint64_t a1, unint64_t *a2)
{
  return sub_23BD0C15C(0, a2);
}

uint64_t OUTLINED_FUNCTION_42_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23BD1679C(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t static Song.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_hasVideo) ^ 1;
}

BOOL static Curator.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorSubKind) == (id)1;
}

uint64_t MusicCollaborativePlaylist.PendingCollaboratorDecisionRequest.init(collaborator:playlist:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v42 = a1;
  uint64_t v43 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A82FA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BD20838();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v40 - v25;
  id v27 = a2;
  sub_23BD06EBC((uint64_t)v27);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
  {

    uint64_t v28 = &qword_26AD82C70;
    uint64_t v29 = (uint64_t)v17;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v17, v18);
    id v30 = v42;
    sub_23BD075CC((uint64_t)v30);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) != 1)
    {
      uint64_t v35 = *(void (**)(char *, char *))(v9 + 32);
      uint64_t v40 = v7;
      v35(v14, v6);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v41, v14, v7);
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v26, v18);
      uint64_t v34 = v43;
      sub_23BD1FF58();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v40);
      uint64_t v36 = OUTLINED_FUNCTION_1_9();
      v37(v36);
      uint64_t v33 = 0;
      goto LABEL_7;
    }

    uint64_t v31 = OUTLINED_FUNCTION_1_9();
    v32(v31);
    uint64_t v28 = (uint64_t *)&unk_268A82FA0;
    uint64_t v29 = (uint64_t)v6;
  }
  sub_23BD0773C(v29, v28);
  uint64_t v33 = 1;
  uint64_t v34 = v43;
LABEL_7:
  uint64_t v38 = sub_23BD1FF68();
  return __swift_storeEnumTagSinglePayload(v34, v33, 1, v38);
}

uint64_t MusicCollaborativePlaylist.ResetInvitationLinkRequest.init(playlist:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23BD20878();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  id v14 = a1;
  sub_23BD06EBC((uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {

    sub_23BD0797C((uint64_t)v6);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_23BD1FF18();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_23BD1FF28();
  return __swift_storeEnumTagSinglePayload(a2, v15, 1, v16);
}

id static UploadedVideo.canBeConverted(from:)(void *a1)
{
  id result = objc_msgSend(a1, sel_hasVideo);
  if (result) {
    return objc_msgSend(a1, sel_isArtistUploadedContent);
  }
  return result;
}

uint64_t MusicCollaborativePlaylist.JoinRequest.init(playlist:invitationURL:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v5 = sub_23BD1FD88();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD82C70);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23BD20878();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v32 - v21;
  id v23 = a1;
  sub_23BD06EBC((uint64_t)v23);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
  {

    uint64_t v24 = OUTLINED_FUNCTION_1_3();
    v25(v24);
    sub_23BD0797C((uint64_t)v13);
    uint64_t v26 = 1;
    uint64_t v27 = v33;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v22, v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v5);
    uint64_t v27 = v33;
    sub_23BD1FE38();

    uint64_t v28 = OUTLINED_FUNCTION_1_3();
    v29(v28);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v14);
    uint64_t v26 = 0;
  }
  uint64_t v30 = sub_23BD1FE58();
  return __swift_storeEnumTagSinglePayload(v27, v26, 1, v30);
}

uint64_t MusicCollaborativePlaylist.JoinRequest.perform()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23BD1F578;
  return MEMORY[0x270F4CAC0]();
}

uint64_t sub_23BD1F578(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23BD1F6AC, 0, 0);
  }
}

uint64_t sub_23BD1F6AC()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = v0[6];
    sub_23BD20B18();
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    sub_23BD20928();
    v0[4] = v3;
    sub_23BD20B98();
    sub_23BD20928();
    return sub_23BD20BB8();
  }
}

uint64_t sub_23BD1F80C(void *a1)
{
  uint64_t v2 = sub_23BD20578();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  id v11 = objc_msgSend(a1, sel_value);
  sub_23BD208E8();

  sub_23BD204F8();
  id v12 = objc_msgSend(a1, sel_kind);
  uint64_t v13 = (unsigned int *)MEMORY[0x263F138F8];
  switch((unint64_t)v12)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F13908];
      goto LABEL_9;
    case 2uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138D8];
      goto LABEL_9;
    case 3uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138F0];
      goto LABEL_9;
    case 4uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138E0];
      goto LABEL_9;
    case 5uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138D0];
      goto LABEL_9;
    case 6uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138E8];
      goto LABEL_9;
    case 7uLL:
      uint64_t v13 = (unsigned int *)MEMORY[0x263F138C8];
LABEL_9:
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v10, *v13, v2);
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v10, v2);
      sub_23BD20598();

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v10, v2);
    case 8uLL:
      OUTLINED_FUNCTION_2_9();
      uint64_t v15 = 49;
      OUTLINED_FUNCTION_1_11();
      break;
    default:
      OUTLINED_FUNCTION_2_9();
      uint64_t v15 = 51;
      OUTLINED_FUNCTION_1_11();
      OUTLINED_FUNCTION_3_6();
      break;
  }
  sub_23BD20BB8();
  __break(1u);
  JUMPOUT(0x23BD1FA88);
}

id sub_23BD1FAAC()
{
  uint64_t v0 = sub_23BD20578();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BD20588();
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v0);
  uint64_t v7 = 0;
  if (v6 == *MEMORY[0x263F138F8]) {
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F13908])
  {
    uint64_t v7 = 1;
LABEL_16:
    sub_23BD1FCCC();
    uint64_t v8 = sub_23BD205A8();
    return sub_23BD1FD0C(v8, v9, v7);
  }
  if (v6 == *MEMORY[0x263F138D8])
  {
    uint64_t v7 = 2;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F138F0])
  {
    uint64_t v7 = 3;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F138E0])
  {
    uint64_t v7 = 4;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F138D0])
  {
    uint64_t v7 = 5;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F138E8])
  {
    uint64_t v7 = 6;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F138C8])
  {
    uint64_t v7 = 7;
    goto LABEL_16;
  }
  if (v6 == *MEMORY[0x263F13900])
  {
    OUTLINED_FUNCTION_2_9();
    uint64_t v11 = 79;
    OUTLINED_FUNCTION_1_11();
  }
  else
  {
    OUTLINED_FUNCTION_2_9();
    uint64_t v11 = 82;
    OUTLINED_FUNCTION_1_11();
    OUTLINED_FUNCTION_3_6();
  }
  id result = (id)sub_23BD20BB8();
  __break(1u);
  return result;
}

unint64_t sub_23BD1FCCC()
{
  unint64_t result = qword_268A83308;
  if (!qword_268A83308)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A83308);
  }
  return result;
}

id sub_23BD1FD0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_23BD208D8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithValue_kind_, v5, a3);

  return v6;
}

uint64_t sub_23BD1FD88()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23BD1FD98()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23BD1FDA8()
{
  return MEMORY[0x270F4C8B8]();
}

uint64_t sub_23BD1FDB8()
{
  return MEMORY[0x270F4CA10]();
}

uint64_t sub_23BD1FDC8()
{
  return MEMORY[0x270F4CA18]();
}

uint64_t sub_23BD1FDD8()
{
  return MEMORY[0x270F4CA20]();
}

uint64_t sub_23BD1FDE8()
{
  return MEMORY[0x270F4CA28]();
}

uint64_t sub_23BD1FDF8()
{
  return MEMORY[0x270F4CA30]();
}

uint64_t sub_23BD1FE08()
{
  return MEMORY[0x270F4CA38]();
}

uint64_t sub_23BD1FE18()
{
  return MEMORY[0x270F4CA40]();
}

uint64_t sub_23BD1FE28()
{
  return MEMORY[0x270F4CA48]();
}

uint64_t sub_23BD1FE38()
{
  return MEMORY[0x270F4CAB8]();
}

uint64_t sub_23BD1FE58()
{
  return MEMORY[0x270F4CAC8]();
}

uint64_t sub_23BD1FE68()
{
  return MEMORY[0x270F4CAD0]();
}

uint64_t sub_23BD1FE78()
{
  return MEMORY[0x270F4CAD8]();
}

uint64_t sub_23BD1FE88()
{
  return MEMORY[0x270F4CAE0]();
}

uint64_t sub_23BD1FEA8()
{
  return MEMORY[0x270F4CAF0]();
}

uint64_t sub_23BD1FEB8()
{
  return MEMORY[0x270F4CAF8]();
}

uint64_t sub_23BD1FED8()
{
  return MEMORY[0x270F4CB08]();
}

uint64_t sub_23BD1FEE8()
{
  return MEMORY[0x270F4CB10]();
}

uint64_t sub_23BD1FF08()
{
  return MEMORY[0x270F4CB20]();
}

uint64_t sub_23BD1FF18()
{
  return MEMORY[0x270F4CB28]();
}

uint64_t sub_23BD1FF28()
{
  return MEMORY[0x270F4CB30]();
}

uint64_t sub_23BD1FF38()
{
  return MEMORY[0x270F4CB38]();
}

uint64_t sub_23BD1FF48()
{
  return MEMORY[0x270F4CB40]();
}

uint64_t sub_23BD1FF58()
{
  return MEMORY[0x270F4CB48]();
}

uint64_t sub_23BD1FF68()
{
  return MEMORY[0x270F4CB50]();
}

uint64_t sub_23BD1FF88()
{
  return MEMORY[0x270F4CCF0]();
}

uint64_t _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvg_0()
{
  return MEMORY[0x270F4CCF8]();
}

uint64_t _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvs_0()
{
  return MEMORY[0x270F4CD00]();
}

uint64_t sub_23BD1FFB8()
{
  return MEMORY[0x270F4CD08]();
}

uint64_t sub_23BD1FFC8()
{
  return MEMORY[0x270F4CD20]();
}

uint64_t sub_23BD1FFD8()
{
  return MEMORY[0x270F4CD30]();
}

uint64_t sub_23BD1FFE8()
{
  return MEMORY[0x270F4CD48]();
}

uint64_t sub_23BD1FFF8()
{
  return MEMORY[0x270F4CDE0]();
}

uint64_t sub_23BD20008()
{
  return MEMORY[0x270F4D058]();
}

uint64_t sub_23BD20018()
{
  return MEMORY[0x270F4D0B8]();
}

uint64_t sub_23BD20028()
{
  return MEMORY[0x270F4D100]();
}

uint64_t sub_23BD20038()
{
  return MEMORY[0x270F4D140]();
}

uint64_t sub_23BD20048()
{
  return MEMORY[0x270F4D188]();
}

uint64_t sub_23BD20058()
{
  return MEMORY[0x270F4D2C0]();
}

uint64_t sub_23BD20068()
{
  return MEMORY[0x270F4D320]();
}

uint64_t sub_23BD20078()
{
  return MEMORY[0x270F4D378]();
}

uint64_t sub_23BD20088()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23BD20098()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23BD200A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23BD200B8()
{
  return MEMORY[0x270EF6448]();
}

uint64_t sub_23BD200C8()
{
  return MEMORY[0x270EF6458]();
}

uint64_t sub_23BD200D8()
{
  return MEMORY[0x270F4D388]();
}

uint64_t sub_23BD200E8()
{
  return MEMORY[0x270F4D390]();
}

uint64_t sub_23BD200F8()
{
  return MEMORY[0x270EF6460]();
}

uint64_t sub_23BD20108()
{
  return MEMORY[0x270EF6468]();
}

uint64_t sub_23BD20118()
{
  return MEMORY[0x270EF6470]();
}

uint64_t sub_23BD20128()
{
  return MEMORY[0x270EF6478]();
}

uint64_t sub_23BD20138()
{
  return MEMORY[0x270EF6510]();
}

uint64_t sub_23BD20148()
{
  return MEMORY[0x270EF6538]();
}

uint64_t sub_23BD20158()
{
  return MEMORY[0x270EF6540]();
}

uint64_t sub_23BD20168()
{
  return MEMORY[0x270EF6548]();
}

uint64_t sub_23BD20178()
{
  return MEMORY[0x270EF6550]();
}

uint64_t sub_23BD20188()
{
  return MEMORY[0x270EF6558]();
}

uint64_t sub_23BD20198()
{
  return MEMORY[0x270EF6560]();
}

uint64_t sub_23BD201A8()
{
  return MEMORY[0x270EF6568]();
}

uint64_t sub_23BD201B8()
{
  return MEMORY[0x270EF6578]();
}

uint64_t sub_23BD201C8()
{
  return MEMORY[0x270EF6580]();
}

uint64_t sub_23BD201D8()
{
  return MEMORY[0x270EF6588]();
}

uint64_t sub_23BD201E8()
{
  return MEMORY[0x270EF6590]();
}

uint64_t sub_23BD201F8()
{
  return MEMORY[0x270EF6598]();
}

uint64_t sub_23BD20208()
{
  return MEMORY[0x270EF65A0]();
}

uint64_t sub_23BD20218()
{
  return MEMORY[0x270EF65A8]();
}

uint64_t sub_23BD20228()
{
  return MEMORY[0x270EF65B0]();
}

uint64_t sub_23BD20238()
{
  return MEMORY[0x270EF65B8]();
}

uint64_t sub_23BD20258()
{
  return MEMORY[0x270EF65C8]();
}

uint64_t sub_23BD20268()
{
  return MEMORY[0x270EF65D0]();
}

uint64_t sub_23BD20278()
{
  return MEMORY[0x270EF65D8]();
}

uint64_t sub_23BD20288()
{
  return MEMORY[0x270EF65E0]();
}

uint64_t sub_23BD20298()
{
  return MEMORY[0x270EF65E8]();
}

uint64_t sub_23BD202A8()
{
  return MEMORY[0x270EF65F0]();
}

uint64_t sub_23BD202B8()
{
  return MEMORY[0x270EF65F8]();
}

uint64_t sub_23BD202C8()
{
  return MEMORY[0x270EF6600]();
}

uint64_t sub_23BD202D8()
{
  return MEMORY[0x270EF6608]();
}

uint64_t sub_23BD202E8()
{
  return MEMORY[0x270EF6610]();
}

uint64_t sub_23BD202F8()
{
  return MEMORY[0x270EF6618]();
}

uint64_t sub_23BD20308()
{
  return MEMORY[0x270EF6620]();
}

uint64_t sub_23BD20318()
{
  return MEMORY[0x270EF6628]();
}

uint64_t sub_23BD20328()
{
  return MEMORY[0x270EF6630]();
}

uint64_t sub_23BD20338()
{
  return MEMORY[0x270EF6638]();
}

uint64_t sub_23BD20348()
{
  return MEMORY[0x270EF6640]();
}

uint64_t sub_23BD20358()
{
  return MEMORY[0x270EF6648]();
}

uint64_t sub_23BD20368()
{
  return MEMORY[0x270EF6650]();
}

uint64_t sub_23BD20378()
{
  return MEMORY[0x270EF6658]();
}

uint64_t sub_23BD20388()
{
  return MEMORY[0x270EF6660]();
}

uint64_t sub_23BD20398()
{
  return MEMORY[0x270EF6668]();
}

uint64_t sub_23BD203A8()
{
  return MEMORY[0x270EF6670]();
}

uint64_t sub_23BD203B8()
{
  return MEMORY[0x270EF6678]();
}

uint64_t sub_23BD203C8()
{
  return MEMORY[0x270EF6680]();
}

uint64_t sub_23BD203D8()
{
  return MEMORY[0x270EF6688]();
}

uint64_t sub_23BD203E8()
{
  return MEMORY[0x270EF6690]();
}

uint64_t sub_23BD203F8()
{
  return MEMORY[0x270EF66A0]();
}

uint64_t sub_23BD20408()
{
  return MEMORY[0x270EF66B0]();
}

uint64_t sub_23BD20418()
{
  return MEMORY[0x270EF66B8]();
}

uint64_t sub_23BD20428()
{
  return MEMORY[0x270EF66C0]();
}

uint64_t sub_23BD20438()
{
  return MEMORY[0x270EF66D0]();
}

uint64_t sub_23BD20448()
{
  return MEMORY[0x270EF66D8]();
}

uint64_t sub_23BD20458()
{
  return MEMORY[0x270EF66E8]();
}

uint64_t sub_23BD20468()
{
  return MEMORY[0x270EF66F0]();
}

uint64_t sub_23BD20478()
{
  return MEMORY[0x270EF66F8]();
}

uint64_t sub_23BD20488()
{
  return MEMORY[0x270EF6740]();
}

uint64_t sub_23BD20498()
{
  return MEMORY[0x270EF6830]();
}

uint64_t sub_23BD204A8()
{
  return MEMORY[0x270EF6848]();
}

uint64_t sub_23BD204B8()
{
  return MEMORY[0x270EF6850]();
}

uint64_t sub_23BD204C8()
{
  return MEMORY[0x270EF68C0]();
}

uint64_t sub_23BD204D8()
{
  return MEMORY[0x270EF6918]();
}

uint64_t sub_23BD204E8()
{
  return MEMORY[0x270EF6928]();
}

uint64_t sub_23BD204F8()
{
  return MEMORY[0x270EF6938]();
}

uint64_t sub_23BD20508()
{
  return MEMORY[0x270EF6940]();
}

uint64_t sub_23BD20518()
{
  return MEMORY[0x270EF6948]();
}

uint64_t sub_23BD20528()
{
  return MEMORY[0x270EF6950]();
}

uint64_t sub_23BD20538()
{
  return MEMORY[0x270EF6958]();
}

uint64_t sub_23BD20548()
{
  return MEMORY[0x270EF6960]();
}

uint64_t sub_23BD20558()
{
  return MEMORY[0x270EF6970]();
}

uint64_t sub_23BD20568()
{
  return MEMORY[0x270EF6978]();
}

uint64_t sub_23BD20578()
{
  return MEMORY[0x270EF6980]();
}

uint64_t sub_23BD20588()
{
  return MEMORY[0x270EF6988]();
}

uint64_t sub_23BD20598()
{
  return MEMORY[0x270EF6990]();
}

uint64_t sub_23BD205A8()
{
  return MEMORY[0x270EF6998]();
}

uint64_t sub_23BD205B8()
{
  return MEMORY[0x270EF69A0]();
}

uint64_t sub_23BD205C8()
{
  return MEMORY[0x270EF69D0]();
}

uint64_t sub_23BD205D8()
{
  return MEMORY[0x270EF69F8]();
}

uint64_t sub_23BD205E8()
{
  return MEMORY[0x270EF6A00]();
}

uint64_t sub_23BD205F8()
{
  return MEMORY[0x270EF6A08]();
}

uint64_t sub_23BD20608()
{
  return MEMORY[0x270EF6A10]();
}

uint64_t sub_23BD20618()
{
  return MEMORY[0x270EF6A18]();
}

uint64_t sub_23BD20628()
{
  return MEMORY[0x270EF6A20]();
}

uint64_t sub_23BD20638()
{
  return MEMORY[0x270EF6A28]();
}

uint64_t sub_23BD20648()
{
  return MEMORY[0x270EF6A30]();
}

uint64_t sub_23BD20658()
{
  return MEMORY[0x270EF6A38]();
}

uint64_t sub_23BD20668()
{
  return MEMORY[0x270EF6A40]();
}

uint64_t sub_23BD20678()
{
  return MEMORY[0x270EF6A48]();
}

uint64_t sub_23BD20688()
{
  return MEMORY[0x270EF6A50]();
}

uint64_t sub_23BD20698()
{
  return MEMORY[0x270EF6A58]();
}

uint64_t sub_23BD206A8()
{
  return MEMORY[0x270EF6A60]();
}

uint64_t sub_23BD206B8()
{
  return MEMORY[0x270EF6A68]();
}

uint64_t sub_23BD206C8()
{
  return MEMORY[0x270EF6A70]();
}

uint64_t sub_23BD206D8()
{
  return MEMORY[0x270EF6A78]();
}

uint64_t sub_23BD206E8()
{
  return MEMORY[0x270EF6A80]();
}

uint64_t sub_23BD206F8()
{
  return MEMORY[0x270EF6A88]();
}

uint64_t sub_23BD20708()
{
  return MEMORY[0x270EF6A90]();
}

uint64_t sub_23BD20718()
{
  return MEMORY[0x270EF6A98]();
}

uint64_t sub_23BD20728()
{
  return MEMORY[0x270EF6B80]();
}

uint64_t sub_23BD20738()
{
  return MEMORY[0x270EF6B88]();
}

uint64_t sub_23BD20748()
{
  return MEMORY[0x270EF6B90]();
}

uint64_t sub_23BD20758()
{
  return MEMORY[0x270EF6B98]();
}

uint64_t sub_23BD20768()
{
  return MEMORY[0x270EF6BA0]();
}

uint64_t sub_23BD20778()
{
  return MEMORY[0x270EF6C58]();
}

uint64_t sub_23BD20788()
{
  return MEMORY[0x270EF6CF8]();
}

uint64_t sub_23BD20798()
{
  return MEMORY[0x270EF6D00]();
}

uint64_t sub_23BD207A8()
{
  return MEMORY[0x270EF6D08]();
}

uint64_t sub_23BD207B8()
{
  return MEMORY[0x270EF6D28]();
}

uint64_t sub_23BD207C8()
{
  return MEMORY[0x270EF6D78]();
}

uint64_t sub_23BD207D8()
{
  return MEMORY[0x270EF6DF8]();
}

uint64_t sub_23BD207E8()
{
  return MEMORY[0x270EF6E28]();
}

uint64_t sub_23BD207F8()
{
  return MEMORY[0x270EF6E30]();
}

uint64_t sub_23BD20808()
{
  return MEMORY[0x270EF6E80]();
}

uint64_t sub_23BD20818()
{
  return MEMORY[0x270EF6ED0]();
}

uint64_t sub_23BD20828()
{
  return MEMORY[0x270EF6F18]();
}

uint64_t sub_23BD20838()
{
  return MEMORY[0x270F4D748]();
}

uint64_t sub_23BD20848()
{
  return MEMORY[0x270F4D758]();
}

uint64_t sub_23BD20858()
{
  return MEMORY[0x270F4D7B8]();
}

uint64_t sub_23BD20868()
{
  return MEMORY[0x270EF6FD0]();
}

uint64_t sub_23BD20878()
{
  return MEMORY[0x270EF6FF8]();
}

uint64_t sub_23BD20888()
{
  return MEMORY[0x270EF7030]();
}

uint64_t sub_23BD20898()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23BD208A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23BD208B8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23BD208C8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23BD208D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23BD208E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23BD208F8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23BD20908()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_23BD20918()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23BD20928()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23BD20938()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23BD20948()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_23BD20958()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23BD20978()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_23BD20988()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23BD20998()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23BD209B8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_23BD209C8()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_23BD209D8()
{
  return MEMORY[0x270F9D918]();
}

uint64_t sub_23BD209F8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23BD20A08()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23BD20A18()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23BD20A28()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_23BD20A38()
{
  return MEMORY[0x270F4D800]();
}

uint64_t sub_23BD20A48()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23BD20A58()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_23BD20A68()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_23BD20A78()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_23BD20A88()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23BD20A98()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23BD20AA8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23BD20AB8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23BD20AC8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_23BD20AD8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23BD20AE8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23BD20AF8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23BD20B08()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23BD20B18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23BD20B28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23BD20B38()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23BD20B48()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_23BD20B58()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_23BD20B68()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_23BD20B78()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_23BD20B88()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_23BD20B98()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23BD20BA8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23BD20BB8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23BD20BC8()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_23BD20BD8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23BD20BE8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23BD20BF8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23BD20C08()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23BD20C18()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_23BD20C28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23BD20C38()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23BD20C48()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23BD20C58()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23BD20C68()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23BD20C78()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23BD20C88()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23BD20C98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23BD20CA8()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}