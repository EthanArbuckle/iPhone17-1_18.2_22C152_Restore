uint64_t initializeBufferWithCopyOfBuffer for AppUtil(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t initializeWithCopy for AppUtil(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AppUtil(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *result = *a2;
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppUtil(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppUtil(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for AppUtil(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppUtil()
{
  return &type metadata for AppUtil;
}

uint64_t sub_2250B5594(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F01878]);
  uint64_t result = (uint64_t)sub_2250B5C04(a1, a2, 0);
  if (result)
  {

    return 1;
  }
  return result;
}

uint64_t sub_2250B5610()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  if (sub_2250B5594(0xD00000000000001BLL, 0x80000002251086A0)) {
    return 0xD00000000000001BLL;
  }
  else {
    return 0x6C7070612E6D6F63;
  }
}

id sub_2250B568C(uint64_t a1, uint64_t a2)
{
  v29[1] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C06B8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v9 = (char *)v29 - v8;
  uint64_t v10 = sub_225105EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_2250B5E98(v14);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (!v16)
  {
    id v17 = v14;
    sub_225105EB0();
    uint64_t v18 = sub_225105EA0();
    v29[0] = v14;
    v19 = v7;
    uint64_t v20 = a2;
    uint64_t v22 = v21;
    (*(void (**)(void *, uint64_t))(v12 + 8))(v2, v10);
    uint64_t v23 = v22;
    a2 = v20;
    uint64_t v7 = v19;
    id v14 = (id)v29[0];
    sub_2250B5F30(v18, v23, v17, (SEL *)&selRef_setAceId_);
  }
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  if (sub_2250B5594(0xD00000000000001BLL, 0x80000002251086A0))
  {
    if (a2)
    {
      OUTLINED_FUNCTION_1(0xD000000000000012);
      sub_225105E20();
      swift_bridgeObjectRelease();
      uint64_t v24 = sub_225105E30();
      v25 = 0;
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v24) != 1)
      {
        v25 = v9;
        sub_225105E00();
        OUTLINED_FUNCTION_4();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v24);
      }
LABEL_14:
      objc_msgSend(v14, sel_setPunchOutUri_, v25);

      return v14;
    }
    sub_2250B5F30(0xD00000000000001BLL, 0x80000002251086A0, v14, (SEL *)&selRef_setBundleId_);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    if (sub_2250B5594(0xD000000000000015, 0x8000000225108640))
    {
      if (a2) {
        OUTLINED_FUNCTION_1(0xD00000000000001FLL);
      }
      sub_225105E20();
      swift_bridgeObjectRelease();
      uint64_t v27 = sub_225105E30();
      v25 = 0;
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v27) != 1)
      {
        v25 = (void *)sub_225105E00();
        (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v7, v27);
      }
      goto LABEL_14;
    }

    return 0;
  }
  return v14;
}

id sub_2250B59E8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C06B8);
  MEMORY[0x270FA5388](v1 - 8);
  long long v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225105EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_2250B5E98(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (!v10)
  {
    id v11 = v8;
    sub_225105EB0();
    uint64_t v12 = sub_225105EA0();
    uint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
    sub_2250B5F30(v12, v14, v11, (SEL *)&selRef_setAceId_);
  }
  sub_225105E20();
  uint64_t v15 = sub_225105E30();
  uint64_t v16 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v15) != 1)
  {
    uint64_t v16 = v3;
    sub_225105E00();
    OUTLINED_FUNCTION_4();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v15);
  }
  objc_msgSend(v8, sel_setPunchOutUri_, v16);

  return v8;
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

id sub_2250B5C04(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_225105DF0();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2250B5CE0()
{
  return sub_2250B627C(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_2250B5D18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2250B6244();
  *a1 = result;
  return result;
}

uint64_t sub_2250B5D40()
{
  return sub_2250D11B8();
}

uint64_t sub_2250B5D4C()
{
  return sub_2250B627C(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_2250B5D7C()
{
  return sub_2250D1240();
}

uint64_t sub_2250B5D84()
{
  return sub_2250B60D8();
}

uint64_t sub_2250B5D8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2251071A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2250B5DD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2250C85E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2250B5E00(uint64_t a1)
{
  uint64_t v2 = sub_2250B62BC(&qword_2680C0740);
  uint64_t v3 = sub_2250B62BC(&qword_2680C0748);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2250B5E98(void *a1)
{
  id v2 = objc_msgSend(a1, sel_aceId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2251071E0();

  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_2250B5F30(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_2251071A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for INPersonHandleLabel()
{
  if (!qword_2680C0720)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2680C0720);
    }
  }
}

ValueMetadata *type metadata accessor for InstalledAppsProvider()
{
  return &type metadata for InstalledAppsProvider;
}

uint64_t sub_2250B603C()
{
  return sub_2250B62BC(&qword_2680C0728);
}

uint64_t sub_2250B6070()
{
  return sub_2250B62BC(&qword_2680C0730);
}

uint64_t sub_2250B60A4()
{
  return sub_2250B62BC(&qword_2680C0738);
}

uint64_t sub_2250B60D8()
{
  sub_2251071E0();
  sub_225107850();
  sub_225107240();
  uint64_t v0 = sub_225107880();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2250B614C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2251071C0();
  *a2 = 0;
  return result;
}

uint64_t sub_2250B61C4(uint64_t a1, id *a2)
{
  char v3 = sub_2251071D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2250B6244()
{
  sub_2251071E0();
  uint64_t v0 = sub_2251071A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2250B627C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_2251071E0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2250B62BC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for INPersonHandleLabel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 88) = (v1 - 32) | 0x8000000000000000;
  return sub_225107280();
}

uint64_t sub_2250B6370()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB8);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = sub_225105DE0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_225105F00();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v11);
  sub_2250F4C60(v0, v1);
  uint64_t v12 = self;
  uint64_t v13 = (void *)sub_225105D80();
  id v14 = objc_msgSend(v12, sel_localizedStringFromPersonNameComponents_style_options_, v13, 2, 0);

  uint64_t v15 = sub_2251071E0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  return v15;
}

uint64_t sub_2250B64C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AC0);
  uint64_t v7 = OUTLINED_FUNCTION_9(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_225106F10();
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB8);
  uint64_t v18 = OUTLINED_FUNCTION_9(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_2();
  uint64_t v28 = v27 - v26;
  sub_2250B6B80(a1, v21);
  if (__swift_getEnumTagSinglePayload(v21, 1, v22) == 1)
  {
    v29 = &qword_2680C0AB8;
    uint64_t v30 = v21;
LABEL_5:
    sub_2250B6BE8(v30, v29);
    sub_225105DD0();
    sub_2250B677C((SEL *)&selRef_pronunciationGivenName, (SEL *)&selRef_phoneticGivenName);
    sub_225105D10();
    sub_2250B677C((SEL *)&selRef_pronunciationFamilyName, (SEL *)&selRef_phoneticFamilyName);
    sub_225105D30();
    sub_2250B686C();
    sub_225105D50();
    uint64_t v33 = sub_225105DE0();
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v33);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v28, v21, v22);
  static PhonemeDataParser.parse(from:)(v3, v10);
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    uint64_t v31 = OUTLINED_FUNCTION_7();
    v32(v31);
    v29 = &qword_2680C0AC0;
    uint64_t v30 = v10;
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v16, v10, v11);
  sub_225106EF0();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v16, v11);
  uint64_t v35 = OUTLINED_FUNCTION_7();
  return v36(v35);
}

uint64_t sub_2250B677C(SEL *a1, SEL *a2)
{
  uint64_t v5 = sub_2250B6C44(v2, a1);
  char v7 = sub_2250F4AEC(v5, v6);
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    return sub_2250B6C44(v2, a1);
  }
  id v8 = [v2 *a2];
  uint64_t v9 = sub_2251071E0();
  unint64_t v11 = v10;

  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v12) {
    return 0;
  }
  id v13 = [v2 *a2];
  uint64_t v14 = sub_2251071E0();

  return v14;
}

uint64_t sub_2250B686C()
{
  id v1 = objc_msgSend(v0, sel_phoneticMiddleName);
  uint64_t v2 = sub_2251071E0();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  id v6 = objc_msgSend(v0, sel_phoneticMiddleName);
  uint64_t v7 = sub_2251071E0();

  return v7;
}

uint64_t sub_2250B691C()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_0();
  sub_225106D50();
  swift_allocObject();
  sub_225106D40();
  id v4 = objc_msgSend(v0, sel_organizationName);
  sub_2251071E0();

  OUTLINED_FUNCTION_5();
  sub_225106F50();
  OUTLINED_FUNCTION_3_0();
  sub_225106C70();
  swift_release();
  OUTLINED_FUNCTION_6();
  id v5 = objc_msgSend(v0, sel_nickname);
  sub_2251071E0();

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8();
  sub_225106CB0();
  swift_release();
  OUTLINED_FUNCTION_6();
  id v6 = objc_msgSend(v1, sel_givenName);
  sub_2251071E0();

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  sub_225106CC0();
  swift_release();
  OUTLINED_FUNCTION_6();
  id v7 = objc_msgSend(v1, sel_middleName);
  sub_2251071E0();

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8();
  sub_225106CE0();
  swift_release();
  OUTLINED_FUNCTION_6();
  id v8 = objc_msgSend(v1, sel_familyName);
  sub_2251071E0();

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  sub_225106CD0();
  swift_release();
  OUTLINED_FUNCTION_6();
  sub_225106D10();
  swift_release();
  uint64_t v9 = sub_225106D30();
  swift_release();
  return v9;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2250B6B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2250B6BE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2250B6C44(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_2251071E0();

  return v4;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_225106F20();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_225106F20();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_2250B6BE8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return a1 - 8;
}

uint64_t CNLabeledValue<>.buildMapsURL(contact:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_225105C90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = self;
  id v11 = objc_msgSend(v3, sel_value);
  id v12 = objc_msgSend(v10, sel_singleLineStringFromPostalAddress_addCountryName_, v11, 0);

  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v13 = sub_2251071E0();
  uint64_t v15 = v14;

  v45[0] = v13;
  v45[1] = v15;
  sub_225105C40();
  sub_2250B71D8();
  uint64_t v16 = MEMORY[0x263F8D310];
  uint64_t v17 = sub_225107470();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AD0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_22510B830;
    *(void *)(v20 + 56) = v16;
    unint64_t v21 = sub_2250B7224();
    *(void *)(v20 + 64) = v21;
    *(void *)(v20 + 32) = v17;
    *(void *)(v20 + 40) = v19;
    unsigned int v22 = objc_msgSend(a1, sel_iOSLegacyIdentifier);
    uint64_t v23 = MEMORY[0x263F8E548];
    uint64_t v24 = MEMORY[0x263F8E5B0];
    *(void *)(v20 + 96) = MEMORY[0x263F8E548];
    *(void *)(v20 + 104) = v24;
    *(_DWORD *)(v20 + 72) = v22;
    unsigned int v25 = objc_msgSend(v3, sel_iOSLegacyIdentifier);
    *(void *)(v20 + 136) = v23;
    *(void *)(v20 + 144) = v24;
    *(_DWORD *)(v20 + 112) = v25;
    id v26 = objc_msgSend(a1, sel_identifier);
    uint64_t v27 = sub_2251071E0();
    uint64_t v29 = v28;

    *(void *)(v20 + 176) = v16;
    *(void *)(v20 + 184) = v21;
    *(void *)(v20 + 152) = v27;
    *(void *)(v20 + 160) = v29;
    id v30 = objc_msgSend(v3, sel_identifier);
    uint64_t v31 = sub_2251071E0();
    uint64_t v33 = v32;

    *(void *)(v20 + 216) = v16;
    *(void *)(v20 + 224) = v21;
    *(void *)(v20 + 192) = v31;
    *(void *)(v20 + 200) = v33;
    uint64_t v34 = sub_2251071B0();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_2251070F0();
    __swift_project_value_buffer(v37, (uint64_t)qword_2680C5BC0);
    swift_bridgeObjectRetain_n();
    v38 = sub_2251070D0();
    os_log_type_t v39 = sub_225107380();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v45[0] = v41;
      *(_DWORD *)v40 = 136315138;
      swift_bridgeObjectRetain();
      v44[1] = sub_2250B72A8(v34, v36, v45);
      sub_225107420();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2250AF000, v38, v39, "Building Maps punchout URL from string: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v41, -1, -1);
      MEMORY[0x22A62D170](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_225105E20();
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    uint64_t v42 = sub_225105E30();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v42);
  }
}

unint64_t sub_2250B71D8()
{
  unint64_t result = qword_2680C0AC8;
  if (!qword_2680C0AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0AC8);
  }
  return result;
}

unint64_t sub_2250B7224()
{
  unint64_t result = qword_2680C0AD8;
  if (!qword_2680C0AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0AD8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2250B72A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2250B737C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2250B7A60((uint64_t)v12, *a3);
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
      sub_2250B7A60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2250B737C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2250B74D4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_225107430();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2250B75AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_225107560();
    if (!v8)
    {
      uint64_t result = sub_2251075F0();
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

void *sub_2250B74D4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_225107650();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2250B75AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2250B7644(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2250B7820(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2250B7820((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2250B7644(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_225107290();
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
  unint64_t v3 = sub_2250B77B8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_225107510();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_225107650();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2251075F0();
  __break(1u);
  return result;
}

void *sub_2250B77B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2250B7820(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2250B79D0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2250B78F8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2250B78F8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_225107650();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2250B79D0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_225107650();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2250B7A60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2250B7AC0()
{
  return sub_2250B7AF4();
}

uint64_t sub_2250B7AF4()
{
  uint64_t v1 = (void *)(v0 + qword_2680C0B38);
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = (void *)(v0 + qword_2680C0B40);
  *uint64_t v2 = 0;
  v2[1] = 0;
  uint64_t v3 = (void *)(v0 + qword_2680C0B48);
  *uint64_t v3 = 0;
  v3[1] = 0;
  *(unsigned char *)(v0 + qword_2680C0B50) = 2;
  unint64_t v4 = (void *)(v0 + qword_2680C0B58);
  *unint64_t v4 = 0;
  v4[1] = 0;
  char v5 = (void *)(v0 + qword_2680C0B60);
  *char v5 = 0;
  v5[1] = 0;
  return sub_225106D40();
}

uint64_t sub_2250B7B58(uint64_t a1, uint64_t a2)
{
  return sub_2250B7B94(a1, a2, &qword_2680C0B38);
}

uint64_t sub_2250B7B64(uint64_t a1, uint64_t a2)
{
  return sub_2250B7B94(a1, a2, &qword_2680C0B40);
}

uint64_t sub_2250B7B70(uint64_t a1, uint64_t a2)
{
  return sub_2250B7B94(a1, a2, &qword_2680C0B48);
}

uint64_t sub_2250B7B7C(uint64_t a1, uint64_t a2)
{
  return sub_2250B7B94(a1, a2, &qword_2680C0B58);
}

uint64_t sub_2250B7B88(uint64_t a1, uint64_t a2)
{
  return sub_2250B7B94(a1, a2, &qword_2680C0B60);
}

uint64_t sub_2250B7B94(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = (void *)(v3 + *a3);
  *unint64_t v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t sub_2250B7BE4()
{
  type metadata accessor for ContactDialogPerson(0);
  swift_allocObject();
  uint64_t v0 = swift_retain();
  return sub_2250B7FD4(v0);
}

uint64_t sub_2250B7C28()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B7C8C()
{
  uint64_t v0 = sub_225106D60();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  return v0;
}

uint64_t sub_2250B7CF8()
{
  uint64_t v0 = sub_2250B7C8C();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

unint64_t sub_2250B7D28()
{
  return 0xD000000000000014;
}

uint64_t sub_2250B7D44()
{
  sub_225106DE0();
  sub_2250BABB8();
  uint64_t v64 = sub_2251070A0();
  if (OUTLINED_FUNCTION_25(qword_2680C0B10)) {
    OUTLINED_FUNCTION_9_0();
  }
  else {
    OUTLINED_FUNCTION_20();
  }
  uint64_t v1 = swift_bridgeObjectRetain();
  int64_t v9 = OUTLINED_FUNCTION_19(v1, v2, v3, v4, v5, v6, v7, v8, v58);
  sub_2250B7F48((uint64_t)v9, 0x6174614477656976, 0xEE00343665736142);
  if (OUTLINED_FUNCTION_25(qword_2680C0B08)) {
    OUTLINED_FUNCTION_9_0();
  }
  else {
    OUTLINED_FUNCTION_20();
  }
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v18 = OUTLINED_FUNCTION_19(v10, v11, v12, v13, v14, v15, v16, v17, v59);
  sub_2250B7F48((uint64_t)v18, 0x63417463656C6573, 0xEC0000006E6F6974);
  if (OUTLINED_FUNCTION_25(qword_2680C0B00)) {
    OUTLINED_FUNCTION_9_0();
  }
  else {
    OUTLINED_FUNCTION_20();
  }
  uint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v27 = OUTLINED_FUNCTION_19(v19, v20, v21, v22, v23, v24, v25, v26, v60);
  uint64_t v28 = sub_2250B7F48((uint64_t)v27, 0x636E657265666E69, 0xEF656372756F5365);
  int v35 = *(unsigned __int8 *)(v0 + qword_2680C0AF8);
  if (v35 == 2) {
    OUTLINED_FUNCTION_20();
  }
  else {
    LOBYTE(v61) = v35 & 1;
  }
  unint64_t v36 = OUTLINED_FUNCTION_19(v28, v29, 0x8000000225107FC0, v30, v31, v32, v33, v34, v61);
  sub_2250B7F48((uint64_t)v36, 0xD000000000000015, v37);
  if (OUTLINED_FUNCTION_25(qword_2680C0AF0)) {
    OUTLINED_FUNCTION_9_0();
  }
  else {
    OUTLINED_FUNCTION_20();
  }
  uint64_t v38 = swift_bridgeObjectRetain();
  v46 = OUTLINED_FUNCTION_19(v38, v39, v40, v41, v42, v43, v44, v45, v62);
  sub_2250B7F48((uint64_t)v46, 0x614C656C646E6168, 0xEF657079546C6562);
  if (OUTLINED_FUNCTION_25(qword_2680C0AE8)) {
    OUTLINED_FUNCTION_9_0();
  }
  else {
    OUTLINED_FUNCTION_20();
  }
  uint64_t v47 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_19(v47, v48, v49, v50, v51, v52, v53, v54, v63);
  OUTLINED_FUNCTION_15();
  sub_2250B7F48(v55, v56, 0xE900000000000044);
  return v64;
}

uint64_t sub_2250B7F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_2250BADA0((_OWORD *)a1, v6);
    sub_2250BADB0(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2250BAC08(a1);
    sub_2250BAC68(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_2250BAC08((uint64_t)v6);
  }
}

uint64_t sub_2250B7FCC()
{
  return 0;
}

uint64_t sub_2250B7FD4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + qword_2680C0B38 + 8);
  uint64_t v4 = (void *)(v1 + qword_2680C0B10);
  *uint64_t v4 = *(void *)(a1 + qword_2680C0B38);
  v4[1] = v3;
  uint64_t v5 = *(void *)(a1 + qword_2680C0B40 + 8);
  uint64_t v6 = (void *)(v1 + qword_2680C0B08);
  *uint64_t v6 = *(void *)(a1 + qword_2680C0B40);
  v6[1] = v5;
  uint64_t v7 = *(void *)(a1 + qword_2680C0B48 + 8);
  uint64_t v8 = (void *)(v1 + qword_2680C0B00);
  *uint64_t v8 = *(void *)(a1 + qword_2680C0B48);
  v8[1] = v7;
  *(unsigned char *)(v1 + qword_2680C0AF8) = *(unsigned char *)(a1 + qword_2680C0B50);
  uint64_t v9 = *(void *)(a1 + qword_2680C0B58 + 8);
  uint64_t v10 = (void *)(v1 + qword_2680C0AF0);
  *uint64_t v10 = *(void *)(a1 + qword_2680C0B58);
  v10[1] = v9;
  uint64_t v12 = *(void *)(a1 + qword_2680C0B60);
  uint64_t v11 = *(void *)(a1 + qword_2680C0B60 + 8);
  uint64_t v13 = (void *)(v1 + qword_2680C0AE8);
  *uint64_t v13 = v12;
  v13[1] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return MEMORY[0x270F64C08](a1);
}

uint64_t sub_2250B80F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v5 = a1 == 0x6174614477656976 && a2 == 0xEE00343665736142;
  if (v5 || (OUTLINED_FUNCTION_4_1() & 1) != 0)
  {
    uint64_t v8 = qword_2680C0B10;
    goto LABEL_7;
  }
  BOOL v12 = a1 == 0x63417463656C6573 && a2 == 0xEC0000006E6F6974;
  if (v12 || (OUTLINED_FUNCTION_4_1() & 1) != 0)
  {
    uint64_t v8 = qword_2680C0B08;
    goto LABEL_7;
  }
  BOOL v13 = a1 == 0x636E657265666E69 && a2 == 0xEF656372756F5365;
  if (v13 || (uint64_t result = OUTLINED_FUNCTION_4_1(), (result & 1) != 0))
  {
    uint64_t v8 = qword_2680C0B00;
    goto LABEL_7;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x8000000225107FC0 || (uint64_t result = OUTLINED_FUNCTION_4_1(), (result & 1) != 0))
  {
    int v14 = *(unsigned __int8 *)(v3 + qword_2680C0AF8);
    if (v14 != 2)
    {
      *(void *)(a3 + 24) = MEMORY[0x263F8D4F8];
      *(unsigned char *)a3 = v14 & 1;
      return result;
    }
    goto LABEL_27;
  }
  BOOL v15 = a1 == 0x614C656C646E6168 && a2 == 0xEF657079546C6562;
  if (v15 || (OUTLINED_FUNCTION_4_1() & 1) != 0)
  {
    uint64_t v8 = qword_2680C0AF0;
    goto LABEL_7;
  }
  BOOL v16 = a1 == 0x49746361746E6F63 && a2 == 0xE900000000000044;
  if (v16 || (OUTLINED_FUNCTION_17(), (OUTLINED_FUNCTION_4_1() & 1) != 0))
  {
    uint64_t v8 = qword_2680C0AE8;
LABEL_7:
    uint64_t v9 = (uint64_t *)(v3 + v8);
    uint64_t result = v9[1];
    if (result)
    {
      uint64_t v11 = *v9;
      *(void *)(a3 + 24) = MEMORY[0x263F8D310];
      *(void *)a3 = v11;
      *(void *)(a3 + 8) = result;
      return swift_bridgeObjectRetain();
    }
LABEL_27:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  sub_225106DE0();
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))sub_225106DF0();
  return v17(a1, a2);
}

uint64_t sub_2250B83E4()
{
  unint64_t v0 = sub_225107670();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_2250B8434()
{
  unint64_t result = OUTLINED_FUNCTION_22();
  switch(v1)
  {
    case 1:
      unint64_t result = OUTLINED_FUNCTION_7_0();
      break;
    case 2:
      unint64_t result = OUTLINED_FUNCTION_6_0();
      break;
    case 3:
      unint64_t result = OUTLINED_FUNCTION_16();
      break;
    case 4:
      unint64_t result = OUTLINED_FUNCTION_5_0();
      break;
    case 5:
      unint64_t result = OUTLINED_FUNCTION_17();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2250B84A8()
{
  unint64_t result = OUTLINED_FUNCTION_22();
  switch(v1)
  {
    case 1:
      unint64_t result = OUTLINED_FUNCTION_7_0();
      break;
    case 2:
      unint64_t result = OUTLINED_FUNCTION_6_0();
      break;
    case 3:
      unint64_t result = OUTLINED_FUNCTION_16();
      break;
    case 4:
      unint64_t result = OUTLINED_FUNCTION_5_0();
      break;
    case 5:
      unint64_t result = OUTLINED_FUNCTION_17();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250B851C(unsigned __int8 *a1, char *a2)
{
  return sub_2250B8E58(*a1, *a2);
}

uint64_t sub_2250B8528(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0xD00000000000001CLL;
  unint64_t v4 = (unint64_t)"ContactLabels#DomainDialog";
  unint64_t v5 = 0x8000000225108440;
  uint64_t v6 = a1;
  uint64_t v7 = 0xD00000000000001CLL;
  switch(v6)
  {
    case 1:
      uint64_t v7 = OUTLINED_FUNCTION_44();
      uint64_t v8 = 1819042115;
      goto LABEL_6;
    case 2:
      uint64_t v7 = 0x7373654D646E6573;
      unint64_t v5 = 0xEB00000000656761;
      break;
    case 3:
      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_41();
      break;
    case 4:
      uint64_t v7 = 0x7373654D64616572;
      uint64_t v8 = 1936025441;
LABEL_6:
      unint64_t v5 = v8 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      break;
    case 5:
      uint64_t v7 = OUTLINED_FUNCTION_38();
      break;
    default:
      break;
  }
  unint64_t v9 = v4 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_34();
      uint64_t v10 = 1819042115;
      goto LABEL_13;
    case 2:
      unint64_t v3 = 0x7373654D646E6573;
      unint64_t v9 = 0xEB00000000656761;
      break;
    case 3:
      OUTLINED_FUNCTION_29();
      unint64_t v9 = 0xEE00657469766E49;
      break;
    case 4:
      unint64_t v3 = 0x7373654D64616572;
      uint64_t v10 = 1936025441;
LABEL_13:
      unint64_t v9 = v10 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      break;
    case 5:
      OUTLINED_FUNCTION_45();
      break;
    default:
      break;
  }
  if (v7 == v3 && v5 == v9) {
    OUTLINED_FUNCTION_21();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2250B86E4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000064;
  uint64_t v3 = 0x49746361746E6F63;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6E6F74747562;
    }
    else {
      uint64_t v5 = 0x7865646E69;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xE500000000000000;
    }
  }
  else
  {
    uint64_t v5 = OUTLINED_FUNCTION_17();
    unint64_t v6 = 0xE900000000000064;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 0x6E6F74747562;
    }
    else {
      uint64_t v3 = 0x7865646E69;
    }
    if (a2 == 1) {
      unint64_t v2 = 0xE600000000000000;
    }
    else {
      unint64_t v2 = 0xE500000000000000;
    }
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2251077B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2250B87D8(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0xD000000000000025;
  unint64_t v4 = 0x8000000225107FF0;
  uint64_t v5 = a1;
  unint64_t v6 = 0xD000000000000025;
  switch(v5)
  {
    case 1:
      unint64_t v6 = 0xD00000000000002ALL;
      uint64_t v7 = "rificationContactName";
      goto LABEL_13;
    case 2:
      char v8 = "DisambiguationContactNames";
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xD00000000000002ELL;
      uint64_t v7 = "sambiguationContactLabels";
      goto LABEL_13;
    case 4:
      unint64_t v6 = 0xD000000000000027;
      uint64_t v7 = "sambiguationAlternativeHandles";
      goto LABEL_13;
    case 5:
      unint64_t v6 = 0xD000000000000031;
      uint64_t v7 = "sambiguationMixedLabels";
      goto LABEL_13;
    case 6:
      unint64_t v6 = 0xD000000000000036;
      uint64_t v7 = "AlternativeHandle";
      goto LABEL_13;
    case 7:
      char v8 = "ltipleHandlesSameLabel";
LABEL_9:
      unint64_t v4 = (unint64_t)v8 | 0x8000000000000000;
      unint64_t v6 = 0xD000000000000029;
      break;
    case 8:
      unint64_t v6 = 0xD000000000000024;
      uint64_t v7 = "DisambiguationMixedLabels";
      goto LABEL_13;
    case 9:
      unint64_t v6 = 0xD000000000000034;
      uint64_t v7 = "dClarificationTarget";
      goto LABEL_13;
    case 10:
      unint64_t v6 = 0xD000000000000041;
      uint64_t v7 = "xedLabelsNoWindowing";
LABEL_13:
      unint64_t v4 = (unint64_t)v7 | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v9 = 0x8000000225107FF0;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0xD00000000000002ALL;
      uint64_t v10 = "rificationContactName";
      goto LABEL_26;
    case 2:
      uint64_t v11 = "DisambiguationContactNames";
      goto LABEL_22;
    case 3:
      unint64_t v3 = 0xD00000000000002ELL;
      uint64_t v10 = "sambiguationContactLabels";
      goto LABEL_26;
    case 4:
      unint64_t v3 = 0xD000000000000027;
      uint64_t v10 = "sambiguationAlternativeHandles";
      goto LABEL_26;
    case 5:
      unint64_t v3 = 0xD000000000000031;
      uint64_t v10 = "sambiguationMixedLabels";
      goto LABEL_26;
    case 6:
      unint64_t v3 = 0xD000000000000036;
      uint64_t v10 = "AlternativeHandle";
      goto LABEL_26;
    case 7:
      uint64_t v11 = "ltipleHandlesSameLabel";
LABEL_22:
      unint64_t v9 = (unint64_t)v11 | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000029;
      break;
    case 8:
      unint64_t v3 = 0xD000000000000024;
      uint64_t v10 = "DisambiguationMixedLabels";
      goto LABEL_26;
    case 9:
      unint64_t v3 = 0xD000000000000034;
      uint64_t v10 = "dClarificationTarget";
      goto LABEL_26;
    case 10:
      unint64_t v3 = 0xD000000000000041;
      uint64_t v10 = "xedLabelsNoWindowing";
LABEL_26:
      unint64_t v9 = (unint64_t)v10 | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v6 == v3 && v4 == v9) {
    OUTLINED_FUNCTION_21();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2250B8A3C(char a1, char a2)
{
  unint64_t v4 = 0xD000000000000031;
  unint64_t v5 = 0x8000000225108250;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xD000000000000030;
      unint64_t v6 = "ntactNames_Dialog";
      goto LABEL_10;
    case 2:
      unint64_t v4 = 0xD00000000000002ELL;
      unint64_t v6 = "actLabels_Dialog";
      goto LABEL_10;
    case 3:
      unint64_t v4 = 0xD000000000000048;
      unint64_t v6 = "sambiguationMixedLabels_Dialog";
      goto LABEL_10;
    case 4:
      unint64_t v4 = 0xD00000000000003BLL;
      unint64_t v6 = "eLabelNoWindowing_Dialog";
      goto LABEL_10;
    case 5:
      unint64_t v4 = 0xD00000000000002CLL;
      unint64_t v6 = "xedLabelsNoWindowing_Dialog";
      goto LABEL_10;
    case 6:
      unint64_t v4 = 0xD00000000000001CLL;
      unint64_t v6 = "rificationContactName_Dialog";
      goto LABEL_10;
    case 7:
      unint64_t v4 = 0xD00000000000001BLL;
      unint64_t v6 = "contact#DisambiguationLabels";
      goto LABEL_10;
    case 8:
      unint64_t v4 = 0xD00000000000001DLL;
      unint64_t v6 = "ContactLabels#PrimaryButton";
LABEL_10:
      unint64_t v5 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 9:
      unint64_t v5 = 0x8000000225108420;
      unint64_t v4 = 0xD00000000000001ALL;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000031;
  unint64_t v8 = 0x8000000225108250;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xD000000000000030;
      unint64_t v9 = "ntactNames_Dialog";
      goto LABEL_21;
    case 2:
      unint64_t v7 = 0xD00000000000002ELL;
      unint64_t v9 = "actLabels_Dialog";
      goto LABEL_21;
    case 3:
      unint64_t v7 = 0xD000000000000048;
      unint64_t v9 = "sambiguationMixedLabels_Dialog";
      goto LABEL_21;
    case 4:
      unint64_t v7 = 0xD00000000000003BLL;
      unint64_t v9 = "eLabelNoWindowing_Dialog";
      goto LABEL_21;
    case 5:
      unint64_t v7 = 0xD00000000000002CLL;
      unint64_t v9 = "xedLabelsNoWindowing_Dialog";
      goto LABEL_21;
    case 6:
      unint64_t v7 = 0xD00000000000001CLL;
      unint64_t v9 = "rificationContactName_Dialog";
      goto LABEL_21;
    case 7:
      unint64_t v7 = 0xD00000000000001BLL;
      unint64_t v9 = "contact#DisambiguationLabels";
      goto LABEL_21;
    case 8:
      unint64_t v7 = 0xD00000000000001DLL;
      unint64_t v9 = "ContactLabels#PrimaryButton";
LABEL_21:
      unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
      break;
    case 9:
      unint64_t v8 = 0x8000000225108420;
      unint64_t v7 = 0xD00000000000001ALL;
      break;
    default:
      break;
  }
  if (v4 == v7 && v5 == v8) {
    OUTLINED_FUNCTION_21();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2250B8C80(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0xD000000000000018;
  unint64_t v4 = (unint64_t)"l";
  unint64_t v5 = 0x80000002251085D0;
  uint64_t v6 = a1;
  uint64_t v7 = 0xD000000000000018;
  switch(v6)
  {
    case 1:
      OUTLINED_FUNCTION_32();
      break;
    case 2:
      unint64_t v5 = 0xE800000000000000;
      uint64_t v7 = OUTLINED_FUNCTION_44();
      break;
    case 3:
      unint64_t v5 = 0xE700000000000000;
      uint64_t v7 = 0x6567617373656DLL;
      break;
    case 4:
      unint64_t v5 = 0xE800000000000000;
      uint64_t v7 = OUTLINED_FUNCTION_43();
      break;
    case 5:
      OUTLINED_FUNCTION_46();
      break;
    case 6:
      uint64_t v7 = OUTLINED_FUNCTION_38();
      break;
    default:
      break;
  }
  unint64_t v8 = v4 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x6361466F54646461;
      unint64_t v8 = 0xED0000656D697465;
      break;
    case 2:
      unint64_t v8 = 0xE800000000000000;
      OUTLINED_FUNCTION_34();
      break;
    case 3:
      unint64_t v8 = 0xE700000000000000;
      unint64_t v3 = 0x6567617373656DLL;
      break;
    case 4:
      unint64_t v8 = 0xE800000000000000;
      OUTLINED_FUNCTION_29();
      break;
    case 5:
      unint64_t v3 = 0x6E6F697461636F6CLL;
      unint64_t v8 = 0xEE00686372616553;
      break;
    case 6:
      OUTLINED_FUNCTION_45();
      break;
    default:
      break;
  }
  if (v7 == v3 && v5 == v8) {
    OUTLINED_FUNCTION_21();
  }
  else {
    char v2 = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2250B8E58(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00343665736142;
  unint64_t v3 = 0x6174614477656976;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6174614477656976;
  unint64_t v6 = 0xEE00343665736142;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x63417463656C6573;
      unint64_t v6 = 0xEC0000006E6F6974;
      break;
    case 2:
      unint64_t v5 = 0x636E657265666E69;
      uint64_t v7 = 0x6372756F5365;
      goto LABEL_6;
    case 3:
      unint64_t v6 = 0x8000000225107FC0;
      unint64_t v5 = 0xD000000000000015;
      break;
    case 4:
      unint64_t v5 = 0x614C656C646E6168;
      uint64_t v7 = 0x7079546C6562;
LABEL_6:
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFLL | 0xEF65000000000000;
      break;
    case 5:
      unint64_t v5 = 0x49746361746E6F63;
      unint64_t v6 = 0xE900000000000044;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x63417463656C6573;
      unint64_t v2 = 0xEC0000006E6F6974;
      break;
    case 2:
      unint64_t v3 = 0x636E657265666E69;
      uint64_t v8 = 0x6372756F5365;
      goto LABEL_13;
    case 3:
      unint64_t v2 = 0x8000000225107FC0;
      unint64_t v3 = 0xD000000000000015;
      break;
    case 4:
      unint64_t v3 = 0x614C656C646E6168;
      uint64_t v8 = 0x7079546C6562;
LABEL_13:
      unint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0xEF65000000000000;
      break;
    case 5:
      unint64_t v3 = 0x49746361746E6F63;
      unint64_t v2 = 0xE900000000000044;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v10 = 1;
  }
  else {
    char v10 = sub_2251077B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

unint64_t sub_2250B909C(char a1, char a2)
{
  unint64_t v3 = sub_2250BE6C4(a1);
  uint64_t v5 = v4;
  if (v3 == sub_2250BE6C4(a2) && v5 == v6) {
    OUTLINED_FUNCTION_21();
  }
  else {
    LOBYTE(v3) = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2250B9114()
{
  OUTLINED_FUNCTION_13();
  if (v1)
  {
    OUTLINED_FUNCTION_42();
    if (v2) {
      uint64_t v6 = 0x656D697465636166;
    }
    else {
      uint64_t v6 = 0x746C7561666564;
    }
    if (v2) {
      unint64_t v7 = v5;
    }
    else {
      unint64_t v7 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v7 = 0xE800000000000000;
    uint64_t v6 = OUTLINED_FUNCTION_12();
  }
  if (v3)
  {
    OUTLINED_FUNCTION_42();
    if (v8) {
      uint64_t v4 = 0x656D697465636166;
    }
    else {
      uint64_t v4 = 0x746C7561666564;
    }
    if (v8) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v10 = 0xE800000000000000;
  }
  if (v6 == v4 && v7 == v10) {
    OUTLINED_FUNCTION_21();
  }
  else {
    char v0 = OUTLINED_FUNCTION_3_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_2250B91F0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB0000000079726FLL;
  uint64_t v3 = 0x747369486C6C6163;
  uint64_t v4 = a1;
  uint64_t v5 = 0x747369486C6C6163;
  unint64_t v6 = 0xEB0000000079726FLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = OUTLINED_FUNCTION_12();
      unint64_t v6 = 0xEF79726F74736948;
      break;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1818845549;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = OUTLINED_FUNCTION_12();
      break;
    case 4:
      uint64_t v5 = 0x707041726568746FLL;
      unint64_t v6 = 0xE900000000000073;
      break;
    case 5:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1701736302;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_30();
      break;
    case 2:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1818845549;
      break;
    case 3:
      unint64_t v2 = 0xE800000000000000;
      OUTLINED_FUNCTION_13();
      break;
    case 4:
      uint64_t v3 = 0x707041726568746FLL;
      unint64_t v2 = 0xE900000000000073;
      break;
    case 5:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1701736302;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2251077B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2250B93B0()
{
  return sub_2250B9440();
}

uint64_t sub_2250B93E0()
{
  return sub_2250B94B8();
}

uint64_t sub_2250B93F8()
{
  return sub_2250B94B8();
}

uint64_t sub_2250B9410()
{
  return sub_2250B94B8();
}

uint64_t sub_2250B9428()
{
  return sub_2250B9440();
}

uint64_t sub_2250B9440()
{
  OUTLINED_FUNCTION_28();
  v0(v1);
  OUTLINED_FUNCTION_23();
  swift_bridgeObjectRelease();
  return sub_225107880();
}

uint64_t sub_2250B9488()
{
  return sub_2250B94B8();
}

uint64_t sub_2250B94A0()
{
  return sub_2250B94B8();
}

uint64_t sub_2250B94B8()
{
  OUTLINED_FUNCTION_28();
  v0(v3, v1);
  return sub_225107880();
}

uint64_t sub_2250B94F8(char a1)
{
  return sub_2250B9E70(0, a1);
}

uint64_t sub_2250B9504(char a1)
{
  return sub_2250B9D2C(0, a1);
}

uint64_t sub_2250B9510()
{
  return sub_2250B9A00();
}

uint64_t sub_2250B9518(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_40();
      break;
    case 3:
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_36();
      break;
    case 5:
      OUTLINED_FUNCTION_39();
      break;
    default:
      break;
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9604(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_15();
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9680(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      OUTLINED_FUNCTION_31();
      break;
    default:
      break;
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B97CC(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_31();
      break;
    default:
      break;
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9908(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_32();
      break;
    case 2:
      OUTLINED_FUNCTION_40();
      break;
    case 4:
      OUTLINED_FUNCTION_36();
      break;
    case 5:
      OUTLINED_FUNCTION_46();
      break;
    case 6:
      OUTLINED_FUNCTION_39();
      break;
    default:
      break;
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9A00()
{
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9B34(uint64_t a1, char a2)
{
  sub_2250BE6C4(a2);
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9B88(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_42();
  }
  else {
    OUTLINED_FUNCTION_14();
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9C04(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_30();
      goto LABEL_3;
    case 3:
LABEL_3:
      OUTLINED_FUNCTION_14();
      break;
    default:
      break;
  }
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250B9CE4(uint64_t a1)
{
  return sub_2250B9DD4(a1, *v1, (void (*)(uint64_t))sub_2250B8434);
}

uint64_t sub_2250B9D14(uint64_t a1, uint64_t a2)
{
  return sub_2250B9F18(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2250B9C04);
}

uint64_t sub_2250B9D2C(uint64_t a1, char a2)
{
  if (a2) {
    OUTLINED_FUNCTION_42();
  }
  else {
    OUTLINED_FUNCTION_14();
  }
  sub_225107240();
  swift_bridgeObjectRelease();
  return sub_225107880();
}

uint64_t sub_2250B9DBC(uint64_t a1, uint64_t a2)
{
  return sub_2250B9DD4(a1, a2, (void (*)(uint64_t))sub_2250BE6C4);
}

uint64_t sub_2250B9DD4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_225107880();
}

uint64_t sub_2250B9E28(uint64_t a1, uint64_t a2)
{
  return sub_2250B9F18(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2250B9908);
}

uint64_t sub_2250B9E40(uint64_t a1, uint64_t a2)
{
  return sub_2250B9F18(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2250B97CC);
}

uint64_t sub_2250B9E58(uint64_t a1, uint64_t a2)
{
  return sub_2250B9F18(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2250B9680);
}

uint64_t sub_2250B9E70(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_15();
  }
  sub_225107240();
  swift_bridgeObjectRelease();
  return sub_225107880();
}

uint64_t sub_2250B9F00(uint64_t a1, uint64_t a2)
{
  return sub_2250B9F18(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2250B9518);
}

uint64_t sub_2250B9F18(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_225107850();
  a3(v6, a2);
  return sub_225107880();
}

uint64_t sub_2250B9F64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250B83E4();
  *a1 = result;
  return result;
}

unint64_t sub_2250B9F94@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2250B8434();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2250B9FC0()
{
  return sub_2250B84A8();
}

uint64_t sub_2250B9FC8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250B8430();
  *a1 = result;
  return result;
}

uint64_t sub_2250B9FF0()
{
  return 0;
}

void sub_2250B9FFC(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2250BA008(uint64_t a1)
{
  unint64_t v2 = sub_2250BA75C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250BA044(uint64_t a1)
{
  unint64_t v2 = sub_2250BA75C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2250BA080(void *a1)
{
  return sub_2250BA0CC(a1);
}

uint64_t sub_2250BA0CC(void *a1)
{
  uint64_t v3 = v1;
  int v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0B90);
  OUTLINED_FUNCTION_0();
  char v7 = v6;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2250BA75C();
  swift_retain();
  sub_2251078A0();
  if (v2)
  {
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_37();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    if ((v7 & 1) == 0)
    {
      if (0x680C0000u)
      {
        OUTLINED_FUNCTION_10();
        if (!v5)
        {
LABEL_7:
          if (!v8)
          {
LABEL_9:
            type metadata accessor for ContactDialogPerson(0);
            swift_deallocPartialClassInstance();
            return v8;
          }
LABEL_8:
          OUTLINED_FUNCTION_10();
          goto LABEL_9;
        }
      }
      else if (!v5)
      {
        goto LABEL_7;
      }
      OUTLINED_FUNCTION_10();
      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = sub_2251076A0();
    OUTLINED_FUNCTION_24(v9, v11, qword_2680C0B10);
    uint64_t v12 = OUTLINED_FUNCTION_1_1(1);
    OUTLINED_FUNCTION_24(v12, v13, qword_2680C0B08);
    uint64_t v14 = OUTLINED_FUNCTION_1_1(2);
    OUTLINED_FUNCTION_24(v14, v15, qword_2680C0B00);
    v22[0] = 3;
    *(unsigned char *)(v3 + qword_2680C0AF8) = sub_2251076B0();
    uint64_t v16 = OUTLINED_FUNCTION_1_1(4);
    OUTLINED_FUNCTION_24(v16, v17, qword_2680C0AF0);
    uint64_t v18 = OUTLINED_FUNCTION_1_1(5);
    OUTLINED_FUNCTION_24(v18, v19, qword_2680C0AE8);
    swift_release();
    sub_2250BAB54((uint64_t)a1, (uint64_t)v22);
    uint64_t v8 = sub_225106C40();
    uint64_t v20 = OUTLINED_FUNCTION_0_0();
    v21(v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_2250BA3F0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0B18);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225106DE0();
  uint64_t v8 = (uint64_t (*)(void *))sub_225106DF0();
  uint64_t result = v8(a1);
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_2250BA75C();
    sub_2251078B0();
    OUTLINED_FUNCTION_26(qword_2680C0B10);
    char v16 = 0;
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_26(qword_2680C0B08);
    char v15 = 1;
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_26(qword_2680C0B00);
    char v14 = 2;
    OUTLINED_FUNCTION_8_0();
    char v13 = 3;
    sub_225107730();
    OUTLINED_FUNCTION_26(qword_2680C0AF0);
    char v12 = 4;
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_26(qword_2680C0AE8);
    char v11 = 5;
    OUTLINED_FUNCTION_8_0();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
  return result;
}

void ContactDialogPerson.__allocating_init(builder:)()
{
}

void ContactDialogPerson.init(builder:)()
{
}

uint64_t sub_2250BA65C()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11();
  return swift_bridgeObjectRelease();
}

uint64_t ContactDialogPerson.deinit()
{
  uint64_t v0 = sub_225106E00();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  return v0;
}

uint64_t ContactDialogPerson.__deallocating_deinit()
{
  uint64_t v0 = ContactDialogPerson.deinit();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

unint64_t sub_2250BA75C()
{
  unint64_t result = qword_2680C0B20;
  if (!qword_2680C0B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0B20);
  }
  return result;
}

uint64_t type metadata accessor for ContactDialogPerson(uint64_t a1)
{
  return sub_2250BA814(a1, (uint64_t *)&unk_2680C0B28);
}

uint64_t sub_2250BA7C8()
{
  return sub_2250BA854();
}

uint64_t method lookup function for ContactDialogPerson(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactDialogPerson);
}

uint64_t sub_2250BA7EC()
{
  return type metadata accessor for ContactDialogPerson(0);
}

uint64_t type metadata accessor for ContactDialogPerson.Builder(uint64_t a1)
{
  return sub_2250BA814(a1, (uint64_t *)&unk_2680C0B68);
}

uint64_t sub_2250BA814(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2250BA848()
{
  return sub_2250BA854();
}

uint64_t sub_2250BA854()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2250BA8AC()
{
  return type metadata accessor for ContactDialogPerson.Builder(0);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactDialogPerson.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactDialogPerson.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250BAA18);
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

uint64_t sub_2250BAA40(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2250BAA4C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactDialogPerson.CodingKeys()
{
  return &type metadata for ContactDialogPerson.CodingKeys;
}

unint64_t sub_2250BAA68()
{
  unint64_t result = qword_2680C0B78;
  if (!qword_2680C0B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0B78);
  }
  return result;
}

unint64_t sub_2250BAAB8()
{
  unint64_t result = qword_2680C0B80;
  if (!qword_2680C0B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0B80);
  }
  return result;
}

unint64_t sub_2250BAB08()
{
  unint64_t result = qword_2680C0B88;
  if (!qword_2680C0B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0B88);
  }
  return result;
}

uint64_t sub_2250BAB54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2250BABB8()
{
  unint64_t result = qword_2680C0B98;
  if (!qword_2680C0B98)
  {
    sub_225106DE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0B98);
  }
  return result;
}

uint64_t sub_2250BAC08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_2250BAC68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2250F644C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BA8);
    sub_2251075D0();
    swift_bridgeObjectRelease();
    sub_2250BADA0((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_2251075E0();
    *unsigned int v4 = v11;
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

_OWORD *sub_2250BADA0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2250BADB0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_2250BAE40(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_2250BAE40(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_2250F644C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BA8);
  if ((sub_2251075D0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_2250F644C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_2251077E0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  char v15 = *v4;
  if (v12)
  {
    char v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_2250BADA0(a1, v16);
  }
  else
  {
    sub_2250BAF80(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_2250BAF80(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unsigned int v6 = (void *)(a5[6] + 16 * a1);
  *unsigned int v6 = a2;
  v6[1] = a3;
  double result = sub_2250BADA0(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
  return sub_2251076A0();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_2251077B0();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_2251077B0();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return 0x614C656C646E6168;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return 0x636E657265666E69;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return 0x63417463656C6573;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_225107720();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return 0x736567617373656DLL;
}

unint64_t OUTLINED_FUNCTION_16()
{
  return 0xD000000000000015;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return 0x49746361746E6F63;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_release();
}

uint64_t *OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

double OUTLINED_FUNCTION_20()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return 0x6174614477656976;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_225107240();
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = (void *)(v3 + a3);
  *unsigned int v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_25@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_26@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_225107850();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return 0x726568746FLL;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return 0x7261646E656C6163;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return 0x656D697465636166;
}

uint64_t sub_2250BB3C4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v8;
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v9 = a3[7];
    uint64_t v10 = (void *)(a1 + v9);
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_225106560();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v14 = a3[9];
    *(void *)(v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(void *)(v7 + v14) = *(uint64_t *)((char *)a2 + v14);
  }
  return v7;
}

uint64_t sub_2250BB534(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_225106560();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_2250BB5D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_225106560();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

uint64_t sub_2250BB6FC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_225106560();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2250BB8BC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_225106560();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t sub_2250BB9C8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_225106560();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  return a1;
}

uint64_t sub_2250BBB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2250BBB80);
}

uint64_t sub_2250BBB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_16_0();
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  uint64_t v8 = a1 + *(int *)(a3 + 28);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2250BBBFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2250BBC10);
}

void sub_2250BBC10()
{
  OUTLINED_FUNCTION_22_0();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    uint64_t v6 = (uint64_t)v1 + *(int *)(v4 + 28);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters(uint64_t a1)
{
  return sub_2250BA814(a1, (uint64_t *)&unk_2680C0BB8);
}

void sub_2250BBCA8()
{
  sub_2250BBD68();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2250BBD68()
{
  if (!qword_2680C0BC8)
  {
    sub_225106560();
    unint64_t v0 = sub_2251073F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2680C0BC8);
    }
  }
}

void *sub_2250BBDC0(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_225106560();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v13 = a3[7];
    *((unsigned char *)v7 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *((unsigned char *)v7 + v13) = *((unsigned char *)a2 + v13);
  }
  return v7;
}

uint64_t sub_2250BBF18(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_225106560();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_2250BBFB4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_225106560();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  return a1;
}

void *sub_2250BC0C0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_225106560();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *sub_2250BC258(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_225106560();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  return a1;
}

void *sub_2250BC354(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_225106560();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
  return a1;
}

uint64_t sub_2250BC4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2250BC4F4);
}

uint64_t sub_2250BC4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_16_0();
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  uint64_t v8 = a1 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2250BC570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2250BC584);
}

void sub_2250BC584()
{
  OUTLINED_FUNCTION_22_0();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
    uint64_t v6 = (uint64_t)v1 + *(int *)(v4 + 20);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t type metadata accessor for ContactResolutionDisambiguationParameters(uint64_t a1)
{
  return sub_2250BA814(a1, (uint64_t *)&unk_2680C0BD0);
}

void sub_2250BC61C()
{
  sub_2250BBD68();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2250BC6C4(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10 - v9;
  sub_2250BDDA8(a1, v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v5) == 1)
  {
    sub_2250BDB58(v1);
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2251070F0();
    __swift_project_value_buffer(v12, (uint64_t)qword_2680C5BD8);
    uint64_t v13 = sub_2251070D0();
    os_log_type_t v14 = sub_2251073A0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2250AF000, v13, v14, "No windowing parameters provided, defaulting to no windowing", v15, 2u);
      MEMORY[0x22A62D170](v15, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510BA10;
    *(void *)(inited + 32) = 0x6953776F646E6977;
    *(void *)(inited + 40) = 0xEA0000000000657ALL;
    *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
    *(void *)(inited + 48) = 0;
    return sub_225107170();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v11, v1, v5);
    uint64_t v17 = sub_225106550();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  }
  return v17;
}

uint64_t sub_2250BC90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v46 = MEMORY[0x263F8EE80];
  char v11 = 24;
  switch(*(unsigned char *)v8)
  {
    case 1:
      OUTLINED_FUNCTION_6_1();
      break;
    case 2:
      OUTLINED_FUNCTION_9_1();
      break;
    case 3:
      OUTLINED_FUNCTION_15_0();
      break;
    case 4:
      OUTLINED_FUNCTION_8_1();
      break;
    case 5:
      OUTLINED_FUNCTION_5_1();
      break;
    case 6:
      OUTLINED_FUNCTION_11_0();
      break;
    default:
      break;
  }
  uint64_t v12 = OUTLINED_FUNCTION_10_0(a1, a2, a3, a4, a5, a6, a7, a8, v41, v11);
  sub_2250B7F48((uint64_t)v12, 0x56746361746E6F63, 0xEB00000000627265);
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v20 = OUTLINED_FUNCTION_10_0(v13, v14, 0x8000000225108BC0, v15, v16, v17, v18, v19, v42, v9);
  sub_2250B7F48((uint64_t)v20, 0xD000000000000014, v21);
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v28 = OUTLINED_FUNCTION_10_0(v22, 0xD000000000000016, 0x8000000225108BE0, v23, v24, v25, v26, v27, v43, v10);
  sub_2250B7F48((uint64_t)v28, v29, v30);
  char v31 = sub_2250B7D44();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF0);
  uint64_t v39 = OUTLINED_FUNCTION_10_0(v45, v32, v33, v34, v35, v36, v37, v38, v44, v31);
  sub_2250B7F48((uint64_t)v39, 0x6E6F73726570, 0xE600000000000000);
  return v46;
}

uint64_t sub_2250BCABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for ContactResolutionDisambiguationParameters(0);
  uint64_t v27 = sub_2250BC6C4((uint64_t)v0 + v2[5]);
  unint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_2250BCDD8(v3);
  swift_bridgeObjectRelease();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
  v25[0] = v4;
  sub_2250B7F48((uint64_t)v25, 0x736D657469, 0xE500000000000000);
  uint64_t v5 = *v0;
  uint64_t v6 = *v0 >> 62;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v26 = MEMORY[0x263F8D6C8];
  v25[0] = v7;
  OUTLINED_FUNCTION_14_0();
  sub_2250B7F48(v8, v9, v10);
  char v11 = *((unsigned char *)v1 + v2[6]);
  uint64_t v12 = MEMORY[0x263F8D4F8];
  uint64_t v26 = MEMORY[0x263F8D4F8];
  LOBYTE(v25[0]) = v11;
  sub_2250B7F48((uint64_t)v25, 0xD000000000000011, 0x8000000225108C60);
  char v13 = *((unsigned char *)v1 + v2[7]);
  uint64_t v26 = v12;
  LOBYTE(v25[0]) = v13;
  OUTLINED_FUNCTION_23_0(0xD000000000000014, (uint64_t)"inferenceSourceFound", v21, v23);
  v25[0] = MEMORY[0x263F8EE78];
  if (!v6)
  {
    uint64_t v14 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v14) {
      goto LABEL_5;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_225107620();
  uint64_t v14 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_5:
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        uint64_t v17 = MEMORY[0x22A62C790](i, v5);
      }
      else
      {
        uint64_t v17 = *(void *)(v5 + 8 * i + 32);
        swift_retain();
      }
      int v18 = *(unsigned __int8 *)(v17 + qword_2680C0AF8);
      if (v18 != 2 && (v18 & 1) != 0)
      {
        sub_225107580();
        sub_2251075B0();
        sub_2251075C0();
        sub_225107590();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v19 = v25[0];
    uint64_t v12 = MEMORY[0x263F8D4F8];
    if ((v25[0] & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
LABEL_19:
    if ((v19 & 0x4000000000000000) == 0)
    {
      uint64_t v20 = *(void *)(v19 + 16);
LABEL_21:
      swift_release();
      uint64_t v26 = v12;
      LOBYTE(v25[0]) = v20 == 1;
      sub_2250B7F48((uint64_t)v25, 0xD000000000000017, 0x8000000225108CA0);
      uint64_t v26 = v12;
      LOBYTE(v25[0]) = v20 > 1;
      OUTLINED_FUNCTION_23_0(0xD00000000000001DLL, (uint64_t)"multipleInferenceSourcesFound", v22, v24);
      return v27;
    }
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_225107620();
    swift_release();
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

char *sub_2250BCDD8(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2250CE480(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v9;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A62C790](v5, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v6 = sub_2250B7D44();
      swift_release();
      unint64_t v8 = *(void *)(v9 + 16);
      unint64_t v7 = *(void *)(v9 + 24);
      if (v8 >= v7 >> 1) {
        sub_2250CE480((char *)(v7 > 1), v8 + 1, 1);
      }
      ++v5;
      *(void *)(v9 + 16) = v8 + 1;
      *(void *)(v9 + 8 * v8 + 32) = v6;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2250BCF3C()
{
  unint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_2250BCDD8(v1);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510B830;
  *(void *)(inited + 32) = 0x736D657469;
  *(void *)(inited + 40) = 0xE500000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
  *(void *)(inited + 48) = v2;
  OUTLINED_FUNCTION_19_0();
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 80) = v5;
  *(void *)(inited + 88) = 0xE800000000000000;
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 96) = *(unsigned char *)(v0 + 8);
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 128) = 0x6C6562616CLL;
  uint64_t v7 = MEMORY[0x263F8D310];
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  *(void *)(inited + 136) = 0xE500000000000000;
  *(void *)(inited + 144) = v9;
  *(void *)(inited + 152) = v8;
  *(void *)(inited + 168) = v7;
  *(void *)(inited + 176) = 0xD000000000000013;
  *(void *)(inited + 184) = 0x8000000225108C20;
  *(unsigned char *)(inited + 192) = *(unsigned char *)(v0 + 32);
  *(void *)(inited + 216) = v6;
  *(void *)(inited + 224) = 0xD000000000000013;
  OUTLINED_FUNCTION_25_0();
  *(void *)(inited + 232) = v10;
  LOBYTE(v10) = *(unsigned char *)(v0 + 33);
  *(void *)(inited + 264) = v11;
  *(unsigned char *)(inited + 240) = v10;
  swift_bridgeObjectRetain();
  return sub_225107170();
}

uint64_t sub_2250BD084()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v23 = *(void *)(v0 + 32);
  char v24 = *(unsigned char *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v7 = sub_225106BF0();
  swift_release();
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510BA20;
    *(void *)(inited + 32) = 0x6E6F73726570;
    *(void *)(inited + 40) = 0xE600000000000000;
    uint64_t v9 = sub_2250B7D44();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF0);
    *(void *)(inited + 48) = v9;
    *(void *)(inited + 72) = v10;
    *(void *)(inited + 80) = 0x56746361746E6F63;
    *(void *)(inited + 88) = 0xEB00000000627265;
    OUTLINED_FUNCTION_25_0();
    switch(v1)
    {
      case 1:
        OUTLINED_FUNCTION_6_1();
        break;
      case 2:
        OUTLINED_FUNCTION_9_1();
        break;
      case 3:
        OUTLINED_FUNCTION_15_0();
        break;
      case 4:
        OUTLINED_FUNCTION_8_1();
        break;
      case 5:
        OUTLINED_FUNCTION_5_1();
        break;
      case 6:
        OUTLINED_FUNCTION_11_0();
        break;
      default:
        break;
    }
    uint64_t v19 = MEMORY[0x263F8D310];
    *(void *)(inited + 96) = v12;
    *(void *)(inited + 104) = v11;
    *(void *)(inited + 120) = v19;
    *(void *)(inited + 128) = 0xD000000000000014;
    OUTLINED_FUNCTION_25_0();
    *(void *)(inited + 136) = v20;
    *(void *)(inited + 144) = v3;
    *(void *)(inited + 152) = v2;
    *(void *)(inited + 168) = v19;
    *(void *)(inited + 176) = 0xD000000000000016;
    *(void *)(inited + 184) = 0x8000000225108BE0;
    *(void *)(inited + 192) = v23;
    *(void *)(inited + 200) = v4;
    OUTLINED_FUNCTION_19_0();
    *(void *)(inited + 216) = v19;
    *(void *)(inited + 224) = v21;
    uint64_t v22 = MEMORY[0x263F8D4F8];
    *(void *)(inited + 232) = 0xE800000000000000;
    *(unsigned char *)(inited + 240) = v24;
    *(void *)(inited + 264) = v22;
    *(void *)(inited + 272) = 0xD000000000000010;
    *(void *)(inited + 312) = v19;
    *(void *)(inited + 280) = 0x8000000225108C00;
    *(void *)(inited + 288) = v6;
    *(void *)(inited + 296) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_225107170();
  }
  else
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2251070F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_2680C5BD8);
    uint64_t v14 = sub_2251070D0();
    os_log_type_t v15 = sub_225107390();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2250AF000, v14, v15, "YesNoSingleAlternativeHandleParameters::asKeyValuePairs - Handle not found", v16, 2u);
      MEMORY[0x22A62D170](v16, -1, -1);
    }

    sub_2250BDE10();
    swift_allocError();
    *uint64_t v17 = 4;
    return swift_willThrow();
  }
}

uint64_t sub_2250BD3B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_2();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = (int *)type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters(0);
  uint64_t v36 = sub_2250BC6C4(v0 + v7[7]);
  unint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = sub_2250BCDD8(v8);
  swift_bridgeObjectRelease();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
  v34[0] = v9;
  OUTLINED_FUNCTION_13_0();
  v34[1] = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_24_0((uint64_t)"nextButtonCommand");
  OUTLINED_FUNCTION_24_0((uint64_t)"isSameContactType");
  sub_225106DE0();
  id v10 = objc_allocWithZone(MEMORY[0x263F0FD20]);
  id v11 = OUTLINED_FUNCTION_27_0();
  sub_225105DE0();
  OUTLINED_FUNCTION_21_0();
  id v12 = objc_allocWithZone(MEMORY[0x263F0FD18]);
  OUTLINED_FUNCTION_0_1(v11, v6, v13, v14, v15, v16, v17, v18, 0);
  OUTLINED_FUNCTION_20_0();
  sub_2250BABB8();
  sub_2251070A0();
  swift_release();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF0);
  OUTLINED_FUNCTION_2_0(v19);
  id v20 = objc_allocWithZone(MEMORY[0x263F0FD20]);
  id v21 = OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_21_0();
  id v22 = objc_allocWithZone(MEMORY[0x263F0FD18]);
  OUTLINED_FUNCTION_0_1(v21, v6, v23, v24, v25, v26, v27, v28, 0);
  OUTLINED_FUNCTION_20_0();
  uint64_t v29 = sub_2251070A0();
  swift_release();
  uint64_t v35 = v19;
  v34[0] = v29;
  OUTLINED_FUNCTION_4_2((uint64_t)v34, 0x486C69616D65);
  uint64_t v30 = *(void *)(v1 + v7[8]);
  uint64_t v31 = MEMORY[0x263F8D6C8];
  uint64_t v35 = MEMORY[0x263F8D6C8];
  v34[0] = v30;
  OUTLINED_FUNCTION_1_2((uint64_t)"phoneHandleCount");
  uint64_t v32 = *(void *)(v1 + v7[9]);
  uint64_t v35 = v31;
  v34[0] = v32;
  OUTLINED_FUNCTION_1_2((uint64_t)"emailHandleCount");
  return v36;
}

uint64_t sub_2250BD634()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *((unsigned __int8 *)v0 + 16);
  char v3 = *((unsigned char *)v0 + 17);
  uint64_t v36 = sub_225107170();
  uint64_t v4 = swift_bridgeObjectRetain();
  id v12 = OUTLINED_FUNCTION_10_0(v4, v5, v6, v7, v8, v9, v10, v11, v33, v1);
  sub_2250B7F48((uint64_t)v12, 0x6574736575716572, 0xED0000656D614E64);
  OUTLINED_FUNCTION_25_0();
  char v21 = 28;
  switch(v2)
  {
    case 1:
      OUTLINED_FUNCTION_9_1();
      break;
    case 2:
      char v21 = 115;
      break;
    case 3:
      OUTLINED_FUNCTION_8_1();
      break;
    case 4:
      char v21 = 114;
      break;
    case 5:
      OUTLINED_FUNCTION_11_0();
      break;
    default:
      break;
  }
  id v22 = OUTLINED_FUNCTION_10_0(v13, v14, v15, v16, v17, v18, v19, v20, v34, v21);
  uint64_t v23 = sub_2250B7F48((uint64_t)v22, 0x7954746E65746E69, 0xEA00000000006570);
  uint64_t v31 = OUTLINED_FUNCTION_10_0(v23, v24, v25, v26, v27, v28, v29, v30, v35, v3);
  sub_2250B7F48((uint64_t)v31, 0x6374614D6F72657ALL, 0xEB00000000736568);
  return v36;
}

uint64_t sub_2250BD7F0(unint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  uint64_t v13 = OUTLINED_FUNCTION_9(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v19 - v18;
  sub_225106540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v4, v20, v14);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v14);
  uint64_t v21 = sub_2250BC6C4(v4);
  sub_2250BDB58(v4);
  uint64_t v53 = v21;
  unint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_2250BCDD8(v22);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
  v51[0] = (uint64_t)v23;
  OUTLINED_FUNCTION_13_0();
  uint64_t v52 = MEMORY[0x263F8D4F8];
  LOBYTE(v51[0]) = a2;
  OUTLINED_FUNCTION_1_2((uint64_t)"handleTypeIsSame");
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_225107620();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_14_0();
  sub_2250B7F48(v24, v25, v26);
  sub_225106DE0();
  id v27 = objc_allocWithZone(MEMORY[0x263F0FD20]);
  id v28 = OUTLINED_FUNCTION_27_0();
  sub_225105DE0();
  OUTLINED_FUNCTION_18_0();
  id v29 = objc_allocWithZone(MEMORY[0x263F0FD18]);
  OUTLINED_FUNCTION_0_1(v28, v11, v30, v31, v32, v33, v34, v35, 0);
  OUTLINED_FUNCTION_20_0();
  sub_2250BABB8();
  sub_2251070A0();
  swift_release();
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF0);
  OUTLINED_FUNCTION_2_0(v36);
  id v37 = objc_allocWithZone(MEMORY[0x263F0FD20]);
  id v38 = OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18_0();
  id v39 = objc_allocWithZone(MEMORY[0x263F0FD18]);
  OUTLINED_FUNCTION_0_1(v38, v11, v40, v41, v42, v43, v44, v45, 0);
  OUTLINED_FUNCTION_20_0();
  uint64_t v46 = sub_2251070A0();
  swift_release();
  uint64_t v52 = v36;
  v51[0] = v46;
  OUTLINED_FUNCTION_4_2((uint64_t)v51, 0x486C69616D65);
  uint64_t v47 = MEMORY[0x263F8D6C8];
  uint64_t v52 = MEMORY[0x263F8D6C8];
  v51[0] = a3;
  OUTLINED_FUNCTION_1_2((uint64_t)"phoneHandleCount");
  uint64_t v52 = v47;
  v51[0] = a4;
  OUTLINED_FUNCTION_1_2((uint64_t)"emailHandleCount");
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  return v53;
}

uint64_t sub_2250BDB58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_2250BDBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_2251071A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(v3, sel_initWithValue_type_, v5, a3);

  return v6;
}

id sub_2250BDC24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v16 = sub_225105DE0();
  uint64_t v17 = 0;
  if (__swift_getEnumTagSinglePayload(a2, 1, v16) != 1)
  {
    uint64_t v17 = (void *)sub_225105D80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
  if (a4)
  {
    uint64_t v18 = (void *)sub_2251071A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = 0;
  }
  if (!a7)
  {
    uint64_t v19 = 0;
    if (a9) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  uint64_t v19 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
  if (!a9) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v20 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
LABEL_11:
  id v21 = objc_msgSend(v10, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, a1, v17, v18, a5, v19, v20);

  return v21;
}

uint64_t sub_2250BDDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2250BDE10()
{
  unint64_t result = qword_2680C0C00;
  if (!qword_2680C0C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C00);
  }
  return result;
}

id OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2250BDC24(a1, a2, 0, 0, 0, 0, 0, 0, a9);
}

uint64_t OUTLINED_FUNCTION_1_2@<X0>(uint64_t a1@<X8>)
{
  return sub_2250B7F48(v1 - 120, 0xD000000000000010, (a1 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 120) = v1;
  return sub_2250B7F48(v2 - 120, 0x6E6148656E6F6870, 0xEB00000000656C64);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL | 0x6E61000000000000;
  return sub_2250B7F48(a1, v3, 0xEB00000000656C64);
}

char *OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  return &a10;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_225106560();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_2250B7F48(v0 - 120, 0x736D657469, 0xE500000000000000);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v1 = *v0;
  if ((unint64_t)*v0 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return MEMORY[0x270F64B08]();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_23_0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_2250B7F48((uint64_t)va, a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_24_0@<X0>(uint64_t a1@<X8>)
{
  return sub_2250B7F48(v2 - 120, v1, (a1 - 32) | 0x8000000000000000);
}

id OUTLINED_FUNCTION_26_0()
{
  return sub_2250BDBB8(0, 0xE000000000000000, 1);
}

id OUTLINED_FUNCTION_27_0()
{
  return sub_2250BDBB8(0, 0xE000000000000000, 2);
}

uint64_t ContactResolutionVerb.rawValue.getter()
{
  uint64_t result = 0xD000000000000018;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6361466F54646461;
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_44();
      break;
    case 3:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_43();
      break;
    case 5:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 6:
      uint64_t result = 0x726568746FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ContactResolutionIntentType.rawValue.getter()
{
  uint64_t result = 0xD00000000000001CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_44();
      break;
    case 2:
      unsigned int v2 = 1684956531;
      goto LABEL_6;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_43();
      break;
    case 4:
      unsigned int v2 = 1684104562;
LABEL_6:
      uint64_t result = v2 | 0x7373654D00000000;
      break;
    case 5:
      uint64_t result = 0x726568746FLL;
      break;
    default:
      return result;
  }
  return result;
}

SiriInferenceFlow::ContactResolutionPatternID_optional __swiftcall ContactResolutionPatternID.init(rawValue:)(Swift::String rawValue)
{
  OUTLINED_FUNCTION_4_3();
  sub_225107670();
  result.value = OUTLINED_FUNCTION_3_2();
  char v4 = 11;
  if (v2 < 0xB) {
    char v4 = v2;
  }
  *uint64_t v1 = v4;
  return result;
}

unint64_t ContactResolutionPatternID.rawValue.getter()
{
  unint64_t result = 0xD000000000000025;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 2:
    case 7:
      unint64_t result = 0xD000000000000029;
      break;
    case 3:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 4:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0xD000000000000031;
      break;
    case 6:
      unint64_t result = 0xD000000000000036;
      break;
    case 8:
      unint64_t result = 0xD000000000000024;
      break;
    case 9:
      unint64_t result = 0xD000000000000034;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000041;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250BE448(unsigned __int8 *a1, char *a2)
{
  return sub_2250B87D8(*a1, *a2);
}

uint64_t sub_2250BE454()
{
  return sub_2250B93E0();
}

uint64_t sub_2250BE45C(uint64_t a1)
{
  return sub_2250B9680(a1, *v1);
}

uint64_t sub_2250BE464(uint64_t a1)
{
  return sub_2250B9E58(a1, *v1);
}

SiriInferenceFlow::ContactResolutionPatternID_optional sub_2250BE46C(Swift::String *a1)
{
  return ContactResolutionPatternID.init(rawValue:)(*a1);
}

unint64_t sub_2250BE478@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ContactResolutionPatternID.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriInferenceFlow::ContactResolutionCatId_optional __swiftcall ContactResolutionCatId.init(rawValue:)(Swift::String rawValue)
{
  OUTLINED_FUNCTION_4_3();
  sub_225107670();
  result.value = OUTLINED_FUNCTION_3_2();
  char v4 = 10;
  if (v2 < 0xA) {
    char v4 = v2;
  }
  *uint64_t v1 = v4;
  return result;
}

unint64_t ContactResolutionCatId.rawValue.getter()
{
  unint64_t result = 0xD000000000000031;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000030;
      break;
    case 2:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000048;
      break;
    case 4:
      unint64_t result = 0xD00000000000003BLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250BE5F8(char *a1, char *a2)
{
  return sub_2250B8A3C(*a1, *a2);
}

uint64_t sub_2250BE604()
{
  return sub_2250B93F8();
}

uint64_t sub_2250BE60C(uint64_t a1)
{
  return sub_2250B97CC(a1, *v1);
}

uint64_t sub_2250BE614(uint64_t a1)
{
  return sub_2250B9E40(a1, *v1);
}

SiriInferenceFlow::ContactResolutionCatId_optional sub_2250BE61C(Swift::String *a1)
{
  return ContactResolutionCatId.init(rawValue:)(*a1);
}

unint64_t sub_2250BE628@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ContactResolutionCatId.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t ContactResolutionPatternID.requiresAuthentication.getter()
{
  return (*v0 < 0xBuLL) & (0x6D0u >> *v0);
}

SiriInferenceFlow::ContactResolutionIntentType_optional __swiftcall ContactResolutionIntentType.init(rawValue:)(Swift::String rawValue)
{
  return (SiriInferenceFlow::ContactResolutionIntentType_optional)sub_2250BE89C();
}

uint64_t sub_2250BE678()
{
  unint64_t v0 = sub_225107670();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

unint64_t sub_2250BE6C4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
    case 7:
      unint64_t result = 0x6562614C656D6173;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250BE7B8(unsigned __int8 *a1, char *a2)
{
  return sub_2250B8528(*a1, *a2);
}

uint64_t sub_2250BE7C4()
{
  return sub_2250B9410();
}

uint64_t sub_2250BE7CC(uint64_t a1)
{
  return sub_2250B9518(a1, *v1);
}

uint64_t sub_2250BE7D4(uint64_t a1)
{
  return sub_2250B9F00(a1, *v1);
}

SiriInferenceFlow::ContactResolutionIntentType_optional sub_2250BE7DC(Swift::String *a1)
{
  return ContactResolutionIntentType.init(rawValue:)(*a1);
}

uint64_t sub_2250BE7E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactResolutionIntentType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2250BE810(char *a1, char *a2)
{
  return sub_2250B909C(*a1, *a2);
}

uint64_t sub_2250BE81C()
{
  return sub_2250B9428();
}

uint64_t sub_2250BE824(uint64_t a1)
{
  return sub_2250B9B34(a1, *v1);
}

uint64_t sub_2250BE82C(uint64_t a1)
{
  return sub_2250B9DBC(a1, *v1);
}

uint64_t sub_2250BE834@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250BE678();
  *a1 = result;
  return result;
}

unint64_t sub_2250BE864@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2250BE6C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

SiriInferenceFlow::ContactInferenceSource_optional __swiftcall ContactInferenceSource.init(rawValue:)(Swift::String rawValue)
{
  return (SiriInferenceFlow::ContactInferenceSource_optional)sub_2250BE89C();
}

uint64_t sub_2250BE89C()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = OUTLINED_FUNCTION_3_2();
  char v3 = 6;
  if (v1 < 6) {
    char v3 = v1;
  }
  char *v0 = v3;
  return result;
}

uint64_t ContactInferenceSource.rawValue.getter()
{
  uint64_t result = 0x747369486C6C6163;
  switch(*v0)
  {
    case 1:
    case 3:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 2:
      uint64_t result = 1818845549;
      break;
    case 4:
      uint64_t result = 0x707041726568746FLL;
      break;
    case 5:
      uint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250BE998(unsigned __int8 *a1, char *a2)
{
  return sub_2250B91F0(*a1, *a2);
}

uint64_t sub_2250BE9A4()
{
  return sub_2250B9488();
}

uint64_t sub_2250BE9AC(uint64_t a1)
{
  return sub_2250B9C04(a1, *v1);
}

uint64_t sub_2250BE9B4(uint64_t a1)
{
  return sub_2250B9D14(a1, *v1);
}

SiriInferenceFlow::ContactInferenceSource_optional sub_2250BE9BC(Swift::String *a1)
{
  return ContactInferenceSource.init(rawValue:)(*a1);
}

uint64_t sub_2250BE9C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactInferenceSource.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriInferenceFlow::ContactResolutionVerb_optional __swiftcall ContactResolutionVerb.init(rawValue:)(Swift::String rawValue)
{
  OUTLINED_FUNCTION_4_3();
  sub_225107670();
  result.value = OUTLINED_FUNCTION_3_2();
  char v4 = 7;
  if (v2 < 7) {
    char v4 = v2;
  }
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_2250BEA3C(unsigned __int8 *a1, char *a2)
{
  return sub_2250B8C80(*a1, *a2);
}

uint64_t sub_2250BEA48()
{
  return sub_2250B94A0();
}

uint64_t sub_2250BEA50(uint64_t a1)
{
  return sub_2250B9908(a1, *v1);
}

uint64_t sub_2250BEA58(uint64_t a1)
{
  return sub_2250B9E28(a1, *v1);
}

SiriInferenceFlow::ContactResolutionVerb_optional sub_2250BEA60(Swift::String *a1)
{
  return ContactResolutionVerb.init(rawValue:)(*a1);
}

uint64_t sub_2250BEA6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactResolutionVerb.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriInferenceFlow::ContactResolutionCommonKeys_optional __swiftcall ContactResolutionCommonKeys.init(rawValue:)(Swift::String rawValue)
{
  return (SiriInferenceFlow::ContactResolutionCommonKeys_optional)sub_2250BEC44();
}

uint64_t ContactResolutionCommonKeys.rawValue.getter()
{
  uint64_t v1 = 0x6E6F74747562;
  if (*v0 != 1) {
    uint64_t v1 = 0x7865646E69;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x49746361746E6F63;
  }
}

uint64_t sub_2250BEAF8(unsigned __int8 *a1, char *a2)
{
  return sub_2250B86E4(*a1, *a2);
}

uint64_t sub_2250BEB04()
{
  return sub_2250B94F8(*v0);
}

uint64_t sub_2250BEB0C(uint64_t a1)
{
  return sub_2250B9604(a1, *v1);
}

uint64_t sub_2250BEB14(uint64_t a1)
{
  return sub_2250B9E70(a1, *v1);
}

SiriInferenceFlow::ContactResolutionCommonKeys_optional sub_2250BEB1C(Swift::String *a1)
{
  return ContactResolutionCommonKeys.init(rawValue:)(*a1);
}

uint64_t sub_2250BEB28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactResolutionCommonKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL static ContactResolutionPatternError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ContactResolutionPatternError.hash(into:)()
{
  return sub_225107860();
}

uint64_t ContactResolutionPatternError.hashValue.getter()
{
  return sub_225107880();
}

uint64_t sub_2250BEBE4()
{
  return sub_225107880();
}

SiriInferenceFlow::DomainDialog_optional __swiftcall DomainDialog.init(rawValue:)(Swift::String rawValue)
{
  return (SiriInferenceFlow::DomainDialog_optional)sub_2250BEC44();
}

uint64_t sub_2250BEC44()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t result = OUTLINED_FUNCTION_3_2();
  char v3 = 3;
  if (v1 < 3) {
    char v3 = v1;
  }
  char *v0 = v3;
  return result;
}

uint64_t DomainDialog.rawValue.getter()
{
  uint64_t v1 = 0x656D697465636166;
  if (*v0 != 1) {
    uint64_t v1 = 0x746C7561666564;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x736567617373656DLL;
  }
}

unint64_t sub_2250BECE0()
{
  unint64_t result = qword_2680C0C08;
  if (!qword_2680C0C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C08);
  }
  return result;
}

unint64_t sub_2250BED30()
{
  unint64_t result = qword_2680C0C10;
  if (!qword_2680C0C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C10);
  }
  return result;
}

unint64_t sub_2250BED80()
{
  unint64_t result = qword_2680C0C18;
  if (!qword_2680C0C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C18);
  }
  return result;
}

unint64_t sub_2250BEDD0()
{
  unint64_t result = qword_2680C0C20;
  if (!qword_2680C0C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C20);
  }
  return result;
}

unint64_t sub_2250BEE20()
{
  unint64_t result = qword_2680C0C28;
  if (!qword_2680C0C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C28);
  }
  return result;
}

unint64_t sub_2250BEE70()
{
  unint64_t result = qword_2680C0C30;
  if (!qword_2680C0C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C30);
  }
  return result;
}

unint64_t sub_2250BEEC0()
{
  unint64_t result = qword_2680C0C38;
  if (!qword_2680C0C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C38);
  }
  return result;
}

uint64_t sub_2250BEF0C()
{
  return sub_2250B9114();
}

unint64_t sub_2250BEF1C()
{
  unint64_t result = qword_2680C0C40;
  if (!qword_2680C0C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C40);
  }
  return result;
}

uint64_t sub_2250BEF68()
{
  return sub_2250B9504(*v0);
}

uint64_t sub_2250BEF70(uint64_t a1)
{
  return sub_2250B9B88(a1, *v1);
}

uint64_t sub_2250BEF78(uint64_t a1)
{
  return sub_2250B9D2C(a1, *v1);
}

SiriInferenceFlow::DomainDialog_optional sub_2250BEF80(Swift::String *a1)
{
  return DomainDialog.init(rawValue:)(*a1);
}

uint64_t sub_2250BEF8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DomainDialog.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2250BEFB4()
{
  return sub_2251072C0();
}

uint64_t sub_2250BF014()
{
  return sub_2251072B0();
}

uint64_t getEnumTagSinglePayload for ContactResolutionPatternID(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF6)
  {
    if (a2 + 10 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 10) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v5 = v6 - 11;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContactResolutionPatternID(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x2250BF1B8);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContactResolutionPatternID()
{
}

uint64_t getEnumTagSinglePayload for ContactResolutionCatId(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContactResolutionCatId(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x2250BF340);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContactResolutionCatId()
{
}

void type metadata accessor for ContactResolutionIntentType()
{
}

unsigned char *_s17SiriInferenceFlow27ContactResolutionIntentTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250BF454);
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

void type metadata accessor for ContactInferenceSource()
{
}

uint64_t getEnumTagSinglePayload for ContactResolutionVerb(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContactResolutionVerb(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2250BF5DCLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContactResolutionVerb()
{
}

void type metadata accessor for ContactResolutionCommonKeys()
{
}

uint64_t getEnumTagSinglePayload for ContactResolutionPatternError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContactResolutionPatternError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2250BF778);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContactResolutionPatternError()
{
}

uint64_t getEnumTagSinglePayload for SiriInferenceFlowsViewDataModels.ViewData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17SiriInferenceFlow27ContactResolutionCommonKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250BF900);
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

void type metadata accessor for DomainDialog()
{
}

unint64_t sub_2250BF934()
{
  unint64_t result = qword_2680C0C48;
  if (!qword_2680C0C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C48);
  }
  return result;
}

uint64_t sub_2250BF980(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_2250BFA08(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250BFAD4);
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

void type metadata accessor for HandleLabelType()
{
}

unint64_t sub_2250BFB0C()
{
  unint64_t result = qword_2680C0C50;
  if (!qword_2680C0C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0C50);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_225107670();
}

char *sub_2250BFBB4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t result = sub_2250CE480(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v9;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x22A62C790](v5, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v6 = sub_2250B7D44();
      swift_release();
      unint64_t v8 = *(void *)(v9 + 16);
      unint64_t v7 = *(void *)(v9 + 24);
      if (v8 >= v7 >> 1) {
        sub_2250CE480((char *)(v7 > 1), v8 + 1, 1);
      }
      ++v5;
      *(void *)(v9 + 16) = v8 + 1;
      *(void *)(v9 + 8 * v8 + 32) = v6;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    OUTLINED_FUNCTION_78();
    uint64_t v2 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t ContactResolutionPatternGenerator.__allocating_init(appBundleId:globals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  ContactResolutionPatternGenerator.init(appBundleId:globals:)(a1, a2, a3);
  return v6;
}

void *ContactResolutionPatternGenerator.init(appBundleId:globals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_225106640();
  sub_2250BFD9C(&v5, (uint64_t)(v3 + 5));
  return v3;
}

uint64_t sub_2250BFD9C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *ContactResolutionPatternGenerator.__allocating_init(appBundleId:globals:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  unint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  sub_2250BFD9C(a4, (uint64_t)(v8 + 5));
  return v8;
}

void *ContactResolutionPatternGenerator.init(appBundleId:globals:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  sub_2250BFD9C(a4, (uint64_t)(v4 + 5));
  return v4;
}

uint64_t static ContactResolutionPatternGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:globals:)(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 136) = a7;
  *(void *)(v8 + 144) = v7;
  *(void *)(v8 + 120) = a5;
  *(void *)(v8 + 128) = a6;
  *(void *)(v8 + 104) = a3;
  *(void *)(v8 + 112) = a4;
  *(void *)(v8 + 96) = a1;
  *(unsigned char *)(v8 + 185) = *a2;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250BFE74);
}

uint64_t sub_2250BFE74()
{
  OUTLINED_FUNCTION_12_1();
  char v1 = *(unsigned char *)(v0 + 185);
  long long v2 = *(void **)(v0 + 136);
  *(void *)(v0 + 152) = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v2);
  *(unsigned char *)(v0 + 184) = v1;
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v3;
  *long long v3 = v0;
  v3[1] = sub_2250BFF40;
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 96);
  return ContactResolutionPatternGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)(v8, v0 + 184, v6, v7, v4, v5);
}

uint64_t sub_2250BFF40()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 168) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 176) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C0034()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_73();
  return v1(v0);
}

uint64_t sub_2250C008C()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t ContactResolutionPatternGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 288) = a6;
  *(void *)(v7 + 296) = v6;
  *(void *)(v7 + 272) = a4;
  *(void *)(v7 + 280) = a5;
  *(void *)(v7 + 256) = a1;
  *(void *)(v7 + 264) = a3;
  OUTLINED_FUNCTION_2_1();
  *(void *)(v7 + 304) = v8;
  *(unsigned char *)(v7 + 369) = *v9;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C0124);
}

uint64_t sub_2250C0124()
{
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2251070F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2680C5BD8);
  uint64_t v3 = sub_2251070D0();
  os_log_type_t v4 = sub_2251073A0();
  if (OUTLINED_FUNCTION_11_1(v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_46_0(v5);
    OUTLINED_FUNCTION_36_0(&dword_2250AF000, v3, v6, "ContactResolutionPatternGenerator::generateYesNoClarificationContactName");
    OUTLINED_FUNCTION_7_1();
  }
  uint64_t v7 = *(void *)(v0 + 296);
  uint64_t v8 = *(void **)(v0 + 256);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_61(inited, (__n128)xmmword_22510C2B0);
  id v10 = v8;
  sub_2250C66C8();
  swift_bridgeObjectRelease();
  uint64_t v11 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_61(v11, (__n128)xmmword_22510C2B0);
  uint64_t v12 = (void *)(v7 + 40);
  id v13 = v10;
  sub_2250CAAD4(v51);
  uint64_t v14 = (void *)swift_task_alloc();
  unint64_t v15 = OUTLINED_FUNCTION_50(v14);
  uint64_t v16 = sub_2250C6300(v15, (void (*)(unint64_t, id))sub_2250C67E0);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t result = swift_task_dealloc();
  if ((v16 & 0xC000000000000001) != 0)
  {
    uint64_t v18 = MEMORY[0x22A62C790](0, v16);
  }
  else
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    uint64_t v18 = *(void *)(v16 + 32);
    swift_retain();
  }
  OUTLINED_FUNCTION_76();
  *(void *)(v0 + 312) = v18;
  uint64_t v20 = *(void *)(v0 + 264);
  uint64_t v19 = *(void *)(v0 + 272);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t v21 = swift_initStackObject();
  *(_OWORD *)(v21 + 16) = xmmword_22510BA10;
  uint64_t v22 = MEMORY[0x263F8D310];
  *(void *)(v21 + 32) = v1;
  *(void *)(v21 + 40) = 0xE600000000000000;
  *(void *)(v21 + 72) = v22;
  OUTLINED_FUNCTION_16_1(v21);
  uint64_t v23 = sub_225107170();
  sub_2250C72B8(v20, v19, v23, v12);
  *(void *)(v0 + 320) = v24;
  os_log_type_t v25 = v24;
  uint64_t v26 = *(void *)(v0 + 280);
  uint64_t v50 = *(void *)(v0 + 288);
  swift_bridgeObjectRelease();
  id v27 = (__n128 *)swift_initStackObject();
  id v28 = OUTLINED_FUNCTION_52(v27, (__n128)xmmword_22510BA10);
  v28[2].n128_u64[1] = 0xE600000000000000;
  v28[4].n128_u64[1] = MEMORY[0x263F8D310];
  OUTLINED_FUNCTION_48();
  *(void *)(v29 + 48) = v30;
  *(void *)(v29 + 56) = v31;
  uint64_t v32 = sub_225107170();
  sub_2250C72B8(v26, v50, v32, v12);
  *(void *)(v0 + 328) = v33;
  swift_bridgeObjectRelease();
  uint64_t v34 = swift_retain();
  *(void *)(v0 + 336) = sub_2250BC90C(v34, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v42 = sub_2251070D0();
  os_log_type_t v43 = sub_2251073A0();
  if (OUTLINED_FUNCTION_30_0(v43))
  {
    uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_23_1(v44);
    OUTLINED_FUNCTION_22_1(&dword_2250AF000, v42, v25, "ContactResolutionPatternGenerator::generateYesNoClarificationContactName - Creating YesNoClarification::ContactName View");
    OUTLINED_FUNCTION_7_1();
  }

  *(unsigned char *)(v0 + 368) = 0;
  uint64_t v45 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v45;
  *uint64_t v45 = v0;
  v45[1] = sub_2250C0558;
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_26_1();
  return sub_2250C0748(v46, v47, v48);
}

uint64_t sub_2250C0558()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 352) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 360) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C065C()
{
  OUTLINED_FUNCTION_5_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release_n();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 360);
  return v1(v2);
}

uint64_t sub_2250C06D4()
{
  OUTLINED_FUNCTION_5_3();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t sub_2250C0748(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = a3;
  *(void *)(v4 + 72) = v3;
  *(void *)(v4 + 56) = a2;
  uint64_t v6 = sub_2251070C0();
  *(void *)(v4 + 80) = v6;
  *(void *)(v4 + 88) = *(void *)(v6 - 8);
  *(void *)(v4 + 96) = swift_task_alloc();
  *(unsigned char *)(v4 + 136) = *a1;
  return MEMORY[0x270FA2498](sub_2250C0818, 0, 0);
}

uint64_t sub_2250C0818()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  *(void *)(v0 + 104) = v3;
  unint64_t v4 = 0xD000000000000025;
  unint64_t v5 = 0x8000000225107FF0;
  id v6 = v3;
  switch(v1)
  {
    case 1:
      unint64_t v4 = 0xD00000000000002ALL;
      uint64_t v7 = "contact#DetailedDisambiguationContactNames";
      goto LABEL_13;
    case 2:
      uint64_t v8 = "contact#SimpleDisambiguationContactLabels";
      goto LABEL_9;
    case 3:
      unint64_t v4 = 0xD00000000000002ELL;
      uint64_t v7 = "contact#SimpleDisambiguationAlternativeHandles";
      goto LABEL_13;
    case 4:
      unint64_t v4 = 0xD000000000000027;
      uint64_t v7 = "contact#SimpleDisambiguationMixedLabels";
      goto LABEL_13;
    case 5:
      unint64_t v4 = 0xD000000000000031;
      uint64_t v7 = "contact#YesNoClarificationSingleAlternativeHandle";
      goto LABEL_13;
    case 6:
      unint64_t v4 = 0xD000000000000036;
      uint64_t v7 = "contact#DetailedDisambiguationMultipleHandlesSameLabel";
      goto LABEL_13;
    case 7:
      uint64_t v8 = "contact#DetailedDisambiguationMixedLabels";
LABEL_9:
      unint64_t v5 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v4 = 0xD000000000000029;
      break;
    case 8:
      unint64_t v4 = 0xD000000000000024;
      uint64_t v7 = "contact#OpenEndedClarificationTarget";
      goto LABEL_13;
    case 9:
      unint64_t v4 = 0xD000000000000034;
      uint64_t v7 = "contact#DetailedDisambiguationMixedLabelsNoWindowing";
      goto LABEL_13;
    case 10:
      unint64_t v4 = 0xD000000000000041;
      uint64_t v7 = "contact#DetailedDisambiguationMultipleHandlesSameLabelNoWindowing";
LABEL_13:
      unint64_t v5 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  *(void *)(v0 + 112) = v5;
  sub_225106EE0();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_2251070B0();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2250C0A58;
  uint64_t v10 = *(void *)(v0 + 96);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v12 = *(void *)(v0 + 64);
  return MEMORY[0x270F64F58](v6, v4, v5, v11, v12, v0 + 16, v10);
}

uint64_t sub_2250C0A58()
{
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_4_4();
  *unint64_t v4 = v3;
  uint64_t v5 = v3 + 16;
  id v6 = *(void **)(v2 + 104);
  *unint64_t v4 = *v1;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_49();
  v7();
  sub_2250C68F0(v5);
  if (!v0)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_55();
    __asm { BRAA            X2, X16 }
  }
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_55();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2250C0C38()
{
  OUTLINED_FUNCTION_5_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t static ContactResolutionPatternGenerator.generateDetailedDisambiguationContactNames(contacts:contactPickerDirectInvocationID:contactSelectionDirectInvocationID:windowedPaginationParameters:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[16] = a7;
  v8[17] = v7;
  v8[14] = a5;
  v8[15] = a6;
  v8[12] = a1;
  v8[13] = a4;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C0CB4);
}

uint64_t sub_2250C0CB4()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = (void *)v0[16];
  v0[18] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[19] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250C0D58;
  OUTLINED_FUNCTION_40_0();
  return ContactResolutionPatternGenerator.generateDetailedDisambiguationContactNames(contacts:contactSelectionDirectInvocationID:windowedPaginationParameters:)();
}

uint64_t sub_2250C0D58()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *id v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 160) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 168) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C0E4C()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 168);
  return v1(v2);
}

uint64_t sub_2250C0EAC()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationContactNames(contacts:contactPickerDirectInvocationID:contactSelectionDirectInvocationID:windowedPaginationParameters:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250C0FC4;
  return ContactResolutionPatternGenerator.generateDetailedDisambiguationContactNames(contacts:contactSelectionDirectInvocationID:windowedPaginationParameters:)();
}

uint64_t sub_2250C0FC4()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationContactNames(contacts:contactSelectionDirectInvocationID:windowedPaginationParameters:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[5] = v2;
  v1[6] = v0;
  v1[3] = v3;
  v1[4] = v4;
  v1[2] = v5;
  OUTLINED_FUNCTION_2_1();
  v1[7] = v6;
  uint64_t v7 = type metadata accessor for ContactResolutionDisambiguationParameters(0);
  v1[8] = v7;
  OUTLINED_FUNCTION_9(v7);
  v1[9] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2250C1124()
{
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2251070F0();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_33(v1, (uint64_t)qword_2680C5BD8);
  os_log_type_t v3 = sub_2251073A0();
  if (OUTLINED_FUNCTION_17_0(v3))
  {
    uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_23_1(v4);
    OUTLINED_FUNCTION_13_1(&dword_2250AF000, v5, v6, "ContactResolutionPatternGenerator::generateDetailedDisambiguationContactNames");
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v7 = *(void *)(v0 + 16);

  if (v7 >> 62)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v34 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    uint64_t v8 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 24);
    uint64_t v9 = *(void *)(v0 + 32);
    unint64_t v11 = *(void *)(v0 + 16);
    sub_2250C66C8();
    sub_2250C74E8();
    char v43 = v12;
    uint64_t v13 = v8 + 40;
    uint64_t v14 = *(void *)(v8 + 16);
    uint64_t v17 = v8 + 24;
    uint64_t v15 = *(void *)(v8 + 24);
    uint64_t v16 = *(void *)(v17 + 8);
    uint64_t v18 = sub_2250CAAD4(v11);
    uint64_t v19 = (void *)swift_task_alloc();
    v19[2] = v13;
    v19[3] = v10;
    v19[4] = v9;
    v19[5] = v18;
    v19[6] = v16;
    v19[7] = v14;
    v19[8] = v15;
    unint64_t v20 = swift_bridgeObjectRetain();
    unint64_t v21 = sub_2250C6300(v20, (void (*)(unint64_t, id))sub_2250C67E0);
    uint64_t v22 = v16;
    uint64_t v24 = *(int **)(v0 + 64);
    uint64_t v23 = *(unint64_t **)(v0 + 72);
    uint64_t v25 = *(void *)(v0 + 40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    LOBYTE(v18) = sub_2250C7BD0(v21);
    sub_2250BDDA8(v25, (uint64_t)v23 + v24[5]);
    *uint64_t v23 = v21;
    *((unsigned char *)v23 + v24[6]) = v43 & 1;
    *((unsigned char *)v23 + v24[7]) = v18 & 1;
    uint64_t v26 = sub_2250BCABC();
    *(void *)(v0 + 80) = v26;
    uint64_t v27 = v26;
    id v28 = sub_2251070D0();
    os_log_type_t v29 = sub_2251073A0();
    if (OUTLINED_FUNCTION_30_0(v29))
    {
      uint64_t v30 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v30);
      OUTLINED_FUNCTION_10_1(&dword_2250AF000, v28, v31, "ContactResolutionPatternGenerator::generateDetailedDisambiguationContactNames - Creating DetailedDisambiguation::ContactName View");
      OUTLINED_FUNCTION_7_1();
    }

    *(unsigned char *)(v0 + 112) = 1;
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_2250C14C8;
    return sub_2250C0748((unsigned char *)(v0 + 112), v27, v22);
  }
  uint64_t v35 = (void *)sub_2251070D0();
  os_log_type_t v36 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v36))
  {
    uint64_t v37 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v37);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v38, v39, "ContactResolutionPatternGenerator::generateDetailedDisambiguationContactNames - Cannot create view with empty input array!");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250BDE10();
  uint64_t v40 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v40, v41);
  swift_task_dealloc();
  uint64_t v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42();
}

uint64_t sub_2250C14C8()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 96) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 104) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C15CC()
{
  OUTLINED_FUNCTION_5_3();
  sub_2250C67F8(*(void *)(v0 + 72), type metadata accessor for ContactResolutionDisambiguationParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 104);
  return v1(v2);
}

uint64_t sub_2250C164C()
{
  OUTLINED_FUNCTION_5_3();
  sub_2250C67F8(*(void *)(v0 + 72), type metadata accessor for ContactResolutionDisambiguationParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v1();
}

uint64_t static ContactResolutionPatternGenerator.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C16E4);
}

uint64_t sub_2250C16E4()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = (void *)v0[15];
  v0[17] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250C1788;
  OUTLINED_FUNCTION_41_0();
  return ContactResolutionPatternGenerator.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:)();
}

uint64_t sub_2250C1788()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 152) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 160) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t ContactResolutionPatternGenerator.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[33] = v2;
  v1[34] = v0;
  v1[31] = v3;
  v1[32] = v4;
  OUTLINED_FUNCTION_2_1();
  v1[35] = v5;
  uint64_t v6 = sub_2251064A0();
  v1[36] = v6;
  OUTLINED_FUNCTION_1_3(v6);
  v1[37] = v7;
  v1[38] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2250C1914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_59();
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2251070F0();
  uint64_t v18 = (void *)OUTLINED_FUNCTION_33(v17, (uint64_t)qword_2680C5BD8);
  os_log_type_t v19 = sub_2251073A0();
  if (OUTLINED_FUNCTION_17_0(v19))
  {
    unint64_t v20 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_23_1(v20);
    OUTLINED_FUNCTION_13_1(&dword_2250AF000, v21, v22, "ContactResolutionPatternGenerator::generateSimpleDisambiguationUniqueLabels");
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v23 = *(void *)(v16 + 248);

  if (v23 >> 62)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v58 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v58) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    uint64_t v25 = *(void *)(v16 + 264);
    uint64_t v24 = *(void **)(v16 + 272);
    unint64_t v27 = *(void *)(v16 + 248);
    uint64_t v26 = *(void *)(v16 + 256);
    sub_2250C66C8();
    id v28 = v24 + 5;
    uint64_t v29 = v24[2];
    uint64_t v32 = v24 + 3;
    uint64_t v30 = v24[3];
    uint64_t v31 = v32[1];
    uint64_t v33 = sub_2250CAAD4(v27);
    uint64_t v34 = (void *)swift_task_alloc();
    v34[2] = v28;
    void v34[3] = v26;
    v34[4] = v25;
    v34[5] = v33;
    v34[6] = v31;
    v34[7] = v29;
    v34[8] = v30;
    unint64_t v35 = swift_bridgeObjectRetain();
    sub_2250C6300(v35, (void (*)(unint64_t, id))sub_2250C67E0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_2250CC008();
    if (v37) {
      goto LABEL_11;
    }
    if (v36 == 2)
    {
      uint64_t v74 = 1;
      goto LABEL_13;
    }
    if (v36 != 1) {
LABEL_11:
    }
      uint64_t v74 = 0;
    else {
      uint64_t v74 = 0x100000000;
    }
LABEL_13:
    uint64_t v39 = *(void *)(v16 + 296);
    uint64_t v38 = *(void *)(v16 + 304);
    uint64_t v40 = *(void *)(v16 + 288);
    __swift_project_boxed_opaque_existential_1(v28, *(void *)(*(void *)(v16 + 272) + 64));
    sub_225106490();
    char v41 = sub_2251061C0();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    unint64_t v42 = swift_bridgeObjectRetain();
    char v43 = sub_2250BFBB4(v42);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_45_0(inited, (__n128)xmmword_22510C2C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
    inited[3].n128_u64[0] = (unint64_t)v43;
    OUTLINED_FUNCTION_19_0();
    inited[4].n128_u64[1] = v45;
    inited[5].n128_u64[0] = v46;
    inited[5].n128_u64[1] = 0xE800000000000000;
    unint64_t v47 = MEMORY[0x263F8D4F8];
    inited[6].n128_u8[0] = (v41 & 1) == 0;
    inited[7].n128_u64[1] = v47;
    inited[8].n128_u64[0] = 0xD000000000000013;
    inited[8].n128_u64[1] = 0x8000000225108C20;
    inited[9].n128_u8[0] = v74;
    inited[10].n128_u64[1] = v47;
    inited[11].n128_u64[0] = 0xD000000000000013;
    inited[11].n128_u64[1] = 0x8000000225108C40;
    inited[13].n128_u64[1] = v47;
    inited[12].n128_u8[0] = BYTE4(v74);
    *(void *)(v16 + 312) = sub_225107170();
    swift_bridgeObjectRelease();
    uint64_t v48 = sub_2251070D0();
    os_log_type_t v49 = sub_2251073A0();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_46_0(v50);
      OUTLINED_FUNCTION_36_0(&dword_2250AF000, v48, v51, "ContactResolutionPatternGenerator::generateSimpleDisambiguationUniqueLabels - Creating SimpleDisambiguation::UniqueLabels View");
      OUTLINED_FUNCTION_7_1();
    }

    *(unsigned char *)(v16 + 336) = 2;
    uint64_t v52 = (void *)swift_task_alloc();
    *(void *)(v16 + 320) = v52;
    *uint64_t v52 = v16;
    v52[1] = sub_2250C1D90;
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_21_1();
    return sub_2250C0748(v53, v54, v55);
  }
  uint64_t v59 = (void *)sub_2251070D0();
  os_log_type_t v60 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v60))
  {
    uint64_t v61 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v61);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v62, v63, "ContactResolutionPatternGenerator::generateSimpleDisambiguationUniqueLabels - Cannot create view with empty input array!");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250BDE10();
  uint64_t v64 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v64, v65);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_21_1();
  return v67(v66, v67, v68, v69, v70, v71, v72, v73, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_2250C1D90()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 328) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v10 = OUTLINED_FUNCTION_42_0();
    return v11(v10);
  }
}

uint64_t sub_2250C1EB4()
{
  OUTLINED_FUNCTION_5_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t static ContactResolutionPatternGenerator.generateSimpleDisambiguationAlternativeHandles(contacts:unavailableLabel:directInvocationID:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[17] = a6;
  v7[18] = v6;
  v7[15] = a4;
  v7[16] = a5;
  v7[13] = a2;
  v7[14] = a3;
  v7[12] = a1;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C1F34);
}

uint64_t sub_2250C1F34()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = (void *)v0[17];
  v0[19] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250BFF40;
  OUTLINED_FUNCTION_41_0();
  return ContactResolutionPatternGenerator.generateSimpleDisambiguationAlternativeHandles(contacts:unavailableLabel:directInvocationID:)();
}

uint64_t ContactResolutionPatternGenerator.generateSimpleDisambiguationAlternativeHandles(contacts:unavailableLabel:directInvocationID:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[11] = v2;
  v1[12] = v0;
  v1[9] = v3;
  v1[10] = v4;
  v1[7] = v5;
  v1[8] = v6;
  OUTLINED_FUNCTION_2_1();
  v1[13] = v7;
  uint64_t v8 = sub_2251064A0();
  v1[14] = v8;
  OUTLINED_FUNCTION_1_3(v8);
  v1[15] = v9;
  v1[16] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_2250C2078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_71();
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2251070F0();
  unint64_t v20 = (void *)OUTLINED_FUNCTION_33(v19, (uint64_t)qword_2680C5BD8);
  os_log_type_t v21 = sub_2251073A0();
  if (OUTLINED_FUNCTION_17_0(v21))
  {
    uint64_t v22 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_23_1(v22);
    OUTLINED_FUNCTION_13_1(&dword_2250AF000, v23, v24, "ContactResolutionPatternGenerator::generateSimpleDisambiguationAlternativeHandles");
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v25 = *(void *)(v18 + 56);

  sub_2250C66C8();
  if (v25 >> 62)
  {
    if (*(uint64_t *)(v18 + 56) < 0) {
      uint64_t v52 = *(void *)(v18 + 56);
    }
    else {
      uint64_t v52 = v25 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    sub_225107620();
    OUTLINED_FUNCTION_63();
    if (v52) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    sub_2250CC008();
    if (v27) {
      goto LABEL_11;
    }
    if (v26 == 2)
    {
      uint64_t v69 = 1;
      goto LABEL_12;
    }
    if (v26 != 1) {
LABEL_11:
    }
      uint64_t v69 = 0;
    else {
      uint64_t v69 = 0x100000000;
    }
LABEL_12:
    id v28 = *(void **)(v18 + 96);
    uint64_t v70 = *(void *)(v18 + 88);
    uint64_t v29 = *(void *)(v18 + 80);
    uint64_t v30 = v28 + 5;
    uint64_t v32 = v28[3];
    uint64_t v31 = v28[4];
    uint64_t v33 = v28[2];
    uint64_t v34 = sub_2250CAAD4(*(void *)(v18 + 56));
    unint64_t v35 = (void *)swift_task_alloc();
    v35[2] = v30;
    v35[3] = v29;
    v35[4] = v70;
    v35[5] = v34;
    v35[6] = v31;
    v35[7] = v33;
    v35[8] = v32;
    unint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = sub_2250C6300(v36, (void (*)(unint64_t, id))sub_2250C67E0);
    uint64_t v39 = *(void *)(v18 + 120);
    uint64_t v38 = *(void *)(v18 + 128);
    uint64_t v40 = *(void *)(v18 + 112);
    uint64_t v41 = *(void *)(v18 + 96);
    uint64_t v42 = *(void *)(v18 + 72);
    uint64_t v68 = *(void *)(v18 + 64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    __swift_project_boxed_opaque_existential_1(v30, *(void *)(v41 + 64));
    sub_225106490();
    LOBYTE(v30) = sub_2251061C0();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    *(void *)(v18 + 16) = v37;
    *(unsigned char *)(v18 + 24) = (v30 & 1) == 0;
    *(void *)(v18 + 32) = v68;
    *(void *)(v18 + 40) = v42;
    *(unsigned char *)(v18 + 48) = v69;
    *(unsigned char *)(v18 + 49) = BYTE4(v69);
    swift_bridgeObjectRetain();
    *(void *)(v18 + 136) = sub_2250BCF3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v43 = sub_2251070D0();
    os_log_type_t v44 = sub_2251073A0();
    if (OUTLINED_FUNCTION_30_0(v44))
    {
      unint64_t v45 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_23_1(v45);
      OUTLINED_FUNCTION_22_1(&dword_2250AF000, v43, (os_log_type_t)v41, "ContactResolutionPatternGenerator::generateSimpleDisambiguationAlternativeHandles - Creating SimpleDisambiguation::AlternativeHandles View");
      OUTLINED_FUNCTION_7_1();
    }

    *(unsigned char *)(v18 + 50) = 3;
    unint64_t v46 = (void *)swift_task_alloc();
    *(void *)(v18 + 144) = v46;
    void *v46 = v18;
    v46[1] = sub_2250C2478;
    OUTLINED_FUNCTION_14_1();
    return sub_2250C0748(v47, v48, v49);
  }
  uint64_t v53 = (void *)sub_2251070D0();
  os_log_type_t v54 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v54))
  {
    uint64_t v55 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v55);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v56, v57, "ContactResolutionPatternGenerator::generateSimpleDisambiguationAlternativeHandles - Cannot create view with empty input array!");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250BDE10();
  uint64_t v58 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v58, v59);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_14_1();
  return v61(v60, v61, v62, v63, v64, v65, v66, v67, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_2250C2478()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v10 = OUTLINED_FUNCTION_42_0();
    return v11(v10);
  }
}

uint64_t sub_2250C259C()
{
  OUTLINED_FUNCTION_5_3();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t static ContactResolutionPatternGenerator.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C2618);
}

uint64_t sub_2250C2618()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = (void *)v0[15];
  v0[17] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250C26BC;
  OUTLINED_FUNCTION_41_0();
  return ContactResolutionPatternGenerator.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:)();
}

uint64_t sub_2250C26BC()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 152) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 160) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C27B0()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 160);
  return v1(v2);
}

uint64_t sub_2250C2810()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[33] = v2;
  v1[34] = v0;
  v1[31] = v3;
  v1[32] = v4;
  OUTLINED_FUNCTION_2_1();
  v1[35] = v5;
  uint64_t v6 = sub_2251064A0();
  v1[36] = v6;
  OUTLINED_FUNCTION_1_3(v6);
  v1[37] = v7;
  v1[38] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2250C2904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_71();
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_2251070F0();
  os_log_type_t v21 = (void *)OUTLINED_FUNCTION_33(v20, (uint64_t)qword_2680C5BD8);
  os_log_type_t v22 = sub_2251073A0();
  if (OUTLINED_FUNCTION_17_0(v22))
  {
    uint64_t v23 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_23_1(v23);
    OUTLINED_FUNCTION_13_1(&dword_2250AF000, v24, v25, "ContactResolutionPatternGenerator::generateSimpleDisambiguationMixedLabels");
    OUTLINED_FUNCTION_7_1();
  }
  uint64_t v26 = *(void *)(v18 + 272);

  char v27 = (void *)(v26 + 40);
  sub_2250C7CC4((void *)(v26 + 40));
  if (*(void *)(v18 + 248) >> 62)
  {
    OUTLINED_FUNCTION_39_0();
    uint64_t v67 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v67) {
      goto LABEL_11;
    }
  }
  else
  {
    OUTLINED_FUNCTION_70();
    if (v19)
    {
LABEL_11:
      uint64_t v37 = *(void **)(v18 + 272);
      uint64_t v76 = *(void *)(v18 + 264);
      unint64_t v38 = *(void *)(v18 + 248);
      uint64_t v39 = *(void *)(v18 + 256);
      sub_2250C66C8();
      uint64_t v40 = v37[4];
      uint64_t v41 = v37[2];
      uint64_t v42 = v37[3];
      uint64_t v43 = sub_2250CAAD4(v38);
      os_log_type_t v44 = (void *)swift_task_alloc();
      void v44[2] = v27;
      v44[3] = v39;
      v44[4] = v76;
      v44[5] = v43;
      v44[6] = v40;
      v44[7] = v41;
      v44[8] = v42;
      unint64_t v45 = swift_bridgeObjectRetain();
      sub_2250C6300(v45, (void (*)(unint64_t, id))sub_2250C67E0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      sub_2250CC008();
      if (v47) {
        goto LABEL_15;
      }
      if (v46 == 2)
      {
        uint64_t v75 = 1;
        goto LABEL_17;
      }
      if (v46 != 1) {
LABEL_15:
      }
        uint64_t v75 = 0;
      else {
        uint64_t v75 = 0x100000000;
      }
LABEL_17:
      uint64_t v48 = *(void *)(v18 + 296);
      uint64_t v49 = *(void *)(v18 + 304);
      uint64_t v50 = *(void *)(v18 + 288);
      __swift_project_boxed_opaque_existential_1(v27, *(void *)(*(void *)(v18 + 272) + 64));
      sub_225106490();
      char v51 = sub_2251061C0();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
      unint64_t v52 = swift_bridgeObjectRetain();
      uint64_t v53 = sub_2250BFBB4(v52);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
      uint64_t inited = (__n128 *)swift_initStackObject();
      OUTLINED_FUNCTION_45_0(inited, (__n128)xmmword_22510C2C0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
      inited[3].n128_u64[0] = (unint64_t)v53;
      OUTLINED_FUNCTION_19_0();
      inited[4].n128_u64[1] = v55;
      inited[5].n128_u64[0] = v56;
      inited[5].n128_u64[1] = 0xE800000000000000;
      unint64_t v57 = MEMORY[0x263F8D4F8];
      inited[6].n128_u8[0] = (v51 & 1) == 0;
      inited[7].n128_u64[1] = v57;
      inited[8].n128_u64[0] = 0xD000000000000013;
      inited[8].n128_u64[1] = 0x8000000225108C20;
      inited[9].n128_u8[0] = v75;
      inited[10].n128_u64[1] = v57;
      inited[11].n128_u64[0] = 0xD000000000000013;
      inited[11].n128_u64[1] = 0x8000000225108C40;
      inited[13].n128_u64[1] = v57;
      inited[12].n128_u8[0] = BYTE4(v75);
      *(void *)(v18 + 312) = sub_225107170();
      swift_bridgeObjectRelease();
      uint64_t v58 = sub_2251070D0();
      os_log_type_t v59 = sub_2251073A0();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_46_0(v60);
        OUTLINED_FUNCTION_36_0(&dword_2250AF000, v58, v61, "ContactResolutionPatternGenerator::generateSimpleDisambiguationMixedLabels - Creating SimpleDisambiguation::MixedHandles View");
        OUTLINED_FUNCTION_7_1();
      }

      *(unsigned char *)(v18 + 336) = 4;
      uint64_t v62 = (void *)swift_task_alloc();
      *(void *)(v18 + 320) = v62;
      *uint64_t v62 = v18;
      v62[1] = sub_2250C1D90;
      OUTLINED_FUNCTION_14_1();
      return sub_2250C0748(v63, v64, v65);
    }
  }
  uint64_t v68 = (void *)sub_2251070D0();
  os_log_type_t v69 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v69))
  {
    uint64_t v70 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v70);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v71, v72, "ContactResolutionPatternGenerator::generateSimpleDisambiguationMixedLabels - Cannot create view with empty input array!");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250BDE10();
  uint64_t v73 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v73, v74);
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_1();
  return v29(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

#error "2250C2DB4: call analysis failed (funcsize=7)"

uint64_t sub_2250C2DD0()
{
  OUTLINED_FUNCTION_12_1();
  char v1 = *(unsigned char *)(v0 + 201);
  uint64_t v2 = *(void **)(v0 + 152);
  *(void *)(v0 + 168) = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v2);
  *(unsigned char *)(v0 + 200) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2250C2E88;
  OUTLINED_FUNCTION_38_0();
  return ContactResolutionPatternGenerator.generateAlternativeHandleView(contacts:unavailableLabel:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)();
}

uint64_t sub_2250C2E88()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 184) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 192) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C2F7C()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 192);
  return v1(v2);
}

uint64_t sub_2250C2FDC()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.generateAlternativeHandleView(contacts:unavailableLabel:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  *(void *)(v1 + 112) = v4;
  *(void *)(v1 + 120) = v0;
  *(void *)(v1 + 96) = v5;
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 80) = v7;
  *(void *)(v1 + 88) = v8;
  *(void *)(v1 + 64) = v9;
  *(void *)(v1 + 72) = v10;
  uint64_t v11 = sub_2251067A0();
  *(void *)(v1 + 128) = v11;
  OUTLINED_FUNCTION_1_3(v11);
  *(void *)(v1 + 136) = v12;
  *(void *)(v1 + 144) = OUTLINED_FUNCTION_20_1();
  uint64_t v13 = sub_2251068D0();
  *(void *)(v1 + 152) = v13;
  OUTLINED_FUNCTION_1_3(v13);
  *(void *)(v1 + 160) = v14;
  *(void *)(v1 + 168) = OUTLINED_FUNCTION_20_1();
  uint64_t v15 = sub_225106880();
  OUTLINED_FUNCTION_9(v15);
  *(void *)(v1 + 176) = OUTLINED_FUNCTION_20_1();
  uint64_t v16 = sub_225105F00();
  OUTLINED_FUNCTION_9(v16);
  *(void *)(v1 + 184) = OUTLINED_FUNCTION_20_1();
  uint64_t v17 = sub_225106860();
  *(void *)(v1 + 192) = v17;
  OUTLINED_FUNCTION_1_3(v17);
  *(void *)(v1 + 200) = v18;
  *(void *)(v1 + 208) = OUTLINED_FUNCTION_20_1();
  uint64_t v19 = sub_225106710();
  *(void *)(v1 + 216) = v19;
  OUTLINED_FUNCTION_1_3(v19);
  *(void *)(v1 + 224) = v20;
  *(void *)(v1 + 232) = OUTLINED_FUNCTION_20_1();
  uint64_t v21 = sub_2251066B0();
  *(void *)(v1 + 240) = v21;
  OUTLINED_FUNCTION_1_3(v21);
  *(void *)(v1 + 248) = v22;
  *(void *)(v1 + 256) = OUTLINED_FUNCTION_20_1();
  *(unsigned char *)(v1 + 313) = *v3;
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v23, v24, v25);
}

unint64_t sub_2250C31DC()
{
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2251070F0();
  uint64_t v3 = OUTLINED_FUNCTION_33(v2, (uint64_t)qword_2680C5BD8);
  os_log_type_t v4 = sub_2251073A0();
  if (os_log_type_enabled((os_log_t)v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v5);
    OUTLINED_FUNCTION_10_1(&dword_2250AF000, v3, v6, "ContactResolutionPatternGenerator::generateAlternativeHandleView");
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v7 = *(void *)(v0 + 64);

  if (!(v7 >> 62))
  {
    OUTLINED_FUNCTION_70();
    if (v3) {
      goto LABEL_7;
    }
LABEL_42:
    unint64_t v45 = (void *)sub_2251070D0();
    os_log_type_t v46 = sub_225107390();
    if (OUTLINED_FUNCTION_11_1(v46))
    {
      char v47 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v47);
      OUTLINED_FUNCTION_8_2(&dword_2250AF000, v48, v49, "ContactResolutionPatternGenerator::generateAlternativeHandleView - Cannot create view with empty input array!");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250BDE10();
    uint64_t v50 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_31_0(v50, v51);
LABEL_61:
    OUTLINED_FUNCTION_25_1();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_26_1();
    __asm { BRAA            X1, X16 }
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_225107620();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_42;
  }
LABEL_7:
  sub_2251066A0();
  sub_225106700();
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x22A62C790](0, *(void *)(v0 + 64));
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_47;
    }
    id v8 = *(id *)(*(void *)(v0 + 64) + 32);
  }
  sub_2250C64A8(v8);
  uint64_t v9 = *(void *)(v0 + 256);
  if (!v10)
  {
    uint64_t v19 = *(void *)(v0 + 240);
    uint64_t v20 = *(void *)(v0 + 248);
    uint64_t v22 = *(void *)(v0 + 224);
    uint64_t v21 = *(void *)(v0 + 232);
    uint64_t v23 = *(void *)(v0 + 216);
    sub_2250BDE10();
    uint64_t v24 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_72(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v9, v19);
    goto LABEL_61;
  }
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v76 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 160);
  uint64_t v15 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 136);
  uint64_t v77 = *(void *)(v0 + 152);
  uint64_t v78 = *(void *)(v0 + 128);
  sub_2251066F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0CC8);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22510BA10;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 16))(v1 + v18, v11, v76);
  sub_225105EF0();
  sub_225106870();
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v15, *MEMORY[0x263F6D438], v77);
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v16, *MEMORY[0x263F6D3E0], v78);
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v72 = v15;
  uint64_t v73 = v16;
  uint64_t v71 = v13;
  sub_225106850();
  uint64_t v3 = sub_225106690();
  OUTLINED_FUNCTION_49();
  v31(v26, v27, v28, v29, v30);
  swift_bridgeObjectRelease();
  if (!((unint64_t)v3 >> 62))
  {
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_15;
    }
LABEL_48:
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
LABEL_47:
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_225107620();
  swift_bridgeObjectRelease();
  if (!v52) {
    goto LABEL_48;
  }
LABEL_15:
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v33 = (id)MEMORY[0x22A62C790](0, v3);
  }
  else
  {
    uint64_t v32 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v32)
    {
      __break(1u);
      goto LABEL_53;
    }
    id v33 = *(id *)(v3 + 32);
  }
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  unint64_t result = sub_2250C6518(v34);
  *(void *)(v0 + 264) = result;
  if (!result)
  {
LABEL_49:
    uint64_t v53 = (void *)sub_2251070D0();
    os_log_type_t v54 = sub_225107390();
    if (OUTLINED_FUNCTION_11_1(v54))
    {
      unint64_t v55 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v55);
      uint64_t v58 = "ContactResolutionPatternGenerator::generateAlternativeHandleView - No matches found, unable to get handle";
LABEL_59:
      OUTLINED_FUNCTION_8_2(&dword_2250AF000, v56, v57, v58);
      OUTLINED_FUNCTION_7_1();
    }
LABEL_60:
    uint64_t v62 = *(void *)(v0 + 248);
    uint64_t v61 = *(void *)(v0 + 256);
    uint64_t v64 = *(void *)(v0 + 232);
    uint64_t v63 = *(void *)(v0 + 240);
    uint64_t v65 = *(void *)(v0 + 216);
    uint64_t v66 = *(void *)(v0 + 224);

    sub_2250BDE10();
    uint64_t v67 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_72(v67, v68);
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v65);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
    goto LABEL_61;
  }
  uint64_t v3 = result;
  uint64_t v32 = result & 0xFFFFFFFFFFFFFF8;
  uint64_t v1 = result >> 62;
  if (!(result >> 62))
  {
    id v36 = *(id *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v36) {
      goto LABEL_57;
    }
    goto LABEL_21;
  }
LABEL_53:
  if (v3 < 0) {
    id v36 = (id)v3;
  }
  else {
    id v36 = (id)v32;
  }
  swift_bridgeObjectRetain();
  sub_225107620();
  unint64_t result = OUTLINED_FUNCTION_63();
  if (!v36) {
    goto LABEL_57;
  }
LABEL_21:
  if ((v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    MEMORY[0x22A62C790](0, v3);
    OUTLINED_FUNCTION_63();
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v36 = *(id *)(v3 + 32);
  }
  id v37 = objc_msgSend(v36, sel_personHandle, v71, v72, v73, v74, v75);

  if (!v37)
  {
LABEL_57:
    swift_bridgeObjectRelease();
    uint64_t v53 = (void *)sub_2251070D0();
    os_log_type_t v59 = sub_225107390();
    if (OUTLINED_FUNCTION_11_1(v59))
    {
      uint64_t v60 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v60);
      uint64_t v58 = "ContactResolutionPatternGenerator::generateAlternativeHandleView - No handles found for matches";
      goto LABEL_59;
    }
    goto LABEL_60;
  }

  if (v1)
  {
    if (v3 < 0) {
      uint64_t v38 = v3;
    }
    else {
      uint64_t v38 = v3 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    sub_225107620();
    OUTLINED_FUNCTION_63();
  }
  else
  {
    uint64_t v38 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v38 < 2)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v41 = (id)MEMORY[0x22A62C790](0, v3);
    }
    else {
      id v41 = *(id *)(v3 + 32);
    }
    *(void *)(v0 + 288) = v41;
    char v42 = *(unsigned char *)(v0 + 313);
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + 312) = v42;
    uint64_t v43 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v43;
    *uint64_t v43 = v0;
    v43[1] = sub_2250C3B68;
    OUTLINED_FUNCTION_26_1();
    return ContactResolutionPatternGenerator.generateYesNoClarificationSingleAlternativeHandle(contact:unavailableLabel:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)();
  }
  else
  {
    uint64_t v39 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v39;
    *uint64_t v39 = v0;
    v39[1] = sub_2250C3978;
    OUTLINED_FUNCTION_26_1();
    return ContactResolutionPatternGenerator.generateSimpleDisambiguationAlternativeHandles(contacts:unavailableLabel:directInvocationID:)();
  }
}

uint64_t sub_2250C3978()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  v2[2] = v1;
  v2[3] = v4;
  v2[4] = v0;
  *uint64_t v3 = *v1;
  v2[35] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2250C3AA8()
{
  uint64_t v0 = OUTLINED_FUNCTION_24_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_57();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = swift_task_dealloc();
  uint64_t v12 = OUTLINED_FUNCTION_74(v4, v5, v6, v7, v8, v9, v10, v11, v15);
  return v13(v12);
}

uint64_t sub_2250C3B68()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 56) = v0;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v7 = v6;
  *(void *)(v3 + 304) = v0;
  swift_task_dealloc();

  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2250C3C60()
{
  uint64_t v0 = OUTLINED_FUNCTION_24_1();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_57();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = swift_task_dealloc();
  uint64_t v12 = OUTLINED_FUNCTION_74(v4, v5, v6, v7, v8, v9, v10, v11, v15);
  return v13(v12);
}

void sub_2250C3D20()
{
  OUTLINED_FUNCTION_49();
  v0();
  uint64_t v1 = OUTLINED_FUNCTION_56();
  v2(v1);
  OUTLINED_FUNCTION_25_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_55();
  __asm { BRAA            X1, X16 }
}

void sub_2250C3DDC()
{
  OUTLINED_FUNCTION_49();
  v0();
  uint64_t v1 = OUTLINED_FUNCTION_56();
  v2(v1);
  OUTLINED_FUNCTION_25_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_55();
  __asm { BRAA            X1, X16 }
}

uint64_t ContactResolutionPatternGenerator.generateYesNoClarificationSingleAlternativeHandle(contact:unavailableLabel:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  *(void *)(v1 + 304) = v4;
  *(void *)(v1 + 312) = v0;
  *(void *)(v1 + 288) = v5;
  *(void *)(v1 + 296) = v6;
  *(void *)(v1 + 272) = v7;
  *(void *)(v1 + 280) = v8;
  *(void *)(v1 + 256) = v9;
  *(void *)(v1 + 264) = v10;
  OUTLINED_FUNCTION_2_1();
  *(void *)(v1 + 320) = v11;
  uint64_t v12 = sub_2251064A0();
  *(void *)(v1 + 328) = v12;
  OUTLINED_FUNCTION_1_3(v12);
  *(void *)(v1 + 336) = v13;
  *(void *)(v1 + 344) = OUTLINED_FUNCTION_20_1();
  *(unsigned char *)(v1 + 409) = *v3;
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

uint64_t sub_2250C3F44()
{
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2251070F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2680C5BD8);
  uint64_t v3 = sub_2251070D0();
  os_log_type_t v4 = sub_2251073A0();
  if (OUTLINED_FUNCTION_11_1(v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_46_0(v5);
    OUTLINED_FUNCTION_36_0(&dword_2250AF000, v3, v6, "ContactResolutionPatternGenerator::generateYesNoSingleAlternativeHandle");
    OUTLINED_FUNCTION_7_1();
  }
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void **)(v0 + 256);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_62(inited, (__n128)xmmword_22510C2B0);
  id v10 = v8;
  sub_2250C66C8();
  swift_bridgeObjectRelease();
  uint64_t v11 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_62(v11, (__n128)xmmword_22510C2B0);
  uint64_t v12 = (void *)(v7 + 40);
  uint64_t v13 = *(void *)(v7 + 32);
  id v14 = v10;
  sub_2250CAAD4(v46);
  uint64_t v15 = (void *)swift_task_alloc();
  unint64_t v16 = OUTLINED_FUNCTION_50(v15);
  uint64_t v17 = sub_2250C6300(v16, (void (*)(unint64_t, id))sub_2250C67E0);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t result = swift_task_dealloc();
  if ((v17 & 0xC000000000000001) != 0)
  {
    uint64_t v19 = MEMORY[0x22A62C790](0, v17);
  }
  else
  {
    if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = *(void *)(v17 + 32);
    swift_retain();
  }
  OUTLINED_FUNCTION_76();
  *(void *)(v0 + 352) = v19;
  uint64_t v21 = *(void *)(v0 + 280);
  uint64_t v20 = *(void *)(v0 + 288);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t v22 = swift_initStackObject();
  *(_OWORD *)(v22 + 16) = xmmword_22510BA10;
  unint64_t v23 = MEMORY[0x263F8D310];
  *(void *)(v22 + 32) = v1;
  *(void *)(v22 + 40) = 0xE600000000000000;
  *(void *)(v22 + 72) = v23;
  OUTLINED_FUNCTION_16_1(v22);
  uint64_t v24 = sub_225107170();
  sub_2250C72B8(v21, v20, v24, v12);
  *(void *)(v0 + 360) = v25;
  uint64_t v26 = *(void *)(v0 + 304);
  uint64_t v45 = *(void *)(v0 + 296);
  swift_bridgeObjectRelease();
  uint64_t v27 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_52(v27, (__n128)xmmword_22510BA10)[4].n128_u64[1] = v23;
  OUTLINED_FUNCTION_48();
  v28[5] = v30;
  v28[6] = v29;
  v28[7] = v31;
  uint64_t v32 = sub_225107170();
  sub_2250C72B8(v45, v26, v32, v12);
  *(void *)(v0 + 368) = v33;
  uint64_t v35 = *(void *)(v0 + 336);
  uint64_t v34 = *(void *)(v0 + 344);
  uint64_t v44 = *(void *)(v0 + 328);
  uint64_t v36 = *(void *)(v0 + 312);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v12, *(void *)(v36 + 64));
  swift_retain();
  sub_225106490();
  sub_2251061C0();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v44);
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_2250BD084();
  *(void *)(v0 + 376) = v37;
  uint64_t v38 = v37;
  uint64_t v39 = sub_2251070D0();
  os_log_type_t v40 = sub_2251073A0();
  if (os_log_type_enabled(v39, v40))
  {
    id v41 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v41);
    OUTLINED_FUNCTION_10_1(&dword_2250AF000, v39, v42, "ContactResolutionPatternGenerator::generateYesNoClarificationSingleAlternativeHandle - Creating YesNoClarification::SingleAlternativeHandle View");
    OUTLINED_FUNCTION_7_1();
  }

  *(unsigned char *)(v0 + 408) = 5;
  uint64_t v43 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v43;
  *uint64_t v43 = v0;
  v43[1] = sub_2250C447C;
  return sub_2250C0748((unsigned char *)(v0 + 408), v38, v13);
}

uint64_t sub_2250C447C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 392) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 400) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C4580()
{
  OUTLINED_FUNCTION_12_1();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 400);
  return v1(v2);
}

uint64_t sub_2250C4614()
{
  OUTLINED_FUNCTION_12_1();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

#error "2250C46A8: call analysis failed (funcsize=7)"

uint64_t sub_2250C46C4()
{
  OUTLINED_FUNCTION_12_1();
  char v1 = *(unsigned char *)(v0 + 201);
  uint64_t v2 = *(void **)(v0 + 152);
  *(void *)(v0 + 168) = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v2);
  *(unsigned char *)(v0 + 200) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2250C477C;
  OUTLINED_FUNCTION_38_0();
  return ContactResolutionPatternGenerator.generateYesNoClarificationSingleAlternativeHandle(contact:unavailableLabel:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:)();
}

uint64_t sub_2250C477C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 184) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 192) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t static ContactResolutionPatternGenerator.generateDetailedDisambiguationMultipleHandlesSameLabel(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[18] = a7;
  v8[19] = v7;
  v8[16] = a5;
  v8[17] = a6;
  v8[14] = a3;
  v8[15] = a4;
  v8[12] = a1;
  v8[13] = a2;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C4894);
}

uint64_t sub_2250C4894()
{
  OUTLINED_FUNCTION_5_3();
  char v1 = (void *)v0[18];
  v0[20] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[21] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250C493C;
  OUTLINED_FUNCTION_40_0();
  return ContactResolutionPatternGenerator.generateDetailedDisambiguationMultipleHandlesSameLabel(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:)();
}

uint64_t sub_2250C493C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 176) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 184) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationMultipleHandlesSameLabel(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[17] = v2;
  v1[18] = v0;
  v1[15] = v3;
  v1[16] = v4;
  v1[13] = v5;
  v1[14] = v6;
  v1[12] = v7;
  OUTLINED_FUNCTION_2_1();
  v1[19] = v8;
  uint64_t v9 = type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters(0);
  v1[20] = v9;
  OUTLINED_FUNCTION_9(v9);
  v1[21] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

#error "2250C4BC0: call analysis failed (funcsize=197)"

uint64_t sub_2250C4E0C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 200) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t static ContactResolutionPatternGenerator.generateDetailedDisambiguationMixedLabels(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:globals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[18] = a7;
  v8[19] = v7;
  v8[16] = a5;
  v8[17] = a6;
  v8[14] = a3;
  v8[15] = a4;
  v8[12] = a1;
  v8[13] = a2;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C4F34);
}

uint64_t sub_2250C4F34()
{
  OUTLINED_FUNCTION_5_3();
  char v1 = (void *)v0[18];
  v0[20] = swift_initStackObject();
  OUTLINED_FUNCTION_15_1((uint64_t)v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[21] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250C4FDC;
  OUTLINED_FUNCTION_40_0();
  return ContactResolutionPatternGenerator.generateDetailedDisambiguationMixedLabels(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:)();
}

uint64_t sub_2250C4FDC()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 176) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 184) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C50D0()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 184);
  return v1(v2);
}

uint64_t sub_2250C5130()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationMixedLabels(contacts:buttonDirectInvocation:disambiguationResultDirectInvocation:windowParameters:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[17] = v2;
  v1[18] = v0;
  v1[15] = v3;
  v1[16] = v4;
  v1[13] = v5;
  v1[14] = v6;
  v1[12] = v7;
  OUTLINED_FUNCTION_2_1();
  v1[19] = v8;
  uint64_t v9 = type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters(0);
  v1[20] = v9;
  OUTLINED_FUNCTION_9(v9);
  v1[21] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

#error "2250C531C: call analysis failed (funcsize=197)"

uint64_t sub_2250C5568()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v5 + 200) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250C566C()
{
  OUTLINED_FUNCTION_5_3();
  sub_2250C67F8(*(void *)(v0 + 168), type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  uint64_t v2 = *(void *)(v0 + 200);
  return v1(v2);
}

uint64_t sub_2250C56EC()
{
  OUTLINED_FUNCTION_5_3();
  sub_2250C67F8(*(void *)(v0 + 168), type metadata accessor for DetailedDisambiguationMultipleHandlesSameLabelParameters);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v1();
}

uint64_t ContactResolutionPatternGenerator.generateOpenEndedClarificationTarget(requestedName:intentType:zeroMatches:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = v4;
  *(unsigned char *)(v5 + 73) = a4;
  *(void *)(v5 + 16) = a1;
  OUTLINED_FUNCTION_2_1();
  *(void *)(v5 + 40) = v6;
  *(unsigned char *)(v5 + 74) = *v7;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C579C);
}

uint64_t sub_2250C579C()
{
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2251070F0();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_33(v1, (uint64_t)qword_2680C5BD8);
  os_log_type_t v3 = sub_2251073A0();
  if (OUTLINED_FUNCTION_11_1(v3))
  {
    uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v4);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v5, v6, "ContactResolutionPatternGenerator::generateOpenEndedClarificationTarget");
    OUTLINED_FUNCTION_7_1();
  }
  uint64_t v7 = *(void *)(v0 + 32);

  uint64_t v8 = sub_2250BD634();
  *(void *)(v0 + 48) = v8;
  *(unsigned char *)(v0 + 72) = 8;
  uint64_t v9 = *(void *)(v7 + 32);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2250C5908;
  return sub_2250C0748((unsigned char *)(v0 + 72), v8, v9);
}

uint64_t sub_2250C5908()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v7 = v6;
  *(void *)(v8 + 64) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    return v12(v3);
  }
}

uint64_t sub_2250C5A34()
{
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationMultipleHandlesSameLabelNoWindowing(contacts:disambiguationResultDirectInvocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  OUTLINED_FUNCTION_2_1();
  v4[6] = v5;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C5A7C);
}

#error "2250C5B78: call analysis failed (funcsize=166)"

uint64_t sub_2250C5D44()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v7 + 8);
    return v12(v3);
  }
}

uint64_t ContactResolutionPatternGenerator.generateDetailedDisambiguationMixedLabelsNoWindowing(contacts:disambiguationResultDirectInvocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  OUTLINED_FUNCTION_2_1();
  v4[6] = v5;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250C5E94);
}

#error "2250C5F90: call analysis failed (funcsize=166)"

uint64_t sub_2250C615C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v7 + 8);
    return v12(v3);
  }
}

uint64_t sub_2250C6280()
{
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t ContactResolutionPatternGenerator.deinit()
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
}

uint64_t ContactResolutionPatternGenerator.__deallocating_deinit()
{
  ContactResolutionPatternGenerator.deinit();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_2250C6300(unint64_t a1, void (*a2)(unint64_t, id))
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_2251075A0();
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x22A62C790](v5, a1);
LABEL_7:
        uint64_t v7 = v6;
        unint64_t v8 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_14;
        }
        a2(v5, v6);
        if (v2)
        {
          swift_bridgeObjectRelease();

          return swift_release();
        }

        sub_225107580();
        sub_2251075B0();
        sub_2251075C0();
        sub_225107590();
        ++v5;
        if (v8 == v4) {
          goto LABEL_16;
        }
      }
      if (v5 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      OUTLINED_FUNCTION_78();
      uint64_t v4 = sub_225107620();
      if (!v4) {
        goto LABEL_16;
      }
    }
    id v6 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_7;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_2250C6484(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2250C64A8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_contactIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2251071E0();

  return v3;
}

uint64_t sub_2250C6518(void *a1)
{
  id v2 = objc_msgSend(a1, sel_siriMatches);

  if (!v2) {
    return 0;
  }
  sub_2250C6950(0, &qword_2680C0D18);
  uint64_t v3 = sub_2251072F0();

  return v3;
}

void (*sub_2250C6590(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  id v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_2250C6640(v6, a2, a3);
  return sub_2250C65F8;
}

void sub_2250C65F8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2250C6640(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_2250C6484(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x22A62C790](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_2250C66C0;
}

void sub_2250C66C0(id *a1)
{
}

uint64_t sub_2250C66C8()
{
  v5[3] = &type metadata for CoreAnalyticsLogger;
  v5[4] = &off_26D87C180;
  sub_2250CBC74();
  char v1 = v0;
  __swift_project_boxed_opaque_existential_1(v5, (uint64_t)&type metadata for CoreAnalyticsLogger);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510BA10;
  *(void *)(inited + 32) = 0xD000000000000015;
  *(void *)(inited + 40) = 0x8000000225108D70;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v1 & 1);
  sub_2250C6950(0, (unint64_t *)&qword_2680C0D30);
  uint64_t v3 = sub_225107170();
  sub_2250DA218(0xD000000000000028, 0x8000000225108D40, v3);
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_2250C67E0()
{
  return sub_2250C6858();
}

uint64_t sub_2250C67F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

#error "2250C687C: call analysis failed (funcsize=13)"

uint64_t type metadata accessor for ContactResolutionPatternGenerator()
{
  return self;
}

uint64_t method lookup function for ContactResolutionPatternGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactResolutionPatternGenerator);
}

uint64_t dispatch thunk of ContactResolutionPatternGenerator.__allocating_init(appBundleId:globals:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ContactResolutionPatternGenerator.__allocating_init(appBundleId:globals:deviceState:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_2250C68F0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2250C6950(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_7_1()
{
  JUMPOUT(0x22A62D170);
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void OUTLINED_FUNCTION_10_1(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

BOOL OUTLINED_FUNCTION_11_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_13_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void *OUTLINED_FUNCTION_15_1(uint64_t a1)
{
  return ContactResolutionPatternGenerator.init(appBundleId:globals:)(0, 0xE000000000000000, a1);
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t result)
{
  *(void *)(result + 48) = 0x7972616D697270;
  *(void *)(result + 56) = 0xE700000000000000;
  return result;
}

BOOL OUTLINED_FUNCTION_17_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return v0 + 8;
}

_WORD *OUTLINED_FUNCTION_19_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_22_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

_WORD *OUTLINED_FUNCTION_23_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return *(void *)(v0 + 232);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)uint64_t v13 = v16;
  *(void *)(v13 + 8) = v15;
  *(void *)(v13 + 16) = v17;
  *(unsigned char *)(v13 + 24) = v14 & 1;
  *(void *)(v13 + *(int *)(v12 + 32)) = a11;
  *(void *)(v13 + *(int *)(v12 + 36)) = a12;
  return sub_2250BD3B8();
}

BOOL OUTLINED_FUNCTION_30_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1, unsigned char *a2)
{
  *a2 = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_32_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  a1[2] = v13;
  a1[3] = a11;
  a1[4] = a12;
  a1[5] = v16;
  a1[6] = v14;
  a1[7] = v15;
  a1[8] = v12;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2251070D0();
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

void OUTLINED_FUNCTION_36_0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  a1[2] = v17;
  a1[3] = v18;
  a1[4] = a14;
  a1[5] = v19;
  a1[6] = v15;
  a1[7] = v14;
  a1[8] = v16;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_2250C7CC4((void *)(v0 + 40));
}

__n128 *OUTLINED_FUNCTION_45_0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x736D657469;
  result[2].n128_u64[1] = 0xE500000000000000;
  return result;
}

_WORD *OUTLINED_FUNCTION_46_0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_50(void *a1)
{
  a1[2] = v1;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = v4;
  a1[6] = v5;
  a1[7] = v2;
  a1[8] = v3;
  return swift_bridgeObjectRetain();
}

NSObject *OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return sub_2250C72B8(v14, a14, a1, v15);
}

__n128 *OUTLINED_FUNCTION_52(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x6E6F74747562;
  return result;
}

__n128 *OUTLINED_FUNCTION_53(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_2250C66C8();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_61(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_225107300();
}

uint64_t OUTLINED_FUNCTION_62(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_225107300();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_2250CAAD4(v0);
}

void OUTLINED_FUNCTION_65(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_2250C66C8();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_69(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 + 152) = a9;
  *(void *)(v10 + 160) = v9;
  *(void *)(v10 + 136) = a7;
  *(void *)(v10 + 144) = a8;
  *(void *)(v10 + 120) = a5;
  *(void *)(v10 + 128) = a6;
  *(void *)(v10 + 104) = a2;
  *(void *)(v10 + 112) = a3;
  *(void *)(v10 + 96) = result;
  *(unsigned char *)(v10 + 201) = *a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_72(uint64_t a1, unsigned char *a2)
{
  *a2 = 4;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return *(void *)(v0 + 176);
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return a9;
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_2250CAAD4(v0);
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_80()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_81()
{
  return v0;
}

uint64_t static ContactResolutionHelper.makeContactDialogPersons(inpersons:directInvocationID:deviceState:globals:appBundleId:)(unint64_t a1)
{
  OUTLINED_FUNCTION_20_2(a1);
  unint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_2250C6300(v1, (void (*)(unint64_t, id))sub_2250CB3B8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

NSObject *sub_2250C72B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2250C6950(0, &qword_2680C0DA0);
  swift_bridgeObjectRetain();
  id v6 = sub_2250CAA60();
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = sub_225107170();
  }
  swift_bridgeObjectRetain();
  sub_2250D1E6C(v7);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_2250D0CB8(v9, v6);
  uint64_t v10 = self;
  __swift_project_boxed_opaque_existential_1(a4, a4[3]);
  uint64_t v11 = (void *)sub_225106260();
  id v12 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v11, v6);

  uint64_t v13 = sub_2251073E0();
  if (v14)
  {
    uint64_t v15 = v13;
  }
  else
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2251070F0();
    uint64_t v15 = OUTLINED_FUNCTION_33(v16, (uint64_t)qword_2680C5BD8);
    os_log_type_t v17 = sub_225107390();
    if (os_log_type_enabled(v15, v17))
    {
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_6_2();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_2250AF000, v15, v17, "ContactResolutionHelper::serializeDirectInvocation - Unable to serialize direct invocation.", v18, 2u);
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250BDE10();
    OUTLINED_FUNCTION_27_1();
    unsigned char *v19 = 3;
    swift_willThrow();
  }
  return v15;
}

void sub_2250C74E8()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  uint64_t v5 = OUTLINED_FUNCTION_9(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_27_2();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_58_0();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v81 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  os_log_type_t v17 = (char *)&v81 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v81 - v19;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_56_0();
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v81 - v23;
  unint64_t v25 = v3 >> 62;
  if (v3 >> 62)
  {
    uint64_t v88 = v22;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_225107620();
    swift_bridgeObjectRelease();
    uint64_t v22 = v88;
  }
  else
  {
    uint64_t v26 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v26 < 2) {
    goto LABEL_12;
  }
  uint64_t v87 = v8;
  uint64_t v88 = v22;
  id v86 = v0;
  unint64_t v27 = v3 & 0xC000000000000001;
  sub_2250C6480(0, (v3 & 0xC000000000000001) == 0, v3);
  if ((v3 & 0xC000000000000001) != 0) {
    id v28 = (id)MEMORY[0x22A62C790](0, v3);
  }
  else {
    id v28 = *(id *)(v3 + 32);
  }
  uint64_t v29 = v28;
  id v30 = objc_msgSend(v28, sel_nameComponents);

  if (v30)
  {
    sub_225105DA0();

    uint64_t v31 = sub_225105DE0();
    uint64_t v32 = v1;
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v31 = sub_225105DE0();
    uint64_t v32 = v1;
    uint64_t v33 = 1;
  }
  __swift_storeEnumTagSinglePayload(v32, v33, 1, v31);
  sub_2250D1490(v1, (uint64_t)v24, &qword_2680C0BE0);
  sub_225105DE0();
  if (OUTLINED_FUNCTION_50_0((uint64_t)v24))
  {
    uint64_t v34 = (uint64_t)v24;
LABEL_11:
    sub_2250D12E8(v34, &qword_2680C0BE0);
LABEL_12:
    OUTLINED_FUNCTION_5_4();
    return;
  }
  uint64_t v35 = sub_225105D00();
  uint64_t v37 = v36;
  sub_2250D12E8((uint64_t)v24, &qword_2680C0BE0);
  if (!v37) {
    goto LABEL_12;
  }
  uint64_t v85 = v35;
  if (v27) {
    id v38 = (id)MEMORY[0x22A62C790](0, v3);
  }
  else {
    id v38 = *(id *)(v3 + 32);
  }
  uint64_t v39 = v38;
  id v40 = objc_msgSend(v38, sel_nameComponents);

  if (v40)
  {
    sub_225105DA0();

    uint64_t v41 = 0;
  }
  else
  {
    uint64_t v41 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v41, 1, v31);
  sub_2250D1490((uint64_t)v17, (uint64_t)v20, &qword_2680C0BE0);
  if (OUTLINED_FUNCTION_50_0((uint64_t)v20))
  {
    swift_bridgeObjectRelease();
    uint64_t v34 = (uint64_t)v20;
    goto LABEL_11;
  }
  sub_225105D20();
  uint64_t v43 = v42;
  sub_2250D12E8((uint64_t)v20, &qword_2680C0BE0);
  if (!v43)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  if (!v25)
  {
    uint64_t v44 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v44)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    swift_bridgeObjectRetain();
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_225107620();
  if (v45 < 1)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v44 = v45;
  swift_bridgeObjectRetain();
  uint64_t v46 = sub_225107620();
  swift_bridgeObjectRelease();
  if (v46 >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v47 < v44)
    {
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
LABEL_30:
    if (v27 && v44 != 1)
    {
      sub_2250C6950(0, &qword_2680C0D18);
      uint64_t v48 = 1;
      do
      {
        uint64_t v49 = v48 + 1;
        sub_225107520();
        uint64_t v48 = v49;
      }
      while (v44 != v49);
    }
    if (v25)
    {
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_225107630();
      uint64_t v84 = v51;
      uint64_t v50 = v52;
      unint64_t v54 = v53;
      swift_bridgeObjectRelease_n();
      uint64_t v44 = v54 >> 1;
    }
    else
    {
      uint64_t v82 = v3 & 0xFFFFFFFFFFFFFF8;
      uint64_t v84 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v50 = 1;
    }
    uint64_t v55 = (uint64_t)v86;
    unint64_t v56 = 0x26471C000uLL;
    if (v50 == v44)
    {
LABEL_62:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_12;
    }
    uint64_t v57 = &qword_2680C0BE0;
    uint64_t v83 = v44;
    while (v50 < v44)
    {
      id v58 = *(id *)(v84 + 8 * v50);
      os_log_type_t v59 = *(const char **)(v56 + 2408);
      id v86 = v58;
      id v60 = [v58 v59];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = v88;
        sub_225105DA0();

        uint64_t v63 = 0;
      }
      else
      {
        uint64_t v63 = 1;
        uint64_t v62 = v88;
      }
      __swift_storeEnumTagSinglePayload(v62, v63, 1, v31);
      sub_2250D1490(v62, (uint64_t)v14, v57);
      if (OUTLINED_FUNCTION_50_0((uint64_t)v14))
      {
        sub_2250D12E8((uint64_t)v14, &qword_2680C0BE0);
LABEL_60:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();

        goto LABEL_12;
      }
      uint64_t v64 = v57;
      uint64_t v65 = v55;
      unint64_t v66 = v56;
      uint64_t v67 = v37;
      uint64_t v68 = sub_225105D00();
      uint64_t v70 = v69;
      uint64_t v71 = v64;
      sub_2250D12E8((uint64_t)v14, v64);
      if (!v70) {
        goto LABEL_60;
      }
      if (v68 == v85 && v70 == v67)
      {
        swift_bridgeObjectRelease();
        uint64_t v37 = v67;
      }
      else
      {
        char v73 = sub_2251077B0();
        swift_bridgeObjectRelease();
        uint64_t v37 = v67;
        if ((v73 & 1) == 0) {
          goto LABEL_60;
        }
      }
      unint64_t v56 = v66;
      id v74 = [v86 (SEL)(v66 + 2072)];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = v87;
        sub_225105DA0();

        uint64_t v77 = 0;
      }
      else
      {
        uint64_t v77 = 1;
        uint64_t v76 = v87;
      }
      uint64_t v55 = v65;
      __swift_storeEnumTagSinglePayload(v76, v77, 1, v31);
      uint64_t v78 = v65;
      uint64_t v57 = v71;
      sub_2250D1490(v76, v78, v71);
      if (OUTLINED_FUNCTION_50_0(v55))
      {

        sub_2250D12E8(v55, &qword_2680C0BE0);
        goto LABEL_62;
      }
      sub_225105D20();
      uint64_t v80 = v79;

      sub_2250D12E8(v55, v71);
      if (v80)
      {
        ++v50;
        swift_bridgeObjectRelease();
        uint64_t v44 = v83;
        if (v83 != v50) {
          continue;
        }
      }
      goto LABEL_62;
    }
    __break(1u);
    goto LABEL_66;
  }
LABEL_69:
  __break(1u);
}

uint64_t sub_2250C7BD0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) == 0)
      {
        if (__OFADD__(v3, 1)) {
          goto LABEL_16;
        }
        int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32 + 8 * v3++) + qword_2680C0AF8);
LABEL_9:
        if (v6 != 2 && (v6 & 1) != 0)
        {
          uint64_t v2 = 1;
          goto LABEL_14;
        }
        if (v3 == v2)
        {
          uint64_t v2 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v4 = MEMORY[0x22A62C790](v3, a1);
      if (!__OFADD__(v3++, 1)) {
        break;
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      OUTLINED_FUNCTION_6_3();
      uint64_t v2 = sub_225107620();
      if (!v2) {
        goto LABEL_14;
      }
    }
    int v6 = *(unsigned __int8 *)(v4 + qword_2680C0AF8);
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2250C7CC4(void *a1)
{
  sub_2251064A0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_38_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_225106490();
  LOBYTE(a1) = sub_2251061C0();
  uint64_t v3 = OUTLINED_FUNCTION_33_0();
  uint64_t result = v4(v3);
  if ((a1 & 1) == 0)
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2251070F0();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_33(v6, (uint64_t)qword_2680C5BD8);
    os_log_type_t v8 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v8))
    {
      uint64_t v9 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v9);
      OUTLINED_FUNCTION_14_2(&dword_2250AF000, v10, v11, "cannot create view if device is locked. Please unlock to continue.");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250BDE10();
    OUTLINED_FUNCTION_27_1();
    *uint64_t v12 = 6;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2250C7E28(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    do
    {
      if (v2 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      while (1)
      {
        id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A62C790](v6, a1) : *(id *)(a1 + 8 * v6 + 32);
        os_log_type_t v8 = v7;
        id v9 = sub_2250C94B8();

        if (v9 != (id)1) {
          break;
        }
        BOOL v10 = __OFADD__(v4++, 1);
        if (v10) {
          goto LABEL_16;
        }
LABEL_14:
        if (v2 == ++v6) {
          goto LABEL_19;
        }
      }
      if (v9 != (id)2) {
        goto LABEL_14;
      }
      BOOL v10 = __OFADD__(v5++, 1);
      if (!v10) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      OUTLINED_FUNCTION_6_3();
      uint64_t result = sub_225107620();
      uint64_t v2 = result;
    }
    while (result);
  }
  uint64_t v5 = 0;
LABEL_19:
  swift_bridgeObjectRelease();
  return v5;
}

void sub_2250C7F30()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v2 = v1;
  uint64_t v3 = v1 >> 62;
  if (v1 >> 62) {
    goto LABEL_31;
  }
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v4 < 2) {
      goto LABEL_29;
    }
    OUTLINED_FUNCTION_60_0();
    id v5 = v0 ? (id)MEMORY[0x22A62C790](0, v2) : *(id *)(v2 + 32);
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_personHandle);

    if (!v7) {
      goto LABEL_29;
    }
    id v8 = objc_msgSend(v7, sel_type);

    if (!v3)
    {
      uint64_t v9 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v9) {
        goto LABEL_34;
      }
      swift_bridgeObjectRetain();
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_225107620();
    if (v10 < 1) {
      goto LABEL_35;
    }
    uint64_t v9 = v10;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v11 < 1) {
      goto LABEL_36;
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v12 < v9) {
      break;
    }
LABEL_13:
    if (v0 && v9 != 1)
    {
      sub_2250C6950(0, &qword_2680C0D18);
      uint64_t v13 = 1;
      do
      {
        uint64_t v14 = v13 + 1;
        sub_225107520();
        uint64_t v13 = v14;
      }
      while (v9 != v14);
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
      sub_225107630();
      uint64_t v15 = v16;
      uint64_t v3 = v17;
      unint64_t v19 = v18;
      swift_bridgeObjectRelease_n();
      uint64_t v9 = v19 >> 1;
    }
    else
    {
      uint64_t v15 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v3 = 1;
    }
    if (v3 == v9)
    {
LABEL_25:
      swift_unknownObjectRelease();
LABEL_29:
      OUTLINED_FUNCTION_5_4();
      return;
    }
    while (v3 < v9)
    {
      unint64_t v2 = (unint64_t)*(id *)(v15 + 8 * v3);
      id v20 = objc_msgSend((id)v2, sel_personHandle);
      if (!v20)
      {
        swift_unknownObjectRelease();

        goto LABEL_29;
      }
      uint64_t v0 = v20;
      id v21 = objc_msgSend(v20, sel_type);

      if (v21 != v8)
      {
        swift_unknownObjectRelease();
        goto LABEL_29;
      }
      if (v9 == ++v3) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t ContactResolutionResponseHandler.directInvocationValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_2250CB598(v2, v3, v4, v5);
}

uint64_t ContactResolutionResponseHandler.init(userData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (result)
  {
    sub_2250C8428(0x6E6F74747562, 0xE600000000000000, result, &v12);
    if (v13)
    {
      if (OUTLINED_FUNCTION_26_2())
      {
        BOOL v4 = v10 == 0x7972616D697270 && v11 == 0xE700000000000000;
        if (v4 || (sub_2251077B0() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          uint64_t v6 = 0;
          char v7 = 0;
        }
        else if (v10 == 0x7261646E6F636573 && v11 == 0xE900000000000079)
        {
          uint64_t result = swift_bridgeObjectRelease();
          uint64_t v6 = 0;
          char v7 = 1;
        }
        else
        {
          char v9 = sub_2251077B0();
          uint64_t result = swift_bridgeObjectRelease();
          uint64_t v6 = 0;
          if (v9) {
            char v7 = 1;
          }
          else {
            char v7 = 4;
          }
        }
        goto LABEL_22;
      }
    }
    else
    {
      sub_2250D12E8((uint64_t)&v12, &qword_2680C0BA0);
    }
    sub_2250C8428(0x49746361746E6F63, 0xE900000000000064, v2, &v12);
    if (v13)
    {
      uint64_t result = OUTLINED_FUNCTION_26_2();
      if (result)
      {
        uint64_t v5 = v10;
        uint64_t v6 = v11;
        char v7 = 3;
        goto LABEL_24;
      }
    }
    else
    {
      sub_2250D12E8((uint64_t)&v12, &qword_2680C0BA0);
    }
    sub_2250C8428(0x7865646E69, 0xE500000000000000, v2, &v12);
    if (v13)
    {
      uint64_t result = OUTLINED_FUNCTION_26_2();
      if (result)
      {
        uint64_t v5 = v10;
        char v7 = 2;
        uint64_t v6 = v2;
LABEL_23:
        uint64_t v2 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t result = sub_2250D12E8((uint64_t)&v12, &qword_2680C0BA0);
    }
    uint64_t v6 = 0;
    char v7 = 4;
LABEL_22:
    uint64_t v5 = v2;
    goto LABEL_23;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  char v7 = 4;
LABEL_24:
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 24) = v7;
  return result;
}

double sub_2250C8428@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_2250F644C(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_2250B7A60(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_2250C848C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_2250F644C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_2250C84E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_2250F64C4(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_2250B7A60(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

BOOL sub_2250C8548()
{
  id v1 = objc_msgSend(v0, sel_personHandle);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_label);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_2251071E0();
  unint64_t v6 = v5;

  swift_bridgeObjectRelease();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
  }
  return v7 != 0;
}

BOOL sub_2250C85EC()
{
  id v1 = objc_msgSend(v0, sel_personHandle);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_2250D0D38(v1);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  return v6 != 0;
}

void sub_2250C865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_8_3();
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  uint64_t v25 = OUTLINED_FUNCTION_9(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_2();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = sub_225105DE0();
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v30;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_32_1();
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)&a9 - v34;
  id v36 = objc_msgSend(v23, sel_nameComponents);
  if (!v36)
  {
    __swift_storeEnumTagSinglePayload(v28, 1, 1, v29);
    goto LABEL_5;
  }
  uint64_t v37 = v36;
  sub_225105DA0();

  id v38 = *(void (**)(void))(v31 + 32);
  OUTLINED_FUNCTION_53_0();
  v38();
  __swift_storeEnumTagSinglePayload(v28, 0, 1, v29);
  if (__swift_getEnumTagSinglePayload(v28, 1, v29) == 1)
  {
LABEL_5:
    sub_2250D12E8(v28, &qword_2680C0BE0);
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_53_0();
  v38();
  sub_225105D00();
  sub_225105D40();
  sub_225105D20();
  sub_225105DB0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v35, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  OUTLINED_FUNCTION_5_4();
}

void sub_2250C88B4()
{
  OUTLINED_FUNCTION_8_3();
  sub_225105C90();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27_2();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_58_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_56_0();
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v47 - v8;
  id v10 = objc_msgSend(v0, sel_personHandle);
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  uint64_t v52 = v2;
  uint64_t v12 = sub_2250B6C44(v10, (SEL *)&selRef_value);
  if (!v13)
  {

    goto LABEL_6;
  }
  uint64_t v20 = v12;
  unint64_t v21 = v13;
  sub_2250C865C(v12, v13, v14, v15, v16, v17, v18, v19, v47, (uint64_t)v48, v49, (uint64_t)v50, v51, v52, v53, v54, v55, v56, v57,
    v58);
  if (v22)
  {

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v57 = v20;
  uint64_t v23 = sub_2250B6C44(v0, (SEL *)&selRef__displayName);
  if (!v24)
  {
LABEL_47:
    swift_bridgeObjectRelease();

    goto LABEL_6;
  }
  uint64_t v25 = v23;
  unint64_t v26 = v24;
  uint64_t v27 = HIBYTE(v24) & 0xF;
  uint64_t v53 = v23 & 0xFFFFFFFFFFFFLL;
  uint64_t v54 = v27;
  if ((v24 & 0x2000000000000000) == 0) {
    uint64_t v27 = v23 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v55 = v27;
  unint64_t v56 = v21;
  if (!v27)
  {
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  if (objc_msgSend(v11, sel_type) == (id)2)
  {
    sub_225105C20();
    sub_225105C30();
    uint64_t v49 = v25;
    sub_225105C70();
    uint64_t v50 = v9;
    uint64_t v28 = *(void (**)(void))(v52 + 8);
    OUTLINED_FUNCTION_7_2();
    v28();
    OUTLINED_FUNCTION_7_2();
    v28();
    sub_225105C50();
    sub_225105C70();
    OUTLINED_FUNCTION_7_2();
    v28();
    OUTLINED_FUNCTION_7_2();
    v28();
    sub_225105C60();
    uint64_t v29 = (uint64_t)v50;
    sub_225105C70();
    OUTLINED_FUNCTION_7_2();
    v28();
    OUTLINED_FUNCTION_7_2();
    uint64_t v30 = ((uint64_t (*)(void))v28)();
    MEMORY[0x270FA5388](v30);
    *(&v47 - 2) = v29;
    swift_bridgeObjectRetain();
    uint64_t v31 = v49;
    char v32 = sub_2250C924C((uint64_t (*)(void *))sub_2250D1294, (uint64_t)(&v47 - 4), v49, v26);
    swift_bridgeObjectRelease();
    if (v32)
    {
      id v48 = v11;
      uint64_t v33 = 0;
      uint64_t v60 = 0;
      unint64_t v61 = 0xE000000000000000;
      unint64_t v51 = (v26 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v52 = v26 & 0xFFFFFFFFFFFFFFLL;
      do
      {
        if ((v26 & 0x1000000000000000) != 0)
        {
          sub_225107500();
        }
        else
        {
          if ((v26 & 0x2000000000000000) != 0)
          {
            uint64_t v58 = v31;
            uint64_t v59 = v52;
          }
          else if ((v31 & 0x1000000000000000) == 0)
          {
            sub_225107560();
          }
          sub_225107570();
        }
        uint64_t v35 = v34;
        sub_225105C30();
        char v36 = sub_225105C80();
        OUTLINED_FUNCTION_9_3();
        v28();
        if (v36) {
          sub_225107230();
        }
        v33 += v35;
      }
      while (v33 < v55);
      swift_bridgeObjectRelease();
      unint64_t v51 = v60;
      uint64_t v52 = v61;
      uint64_t v60 = 0;
      unint64_t v61 = 0xE000000000000000;
      unint64_t v37 = v56;
      uint64_t v54 = v57 & 0xFFFFFFFFFFFFLL;
      uint64_t v55 = HIBYTE(v56) & 0xF;
      if ((v56 & 0x2000000000000000) != 0) {
        int64_t v38 = HIBYTE(v56) & 0xF;
      }
      else {
        int64_t v38 = v57 & 0xFFFFFFFFFFFFLL;
      }
      if (v38)
      {
        int64_t v39 = 0;
        uint64_t v53 = v56 & 0xFFFFFFFFFFFFFFLL;
        do
        {
          if ((v37 & 0x1000000000000000) != 0)
          {
            sub_225107500();
          }
          else
          {
            if ((v37 & 0x2000000000000000) != 0)
            {
              uint64_t v58 = v57;
              uint64_t v59 = v53;
            }
            else if ((v57 & 0x1000000000000000) == 0)
            {
              sub_225107560();
            }
            sub_225107570();
          }
          uint64_t v41 = v40;
          sub_225105C30();
          char v42 = sub_225105C80();
          OUTLINED_FUNCTION_9_3();
          v28();
          if (v42) {
            sub_225107230();
          }
          v39 += v41;
          unint64_t v37 = v56;
        }
        while (v39 < v38);
        swift_bridgeObjectRelease();
        uint64_t v43 = v60;
        unint64_t v44 = v61;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v43 = 0;
        unint64_t v44 = 0xE000000000000000;
      }
      if (v51 != v43 || v52 != v44) {
        sub_2251077B0();
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_3();
      v28();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_7_2();
      v28();
    }
  }
  else
  {
    if (v25 != v57 || v26 != v56) {
      sub_2251077B0();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_6:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250C8E50(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_225107620())
  {
    unint64_t v27 = v3 & 0xC000000000000001;
    unint64_t v25 = v3;
    unint64_t v26 = a2 & 0xC000000000000001;
    uint64_t v23 = a2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v5 = 4;
    uint64_t v24 = v4;
    while (1)
    {
      id v6 = v27 ? (id)MEMORY[0x22A62C790](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(v6, sel_personHandle);
      id v10 = objc_msgSend(v9, sel_label);

      if (v26)
      {
        id v11 = (id)MEMORY[0x22A62C790](0, a2);
      }
      else
      {
        if (!*(void *)(v23 + 16)) {
          goto LABEL_29;
        }
        id v11 = *(id *)(a2 + 32);
      }
      uint64_t v12 = v11;
      id v13 = objc_msgSend(v11, sel_personHandle);

      id v14 = objc_msgSend(v13, sel_label);
      if (v10)
      {
        if (!v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return 0;
        }
        uint64_t v15 = a2;
        uint64_t v16 = sub_2251071E0();
        uint64_t v18 = v17;
        if (v16 == sub_2251071E0() && v18 == v19)
        {

          swift_bridgeObjectRelease_n();
          a2 = v15;
          uint64_t v4 = v24;
          unint64_t v3 = v25;
        }
        else
        {
          char v21 = sub_2251077B0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a2 = v15;
          uint64_t v4 = v24;
          unint64_t v3 = v25;
          if ((v21 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return 0;
          }
        }
      }
      else
      {
        if (v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return 0;
        }
      }
      ++v5;
      if (v8 == v4) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_2250C9114(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_225107620())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A62C790](v6 - 4, a3) : *(id *)(a3 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v15 = v7;
      char v10 = a1(&v15);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v12 & 1;
      }
      char v11 = v10;

      if ((v11 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        char v12 = 0;
        return v12 & 1;
      }
      ++v6;
      if (v9 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  char v12 = 1;
  return v12 & 1;
}

uint64_t sub_2250C924C(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  v17[3] = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(a4) & 0xF;
  }
  else {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v16 = a4 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
    while (1)
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        int v10 = sub_225107500();
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v17[0] = a3;
          v17[1] = v16;
        }
        else if ((a3 & 0x1000000000000000) == 0)
        {
          sub_225107560();
        }
        int v10 = sub_225107570();
      }
      uint64_t v12 = v11;
      LODWORD(v17[0]) = v10;
      char v13 = a1(v17);
      if (v4)
      {
        swift_bridgeObjectRelease();
        return v14 & 1;
      }
      if ((v13 & 1) == 0) {
        break;
      }
      v9 += v12;
      if (v9 >= v5)
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
    char v14 = 0;
  }
  else
  {
LABEL_17:
    char v14 = 1;
  }
  return v14 & 1;
}

void sub_2250C9388()
{
  id v1 = objc_msgSend(v0, sel_personHandle);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_type);

    if (!v3)
    {
      sub_2250C88B4();
    }
  }
}

uint64_t sub_2250C9408()
{
  uint64_t v1 = sub_2250B6C44(v0, (SEL *)&selRef_contactIdentifier);
  if (v2) {
    return v1;
  }
  uint64_t v1 = sub_2250B6C44(v0, (SEL *)&selRef_customIdentifier);
  if (v3) {
    return v1;
  }
  id v6 = objc_msgSend(v0, sel_personHandle);
  if (v6)
  {
    uint64_t v1 = sub_2250D0D38(v6);
    if (v7) {
      return v1;
    }
  }
  id v8 = objc_msgSend(v0, sel_displayName);
  uint64_t v4 = sub_2251071E0();

  return v4;
}

id sub_2250C94B8()
{
  id result = objc_msgSend(v0, sel_personHandle);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(result, sel_type);

    return v3;
  }
  return result;
}

uint64_t sub_2250C950C(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  sub_225106DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a1, v5);
  id v11 = v2;
  uint64_t v12 = sub_225106C50();
  if (v12)
  {
    a1 = v12;
    id v13 = a2;
    sub_225106BE0();
    if (sub_225106BF0())
    {
      id v14 = v13;
      sub_225106B80();
      swift_release();
    }
  }
  else
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2251070F0();
    uint64_t v16 = (void *)OUTLINED_FUNCTION_33(v15, (uint64_t)qword_2680C5BD8);
    os_log_type_t v17 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v17))
    {
      uint64_t v18 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v18);
      OUTLINED_FUNCTION_14_2(&dword_2250AF000, v19, v20, "INPerson::toDialogPerson - Unable to convert INPerson to DialogPerson");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250BDE10();
    OUTLINED_FUNCTION_27_1();
    *char v21 = 1;
    swift_willThrow();
  }
  return a1;
}

void sub_2250C96C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_34_1();
  a19 = v22;
  a20 = v23;
  uint64_t v24 = v21;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  id v153 = (id)v31;
  int v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v38 = sub_225106F50();
  OUTLINED_FUNCTION_0();
  uint64_t v149 = v39;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_57_0();
  unint64_t v140 = v41;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_55_0();
  unint64_t v143 = v43;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_55_0();
  unint64_t v141 = v45;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v46);
  v144 = (char *)&v132 - v47;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v49 = OUTLINED_FUNCTION_9(v48);
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_55_0();
  uint64_t v142 = v51;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_55_0();
  uint64_t v146 = v53;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v54);
  uint64_t v152 = (uint64_t)&v132 - v55;
  uint64_t v145 = v56;
  uint64_t v147 = v37;
  uint64_t v148 = v35;
  if (v26)
  {
    v138 = v30;
    uint64_t v139 = v38;
    int v150 = v33;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_2250B6C44(v20, (SEL *)&selRef_contactIdentifier);
    if (v58) {
      uint64_t v59 = v57;
    }
    else {
      uint64_t v59 = 0;
    }
    if (v58) {
      unint64_t v60 = v58;
    }
    else {
      unint64_t v60 = 0xE000000000000000;
    }
    sub_2250CA4C4();
    v151 = v20;
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    sub_225105C10();
    swift_allocObject();
    sub_225105C00();
    uint64_t v155 = v59;
    unint64_t v156 = v60;
    uint64_t v157 = v62;
    uint64_t v158 = v64;
    uint64_t v159 = v28;
    uint64_t v160 = v26;
    sub_2250D133C();
    uint64_t v65 = sub_225105BF0();
    uint64_t v154 = v21;
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_57;
    }
    uint64_t v68 = v65;
    unint64_t v69 = v66;
    uint64_t v135 = v59;
    uint64_t v134 = v28;
    swift_release();
    uint64_t v137 = sub_225105E50();
    uint64_t v67 = v70;
    sub_2250D1388(v68, v69);
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_2251070F0();
    __swift_project_value_buffer(v71, (uint64_t)qword_2680C5BD8);
    swift_bridgeObjectRetain();
    unint64_t v72 = v60;
    swift_bridgeObjectRetain();
    uint64_t v73 = v64;
    swift_bridgeObjectRetain();
    id v74 = sub_2251070D0();
    os_log_type_t v75 = sub_225107380();
    BOOL v76 = os_log_type_enabled(v74, v75);
    uint64_t v77 = v135;
    if (v76)
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = swift_slowAlloc();
      a10 = v133;
      uint64_t v136 = v67;
      *(_DWORD *)uint64_t v78 = 136315138;
      v132 = v78 + 4;
      uint64_t v155 = v77;
      unint64_t v156 = v72;
      uint64_t v157 = v62;
      uint64_t v158 = v73;
      uint64_t v159 = v134;
      uint64_t v160 = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_225107220();
      uint64_t v155 = sub_2250B72A8(v79, v80, &a10);
      sub_225107420();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2250AF000, v74, v75, "Creating toContactDialogPerson with viewData=%s", v78, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7_1();
      uint64_t v67 = v136;
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v24 = v154;
    uint64_t v20 = v151;
    uint64_t v30 = v138;
    int v33 = v150;
    uint64_t v38 = v139;
  }
  else
  {
    uint64_t v137 = 0;
    uint64_t v67 = 0;
  }
  sub_2250C950C((uint64_t)v153, v30);
  if (v24)
  {
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  unint64_t v81 = 0xE900000000000073;
  v151 = v20;
  id v82 = objc_msgSend(v20, sel_searchProvider);
  int v150 = v33;
  id v153 = v82;
  if (v82 == (id)3) {
    LODWORD(v139) = 1;
  }
  else {
    LODWORD(v139) = sub_2251077B0();
  }
  swift_bridgeObjectRelease();
  __swift_storeEnumTagSinglePayload(v152, 1, 1, v38);
  uint64_t v83 = v146;
  sub_225106DB0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v83, 1, v38);
  uint64_t v154 = 0;
  uint64_t v136 = v67;
  if (EnumTagSinglePayload == 1)
  {
    sub_2250D12E8(v83, &qword_2680C0AB0);
  }
  else
  {
    uint64_t v85 = v149;
    id v86 = *(void (**)(void))(v149 + 32);
    unint64_t v87 = (unint64_t)v144;
    OUTLINED_FUNCTION_53_0();
    v86();
    uint64_t v88 = sub_225106F30();
    OUTLINED_FUNCTION_46_1();
    if ((v87 & 0x2000000000000000) != 0) {
      uint64_t v89 = HIBYTE(v87) & 0xF;
    }
    else {
      uint64_t v89 = v88 & 0xFFFFFFFFFFFFLL;
    }
    unint64_t v90 = v141;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v85 + 16))(v141, v87, v38);
    if (v89)
    {
      uint64_t v91 = sub_225106F40();
      OUTLINED_FUNCTION_46_1();
      if ((v90 & 0x2000000000000000) != 0) {
        uint64_t v67 = HIBYTE(v90) & 0xF;
      }
      else {
        uint64_t v67 = v91 & 0xFFFFFFFFFFFFLL;
      }
      v92 = *(void (**)(unint64_t, uint64_t))(v85 + 8);
      v92(v90, v38);
      if (v67)
      {
        uint64_t v67 = v152;
        sub_2250D12E8(v152, &qword_2680C0AB0);
        OUTLINED_FUNCTION_53_0();
        v86();
        __swift_storeEnumTagSinglePayload(v67, 0, 1, v38);
        uint64_t v93 = v145;
        uint64_t v94 = v137;
        unint64_t v81 = 0xE900000000000073;
        char v95 = v150;
        goto LABEL_46;
      }
    }
    else
    {
      v92 = *(void (**)(unint64_t, uint64_t))(v85 + 8);
      v92(v90, v38);
    }
    v92((unint64_t)v144, v38);
    unint64_t v81 = 0xE900000000000073;
  }
  uint64_t v96 = v142;
  sub_225106DB0();
  if (__swift_getEnumTagSinglePayload(v96, 1, v38) == 1)
  {
    sub_2250D12E8(v96, &qword_2680C0AB0);
    uint64_t v67 = v152;
    char v95 = v150;
  }
  else
  {
    uint64_t v97 = v96;
    uint64_t v98 = v149;
    unint64_t v81 = v143;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v149 + 32))(v143, v97, v38);
    sub_225106F30();
    OUTLINED_FUNCTION_46_1();
    OUTLINED_FUNCTION_44_1();
    unint64_t v99 = v140;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v98 + 16))(v140, v81, v38);
    if (v81)
    {
      v100 = *(void (**)(void))(v98 + 8);
      OUTLINED_FUNCTION_9_3();
      v100();
      OUTLINED_FUNCTION_41_1();
      char v95 = v150;
      ((void (*)(unint64_t, uint64_t))v100)(v143, v38);
    }
    else
    {
      unint64_t v101 = v99;
      sub_225106F40();
      unint64_t v81 = v99;
      OUTLINED_FUNCTION_46_1();
      OUTLINED_FUNCTION_44_1();
      v104 = *(void (**)(void))(v98 + 8);
      uint64_t v102 = v98 + 8;
      v103 = v104;
      OUTLINED_FUNCTION_9_3();
      v104();
      char v95 = v150;
      if (v101)
      {
        OUTLINED_FUNCTION_41_1();
        ((void (*)(unint64_t, uint64_t))v103)(v143, v38);
      }
      else
      {
        uint64_t v149 = v102;
        id v120 = objc_msgSend(v151, sel_personHandle);
        OUTLINED_FUNCTION_41_1();
        if (v121)
        {
          v122 = v121;
          if (!objc_msgSend(v121, sel_type))
          {
            uint64_t v125 = sub_2250B6C44(v122, (SEL *)&selRef_value);
            if (v126)
            {
              v144 = v126;
              uint64_t v146 = v125;
              if (qword_2680C06A0 != -1) {
                swift_once();
              }
              uint64_t v127 = sub_2251070F0();
              v128 = OUTLINED_FUNCTION_33(v127, (uint64_t)qword_2680C5BD8);
              os_log_type_t v129 = sub_2251073A0();
              if (os_log_type_enabled(v128, v129))
              {
                v130 = (uint8_t *)OUTLINED_FUNCTION_6_2();
                *(_WORD *)v130 = 0;
                _os_log_impl(&dword_2250AF000, v128, v129, "Created fullName using handle value", v130, 2u);
                OUTLINED_FUNCTION_7_1();
              }

              uint64_t v93 = v145;
              sub_225106F20();

              uint64_t v131 = OUTLINED_FUNCTION_17_1();
              ((void (*)(uint64_t))v103)(v131);
              uint64_t v67 = v152;
              sub_2250D12E8(v152, &qword_2680C0AB0);
              __swift_storeEnumTagSinglePayload(v93, 0, 1, v38);
              sub_2250D1490(v93, v67, &qword_2680C0AB0);
              uint64_t v94 = v137;
              goto LABEL_46;
            }
          }
          uint64_t v123 = OUTLINED_FUNCTION_17_1();
          ((void (*)(uint64_t))v103)(v123);
        }
        else
        {
          uint64_t v124 = OUTLINED_FUNCTION_17_1();
          ((void (*)(uint64_t))v103)(v124);
        }
      }
    }
  }
  uint64_t v94 = v137;
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v105 = sub_2251070F0();
  v106 = (void *)OUTLINED_FUNCTION_33(v105, (uint64_t)qword_2680C5BD8);
  os_log_type_t v107 = sub_2251073A0();
  if (OUTLINED_FUNCTION_22_2(v107))
  {
    v108 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_62_0(v108);
    OUTLINED_FUNCTION_14_2(&dword_2250AF000, v109, v110, "Unable to determine INPerson fullName");
    OUTLINED_FUNCTION_7_1();
  }

  uint64_t v93 = v145;
  OUTLINED_FUNCTION_40_1();
  sub_225106DB0();
  sub_2250D12E8(v67, &qword_2680C0AB0);
  sub_2250D1490(v93, v67, &qword_2680C0AB0);
LABEL_46:
  type metadata accessor for ContactDialogPerson.Builder(0);
  swift_allocObject();
  sub_2250B7AF4();
  sub_2250B7B58(v94, v136);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2250B7B64(v147, v148);
  swift_release();
  if (v153 == (id)3) {
    uint64_t v111 = 0x707041726568746FLL;
  }
  else {
    uint64_t v111 = 1701736302;
  }
  if (v153 == (id)3) {
    uint64_t v112 = v81;
  }
  else {
    uint64_t v112 = 0xE400000000000000;
  }
  uint64_t v113 = sub_2250B7B70(v111, v112);
  swift_release();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v113 + qword_2680C0B50) = v139 & 1;
  unint64_t v114 = sub_2250BE6C4(v95);
  sub_2250B7B7C(v114, v115);
  OUTLINED_FUNCTION_48_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_40_1();
  sub_225106DD0();
  sub_225106CC0();
  swift_release();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_40_1();
  sub_225106BD0();
  sub_225106CE0();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_40_1();
  sub_225106BC0();
  sub_225106CD0();
  swift_release();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_40_1();
  sub_225106DC0();
  sub_225106CB0();
  swift_release();
  OUTLINED_FUNCTION_51_0();
  sub_225106CA0();
  swift_release();
  sub_225106D90();
  sub_225106C80();
  swift_release();
  swift_release();
  sub_225106D80();
  sub_225106C70();
  swift_release();
  sub_2250D12E8(v93, &qword_2680C0AB0);
  sub_225106C20();
  sub_225106D10();
  OUTLINED_FUNCTION_48_0();
  sub_225106DA0();
  sub_225106C90();
  swift_release();
  sub_225106BF0();
  sub_225106C60();
  swift_release();
  swift_release();
  sub_225106C30();
  sub_225106D20();
  swift_release();
  sub_225106C00();
  sub_225106CF0();
  OUTLINED_FUNCTION_48_0();
  sub_2250D12E8(v93, &qword_2680C0AB0);
  sub_225106C10();
  sub_225106D00();
  swift_release();
  swift_retain();
  v116 = v151;
  uint64_t v117 = sub_2250B6C44(v151, (SEL *)&selRef_contactIdentifier);
  if (v118 || (uint64_t v117 = sub_2250B6C44(v116, (SEL *)&selRef_customIdentifier), v118))
  {
    sub_2250B7B88(v117, v118);
    swift_release_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
  type metadata accessor for ContactDialogPerson(0);
  swift_allocObject();
  uint64_t v119 = swift_retain();
  sub_2250B7FD4(v119);
  swift_release();
  swift_release();
  sub_2250D12E8(v67, &qword_2680C0AB0);
LABEL_57:
  OUTLINED_FUNCTION_36_1();
}

void sub_2250CA4C4()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_27_2();
  uint64_t v7 = v5 - v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v48 - v9;
  uint64_t v11 = sub_225105DE0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_32_1();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v48 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v48 - v19;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A78]), sel_init);
  objc_msgSend(v21, sel_setStyle_, 4);
  objc_msgSend(v21, sel_set_ignoresFallbacks_, 1);
  id v22 = objc_msgSend(v2, sel_nameComponents);
  uint64_t v49 = v0;
  if (v22)
  {
    uint64_t v23 = v22;
    sub_225105DA0();

    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v24(v10, v18, v11);
    OUTLINED_FUNCTION_49_0((uint64_t)v10, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) != 1)
    {
      v24(v20, v10, v11);
      uint64_t v25 = (void *)sub_225105D80();
      id v26 = objc_msgSend(v21, sel_stringFromPersonNameComponents_, v25);

      sub_2251071E0();
LABEL_14:
      (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v11);
      goto LABEL_25;
    }
  }
  else
  {
    OUTLINED_FUNCTION_49_0((uint64_t)v10, 1);
  }
  sub_2250D12E8((uint64_t)v10, &qword_2680C0BE0);
  id v27 = objc_msgSend(v2, sel_displayName);
  uint64_t v28 = sub_2251071E0();
  unint64_t v30 = v29;

  swift_bridgeObjectRelease();
  uint64_t v31 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v31 = v28 & 0xFFFFFFFFFFFFLL;
  }
  if (v31 && (sub_2250B6C44(v2, (SEL *)&selRef_contactIdentifier), uint64_t v33 = v32, swift_bridgeObjectRelease(), v33))
  {
    id v34 = objc_msgSend(v2, sel_displayName);
    if (!v34)
    {
      sub_2251071E0();
      id v34 = (id)sub_2251071A0();
      swift_bridgeObjectRelease();
    }
    id v35 = objc_msgSend(v21, sel_personNameComponentsFromString_, v34);

    if (v35)
    {
      sub_225105DA0();

      uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
      v36(v7, v18, v11);
      OUTLINED_FUNCTION_49_0(v7, 0);
      if (__swift_getEnumTagSinglePayload(v7, 1, v11) != 1)
      {
        uint64_t v20 = v49;
        v36((uint64_t)v49, (char *)v7, v11);
        uint64_t v37 = (void *)sub_225105D80();
        id v38 = objc_msgSend(v21, sel_stringFromPersonNameComponents_, v37);

        sub_2251071E0();
        goto LABEL_14;
      }
    }
    else
    {
      OUTLINED_FUNCTION_49_0(v7, 1);
    }
    sub_2250D12E8(v7, &qword_2680C0BE0);
    id v41 = [v2 (SEL)0x26471C018];
    uint64_t v39 = sub_2251071E0();
    unint64_t v40 = v42;
  }
  else
  {
    uint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
  }
  uint64_t v50 = v39;
  unint64_t v51 = v40;
  unint64_t v43 = sub_2250B71D8();
  uint64_t v44 = MEMORY[0x22A62C6E0](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x263F8D310], v43);
  swift_bridgeObjectRelease();
  uint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  uint64_t v45 = *(void *)(v44 + 16);
  if (v45)
  {
    swift_bridgeObjectRetain();
    uint64_t v46 = v44 + 56;
    do
    {
      if ((*(void *)(v46 - 16) ^ *(void *)(v46 - 24)) >= 0x4000)
      {
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_225107410();
        MEMORY[0x22A62C4D0](v47);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v46 += 32;
      --v45;
    }
    while (v45);

    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_25:
  OUTLINED_FUNCTION_5_4();
}

uint64_t static ContactResolutionHelper.sortINPersonBySearchProvider(inpersons:)(uint64_t a1)
{
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v1 = (uint64_t)sub_2250CE38C(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v4 = v1;
  sub_2250CEAD4(&v4, 0);
  return v4;
}

id sub_2250CAA60()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_2250CAAD4(unint64_t a1)
{
  sub_2250CBC74();
  char v7 = v6;
  if ((sub_2250CBE7C(a1) & 1) != 0 && (v7 & 1) == 0)
  {
    if (a1 >> 62)
    {
      OUTLINED_FUNCTION_6_3();
      uint64_t v8 = sub_225107620();
      if (v8) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_5:
        if (v8 >= 1)
        {
          uint64_t v9 = 0;
          uint64_t v10 = MEMORY[0x263F8EE78];
          do
          {
            if ((a1 & 0xC000000000000001) != 0) {
              id v11 = (id)MEMORY[0x22A62C790](v9, a1);
            }
            else {
              id v11 = *(id *)(a1 + 8 * v9 + 32);
            }
            uint64_t v12 = v11;
            id v13 = sub_2250C94B8();
            if (v13 == (id)1)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_1_4();
                uint64_t v10 = v21;
              }
              OUTLINED_FUNCTION_11_2();
              if (v15)
              {
                OUTLINED_FUNCTION_3_4(v17 > 1, v1);
                uint64_t v10 = v22;
              }
              char v16 = 2;
            }
            else if (v13 == (id)2)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_1_4();
                uint64_t v10 = v19;
              }
              OUTLINED_FUNCTION_11_2();
              if (v15)
              {
                OUTLINED_FUNCTION_3_4(v14 > 1, v1);
                uint64_t v10 = v20;
              }
              char v16 = 0;
            }
            else
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_1_4();
                uint64_t v10 = v23;
              }
              OUTLINED_FUNCTION_11_2();
              char v16 = 1;
              if (v15)
              {
                OUTLINED_FUNCTION_3_4(v18 > 1, v1);
                uint64_t v10 = v24;
              }
            }
            ++v9;
            *(void *)(v10 + 16) = v1;
            *(unsigned char *)(v10 + v3 + 32) = v16;
          }
          while (v8 != v9);
          goto LABEL_94;
        }
        __break(1u);
LABEL_90:
        OUTLINED_FUNCTION_6_3();
        uint64_t result = sub_225107620();
        uint64_t v28 = result;
        if (!result) {
          goto LABEL_93;
        }
        goto LABEL_31;
      }
    }
    goto LABEL_93;
  }
  unint64_t v25 = swift_bridgeObjectRetain();
  char v26 = sub_2250C8E50(v25, a1);
  unint64_t v27 = a1 >> 62;
  if ((v26 & 1) == 0)
  {
    if (v27)
    {
      OUTLINED_FUNCTION_6_3();
      uint64_t result = sub_225107620();
      uint64_t v44 = result;
      if (!result) {
        goto LABEL_93;
      }
    }
    else
    {
      uint64_t v44 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (!v44) {
        goto LABEL_93;
      }
    }
    if (v44 >= 1)
    {
      uint64_t v45 = 0;
      uint64_t v10 = MEMORY[0x263F8EE78];
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v46 = (id)MEMORY[0x22A62C790](v45, a1);
        }
        else {
          id v46 = *(id *)(a1 + 8 * v45 + 32);
        }
        uint64_t v47 = v46;
        if (v7)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_1_4();
            uint64_t v10 = v54;
          }
          OUTLINED_FUNCTION_25_2();
          if (v15)
          {
            OUTLINED_FUNCTION_3_4(v48 > 1, v2);
            uint64_t v10 = v55;
          }
          char v49 = 6;
        }
        else
        {
          id v50 = sub_2250C94B8();
          if (v50 == (id)1)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              OUTLINED_FUNCTION_1_4();
              uint64_t v10 = v58;
            }
            OUTLINED_FUNCTION_25_2();
            if (v15)
            {
              OUTLINED_FUNCTION_3_4(v52 > 1, v2);
              uint64_t v10 = v59;
            }
            char v49 = 4;
          }
          else if (v50 == (id)2)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              OUTLINED_FUNCTION_1_4();
              uint64_t v10 = v56;
            }
            OUTLINED_FUNCTION_25_2();
            if (v15)
            {
              OUTLINED_FUNCTION_3_4(v51 > 1, v2);
              uint64_t v10 = v57;
            }
            char v49 = 3;
          }
          else
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              OUTLINED_FUNCTION_1_4();
              uint64_t v10 = v60;
            }
            OUTLINED_FUNCTION_25_2();
            if (v15)
            {
              OUTLINED_FUNCTION_3_4(v53 > 1, v2);
              uint64_t v10 = v61;
            }
            char v49 = 5;
          }
        }
        ++v45;
        *(void *)(v10 + 16) = v2;
        *(unsigned char *)(v10 + v4 + 32) = v49;
      }
      while (v44 != v45);
      goto LABEL_94;
    }
    goto LABEL_96;
  }
  if (v27) {
    goto LABEL_90;
  }
  uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v28)
  {
LABEL_93:
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_94:
    swift_bridgeObjectRelease();
    return v10;
  }
LABEL_31:
  if (v28 >= 1)
  {
    uint64_t v30 = 0;
    uint64_t v10 = MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v31 = (id)MEMORY[0x22A62C790](v30, a1);
      }
      else {
        id v31 = *(id *)(a1 + 8 * v30 + 32);
      }
      uint64_t v32 = v31;
      id v33 = sub_2250C94B8();
      if (v33 == (id)1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_1_4();
          uint64_t v10 = v40;
        }
        OUTLINED_FUNCTION_11_2();
        if (v15)
        {
          OUTLINED_FUNCTION_3_4(v36 > 1, v1);
          uint64_t v10 = v41;
        }
        char v35 = 7;
      }
      else if (v33 == (id)2)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_1_4();
          uint64_t v10 = v38;
        }
        OUTLINED_FUNCTION_11_2();
        if (v15)
        {
          OUTLINED_FUNCTION_3_4(v34 > 1, v1);
          uint64_t v10 = v39;
        }
        char v35 = 6;
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_1_4();
          uint64_t v10 = v42;
        }
        OUTLINED_FUNCTION_11_2();
        if (v15)
        {
          OUTLINED_FUNCTION_3_4(v37 > 1, v1);
          uint64_t v10 = v43;
        }
        char v35 = 8;
      }
      ++v30;
      *(void *)(v10 + 16) = v1;
      *(unsigned char *)(v10 + v3 + 32) = v35;
    }
    while (v28 != v30);
    goto LABEL_94;
  }
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

void sub_2250CAFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v70 = v22;
  uint64_t v69 = v23;
  uint64_t v72 = v25;
  uint64_t v73 = v24;
  uint64_t v75 = v26;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  unint64_t v82 = v31;
  uint64_t v32 = sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v33;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_57_0();
  uint64_t v68 = v36;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v37);
  uint64_t v39 = (char *)&v67 - v38;
  __swift_project_boxed_opaque_existential_1(v28, v28[3]);
  sub_225106180();
  id v40 = objc_msgSend(v30, sel_personHandle);
  if (v40)
  {
    uint64_t v41 = v40;
    id v42 = objc_msgSend(v40, sel_label);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = sub_225105ED0();
      uint64_t v74 = v34;
      uint64_t v80 = v44;
      uint64_t v81 = v45;
      uint64_t v78 = 45;
      unint64_t v79 = 0xE100000000000000;
      uint64_t v76 = 95;
      uint64_t v77 = 0xE100000000000000;
      sub_2250B71D8();
      OUTLINED_FUNCTION_42_1();
      sub_225107460();
      uint64_t v71 = v28;
      id v46 = v30;
      swift_bridgeObjectRelease();
      uint64_t v47 = (void *)sub_2251063D0();
      swift_bridgeObjectRelease();
      sub_2251071A0();
      OUTLINED_FUNCTION_52_0();
      sub_2251071E0();
      unint64_t v48 = (void *)sub_2251071A0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_61_0();
      char v49 = (void *)sub_2251071A0();
      objc_msgSend(v41, sel_setValue_forKey_, v48, v49);

      id v50 = v46;
      uint64_t v28 = v71;

      id v51 = v41;
      OUTLINED_FUNCTION_21_2();
      uint64_t v41 = (void *)sub_2251071A0();
      objc_msgSend(v50, sel_setValue_forKey_, v49, v41);

      uint64_t v34 = v74;
    }
  }
  unint64_t v53 = *(void **)(v34 + 8);
  uint64_t v52 = v34 + 8;
  uint64_t v71 = v53;
  ((void (*)(char *, uint64_t))v53)(v39, v32);
  uint64_t v54 = v75;
  if (v75)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510BA10;
    *(void *)(inited + 32) = 0x7865646E69;
    *(void *)(inited + 40) = 0xE500000000000000;
    *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
    unint64_t v56 = v82;
    *(void *)(inited + 48) = v82;
    uint64_t v57 = sub_225107170();
    uint64_t v58 = sub_2250C72B8(v73, v54, v57, v28);
    uint64_t v54 = v59;
    swift_bridgeObjectRelease();
    if (v21)
    {
LABEL_15:
      OUTLINED_FUNCTION_36_1();
      return;
    }
  }
  else
  {
    uint64_t v58 = 0;
    unint64_t v56 = v82;
  }
  if ((v56 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(v72 + 16) > v56)
  {
    uint64_t v74 = v52;
    uint64_t v60 = *(unsigned __int8 *)(v72 + v56 + 32);
    __swift_project_boxed_opaque_existential_1(v28, v28[3]);
    uint64_t v61 = v68;
    sub_225106180();
    sub_2250C96C4((uint64_t)v58, v54, v60, v61, v69, v70, a21, v62, v67, v68, v69, v70, (uint64_t)v71, v72, v73, v74, v75, v76, v77,
      v78);
    if (v21)
    {
      uint64_t v63 = OUTLINED_FUNCTION_30_1();
      v64(v63);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v65 = OUTLINED_FUNCTION_30_1();
      v66(v65);
      swift_bridgeObjectRelease();
    }
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_2250CB3B8(uint64_t a1, uint64_t a2)
{
  return sub_2250CEB84(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_2250CAFCC);
}

void static ContactResolutionHelper.localizeContactLabel(contact:locale:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_personHandle);
  if (v2)
  {
    id v12 = v2;
    id v3 = objc_msgSend(v2, sel_label);
    if (v3)
    {
      uint64_t v4 = v3;
      sub_225105ED0();
      unint64_t v11 = sub_2250B71D8();
      uint64_t v10 = MEMORY[0x263F8D310];
      OUTLINED_FUNCTION_42_1();
      sub_225107460();
      swift_bridgeObjectRelease();
      sub_2251063D0();
      swift_bridgeObjectRelease();
      uint64_t v5 = (void *)sub_2251071A0();
      swift_bridgeObjectRelease();
      sub_2251071E0();
      char v6 = (void *)sub_2251071A0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_61_0();
      char v7 = (void *)sub_2251071A0();
      objc_msgSend(v12, sel_setValue_forKey_, v6, v7, v10, v11, v11, v11);

      id v8 = v12;
      OUTLINED_FUNCTION_21_2();
      uint64_t v9 = (void *)sub_2251071A0();
      objc_msgSend(a1, sel_setValue_forKey_, v7, v9);
    }
    else
    {
    }
  }
}

uint64_t sub_2250CB598(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 4:
      goto LABEL_3;
    case 3:
      swift_bridgeObjectRetain();
LABEL_3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t static ContactResolutionHelper.makeContactDialogPersons(inpersons:directInvocationID:directInvocationKey:deviceState:globals:)(unint64_t a1)
{
  OUTLINED_FUNCTION_20_2(a1);
  unint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_2250C6300(v1, (void (*)(unint64_t, id))sub_2250CEB58);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2250CB6C0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 *a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v50 = a7;
  uint64_t v47 = a6;
  unint64_t v53 = a5;
  uint64_t v51 = a4;
  uint64_t v54 = a1;
  uint64_t v61 = sub_225105F00();
  uint64_t v14 = *(void *)(v61 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v61);
  uint64_t v48 = (uint64_t)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v46 - v17;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  sub_225106180();
  id v19 = objc_msgSend(a2, sel_personHandle);
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = objc_msgSend(v19, sel_label);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = sub_225105ED0();
      uint64_t v52 = v9;
      uint64_t v59 = v23;
      uint64_t v60 = v24;
      uint64_t v57 = 45;
      unint64_t v58 = 0xE100000000000000;
      uint64_t v55 = 95;
      uint64_t v56 = 0xE100000000000000;
      sub_2250B71D8();
      sub_225107460();
      char v49 = a8;
      swift_bridgeObjectRelease();
      sub_2251063D0();
      swift_bridgeObjectRelease();
      id v46 = (id)sub_2251071A0();
      swift_bridgeObjectRelease();
      sub_2251071E0();
      uint64_t v25 = (void *)sub_2251071A0();
      swift_bridgeObjectRelease();
      uint64_t v26 = (void *)sub_2251071A0();
      objc_msgSend(v20, sel_setValue_forKey_, v25, v26);

      a8 = v49;
      id v27 = v20;
      uint64_t v20 = (void *)sub_2251071A0();
      objc_msgSend(a2, sel_setValue_forKey_, v27, v20);

      uint64_t v10 = v52;
    }
  }
  unint64_t v29 = *(unsigned __int8 **)(v14 + 8);
  uint64_t v28 = v14 + 8;
  char v49 = v29;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v29)(v18, v61);
  unint64_t v31 = v53;
  if (v53)
  {
    unint64_t v32 = v54;
    uint64_t v33 = v50;
    if (v50)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22510BA10;
      *(void *)(inited + 32) = v47;
      *(void *)(inited + 40) = v33;
      *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
      *(void *)(inited + 48) = v32;
      swift_bridgeObjectRetain();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
      uint64_t v36 = swift_initStackObject();
      *(_OWORD *)(v36 + 16) = xmmword_22510BA10;
      *(void *)(v36 + 32) = 0x7865646E69;
      *(void *)(v36 + 40) = 0xE500000000000000;
      *(void *)(v36 + 72) = MEMORY[0x263F8D6C8];
      *(void *)(v36 + 48) = v32;
    }
    uint64_t v37 = sub_225107170();
    unint64_t v31 = sub_2250C72B8(v51, (uint64_t)v31, v37, a3);
    uint64_t v35 = v38;
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      return v37;
    }
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v32 = v54;
  }
  if ((v32 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*((void *)a8 + 2) > v32)
  {
    uint64_t v54 = v28;
    uint64_t v52 = v10;
    uint64_t v39 = a8[v32 + 32];
    __swift_project_boxed_opaque_existential_1(a3, a3[3]);
    uint64_t v40 = v48;
    sub_225106180();
    uint64_t v41 = sub_2250B6C44(a2, (SEL *)&selRef_sourceAppBundleIdentifier);
    uint64_t v37 = (uint64_t)a2;
    uint64_t v42 = v52;
    sub_2250C96C4((uint64_t)v31, v35, v39, v40, a9, v41, v43, v44, (uint64_t)v46, v47, v48, (uint64_t)v49, v50, v51, v52, (uint64_t)v53, v54, v55, v56,
      v57);
    if (v42)
    {
      ((void (*)(uint64_t, uint64_t))v49)(v40, v61);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = v45;
      ((void (*)(uint64_t, uint64_t))v49)(v40, v61);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return v37;
  }
  __break(1u);
  return result;
}

void sub_2250CBC74()
{
  OUTLINED_FUNCTION_8_3();
  unint64_t v2 = v1;
  uint64_t v21 = sub_225105C90();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_39_1();
  if (v2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_225107620())
  {
    uint64_t v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v4 = v6 - 4;
      id v7 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A62C790](v6 - 4, v2) : *(id *)(v2 + 8 * v6);
      id v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_personHandle);
      if (v10)
      {
        unint64_t v11 = v10;
        id v12 = objc_msgSend(v10, sel_label);
        if (!v12)
        {
          swift_bridgeObjectRelease();

          goto LABEL_18;
        }
        id v13 = v12;
        sub_2251071E0();
        sub_225105C60();
        sub_2250B71D8();
        uint64_t v14 = sub_225107450();
        uint64_t v15 = v5;
        unint64_t v17 = v16;
        (*v20)(v0, v21);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v18 = HIBYTE(v17) & 0xF;
        BOOL v19 = (v17 & 0x2000000000000000) == 0;
        uint64_t v5 = v15;
        if (v19) {
          uint64_t v18 = v14 & 0xFFFFFFFFFFFFLL;
        }
        if (!v18) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      ++v6;
      if (v9 == v5) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_13:
  swift_bridgeObjectRelease();
LABEL_18:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250CBE7C(unint64_t a1)
{
  uint64_t v14 = MEMORY[0x263F8EE88];
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_225107620();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE88];
    goto LABEL_12;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_11;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x22A62C790](v5, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v5 + 32);
    }
    id v7 = v6;
    ++v5;
    id v8 = objc_msgSend(v6, sel_personHandle);
    id v9 = objc_msgSend(v8, sel_label);

    sub_2250CF800(&v13, v9);
  }
  while (v3 != v5);
  swift_bridgeObjectRelease();
  uint64_t v10 = v14;
LABEL_12:
  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v11 == v12;
}

void sub_2250CC008()
{
  OUTLINED_FUNCTION_34_1();
  unint64_t v2 = v1;
  uint64_t v3 = v1 >> 62;
  if (v1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v0 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v0 == 1)
    {
      sub_2250C6480(0, (v2 & 0xC000000000000001) == 0, v2);
      if ((v2 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x22A62C790](0, v2);
      }
      else {
        id v11 = *(id *)(v2 + 32);
      }
      uint64_t v12 = v11;
      sub_2250C94B8();

      goto LABEL_37;
    }
    if (!v0)
    {
      if (qword_2680C06A0 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_2251070F0();
      uint64_t v5 = (void *)OUTLINED_FUNCTION_33(v4, (uint64_t)qword_2680C5BD8);
      os_log_type_t v6 = sub_225107390();
      if (OUTLINED_FUNCTION_22_2(v6))
      {
        id v7 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_62_0(v7);
        OUTLINED_FUNCTION_14_2(&dword_2250AF000, v8, v9, "ContactResolutionHelper::getSameHandleTypes - Input array empty");
        OUTLINED_FUNCTION_7_1();
      }

      sub_2250BDE10();
      OUTLINED_FUNCTION_27_1();
      *uint64_t v10 = 0;
      swift_willThrow();
      goto LABEL_37;
    }
    sub_2250C6480(0, (v2 & 0xC000000000000001) == 0, v2);
    if ((v2 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x22A62C790](0, v2);
    }
    else {
      id v13 = *(id *)(v2 + 32);
    }
    uint64_t v0 = (uint64_t)v13;
    id v14 = objc_msgSend(v13, sel_personHandle);

    if (!v14) {
      goto LABEL_37;
    }
    id v15 = objc_msgSend(v14, sel_type);

    if (!v3)
    {
      uint64_t v16 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v16) {
        goto LABEL_43;
      }
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_225107620();
    if (v17 < 1) {
      goto LABEL_44;
    }
    uint64_t v16 = v17;
    swift_bridgeObjectRetain();
    sub_225107620();
    OUTLINED_FUNCTION_52_0();
    if (v0 < 1) {
      goto LABEL_45;
    }
    swift_bridgeObjectRetain();
    sub_225107620();
    OUTLINED_FUNCTION_52_0();
    if (v0 < v16) {
      break;
    }
LABEL_22:
    if ((v2 & 0xC000000000000001) != 0 && v16 != 1)
    {
      sub_2250C6950(0, &qword_2680C0D18);
      uint64_t v18 = 1;
      do
      {
        uint64_t v0 = v18 + 1;
        sub_225107520();
        uint64_t v18 = v0;
      }
      while (v16 != v0);
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
      sub_225107630();
      uint64_t v3 = v20;
      uint64_t v19 = v21;
      uint64_t v0 = v22;
      swift_bridgeObjectRelease_n();
      uint64_t v16 = (unint64_t)v0 >> 1;
    }
    else
    {
      uint64_t v3 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v19 = 1;
    }
    if (v19 == v16)
    {
LABEL_36:
      swift_unknownObjectRelease();
LABEL_37:
      OUTLINED_FUNCTION_36_1();
      return;
    }
    while (v19 < v16)
    {
      unint64_t v2 = (unint64_t)*(id *)(v3 + 8 * v19);
      id v23 = objc_msgSend((id)v2, sel_personHandle);
      if (!v23)
      {
        swift_unknownObjectRelease();

        goto LABEL_37;
      }
      uint64_t v0 = (uint64_t)v23;
      id v24 = objc_msgSend(v23, sel_type);

      if (v24 == v15 && v16 != ++v19) {
        continue;
      }
      goto LABEL_36;
    }
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    sub_225107620();
    OUTLINED_FUNCTION_52_0();
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

void sub_2250CC394()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v4 = sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2251067D0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_2();
  uint64_t v17 = v16 - v15;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_225107620()) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v18 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v18) {
    goto LABEL_10;
  }
LABEL_3:
  OUTLINED_FUNCTION_60_0();
  uint64_t v19 = (void *)MEMORY[0x22A62C790](0, v3);
  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v20 < 2)
  {
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, v1, v4);
    sub_2251067B0();
    id v21 = objc_msgSend(v19, sel_displayName);
    sub_2251071E0();

    uint64_t v22 = sub_2251067C0();
    uint64_t v23 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v23);
    *(void *)&v25[-16] = v22;
    *(void *)&v25[-8] = v17;
    sub_2250C9114(sub_2250D12C8, (uint64_t)&v25[-32], v3);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  }
LABEL_11:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250CC608(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2251067D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  if (sub_2250C8548())
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  }
  else
  {
    BOOL v11 = sub_2250C85EC();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    if (!v11)
    {
      char v14 = 0;
      goto LABEL_6;
    }
  }
  id v12 = objc_msgSend(v10, sel_displayName);
  sub_2251071E0();

  uint64_t v13 = sub_2251067C0();
  swift_bridgeObjectRelease();
  char v14 = sub_2250CC7B4(v13, a2);
  swift_bridgeObjectRelease();
LABEL_6:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14 & 1;
}

uint64_t sub_2250CC7B4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = a2 + 32;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  uint64_t v8 = (uint64_t *)(a1 + 40);
  while (v7 == v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v7 = v3;
    if (!v4) {
      goto LABEL_21;
    }
LABEL_8:
    uint64_t v13 = *(v8 - 1);
    uint64_t v11 = *v8;
    swift_bridgeObjectRetain();
    if (!v9) {
      goto LABEL_21;
    }
    if (!v11) {
      goto LABEL_19;
    }
    if (v10 == v13 && v9 == v11)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = sub_2251077B0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    --v4;
    v8 += 2;
  }
  if (v7 >= v3)
  {
    __break(1u);
    return result;
  }
  id v12 = (uint64_t *)(v5 + 16 * v7);
  uint64_t v10 = *v12;
  uint64_t v9 = v12[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    ++v7;
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v11 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return 0;
  }
  return 1;
}

unint64_t static ContactResolutionHelper.nullHandleLabelHelper(contacts:)(char *a1, unint64_t a2)
{
  sub_225105F00();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_38_1();
  sub_225106640();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_225106180();
  LOBYTE(a2) = static ContactResolutionHelper.nullHandleLabelHelper(contacts:locale:)(a1, a2);
  uint64_t v5 = OUTLINED_FUNCTION_33_0();
  v6(v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return a2 & 1;
}

uint64_t static ContactResolutionHelper.nullHandleLabelHelper(contacts:locale:)(char *a1, unint64_t a2)
{
  unint64_t v4 = a2 >> 62;
  if (!(a2 >> 62))
  {
    uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
LABEL_71:
    char v30 = 8;
    goto LABEL_72;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_225107620();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_71;
  }
LABEL_3:
  sub_2250CC394();
  char v7 = v6;
  uint64_t v80 = MEMORY[0x263F8EE78];
  sub_2250CE4A0(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v78 = v4;
    unint64_t v79 = a1;
    char v77 = v7;
    uint64_t v8 = 0;
    unint64_t v9 = a2 & 0xC000000000000001;
    do
    {
      if (v9) {
        id v10 = (id)MEMORY[0x22A62C790](v8, a2);
      }
      else {
        id v10 = *(id *)(a2 + 8 * v8 + 32);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_2250C9408();
      uint64_t v14 = v13;

      unint64_t v16 = *(void *)(v80 + 16);
      unint64_t v15 = *(void *)(v80 + 24);
      if (v16 >= v15 >> 1) {
        sub_2250CE4A0((char *)(v15 > 1), v16 + 1, 1);
      }
      ++v8;
      *(void *)(v80 + 16) = v16 + 1;
      uint64_t v17 = v80 + 16 * v16;
      *(void *)(v17 + 32) = v12;
      *(void *)(v17 + 40) = v14;
    }
    while (v5 != v8);
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = sub_2250CD11C(v18);
    if (v5 == 1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      if (qword_2680C0698 == -1) {
        goto LABEL_13;
      }
      goto LABEL_75;
    }
    if (v78)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_225107620();
      if (!v31) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v31) {
        goto LABEL_35;
      }
    }
    if (v9) {
      id v32 = (id)MEMORY[0x22A62C790](0, a2);
    }
    else {
      id v32 = *(id *)(a2 + 32);
    }
    uint64_t v33 = v32;
    sub_2250C9388();
    char v35 = v34;

    if ((v35 & 1) == 0)
    {
LABEL_39:
      swift_bridgeObjectRelease();
      uint64_t v48 = *(void *)(v19 + 16);
      swift_bridgeObjectRelease();
      uint64_t v49 = *(void *)(v80 + 16);
      swift_release();
      if ((v48 != v49) | v77 & 1)
      {
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_2251070F0();
        __swift_project_value_buffer(v50, (uint64_t)qword_2680C5BC0);
        uint64_t v51 = sub_2251070D0();
        os_log_type_t v52 = sub_2251073A0();
        if (os_log_type_enabled(v51, v52))
        {
          unint64_t v53 = (uint8_t *)OUTLINED_FUNCTION_6_2();
          *(_WORD *)unint64_t v53 = 0;
          _os_log_impl(&dword_2250AF000, v51, v52, "ContactResolutionHelper::nullHandleLabelHelper - multiple candidates with same contactId -> handle disambiguation", v53, 2u);
          OUTLINED_FUNCTION_7_1();
        }

        sub_2250CBC74();
        char v55 = v54;
        if (sub_2250CBE7C(a2) & 1) == 0 || (v55)
        {
          unint64_t v67 = swift_bridgeObjectRetain();
          a1 = v79;
          if (sub_2250C8E50(v67, a2))
          {
            uint64_t v25 = sub_2251070D0();
            os_log_type_t v68 = sub_2251073A0();
            if (!OUTLINED_FUNCTION_15_2(v68))
            {
              uint64_t v5 = 1;
              char v30 = 10;
              goto LABEL_57;
            }
            uint64_t v69 = (_WORD *)OUTLINED_FUNCTION_6_2();
            OUTLINED_FUNCTION_19_1(v69);
            OUTLINED_FUNCTION_13_2(&dword_2250AF000, v70, v71, "ContactResolutionHelper::nullHandleLabelHelper - Detailed Disambiguation: Multiple handles same label");
            uint64_t v5 = 1;
            char v30 = 10;
          }
          else
          {
            uint64_t v25 = sub_2251070D0();
            os_log_type_t v72 = sub_2251073A0();
            BOOL v73 = os_log_type_enabled(v25, v72);
            if (v5 < 4)
            {
              if (!v73)
              {
                uint64_t v5 = 1;
                char v30 = 4;
                goto LABEL_57;
              }
              uint64_t v75 = (uint8_t *)OUTLINED_FUNCTION_6_2();
              *(_WORD *)uint64_t v75 = 0;
              _os_log_impl(&dword_2250AF000, v25, v72, "ContactResolutionHelper::nullHandleLabelHelper - Simple Disambiguation: Mixed Labels", v75, 2u);
              uint64_t v5 = 1;
              char v30 = 4;
            }
            else
            {
              if (!v73)
              {
                uint64_t v5 = 1;
                char v30 = 9;
                goto LABEL_57;
              }
              uint64_t v74 = (uint8_t *)OUTLINED_FUNCTION_6_2();
              *(_WORD *)uint64_t v74 = 0;
              _os_log_impl(&dword_2250AF000, v25, v72, "ContactResolutionHelper::nullHandleLabelHelper - Detailed Disambiguation: Mixed Labels", v74, 2u);
              uint64_t v5 = 1;
              char v30 = 9;
            }
          }
          goto LABEL_55;
        }
        uint64_t v25 = sub_2251070D0();
        os_log_type_t v56 = sub_2251073A0();
        a1 = v79;
        if (!OUTLINED_FUNCTION_15_2(v56))
        {
          uint64_t v5 = 0;
          char v30 = 2;
          goto LABEL_57;
        }
        char v30 = 2;
        uint64_t v57 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v57);
        OUTLINED_FUNCTION_13_2(&dword_2250AF000, v58, v59, "ContactResolutionHelper::nullHandleLabelHelper - Simple Disambiguation: Unique Labels");
        goto LABEL_17;
      }
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_2251070F0();
      __swift_project_value_buffer(v60, (uint64_t)qword_2680C5BC0);
      uint64_t v61 = sub_2251070D0();
      os_log_type_t v62 = sub_2251073A0();
      if (os_log_type_enabled(v61, v62))
      {
        *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
        OUTLINED_FUNCTION_54(&dword_2250AF000, v63, v64, "ContactResolutionHelper::nullHandleLabelHelper - multiple candidates with different contact ids && different names -> contact name disambiguation");
        OUTLINED_FUNCTION_7_1();
      }

      uint64_t v25 = sub_2251070D0();
      os_log_type_t v65 = sub_2251073A0();
      if (OUTLINED_FUNCTION_15_2(v65))
      {
        unint64_t v66 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v66);
        uint64_t v47 = "ContactResolutionHelper::nullHandleLabelHelper - Detailed Disambiguation: Contact Names";
        goto LABEL_54;
      }
LABEL_56:
      uint64_t v5 = 0;
      char v30 = 1;
      goto LABEL_57;
    }
    if (v31 == 1)
    {
LABEL_35:
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_2251070F0();
      __swift_project_value_buffer(v42, (uint64_t)qword_2680C5BC0);
      uint64_t v25 = sub_2251070D0();
      os_log_type_t v43 = sub_225107380();
      if (OUTLINED_FUNCTION_15_2(v43))
      {
        uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v44);
        uint64_t v47 = "ContactResolutionHelper::nullHandleLabelHelper - Unnamed unknown handle!";
LABEL_54:
        OUTLINED_FUNCTION_13_2(&dword_2250AF000, v45, v46, v47);
        uint64_t v5 = 0;
        char v30 = 1;
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    uint64_t v36 = 5;
    while (1)
    {
      id v37 = v9 ? (id)MEMORY[0x22A62C790](v36 - 4, a2) : *(id *)(a2 + 8 * v36);
      uint64_t v38 = v37;
      uint64_t v39 = v36 - 3;
      if (__OFADD__(v36 - 4, 1)) {
        break;
      }
      sub_2250C9388();
      char v41 = v40;

      if ((v41 & 1) == 0) {
        goto LABEL_39;
      }
      ++v36;
      if (v39 == v31) {
        goto LABEL_35;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_75:
  swift_once();
LABEL_13:
  uint64_t v20 = sub_2251070F0();
  __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BC0);
  id v21 = sub_2251070D0();
  os_log_type_t v22 = sub_2251073A0();
  a1 = v79;
  if (os_log_type_enabled(v21, v22))
  {
    *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
    OUTLINED_FUNCTION_54(&dword_2250AF000, v23, v24, "ContactResolutionHelper::nullHandleLabelHelper - single candidate -> confirmation");
    OUTLINED_FUNCTION_7_1();
  }

  uint64_t v25 = sub_2251070D0();
  os_log_type_t v26 = sub_2251073A0();
  if (OUTLINED_FUNCTION_15_2(v26))
  {
    id v27 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v27);
    OUTLINED_FUNCTION_13_2(&dword_2250AF000, v28, v29, "ContactResolutionHelper::nullHandleLabelHelper - Yes/No Clarification: Contact Name");
    char v30 = 0;
LABEL_17:
    uint64_t v5 = 0;
LABEL_55:
    OUTLINED_FUNCTION_7_1();
    goto LABEL_57;
  }
  char v30 = 0;
  uint64_t v5 = 0;
LABEL_57:

LABEL_72:
  *a1 = v30;
  return v5;
}

uint64_t sub_2250CD11C(uint64_t a1)
{
  uint64_t v2 = sub_225107350();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2250CFA14(&v9, v5, v6);
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

BOOL sub_2250CD1D0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2250CD1E0()
{
  return sub_225107860();
}

uint64_t sub_2250CD208(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000225108DE0 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x49746361746E6F63 && a2 == 0xEF736C616974696ELL;
    if (v5 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_2251077B0();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_2250CD378()
{
  return 3;
}

uint64_t sub_2250CD380()
{
  return sub_225107880();
}

uint64_t sub_2250CD3C8(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x49746361746E6F63;
  }
  return 0x6449656C646E7562;
}

uint64_t sub_2250CD430(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0DA8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2250D171C();
  sub_2251078B0();
  OUTLINED_FUNCTION_35_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_35_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void sub_2250CD55C()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0DB8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2250D171C();
  sub_2251078A0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_2251076C0();
    uint64_t v8 = v7;
    uint64_t v20 = v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2251076C0();
    uint64_t v11 = v10;
    uint64_t v18 = v9;
    swift_bridgeObjectRetain();
    uint64_t v19 = v11;
    uint64_t v12 = sub_2251076C0();
    uint64_t v14 = v13;
    uint64_t v15 = v12;
    uint64_t v16 = OUTLINED_FUNCTION_24_2();
    v17(v16);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v4 = v20;
    v4[1] = v8;
    v4[2] = v18;
    v4[3] = v19;
    v4[4] = v15;
    v4[5] = v14;
  }
  OUTLINED_FUNCTION_36_1();
}

BOOL sub_2250CD790(char *a1, char *a2)
{
  return sub_2250CD1D0(*a1, *a2);
}

uint64_t sub_2250CD79C()
{
  return sub_2250CD380();
}

uint64_t sub_2250CD7A4()
{
  return sub_2250CD1E0();
}

uint64_t sub_2250CD7AC()
{
  return sub_2250CD3C8(*v0);
}

uint64_t sub_2250CD7B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250CD208(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250CD7DC()
{
  return sub_2250B9FF0();
}

uint64_t sub_2250CD7FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250CD378();
  *a1 = result;
  return result;
}

uint64_t sub_2250CD824(uint64_t a1)
{
  unint64_t v2 = sub_2250D171C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250CD860(uint64_t a1)
{
  unint64_t v2 = sub_2250D171C();
  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_2250CD89C@<D0>(_OWORD *a1@<X8>)
{
  sub_2250CD55C();
  if (!v1)
  {
    *a1 = v4;
    a1[1] = v5;
    double result = *(double *)&v6;
    a1[2] = v6;
  }
  return result;
}

uint64_t sub_2250CD8E0(void *a1)
{
  return sub_2250CD430(a1);
}

uint64_t sub_2250CD8F8(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_2251075F0();
    __break(1u);
  }
  else if (a1)
  {
    sub_2250C6950(0, &qword_2680C0D18);
    uint64_t result = sub_225107320();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

char *sub_2250CD9B0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_225107650();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2250CDA44(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_2_2();
    __src = (char *)OUTLINED_FUNCTION_4_5();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_2250CDAB4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_2();
    uint64_t result = (char *)OUTLINED_FUNCTION_4_5();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_2(a3, result);
  }
  return result;
}

char *sub_2250CDB10(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_225107650();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_2250CDBA4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_225107650();
    __break(1u);
  }
  else if (__dst != __src || &__src[64 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, a2 << 6);
  }
  return __src;
}

void sub_2250CDC38(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_2250CDC50(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_2();
    uint64_t result = (char *)OUTLINED_FUNCTION_4_5();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_2(a3, result);
  }
  return result;
}

void sub_2250CDCB4(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_2250CDCCC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_2();
    uint64_t v9 = OUTLINED_FUNCTION_4_5();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v9);
    return;
  }
  if (a3 < a1 || (a4(0), OUTLINED_FUNCTION_23_2(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = OUTLINED_FUNCTION_43_1();
    MEMORY[0x270FA01D8](v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = OUTLINED_FUNCTION_43_1();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

uint64_t sub_2250CDDC8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CDEC8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    sub_2250C6950(0, &qword_2680C0D18);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CDFD4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_2_2();
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CE09C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CE17C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + (a2 << 6) > a1 ? (BOOL v3 = a1 + (a2 << 6) > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CE25C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2250CE274(a1, a2, a3, MEMORY[0x263F6FBA8]);
}

uint64_t sub_2250CE274(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0
    || ((a4(0), OUTLINED_FUNCTION_23_2(), uint64_t v8 = *(void *)(v7 + 72) * a2, v9 = a3 + v8, v10 = a1 + v8, v9 > a1)
      ? (BOOL v11 = v10 > a3)
      : (BOOL v11 = 0),
        v11))
  {
    OUTLINED_FUNCTION_2_2();
    uint64_t result = sub_225107650();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2250CE370(uint64_t result, uint64_t a2, void *a3)
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

void *sub_2250CE38C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      BOOL v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
      BOOL v3 = (void *)swift_allocObject();
      size_t v4 = _swift_stdlib_malloc_size(v3);
      v3[2] = v2;
      v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_2250D0DA8((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_225107620();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

char *sub_2250CE480(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2250CE5A0(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_2250CE4A0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2250CE684(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_2250CE4C0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2250CE768(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_2250CE4E0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2250CE84C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

void sub_2250CE500()
{
  sub_2250CE930();
  void *v0 = v1;
}

void sub_2250CE550()
{
  sub_2250CE930();
  void *v0 = v1;
}

char *sub_2250CE5A0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D98);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2250CD9B0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2250CDDC8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_2250CE684(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D70);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2250CDAB4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2250CDFD4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_2250CE768(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D50);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2250CDB10(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2250CE09C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_2250CE84C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D48);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 64);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2250CDBA4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2250CE17C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_2250CE930()
{
  OUTLINED_FUNCTION_8_3();
  size_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v7 = v1;
  char v9 = v8;
  if (v10)
  {
    unint64_t v11 = *(void *)(v1 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < v0)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v12 = v0;
      }
    }
  }
  else
  {
    uint64_t v12 = v0;
  }
  uint64_t v13 = *(void *)(v1 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(v2);
  uint64_t v15 = *(void *)(v6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v19 - v17 == 0x8000000000000000 && v16 == -1) {
    goto LABEL_24;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(v6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  unint64_t v24 = v7 + v22;
  if (v9)
  {
    sub_2250CDCCC(v24, v13, v23, v4);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    sub_2250CE274(v24, v13, v23, v4);
  }
  swift_release();
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250CEAD4(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2250D147C();
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  sub_2250CEBC0(v8, a2);
  return sub_225107590();
}

uint64_t sub_2250CEB58(uint64_t a1, uint64_t a2)
{
  return sub_2250CEB84(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void))sub_2250CB6C0);
}

uint64_t sub_2250CEB84(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void, void, void))
{
  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8]);
}

void sub_2250CEBC0(uint64_t *a1, id a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1[1];
  uint64_t v6 = sub_225107790();
  if (v6 >= v5)
  {
    if ((v5 & 0x8000000000000000) == 0)
    {
      if (v5) {
        sub_2250CF378(0, v5, 1, a1, a2);
      }
      return;
    }
    goto LABEL_159;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_2250CD8F8(v5 / 2);
  __dst = v9;
  uint64_t v119 = v8;
  v108 = a1;
  if (v5 <= 0)
  {
LABEL_123:
    uint64_t v12 = (char *)MEMORY[0x263F8EE78];
    unint64_t v50 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_124:
    if (v50 < 2)
    {
LABEL_135:
      swift_bridgeObjectRelease();
      if (v5 >= -1) {
        goto LABEL_136;
      }
      goto LABEL_163;
    }
    uint64_t v100 = *v108;
    while (1)
    {
      unint64_t v101 = v50 - 2;
      if (v50 < 2) {
        break;
      }
      if (!v100) {
        goto LABEL_167;
      }
      uint64_t v102 = v12;
      uint64_t v103 = *(void *)&v12[16 * v101 + 32];
      uint64_t v104 = *(void *)&v12[16 * v50 + 24];
      sub_2250CF480((id *)(v100 + 8 * v103), (id *)(v100 + 8 * *(void *)&v12[16 * v50 + 16]), v100 + 8 * v104, __dst, a2);
      if (v3) {
        goto LABEL_121;
      }
      if (v104 < v103) {
        goto LABEL_154;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v102 = sub_2250CF7EC((uint64_t)v102);
      }
      if (v101 >= *((void *)v102 + 2)) {
        goto LABEL_155;
      }
      uint64_t v105 = &v102[16 * v101 + 32];
      *(void *)uint64_t v105 = v103;
      *((void *)v105 + 1) = v104;
      unint64_t v106 = *((void *)v102 + 2);
      if (v50 > v106) {
        goto LABEL_156;
      }
      memmove(&v102[16 * v50 + 16], &v102[16 * v50 + 32], 16 * (v106 - v50));
      uint64_t v12 = v102;
      *((void *)v102 + 2) = v106 - 1;
      unint64_t v50 = v106 - 1;
      if (v106 <= 2) {
        goto LABEL_135;
      }
    }
LABEL_153:
    __break(1u);
LABEL_154:
    __break(1u);
LABEL_155:
    __break(1u);
LABEL_156:
    __break(1u);
LABEL_157:
    __break(1u);
    goto LABEL_158;
  }
  uint64_t v109 = v7;
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 - 8;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v112 = v5;
  uint64_t v117 = *a1;
  while (2)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v10 + 1;
    uint64_t v113 = v10;
    if (v10 + 1 >= v5)
    {
      ++v10;
      goto LABEL_45;
    }
    uint64_t v110 = v12;
    uint64_t v15 = v3;
    uint64_t v16 = *(void **)(v11 + 8 * v10);
    id v17 = *(id *)(v11 + 8 * v14);
    id v18 = v16;
    id v19 = objc_msgSend(v17, sel_searchProvider);
    id v20 = objc_msgSend(v18, sel_searchProvider);

    uint64_t v5 = v112;
    if (v19 != a2 && (v20 == a2 || (v19 == (id)1 ? (BOOL v22 = v20 == (id)3) : (BOOL v22 = 0), v22)))
    {
      uint64_t v10 = v13 + 2;
      if (v13 + 2 >= v112)
      {
        uint64_t v3 = v15;
        uint64_t v12 = v110;
        uint64_t v11 = v117;
        goto LABEL_45;
      }
      int v21 = 0;
    }
    else
    {
      uint64_t v10 = v13 + 2;
      if (v13 + 2 >= v112)
      {
        uint64_t v3 = v15;
        uint64_t v12 = v110;
        uint64_t v11 = v117;
        goto LABEL_39;
      }
      int v21 = 1;
    }
    uint64_t v11 = v117;
    do
    {
      uint64_t v23 = v10;
      unint64_t v24 = *(void **)(v11 + 8 * v10);
      uint64_t v25 = *(void **)(v11 + 8 * v14);
      id v26 = v24;
      id v27 = v25;
      id v28 = objc_msgSend(v26, sel_searchProvider);
      id v29 = objc_msgSend(v27, sel_searchProvider);

      if (v28 == a2)
      {
        if (v29 != a2)
        {
          uint64_t v5 = v112;
          uint64_t v11 = v117;
          if ((v21 & 1) == 0) {
            goto LABEL_36;
          }
          goto LABEL_31;
        }
      }
      else if (v29 == a2)
      {
        uint64_t v5 = v112;
        uint64_t v11 = v117;
        goto LABEL_30;
      }
      BOOL v30 = v28 == (id)1 && v29 == (id)3;
      uint64_t v5 = v112;
      uint64_t v11 = v117;
      if (!v30)
      {
        if ((v21 & 1) == 0)
        {
LABEL_36:
          uint64_t v10 = v23;
          uint64_t v3 = v15;
          uint64_t v12 = v110;
          uint64_t v13 = v113;
          goto LABEL_45;
        }
        goto LABEL_31;
      }
LABEL_30:
      if (v21)
      {
        uint64_t v10 = v23;
        uint64_t v3 = v15;
        uint64_t v12 = v110;
        uint64_t v13 = v113;
        goto LABEL_38;
      }
LABEL_31:
      uint64_t v10 = v23 + 1;
      uint64_t v14 = v23;
    }
    while (v23 + 1 < v5);
    uint64_t v3 = v15;
    uint64_t v12 = v110;
    uint64_t v13 = v113;
    if (!v21) {
      goto LABEL_45;
    }
LABEL_38:
    if (v10 < v13) {
      goto LABEL_160;
    }
LABEL_39:
    if (v13 < v10)
    {
      uint64_t v31 = (uint64_t *)(v107 + 8 * v10);
      uint64_t v32 = v10;
      uint64_t v33 = v13;
      char v34 = (uint64_t *)(v11 + 8 * v13);
      do
      {
        if (v33 != --v32)
        {
          if (!v11) {
            goto LABEL_166;
          }
          uint64_t v35 = *v34;
          *char v34 = *v31;
          *uint64_t v31 = v35;
        }
        ++v33;
        --v31;
        ++v34;
      }
      while (v33 < v32);
    }
LABEL_45:
    if (v10 < v5)
    {
      if (!__OFSUB__(v10, v13))
      {
        if (v10 - v13 >= v109) {
          goto LABEL_66;
        }
        if (!__OFADD__(v13, v109))
        {
          if (v13 + v109 >= v5) {
            uint64_t v36 = v5;
          }
          else {
            uint64_t v36 = v13 + v109;
          }
          if (v36 >= v13)
          {
            if (v10 != v36)
            {
              uint64_t v111 = v12;
              uint64_t v115 = v3;
              uint64_t v37 = v107 + 8 * v10;
              do
              {
                uint64_t v38 = *(void **)(v11 + 8 * v10);
                uint64_t v39 = v37;
                do
                {
                  char v40 = *(void **)v39;
                  id v41 = v38;
                  id v42 = v40;
                  id v43 = objc_msgSend(v41, sel_searchProvider);
                  id v44 = objc_msgSend(v42, sel_searchProvider);

                  uint64_t v11 = v117;
                  if (v43 != a2)
                  {
                    if (v44 == a2) {
                      break;
                    }
                    if (v43 == (id)1 && v44 == (id)3) {
                      break;
                    }
                  }
                  if (!v117) {
                    goto LABEL_164;
                  }
                  uint64_t v46 = *(void **)v39;
                  uint64_t v38 = *(void **)(v39 + 8);
                  *(void *)uint64_t v39 = v38;
                  *(void *)(v39 + 8) = v46;
                  v39 -= 8;
                  ++v13;
                }
                while (v10 != v13);
                ++v10;
                v37 += 8;
                uint64_t v13 = v113;
              }
              while (v10 != v36);
              uint64_t v10 = v36;
              uint64_t v3 = v115;
              uint64_t v12 = v111;
            }
            goto LABEL_66;
          }
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
          return;
        }
LABEL_161:
        __break(1u);
        goto LABEL_162;
      }
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
      goto LABEL_161;
    }
LABEL_66:
    if (v10 < v13) {
      goto LABEL_157;
    }
    uint64_t v47 = v12;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v12 = v47;
    }
    else {
      uint64_t v12 = sub_2250CF6F4(0, *((void *)v47 + 2) + 1, 1, v47);
    }
    unint64_t v49 = *((void *)v12 + 2);
    unint64_t v48 = *((void *)v12 + 3);
    unint64_t v50 = v49 + 1;
    uint64_t v11 = v117;
    uint64_t v116 = v3;
    if (v49 >= v48 >> 1)
    {
      unint64_t v99 = sub_2250CF6F4((char *)(v48 > 1), v49 + 1, 1, v12);
      uint64_t v11 = v117;
      uint64_t v12 = v99;
    }
    *((void *)v12 + 2) = v50;
    uint64_t v51 = v12 + 32;
    os_log_type_t v52 = &v12[16 * v49 + 32];
    *(void *)os_log_type_t v52 = v113;
    *((void *)v52 + 1) = v10;
    if (!v49)
    {
      unint64_t v50 = 1;
LABEL_114:
      uint64_t v5 = v112;
      uint64_t v3 = v116;
      if (v10 >= v112) {
        goto LABEL_124;
      }
      continue;
    }
    break;
  }
  while (1)
  {
    unint64_t v53 = v50 - 1;
    if (v50 >= 4)
    {
      uint64_t v58 = &v51[16 * v50];
      uint64_t v59 = *((void *)v58 - 8);
      uint64_t v60 = *((void *)v58 - 7);
      BOOL v64 = __OFSUB__(v60, v59);
      uint64_t v61 = v60 - v59;
      if (v64) {
        goto LABEL_142;
      }
      uint64_t v63 = *((void *)v58 - 6);
      uint64_t v62 = *((void *)v58 - 5);
      BOOL v64 = __OFSUB__(v62, v63);
      uint64_t v56 = v62 - v63;
      char v57 = v64;
      if (v64) {
        goto LABEL_143;
      }
      unint64_t v65 = v50 - 2;
      unint64_t v66 = &v51[16 * v50 - 32];
      uint64_t v68 = *(void *)v66;
      uint64_t v67 = *((void *)v66 + 1);
      BOOL v64 = __OFSUB__(v67, v68);
      uint64_t v69 = v67 - v68;
      if (v64) {
        goto LABEL_144;
      }
      BOOL v64 = __OFADD__(v56, v69);
      uint64_t v70 = v56 + v69;
      if (v64) {
        goto LABEL_146;
      }
      if (v70 >= v61)
      {
        uint64_t v88 = &v51[16 * v53];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v64 = __OFSUB__(v89, v90);
        uint64_t v91 = v89 - v90;
        if (v64) {
          goto LABEL_152;
        }
        BOOL v81 = v56 < v91;
        goto LABEL_103;
      }
    }
    else
    {
      if (v50 != 3)
      {
        uint64_t v82 = *((void *)v12 + 4);
        uint64_t v83 = *((void *)v12 + 5);
        BOOL v64 = __OFSUB__(v83, v82);
        uint64_t v75 = v83 - v82;
        char v76 = v64;
        goto LABEL_97;
      }
      uint64_t v55 = *((void *)v12 + 4);
      uint64_t v54 = *((void *)v12 + 5);
      BOOL v64 = __OFSUB__(v54, v55);
      uint64_t v56 = v54 - v55;
      char v57 = v64;
    }
    if (v57) {
      goto LABEL_145;
    }
    unint64_t v65 = v50 - 2;
    uint64_t v71 = &v51[16 * v50 - 32];
    uint64_t v73 = *(void *)v71;
    uint64_t v72 = *((void *)v71 + 1);
    BOOL v74 = __OFSUB__(v72, v73);
    uint64_t v75 = v72 - v73;
    char v76 = v74;
    if (v74) {
      goto LABEL_147;
    }
    char v77 = &v51[16 * v53];
    uint64_t v79 = *(void *)v77;
    uint64_t v78 = *((void *)v77 + 1);
    BOOL v64 = __OFSUB__(v78, v79);
    uint64_t v80 = v78 - v79;
    if (v64) {
      goto LABEL_149;
    }
    if (__OFADD__(v75, v80)) {
      goto LABEL_151;
    }
    if (v75 + v80 >= v56)
    {
      BOOL v81 = v56 < v80;
LABEL_103:
      if (v81) {
        unint64_t v53 = v65;
      }
      goto LABEL_105;
    }
LABEL_97:
    if (v76) {
      goto LABEL_148;
    }
    uint64_t v84 = &v51[16 * v53];
    uint64_t v86 = *(void *)v84;
    uint64_t v85 = *((void *)v84 + 1);
    BOOL v64 = __OFSUB__(v85, v86);
    uint64_t v87 = v85 - v86;
    if (v64) {
      goto LABEL_150;
    }
    if (v87 < v75) {
      goto LABEL_114;
    }
LABEL_105:
    unint64_t v92 = v53 - 1;
    if (v53 - 1 >= v50)
    {
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
      goto LABEL_153;
    }
    if (!v11) {
      goto LABEL_165;
    }
    uint64_t v93 = v12;
    uint64_t v94 = &v51[16 * v92];
    uint64_t v95 = *(void *)v94;
    uint64_t v96 = &v51[16 * v53];
    uint64_t v97 = *((void *)v96 + 1);
    sub_2250CF480((id *)(v11 + 8 * *(void *)v94), (id *)(v11 + 8 * *(void *)v96), v11 + 8 * v97, __dst, a2);
    if (v116) {
      break;
    }
    if (v97 < v95) {
      goto LABEL_139;
    }
    if (v53 > *((void *)v93 + 2)) {
      goto LABEL_140;
    }
    *(void *)uint64_t v94 = v95;
    *(void *)&v51[16 * v92 + 8] = v97;
    unint64_t v98 = *((void *)v93 + 2);
    if (v53 >= v98) {
      goto LABEL_141;
    }
    unint64_t v50 = v98 - 1;
    memmove(&v51[16 * v53], v96 + 16, 16 * (v98 - 1 - v53));
    uint64_t v12 = v93;
    *((void *)v93 + 2) = v98 - 1;
    uint64_t v11 = v117;
    if (v98 <= 2) {
      goto LABEL_114;
    }
  }
  uint64_t v3 = v116;
  uint64_t v5 = v112;
LABEL_121:
  swift_bridgeObjectRelease();
  if (v5 < -1)
  {
    __break(1u);
    goto LABEL_123;
  }
LABEL_136:
  *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_225107300();
  swift_bridgeObjectRelease();
}

void sub_2250CF378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, id a5)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
    while (2)
    {
      char v9 = *(void **)(v7 + 8 * v6);
      uint64_t v10 = a1;
      uint64_t v20 = v8;
      do
      {
        uint64_t v11 = *(void **)v8;
        id v12 = v9;
        id v13 = v11;
        id v14 = objc_msgSend(v12, sel_searchProvider);
        id v15 = objc_msgSend(v13, sel_searchProvider);

        if (v14 != a5)
        {
          if (v15 == a5) {
            break;
          }
          if (v14 == (id)1 && v15 == (id)3) {
            break;
          }
        }
        if (!v7)
        {
          __break(1u);
          return;
        }
        id v17 = *(void **)v8;
        char v9 = *(void **)(v8 + 8);
        *(void *)uint64_t v8 = v9;
        *(void *)(v8 + 8) = v17;
        v8 -= 8;
        ++v10;
      }
      while (v6 != v10);
      ++v6;
      uint64_t v8 = v20 + 8;
      if (v6 != a2) {
        continue;
      }
      break;
    }
  }
}

uint64_t sub_2250CF480(id *__src, id *a2, unint64_t a3, char *__dst, id a5)
{
  uint64_t v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = a2 - __src;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = (uint64_t)(a3 - (void)a2) / 8;
  if (v10 >= v12)
  {
    sub_2250CD9B0((char *)a2, (uint64_t)(a3 - (void)a2) / 8, __dst);
    id v41 = __dst;
    id v13 = &__dst[8 * v12];
    if (v8 >= v7 || v11 < 8)
    {
      id v15 = __dst;
      goto LABEL_52;
    }
    id v27 = (id *)(a3 - 8);
    while (1)
    {
      id v42 = v27 + 1;
      id v43 = (id *)v13;
      id v28 = v13 - 8;
      id v29 = v7 - 1;
      BOOL v30 = *(v7 - 1);
      id v31 = *((id *)v13 - 1);
      id v32 = v30;
      id v33 = objc_msgSend(v31, sel_searchProvider);
      id v34 = objc_msgSend(v32, sel_searchProvider);

      if (v33 != a5 && (v34 == a5 || (v33 == (id)1 ? (BOOL v38 = v34 == (id)3) : (BOOL v38 = 0), v38)))
      {
        BOOL v39 = v42 != v43 || v27 >= v43;
        id v29 = (id *)v28;
        id v13 = v28;
        uint64_t v35 = v41;
        if (!v39) {
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v35 = v41;
        BOOL v36 = v42 != v7 || v27 >= v7;
        --v7;
        id v13 = (char *)v43;
        if (!v36) {
          goto LABEL_36;
        }
      }
      *id v27 = *v29;
LABEL_36:
      --v27;
      if (v7 <= v8 || v13 <= v35)
      {
        id v15 = v41;
        goto LABEL_52;
      }
    }
  }
  sub_2250CD9B0((char *)__src, a2 - __src, __dst);
  id v13 = &__dst[8 * v10];
  BOOL v14 = (unint64_t)v7 >= a3 || v9 < 8;
  id v15 = __dst;
  if (!v14)
  {
    do
    {
      uint64_t v16 = v13;
      id v17 = *(void **)v15;
      id v18 = *v7;
      id v19 = v17;
      id v20 = objc_msgSend(v18, sel_searchProvider);
      id v21 = objc_msgSend(v19, sel_searchProvider);

      if (v20 != a5 && (v21 == a5 || (v20 == (id)1 ? (BOOL v24 = v21 == (id)3) : (BOOL v24 = 0), v24)))
      {
        BOOL v22 = (id *)v15;
        BOOL v23 = v8 == (id *)v15;
        v15 += 8;
      }
      else
      {
        BOOL v22 = v7;
        BOOL v23 = v8 == v7++;
      }
      id v13 = v16;
      if (!v23) {
        *uint64_t v8 = *v22;
      }
      ++v8;
    }
    while (v15 < v16 && (unint64_t)v7 < a3);
  }
  uint64_t v7 = v8;
LABEL_52:
  sub_2250CD9B0(v15, (v13 - v15) / 8, (char *)v7);
  return 1;
}

char *sub_2250CF6F4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D90);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2250CF7EC(uint64_t a1)
{
  return sub_2250CF6F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2250CF800(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_225107850();
  sub_225107870();
  if (a2)
  {
    sub_2251071E0();
    swift_bridgeObjectRetain();
    id v7 = a2;
    sub_225107240();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v8 = sub_225107880();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v19 = a2;
    sub_2250D0160((uint64_t)a2, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v23;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v11 = ~v9;
  while (1)
  {
    if (!*(void *)(*(void *)(v6 + 48) + 8 * v10))
    {
      if (!a2) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
    if (!a2) {
      goto LABEL_15;
    }
    uint64_t v12 = sub_2251071E0();
    uint64_t v14 = v13;
    if (v12 == sub_2251071E0() && v14 == v15) {
      break;
    }
    char v17 = sub_2251077B0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_18;
    }
LABEL_15:
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_16;
    }
  }

  swift_bridgeObjectRelease_n();
LABEL_18:

LABEL_19:
  swift_bridgeObjectRelease();
  id v21 = *(void **)(*(void *)(*v3 + 48) + 8 * v10);
  *a1 = v21;
  id v22 = v21;
  return 0;
}

uint64_t sub_2250CFA14(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_225107850();
  swift_bridgeObjectRetain();
  sub_225107240();
  uint64_t v8 = sub_225107880();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2251077B0() & 1) != 0)
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2251077B0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2250D0374(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_2250CFBC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D60);
  uint64_t v3 = sub_2251074E0();
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
    char v5 = (void *)(v2 + 56);
    uint64_t v6 = -1;
    if (v4 < 64) {
      uint64_t v6 = ~(-1 << v4);
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v4 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v10 = 0;
    if (!v7) {
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      unint64_t result = sub_2250D0070(*(void **)(*(void *)(v2 + 48) + 8 * i), v3);
      if (v7) {
        goto LABEL_5;
      }
LABEL_6:
      int64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        return result;
      }
      if (v13 >= v8) {
        goto LABEL_22;
      }
      unint64_t v14 = v5[v13];
      ++v10;
      if (!v14)
      {
        int64_t v10 = v13 + 1;
        if (v13 + 1 >= v8) {
          goto LABEL_22;
        }
        unint64_t v14 = v5[v10];
        if (!v14)
        {
          int64_t v10 = v13 + 2;
          if (v13 + 2 >= v8) {
            goto LABEL_22;
          }
          unint64_t v14 = v5[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v8)
            {
LABEL_22:
              swift_release();
              uint64_t v16 = 1 << *(unsigned char *)(v2 + 32);
              if (v16 > 63) {
                sub_2250CE370(0, (unint64_t)(v16 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *char v5 = -1 << v16;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v5[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_28;
                }
                if (v10 >= v8) {
                  goto LABEL_22;
                }
                unint64_t v14 = v5[v10];
                ++v15;
                if (v14) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v10 = v15;
          }
        }
      }
LABEL_19:
      unint64_t v7 = (v14 - 1) & v14;
    }
  }
  unint64_t result = swift_release();
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_2250CFD94()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D68);
  uint64_t v3 = sub_2251074E0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    BOOL v30 = (void *)(v2 + 56);
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
      sub_225107850();
      sub_225107240();
      uint64_t result = sub_225107880();
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
      id v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *id v28 = v18;
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
                sub_2250CE370(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *BOOL v30 = -1 << v29;
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

unint64_t sub_2250D0070(void *a1, uint64_t a2)
{
  sub_225107850();
  sub_225107870();
  if (a1)
  {
    sub_2251071E0();
    id v4 = a1;
    sub_225107240();

    swift_bridgeObjectRelease();
  }
  sub_225107880();
  unint64_t result = sub_225107490();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_2250D0160(uint64_t result, unint64_t a2, char a3)
{
  id v4 = v3;
  uint64_t v6 = (void *)result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_2250CFBC4();
    }
    else
    {
      if (v8 > v7)
      {
        unint64_t result = (uint64_t)sub_2250D0510();
        goto LABEL_22;
      }
      sub_2250D0870();
    }
    uint64_t v9 = *v3;
    sub_225107850();
    sub_225107870();
    if (v6)
    {
      sub_2251071E0();
      id v10 = v6;
      sub_225107240();

      swift_bridgeObjectRelease();
    }
    unint64_t result = sub_225107880();
    uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
    a2 = result & ~v11;
    if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v12 = ~v11;
      do
      {
        unint64_t result = *(void *)(*(void *)(v9 + 48) + 8 * a2);
        if (result)
        {
          if (v6)
          {
            uint64_t v13 = sub_2251071E0();
            uint64_t v15 = v14;
            if (v13 == sub_2251071E0() && v15 == v16) {
              goto LABEL_25;
            }
            char v18 = sub_2251077B0();

            swift_bridgeObjectRelease();
            unint64_t result = swift_bridgeObjectRelease();
            if (v18) {
              goto LABEL_26;
            }
          }
        }
        else if (!v6)
        {
          goto LABEL_26;
        }
        a2 = (a2 + 1) & v12;
      }
      while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_22:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = v6;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
    __break(1u);
LABEL_25:

    swift_bridgeObjectRelease_n();
LABEL_26:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D58);
    unint64_t result = sub_2251077D0();
    __break(1u);
  }
  else
  {
    *(void *)(v19 + 16) = v22;
  }
  return result;
}

uint64_t sub_2250D0374(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2250CFD94();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_2250D06BC();
      goto LABEL_22;
    }
    sub_2250D0A0C();
  }
  uint64_t v11 = *v4;
  sub_225107850();
  sub_225107240();
  unint64_t result = sub_225107880();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_2251077B0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_2251077D0();
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
        char v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_2251077B0();
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
  BOOL v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *BOOL v21 = v8;
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

id sub_2250D0510()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2251074D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
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

void *sub_2250D06BC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D68);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2251074D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    id result = (void *)swift_bridgeObjectRetain();
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

unint64_t sub_2250D0870()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D60);
  uint64_t v3 = sub_2251074E0();
  if (!*(void *)(v2 + 16))
  {
LABEL_23:
    unint64_t result = swift_release();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = v2 + 56;
  uint64_t v6 = -1;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_retain();
  int64_t v10 = 0;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    BOOL v16 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    id v17 = v16;
    unint64_t result = sub_2250D0070(v16, v3);
    if (v7) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8) {
      goto LABEL_22;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v8) {
        goto LABEL_22;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v8) {
          goto LABEL_22;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_22;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2250D0A0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D68);
  uint64_t v3 = sub_2251074E0();
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
    id v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_225107850();
    swift_bridgeObjectRetain();
    sub_225107240();
    uint64_t result = sub_225107880();
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
    id v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *id v28 = v18;
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

void sub_2250D0CB8(uint64_t a1, void *a2)
{
  id v3 = (id)sub_225107150();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);
}

uint64_t sub_2250D0D38(void *a1)
{
  id v2 = objc_msgSend(a1, sel_value);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2251071E0();

  return v3;
}

uint64_t sub_2250D0DA8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_225107620();
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
      uint64_t v8 = sub_225107620();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2250D13E0();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D80);
            int64_t v10 = sub_2250C6590(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
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
        sub_2250CDEC8((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

uint64_t sub_2250D0F38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 4:
      goto LABEL_4;
    case 2:
      goto LABEL_4;
    case 3:
      swift_bridgeObjectRelease();
LABEL_4:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for ContactResolutionResponseHandler()
{
}

uint64_t destroy for ContactResolutionResponseHandler.DirectInvocationValue(uint64_t a1)
{
  return sub_2250D0F38(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t _s17SiriInferenceFlow32ContactResolutionResponseHandlerV21DirectInvocationValueOwcp_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_19_2(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 24) = v6;
  return v2;
}

uint64_t _s17SiriInferenceFlow32ContactResolutionResponseHandlerV21DirectInvocationValueOwca_0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_19_2(a1, a2);
  uint64_t v7 = *(void *)v2;
  uint64_t v8 = *(void *)(v2 + 8);
  uint64_t v9 = *(void *)(v2 + 16);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  char v10 = *(unsigned char *)(v2 + 24);
  *(unsigned char *)(v2 + 24) = v6;
  sub_2250D0F38(v7, v8, v9, v10);
  return v2;
}

uint64_t _s17SiriInferenceFlow32ContactResolutionResponseHandlerV21DirectInvocationValueOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_2250D0F38(v5, v7, v6, v8);
  return a1;
}

uint64_t _s17SiriInferenceFlow32ContactResolutionResponseHandlerV21DirectInvocationValueOwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 4) {
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

uint64_t _s17SiriInferenceFlow32ContactResolutionResponseHandlerV21DirectInvocationValueOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2250D1190(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2250D1198(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

void type metadata accessor for ContactResolutionResponseHandler.DirectInvocationValue()
{
}

void type metadata accessor for ContactResolutionHelper()
{
}

uint64_t sub_2250D11B8()
{
  uint64_t v0 = sub_2251071E0();
  uint64_t v2 = v1;
  if (v0 == sub_2251071E0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2251077B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2250D1240()
{
  sub_2251071E0();
  sub_225107240();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250D1294()
{
  return sub_225105C80() & 1;
}

uint64_t sub_2250D12C8(void **a1)
{
  return sub_2250CC608(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_2250D12E8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_23_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_2250D133C()
{
  unint64_t result = qword_2680C0D78;
  if (!qword_2680C0D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0D78);
  }
  return result;
}

uint64_t sub_2250D1388(uint64_t a1, unint64_t a2)
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

unint64_t sub_2250D13E0()
{
  unint64_t result = qword_2680C0D88;
  if (!qword_2680C0D88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2680C0D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0D88);
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

void sub_2250D147C()
{
}

uint64_t sub_2250D1490(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_23_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t destroy for ContactHandle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_2250D1530(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_2250D1588(void *a1, void *a2)
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

void *sub_2250D162C(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2250D1684(uint64_t a1, int a2)
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

uint64_t sub_2250D16C4(uint64_t result, int a2, int a3)
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

void type metadata accessor for SiriInferenceFlowsViewDataModels.ViewData()
{
}

unint64_t sub_2250D171C()
{
  unint64_t result = qword_2680C0DB0;
  if (!qword_2680C0DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0DB0);
  }
  return result;
}

void type metadata accessor for SiriInferenceFlowsViewDataModels()
{
}

unsigned char *storeEnumTagSinglePayload for SiriInferenceFlowsViewDataModels.ViewData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250D1840);
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

ValueMetadata *type metadata accessor for SiriInferenceFlowsViewDataModels.ViewData.CodingKeys()
{
  return &type metadata for SiriInferenceFlowsViewDataModels.ViewData.CodingKeys;
}

unint64_t sub_2250D187C()
{
  unint64_t result = qword_2680C0DC0;
  if (!qword_2680C0DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0DC0);
  }
  return result;
}

unint64_t sub_2250D18CC()
{
  unint64_t result = qword_2680C0DC8;
  if (!qword_2680C0DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0DC8);
  }
  return result;
}

unint64_t sub_2250D191C()
{
  unint64_t result = qword_2680C0DD0;
  if (!qword_2680C0DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C0DD0);
  }
  return result;
}

void OUTLINED_FUNCTION_1_4()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  sub_225102CB8(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_3_4(char a1, int64_t a2)
{
  sub_225102CB8(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_225107650();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_bridgeObjectRetain();
}

void *OUTLINED_FUNCTION_10_2@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void OUTLINED_FUNCTION_13_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 2u);
}

void OUTLINED_FUNCTION_14_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_15_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return *(void *)(v0 - 232);
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  return sub_2250CB598(v5, v6, v3, v4);
}

uint64_t OUTLINED_FUNCTION_20_2(unint64_t a1)
{
  return sub_2250CAAD4(a1);
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return 0x61486E6F73726570;
}

BOOL OUTLINED_FUNCTION_22_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return sub_225107740();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_50_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return sub_2250D12E8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_54(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return sub_2250C6480(0, (v0 & 0xC000000000000001) == 0, v0);
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return 0x6C6562616CLL;
}

_WORD *OUTLINED_FUNCTION_62_0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_2250D1E6C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F38);
    uint64_t v2 = sub_225107640();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_2250B7A60(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2250BADA0(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_2250BADA0(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_2250BADA0(v40, v41);
    sub_2250BADA0(v41, &v37);
    uint64_t v21 = sub_2251074A0();
    uint64_t v22 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v6 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)(v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = *(void *)(v2 + 48) + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_2250BADA0(&v37, (_OWORD *)(*(void *)(v2 + 56) + 32 * v25));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_85();
      if (v13 == v14) {
        goto LABEL_40;
      }
      OUTLINED_FUNCTION_84();
      if (!v11)
      {
        OUTLINED_FUNCTION_85();
        if (v13 == v14) {
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_84();
        if (!v11)
        {
          OUTLINED_FUNCTION_85();
          if (v13 == v14) {
            goto LABEL_40;
          }
          OUTLINED_FUNCTION_84();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_2250D9A2C();
    return;
  }
  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    OUTLINED_FUNCTION_85();
    if (v13 == v14) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_84();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

uint64_t ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  ContactResolutionSnippetGenerator.init(appBundleId:globals:)(a1, a2, a3);
  return v6;
}

void *ContactResolutionSnippetGenerator.init(appBundleId:globals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_225106640();
  sub_2250BFD9C(&v5, (uint64_t)(v3 + 5));
  return v3;
}

void *ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  unint64_t v8 = (void *)swift_allocObject();
  uint64_t v8[2] = a1;
  v8[3] = a2;
  void v8[4] = a3;
  sub_2250BFD9C(a4, (uint64_t)(v8 + 5));
  return v8;
}

void *ContactResolutionSnippetGenerator.init(appBundleId:globals:deviceState:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  sub_2250BFD9C(a4, (uint64_t)(v4 + 5));
  return v4;
}

uint64_t ContactResolutionSnippetGenerator.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_5(v1, v2, v3, v4, v5);
  v0[33] = v6;
  uint64_t v7 = sub_225106290();
  v0[34] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v0[35] = v8;
  uint64_t v9 = OUTLINED_FUNCTION_20_1();
  uint64_t v10 = OUTLINED_FUNCTION_71_0(v9);
  v0[37] = v10;
  OUTLINED_FUNCTION_1_3(v10);
  v0[38] = v11;
  uint64_t v12 = OUTLINED_FUNCTION_35_2();
  v0[40] = OUTLINED_FUNCTION_58_1(v12);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

#error "2250D24A8: call analysis failed (funcsize=78)"

uint64_t sub_2250D2548()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 344) = v0;
  swift_task_dealloc();
  uint64_t v7 = OUTLINED_FUNCTION_4_6();
  v8(v7);
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_73_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250D2690()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return sub_2250D2758();
}

uint64_t sub_2250D2758()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v5 = OUTLINED_FUNCTION_91(v1, v2, v3, v4);
  v0[54] = v5;
  OUTLINED_FUNCTION_1_3(v5);
  v0[55] = v6;
  v0[56] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2250D27DC()
{
  uint64_t v88 = v0;
  unint64_t v1 = *(void *)(v0 + 400);
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_90();
    uint64_t v48 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v48) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v3 = *(void *)(v0 + 416);
    uint64_t v2 = *(void **)(v0 + 424);
    unint64_t v4 = *(void *)(v0 + 400);
    uint64_t v5 = *(void *)(v0 + 408);
    sub_2250C66C8();
    uint64_t v6 = v2 + 5;
    uint64_t v7 = v2[2];
    uint64_t v10 = v2 + 3;
    uint64_t v8 = v2[3];
    uint64_t v9 = v10[1];
    uint64_t v11 = sub_2250CAAD4(v4);
    uint64_t v12 = (void *)swift_task_alloc();
    v12[2] = v6;
    void v12[3] = v5;
    v12[4] = v3;
    v12[5] = v11;
    v12[6] = v9;
    v12[7] = v7;
    v12[8] = v8;
    unint64_t v13 = swift_bridgeObjectRetain();
    unint64_t v14 = sub_2250C6300(v13, (void (*)(unint64_t, id))sub_2250C67E0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_2250CC008();
    if (v16) {
      goto LABEL_7;
    }
    if (v15 == 2)
    {
      char v58 = 1;
      goto LABEL_8;
    }
    if (v15 != 1) {
LABEL_7:
    }
      char v58 = 0;
    else {
      char v58 = 0;
    }
LABEL_8:
    OUTLINED_FUNCTION_41_2();
    __swift_project_boxed_opaque_existential_1(v6, 0);
    swift_bridgeObjectRetain();
    sub_225106490();
    sub_2251061C0();
    uint64_t v17 = OUTLINED_FUNCTION_49_1();
    v18(v17);
    unint64_t v19 = swift_bridgeObjectRetain();
    sub_2250BFBB4(v19);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_45_0(inited, (__n128)xmmword_22510C2C0);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
    OUTLINED_FUNCTION_40_2(v21);
    OUTLINED_FUNCTION_77_0(MEMORY[0x263F8D4F8]);
    OUTLINED_FUNCTION_65_0(v22, v23, v24, v25, v26, v27, v28, v29, v58);
    OUTLINED_FUNCTION_43_2(v30, v59, v62);
    uint64_t v64 = sub_225107170();
    swift_bridgeObjectRelease();
    unsigned __int8 v31 = __swift_project_boxed_opaque_existential_1(v6, *(void *)(v71 + 64));
    sub_225106490();
    sub_2251061C0();
    uint64_t v32 = OUTLINED_FUNCTION_68_0();
    v33(v32);
    sub_2250D64B4(v14, (v31 & 1) == 0, v73, v75, (uint64_t)&v77);
    uint64_t v34 = *(void *)(v0 + 392);
    uint64_t v35 = swift_bridgeObjectRelease();
    __n128 v43 = OUTLINED_FUNCTION_59_0(v35, v36, v37, v38, v39, v40, v41, v42, v60, v0 + 384, v64, v67, v69, v71, v73, v75, v77, v78, v79,
            v80,
            v81,
            v82,
            *((uint64_t *)&v82 + 1),
            v83);
    *(_OWORD *)(v0 + 240) = v44;
    OUTLINED_FUNCTION_28_2(v45, v43, v46, v61, v63, v65, v68, v70, v72, v74, v76, v77, v78, v79, v80, v81, v82, v83, *((uint64_t *)&v83 + 1),
      v84,
      v85,
      v86,
      v87);
    sub_2250D9734(v0 + 240);
    sub_2250D96D8(v0 + 240, v34);
    *(unsigned char *)(v34 + 137) = 1;
    *(void *)(v34 + 144) = v66;
    swift_task_dealloc();
    OUTLINED_FUNCTION_13_3();
    goto LABEL_16;
  }
  if (qword_2680C06A8 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_2251070F0();
  unint64_t v50 = (void *)OUTLINED_FUNCTION_33(v49, (uint64_t)qword_2680C5BF0);
  os_log_type_t v51 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v51))
  {
    os_log_type_t v52 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v52);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v53, v54, "contacts array is empty: contacts array cannot be empty");
    OUTLINED_FUNCTION_15_3();
  }

  sub_2250BDE10();
  uint64_t v55 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v55, v56);
  swift_task_dealloc();
  uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
LABEL_16:
  return v47();
}

uint64_t sub_2250D2BBC()
{
  OUTLINED_FUNCTION_5_3();
  v1[127] = v0;
  v1[126] = v2;
  v1[125] = v3;
  v1[124] = v4;
  v1[123] = v5;
  v1[122] = v6;
  v1[121] = v7;
  uint64_t v8 = sub_225106530();
  v1[128] = v8;
  OUTLINED_FUNCTION_1_3(v8);
  v1[129] = v9;
  v1[130] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_2250D2C60()
{
  OUTLINED_FUNCTION_12_1();
  unint64_t v1 = (int *)v0[125];
  (*(void (**)(void, void, void))(v0[129] + 16))(v0[130], v0[122], v0[128]);
  uint64_t v4 = (uint64_t (*)(void *))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[131] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250D2D60;
  return v4(v0 + 10);
}

uint64_t sub_2250D2D60()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 1056) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2250D2E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_62_1();
  OUTLINED_FUNCTION_37_1();
  unint64_t v13 = *(void **)(v12 + 992);
  memcpy((void *)(v12 + 232), (const void *)(v12 + 80), 0x98uLL);
  if (v13)
  {
    *(void *)(v12 + 1104) = v13;
    switch(*(unsigned char *)(v12 + 369))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        OUTLINED_FUNCTION_92();
        break;
      default:
        break;
    }
    v13;
    sub_225106520();
    memcpy((void *)(v12 + 536), (const void *)(v12 + 232), 0x98uLL);
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v12 + 1112) = v17;
    *uint64_t v17 = v12;
    v17[1] = sub_2250D35EC;
    OUTLINED_FUNCTION_32_2();
    return sub_2250D6C60();
  }
  else
  {
    uint64_t v32 = v12 + 960;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    *(void *)(v12 + 1064) = v15;
    id v16 = v15;
    uint64_t v20 = self;
    uint64_t v21 = sub_2251071A0();
    *(void *)(v12 + 1072) = v21;
    swift_bridgeObjectRelease();
    sub_2250D1E6C(*(void *)(v12 + 376));
    uint64_t v22 = sub_225107150();
    *(void *)(v12 + 1080) = v22;
    swift_bridgeObjectRelease();
    sub_225106E70();
    uint64_t v23 = sub_225107150();
    *(void *)(v12 + 1088) = v23;
    swift_bridgeObjectRelease();
    *(void *)(v12 + 16) = v12;
    *(void *)(v12 + 56) = v32;
    *(void *)(v12 + 24) = sub_2250D32F8;
    *(void *)(v12 + 872) = swift_continuation_init();
    *(void *)(v12 + 840) = MEMORY[0x263EF8330];
    *(void *)(v12 + 848) = 0x40000000;
    *(void *)(v12 + 856) = sub_2250D6BE0;
    *(void *)(v12 + 864) = &block_descriptor;
    objc_msgSend(v20, sel_execute_catId_parameters_globals_completion_, v16, v21, v22, v23, v12 + 840);
    OUTLINED_FUNCTION_32_2();
    return MEMORY[0x270FA23F0](v24, v25, v26, v27, v28, v29, v30, v31, v32, a10, a11, a12);
  }
}

uint64_t sub_2250D32F8()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 1096) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_2250D33D8()
{
  OUTLINED_FUNCTION_86();
  uint64_t v1 = *(void **)(v0 + 1080);
  uint64_t v2 = *(void **)(v0 + 1072);
  uint64_t v3 = *(void **)(v0 + 1064);
  uint64_t v4 = *(void *)(v0 + 960);

  *(void *)(v0 + 1104) = v4;
  switch(*(unsigned char *)(v0 + 369))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      OUTLINED_FUNCTION_92();
      break;
    default:
      break;
  }
  id v5 = *(id *)(v0 + 992);
  sub_225106520();
  memcpy((void *)(v0 + 536), (const void *)(v0 + 232), 0x98uLL);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1112) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2250D35EC;
  return sub_2250D6C60();
}

uint64_t sub_2250D35EC()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *id v5 = v4;
  *(void *)(v6 + 1120) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2250D36CC()
{
  OUTLINED_FUNCTION_86();
  uint64_t v1 = (void *)v0[138];
  memcpy(v0 + 48, v0 + 86, 0x98uLL);
  sub_2251063C0();
  swift_allocObject();
  v0[141] = sub_2251063B0();
  v0[118] = &type metadata for ContactDisambiguationSnippetPluginModel;
  v0[119] = sub_2250D9814();
  uint64_t v2 = swift_allocObject();
  v0[115] = v2;
  sub_2250D96D8((uint64_t)(v0 + 48), v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22510C2B0;
  *(void *)(v3 + 32) = v1;
  uint64_t v9 = v3;
  sub_225107300();
  v0[142] = v9;
  sub_2250D9980((uint64_t)(v0 + 48), (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D8F0C);
  uint64_t v8 = (uint64_t (*)(void *, void *, uint64_t, uint64_t))((int)*MEMORY[0x263F6FB10] + MEMORY[0x263F6FB10]);
  id v4 = v1;
  id v5 = (void *)swift_task_alloc();
  v0[143] = v5;
  *id v5 = v0;
  v5[1] = sub_2250D3874;
  uint64_t v6 = v0[130];
  return v8(v0 + 110, v0 + 115, v9, v6);
}

uint64_t sub_2250D3874()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 920;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_4_4();
  *id v5 = v4;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2250D3988()
{
  OUTLINED_FUNCTION_86();
  uint64_t v1 = *(void *)(v0 + 1104);
  uint64_t v2 = *(void *)(v0 + 1040);
  uint64_t v3 = *(void *)(v0 + 1032);
  uint64_t v4 = *(void *)(v0 + 1024);
  id v5 = *(void **)(v0 + 968);
  sub_2250D97A4(v0 + 232);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  memcpy(v5, (const void *)(v0 + 384), 0x98uLL);
  v5[19] = v1;
  sub_2250BFD9C((long long *)(v0 + 880), (uint64_t)(v5 + 20));
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_3();
  return v6();
}

uint64_t sub_2250D3A54()
{
  OUTLINED_FUNCTION_5_3();
  (*(void (**)(void, void))(v0[129] + 8))(v0[130], v0[128]);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v1();
}

uint64_t sub_2250D3ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_62_1();
  OUTLINED_FUNCTION_37_1();
  unint64_t v13 = (void *)v12[136];
  uint64_t v14 = (void *)v12[135];
  id v15 = (void *)v12[134];
  id v16 = (void *)v12[133];
  uint64_t v17 = v12[130];
  uint64_t v18 = v12[129];
  uint64_t v19 = v12[128];
  swift_willThrow();
  sub_2250D97A4((uint64_t)(v12 + 29));
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);

  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_32_2();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12);
}

uint64_t sub_2250D3B88()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = *(void *)(v0 + 1040);
  uint64_t v2 = *(void *)(v0 + 1032);
  uint64_t v3 = *(void *)(v0 + 1024);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_2250D97A4(v0 + 232);
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v4();
}

uint64_t ContactResolutionSnippetGenerator.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_5(v1, v2, v3, v4, v5);
  v0[33] = v6;
  uint64_t v7 = sub_225106290();
  v0[34] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v0[35] = v8;
  uint64_t v9 = OUTLINED_FUNCTION_20_1();
  uint64_t v10 = OUTLINED_FUNCTION_71_0(v9);
  v0[37] = v10;
  OUTLINED_FUNCTION_1_3(v10);
  v0[38] = v11;
  uint64_t v12 = OUTLINED_FUNCTION_35_2();
  v0[40] = OUTLINED_FUNCTION_58_1(v12);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

#error "2250D3D94: call analysis failed (funcsize=78)"

uint64_t sub_2250D3E34()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return sub_2250D3EFC();
}

uint64_t sub_2250D3EFC()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v5 = OUTLINED_FUNCTION_91(v1, v2, v3, v4);
  v0[54] = v5;
  OUTLINED_FUNCTION_1_3(v5);
  v0[55] = v6;
  v0[56] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2250D3F80()
{
  uint64_t v87 = v0;
  uint64_t v1 = (void *)(*(void *)(v0 + 424) + 40);
  sub_2250C7CC4(v1);
  unint64_t v3 = *(void *)(v0 + 400);
  if (v3 >> 62)
  {
    OUTLINED_FUNCTION_89();
    uint64_t v48 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v48) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    uint64_t v4 = *(void *)(v0 + 424);
    uint64_t v74 = *(void *)(v0 + 416);
    unint64_t v5 = *(void *)(v0 + 400);
    uint64_t v6 = *(void *)(v0 + 408);
    sub_2250C66C8();
    uint64_t v7 = *(void *)(v4 + 16);
    uint64_t v10 = v4 + 24;
    uint64_t v8 = *(void *)(v4 + 24);
    uint64_t v9 = *(void *)(v10 + 8);
    uint64_t v11 = sub_2250CAAD4(v5);
    uint64_t v12 = (void *)swift_task_alloc();
    v12[2] = v1;
    void v12[3] = v6;
    v12[4] = v74;
    v12[5] = v11;
    v12[6] = v9;
    v12[7] = v7;
    v12[8] = v8;
    unint64_t v13 = swift_bridgeObjectRetain();
    unint64_t v14 = sub_2250C6300(v13, (void (*)(unint64_t, id))sub_2250C67E0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_2250CC008();
    if (v16) {
      goto LABEL_11;
    }
    if (v15 == 2)
    {
      char v57 = 1;
      goto LABEL_12;
    }
    if (v15 != 1) {
LABEL_11:
    }
      char v57 = 0;
    else {
      char v57 = 0;
    }
LABEL_12:
    OUTLINED_FUNCTION_41_2();
    __swift_project_boxed_opaque_existential_1(v1, 0);
    swift_bridgeObjectRetain();
    sub_225106490();
    sub_2251061C0();
    uint64_t v17 = OUTLINED_FUNCTION_49_1();
    v18(v17);
    unint64_t v19 = swift_bridgeObjectRetain();
    sub_2250BFBB4(v19);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_45_0(inited, (__n128)xmmword_22510C2C0);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE8);
    OUTLINED_FUNCTION_40_2(v21);
    OUTLINED_FUNCTION_77_0(MEMORY[0x263F8D4F8]);
    OUTLINED_FUNCTION_65_0(v22, v23, v24, v25, v26, v27, v28, v29, v57);
    OUTLINED_FUNCTION_43_2(v30, v58, v61);
    uint64_t v62 = sub_225107170();
    swift_bridgeObjectRelease();
    unsigned __int8 v31 = __swift_project_boxed_opaque_existential_1(v1, *(void *)(v70 + 64));
    sub_225106490();
    sub_2251061C0();
    uint64_t v32 = OUTLINED_FUNCTION_68_0();
    v33(v32);
    sub_2250D64B4(v14, (v31 & 1) == 0, v72, v74, (uint64_t)&v76);
    uint64_t v34 = *(void *)(v0 + 392);
    uint64_t v35 = swift_bridgeObjectRelease();
    __n128 v43 = OUTLINED_FUNCTION_59_0(v35, v36, v37, v38, v39, v40, v41, v42, v59, v62, 0, v66, v68, v70, v72, v74, v76, v77, v78,
            v79,
            v80,
            v81,
            *((uint64_t *)&v81 + 1),
            v82);
    *(_OWORD *)(v0 + 240) = v44;
    OUTLINED_FUNCTION_28_2(v45, v43, v46, v60, v63, v65, v67, v69, v71, v73, v75, v76, v77, v78, v79, v80, v81, v82, *((uint64_t *)&v82 + 1),
      v83,
      v84,
      v85,
      v86);
    sub_2250D9734(v0 + 240);
    sub_2250D96D8(v0 + 240, v34);
    *(unsigned char *)(v34 + 137) = 2;
    *(void *)(v34 + 144) = v64;
    swift_task_dealloc();
    OUTLINED_FUNCTION_13_3();
    goto LABEL_2;
  }
  if (qword_2680C06A8 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_2251070F0();
  unint64_t v50 = (void *)OUTLINED_FUNCTION_33(v49, (uint64_t)qword_2680C5BF0);
  os_log_type_t v51 = sub_225107390();
  if (OUTLINED_FUNCTION_11_1(v51))
  {
    os_log_type_t v52 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v52);
    OUTLINED_FUNCTION_8_2(&dword_2250AF000, v53, v54, "contacts array is empty: contacts array cannot be empty");
    OUTLINED_FUNCTION_15_3();
  }

  sub_2250BDE10();
  uint64_t v55 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_31_0(v55, v56);
  swift_task_dealloc();
  uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
LABEL_2:
  return v47();
}

uint64_t ContactResolutionSnippetGenerator.generateDetailedDisambiguationContactNames(contacts:directInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_5(v1, v2, v3, v4, v5);
  v0[33] = v6;
  uint64_t v7 = sub_225106290();
  v0[34] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v0[35] = v8;
  uint64_t v9 = OUTLINED_FUNCTION_20_1();
  uint64_t v10 = OUTLINED_FUNCTION_71_0(v9);
  v0[37] = v10;
  OUTLINED_FUNCTION_1_3(v10);
  v0[38] = v11;
  uint64_t v12 = OUTLINED_FUNCTION_35_2();
  v0[40] = OUTLINED_FUNCTION_58_1(v12);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

#error "2250D44FC: call analysis failed (funcsize=78)"

uint64_t sub_2250D459C()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 344) = v0;
  swift_task_dealloc();
  uint64_t v7 = OUTLINED_FUNCTION_4_6();
  v8(v7);
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_73_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250D46E4()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  uint64_t v1 = *(void *)(v0 + 216);
  (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  sub_2250BAB54(v0 + 176, v1);
  sub_2250D8508(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_72_0();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2250D4784()
{
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2250D4810()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D48D8;
  return sub_2250D499C();
}

uint64_t sub_2250D48D8()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  return v3();
}

uint64_t sub_2250D499C()
{
  OUTLINED_FUNCTION_5_3();
  v1[23] = v2;
  v1[24] = v0;
  v1[21] = v3;
  v1[22] = v4;
  v1[20] = v5;
  v1[25] = type metadata accessor for ContactResolutionDisambiguationParameters(0);
  v1[26] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2250D4A28()
{
  uint64_t v44 = v0;
  unint64_t v1 = *(void *)(v0 + 168);
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_90();
    uint64_t v32 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_3;
    }
LABEL_7:
    if (qword_2680C06A8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_2251070F0();
    uint64_t v34 = (void *)OUTLINED_FUNCTION_33(v33, (uint64_t)qword_2680C5BF0);
    os_log_type_t v35 = sub_225107390();
    if (OUTLINED_FUNCTION_11_1(v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v36);
      OUTLINED_FUNCTION_8_2(&dword_2250AF000, v37, v38, "contacts array is empty: contacts array cannot be empty");
      OUTLINED_FUNCTION_15_3();
    }

    sub_2250BDE10();
    uint64_t v39 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_31_0(v39, v40);
    goto LABEL_12;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  unint64_t v5 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 176);
  sub_2250C66C8();
  sub_2250C74E8();
  char v42 = v6;
  uint64_t v7 = v3 + 40;
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v11 = v3 + 24;
  uint64_t v9 = *(void *)(v3 + 24);
  uint64_t v10 = *(void *)(v11 + 8);
  uint64_t v12 = sub_2250CAAD4(v5);
  uint64_t v13 = (void *)swift_task_alloc();
  v13[2] = v7;
  v13[3] = v4;
  void v13[4] = v2;
  v13[5] = v12;
  v13[6] = v10;
  v13[7] = v8;
  v13[8] = v9;
  unint64_t v14 = swift_bridgeObjectRetain();
  unint64_t v15 = sub_2250C6300(v14, (void (*)(unint64_t, id))sub_2250C67E0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v17 = *(int **)(v0 + 200);
  char v16 = *(unint64_t **)(v0 + 208);
  uint64_t v18 = sub_2250C7BD0(v15);
  uint64_t v19 = (uint64_t)v16 + v17[5];
  uint64_t v20 = sub_225106560();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *char v16 = v15;
  *((unsigned char *)v16 + v17[6]) = v42 & 1;
  *((unsigned char *)v16 + v17[7]) = v18 & 1;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2250BCABC();
  uint64_t v23 = *(void *)(v0 + 176);
  uint64_t v22 = *(void **)(v0 + 184);
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = v23;
  v25._object = v22;
  ContactDisambiguationModel.init(contacts:prompt:contactSelectionDirectInvocationID:)(&v43, (Swift::OpaquePointer)v15, v24, v25);
  if (!v26)
  {
    uint64_t v27 = *(void *)(v0 + 160);
    sub_2250D9740(*(void *)(v0 + 208));
    long long v28 = *(_OWORD *)&v43.prompt._object;
    object = v43.contactSelectionDirectInvocationID._object;
    *(_OWORD *)(v0 + 16) = *(_OWORD *)&v43.contacts._rawValue;
    rawValue = v43.encodedContacts._rawValue;
    *(_OWORD *)(v0 + 32) = v28;
    *(void *)(v0 + 48) = object;
    *(Swift::String_optional *)(v0 + 56) = v43.contactSelectionDirectInvocationKey;
    *(void *)(v0 + 72) = rawValue;
    sub_2250D979C(v0 + 16);
    sub_2250D96D8(v0 + 16, v27);
    *(unsigned char *)(v27 + 137) = 0;
    *(void *)(v27 + 144) = v21;
    swift_task_dealloc();
    OUTLINED_FUNCTION_13_3();
    goto LABEL_13;
  }
  sub_2250D9740(*(void *)(v0 + 208));
  swift_bridgeObjectRelease();
LABEL_12:
  swift_task_dealloc();
  OUTLINED_FUNCTION_46_2();
LABEL_13:
  return v31();
}

uint64_t ContactResolutionSnippetGenerator.generateDetailedDisambiguationForMultipleHandlesWithSameLabel(contacts:directInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_5(v1, v2, v3, v4, v5);
  v0[33] = v6;
  uint64_t v7 = sub_225106290();
  v0[34] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v0[35] = v8;
  uint64_t v9 = OUTLINED_FUNCTION_20_1();
  uint64_t v10 = OUTLINED_FUNCTION_71_0(v9);
  v0[37] = v10;
  OUTLINED_FUNCTION_1_3(v10);
  v0[38] = v11;
  uint64_t v12 = OUTLINED_FUNCTION_35_2();
  v0[40] = OUTLINED_FUNCTION_58_1(v12);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

#error "2250D4EA4: call analysis failed (funcsize=78)"

uint64_t sub_2250D4F44()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return sub_2250D500C();
}

uint64_t sub_2250D500C()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v5 = OUTLINED_FUNCTION_76_0(v1, v2, v3, v4);
  v0[25] = v5;
  OUTLINED_FUNCTION_1_3(v5);
  v0[26] = v6;
  v0[27] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "2250D5130: call analysis failed (funcsize=141)"

uint64_t ContactResolutionSnippetGenerator.generateDetailedDisambiguationForMixedLabels(contacts:directInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_5(v1, v2, v3, v4, v5);
  v0[33] = v6;
  uint64_t v7 = sub_225106290();
  v0[34] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v0[35] = v8;
  uint64_t v9 = OUTLINED_FUNCTION_20_1();
  uint64_t v10 = OUTLINED_FUNCTION_71_0(v9);
  v0[37] = v10;
  OUTLINED_FUNCTION_1_3(v10);
  v0[38] = v11;
  uint64_t v12 = OUTLINED_FUNCTION_35_2();
  v0[40] = OUTLINED_FUNCTION_58_1(v12);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

#error "2250D5450: call analysis failed (funcsize=78)"

uint64_t sub_2250D54F0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return sub_2250D55B8();
}

uint64_t sub_2250D55B8()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v5 = OUTLINED_FUNCTION_76_0(v1, v2, v3, v4);
  v0[25] = v5;
  OUTLINED_FUNCTION_1_3(v5);
  v0[26] = v6;
  v0[27] = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

#error "2250D56DC: call analysis failed (funcsize=141)"

uint64_t ContactResolutionSnippetGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_37_1();
  *(unsigned char *)(v0 + 32) = *v1;
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_10_3(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_2250D5974;
  OUTLINED_FUNCTION_32_2();
  return ContactResolutionSnippetGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:dialogOverride:outputGenerationManifest:)();
}

uint64_t sub_2250D5974()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 24) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_18_1();
    return v10();
  }
}

uint64_t ContactResolutionSnippetGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:dialogOverride:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  *(void *)(v1 + 272) = v19;
  *(void *)(v1 + 280) = v0;
  *(void *)(v1 + 256) = v4;
  *(void *)(v1 + 264) = v5;
  *(void *)(v1 + 240) = v6;
  *(void *)(v1 + 248) = v7;
  *(void *)(v1 + 224) = v8;
  *(void *)(v1 + 232) = v9;
  *(void *)(v1 + 216) = v10;
  *(void *)(v1 + 288) = *v0;
  uint64_t v11 = sub_225106530();
  *(void *)(v1 + 296) = v11;
  OUTLINED_FUNCTION_1_3(v11);
  *(void *)(v1 + 304) = v12;
  uint64_t v13 = OUTLINED_FUNCTION_35_2();
  *(void *)(v1 + 320) = OUTLINED_FUNCTION_58_1(v13);
  *(unsigned char *)(v1 + 368) = *v3;
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

uint64_t sub_2250D5B4C()
{
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_71();
  if (qword_2680C06A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2251070F0();
  uint64_t v3 = OUTLINED_FUNCTION_33(v2, (uint64_t)qword_2680C5BF0);
  os_log_type_t v4 = sub_2251073A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_70_0(v5);
    _os_log_impl(&dword_2250AF000, v3, v4, "ContactResolutionOutputGenerator::generateYesNoClarificationContactName", v0, 2u);
    OUTLINED_FUNCTION_7_1();
  }
  char v23 = *(unsigned char *)(v1 + 368);
  uint64_t v7 = *(void *)(v1 + 312);
  uint64_t v6 = *(void *)(v1 + 320);
  uint64_t v8 = *(void *)(v1 + 296);
  uint64_t v9 = *(void *)(v1 + 304);
  uint64_t v10 = *(void *)(v1 + 280);
  uint64_t v11 = *(void *)(v1 + 272);
  uint64_t v12 = *(void *)(v1 + 248);
  uint64_t v22 = *(void *)(v1 + 256);
  long long v21 = *(_OWORD *)(v1 + 232);
  uint64_t v13 = *(void *)(v1 + 224);

  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v14(v6, v11, v8);
  v14(v7, v6, v8);
  uint64_t v15 = swift_task_alloc();
  *(void *)(v1 + 328) = v15;
  *(void *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = v13;
  *(unsigned char *)(v15 + 32) = v23;
  *(_OWORD *)(v15 + 40) = v21;
  *(void *)(v15 + 56) = v12;
  *(void *)(v15 + 64) = v22;
  uint64_t v16 = swift_task_alloc();
  uint64_t v17 = (void *)OUTLINED_FUNCTION_30_2(v16);
  *uint64_t v17 = v18;
  v17[1] = sub_2250D5D30;
  OUTLINED_FUNCTION_14_1();
  return sub_2250D2BBC();
}

uint64_t sub_2250D5D30()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *os_log_type_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 344) = v0;
  swift_task_dealloc();
  uint64_t v7 = OUTLINED_FUNCTION_4_6();
  v8(v7);
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_73_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2250D5E78()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = *(void *)(v0 + 216);
  (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  sub_2250BAB54(v0 + 176, v1);
  sub_2250D8508(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_3();
  return v2();
}

uint64_t sub_2250D5F10()
{
  OUTLINED_FUNCTION_5_3();
  (*(void (**)(void, void))(v0 + 352))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2250D5F8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 32) = a4;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v15;
  *uint64_t v15 = v8;
  v15[1] = sub_2250D6078;
  return sub_2250D6190(a1, a3, (unsigned char *)(v8 + 32), a5, a6, a7, a8);
}

uint64_t sub_2250D6078()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 24) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_9_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_18_1();
    return v10();
  }
}

uint64_t sub_2250D6174()
{
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t sub_2250D6190(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 280) = a7;
  *(void *)(v8 + 288) = v7;
  *(void *)(v8 + 264) = a5;
  *(void *)(v8 + 272) = a6;
  *(void *)(v8 + 248) = a2;
  *(void *)(v8 + 256) = a4;
  *(void *)(v8 + 240) = a1;
  *(unsigned char *)(v8 + 153) = *a3;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250D61BC);
}

uint64_t sub_2250D61BC()
{
  OUTLINED_FUNCTION_83();
  uint64_t v36 = v0;
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v2 = *(void **)(v0 + 248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_81_0(inited, (__n128)xmmword_22510C2B0);
  id v4 = v2;
  sub_2250C66C8();
  swift_bridgeObjectRelease();
  uint64_t v5 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_81_0(v5, (__n128)xmmword_22510C2B0);
  uint64_t v7 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v8 = v1[2];
  id v9 = v4;
  uint64_t v10 = sub_2250CAAD4(__src[0]);
  uint64_t v11 = (void *)swift_task_alloc();
  v11[2] = v1 + 5;
  v11[3] = 0;
  v11[4] = 0;
  v11[5] = v10;
  v11[6] = v6;
  v11[7] = v8;
  v11[8] = v7;
  unint64_t v12 = swift_bridgeObjectRetain();
  unint64_t v13 = sub_2250C6300(v12, (void (*)(unint64_t, id))sub_2250C67E0);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v13 >> 62)
  {
    OUTLINED_FUNCTION_89();
    uint64_t v32 = sub_225107620();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    sub_2250C6480(0, (v13 & 0xC000000000000001) == 0, v13);
    if ((v13 & 0xC000000000000001) != 0)
    {
      uint64_t v15 = MEMORY[0x22A62C790](0, v13);
    }
    else
    {
      uint64_t v15 = *(void *)(v13 + 32);
      swift_retain();
    }
    char v16 = *(unsigned char *)(v0 + 153);
    uint64_t v18 = *(void *)(v0 + 272);
    uint64_t v17 = *(void *)(v0 + 280);
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v19 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    LOBYTE(__src[0]) = v16;
    uint64_t v21 = swift_retain();
    uint64_t v29 = sub_2250BC90C(v21, v22, v23, v24, v25, v26, v27, v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2250F69A4(v15, v20, v19, v18, v17, 0, 0xE000000000000000, 0, 0xE000000000000000, v34, 1, 3, __src[0], 0, 0xE000000000000000, 0, 0xE000000000000000, v15, __src[6],
      __src[7],
      __src[8]);
    uint64_t v30 = *(void *)(v0 + 240);
    swift_bridgeObjectRelease_n();
    swift_release();
    memcpy((void *)(v0 + 16), __src, 0x88uLL);
    sub_2250D96CC(v0 + 16);
    sub_2250D96D8(v0 + 16, v30);
    *(unsigned char *)(v30 + 137) = 5;
    *(void *)(v30 + 144) = v29;
    OUTLINED_FUNCTION_13_3();
    goto LABEL_2;
  }
  swift_bridgeObjectRelease();
  sub_2250BDE10();
  OUTLINED_FUNCTION_27_1();
  *uint64_t v33 = 2;
  swift_willThrow();
  OUTLINED_FUNCTION_46_2();
LABEL_2:
  return v31();
}

uint64_t sub_2250D64B4@<X0>(unint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_225107620()) {
      goto LABEL_3;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    sub_2250BDE10();
    swift_allocError();
    *unint64_t v13 = 2;
    return swift_willThrow();
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_7;
  }
LABEL_3:
  sub_2250C6480(0, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = MEMORY[0x22A62C790](0, a1);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return ContactHandleDisambiguationModel.init(contact:contactHandles:isDeviceLocked:contactSelectionDirectInvocationID:prompt:)(v11, a1, a2 & 1, a3, a4, 0, 0xE000000000000000, a5);
}

uint64_t sub_2250D65FC(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(void *)(v4 + 136) = a2;
  *(void *)(v4 + 144) = v3;
  *(void *)(v4 + 128) = a1;
  *(unsigned char *)(v4 + 192) = *a3;
  return OUTLINED_FUNCTION_3_3((uint64_t)sub_2250D6620);
}

uint64_t sub_2250D6620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_62_1();
  OUTLINED_FUNCTION_37_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v12[19] = v14;
  id v15 = v14;
  char v16 = self;
  uint64_t v17 = sub_2251071A0();
  v12[20] = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_225107150();
  v12[21] = v18;
  sub_225106E70();
  uint64_t v19 = sub_225107150();
  v12[22] = v19;
  swift_bridgeObjectRelease();
  v12[2] = v12;
  v12[7] = v12 + 15;
  void v12[3] = sub_2250D6900;
  uint64_t v20 = swift_continuation_init();
  v12[10] = MEMORY[0x263EF8330];
  v12[11] = 0x40000000;
  v12[12] = sub_2250D6BE0;
  v12[13] = &block_descriptor_70;
  v12[14] = v20;
  objc_msgSend(v16, sel_execute_catId_parameters_globals_completion_, v15, v17, v18, v19, v12 + 10);
  OUTLINED_FUNCTION_32_2();
  return MEMORY[0x270FA23F0](v21, v22, v23, v24, v25, v26, v27, v28, v12 + 15, a10, a11, a12);
}

uint64_t sub_2250D6900()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 184) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_2250D69E0()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_25_3();
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v3 = *(void **)(v0 + 152);
  uint64_t v2 = *(void **)(v0 + 160);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 192);
  uint64_t v5 = *(void **)(v0 + 120);

  OUTLINED_FUNCTION_54_0();
  switch(v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      OUTLINED_FUNCTION_54_0();
      break;
    case 9:
      OUTLINED_FUNCTION_54_0();
      uint64_t v6 = 0xD00000000000001ALL;
      break;
    default:
      break;
  }
  sub_2250E3800(v6, v7, v5);
  OUTLINED_FUNCTION_73_0();
  return v10(v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_2250D6B64()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  uint64_t v1 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  uint64_t v4 = (void *)v0[19];
  swift_willThrow();

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_72_0();
  return v6(v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_2250D6BE4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F30);
  uint64_t v4 = OUTLINED_FUNCTION_27_1();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_2250D6C40(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_2250D6C60()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  *(void *)(v1 + 1504) = v0;
  *(void *)(v1 + 1496) = v4;
  *(void *)(v1 + 1488) = v5;
  *(void *)(v1 + 1480) = v6;
  sub_2250D96D8(v2, v1 + 16);
  *(unsigned char *)(v1 + 158) = *(unsigned char *)(v3 + 137);
  *(void *)(v1 + 1512) = *(void *)(v3 + 144);
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2250D6CE8()
{
  OUTLINED_FUNCTION_12_1();
  sub_2250D1E6C(*(void *)(v0 + 1512));
  *(void *)(v0 + 1520) = v1;
  *(unsigned char *)(v0 + 155) = 6;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 1528) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2250D6D94;
  uint64_t v3 = OUTLINED_FUNCTION_64_0();
  return sub_2250D65FC(v3, v4, v5);
}

uint64_t sub_2250D6D94()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 1536) = v5;
  *(void *)(v3 + 1544) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2250D6E8C()
{
  uint64_t v110 = v0;
  uint64_t v1 = v0 + 448;
  sub_2250D96D8(v0 + 16, v0 + 304);
  int v2 = sub_2250D98CC(v0 + 304);
  if (!v2)
  {
    uint64_t v7 = *(void *)(v0 + 1536);
    uint64_t v8 = (void **)nullsub_1(v0 + 304);
    uint64_t contactSelectionDirectInvocationIDa = (uint64_t)v8[3];
    unint64_t v101 = *v8;
    uint64_t v103 = v8[4];
    sub_2250D96D8(v0 + 16, v0 + 736);
    nullsub_1(v0 + 736);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v9 = OUTLINED_FUNCTION_87();
    uint64_t v10 = sub_2250C848C(v9, 0xE800000000000000, v7);
    uint64_t v11 = v0 + 16;
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (!v13)
    {
      sub_2250D9980(v11, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
      if (qword_2680C06A8 != -1) {
        swift_once();
      }
      uint64_t v40 = sub_2251070F0();
      uint64_t v41 = (void *)OUTLINED_FUNCTION_33(v40, (uint64_t)qword_2680C5BF0);
      os_log_type_t v42 = sub_225107390();
      if (OUTLINED_FUNCTION_11_1(v42))
      {
        SiriInferenceFlow::ContactDisambiguationModel v43 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v43);
        OUTLINED_FUNCTION_8_2(&dword_2250AF000, v44, v45, "localized value not found: could not find localized value for label 'whichOne'");
        OUTLINED_FUNCTION_15_3();
      }

      sub_2250BDE10();
      uint64_t v46 = OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_47_0(v46, v47);
      goto LABEL_60;
    }
    uint64_t v14 = *(void **)(v0 + 1488);
    *(void *)(v0 + 1456) = v10;
    *(void *)(v0 + 1464) = v13;
    id v15 = objc_msgSend(v14, sel_dialog);
    sub_2250D99EC();
    unint64_t v16 = sub_2251072F0();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_225107620();
      swift_bridgeObjectRelease();
      if (!v95) {
        goto LABEL_55;
      }
    }
    else if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_55;
    }
    sub_2250C6480(0, (v16 & 0xC000000000000001) == 0, v16);
    if ((v16 & 0xC000000000000001) != 0) {
      id v17 = (id)MEMORY[0x22A62C790](0, v16);
    }
    else {
      id v17 = *(id *)(v16 + 32);
    }
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v18, sel_unfilteredSupportingPrint);

    uint64_t v20 = sub_2251071E0();
    unint64_t v22 = v21;

    uint64_t v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0) {
      uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      if (qword_2680C06A8 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_2251070F0();
      uint64_t v25 = OUTLINED_FUNCTION_33(v24, (uint64_t)qword_2680C5BF0);
      os_log_type_t v26 = sub_2251073A0();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(void *)unint64_t v106 = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315138;
        swift_beginAccess();
        uint64_t v28 = *(void *)(v0 + 1456);
        unint64_t v29 = *(void *)(v0 + 1464);
        swift_bridgeObjectRetain();
        uint64_t v30 = v28;
        uint64_t v1 = v0 + 448;
        *(void *)(v0 + 1472) = sub_2250B72A8(v30, v29, (uint64_t *)v106);
        sub_225107420();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2250AF000, v25, v26, "augmented localized prompt: %s", v27, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_7_1();
      }
      else
      {
      }
      v84._rawValue = v101;
      uint64_t v83 = v103;
      swift_beginAccess();
      uint64_t v10 = v20;
      goto LABEL_58;
    }
LABEL_55:
    unint64_t v22 = v13;
    v84._rawValue = v101;
    uint64_t v83 = v103;
LABEL_58:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v85._countAndFlagsBits = v10;
    v85._object = (void *)v22;
    v86._countAndFlagsBits = contactSelectionDirectInvocationIDa;
    v86._object = v83;
    ContactDisambiguationModel.init(contacts:prompt:contactSelectionDirectInvocationID:)((SiriInferenceFlow::ContactDisambiguationModel *)v106, v84, v85, v86);
    if (v87)
    {
      sub_2250D9980(v11, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
      swift_bridgeObjectRelease();
      goto LABEL_60;
    }
    sub_2250D9980(v11, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
    swift_bridgeObjectRelease();
    long long v89 = *(_OWORD *)&v106[16];
    uint64_t v90 = *(void *)&v106[32];
    uint64_t v91 = *(void *)&v106[56];
    *(_OWORD *)(v0 + 160) = *(_OWORD *)v106;
    *(_OWORD *)(v0 + 176) = v89;
    *(void *)(v0 + 192) = v90;
    *(_OWORD *)(v0 + 200) = *(_OWORD *)&v106[40];
    *(void *)(v0 + 216) = v91;
    sub_2250D979C(v0 + 160);
    uint64_t v77 = v0 + 160;
    goto LABEL_62;
  }
  if (v2 == 1)
  {
    uint64_t v102 = (_OWORD *)(v0 + 1312);
    contactSelectionDirectInvocationID = (_OWORD *)(v0 + 1344);
    uint64_t v3 = *(void *)(v0 + 1512);
    uint64_t v4 = nullsub_1(v0 + 304);
    unint64_t v99 = *(void *)(v4 + 8);
    uint64_t v100 = *(void *)v4;
    char v98 = *(unsigned char *)(v4 + 16);
    uint64_t v96 = *(void *)(v4 + 32);
    uint64_t v97 = *(void *)(v4 + 24);
    sub_2250D96D8(v0 + 16, v0 + 1024);
    nullsub_1(v0 + 1024);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_54_0();
    sub_2250C8428(0xD000000000000013, v5, v3, (_OWORD *)(v0 + 1376));
    if (*(void *)(v0 + 1400))
    {
      if (swift_dynamicCast()) {
        int v6 = *(unsigned __int8 *)(v0 + 153);
      }
      else {
        int v6 = 0;
      }
      uint64_t v39 = v0 + 16;
    }
    else
    {
      sub_2250BAC08(v0 + 1376);
      int v6 = 0;
      uint64_t v39 = v0 + 16;
    }
    OUTLINED_FUNCTION_54_0();
    sub_2250C8428(0xD000000000000013, v48, v49, v102);
    if (*(void *)(v0 + 1336))
    {
      if (swift_dynamicCast())
      {
        int v50 = *(unsigned __int8 *)(v0 + 154);
        goto LABEL_34;
      }
    }
    else
    {
      sub_2250BAC08((uint64_t)v102);
    }
    int v50 = 0;
LABEL_34:
    OUTLINED_FUNCTION_54_0();
    sub_2250C8428(v51, v52, v53, contactSelectionDirectInvocationID);
    if (*(void *)(v0 + 1368))
    {
      if (swift_dynamicCast())
      {
        if (((v6 | v50) & 1) == 0 && (*(unsigned char *)(v0 + 156) & 1) == 0)
        {
LABEL_38:
          uint64_t v54 = *(void *)(v0 + 1536);
          uint64_t v55 = OUTLINED_FUNCTION_87();
          uint64_t v56 = sub_2250C848C(v55, 0xEB00000000726F46, v54);
          uint64_t v58 = v57;
          swift_bridgeObjectRelease();
          if (!v58)
          {
            if (qword_2680C06A8 != -1) {
              swift_once();
            }
            uint64_t v59 = sub_2251070F0();
            uint64_t v60 = (void *)OUTLINED_FUNCTION_33(v59, (uint64_t)qword_2680C5BF0);
            os_log_type_t v61 = sub_225107390();
            if (!OUTLINED_FUNCTION_51_1(v61)) {
              goto LABEL_53;
            }
            uint64_t v62 = (_WORD *)OUTLINED_FUNCTION_6_2();
            OUTLINED_FUNCTION_70_0(v62);
            uint64_t v65 = "localized value not found: could not find localized value for label 'whichOneFor'";
LABEL_52:
            OUTLINED_FUNCTION_88(&dword_2250AF000, v63, v64, v65);
            OUTLINED_FUNCTION_7_1();
LABEL_53:

            sub_2250BDE10();
            uint64_t v81 = OUTLINED_FUNCTION_27_1();
            OUTLINED_FUNCTION_47_0(v81, v82);
            goto LABEL_54;
          }
LABEL_46:
          uint64_t v70 = *(void *)(v0 + 1544);
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          ContactHandleDisambiguationModel.init(contact:contactHandles:isDeviceLocked:contactSelectionDirectInvocationID:prompt:)(v100, v99, v98, v97, v96, v56, v58, (uint64_t)v106);
          if (v70)
          {
LABEL_54:
            sub_2250D9980(v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
LABEL_60:
            OUTLINED_FUNCTION_18_1();
LABEL_63:
            return v88();
          }
          sub_2250D9980(v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
          char v71 = v106[16];
          uint64_t v72 = *(void *)&v106[24];
          uint64_t v73 = *(void *)&v106[32];
          long long v74 = *(_OWORD *)&v106[56];
          long long v75 = v107;
          uint64_t v76 = v108;
          *(_OWORD *)(v0 + 1168) = *(_OWORD *)v106;
          *(unsigned char *)(v0 + 1184) = v71;
          *(void *)(v0 + 1192) = v72;
          *(void *)(v0 + 1200) = v73;
          *(_OWORD *)(v0 + 1208) = *(_OWORD *)&v106[40];
          *(_OWORD *)(v0 + 1224) = v74;
          *(_OWORD *)(v0 + 1240) = v75;
          *(void *)(v0 + 1256) = v76;
          *(_OWORD *)(v0 + 1264) = v109;
          sub_2250D9734(v0 + 1168);
          uint64_t v77 = v0 + 1168;
          uint64_t v1 = v0 + 448;
LABEL_62:
          sub_2250D96D8(v77, v1);
          uint64_t v92 = *(void *)(v0 + 1512);
          char v93 = *(unsigned char *)(v0 + 158);
          uint64_t v94 = *(void *)(v0 + 1480);
          sub_2250D96D8(v1, v94);
          *(unsigned char *)(v94 + 137) = v93;
          *(void *)(v94 + 144) = v92;
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_13_3();
          goto LABEL_63;
        }
LABEL_45:
        uint64_t v66 = *(void *)(v0 + 1536);
        OUTLINED_FUNCTION_54_0();
        uint64_t v56 = sub_2250C848C(v67, v68, v66);
        uint64_t v58 = v69;
        swift_bridgeObjectRelease();
        if (!v58)
        {
          if (qword_2680C06A8 != -1) {
            swift_once();
          }
          uint64_t v78 = sub_2251070F0();
          uint64_t v60 = (void *)OUTLINED_FUNCTION_33(v78, (uint64_t)qword_2680C5BF0);
          os_log_type_t v79 = sub_225107390();
          if (!OUTLINED_FUNCTION_51_1(v79)) {
            goto LABEL_53;
          }
          uint64_t v80 = (_WORD *)OUTLINED_FUNCTION_6_2();
          OUTLINED_FUNCTION_70_0(v80);
          uint64_t v65 = "localized value not found: could not find localized value for label 'whichSameHandleTypeFor'";
          goto LABEL_52;
        }
        goto LABEL_46;
      }
    }
    else
    {
      sub_2250BAC08((uint64_t)contactSelectionDirectInvocationID);
    }
    if ((v6 | v50) != 1) {
      goto LABEL_38;
    }
    goto LABEL_45;
  }
  uint64_t v31 = *(void *)(v0 + 1512);
  *(void *)(v0 + 1552) = nullsub_1(v0 + 304);
  sub_2250D96D8(v0 + 16, v0 + 592);
  uint64_t v32 = nullsub_1(v0 + 592);
  sub_2250D98D4(v32);
  sub_2250D1E6C(v31);
  *(void *)(v0 + 1560) = v33;
  *(unsigned char *)(v0 + 157) = 7;
  uint64_t v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 1568) = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_2250D795C;
  uint64_t v35 = OUTLINED_FUNCTION_64_0();
  return sub_2250D65FC(v35, v36, v37);
}

uint64_t sub_2250D795C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *int v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  *(void *)(v5 + 1576) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  else {
    *(void *)(v5 + 1584) = v3;
  }
  OUTLINED_FUNCTION_9_2();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "2250D7B4C: call analysis failed (funcsize=169)"

uint64_t sub_2250D7D4C()
{
  OUTLINED_FUNCTION_18_1();
  return v0();
}

uint64_t sub_2250D7D68()
{
  OUTLINED_FUNCTION_5_3();
  sub_2250D9980(v0 + 16, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2250D90E0);
  OUTLINED_FUNCTION_18_1();
  return v1();
}

uint64_t sub_2250D7DD8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return sub_2250D6BE4(v3, (uint64_t)a3);
  }
  else {
    return sub_2250D6C40(v3, (uint64_t)a2);
  }
}

uint64_t ContactResolutionSnippetGenerator.deinit()
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
}

uint64_t ContactResolutionSnippetGenerator.__deallocating_deinit()
{
  ContactResolutionSnippetGenerator.deinit();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_2250D7E84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D7F50()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D801C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateDetailedDisambiguationContactNames(contacts:directInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D80E8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateDetailedDisambiguationForMultipleHandlesWithSameLabel(contacts:directInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D81B4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateDetailedDisambiguationForMixedLabels(contacts:directInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D8280()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:outputGenerationManifest:)();
}

uint64_t sub_2250D8378()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2250D9A38;
  return ContactResolutionSnippetGenerator.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:dialogOverride:outputGenerationManifest:)();
}

uint64_t sub_2250D8478()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_39_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_3(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_72_0();
  return sub_2250D2690();
}

uint64_t sub_2250D8508(uint64_t a1)
{
  return a1;
}

uint64_t sub_2250D8538()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_39_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_3(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_72_0();
  return sub_2250D3E34();
}

uint64_t sub_2250D85C8()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_39_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_3(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_72_0();
  return sub_2250D4810();
}

uint64_t sub_2250D8658()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_39_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_3(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_72_0();
  return sub_2250D4F44();
}

uint64_t sub_2250D86E8()
{
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_39_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_10_3(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_72_0();
  return sub_2250D54F0();
}

uint64_t sub_2250D8778()
{
  OUTLINED_FUNCTION_86();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 64);
  char v9 = *(unsigned char *)(v0 + 32);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_10_3(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_2250D48D8;
  return sub_2250D5F8C(v2, v3, v4, v9, v5, v6, v7, v8);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateSimpleDisambiguationUniqueLabels(contacts:directInvocationID:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_8_4();
  uint64_t v27 = *(void *)(v12 + 8) + **(int **)(v12 + 8);
  uint64_t v28 = v12 + 8;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_10_3(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_33_1();
  return v24(v16, v17, v18, v19, v20, v21, v22, v23, v27, v28, a11, a12);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateSimpleDisambiguationMixedLabels(contacts:directInvocationID:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_8_4();
  uint64_t v27 = *(void *)(v12 + 16) + **(int **)(v12 + 16);
  uint64_t v28 = v12 + 16;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_10_3(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_33_1();
  return v24(v16, v17, v18, v19, v20, v21, v22, v23, v27, v28, a11, a12);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateDetailedDisambiguationContactNames(contacts:directInvocationID:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_8_4();
  uint64_t v27 = *(void *)(v12 + 24) + **(int **)(v12 + 24);
  uint64_t v28 = v12 + 24;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_10_3(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_33_1();
  return v24(v16, v17, v18, v19, v20, v21, v22, v23, v27, v28, a11, a12);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateDetailedDisambiguationForMultipleHandlesWithSameLabel(contacts:directInvocationID:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_8_4();
  uint64_t v27 = *(void *)(v12 + 32) + **(int **)(v12 + 32);
  uint64_t v28 = v12 + 32;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_10_3(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_33_1();
  return v24(v16, v17, v18, v19, v20, v21, v22, v23, v27, v28, a11, a12);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateDetailedDisambiguationForMixedLabels(contacts:directInvocationID:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_8_4();
  uint64_t v27 = *(void *)(v12 + 40) + **(int **)(v12 + 40);
  uint64_t v28 = v12 + 40;
  uint64_t v13 = swift_task_alloc();
  uint64_t v14 = (void *)OUTLINED_FUNCTION_10_3(v13);
  *uint64_t v14 = v15;
  v14[1] = sub_2250D9A38;
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_33_1();
  return v24(v16, v17, v18, v19, v20, v21, v22, v23, v27, v28, a11, a12);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:outputGenerationManifest:)()
{
  OUTLINED_FUNCTION_52_1();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 48) + **(int **)(v0 + 48));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_10_3(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_2250D9A38;
  uint64_t v4 = OUTLINED_FUNCTION_50_1();
  return v6(v4);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerating.generateYesNoClarificationContactName(contact:contactVerb:primaryButtonInvocationID:secondaryButtonInvocationID:dialogOverride:outputGenerationManifest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_52_1();
  uint64_t v16 = (uint64_t (*)(uint64_t))(*(void *)(a11 + 56) + **(int **)(a11 + 56));
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = (void *)OUTLINED_FUNCTION_10_3(v11);
  *uint64_t v12 = v13;
  v12[1] = sub_2250D9A38;
  uint64_t v14 = OUTLINED_FUNCTION_50_1();
  return v16(v14);
}

uint64_t type metadata accessor for ContactResolutionSnippetGenerator()
{
  return self;
}

uint64_t method lookup function for ContactResolutionSnippetGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactResolutionSnippetGenerator);
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:deviceState:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_2250D8F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a18 == 2)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else if (a18 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
  }
  else
  {
    if (a18) {
      return result;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for MaterializationOutcome(uint64_t a1)
{
  sub_2250D90E0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(unsigned char *)(a1 + 136));
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_1(a1 + 160);
}

uint64_t sub_2250D90E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a18)
  {
    if (a18 == 2)
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (a18 != 1) {
        return result;
      }
      swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MaterializationOutcome(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v19 = *(void *)(a2 + 64);
  uint64_t v20 = *(void *)(a2 + 72);
  uint64_t v21 = *(void *)(a2 + 80);
  uint64_t v22 = *(void *)(a2 + 88);
  uint64_t v23 = *(void *)(a2 + 96);
  uint64_t v24 = *(void *)(a2 + 104);
  uint64_t v25 = *(void *)(a2 + 112);
  uint64_t v26 = *(void *)(a2 + 120);
  uint64_t v27 = *(void *)(a2 + 128);
  char v28 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v19;
  *(void *)(a1 + 72) = v20;
  *(void *)(a1 + 80) = v21;
  *(void *)(a1 + 88) = v22;
  *(void *)(a1 + 96) = v23;
  *(void *)(a1 + 104) = v24;
  *(void *)(a1 + 112) = v25;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v27;
  *(unsigned char *)(a1 + 136) = v28;
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  uint64_t v12 = *(void **)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = a2 + 160;
  long long v14 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v14;
  uint64_t v15 = v14;
  uint64_t v16 = **(void (***)(uint64_t, uint64_t, uint64_t))(v14 - 8);
  swift_bridgeObjectRetain();
  id v17 = v12;
  v16(a1 + 160, v13, v15);
  return a1;
}

uint64_t assignWithCopy for MaterializationOutcome(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v30 = *(void *)(a2 + 64);
  uint64_t v31 = *(void *)(a2 + 72);
  uint64_t v32 = *(void *)(a2 + 80);
  uint64_t v33 = *(void *)(a2 + 88);
  uint64_t v34 = *(void *)(a2 + 96);
  uint64_t v35 = *(void *)(a2 + 104);
  uint64_t v36 = *(void *)(a2 + 112);
  uint64_t v37 = *(void *)(a2 + 120);
  uint64_t v38 = *(void *)(a2 + 128);
  char v39 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 128);
  char v25 = *(unsigned char *)(a1 + 136);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v30;
  *(void *)(a1 + 72) = v31;
  *(void *)(a1 + 80) = v32;
  *(void *)(a1 + 88) = v33;
  *(void *)(a1 + 96) = v34;
  *(void *)(a1 + 104) = v35;
  *(void *)(a1 + 112) = v36;
  *(void *)(a1 + 120) = v37;
  *(void *)(a1 + 128) = v38;
  *(unsigned char *)(a1 + 136) = v39;
  sub_2250D90E0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(a2 + 152);
  uint64_t v27 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = v26;
  id v28 = v26;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  return a1;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

uint64_t assignWithTake for MaterializationOutcome(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 128);
  char v5 = *(unsigned char *)(a2 + 136);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)(a1 + 112);
  uint64_t v18 = *(void *)(a1 + 128);
  char v19 = *(unsigned char *)(a1 + 136);
  long long v20 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v20;
  long long v21 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v21;
  long long v22 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v22;
  long long v23 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v23;
  *(void *)(a1 + 128) = v4;
  *(unsigned char *)(a1 + 136) = v5;
  sub_2250D90E0(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18, v19);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);

  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v25 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v25;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  return a1;
}

uint64_t getEnumTagSinglePayload for MaterializationOutcome(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 200))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 144);
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

uint64_t storeEnumTagSinglePayload for MaterializationOutcome(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
      *(void *)(result + 144) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MaterializationOutcome()
{
  return &type metadata for MaterializationOutcome;
}

uint64_t sub_2250D96CC(uint64_t result)
{
  *(unsigned char *)(result + 136) = 2;
  return result;
}

uint64_t sub_2250D96D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2250D9734(uint64_t result)
{
  *(unsigned char *)(result + 136) = 1;
  return result;
}

uint64_t sub_2250D9740(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactResolutionDisambiguationParameters(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2250D979C(uint64_t result)
{
  *(unsigned char *)(result + 136) = 0;
  return result;
}

uint64_t sub_2250D97A4(uint64_t a1)
{
  return a1;
}

unint64_t sub_2250D9814()
{
  unint64_t result = qword_2680C0F18;
  if (!qword_2680C0F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2680C0F18);
  }
  return result;
}

uint64_t sub_2250D9860()
{
  sub_2250D90E0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144), *(unsigned char *)(v0 + 152));
  return MEMORY[0x270FA0238](v0, 153, 7);
}

uint64_t sub_2250D98CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 136);
}

uint64_t sub_2250D98D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2250D9980(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 136);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), v4);
  return a1;
}

unint64_t sub_2250D99EC()
{
  unint64_t result = qword_2680C0F28;
  if (!qword_2680C0F28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2680C0F28);
  }
  return result;
}

uint64_t sub_2250D9A2C()
{
  return swift_release();
}

void OUTLINED_FUNCTION_2_3()
{
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[31] = a5;
  v6[32] = v5;
  v6[29] = a3;
  v6[30] = a4;
  v6[27] = result;
  v6[28] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  *(void *)(v0 + 352) = *(void *)(v2 + 8);
  *(void *)(v0 + 360) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

__n128 OUTLINED_FUNCTION_12_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11, uint64_t a12)
{
  *(void *)(v12 + 328) = a1;
  *(void *)(a1 + 16) = v13;
  __n128 result = a11;
  *(__n128 *)(a1 + 24) = a11;
  *(void *)(a1 + 40) = a12;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return v0;
}

void OUTLINED_FUNCTION_15_3()
{
  JUMPOUT(0x22A62D170);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return a15;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_3@<X0>(char a1@<W8>, __n128 a2@<Q0>, __n128 a3@<Q1>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, long long a10, uint64_t a11, uint64_t a12, uint64_t a13, long long a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, long long a20)
{
  *(_OWORD *)(v24 + 16) = a10;
  *(unsigned char *)(v24 + 32) = a1;
  *(void *)(v24 + 40) = v20;
  *(void *)(v24 + 48) = v21;
  *(_OWORD *)(v24 + 56) = a14;
  *(__n128 *)(v24 + 72) = a2;
  *(__n128 *)(v24 + 88) = a3;
  *(void *)(v24 + 104) = v22;
  *(_OWORD *)(v24 + 112) = a20;
  sub_2250D9734(v24 + 16);
  return sub_2250D96D8(v24 + 16, v23);
}

__n128 OUTLINED_FUNCTION_28_2@<Q0>(char a1@<W8>, __n128 a2@<Q0>, __n128 a3@<Q1>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__n128 a23)
{
  *(unsigned char *)(v26 + 256) = a1;
  *(void *)(v26 + 264) = v23;
  *(void *)(v26 + 272) = v24;
  *(_OWORD *)(v26 + 280) = a17;
  *(__n128 *)(v26 + 296) = a2;
  *(__n128 *)(v26 + 312) = a3;
  *(void *)(v26 + 328) = v25;
  __n128 result = a23;
  *(__n128 *)(v26 + 336) = a23;
  return result;
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t result)
{
  *(void *)(v1 + 336) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_40_2(uint64_t result)
{
  v2[6] = v1;
  v2[9] = result;
  v2[10] = 0x64656B636F4C7369;
  v2[11] = 0xE800000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_42_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return sub_2250D64B4(v7, (v6 & 1) == 0, a3, a6, (uint64_t)va);
}

void OUTLINED_FUNCTION_43_2(uint64_t a1@<X8>, int a2, char a3)
{
  *(void *)(v5 + 168) = a1;
  *(void *)(v5 + 176) = v3;
  *(void *)(v5 + 184) = (v4 - 32) | 0x8000000000000000;
  *(void *)(v5 + 216) = a1;
  *(unsigned char *)(v5 + 192) = a3;
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45_1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  a1[2] = v14;
  a1[3] = v17;
  a1[4] = a14;
  a1[5] = v19;
  a1[6] = v18;
  a1[7] = v16;
  a1[8] = v15;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t a1, unsigned char *a2)
{
  *a2 = 7;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_51_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58_1(uint64_t a1)
{
  *(void *)(v1 + 312) = a1;
  return swift_task_alloc();
}

__n128 OUTLINED_FUNCTION_59_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,long long a24)
{
  return (__n128)a24;
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return v0;
}

void OUTLINED_FUNCTION_65_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(void *)(v10 + 136) = (v9 - 32) | 0x8000000000000000;
  *(unsigned char *)(v10 + 144) = a9;
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return v0;
}

_WORD *OUTLINED_FUNCTION_70_0(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_71_0(uint64_t a1)
{
  *(void *)(v1 + 288) = a1;
  return sub_225106530();
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return MEMORY[0x270F67E68](v0);
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  __swift_project_boxed_opaque_existential_1(v0, *(void *)(v1 + 64));
  return sub_225106490();
}

uint64_t OUTLINED_FUNCTION_76_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[23] = a4;
  v5[24] = v4;
  v5[21] = a2;
  v5[22] = a3;
  v5[20] = a1;
  return sub_2251064A0();
}

void OUTLINED_FUNCTION_77_0(uint64_t a1@<X8>)
{
  *(unsigned char *)(v2 + 96) = v1;
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = 0xD000000000000013;
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_2250CAAD4(v0);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return sub_2250C66C8();
}

uint64_t OUTLINED_FUNCTION_81_0(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_225107300();
}

uint64_t OUTLINED_FUNCTION_82()
{
  unint64_t v2 = (void *)(*(void *)(v0 + 192) + 40);
  return sub_2250C7CC4(v2);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return 0x656E4F6863696877;
}

void OUTLINED_FUNCTION_88(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_91(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[52] = a4;
  v5[53] = v4;
  v5[50] = a2;
  v5[51] = a3;
  v5[49] = a1;
  return sub_2251064A0();
}

void sub_2250DA218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)sub_2251071A0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  v7[4] = sub_2250DA330;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_2250DA338;
  v7[3] = &block_descriptor_0;
  uint64_t v6 = _Block_copy(v7);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v6);
}

uint64_t sub_2250DA2F8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2250DA330()
{
  return swift_bridgeObjectRetain();
}

id sub_2250DA338(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_2250DA3DC();
    uint64_t v4 = (void *)sub_225107150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
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

unint64_t sub_2250DA3DC()
{
  unint64_t result = qword_2680C0D30;
  if (!qword_2680C0D30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2680C0D30);
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsLogger()
{
  return &type metadata for CoreAnalyticsLogger;
}

uint64_t sub_2250DA42C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F48);
  uint64_t v1 = OUTLINED_FUNCTION_9(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_7();
  uint64_t v42 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F50);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_7();
  uint64_t v39 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F58);
  uint64_t v7 = OUTLINED_FUNCTION_9(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F60);
  uint64_t v12 = OUTLINED_FUNCTION_9(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2();
  uint64_t v15 = v14 - v13;
  sub_225105CF0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v17;
  uint64_t v41 = v16;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v19 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F68);
  sub_225105F30();
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v21;
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22510C660;
  uint64_t v24 = *(void (**)(void))(v22 + 104);
  OUTLINED_FUNCTION_3_6();
  v24();
  OUTLINED_FUNCTION_3_6();
  v24();
  OUTLINED_FUNCTION_3_6();
  v24();
  sub_2250DA77C(v23);
  sub_225105F10();
  swift_bridgeObjectRelease();
  sub_225105CB0();
  sub_225105CE0();
  sub_225105CD0();
  uint64_t v25 = sub_2251069C0();
  OUTLINED_FUNCTION_1_5(v15, v26, v27, v25);
  uint64_t v28 = sub_2251069E0();
  OUTLINED_FUNCTION_1_5(v10, v29, v30, v28);
  uint64_t v31 = sub_225106A00();
  OUTLINED_FUNCTION_1_5(v39, v32, v33, v31);
  uint64_t v34 = sub_2251069D0();
  OUTLINED_FUNCTION_1_5(v42, v35, v36, v34);
  sub_225106A10();
  swift_allocObject();
  uint64_t v37 = sub_2251069F0();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v20, v41);
  return v37;
}

uint64_t sub_2250DA77C(uint64_t a1)
{
  uint64_t v2 = sub_225105F30();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F70);
  uint64_t result = sub_2251074F0();
  uint64_t v8 = result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  uint64_t v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    sub_2250DAAA0(&qword_2680C0F78);
    uint64_t v13 = sub_225107180();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *(void *)(v8 + 48) + v15 * v11, v2);
        sub_2250DAAA0(&qword_2680C0F80);
        char v20 = sub_225107190();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      uint64_t v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v8 + 48) + v15 * v11, v22, v2);
      uint64_t v23 = *(void *)(v8 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_2250DAAA0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_225105F30();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

uint64_t sub_2250DAB28()
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v2 = v0 + *(void *)(v1 + 152);
  uint64_t v3 = *(void *)v2;
  sub_2250DF330(*(void *)v2, *(void *)(v2 + 8));
  return v3;
}

uint64_t sub_2250DAB70()
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v2 = (uint64_t *)(v0 + *(void *)(v1 + 152));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  *uint64_t v2 = v5;
  v2[1] = v6;
  return sub_2250DEF8C(v3, v4);
}

uint64_t sub_2250DABA0@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v4 = v1 + *(void *)(v3 + 160);
  swift_beginAccess();
  return sub_2250DF6DC(v4, a1);
}

uint64_t sub_2250DABFC(uint64_t a1)
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v4 = v1 + *(void *)(v3 + 160);
  swift_beginAccess();
  sub_2250DF744(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2250DAC60()
{
  return swift_retain();
}

uint64_t sub_2250DAC80()
{
  OUTLINED_FUNCTION_45_2();
  *(void *)(v0 + *(void *)(v1 + 168)) = v2;
  return swift_release();
}

uint64_t DateTimeResolverFlow.__allocating_init(nextFlow:resolutionStrategy:spec:locale:timeZone:calendar:currentDate:)()
{
  uint64_t v0 = swift_allocObject();
  DateTimeResolverFlow.init(nextFlow:resolutionStrategy:spec:locale:timeZone:calendar:currentDate:)();
  return v0;
}

void DateTimeResolverFlow.init(nextFlow:resolutionStrategy:spec:locale:timeZone:calendar:currentDate:)()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t)v0 + *(void *)(*v0 + 160);
  uint64_t v4 = sub_225106670();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  OUTLINED_FUNCTION_45_2();
  *(void *)((char *)v0 + *(void *)(v5 + 168)) = 0;
  v0[2] = v2;
  OUTLINED_FUNCTION_45_2();
  *(_OWORD *)((char *)v0 + *(void *)(v6 + 152)) = xmmword_22510C670;
  OUTLINED_FUNCTION_45_2();
  OUTLINED_FUNCTION_28_3();
  v7();
  sub_225105F00();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_28_3();
  v8();
  sub_225105F50();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_28_3();
  v9();
  sub_225105F40();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_28_3();
  v10();
  sub_225105E90();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_28_3();
  v11();
  sub_2251068A0();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_28_3();
  v12();
  OUTLINED_FUNCTION_5_4();
}

void sub_2250DAF64()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_39_3();
  uint64_t v4 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_7();
  uint64_t v22 = v8;
  OUTLINED_FUNCTION_15_4();
  uint64_t v23 = sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_40_3();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2251070F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_2680C5BC0);
  OUTLINED_FUNCTION_35_3();
  uint64_t v13 = sub_2251070D0();
  os_log_type_t v14 = sub_225107380();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v21 = v1;
    unint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_21_3();
    *(_DWORD *)unint64_t v15 = 136315138;
    sub_2250DAB28();
    type metadata accessor for DateTimeResolverFlow.State();
    uint64_t v16 = sub_225107220();
    uint64_t v18 = OUTLINED_FUNCTION_48_1(v16, v17);
    OUTLINED_FUNCTION_47_1(v18);
    sub_225107420();
    OUTLINED_FUNCTION_25_4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v13, v14, "state of DateTimeResolverFlow: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    uint64_t v1 = v21;
    OUTLINED_FUNCTION_7_1();
  }
  else
  {

    OUTLINED_FUNCTION_25_4();
  }
  sub_2251065A0();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v0, v23) == *MEMORY[0x263F6FF78])
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 96))(v0, v23);
    __swift_instantiateConcreteTypeFromMangledName(qword_2680C1240);
    OUTLINED_FUNCTION_18_3();
    v19();
    OUTLINED_FUNCTION_29_2();
    v20();
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v4);
    sub_2250DABFC(v1);
    swift_retain();
    sub_2250DAC80();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v22, v4);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v23);
  }
  OUTLINED_FUNCTION_5_4();
}

void sub_2250DB2C8()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v38 = v3;
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F90);
  uint64_t v7 = OUTLINED_FUNCTION_9(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_3();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F98);
  uint64_t v9 = OUTLINED_FUNCTION_9(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_42_3();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v11 = OUTLINED_FUNCTION_9(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_40_3();
  uint64_t v12 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_16_3();
  sub_2250DABA0(v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v12) == 1)
  {
    sub_2250DF5F4(v2, &qword_2680C0F88);
    sub_225107600();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_18_3();
    v16();
    if ((*(uint64_t (**)(uint64_t, void))(*(void *)(v5 + 88) + 16))(v1, *(void *)(v5 + 80)))
    {
      uint64_t v17 = sub_2250DAB28();
      uint64_t v19 = v17;
      unint64_t v20 = v18;
      if (v18 >> 62)
      {
        if (v18 >> 62 == 1)
        {
          sub_225106A70();
          sub_225106A80();
          sub_225106A40();
          sub_225106A60();
          sub_225106A50();
          sub_225106A30();
          sub_225106A90();
          swift_allocObject();
          sub_2251069A0();
          if (qword_2680C0698 != -1) {
            swift_once();
          }
          uint64_t v21 = sub_2251070F0();
          __swift_project_value_buffer(v21, (uint64_t)qword_2680C5BC0);
          swift_retain_n();
          swift_retain_n();
          uint64_t v22 = sub_2251070D0();
          os_log_type_t v23 = sub_225107380();
          if (OUTLINED_FUNCTION_51_1(v23))
          {
            os_log_type_t v37 = v0;
            uint64_t v24 = swift_slowAlloc();
            swift_slowAlloc();
            *(_DWORD *)uint64_t v24 = 136315394;
            sub_2250DF5AC(qword_2680C0FA0, MEMORY[0x263F6D778]);
            uint64_t v25 = sub_2251077A0();
            uint64_t v27 = OUTLINED_FUNCTION_48_1(v25, v26);
            OUTLINED_FUNCTION_34_2(v27);
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v24 + 12) = 2080;
            uint64_t v28 = sub_2251077A0();
            uint64_t v30 = OUTLINED_FUNCTION_48_1(v28, v29);
            OUTLINED_FUNCTION_34_2(v30);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2250AF000, v22, v37, "Original dateTime: %s, mutated datetime: %s", (uint8_t *)v24, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_7_1();
            OUTLINED_FUNCTION_7_1();
          }
          else
          {

            swift_release_n();
            swift_release_n();
          }
          sub_2250DD3D8();
          swift_release();
          swift_release();
          swift_release();
        }
        else if (v17 | v18 ^ 0x8000000000000000)
        {
          sub_2250DD290(v38);
        }
        else
        {
          sub_2250DC1A8();
        }
      }
      else
      {
        sub_2250DC47C();
        sub_2250DEF8C(v19, v20);
      }
    }
    else
    {
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_2251070F0();
      unint64_t v32 = (void *)OUTLINED_FUNCTION_33(v31, (uint64_t)qword_2680C5BC0);
      os_log_type_t v33 = sub_225107380();
      if (OUTLINED_FUNCTION_51_1(v33))
      {
        uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_62_0(v34);
        OUTLINED_FUNCTION_24_3(&dword_2250AF000, v35, v36, "delegate.shouldResolve returned false, returning early");
        OUTLINED_FUNCTION_7_1();
      }

      sub_2250DCCB4();
    }
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
    OUTLINED_FUNCTION_5_4();
  }
}

void sub_2250DB874()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v0 = sub_2250DAB28();
  if (v1 >> 62 == 2 && v0 == 0 && v1 == 0x8000000000000000)
  {
    sub_2250DAB70();
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_2251070F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_2680C5BC0);
    OUTLINED_FUNCTION_35_3();
    uint64_t v5 = sub_2251070D0();
    os_log_type_t v6 = sub_225107380();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_22_3();
      uint64_t v14 = OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_50_2(4.8149e-34);
      type metadata accessor for DateTimeResolverFlow.State();
      uint64_t v12 = sub_225107220();
      sub_2250B72A8(v12, v13, &v14);
      OUTLINED_FUNCTION_37_2();
      OUTLINED_FUNCTION_25_4();
      swift_bridgeObjectRelease();
      uint64_t v10 = "[DateTimeResolverFlow::onFlowCompletion] setting state to %s";
      goto LABEL_16;
    }
  }
  else
  {
    sub_2250DEF8C(v0, v1);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2251070F0();
    __swift_project_value_buffer(v4, (uint64_t)qword_2680C5BC0);
    OUTLINED_FUNCTION_35_3();
    uint64_t v5 = sub_2251070D0();
    os_log_type_t v6 = sub_225107390();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_22_3();
      uint64_t v14 = OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_50_2(4.8149e-34);
      type metadata accessor for DateTimeResolverFlow.State();
      uint64_t v8 = sub_225107220();
      sub_2250B72A8(v8, v9, &v14);
      OUTLINED_FUNCTION_37_2();
      OUTLINED_FUNCTION_25_4();
      swift_bridgeObjectRelease();
      uint64_t v10 = "[DateTimeResolverFlow::onFlowCompletion] unexpected state: %s";
LABEL_16:
      _os_log_impl(&dword_2250AF000, v5, v6, v10, v7, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();

      return;
    }
  }

  OUTLINED_FUNCTION_25_4();
}

void sub_2250DBAEC()
{
  OUTLINED_FUNCTION_8_3();
  sub_225105E90();
  OUTLINED_FUNCTION_0();
  v33[12] = v1;
  v33[13] = v0;
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4_7();
  v33[11] = v2;
  sub_225105F40();
  OUTLINED_FUNCTION_0();
  v33[9] = v4;
  v33[10] = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_7();
  v33[8] = v5;
  OUTLINED_FUNCTION_15_4();
  sub_225105F50();
  OUTLINED_FUNCTION_0();
  v33[6] = v7;
  v33[7] = v6;
  MEMORY[0x270FA5388](v6);
  v33[5] = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_15_4();
  sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_57_0();
  v33[4] = v12;
  OUTLINED_FUNCTION_28_1();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v33[1] = (char *)v33 - v15;
  MEMORY[0x270FA5388](v14);
  v33[2] = (char *)v33 - v16;
  uint64_t v17 = sub_2251068E0();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_57_0();
  v33[3] = v21;
  OUTLINED_FUNCTION_28_1();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v33 - v24;
  sub_2250DBE6C();
  OUTLINED_FUNCTION_46_3();
  v26();
  OUTLINED_FUNCTION_18_3();
  v27();
  uint64_t v28 = *(void (**)(void))(v10 + 16);
  OUTLINED_FUNCTION_23_3();
  v28();
  OUTLINED_FUNCTION_23_3();
  v28();
  OUTLINED_FUNCTION_23_3();
  v28();
  OUTLINED_FUNCTION_27_4();
  v29();
  OUTLINED_FUNCTION_29_2();
  v30();
  OUTLINED_FUNCTION_27_4();
  v31();
  OUTLINED_FUNCTION_27_4();
  v32();
  sub_225106900();
  swift_allocObject();
  sub_2251068F0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v17);
  OUTLINED_FUNCTION_5_4();
}

double sub_2250DBE6C()
{
  type metadata accessor for LocationService();
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225106160();
  if (qword_2680C0690 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_225107100();
  __swift_project_value_buffer(v4, (uint64_t)qword_2680C5BA8);
  OUTLINED_FUNCTION_27_4();
  v5();
  sub_2250BFD9C(&v22, (uint64_t)v3);
  uint64_t v6 = sub_2250F2DD8();
  if (v6)
  {
    uint64_t v7 = v6;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2251070F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_2680C5BC0);
    uint64_t v9 = v7;
    uint64_t v10 = sub_2251070D0();
    os_log_type_t v11 = sub_225107380();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 134218240;
      [v9 lat];
      *(void *)&long long v22 = v13;
      sub_225107420();
      *(_WORD *)(v12 + 12) = 2048;
      [v9 lng];
      *(void *)&long long v22 = v14;
      sub_225107420();

      _os_log_impl(&dword_2250AF000, v10, v11, "latitude: %f, longitude: %f", (uint8_t *)v12, 0x16u);
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      uint64_t v10 = v9;
    }

    [v9 lat];
    double v17 = v19;
    [v9 lng];
  }
  else
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2251070F0();
    uint64_t v9 = OUTLINED_FUNCTION_33(v15, (uint64_t)qword_2680C5BC0);
    os_log_type_t v16 = sub_225107390();
    double v17 = 0.0;
    if (os_log_type_enabled(v9, v16))
    {
      uint64_t v18 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v18);
      _os_log_impl(&dword_2250AF000, v9, v16, "did not get location information from LocationService", v0, 2u);
      OUTLINED_FUNCTION_7_1();
    }
  }

  sub_2250DF54C((uint64_t)v3);
  return v17;
}

void sub_2250DC1A8()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_3();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2251070F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2680C5BC0);
  swift_retain_n();
  uint64_t v6 = sub_2251070D0();
  os_log_type_t v7 = sub_225107380();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = OUTLINED_FUNCTION_21_3();
    *(_DWORD *)uint64_t v8 = 136315138;
    if (sub_2250DAC60())
    {
      sub_2251065E0();
      swift_release();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10C0);
    uint64_t v9 = sub_225107220();
    sub_2250B72A8(v9, v10, &v16);
    sub_225107420();
    OUTLINED_FUNCTION_25_4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v6, v7, "handling initialized state intent: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {

    OUTLINED_FUNCTION_25_4();
  }
  sub_2250DABA0(v0);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void))(*(void *)(v2 + 88) + 24))(&v16, v0, *(void *)(v2 + 80));
  sub_2250DF5F4(v0, &qword_2680C0F88);
  if (v16)
  {
    sub_2250DD3D8();
    swift_release();
  }
  else
  {
    os_log_type_t v11 = (void *)sub_2251070D0();
    os_log_type_t v12 = sub_225107380();
    if (OUTLINED_FUNCTION_51_1(v12))
    {
      uint64_t v13 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v13);
      OUTLINED_FUNCTION_24_3(&dword_2250AF000, v14, v15, "no datetime node present in the intent, skipping to nextFlow");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250DCCB4();
  }
  OUTLINED_FUNCTION_5_4();
}

void sub_2250DC47C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v84 = v3;
  uint64_t v85 = v2;
  id v77 = v4;
  OUTLINED_FUNCTION_2_1();
  uint64_t v6 = v5;
  uint64_t v7 = sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v8;
  MEMORY[0x270FA5388](v9);
  Swift::String v86 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_15_4();
  sub_2251065C0();
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_0();
  uint64_t v79 = v14;
  uint64_t v80 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x270FA5388](v15);
  uint64_t v78 = (char *)v74 - v16;
  OUTLINED_FUNCTION_15_4();
  uint64_t v17 = sub_225106080();
  uint64_t v18 = OUTLINED_FUNCTION_9(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v20 = OUTLINED_FUNCTION_9(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v82 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_4_7();
  uint64_t v83 = v27;
  uint64_t v28 = sub_2250DAC60();
  if (!v28) {
    goto LABEL_4;
  }
  uint64_t v81 = v28;
  sub_2250DABA0(v23);
  if (__swift_getEnumTagSinglePayload(v23, 1, v24) == 1)
  {
    swift_release();
    sub_2250DF5F4(v23, &qword_2680C0F88);
LABEL_4:
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_2251070F0();
    uint64_t v30 = (void *)OUTLINED_FUNCTION_33(v29, (uint64_t)qword_2680C5BC0);
    os_log_type_t v31 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v31))
    {
      unint64_t v32 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v32);
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v33, v34, "serverConversion and nlIntent are nil, returning early from handleDateTimeResolved");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250DCC34();
    OUTLINED_FUNCTION_26_3();
    swift_release();
    uint64_t v35 = OUTLINED_FUNCTION_44_3();
    v36(v35);
    OUTLINED_FUNCTION_5_6();
    v37();
    goto LABEL_21;
  }
  v74[1] = v7;
  OUTLINED_FUNCTION_18_3();
  v38();
  uint64_t v75 = v24;
  uint64_t v39 = (void *)sub_2251065E0();
  v89[0] = (uint64_t)v77;
  uint64_t v40 = (void *)(*(uint64_t (**)(void *, uint64_t *, void))(*(void *)(v6 + 88) + 72))(v39, v89, *(void *)(v6 + 80));

  if (v40)
  {
    id v41 = v40;
    sub_2251065F0();
    sub_225106600();
    sub_225106610();
    sub_225106620();
    swift_allocObject();
    id v77 = v41;
    uint64_t v42 = sub_2251065D0();
    uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_2680C1240) + 48);
    uint64_t v44 = v82;
    uint64_t v45 = v78;
    OUTLINED_FUNCTION_29_2();
    v46();
    *(void *)&v45[v43] = v42;
    OUTLINED_FUNCTION_46_3();
    v47();
    uint64_t v48 = *(void *)(v1 + 16);
    OUTLINED_FUNCTION_29_2();
    v49();
    v74[0] = v42;
    swift_retain();
    sub_2251065B0();
    char v50 = sub_225105FC0();
    OUTLINED_FUNCTION_5_6();
    v51();
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_2251070F0();
    __swift_project_value_buffer(v52, (uint64_t)qword_2680C5BC0);
    swift_retain_n();
    uint64_t v53 = sub_2251070D0();
    os_log_type_t v54 = sub_225107380();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      v89[0] = OUTLINED_FUNCTION_21_3();
      *(_DWORD *)uint64_t v55 = 67109378;
      LODWORD(v88) = v50 & 1;
      sub_225107420();
      *(_WORD *)(v55 + 8) = 2080;
      uint64_t v88 = v48;
      sub_225105FD0();
      sub_2250DF5AC((unint64_t *)&qword_2680C10C8, MEMORY[0x263F6F570]);
      uint64_t v56 = sub_2251077A0();
      uint64_t v88 = sub_2250B72A8(v56, v57, v89);
      sub_225107420();
      OUTLINED_FUNCTION_53_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2250AF000, v53, v54, "nextFlowOn: %{BOOL}d, flow is: %s", (uint8_t *)v55, 0x12u);
      swift_arrayDestroy();
      uint64_t v44 = v82;
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      OUTLINED_FUNCTION_53_1();
    }
    sub_2250DCC34();
    sub_225106350();
    swift_release();
    uint64_t v70 = OUTLINED_FUNCTION_44_3();
    v71(v70);

    swift_release();
    swift_release();
    OUTLINED_FUNCTION_5_6();
    v72();
    OUTLINED_FUNCTION_5_6();
    v73();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v83, v75);
  }
  else
  {
    uint64_t v58 = v75;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_2251070F0();
    uint64_t v60 = (void *)OUTLINED_FUNCTION_33(v59, (uint64_t)qword_2680C5BC0);
    os_log_type_t v61 = sub_225107390();
    BOOL v62 = OUTLINED_FUNCTION_22_2(v61);
    uint64_t v63 = v82;
    if (v62)
    {
      uint64_t v64 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v64);
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v65, v66, "delegate did return an intent with the resolved dateTime, moving on to the next flow without setting location");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250DCC74();
    OUTLINED_FUNCTION_26_3();
    swift_release();
    uint64_t v67 = OUTLINED_FUNCTION_44_3();
    v68(v67);
    swift_release();
    OUTLINED_FUNCTION_5_6();
    v69();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v83, v58);
  }
LABEL_21:
  OUTLINED_FUNCTION_5_4();
}

void (*sub_2250DCC34())()
{
  return sub_2250DF7E0;
}

void (*sub_2250DCC74())()
{
  return sub_2250DF5A8;
}

void sub_2250DCCB4()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v3 = v1;
  uint64_t v60 = v5;
  os_log_type_t v61 = v4;
  sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v62 = v7;
  uint64_t v63 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_38_1();
  uint64_t v8 = sub_2251065C0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v13;
  uint64_t v59 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x270FA5388](v14);
  unint64_t v57 = (char *)v53 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v17 = OUTLINED_FUNCTION_9(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v22;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_4_7();
  uint64_t v55 = v24;
  uint64_t v25 = sub_2250DAC60();
  if (!v25) {
    goto LABEL_4;
  }
  uint64_t v26 = v25;
  sub_2250DABA0(v20);
  if (__swift_getEnumTagSinglePayload(v20, 1, v21) == 1)
  {
    swift_release();
    sub_2250DF5F4(v20, &qword_2680C0F88);
LABEL_4:
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2251070F0();
    uint64_t v28 = (void *)OUTLINED_FUNCTION_33(v27, (uint64_t)qword_2680C5BC0);
    os_log_type_t v29 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v29))
    {
      uint64_t v30 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v30);
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v31, v32, "serverConversion and nlIntent are nil, returning early from passThroughIntent");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250DCC34();
    sub_225106350();
    swift_release();
    v61(v2);
    goto LABEL_15;
  }
  uint64_t v54 = v2;
  v53[0] = v8;
  uint64_t v33 = v10;
  OUTLINED_FUNCTION_18_3();
  v34();
  uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_2680C1240) + 48);
  uint64_t v36 = v57;
  v53[1] = v21;
  OUTLINED_FUNCTION_29_2();
  v37();
  *(void *)&v36[v35] = v26;
  OUTLINED_FUNCTION_46_3();
  v38();
  uint64_t v39 = *(void *)(v3 + 16);
  OUTLINED_FUNCTION_29_2();
  v40();
  swift_retain();
  sub_2251065B0();
  char v41 = sub_225105FC0();
  (*(void (**)(uint64_t, void))(v33 + 8))(v0, v53[0]);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_2251070F0();
  __swift_project_value_buffer(v42, (uint64_t)qword_2680C5BC0);
  swift_retain_n();
  uint64_t v43 = sub_2251070D0();
  os_log_type_t v44 = sub_225107380();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v46 = v54;
  if (v45)
  {
    uint64_t v47 = swift_slowAlloc();
    uint64_t v65 = OUTLINED_FUNCTION_21_3();
    *(_DWORD *)uint64_t v47 = 67109378;
    LODWORD(v64) = v41 & 1;
    sub_225107420();
    *(_WORD *)(v47 + 8) = 2080;
    v53[0] = v47 + 10;
    uint64_t v64 = v39;
    sub_225105FD0();
    sub_2250DF5AC((unint64_t *)&qword_2680C10C8, MEMORY[0x263F6F570]);
    uint64_t v48 = sub_2251077A0();
    uint64_t v64 = OUTLINED_FUNCTION_48_1(v48, v49);
    sub_225107420();
    OUTLINED_FUNCTION_53_1();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v43, v44, "nextFlowOn: %{BOOL}d, flow is: %s", (uint8_t *)v47, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {

    OUTLINED_FUNCTION_53_1();
  }
  sub_2250DCC34();
  sub_225106350();
  swift_release();
  v61(v46);
  swift_release();
  OUTLINED_FUNCTION_5_6();
  v50();
  OUTLINED_FUNCTION_5_6();
  v51();
LABEL_15:
  OUTLINED_FUNCTION_5_6();
  v52();
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250DD290(void (*a1)(uint64_t))
{
  sub_225106380();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_38_1();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2251070F0();
  uint64_t v5 = OUTLINED_FUNCTION_33(v4, (uint64_t)qword_2680C5BC0);
  os_log_type_t v6 = sub_225107380();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_6_2();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2250AF000, v5, v6, "[DateTimeResolverFlow::execute] completed, returning .complete()", v7, 2u);
    OUTLINED_FUNCTION_7_1();
  }

  sub_225106370();
  a1(v1);
  OUTLINED_FUNCTION_33_2();
  return v8();
}

void sub_2250DD3D8()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v0;
  uint64_t v171 = v3;
  v168 = v5;
  uint64_t v169 = v4;
  uint64_t v149 = *v0;
  uint64_t v6 = v149;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10D0);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_7();
  uint64_t v159 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10D8);
  OUTLINED_FUNCTION_0();
  uint64_t v174 = v11;
  uint64_t v175 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_57_0();
  uint64_t v163 = v12;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v13);
  v170 = (uint8_t *)v144 - v14;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v15);
  v176 = (char *)v144 - v16;
  OUTLINED_FUNCTION_15_4();
  uint64_t v161 = sub_225106800();
  OUTLINED_FUNCTION_0();
  uint64_t v162 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_4_7();
  uint64_t v172 = v19;
  OUTLINED_FUNCTION_15_4();
  uint64_t v152 = sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v151 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_4_7();
  uint64_t v150 = v22;
  uint64_t v148 = sub_225105F40();
  OUTLINED_FUNCTION_0();
  uint64_t v147 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_4_7();
  uint64_t v146 = v25;
  uint64_t v145 = *(void *)(v6 + 80);
  v144[4] = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v26);
  v144[5] = (char *)v144 - v27;
  OUTLINED_FUNCTION_15_4();
  uint64_t v154 = sub_225105F30();
  OUTLINED_FUNCTION_0();
  uint64_t v153 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_42_3();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10E0);
  uint64_t v31 = OUTLINED_FUNCTION_9(v30);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_16_3();
  uint64_t v156 = sub_225105E90();
  OUTLINED_FUNCTION_0();
  uint64_t v158 = v32;
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_57_0();
  v144[3] = v34;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v35);
  v144[2] = (char *)v144 - v36;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v37);
  uint64_t v155 = (char *)v144 - v38;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v39);
  uint64_t v157 = (char *)v144 - v40;
  OUTLINED_FUNCTION_15_4();
  uint64_t v41 = sub_225106930();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v42;
  uint64_t v44 = v42;
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_27_2();
  uint64_t v48 = v46 - v47;
  MEMORY[0x270FA5388](v49);
  uint64_t v51 = (char *)v144 - v50;
  sub_225106920();
  sub_2250DBAEC();
  uint64_t v173 = v52;
  char v53 = sub_225106890();
  uint64_t v160 = v43;
  uint64_t v54 = *(void (**)(uint64_t, char *, uint64_t))(v43 + 16);
  v165 = v51;
  v54(v48, v51, v41);
  uint64_t v166 = v41;
  v167 = v2;
  if (v53)
  {
    v144[0] = v1;
    uint64_t v55 = (char *)v2 + qword_2680C5B90;
    sub_225106A20();
    sub_225106A90();
    sub_2250DF5AC(&qword_2680C10F0, MEMORY[0x263F6D6D8]);
    sub_225107170();
    v144[1] = v55;
    char v56 = sub_225106910();
    swift_bridgeObjectRelease();
    uint64_t v58 = *(void (**)(void))(v44 + 8);
    unint64_t v57 = (char *)(v44 + 8);
    OUTLINED_FUNCTION_9_3();
    v58();
    v164 = v58;
    if (v56)
    {
      v176 = v57;
      uint64_t v59 = *(void (**)(void))(v158 + 16);
      uint64_t v60 = v156;
      OUTLINED_FUNCTION_32_3();
      v59();
      OUTLINED_FUNCTION_46_3();
      v61();
      uint64_t v62 = v144[0];
      sub_225105F20();
      OUTLINED_FUNCTION_33_2();
      v63();
      if (__swift_getEnumTagSinglePayload(v62, 1, v60) == 1)
      {
        sub_2250DF5F4(v62, &qword_2680C10E0);
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_2251070F0();
        uint64_t v65 = (void *)OUTLINED_FUNCTION_33(v64, (uint64_t)qword_2680C5BC0);
        os_log_type_t v66 = sub_225107380();
        BOOL v67 = OUTLINED_FUNCTION_22_2(v66);
        uint64_t v68 = v166;
        if (v67)
        {
          uint64_t v69 = (_WORD *)OUTLINED_FUNCTION_6_2();
          OUTLINED_FUNCTION_19_1(v69);
          OUTLINED_FUNCTION_6_4(&dword_2250AF000, v70, v71, "could not get later date to display witching hour disambiguation prompt");
          OUTLINED_FUNCTION_7_1();
        }

        sub_2250DCCB4();
        swift_release();
        OUTLINED_FUNCTION_33_2();
        v72();
        uint64_t v73 = (uint64_t)v165;
        uint64_t v74 = v68;
      }
      else
      {
        uint64_t v118 = v158;
        OUTLINED_FUNCTION_18_3();
        v119();
        type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy();
        OUTLINED_FUNCTION_32_3();
        v59();
        OUTLINED_FUNCTION_32_3();
        v59();
        id v120 = v167;
        OUTLINED_FUNCTION_27_4();
        v121();
        OUTLINED_FUNCTION_27_4();
        v122();
        sub_2250FFC1C();
        uint64_t v123 = v171;
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v124 = sub_2251070F0();
        uint64_t v125 = OUTLINED_FUNCTION_33(v124, (uint64_t)qword_2680C5BC0);
        os_log_type_t v126 = sub_225107380();
        if (os_log_type_enabled(v125, v126))
        {
          uint64_t v127 = (uint8_t *)OUTLINED_FUNCTION_6_2();
          *(_WORD *)uint64_t v127 = 0;
          _os_log_impl(&dword_2250AF000, v125, v126, "going to show disambiguation prompt for witching hour", v127, 2u);
          OUTLINED_FUNCTION_7_1();
        }

        swift_getWitnessTable();
        sub_225105FB0();
        swift_retain();
        sub_2251064F0();
        v177[0] = sub_225105FA0();
        v128 = (void *)swift_allocObject();
        os_log_type_t v129 = v168;
        uint64_t v130 = v169;
        v128[2] = v120;
        v128[3] = v130;
        v128[4] = v129;
        v128[5] = v123;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_getWitnessTable();
        uint64_t v131 = v150;
        sub_225106340();
        swift_release();
        swift_release();
        v129(v131);
        swift_release();
        swift_release();
        OUTLINED_FUNCTION_5_6();
        v132();
        uint64_t v133 = *(void (**)(void))(v118 + 8);
        OUTLINED_FUNCTION_33_2();
        v133();
        OUTLINED_FUNCTION_33_2();
        v133();
        uint64_t v73 = (uint64_t)v165;
        uint64_t v74 = v166;
      }
      goto LABEL_38;
    }
  }
  else
  {
    v164 = *(void (**)(void))(v44 + 8);
    OUTLINED_FUNCTION_9_3();
    v75();
  }
  uint64_t v76 = v170;
  uint64_t v77 = v174;
  uint64_t v78 = v175;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v79 = sub_2251070F0();
  uint64_t v171 = __swift_project_value_buffer(v79, (uint64_t)qword_2680C5BC0);
  uint64_t v80 = (void *)sub_2251070D0();
  os_log_type_t v81 = sub_225107380();
  if (OUTLINED_FUNCTION_51_1(v81))
  {
    uint64_t v82 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_62_0(v82);
    OUTLINED_FUNCTION_24_3(&dword_2250AF000, v83, v84, "not going to show disambiguation prompt for witching hours");
    uint64_t v76 = v170;
    OUTLINED_FUNCTION_7_1();
  }

  sub_2251067F0();
  uint64_t v85 = v159;
  sub_2251067E0();
  __swift_storeEnumTagSinglePayload(v85, 0, 1, v78);
  Swift::String v86 = v176;
  OUTLINED_FUNCTION_18_3();
  v87();
  uint64_t v88 = *(uint8_t **)(v77 + 16);
  ((void (*)(uint8_t *, char *, uint64_t))v88)(v76, v86, v78);
  long long v89 = sub_2251070D0();
  os_log_type_t v90 = sub_225107380();
  if (os_log_type_enabled(v89, v90))
  {
    uint64_t v91 = OUTLINED_FUNCTION_22_3();
    v170 = v88;
    uint64_t v92 = v76;
    uint64_t v76 = (uint8_t *)v91;
    v177[0] = OUTLINED_FUNCTION_21_3();
    *(_DWORD *)uint64_t v76 = 136315138;
    sub_2250DF698(&qword_2680C10E8, &qword_2680C10D8);
    uint64_t v93 = sub_2251077A0();
    uint64_t v95 = sub_2250B72A8(v93, v94, v177);
    OUTLINED_FUNCTION_47_1(v95);
    uint64_t v77 = v174;
    sub_225107420();
    swift_bridgeObjectRelease();
    uint64_t v96 = *(void (**)(void))(v77 + 8);
    uint64_t v97 = v92;
    uint64_t v88 = v170;
    ((void (*)(uint8_t *, uint64_t))v96)(v97, v175);
    _os_log_impl(&dword_2250AF000, v89, v90, "recommendation: %s", v76, 0xCu);
    swift_arrayDestroy();
    uint64_t v78 = v175;
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {
    uint64_t v96 = *(void (**)(void))(v77 + 8);
    ((void (*)(uint8_t *, uint64_t))v96)(v76, v78);
  }

  uint64_t v98 = v163;
  ((void (*)(uint64_t, char *, uint64_t))v88)(v163, v176, v78);
  int v99 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 88))(v98, v78);
  if (v99 == *MEMORY[0x263F6D398])
  {
    uint64_t v100 = OUTLINED_FUNCTION_11_3();
    v101(v100);
    uint64_t v102 = sub_2251070D0();
    os_log_type_t v103 = sub_225107380();
    if (os_log_type_enabled(v102, v103))
    {
      uint64_t v104 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v104);
      _os_log_impl(&dword_2250AF000, v102, v103, "handling confident recommendation", v76, 2u);
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250DC47C();
    swift_release();
    goto LABEL_37;
  }
  int v105 = v99;
  if (v99 == *MEMORY[0x263F6D380])
  {
    uint64_t v106 = OUTLINED_FUNCTION_11_3();
    v107(v106);
    swift_release();
    uint64_t v108 = (void *)sub_2251070D0();
    os_log_type_t v109 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v109))
    {
      uint64_t v110 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v110);
      uint64_t v113 = "got .needsConfirmation recommendation, returning to the next flow without performing any inference";
LABEL_35:
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v111, v112, v113);
      OUTLINED_FUNCTION_7_1();
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  if (v99 == *MEMORY[0x263F6D388])
  {
    uint64_t v114 = OUTLINED_FUNCTION_11_3();
    v115(v114);
    swift_bridgeObjectRelease();
    uint64_t v108 = (void *)sub_2251070D0();
    os_log_type_t v116 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v116))
    {
      uint64_t v117 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v117);
      uint64_t v113 = "got .needsDisambiguation recommendation, returning to the next flow without performing any inference";
      goto LABEL_35;
    }
LABEL_36:

    sub_2250DCCB4();
LABEL_37:
    swift_release();
    ((void (*)(char *, uint64_t))v96)(v176, v78);
    OUTLINED_FUNCTION_5_6();
    v137();
    uint64_t v73 = OUTLINED_FUNCTION_51_2();
LABEL_38:
    ((void (*)(uint64_t, uint64_t))v164)(v73, v74);
    goto LABEL_39;
  }
  int v134 = *MEMORY[0x263F6D390];
  uint64_t v108 = (void *)sub_2251070D0();
  if (v105 == v134)
  {
    os_log_type_t v135 = sub_225107390();
    if (OUTLINED_FUNCTION_22_2(v135))
    {
      uint64_t v136 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v136);
      uint64_t v113 = "got .none recommendation, returning to the next flow without performing any inference";
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  os_log_type_t v138 = sub_225107380();
  if (OUTLINED_FUNCTION_22_2(v138))
  {
    uint64_t v139 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v139);
    OUTLINED_FUNCTION_6_4(&dword_2250AF000, v140, v141, "unknown recommendation, returning to the next flow without performing any inference");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250DCCB4();
  swift_release();
  OUTLINED_FUNCTION_9_3();
  v96();
  OUTLINED_FUNCTION_5_6();
  v142();
  uint64_t v143 = OUTLINED_FUNCTION_51_2();
  ((void (*)(uint64_t))v164)(v143);
  OUTLINED_FUNCTION_9_3();
  v96();
LABEL_39:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250DE41C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v43 = a5;
  uint64_t v44 = a3;
  uint64_t v45 = a2;
  uint64_t v7 = sub_225106380();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v40 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10F8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - v14;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2251070F0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2680C5BC0);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v47 = a1;
  v46(v15, a1, v9);
  uint64_t v39 = v17;
  uint64_t v18 = sub_2251070D0();
  os_log_type_t v19 = sub_225107380();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v38 = a4;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v49 = v37;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v36 = v21 + 4;
    sub_2250DF698(&qword_2680C1100, &qword_2680C10F8);
    uint64_t v22 = sub_2251077A0();
    uint64_t v48 = sub_2250B72A8(v22, v23, &v49);
    sub_225107420();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v15, v9);
    _os_log_impl(&dword_2250AF000, v18, v19, "result: %s", v21, 0xCu);
    uint64_t v25 = v37;
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v25, -1, -1);
    uint64_t v26 = v21;
    a4 = v38;
    MEMORY[0x22A62D170](v26, -1, -1);
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v15, v9);
  }

  v46((char *)v13, v47, v9);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v10 + 88))(v13, v9) == *MEMORY[0x263F6FA10])
  {
    (*(void (**)(uint64_t *, uint64_t))(v10 + 96))(v13, v9);
    uint64_t v27 = *v13;
    swift_retain_n();
    uint64_t v28 = sub_2251070D0();
    os_log_type_t v29 = sub_225107380();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v48 = v27;
      uint64_t v49 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      sub_225106A90();
      sub_2250DF5AC(qword_2680C0FA0, MEMORY[0x263F6D778]);
      uint64_t v32 = sub_2251077A0();
      uint64_t v48 = sub_2250B72A8(v32, v33, &v49);
      sub_225107420();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2250AF000, v28, v29, "picked date: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v31, -1, -1);
      MEMORY[0x22A62D170](v30, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    swift_retain();
    swift_retain();
    sub_2250DAB70();
    return swift_release();
  }
  else
  {
    uint64_t v34 = v40;
    sub_225106370();
    a4(v34);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v42);
    return ((uint64_t (*)(uint64_t *, uint64_t))v24)(v13, v9);
  }
}

uint64_t *DateTimeResolverFlow.deinit()
{
  uint64_t v1 = *v0;
  swift_release();
  OUTLINED_FUNCTION_52_2();
  sub_225105F00();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v2();
  OUTLINED_FUNCTION_52_2();
  sub_225105F50();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v3();
  OUTLINED_FUNCTION_52_2();
  sub_225105F40();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v4();
  OUTLINED_FUNCTION_52_2();
  sub_225105E90();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v5();
  sub_2251068A0();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v6();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 144));
  sub_2250DEF8C(*(uint64_t *)((char *)v0 + *(void *)(*v0 + 152)), *(uint64_t *)((char *)v0 + *(void *)(*v0 + 152) + 8));
  OUTLINED_FUNCTION_45_2();
  sub_2250DF5F4((uint64_t)v0 + *(void *)(v7 + 160), &qword_2680C0F88);
  OUTLINED_FUNCTION_45_2();
  swift_release();
  return v0;
}

uint64_t DateTimeResolverFlow.__deallocating_deinit()
{
  DateTimeResolverFlow.deinit();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_2250DEBD8()
{
  return 1;
}

uint64_t sub_2250DEC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2250DECB0;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_2250DECB0(uint64_t a1)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void sub_2250DED88()
{
}

uint64_t sub_2250DEDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2250DEE60;
  return MEMORY[0x270F66CD0](a1, a2, a3);
}

uint64_t sub_2250DEE60()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2250DEF30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DateTimeResolverFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t type metadata accessor for DateTimeResolverFlow.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2250DEF8C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    if (a2 >> 62 != 1) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

void sub_2250DEFDC()
{
  sub_225105F00();
  if (v0 <= 0x3F)
  {
    sub_225105F50();
    if (v1 <= 0x3F)
    {
      sub_225105F40();
      if (v2 <= 0x3F)
      {
        sub_225105E90();
        if (v3 <= 0x3F)
        {
          sub_2251068A0();
          if (v4 <= 0x3F)
          {
            swift_checkMetadataState();
            if (v5 <= 0x3F)
            {
              sub_2250DF290();
              if (v6 <= 0x3F) {
                swift_initClassMetadata2();
              }
            }
          }
        }
      }
    }
  }
}

uint64_t type metadata accessor for DateTimeResolverFlow()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DateTimeResolverFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DateTimeResolverFlow);
}

uint64_t dispatch thunk of DateTimeResolverFlow.__allocating_init(nextFlow:resolutionStrategy:spec:locale:timeZone:calendar:currentDate:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of DateTimeResolverFlow.on(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of DateTimeResolverFlow.execute(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

void sub_2250DF290()
{
  if (!qword_2680C1038[0])
  {
    sub_225106670();
    unint64_t v0 = sub_2251073F0();
    if (!v1) {
      atomic_store(v0, qword_2680C1038);
    }
  }
}

uint64_t sub_2250DF2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t *sub_2250DF2F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_2250DF330(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_2250DF330(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    if (a2 >> 62 != 1) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2250DF37C(uint64_t a1)
{
  return sub_2250DEF8C(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *sub_2250DF388(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_2250DF330(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_2250DEF8C(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *sub_2250DF3DC(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2250DEF8C(v3, v4);
  return a1;
}

uint64_t sub_2250DF418(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3FFE && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 16381;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 50) >> 12) | (4
                                                               * ((*(void *)(a1 + 8) >> 50) & 0xC00 | ((*(void *)(a1 + 8) & 7) << 7) | (*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7))) ^ 0x3FFF;
      if (v2 >= 0x3FFD) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_2250DF488(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFD)
  {
    *(void *)__n128 result = a2 - 16382;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      unint64_t v3 = (-a2 >> 2) & 0xFFF | ((-a2 & 0x3FFF) << 12);
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 8) = ((v3 >> 7) | (v3 << 50)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2250DF4F4(void *a1)
{
  uint64_t v1 = a1[1] >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

uint64_t sub_2250DF510(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_2250DF520(uint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    uint64_t v3 = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    uint64_t v3 = 0x8000000000000000;
  }
  *__n128 result = v2;
  result[1] = v3;
  return result;
}

uint64_t sub_2250DF54C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocationService();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2250DF5AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2250DF5F4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v3();
  return a1;
}

uint64_t sub_2250DF644()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2250DF68C(uint64_t a1)
{
  return sub_2250DE41C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2250DF698(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2250DF6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2250DF744(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void OUTLINED_FUNCTION_6_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_24_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_225106350();
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_225106630();
}

uint64_t OUTLINED_FUNCTION_34_2(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_225107420();
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return sub_225107420();
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_1(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_48_1(uint64_t a1, unint64_t a2)
{
  return sub_2250B72A8(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_50_2(float a1)
{
  *uint64_t v1 = a1;
  return sub_2250DAB28();
}

uint64_t OUTLINED_FUNCTION_51_2()
{
  return *(void *)(v0 - 240);
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return swift_release_n();
}

uint64_t sub_2250DFAC8()
{
  sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v1;
  uint64_t v43 = v0;
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_2();
  uint64_t v41 = v3 - v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v40 = (uint64_t)&v37 - v7;
  sub_225106B50();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v9;
  uint64_t v39 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v12 = v11 - v10;
  uint64_t v37 = sub_225106B70();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  uint64_t v18 = v17 - v16;
  sub_225107080();
  swift_allocObject();
  sub_225107070();
  OUTLINED_FUNCTION_0_4();
  char v19 = sub_225106240();
  OUTLINED_FUNCTION_4_8(v19);
  sub_225106FE0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  char v20 = sub_225106210();
  OUTLINED_FUNCTION_3_7(v20);
  sub_225106FA0();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_4();
  char v21 = sub_225106200();
  OUTLINED_FUNCTION_4_8(v21);
  sub_225107060();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  char v22 = sub_225106230();
  OUTLINED_FUNCTION_3_7(v22);
  sub_225106FD0();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_4();
  char v23 = sub_2251061A0();
  OUTLINED_FUNCTION_4_8(v23);
  sub_225106FB0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  char v24 = sub_225106220();
  OUTLINED_FUNCTION_3_7(v24);
  sub_225106FC0();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_4();
  char v25 = sub_2251061E0();
  OUTLINED_FUNCTION_4_8(v25);
  sub_225107030();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  char v26 = sub_2251061D0();
  OUTLINED_FUNCTION_3_7(v26);
  sub_225107020();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_4();
  char v27 = sub_225106170();
  OUTLINED_FUNCTION_4_8(v27);
  sub_225106FF0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  char v28 = sub_2251061F0();
  OUTLINED_FUNCTION_3_7(v28);
  sub_225107040();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_4();
  sub_2251061B0();
  sub_225106B60();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v37);
  sub_225107010();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_0_4();
  sub_225106190();
  sub_225106B40();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v12, v39);
  sub_225107000();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v29 = sub_225106F50();
  uint64_t v30 = v40;
  __swift_storeEnumTagSinglePayload(v40, 1, 1, v29);
  sub_225106F60();
  swift_release();
  sub_2250DFF9C(v30);
  sub_225106250();
  sub_225106F70();
  swift_bridgeObjectRelease();
  swift_release();
  sub_225106250();
  sub_225106F90();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v31 = v41;
  OUTLINED_FUNCTION_0_4();
  sub_225106180();
  sub_225105EE0();
  uint64_t v33 = v32;
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v31, v43);
  if (v33)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = v44;
    sub_225106F20();
    __swift_storeEnumTagSinglePayload(v34, 0, 1, v29);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = v44;
    __swift_storeEnumTagSinglePayload(v44, 1, 1, v29);
  }
  sub_225106F80();
  swift_release();
  sub_2250DFF9C(v34);
  uint64_t v35 = sub_225107050();
  swift_release();
  return v35;
}

uint64_t sub_2250DFF9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_7(char a1)
{
  return a1 & 1;
}

uint64_t OUTLINED_FUNCTION_4_8(char a1)
{
  return a1 & 1;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_release();
}

uint64_t dispatch thunk of EntityResolutionStrategy.shouldResolve(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.extractEntity(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.extractConfirmationStatus(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.chooseEntity(fromEntitiesToDisambiguate:nlIntent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.getCommandUtterance(for:disambiguationListIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.getCommandUtterance(for:confirmationStatus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.makeNLContextUpdate(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of EntityResolutionStrategy.setResolvedEntity(on:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t sub_2250E00F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v14 = objc_allocWithZone(NSNumber);
  id v15 = a1;
  objc_msgSend(v14, sel_initWithBool_, a5 & 1);
  sub_225106640();
  type metadata accessor for ShowContactViewBuilder();
  uint64_t inited = swift_initStackObject();
  OUTLINED_FUNCTION_5_8(inited, v17, v18, v19, v20, v21, v22, v23, v35, v37, *((uint64_t *)&v37 + 1), v38, v39, v40, v41, v42, v43, v44, v45,
    v46,
    v47,
    v48,
    v49,
    v50);
  sub_2250BAB54(a4, (uint64_t)&v37);
  char v24 = (void *)swift_allocObject();
  v24[2] = a6;
  v24[3] = a7;
  v24[4] = v13;
  OUTLINED_FUNCTION_10_4((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31, v36, v37);
  v24[13] = v15;
  id v32 = v15;
  swift_retain();
  id v33 = v13;
  swift_bridgeObjectRetain();
  sub_2250E1EAC(MEMORY[0x263F8EE78], (void (*)(void, void))sub_2250E3138, (uint64_t)v24);
  swift_release();

  return swift_release();
}

uint64_t sub_2250E0264(uint64_t a1, char a2, void (*a3)(void *), uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v44 = a7;
  int v43 = a6;
  uint64_t v47 = a3;
  uint64_t v14 = sub_2251070C0();
  uint64_t v45 = *(void *)(v14 - 8);
  uint64_t v46 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2251064A0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v49[0] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F30);
    swift_willThrowTypedImpl();
    sub_2250E2C24();
    uint64_t v32 = swift_allocError();
    *id v33 = 0x4E73736572646461;
    v33[1] = 0xEF646E756F46746FLL;
    v49[0] = v32;
    char v50 = 1;
    v47(v49);
    uint64_t v34 = (uint64_t *)&unk_2680C11E0;
  }
  else
  {
    uint64_t v40 = v16;
    uint64_t v41 = a5;
    uint64_t v42 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510C2C0;
    *(void *)(inited + 32) = 1699574633;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v23 = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = v43 & 1;
    *(void *)(inited + 72) = v23;
    strcpy((char *)(inited + 80), "addressLabel");
    uint64_t v24 = MEMORY[0x263F8D310];
    *(unsigned char *)(inited + 93) = 0;
    *(_WORD *)(inited + 94) = -5120;
    *(void *)(inited + 96) = v44;
    *(void *)(inited + 104) = a8;
    *(void *)(inited + 120) = v24;
    *(void *)(inited + 128) = 0x7453656369766564;
    *(void *)(inited + 136) = 0xEB00000000657461;
    __swift_project_boxed_opaque_existential_1(a9, a9[3]);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2250DFAC8();
    uint64_t v26 = sub_225107090();
    *(void *)(inited + 144) = v25;
    *(void *)(inited + 168) = v26;
    *(void *)(inited + 176) = 0x746361746E6F63;
    *(void *)(inited + 184) = 0xE700000000000000;
    __swift_project_boxed_opaque_existential_1(a9, a9[3]);
    sub_225106490();
    LOBYTE(v25) = sub_2251061C0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v28 = v45;
    uint64_t v27 = v46;
    uint64_t v29 = (void (*)(void))v47;
    if (v25)
    {
      uint64_t v30 = sub_2250B691C();
      uint64_t v31 = sub_225106DE0();
    }
    else
    {
      *(void *)(inited + 200) = 0xE400000000000000;
      uint64_t v31 = MEMORY[0x263F8D310];
      uint64_t v30 = 1952540788;
    }
    *(void *)(inited + 216) = v31;
    *(void *)(inited + 192) = v30;
    sub_225106EC0();
    sub_225107170();
    memset(v49, 0, sizeof(v49));
    sub_2250BAB54((uint64_t)a9, (uint64_t)v48);
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v29;
    *(void *)(v35 + 24) = v42;
    sub_2250BFD9C(v48, v35 + 32);
    sub_225106E90();
    swift_retain();
    uint64_t v36 = (void *)sub_225106E80();
    long long v37 = v40;
    sub_2251070B0();
    sub_225106EA0();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(char *, uint64_t))(v28 + 8))(v37, v27);
    uint64_t v34 = &qword_2680C0D20;
  }
  return sub_2250D12E8((uint64_t)v49, v34);
}

void sub_2250E070C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_225106430();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2();
  uint64_t v15 = (void *)(v14 - v13);
  sub_2250E2CC8(v0, v14 - v13);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *(void *)uint64_t v4 = *v15;
  }
  else
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v11, v15, v5);
    v2(v11);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  }
  *(unsigned char *)(v4 + 40) = EnumCaseMultiPayload == 1;
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250E0858(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v14 = objc_allocWithZone(NSNumber);
  id v15 = a1;
  objc_msgSend(v14, sel_initWithBool_, a5 & 1);
  sub_225106640();
  type metadata accessor for ShowContactViewBuilder();
  uint64_t inited = swift_initStackObject();
  OUTLINED_FUNCTION_5_8(inited, v17, v18, v19, v20, v21, v22, v23, v34, v36, *((uint64_t *)&v36 + 1), v37, v38, v39, v40, v41, v42, v43, v44,
    v45,
    v46,
    v47,
    v48,
    v49);
  sub_2250BAB54(a4, (uint64_t)&v36);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = a6;
  v24[3] = a7;
  v24[4] = v13;
  OUTLINED_FUNCTION_10_4((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31, v35, v36);
  swift_retain();
  id v32 = v13;
  swift_bridgeObjectRetain();
  sub_2250E1EAC(MEMORY[0x263F8EE78], (void (*)(void, void))sub_2250E307C, (uint64_t)v24);
  swift_release();

  return swift_release();
}

uint64_t sub_2250E09C0(uint64_t a1, char a2, void (*a3)(void *), uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v35 = a5;
  uint64_t v16 = sub_2251070C0();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v37[0] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F30);
    swift_willThrowTypedImpl();
    sub_2250E2C24();
    uint64_t v29 = swift_allocError();
    *uint64_t v30 = 0xD000000000000013;
    v30[1] = 0x80000002251090C0;
    v37[0] = v29;
    char v38 = 1;
    a3(v37);
    uint64_t v28 = (uint64_t *)&unk_2680C11E0;
  }
  else
  {
    uint64_t v33 = v18;
    uint64_t v34 = v17;
    v32[1] = sub_225106EC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510C660;
    *(void *)(inited + 32) = 1699574633;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v22 = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = a6 & 1;
    *(void *)(inited + 72) = v22;
    strcpy((char *)(inited + 80), "addressLabel");
    uint64_t v23 = MEMORY[0x263F8D310];
    *(unsigned char *)(inited + 93) = 0;
    *(_WORD *)(inited + 94) = -5120;
    *(void *)(inited + 96) = a7;
    *(void *)(inited + 104) = a8;
    *(void *)(inited + 120) = v23;
    *(void *)(inited + 128) = 0x7453656369766564;
    *(void *)(inited + 136) = 0xEB00000000657461;
    __swift_project_boxed_opaque_existential_1(a9, a9[3]);
    uint64_t v24 = a4;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2250DFAC8();
    *(void *)(inited + 168) = sub_225107090();
    *(void *)(inited + 144) = v25;
    sub_225107170();
    memset(v37, 0, sizeof(v37));
    sub_2250BAB54((uint64_t)a9, (uint64_t)v36);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = a3;
    *(void *)(v26 + 24) = v24;
    sub_2250BFD9C(v36, v26 + 32);
    sub_225106E90();
    swift_retain();
    uint64_t v27 = (void *)sub_225106E80();
    sub_2251070B0();
    sub_225106EA0();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    uint64_t v28 = &qword_2680C0D20;
  }
  return sub_2250D12E8((uint64_t)v37, v28);
}

uint64_t sub_2250E0D30(uint64_t a1, void (*a2)(unsigned char *))
{
  sub_2250E070C();
  a2(v4);
  return sub_2250D12E8((uint64_t)v4, (uint64_t *)&unk_2680C11E0);
}

void sub_2250E0D9C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1118);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_2251061E0();
  uint64_t v8 = sub_225106390();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  uint64_t v9 = sub_225106650();
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  uint64_t v10 = MEMORY[0x263F6FFF0];
  v3[3] = v9;
  v3[4] = v10;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_225106330();
  sub_2250D12E8((uint64_t)v11, &qword_2680C1220);
  sub_2250D12E8(v7, &qword_2680C1118);
  OUTLINED_FUNCTION_5_4();
}

void sub_2250E0EE0()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v21 = v2;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v22 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225106EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v17 = OUTLINED_FUNCTION_2_5(inited, (__n128)xmmword_22510BA10);
  v17[4].n128_u64[1] = MEMORY[0x263F8D310];
  v17[3].n128_u64[0] = v8;
  v17[3].n128_u64[1] = v6;
  swift_bridgeObjectRetain();
  sub_225107170();
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  sub_2250BAB54(v4, (uint64_t)v23);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v21;
  *(void *)(v18 + 24) = v1;
  sub_2250BFD9C(v23, v18 + 32);
  sub_225106E90();
  swift_retain();
  uint64_t v19 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v22);
  sub_2250D12E8((uint64_t)v24, &qword_2680C0D20);
  OUTLINED_FUNCTION_5_4();
}

void sub_2250E111C()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v23 = v2;
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v25 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v22[1] = sub_225106EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v16 = OUTLINED_FUNCTION_2_5(inited, (__n128)xmmword_22510C7A0);
  unint64_t v17 = MEMORY[0x263F8D310];
  v16[3].n128_u64[0] = v8;
  v16[3].n128_u64[1] = v6;
  v16[4].n128_u64[1] = v17;
  v16[5].n128_u64[0] = 0x7453656369766564;
  v16[5].n128_u64[1] = v18 + 1792;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_2250DFAC8();
  inited[7].n128_u64[1] = sub_225107090();
  inited[6].n128_u64[0] = v19;
  sub_225107170();
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  sub_2250BAB54((uint64_t)v4, (uint64_t)v26);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v23;
  *(void *)(v20 + 24) = v1;
  sub_2250BFD9C(v26, v20 + 32);
  sub_225106E90();
  swift_retain();
  uint64_t v21 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  sub_2250D12E8((uint64_t)v27, &qword_2680C0D20);
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250E13C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2250BAB54(a1, (uint64_t)v12);
  type metadata accessor for MissingMeCardViewBuilder();
  uint64_t v8 = swift_allocObject();
  sub_2250BFD9C(v12, v8 + 16);
  *(void *)(v8 + 80) = &type metadata for InstalledAppsProvider;
  *(void *)(v8 + 88) = &off_26D87B7F0;
  sub_2250BAB54(a1, (uint64_t)v12);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = v7;
  sub_2250BFD9C(v12, (uint64_t)(v9 + 5));
  swift_retain();
  id v10 = v7;
  sub_2250E240C(MEMORY[0x263F8EE78], (void (*)(void, void))sub_2250E1E98, (uint64_t)v9);
  swift_release();

  return swift_release();
}

uint64_t sub_2250E1500(uint64_t a1, char a2, void (*a3)(_OWORD *), uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12 = sub_2251070C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *(void *)&v26[0] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F30);
    swift_willThrowTypedImpl();
    sub_2250E2C24();
    uint64_t v21 = swift_allocError();
    *uint64_t v22 = 0xD000000000000013;
    v22[1] = 0x8000000225108FE0;
    *(void *)&v26[0] = v21;
    char v28 = 1;
    a3(v26);
    uint64_t v20 = (uint64_t *)&unk_2680C11E0;
  }
  else
  {
    sub_225106EC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22510BA10;
    *(void *)(inited + 32) = 1699574633;
    *(void *)(inited + 40) = 0xE400000000000000;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = 1;
    sub_225107170();
    uint64_t v27 = 0;
    memset(v26, 0, sizeof(v26));
    sub_2250BAB54(a6, (uint64_t)v25);
    unint64_t v17 = (void *)swift_allocObject();
    v17[2] = a5;
    sub_2250BFD9C(v25, (uint64_t)(v17 + 3));
    v17[8] = a3;
    v17[9] = a4;
    sub_225106E90();
    id v18 = a5;
    swift_retain();
    uint64_t v19 = (void *)sub_225106E80();
    sub_2251070B0();
    sub_225106EA0();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v20 = &qword_2680C0D20;
  }
  return sub_2250D12E8((uint64_t)v26, v20);
}

uint64_t sub_2250E17C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a2;
  v22[0] = a1;
  uint64_t v25 = sub_2251070C0();
  uint64_t v7 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = sub_225106EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510BA10;
  *(void *)(inited + 32) = 0x656369766564;
  *(void *)(inited + 40) = 0xE600000000000000;
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v15 = sub_2250DFAC8();
  *(void *)(inited + 72) = sub_225107090();
  *(void *)(inited + 48) = v15;
  sub_225107170();
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  sub_2250E2CC8(v22[0], (uint64_t)v13);
  sub_2250BAB54((uint64_t)a3, (uint64_t)v26);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v17 = (v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  sub_2250E2E58((uint64_t)v13, v18 + v16);
  uint64_t v19 = (void *)(v18 + v17);
  void *v19 = v23;
  v19[1] = a5;
  sub_2250BFD9C(v26, v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8));
  sub_225106E90();
  swift_retain();
  uint64_t v20 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();
  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  return sub_2250D12E8((uint64_t)v27, &qword_2680C0D20);
}

uint64_t sub_2250E1B00(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1110);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_2251064E0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v14);
  sub_2250E1C7C(a1, (uint64_t)v10, v13);
  sub_2250D12E8((uint64_t)v10, &qword_2680C1110);
  uint64_t v17 = a5;
  sub_2250E070C();
  a3(v18);
  sub_2250D12E8((uint64_t)v18, (uint64_t *)&unk_2680C11E0);
  return sub_2250D12E8((uint64_t)v13, (uint64_t *)&unk_2680C1200);
}

uint64_t sub_2250E1C7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_225106430();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250E2CC8(v4, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a3 = *v14;
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_2250E29E0((uint64_t)v11, a1, a2, (uint64_t)a3);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_2250E1E1C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for GenericViews()
{
  return self;
}

uint64_t sub_2250E1E50()
{
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2250E1E98(uint64_t a1, char a2)
{
  return sub_2250E1500(a1, a2 & 1, *(void (**)(_OWORD *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), v2 + 40);
}

uint64_t sub_2250E1EAC(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v4 = v3;
  swift_retain_n();
  uint64_t v7 = v3 + 32;
  sub_2250BAB54(v3 + 32, (uint64_t)v33);
  __swift_project_boxed_opaque_existential_1(v33, v34);
  swift_retain_n();
  char v8 = sub_225106210();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  if (v8)
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2251070F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_2680C5BC0);
    uint64_t v10 = sub_2251070D0();
    os_log_type_t v11 = sub_225107370();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2250AF000, v10, v11, "[IdiomSensitiveViewBuilder] Building views for Watch", v12, 2u);
      MEMORY[0x22A62D170](v12, -1, -1);
    }

    swift_retain();
    sub_225105914(v4, a2, a3);
  }
  else
  {
    sub_2250BAB54(v7, (uint64_t)v33);
    __swift_project_boxed_opaque_existential_1(v33, v34);
    char v13 = sub_225106200();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    if (v13)
    {
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_2251070F0();
      __swift_project_value_buffer(v14, (uint64_t)qword_2680C5BC0);
      uint64_t v15 = sub_2251070D0();
      os_log_type_t v16 = sub_225107370();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2250AF000, v15, v16, "[IdiomSensitiveViewBuilder] Building views for Mac", v17, 2u);
        MEMORY[0x22A62D170](v17, -1, -1);
      }

      swift_retain();
      sub_225105920(v4, a2, a3);
    }
    else
    {
      sub_2250BAB54(v7, (uint64_t)v33);
      __swift_project_boxed_opaque_existential_1(v33, v34);
      char v18 = sub_2251061A0();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      if (v18)
      {
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v19 = sub_2251070F0();
        __swift_project_value_buffer(v19, (uint64_t)qword_2680C5BC0);
        uint64_t v20 = sub_2251070D0();
        os_log_type_t v21 = sub_225107370();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl(&dword_2250AF000, v20, v21, "[IdiomSensitiveViewBuilder] Building views for CarDND", v22, 2u);
          MEMORY[0x22A62D170](v22, -1, -1);
        }

        swift_retain();
        sub_225105938(v4, a2, a3);
      }
      else
      {
        sub_2250BAB54(v7, (uint64_t)v33);
        __swift_project_boxed_opaque_existential_1(v33, v34);
        char v23 = sub_225106230();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
        if (v23)
        {
          if (qword_2680C0698 != -1) {
            swift_once();
          }
          uint64_t v24 = sub_2251070F0();
          __swift_project_value_buffer(v24, (uint64_t)qword_2680C5BC0);
          uint64_t v25 = sub_2251070D0();
          os_log_type_t v26 = sub_225107370();
          if (os_log_type_enabled(v25, v26))
          {
            uint64_t v27 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v27 = 0;
            _os_log_impl(&dword_2250AF000, v25, v26, "[IdiomSensitiveViewBuilder] Building views for CarPlay", v27, 2u);
            MEMORY[0x22A62D170](v27, -1, -1);
          }

          swift_retain();
          sub_22510592C(v4, a2, a3);
        }
        else
        {
          if (qword_2680C0698 != -1) {
            swift_once();
          }
          uint64_t v28 = sub_2251070F0();
          __swift_project_value_buffer(v28, (uint64_t)qword_2680C5BC0);
          uint64_t v29 = sub_2251070D0();
          os_log_type_t v30 = sub_225107370();
          if (os_log_type_enabled(v29, v30))
          {
            uint64_t v31 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v31 = 0;
            _os_log_impl(&dword_2250AF000, v29, v30, "[IdiomSensitiveViewBuilder] Building views for IOS", v31, 2u);
            MEMORY[0x22A62D170](v31, -1, -1);
          }

          swift_retain();
          sub_225105944(v4, a2, a3);
        }
      }
    }
  }
  return swift_release_n();
}

uint64_t sub_2250E240C(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  uint64_t v8 = v3 + 16;
  sub_2250BAB54(v3 + 16, (uint64_t)v34);
  __swift_project_boxed_opaque_existential_1(v34, v35);
  swift_retain_n();
  char v9 = sub_225106210();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  if (v9)
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2251070F0();
    __swift_project_value_buffer(v10, (uint64_t)qword_2680C5BC0);
    os_log_type_t v11 = sub_2251070D0();
    os_log_type_t v12 = sub_225107370();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v13 = 0;
      _os_log_impl(&dword_2250AF000, v11, v12, "[IdiomSensitiveViewBuilder] Building views for Watch", v13, 2u);
      MEMORY[0x22A62D170](v13, -1, -1);
    }

    swift_retain();
    sub_2250F416C(v4, a2, a3);
  }
  else
  {
    sub_2250BAB54(v8, (uint64_t)v34);
    __swift_project_boxed_opaque_existential_1(v34, v35);
    char v14 = sub_225106200();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    if (v14)
    {
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_2251070F0();
      __swift_project_value_buffer(v15, (uint64_t)qword_2680C5BC0);
      os_log_type_t v16 = sub_2251070D0();
      os_log_type_t v17 = sub_225107370();
      if (os_log_type_enabled(v16, v17))
      {
        char v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v18 = 0;
        _os_log_impl(&dword_2250AF000, v16, v17, "[IdiomSensitiveViewBuilder] Building views for Mac", v18, 2u);
        MEMORY[0x22A62D170](v18, -1, -1);
      }

      sub_2250F4178((uint64_t)sub_2250E29D4, v7);
    }
    else
    {
      sub_2250BAB54(v8, (uint64_t)v34);
      __swift_project_boxed_opaque_existential_1(v34, v35);
      char v19 = sub_2251061A0();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      if (v19)
      {
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_2251070F0();
        __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BC0);
        os_log_type_t v21 = sub_2251070D0();
        os_log_type_t v22 = sub_225107370();
        if (os_log_type_enabled(v21, v22))
        {
          char v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v23 = 0;
          _os_log_impl(&dword_2250AF000, v21, v22, "[IdiomSensitiveViewBuilder] Building views for CarDND", v23, 2u);
          MEMORY[0x22A62D170](v23, -1, -1);
        }

        swift_retain();
        sub_2250F4440(v4, a2, a3);
      }
      else
      {
        sub_2250BAB54(v8, (uint64_t)v34);
        __swift_project_boxed_opaque_existential_1(v34, v35);
        char v24 = sub_225106230();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        if (v24)
        {
          if (qword_2680C0698 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_2251070F0();
          __swift_project_value_buffer(v25, (uint64_t)qword_2680C5BC0);
          os_log_type_t v26 = sub_2251070D0();
          os_log_type_t v27 = sub_225107370();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v28 = 0;
            _os_log_impl(&dword_2250AF000, v26, v27, "[IdiomSensitiveViewBuilder] Building views for CarPlay", v28, 2u);
            MEMORY[0x22A62D170](v28, -1, -1);
          }

          swift_retain();
          sub_2250F4434(v4, a2, a3);
        }
        else
        {
          if (qword_2680C0698 != -1) {
            swift_once();
          }
          uint64_t v29 = sub_2251070F0();
          __swift_project_value_buffer(v29, (uint64_t)qword_2680C5BC0);
          os_log_type_t v30 = sub_2251070D0();
          os_log_type_t v31 = sub_225107370();
          if (os_log_type_enabled(v30, v31))
          {
            id v32 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v32 = 0;
            _os_log_impl(&dword_2250AF000, v30, v31, "[IdiomSensitiveViewBuilder] Building views for IOS", v32, 2u);
            MEMORY[0x22A62D170](v32, -1, -1);
          }

          sub_2250F4560((uint64_t)sub_2250E29D4, v7);
        }
      }
    }
  }
  swift_release();
  return swift_release_n();
}

uint64_t sub_2250E299C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2250E29D4(unint64_t a1, char a2)
{
  sub_2250E33D4(a1, a2 & 1, *(void (**)(void, void))(v2 + 16));
}

void sub_2250E29E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_225106430();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (void **)((char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  os_log_type_t v17 = (void **)((char *)&v19 - v16);
  sub_2250E2CC8(a2, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *os_log_type_t v17 = *v15;
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v9 + 32))(v11, v15, v8);
    sub_225103B38((uint64_t)v11, a1, a3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  swift_storeEnumTagMultiPayload();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v18 = *v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a4, a1, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(uint64_t, void **, uint64_t))(v9 + 32))(a4, v17, v8);
    swift_storeEnumTagMultiPayload();
  }
}

unint64_t sub_2250E2C24()
{
  unint64_t result = qword_2680C1108;
  if (!qword_2680C1108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1108);
  }
  return result;
}

uint64_t sub_2250E2C70()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2250E2CB8(uint64_t a1)
{
  return sub_2250E17C8(a1, v1[2], v1 + 3, v1[8], v1[9]);
}

uint64_t sub_2250E2CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2250E2D30()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
  }
  else
  {
    sub_225106430();
    OUTLINED_FUNCTION_23_2();
    (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);
  }
  unint64_t v6 = (((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + v6);
  return MEMORY[0x270FA0238](v0, v6 + 40, v2 | 7);
}

uint64_t sub_2250E2E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2250E2EC0(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void (**)(unsigned char *))(v1 + v5);
  uint64_t v7 = *(void *)(v1 + v5 + 8);
  return sub_2250E1B00(a1, v1 + v4, v6, v7, v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
}

void sub_2250E2F70()
{
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

uint64_t sub_2250E2FF8()
{
  OUTLINED_FUNCTION_9_4();
  return sub_2250E0D30(v0, v1);
}

uint64_t sub_2250E302C()
{
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_2250E307C()
{
  OUTLINED_FUNCTION_8_5();
  return sub_2250E09C0(v1, v2, v3, v4, v5, v6, v0[6], v0[7], v0 + 8);
}

uint64_t sub_2250E30B0()
{
  OUTLINED_FUNCTION_9_4();
  return sub_2250E0D30(v0, v1);
}

uint64_t sub_2250E30E0()
{
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_2250E3138()
{
  OUTLINED_FUNCTION_8_5();
  return sub_2250E0264(v1, v2, v3, v4, v5, v6, v0[6], v0[7], v0 + 8);
}

uint64_t objectdestroy_12Tm()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2250E31B0()
{
  OUTLINED_FUNCTION_9_4();
  return sub_2250E0D30(v0, v1);
}

void sub_2250E31E0()
{
}

void *initializeBufferWithCopyOfBuffer for LocationViewsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LocationViewsError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LocationViewsError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LocationViewsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationViewsError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for LocationViewsError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for LocationViewsError()
{
  return &type metadata for LocationViewsError;
}

__n128 *OUTLINED_FUNCTION_2_5(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x4E746361746E6F63;
  result[2].n128_u64[1] = 0xEB00000000656D61;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,long long a24)
{
  return sub_2251058EC(v25, v24, &a24);
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, long long a10)
{
  *(unsigned char *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v10;
  return sub_2250BFD9C(&a10, a1 + 64);
}

void sub_2250E33D4(unint64_t a1, char a2, void (*a3)(void, void))
{
  char v5 = a2;
  unint64_t v6 = a1;
  if (a2)
  {
    id v7 = (id)a1;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_225107620();
      sub_2250E37F4((id)v6, 0);
    }
    else
    {
      uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    if (v9)
    {
      id v32 = (void *)MEMORY[0x263F8EE78];
      sub_2250CE4A0(0, v9 & ~(v9 >> 63), 0);
      if (v9 < 0)
      {
        __break(1u);
        return;
      }
      char v28 = v5;
      uint64_t v29 = a3;
      uint64_t v10 = 0;
      a3 = (void (*)(void, void))(v6 & 0xC000000000000001);
      uint64_t v8 = v32;
      while (v9 != v10)
      {
        if (a3) {
          id v11 = (id)MEMORY[0x22A62C790](v10, v6);
        }
        else {
          id v11 = *(id *)(v6 + 8 * v10 + 32);
        }
        char v12 = v11;
        uint64_t v13 = sub_2250B6C44(v11, (SEL *)&selRef_encodedClassName);
        if (v14) {
          uint64_t v15 = v13;
        }
        else {
          uint64_t v15 = 0x416E776F6E6B6E55;
        }
        if (v14) {
          unint64_t v16 = v14;
        }
        else {
          unint64_t v16 = 0xEE00776569566563;
        }
        sub_2250B6C44(v12, (SEL *)&selRef_aceId);
        sub_225107280();
        sub_225107280();
        swift_bridgeObjectRelease();
        sub_225107280();

        unint64_t v3 = v16;
        id v32 = v8;
        unint64_t v18 = v8[2];
        unint64_t v17 = v8[3];
        if (v18 >= v17 >> 1)
        {
          sub_2250CE4A0((char *)(v17 > 1), v18 + 1, 1);
          uint64_t v8 = v32;
        }
        ++v10;
        uint64_t v8[2] = v18 + 1;
        uint64_t v19 = &v8[2 * v18];
        v19[4] = v15;
        v19[5] = v3;
        unint64_t v6 = a1;
        if (v9 == v10)
        {
          a3 = v29;
          char v5 = v28;
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_22:
  unint64_t v3 = v5 & 1;
  if (qword_2680C0698 != -1) {
LABEL_28:
  }
    swift_once();
  uint64_t v20 = sub_2251070F0();
  __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BC0);
  sub_2250E37E8(v8, v3);
  sub_2250E37E8(v8, v3);
  os_log_type_t v21 = sub_2251070D0();
  os_log_type_t v22 = sub_225107370();
  if (os_log_type_enabled(v21, v22))
  {
    char v23 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v30 = a3;
    uint64_t v24 = swift_slowAlloc();
    id v32 = (void *)v24;
    *(_DWORD *)char v23 = 136315138;
    sub_2250E37E8(v8, v3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1120);
    uint64_t v25 = sub_225107220();
    sub_2250B72A8(v25, v26, (uint64_t *)&v32);
    unint64_t v6 = a1;
    sub_225107420();
    swift_bridgeObjectRelease();
    sub_2250E37F4(v8, v3);
    sub_2250E37F4(v8, v3);
    _os_log_impl(&dword_2250AF000, v21, v22, "IdiomSensitiveViewBuilder: Built views: %s", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v24;
    a3 = v30;
    MEMORY[0x22A62D170](v27, -1, -1);
    MEMORY[0x22A62D170](v23, -1, -1);
  }
  else
  {
    sub_2250E37F4(v8, v3);
    sub_2250E37F4(v8, v3);
  }

  a3(v6, v3);
  sub_2250E37F4(v8, v3);
}

id sub_2250E37E8(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_2250E37F4(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2250E3800(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_225107170();
  id v5 = objc_msgSend(a3, sel_dialogId);
  uint64_t v6 = sub_2251072F0();

  uint64_t v37 = *(void *)(v6 + 16);
  if (!v37)
  {
LABEL_22:
    swift_bridgeObjectRelease();

    return (uint64_t)v4;
  }
  sub_2250B71D8();
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  long long v36 = a3;
  while (1)
  {
    uint64_t v9 = sub_225107440();
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    uint64_t v11 = v9 + 16 * v10;
    uint64_t v12 = *(void *)(v11 + 24);
    uint64_t v38 = *(void *)(v11 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(a3, sel_print);
    uint64_t v14 = sub_2251072F0();

    if (v8 >= *(void *)(v14 + 16)) {
      break;
    }
    uint64_t v15 = *(void *)(v14 + v7 + 32);
    unint64_t v16 = *(void *)(v14 + v7 + 40);
    swift_bridgeObjectRelease();
    uint64_t v17 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0) {
      uint64_t v17 = v15 & 0xFFFFFFFFFFFFLL;
    }
    if (v17)
    {
      id v18 = objc_msgSend(a3, sel_print);
      uint64_t v19 = sub_2251072F0();

      if (v8 >= *(void *)(v19 + 16)) {
        goto LABEL_25;
      }
    }
    else
    {
      id v20 = objc_msgSend(a3, sel_captionPrint);
      uint64_t v19 = sub_2251072F0();

      if (v8 >= *(void *)(v19 + 16)) {
        goto LABEL_27;
      }
    }
    uint64_t v21 = *(void *)(v19 + v7 + 32);
    uint64_t v22 = *(void *)(v19 + v7 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v23 = sub_2250F644C(v38, v12);
    if (__OFADD__(v4[2], (v24 & 1) == 0)) {
      goto LABEL_24;
    }
    unint64_t v25 = v23;
    char v26 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1128);
    if (sub_2251075D0())
    {
      unint64_t v27 = sub_2250F644C(v38, v12);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_28;
      }
      unint64_t v25 = v27;
    }
    if (v26)
    {
      uint64_t v29 = (void *)(v4[7] + 16 * v25);
      swift_bridgeObjectRelease();
      void *v29 = v21;
      v29[1] = v22;
    }
    else
    {
      v4[(v25 >> 6) + 8] |= 1 << v25;
      os_log_type_t v30 = (uint64_t *)(v4[6] + 16 * v25);
      *os_log_type_t v30 = v38;
      v30[1] = v12;
      os_log_type_t v31 = (void *)(v4[7] + 16 * v25);
      *os_log_type_t v31 = v21;
      v31[1] = v22;
      uint64_t v32 = v4[2];
      BOOL v33 = __OFADD__(v32, 1);
      uint64_t v34 = v32 + 1;
      if (v33) {
        goto LABEL_26;
      }
      v4[2] = v34;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v36;
LABEL_21:
    ++v8;
    v7 += 16;
    if (v37 == v8) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  uint64_t result = sub_2251077E0();
  __break(1u);
  return result;
}

uint64_t Location.formattedPlaceName.getter()
{
  uint64_t v0 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v127 = v1;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v3);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  OUTLINED_FUNCTION_4_9();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1130);
  uint64_t v7 = OUTLINED_FUNCTION_9(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7_3((uint64_t)v114 - v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v13 = OUTLINED_FUNCTION_9(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7_3((uint64_t)v114 - v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1138);
  uint64_t v19 = OUTLINED_FUNCTION_9(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v20);
  uint64_t v132 = sub_225106B30();
  OUTLINED_FUNCTION_0();
  uint64_t v129 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v23);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1140);
  uint64_t v25 = OUTLINED_FUNCTION_9(v24);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  char v28 = (char *)v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  os_log_type_t v30 = (char *)v114 - v29;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1148);
  uint64_t v32 = OUTLINED_FUNCTION_9(v31);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)v114 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)v114 - v36;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1150);
  uint64_t v39 = OUTLINED_FUNCTION_9(v38);
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)v114 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(qword_2680C1158);
  uint64_t v43 = OUTLINED_FUNCTION_9(v42);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)v114 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_225106770();
  OUTLINED_FUNCTION_0();
  uint64_t v134 = v46;
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_7_3((uint64_t)v114 - v49);
  sub_225106AD0();
  uint64_t v50 = sub_225106990();
  OUTLINED_FUNCTION_5_9((uint64_t)v30, 1, v50);
  if (v56)
  {
    uint64_t v51 = &qword_2680C1140;
    uint64_t v52 = (uint64_t)v30;
LABEL_10:
    sub_2250E4AA4(v52, v51);
    __swift_storeEnumTagSinglePayload((uint64_t)v45, 1, 1, v135);
LABEL_11:
    os_log_type_t v61 = qword_2680C1158;
    uint64_t v62 = (uint64_t)v45;
LABEL_12:
    sub_2250E4AA4(v62, v61);
    return 0;
  }
  uint64_t v116 = v0;
  sub_225106980();
  OUTLINED_FUNCTION_4_9();
  uint64_t v54 = *(void (**)(char *, uint64_t))(v53 + 8);
  v54(v30, v50);
  uint64_t v55 = sub_2251066E0();
  OUTLINED_FUNCTION_5_9((uint64_t)v37, 1, v55);
  if (v56)
  {
    uint64_t v51 = &qword_2680C1148;
    uint64_t v52 = (uint64_t)v37;
    goto LABEL_10;
  }
  uint64_t v115 = v54;
  sub_2251066C0();
  OUTLINED_FUNCTION_4_9();
  uint64_t v58 = *(void (**)(char *, uint64_t))(v57 + 8);
  v114[2] = v57 + 8;
  v58(v37, v55);
  uint64_t v59 = sub_225106790();
  OUTLINED_FUNCTION_5_9((uint64_t)v41, 1, v59);
  if (v60)
  {
    uint64_t v51 = &qword_2680C1150;
    uint64_t v52 = (uint64_t)v41;
    goto LABEL_10;
  }
  v114[1] = v58;
  sub_225106780();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v65();
  uint64_t v66 = v135;
  OUTLINED_FUNCTION_5_9((uint64_t)v45, 1, v135);
  if (v67) {
    goto LABEL_11;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v134 + 32))(v133, v45, v66);
  sub_225106AD0();
  OUTLINED_FUNCTION_5_9((uint64_t)v28, 1, v50);
  if (v56)
  {
    sub_2250E4AA4((uint64_t)v28, &qword_2680C1140);
    uint64_t v68 = v132;
LABEL_21:
    uint64_t v70 = v134;
    uint64_t v71 = v131;
    __swift_storeEnumTagSinglePayload((uint64_t)v131, 1, 1, v68);
LABEL_22:
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v133, v66);
    os_log_type_t v61 = &qword_2680C1138;
    uint64_t v62 = (uint64_t)v71;
    goto LABEL_12;
  }
  sub_225106980();
  v115(v28, v50);
  OUTLINED_FUNCTION_5_9((uint64_t)v35, 1, v55);
  uint64_t v68 = v132;
  if (v69)
  {
    sub_2250E4AA4((uint64_t)v35, &qword_2680C1148);
    goto LABEL_21;
  }
  uint64_t v71 = v131;
  sub_2251066D0();
  OUTLINED_FUNCTION_5_6();
  v72();
  OUTLINED_FUNCTION_5_9((uint64_t)v71, 1, v68);
  uint64_t v70 = v134;
  if (v73) {
    goto LABEL_22;
  }
  (*(void (**)(uint64_t, void (*)(void, void), uint64_t))(v129 + 32))(v130, v71, v68);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v74 = sub_2251070F0();
  __swift_project_value_buffer(v74, (uint64_t)qword_2680C5BC0);
  uint64_t v75 = v117;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v117, v133, v66);
  uint64_t v76 = sub_2251070D0();
  os_log_type_t v77 = sub_225107380();
  BOOL v78 = os_log_type_enabled(v76, v77);
  uint64_t v79 = v128;
  if (v78)
  {
    uint64_t v80 = v75;
    os_log_type_t v81 = (uint8_t *)swift_slowAlloc();
    uint64_t v82 = swift_slowAlloc();
    *(void *)&v137[0] = v82;
    *(_DWORD *)os_log_type_t v81 = 136315138;
    uint64_t v83 = sub_225106760();
    uint64_t v136 = sub_2250B72A8(v83, v84, (uint64_t *)v137);
    sub_225107420();
    swift_bridgeObjectRelease();
    uint64_t v85 = v80;
    uint64_t v79 = v128;
    uint64_t v131 = *(void (**)(void, void))(v70 + 8);
    v131(v85, v135);
    _os_log_impl(&dword_2250AF000, v76, v77, "About to set locationName with bounded value: %s", v81, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v82, -1, -1);
    MEMORY[0x22A62D170](v81, -1, -1);
  }
  else
  {
    uint64_t v131 = *(void (**)(void, void))(v70 + 8);
    v131(v75, v66);
  }

  uint64_t v86 = v123;
  uint64_t v87 = v119;
  uint64_t v88 = v118;
  sub_225106D50();
  swift_allocObject();
  sub_225106D40();
  sub_225106B10();
  uint64_t v89 = sub_225106750();
  OUTLINED_FUNCTION_5_9(v88, 1, v89);
  uint64_t v90 = v122;
  if (v56)
  {
    sub_2250E4AA4(v88, &qword_2680C1130);
    uint64_t v92 = 1;
  }
  else
  {
    sub_225106740();
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_5_6();
    v91();
    OUTLINED_FUNCTION_9_5();
    uint64_t v92 = 0;
  }
  sub_225106F50();
  OUTLINED_FUNCTION_49_0(v87, v92);
  sub_225106CB0();
  swift_release();
  sub_2250E4AA4(v87, &qword_2680C0AB0);
  sub_225106B20();
  OUTLINED_FUNCTION_5_9(v79, 1, v89);
  if (v56)
  {
    sub_2250E4AA4(v79, &qword_2680C1130);
    uint64_t v95 = 1;
    uint64_t v94 = v120;
  }
  else
  {
    sub_225106740();
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_5_6();
    v93();
    uint64_t v94 = v120;
    OUTLINED_FUNCTION_9_5();
    uint64_t v95 = 0;
  }
  OUTLINED_FUNCTION_49_0(v94, v95);
  sub_225106CC0();
  swift_release();
  sub_2250E4AA4(v94, &qword_2680C0AB0);
  uint64_t v96 = v121;
  sub_225106B00();
  OUTLINED_FUNCTION_5_9(v96, 1, v89);
  if (v56)
  {
    sub_2250E4AA4(v96, &qword_2680C1130);
    uint64_t v98 = 1;
  }
  else
  {
    sub_225106740();
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_5_6();
    v97();
    OUTLINED_FUNCTION_9_5();
    uint64_t v98 = 0;
  }
  OUTLINED_FUNCTION_49_0(v90, v98);
  sub_225106CD0();
  swift_release();
  sub_2250E4AA4(v90, &qword_2680C0AB0);
  sub_225106AF0();
  OUTLINED_FUNCTION_5_9(v86, 1, v89);
  if (v56)
  {
    sub_2250E4AA4(v86, &qword_2680C1130);
    uint64_t v101 = 1;
    uint64_t v100 = v124;
  }
  else
  {
    sub_225106740();
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_5_6();
    v99();
    uint64_t v100 = v124;
    OUTLINED_FUNCTION_9_5();
    uint64_t v101 = 0;
  }
  OUTLINED_FUNCTION_49_0(v100, v101);
  sub_225106CA0();
  swift_release();
  sub_2250E4AA4(v100, &qword_2680C0AB0);
  sub_225106D10();
  swift_release();
  uint64_t v102 = sub_225106D30();
  swift_release();
  type metadata accessor for _BundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v104 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225106EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510C7A0;
  *(void *)(inited + 32) = 0x746361746E6F63;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v106 = sub_225106DE0();
  *(void *)(inited + 48) = v102;
  *(void *)(inited + 72) = v106;
  strcpy((char *)(inited + 80), "addressLabel");
  *(unsigned char *)(inited + 93) = 0;
  *(_WORD *)(inited + 94) = -5120;
  swift_retain();
  uint64_t v107 = v133;
  uint64_t v108 = sub_225106760();
  *(void *)(inited + 120) = MEMORY[0x263F8D310];
  *(void *)(inited + 96) = v108;
  *(void *)(inited + 104) = v109;
  sub_225107170();
  sub_225106E90();
  memset(v137, 0, sizeof(v137));
  uint64_t v138 = 0;
  uint64_t v110 = (void *)sub_225106E80();
  sub_2251070B0();
  uint64_t v111 = v126;
  sub_225106EB0();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_5_6();
  v112();
  sub_2250E4AA4((uint64_t)v137, &qword_2680C0D20);
  uint64_t v63 = sub_225107890();
  swift_release();

  sub_2250E4AA4(v111, (uint64_t *)&unk_2680C1200);
  OUTLINED_FUNCTION_5_6();
  v113();
  v131(v107, v135);
  return v63;
}

uint64_t type metadata accessor for _BundleClass()
{
  return self;
}

uint64_t sub_2250E4AA4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v3();
  return a1;
}

void OUTLINED_FUNCTION_1_6()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_7_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_225106F20();
}

uint64_t sub_2250E4B50()
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

uint64_t sub_2250E4BE4()
{
  return sub_225107860();
}

uint64_t sub_2250E4C0C()
{
  return sub_225107880();
}

uint64_t sub_2250E4C50()
{
  return 1;
}

uint64_t sub_2250E4C60()
{
  return sub_225107880();
}

uint64_t sub_2250E4C9C(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_2250E4CDC(a1);
  return v2;
}

uint64_t sub_2250E4CDC(uint64_t a1)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 32))(v1 + *(void *)(*(void *)v1 + 96), a1);
  return v1;
}

uint64_t sub_2250E4D54(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  uint64_t v68 = a3;
  char v69 = a2;
  uint64_t v66 = a1;
  uint64_t v4 = *v3;
  uint64_t v5 = sub_2251065C0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_7();
  uint64_t v65 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1228);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_4_10(v11, v58);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1230);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_225106670();
  OUTLINED_FUNCTION_0();
  os_log_type_t v61 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_4_7();
  uint64_t v64 = v18;
  uint64_t v19 = sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_2251070F0();
  uint64_t v60 = __swift_project_value_buffer(v25, (uint64_t)qword_2680C5BC0);
  uint64_t v26 = sub_2251070D0();
  os_log_type_t v27 = sub_225107380();
  if (os_log_type_enabled(v26, v27))
  {
    char v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = v15;
    uint64_t v29 = v24;
    uint64_t v30 = v7;
    uint64_t v31 = v21;
    uint64_t v32 = v5;
    uint64_t v33 = v14;
    uint64_t v34 = v19;
    uint64_t v35 = v4;
    uint64_t v36 = v28;
    *(_WORD *)char v28 = 0;
    _os_log_impl(&dword_2250AF000, v26, v27, "[LocationConfirmationStrategy::parseConfirmationResponse] called", v28, 2u);
    uint64_t v37 = v36;
    uint64_t v4 = v35;
    uint64_t v19 = v34;
    uint64_t v14 = v33;
    uint64_t v5 = v32;
    uint64_t v21 = v31;
    uint64_t v7 = v30;
    uint64_t v24 = v29;
    uint64_t v15 = v59;
    MEMORY[0x22A62D170](v37, -1, -1);
  }

  uint64_t v38 = v66;
  sub_2251065A0();
  if ((*(unsigned int (**)(char *, uint64_t))(v21 + 88))(v24, v19) == *MEMORY[0x263F6FF78])
  {
    (*(void (**)(char *, uint64_t))(v21 + 96))(v24, v19);
    __swift_instantiateConcreteTypeFromMangledName(qword_2680C1240);
    swift_release();
    uint64_t v39 = v61 + 32;
    uint64_t v40 = v64;
    (*((void (**)(uint64_t, char *, uint64_t))v61 + 4))(v64, v24, v15);
    char v41 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v4 + 88) + 32))(v40, *(void *)(v4 + 80));
    uint64_t v42 = sub_2251064C0();
    OUTLINED_FUNCTION_23_2();
    uint64_t v44 = (uint64_t (**)(uint64_t, uint64_t))(v39 - 24);
    if (v41) {
      uint64_t v45 = (unsigned int *)MEMORY[0x263F6FC98];
    }
    else {
      uint64_t v45 = (unsigned int *)MEMORY[0x263F6FC90];
    }
    uint64_t v56 = v63;
    (*(void (**)(uint64_t, void, uint64_t))(v43 + 104))(v63, *v45, v42);
    __swift_storeEnumTagSinglePayload(v56, 0, 1, v42);
    sub_225106590();
    swift_storeEnumTagMultiPayload();
    v69(v14);
    sub_2250D12E8((uint64_t)v14, &qword_2680C1230);
    return (*v44)(v40, v15);
  }
  else
  {
    uint64_t v46 = v65;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v65, v38, v5);
    uint64_t v47 = v5;
    uint64_t v48 = sub_2251070D0();
    os_log_type_t v49 = sub_225107380();
    if (os_log_type_enabled(v48, v49))
    {
      os_log_t v62 = v48;
      uint64_t v50 = swift_slowAlloc();
      uint64_t v64 = v19;
      uint64_t v51 = (uint8_t *)v50;
      uint64_t v63 = swift_slowAlloc();
      uint64_t v71 = v63;
      uint64_t v66 = v4;
      *(_DWORD *)uint64_t v51 = 136315138;
      os_log_type_t v61 = v51 + 4;
      sub_2250E6F70();
      uint64_t v52 = sub_2251077A0();
      uint64_t v70 = sub_2250B72A8(v52, v53, &v71);
      sub_225107420();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v46, v47);
      uint64_t v48 = v62;
      _os_log_impl(&dword_2250AF000, v62, v49, "received unsupported parse %s", v51, 0xCu);
      uint64_t v54 = v63;
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v54, -1, -1);
      uint64_t v55 = v51;
      uint64_t v19 = v64;
      MEMORY[0x22A62D170](v55, -1, -1);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v46, v47);
    }

    type metadata accessor for LocationConfirmationStrategy.LocationConfirmationError();
    swift_getWitnessTable();
    *uint64_t v14 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    v69(v14);
    sub_2250D12E8((uint64_t)v14, &qword_2680C1230);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v24, v19);
  }
}

uint64_t sub_2250E53C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  OUTLINED_FUNCTION_2_1();
  uint64_t v36 = v6;
  sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v8;
  uint64_t v41 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_10(v9, v34);
  uint64_t v10 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A78]), sel_init);
  uint64_t result = sub_225106AC0();
  if (result)
  {
    uint64_t v19 = (void *)result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_22510C2B0;
    sub_2250C6950(0, (unint64_t *)&unk_2680C11F0);
    id v35 = v19;
    *(void *)(v20 + 32) = sub_2251042FC(v35, MEMORY[0x263F8EE78]);
    *(void *)&v42[0] = v20;
    sub_225107300();
    uint64_t v21 = (void *)sub_2251072E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_setItems_, v21);

    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v23 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v34 = sub_225106EC0();
    uint64_t v43 = 0;
    memset(v42, 0, sizeof(v42));
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    unint64_t v24 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    unint64_t v25 = (v14 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v26 = (char *)swift_allocObject();
    uint64_t v27 = v36;
    *((void *)v26 + 2) = *(void *)(v36 + 80);
    *((void *)v26 + 3) = *(void *)(v27 + 88);
    *((void *)v26 + 4) = v23;
    *((void *)v26 + 5) = v4;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v26[v24], v16, v10);
    char v28 = &v26[v25];
    uint64_t v29 = v38;
    *(void *)char v28 = v37;
    *((void *)v28 + 1) = v29;
    *(void *)&v26[(v25 + 23) & 0xFFFFFFFFFFFFFFF8] = v17;
    id v30 = v23;
    swift_retain();
    swift_retain();
    id v31 = v17;
    sub_225107170();
    sub_225106E90();
    uint64_t v32 = (void *)sub_225106E80();
    uint64_t v33 = v39;
    sub_2251070B0();
    sub_225106EA0();

    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v33, v41);
    return sub_2250D12E8((uint64_t)v42, &qword_2680C0D20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2250E578C(uint64_t a1, void *a2, void *a3, uint64_t a4, void (*a5)(id *), uint64_t a6, void *a7)
{
  uint64_t v41 = a2;
  uint64_t v42 = a7;
  uint64_t v46 = a6;
  uint64_t v47 = a5;
  uint64_t v8 = *a3;
  uint64_t v40 = a3;
  uint64_t v38 = a4;
  uint64_t v39 = v8;
  uint64_t v45 = sub_225106AE0();
  uint64_t v9 = *(void *)(v45 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v45);
  uint64_t v44 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_225106430();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v43 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (id *)((char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250E2CC8(a1, (uint64_t)v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v48[0] = *v19;
    id v20 = v48[0];
    char v49 = 1;
    id v21 = v48[0];
    v47(v48);

    return sub_2250D12E8((uint64_t)v48, (uint64_t *)&unk_2680C11E0);
  }
  else
  {
    uint64_t v36 = *(void (**)(char *, id *, uint64_t))(v12 + 32);
    uint64_t v37 = v16;
    v36(v16, v19, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v44, v38, v45);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v43, v16, v11);
    unint64_t v23 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    unint64_t v24 = (v10 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
    uint64_t v38 = v12;
    uint64_t v26 = (v25 + v24 + 16) & ~v25;
    uint64_t v27 = (char *)swift_allocObject();
    uint64_t v28 = v39;
    uint64_t v29 = v40;
    *((void *)v27 + 2) = *(void *)(v39 + 80);
    id v30 = v41;
    *((void *)v27 + 3) = *(void *)(v28 + 88);
    *((void *)v27 + 4) = v30;
    *((void *)v27 + 5) = v29;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v27[v23], v44, v45);
    id v31 = &v27[v24];
    uint64_t v32 = v46;
    *(void *)id v31 = v47;
    *((void *)v31 + 1) = v32;
    v36(&v27[v26], (id *)v43, v11);
    uint64_t v33 = v42;
    *(void *)&v27[(v13 + v26 + 7) & 0xFFFFFFFFFFFFFFF8] = v42;
    id v34 = v30;
    swift_retain();
    swift_retain();
    id v35 = v33;
    sub_2251062D0();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v37, v11);
  }
}

uint64_t sub_2250E5B44(void *a1, uint64_t a2, char a3, uint64_t a4, void *a5, uint64_t a6, void (*a7)(_OWORD *), uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v52 = a7;
  uint64_t v53 = a8;
  uint64_t v44 = a6;
  uint64_t v50 = a4;
  id v51 = a1;
  uint64_t v47 = a2;
  uint64_t v48 = a5;
  uint64_t v46 = *a5;
  uint64_t v11 = sub_2251070C0();
  uint64_t v45 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v49 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_225106430();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = sub_225106AE0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    *(void *)&v54[0] = v51;
    char v56 = 1;
    id v36 = v51;
    v52(v54);
    id v35 = (uint64_t *)&unk_2680C11E0;
  }
  else
  {
    uint64_t v42 = a10;
    uint64_t v43 = sub_225106EC0();
    uint64_t v55 = 0;
    memset(v54, 0, sizeof(v54));
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v44, v16);
    id v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v40 = v13;
    uint64_t v41 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20(v41, a9, v13);
    uint64_t v21 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v44 = v11;
    uint64_t v22 = (v21 + 56) & ~v21;
    unint64_t v38 = (v18 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v23 = (*(unsigned __int8 *)(v14 + 80) + v38 + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    unint64_t v39 = (v15 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (char *)swift_allocObject();
    uint64_t v25 = v46;
    uint64_t v26 = v47;
    *((void *)v24 + 2) = *(void *)(v46 + 80);
    id v27 = v51;
    *((void *)v24 + 3) = *(void *)(v25 + 88);
    *((void *)v24 + 4) = v27;
    uint64_t v28 = v48;
    *((void *)v24 + 5) = v26;
    *((void *)v24 + 6) = v28;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v24[v22], v19, v16);
    uint64_t v29 = &v24[v38];
    uint64_t v30 = v53;
    *(void *)uint64_t v29 = v52;
    *((void *)v29 + 1) = v30;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v24[v23], v41, v40);
    id v31 = v42;
    *(void *)&v24[v39] = v42;
    sub_2250E6F48(v27, v26, 0);
    swift_retain();
    swift_retain();
    id v32 = v31;
    sub_225107170();
    sub_225106E90();
    uint64_t v33 = (void *)sub_225106E80();
    id v34 = v49;
    sub_2251070B0();
    sub_225106EA0();
    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v44);
    id v35 = &qword_2680C0D20;
  }
  return sub_2250D12E8((uint64_t)v54, v35);
}

uint64_t sub_2250E5FA4(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t a5, void (*a6)(id *), uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v58 = a8;
  uint64_t v56 = a5;
  uint64_t v60 = a3;
  uint64_t v59 = a2;
  uint64_t v55 = *a4;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1118);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v57 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_225106300();
  *(void *)&long long v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_225106470();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v20 = (char *)v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_225106430();
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  os_log_type_t v61 = (char *)v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (id *)((char *)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250E2CC8(a1, (uint64_t)v24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v68[0] = *v24;
    id v25 = v68[0];
    char v69 = 1;
    id v26 = v68[0];
    a6(v68);

    return sub_2250D12E8((uint64_t)v68, (uint64_t *)&unk_2680C11E0);
  }
  v51[2] = a7;
  uint64_t v52 = a6;
  (*(void (**)(char *, id *, uint64_t))(v62 + 32))(v61, v24, v63);
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F30]), sel_init);
  uint64_t v28 = (void *)sub_2251071A0();
  objc_msgSend(v27, sel_setConfirmText_, v28);

  uint64_t result = sub_225106420();
  if (*(void *)(result + 16))
  {
    uint64_t v59 = a9;
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v20, result + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), v17);
    swift_bridgeObjectRelease();
    sub_225106460();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_2251062F0();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v16, v54);
    uint64_t v30 = (void *)sub_2251071A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setDenyText_, v30);

    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
    uint64_t v31 = swift_allocObject();
    long long v53 = xmmword_22510C2B0;
    *(_OWORD *)(v31 + 16) = xmmword_22510C2B0;
    v51[1] = sub_2250C6950(0, (unint64_t *)&unk_2680C1210);
    uint64_t v33 = *(void *)(v55 + 80);
    uint64_t v32 = *(void *)(v55 + 88);
    id v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
    uint64_t v35 = v56;
    uint64_t v54 = (uint64_t)a4 + *(void *)(*a4 + 96);
    uint64_t v55 = v33;
    uint64_t v36 = v34(v56, 1, v33, v32);
    *(void *)(v31 + 32) = sub_2251056C0(v36, v37);
    v68[0] = (id)v31;
    sub_225107300();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1B20);
    unint64_t v38 = (void *)sub_2251072E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setConfirmCommands_, v38);

    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = v53;
    uint64_t v40 = v34(v35, 0, v33, v32);
    *(void *)(v39 + 32) = sub_2251056C0(v40, v41);
    v68[0] = (id)v39;
    sub_225107300();
    uint64_t v42 = (void *)sub_2251072E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setDenyCommands_, v42);

    sub_225106640();
    sub_225106640();
    __swift_project_boxed_opaque_existential_1(v66, v66[3]);
    sub_2251061E0();
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_22510C880;
    uint64_t v44 = v59;
    *(void *)(v43 + 32) = v59;
    *(void *)(v43 + 40) = v27;
    v68[0] = (id)v43;
    sub_225107300();
    uint64_t v45 = *(void (**)(void, uint64_t, uint64_t))(v32 + 64);
    id v46 = v44;
    id v47 = v27;
    uint64_t v48 = (uint64_t)v57;
    v45(MEMORY[0x263F8EE78], v55, v32);
    uint64_t v49 = sub_225106390();
    __swift_storeEnumTagSinglePayload(v48, 0, 1, v49);
    uint64_t v50 = (void *)sub_225106650();
    memset(v64, 0, sizeof(v64));
    uint64_t v65 = 0;
    v68[3] = v50;
    v68[4] = (id)MEMORY[0x263F6FFF0];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)v68);
    sub_225106310();
    swift_bridgeObjectRelease();
    sub_2250D12E8((uint64_t)v64, &qword_2680C1220);
    sub_2250D12E8(v48, &qword_2680C1118);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    char v69 = 0;
    v52(v68);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
    return sub_2250D12E8((uint64_t)v68, (uint64_t *)&unk_2680C11E0);
  }
  __break(1u);
  return result;
}

uint64_t sub_2250E67AC(void (*a1)(unsigned char *))
{
  sub_225106280();
  sub_225106270();
  v3[40] = 0;
  a1(v3);
  return sub_2250D12E8((uint64_t)v3, (uint64_t *)&unk_2680C11E0);
}

uint64_t sub_2250E6818(void *a1, void (*a2)(void *))
{
  v5[0] = a1;
  char v6 = 1;
  id v3 = a1;
  a2(v5);
  return sub_2250D12E8((uint64_t)v5, (uint64_t *)&unk_2680C11E0);
}

uint64_t sub_2250E6870()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  return v0;
}

uint64_t sub_2250E68E0()
{
  sub_2250E6870();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t type metadata accessor for LocationConfirmationStrategy()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2250E6930()
{
  return MEMORY[0x263F6FF10];
}

uint64_t sub_2250E693C()
{
  return sub_2250E4D50();
}

uint64_t sub_2250E695C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2250E698C(a1, a2, a3, a4, a5, MEMORY[0x263F6F470]);
}

uint64_t sub_2250E6974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2250E698C(a1, a2, a3, a4, a5, MEMORY[0x263F6F478]);
}

uint64_t sub_2250E698C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = type metadata accessor for LocationConfirmationStrategy();
  return a6(a1, a2, a3, v10, a5);
}

uint64_t sub_2250E6A0C()
{
  return sub_2250E67A8();
}

uint64_t sub_2250E6A24(void *a1, void (*a2)(void *))
{
  return sub_2250E6818(a1, a2);
}

uint64_t sub_2250E6A3C()
{
  uint64_t v1 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = (((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v9 + 8, v8);
}

uint64_t sub_2250E6B18(uint64_t a1)
{
  uint64_t v3 = sub_225106AE0();
  OUTLINED_FUNCTION_1_3(v3);
  OUTLINED_FUNCTION_8_6();
  uint64_t v5 = *(void **)(v1 + 32);
  uint64_t v6 = *(void **)(v1 + 40);
  uint64_t v8 = *(void (**)(id *))(v1 + v7);
  uint64_t v9 = *(void *)(v1 + v7 + 8);
  uint64_t v10 = *(void **)(v1 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_2250E578C(a1, v5, v6, v1 + v4, v8, v9, v10);
}

uint64_t sub_2250E6B9C()
{
  sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_8();

  swift_release();
  uint64_t v4 = OUTLINED_FUNCTION_6_5();
  v5(v4);
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_5_10();
  v7(v6);

  return ((uint64_t (*)(uint64_t, uint64_t))MEMORY[0x270FA0238])(v0, v1);
}

uint64_t sub_2250E6C9C(void *a1, uint64_t a2, char a3)
{
  char v6 = a3 & 1;
  uint64_t v7 = sub_225106AE0();
  OUTLINED_FUNCTION_1_3(v7);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v11 = (*(void *)(v10 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = sub_225106430();
  OUTLINED_FUNCTION_1_3(v12);
  OUTLINED_FUNCTION_8_6();
  return sub_2250E5B44(a1, a2, v6, *(void *)(v3 + 32), *(void **)(v3 + 40), v3 + v9, *(void (**)(_OWORD *))(v3 + v11), *(void *)(v3 + v11 + 8), v3 + v14, *(void **)(v3 + v13));
}

uint64_t sub_2250E6D7C()
{
  sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_8();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = OUTLINED_FUNCTION_6_5();
  v5(v4);
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_5_10();
  v7(v6);

  return ((uint64_t (*)(uint64_t, uint64_t))MEMORY[0x270FA0238])(v0, v1);
}

uint64_t sub_2250E6E7C(uint64_t a1)
{
  uint64_t v3 = sub_225106AE0();
  OUTLINED_FUNCTION_1_3(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = (*(void *)(v6 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = sub_225106430();
  OUTLINED_FUNCTION_1_3(v8);
  OUTLINED_FUNCTION_8_6();
  return sub_2250E5FA4(a1, *(void **)(v1 + 32), *(void *)(v1 + 40), *(uint64_t **)(v1 + 48), v1 + v5, *(void (**)(id *))(v1 + v7), *(void *)(v1 + v7 + 8), v1 + v9, *(void **)(v1 + v10));
}

id sub_2250E6F48(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t type metadata accessor for LocationConfirmationStrategy.LocationConfirmationError()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_2250E6F70()
{
  unint64_t result = qword_2680C1238;
  if (!qword_2680C1238)
  {
    sub_2251065C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1238);
  }
  return result;
}

uint64_t _s17SiriInferenceFlow39ContactDisambiguationSnippetPluginModelO31ContactDisambiguationCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *sub_2250E7014(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2250E70B0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250E70D8()
{
  return swift_getWitnessTable();
}

void OUTLINED_FUNCTION_4_10(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_225106430();
}

uint64_t sub_2250E7190(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    sub_2251075A0();
    unsigned int v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4;
      v4 += 2;
      id v6 = v5;
      sub_225107580();
      sub_2251075B0();
      sub_2251075C0();
      sub_225107590();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

void *sub_2250E7240(uint64_t a1)
{
  uint64_t result = (void *)sub_2250EA7AC(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_2250EA82C(&v5, (uint64_t)result, v3, 0, a1);
  }
}

void sub_2250E72D0(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a3 >> 1 == a2)
  {
    uint64_t v5 = sub_225106AE0();
    uint64_t v6 = a4;
    uint64_t v7 = 1;
  }
  else
  {
    if ((uint64_t)(a3 >> 1) <= a2)
    {
      __break(1u);
      return;
    }
    uint64_t v10 = sub_225106AE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a4, a1 + *(void *)(*(void *)(v10 - 8) + 72) * a2, v10);
    uint64_t v6 = a4;
    uint64_t v7 = 0;
    uint64_t v5 = v10;
  }
  __swift_storeEnumTagSinglePayload(v6, v7, 1, v5);
}

BOOL sub_2250E7394(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2250E73A4()
{
  return sub_225107860();
}

uint64_t sub_2250E73CC()
{
  return sub_225107880();
}

BOOL sub_2250E7414(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2250E7394(*a1, *a2);
}

uint64_t sub_2250E7420()
{
  return sub_2250E73CC();
}

uint64_t sub_2250E7428()
{
  return sub_2250E73A4();
}

uint64_t sub_2250E7430()
{
  return sub_225107880();
}

uint64_t sub_2250E7470()
{
  uint64_t v0 = swift_allocObject();
  sub_2250E74B0();
  return v0;
}

uint64_t sub_2250E74B0()
{
  OUTLINED_FUNCTION_12_3();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 32))(v0 + *(void *)(v1 + 96));
  return v0;
}

void sub_2250E7520()
{
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_2_1();
  uint64_t v47 = v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2680C1398);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_39_1();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1358);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_4_7();
  uint64_t v43 = v5;
  uint64_t v44 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_7();
  uint64_t v41 = v8;
  uint64_t v9 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_4_7();
  uint64_t v45 = v12;
  sub_225106630();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_38_1();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2251070F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_2680C5BC0);
  uint64_t v15 = sub_2251070D0();
  os_log_type_t v16 = sub_225107380();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_2250AF000, v15, v16, "[LocationDisambiguationStrategy::parseDisambiguationResult] called", v17, 2u);
    MEMORY[0x22A62D170](v17, -1, -1);
  }

  sub_2251065A0();
  uint64_t v18 = OUTLINED_FUNCTION_6_6();
  if (v19(v18) != *MEMORY[0x263F6FF78])
  {
    id v27 = sub_2251070D0();
    os_log_type_t v28 = sub_225107380();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_2250AF000, v27, v28, "received unsupported parse", v29, 2u);
      MEMORY[0x22A62D170](v29, -1, -1);
    }

    type metadata accessor for LocationDisambiguationStrategy.Error();
    swift_getWitnessTable();
    uint64_t v30 = OUTLINED_FUNCTION_27_1();
    *uint64_t v31 = 0;
    OUTLINED_FUNCTION_13_4(v30);
    uint64_t v32 = OUTLINED_FUNCTION_3_9();
    v33(v32);
    sub_2250D12E8(v0, qword_2680C1398);
    uint64_t v34 = OUTLINED_FUNCTION_6_6();
    goto LABEL_12;
  }
  uint64_t v20 = OUTLINED_FUNCTION_6_6();
  v21(v20);
  __swift_instantiateConcreteTypeFromMangledName(qword_2680C1240);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v45, v1, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1390);
  uint64_t v22 = sub_225106500();
  (*(void (**)(uint64_t, uint64_t, void, void))(*(void *)(v47 + 88) + 40))(v22, v45, *(void *)(v47 + 80), *(void *)(v47 + 88));
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v43, 1, v44) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v41, v43, v44);
    OUTLINED_FUNCTION_6_6();
    sub_2251064D0();
    swift_storeEnumTagMultiPayload();
    uint64_t v37 = OUTLINED_FUNCTION_3_9();
    v38(v37);
    sub_2250D12E8(v0, qword_2680C1398);
    uint64_t v39 = OUTLINED_FUNCTION_6_6();
    v40(v39);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    uint64_t v34 = v45;
    uint64_t v35 = v9;
LABEL_12:
    v36(v34, v35);
    goto LABEL_13;
  }
  sub_2250D12E8(v43, &qword_2680C1358);
  type metadata accessor for LocationDisambiguationStrategy.Error();
  swift_getWitnessTable();
  uint64_t v23 = OUTLINED_FUNCTION_27_1();
  *unint64_t v24 = 1;
  OUTLINED_FUNCTION_13_4(v23);
  uint64_t v25 = OUTLINED_FUNCTION_3_9();
  v26(v25);
  sub_2250D12E8(v0, qword_2680C1398);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v9);
LABEL_13:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250E7A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1390);
  uint64_t v6 = sub_225106500();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = v6;
  v7[4] = a2;
  v7[5] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2250E9944();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2250E7B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_2250E8DF4(a1, a3);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = a1;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2250E9208();
  swift_release();
  return swift_release();
}

uint64_t sub_2250E7C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6, uint64_t a7)
{
  uint64_t v45 = a7;
  uint64_t v40 = a4;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1118);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v46 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_2251064A0();
  uint64_t v41 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v13 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_225106430();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (void *)((char *)v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250E2CC8(a1, (uint64_t)v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for LocationDisambiguationStrategy.Error();
    swift_getWitnessTable();
    uint64_t v21 = swift_allocError();
    *uint64_t v22 = 0;
    v51[0] = v21;
    char v54 = 1;
    a5(v51);
    sub_2250D12E8((uint64_t)v51, (uint64_t *)&unk_2680C11E0);
    uint64_t v23 = (uint64_t *)&unk_2680C1200;
    unint64_t v24 = v20;
  }
  else
  {
    v38[1] = a6;
    (*(void (**)(char *, uint64_t *, uint64_t))(v15 + 32))(v17, v20, v14);
    sub_225106640();
    __swift_project_boxed_opaque_existential_1(v51, v52);
    char v25 = sub_225106230();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    uint64_t v39 = a5;
    v38[0] = v17;
    if (v25)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_22510C2B0;
      uint64_t v27 = sub_2251060C0();
      sub_225106640();
      __swift_project_boxed_opaque_existential_1(v51, v52);
      sub_225106490();
      char v28 = sub_2251061C0();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v42);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      uint64_t v29 = MEMORY[0x22A62B390](v27, (v28 & 1) == 0);
      swift_bridgeObjectRelease();
      *(void *)(v26 + 32) = v29;
      v51[0] = v26;
      sub_225107300();
    }
    else
    {
      sub_225106640();
      __swift_project_boxed_opaque_existential_1(v51, v52);
      char v30 = sub_225106210();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      if (v30)
      {
        sub_2251060C0();
        sub_225106640();
        __swift_project_boxed_opaque_existential_1(v51, v52);
        sub_2251061E0();
        uint64_t v31 = (void *)sub_225106150();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      }
      else
      {
        sub_2250E8398();
        uint64_t v31 = v32;
      }
      sub_225106070();
      sub_225106640();
      sub_225106030();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      sub_225106050();
      swift_release();
      sub_225106040();
      swift_release();
      sub_225106060();
      swift_release();
    }
    sub_225106640();
    sub_225106640();
    __swift_project_boxed_opaque_existential_1(v49, v49[3]);
    sub_2251061E0();
    uint64_t v33 = (uint64_t)v46;
    sub_2250E9190(v45);
    uint64_t v34 = sub_225106390();
    __swift_storeEnumTagSinglePayload(v33, 0, 1, v34);
    uint64_t v35 = sub_225106650();
    memset(v47, 0, sizeof(v47));
    uint64_t v48 = 0;
    uint64_t v52 = v35;
    uint64_t v53 = MEMORY[0x263F6FFF0];
    __swift_allocate_boxed_opaque_existential_1(v51);
    uint64_t v36 = v38[0];
    sub_225106320();
    swift_bridgeObjectRelease();
    sub_2250D12E8((uint64_t)v47, &qword_2680C1220);
    sub_2250D12E8(v33, &qword_2680C1118);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
    char v54 = 0;
    v39(v51);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v36, v14);
    uint64_t v23 = (uint64_t *)&unk_2680C11E0;
    unint64_t v24 = v51;
  }
  return sub_2250D12E8((uint64_t)v24, v23);
}

uint64_t sub_2250E82DC(void (*a1)(void *))
{
  OUTLINED_FUNCTION_12_3();
  type metadata accessor for LocationDisambiguationStrategy.Error();
  swift_getWitnessTable();
  uint64_t v2 = OUTLINED_FUNCTION_27_1();
  *uint64_t v3 = 0;
  v5[0] = v2;
  char v6 = 1;
  a1(v5);
  return sub_2250D12E8((uint64_t)v5, (uint64_t *)&unk_2680C11E0);
}

void sub_2250E8398()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = sub_225105EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_3();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_2250E8B74(v5, (uint64_t (*)(unint64_t, char *))sub_2250EA6D0);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F677D0]), sel_init);
  sub_225105EB0();
  sub_225105EA0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  uint64_t v9 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setCardId_, v9);

  sub_2250E7190(v7);
  sub_2250C6950(0, &qword_2680C1370);
  uint64_t v10 = (void *)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setCardSections_, v10);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F65000]), sel_init);
  uint64_t v12 = *(void *)(v7 + 16);
  if (v12)
  {
    sub_2251075A0();
    uint64_t v13 = 40;
    do
    {
      *(id *)(v7 + v13);
      sub_225107580();
      sub_2251075B0();
      sub_2251075C0();
      sub_225107590();
      v13 += 16;
      --v12;
    }
    while (v12);
  }
  swift_bridgeObjectRelease();
  sub_2250C6950(0, &qword_2680C1378);
  sub_225107360();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_4();
}

id sub_2250E85FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = sub_225105EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)sub_225106AC0();
  if (!v10) {
    return 0;
  }
  id v11 = v10;
  id v12 = objc_msgSend(v10, sel__geoMapItem);

  if (!v12) {
    return 0;
  }
  id v13 = objc_msgSend(v12, sel__placeDataAsData);
  if (!v13)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_225105E60();
  unint64_t v33 = v16;
  uint64_t v34 = v15;
  uint64_t v31 = a1;

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67928]), sel_init);
  uint64_t v18 = (void *)sub_225105E40();
  objc_msgSend(v17, sel_setMapsData_, v18);

  id v32 = v12;
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v5 + 88) + 48))(a2, v31, *(void *)(v5 + 80));
  uint64_t v21 = v20;
  sub_2250C6950(0, (unint64_t *)&unk_2680C1210);
  id v22 = sub_2251056C0(v19, v21);
  sub_225105EB0();
  sub_225105EA0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v23 = (void *)sub_2251071A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setAceId_, v23);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22510C2B0;
  id v25 = v22;
  id v26 = v17;
  uint64_t v27 = sub_2251062A0();

  *(void *)(v24 + 32) = v27;
  uint64_t v35 = v24;
  sub_225107300();
  sub_2250C6950(0, &qword_2680C1388);
  char v28 = (void *)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_setCommands_, v28);
  sub_2250D1388(v34, v33);

  swift_unknownObjectRelease();
  return v26;
}

uint64_t sub_2250E8948(uint64_t a1, uint64_t (*a2)(void, char *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1368);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v25 - v9;
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v33 = MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v29 = v12;
  if (v12)
  {
    long long v25[2] = v4;
    uint64_t v13 = sub_225106430();
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(v13 - 8);
    unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v27 = v15 + 16;
    char v28 = v16;
    uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
    v25[1] = a1;
    uint64_t v18 = a1 + ((v17 + 32) & ~v17);
    uint64_t v26 = *(void *)(v15 + 72);
    uint64_t v19 = (void (**)(char *, char *, uint64_t))(v15 + 32);
    do
    {
      uint64_t v20 = &v30[*(int *)(v6 + 48)];
      v28(v20, v18, v13);
      uint64_t v21 = &v10[*(int *)(v6 + 48)];
      *(void *)uint64_t v10 = v14;
      (*v19)(v21, v20, v13);
      uint64_t v22 = v31(*(void *)v10, &v10[*(int *)(v6 + 48)]);
      uint64_t v23 = sub_2250D12E8((uint64_t)v10, &qword_2680C1368);
      if (v22)
      {
        MEMORY[0x22A62C530](v23);
        if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_225107310();
        }
        sub_225107330();
        sub_225107300();
      }
      ++v14;
      v18 += v26;
    }
    while (v29 != v14);
    uint64_t v11 = v33;
  }
  swift_bridgeObjectRelease();
  return v11;
}

void sub_2250E8B74(uint64_t a1, uint64_t (*a2)(unint64_t, char *))
{
  uint64_t v27 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1380);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (unint64_t *)((char *)&v24 - v6);
  unint64_t v8 = *(void *)(a1 + 16);
  uint64_t v28 = a1;
  swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  uint64_t v25 = MEMORY[0x263F8EE78];
LABEL_2:
  unint64_t v10 = v9;
  while (1)
  {
    if (v8 == v10)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (v10 >= v8) {
      break;
    }
    uint64_t v11 = sub_225106AE0();
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v9 = v10 + 1;
    uint64_t v13 = &v26[*(int *)(v3 + 48)];
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v13, v28+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v10, v11);
    uint64_t v14 = (char *)v7 + *(int *)(v3 + 48);
    *uint64_t v7 = v10;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v13, v11);
    uint64_t v15 = v27(*v7, (char *)v7 + *(int *)(v3 + 48));
    uint64_t v17 = v16;
    sub_2250D12E8((uint64_t)v7, &qword_2680C1380);
    ++v10;
    if (v15)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225102DC0(0, *(void *)(v25 + 16) + 1, 1, v25);
        uint64_t v25 = v22;
      }
      unint64_t v19 = *(void *)(v25 + 16);
      unint64_t v18 = *(void *)(v25 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_225102DC0(v18 > 1, v19 + 1, 1, v25);
        uint64_t v25 = v23;
      }
      uint64_t v20 = v25;
      *(void *)(v25 + 16) = v19 + 1;
      uint64_t v21 = v20 + 16 * v19;
      *(void *)(v21 + 32) = v15;
      *(void *)(v21 + 40) = v17;
      goto LABEL_2;
    }
  }
  __break(1u);
}

uint64_t sub_2250E8DF4(uint64_t a1, uint64_t a2)
{
  v11[3] = a2;
  uint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = sub_2250E8948(v3, (uint64_t (*)(void, char *))sub_2250EA6C8, (uint64_t)v11);
  swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != *(void *)(a1 + 16))
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2251070F0();
    __swift_project_value_buffer(v6, (uint64_t)qword_2680C5BC0);
    uint64_t v7 = sub_2251070D0();
    os_log_type_t v8 = sub_225107390();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl(&dword_2250AF000, v7, v8, "TemplatingResult::print::first returned nil, so the list of SiriKitDisambiguationItem is incomplete", v9, 2u);
      MEMORY[0x22A62D170](v9, -1, -1);
    }
  }
  sub_2251060E0();
  swift_allocObject();
  return sub_2251060D0();
}

uint64_t sub_2250E8F84(unint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a3;
  if (*(void *)(sub_225106410() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_22510C2B0;
    sub_225106120();
    sub_2251060F0();
    swift_bridgeObjectRelease();
    sub_225106100();
    swift_release();
    uint64_t v8 = sub_225106110();
    swift_release();
    *(void *)(v7 + 32) = v8;
    uint64_t result = sub_225107300();
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a4 + 16) > a1)
    {
      uint64_t v10 = *(void *)(sub_225106AE0() - 8);
      (*(void (**)(unint64_t, unint64_t, void))(*(void *)(v6 + 88) + 48))(a4+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * a1, a1, *(void *)(v6 + 80));
      sub_2251060A0();
      swift_allocObject();
      return sub_225106090();
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_2250E9190(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)v1 + 88) + 64))(a1, *(void *)(*(void *)v1 + 80));
}

uint64_t sub_2250E9208()
{
  sub_225106640();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  OUTLINED_FUNCTION_6_6();
  sub_2251061D0();
  uint64_t v0 = sub_2251060B0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510C2C0;
  *(void *)(inited + 32) = 0x656D614E746F6C73;
  *(void *)(inited + 40) = 0xE800000000000000;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x8000000225109290;
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 80) = 0xD000000000000013;
  *(void *)(inited + 88) = 0x80000002251092B0;
  *(void *)(inited + 96) = 0;
  *(void *)(inited + 104) = 0xE000000000000000;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 128) = 0xD00000000000001CLL;
  *(void *)(inited + 136) = 0x80000002251092D0;
  unint64_t v3 = sub_2251060C0();
  if (v3 >> 62) {
    uint64_t v4 = sub_225107620();
  }
  else {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 144) = v4;
  *(void *)(inited + 168) = v5;
  *(void *)(inited + 176) = 0xD000000000000012;
  *(void *)(inited + 184) = 0x80000002251092F0;
  *(void *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1360);
  *(void *)(inited + 192) = v0;
  sub_225107170();
  sub_2250E9400();
  return swift_bridgeObjectRelease();
}

void sub_2250E9400()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v16 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225106EC0();
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v8;
  v14[3] = v6;
  v14[4] = v4;
  v14[5] = v2;
  sub_225106E90();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v15 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v16);
  sub_2250D12E8((uint64_t)v17, &qword_2680C0D20);
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250E959C(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v31 = a2;
  uint64_t v9 = sub_225106430();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void *)((char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (void **)((char *)v29 - v17);
  sub_2250E2CC8(a1, (uint64_t)v29 - v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    unint64_t v19 = *v18;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2251070F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BC0);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_2251070D0();
    os_log_type_t v22 = sub_225107390();
    if (os_log_type_enabled(v21, v22))
    {
      v29[1] = a5;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v30 = a4;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v33 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_2250B72A8(v31, a3, &v33);
      sub_225107420();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2250AF000, v21, v22, "Failed to execute cat with id: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v25, -1, -1);
      uint64_t v26 = v24;
      a4 = v30;
      MEMORY[0x22A62D170](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *uint64_t v16 = v19;
    swift_storeEnumTagMultiPayload();
    id v28 = v19;
    a4(v16);

    return sub_2250D12E8((uint64_t)v16, (uint64_t *)&unk_2680C1200);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v10 + 32))(v12, v18, v9);
    (*(void (**)(void *, char *, uint64_t))(v10 + 16))(v16, v12, v9);
    swift_storeEnumTagMultiPayload();
    a4(v16);
    sub_2250D12E8((uint64_t)v16, (uint64_t *)&unk_2680C1200);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_2250E9944()
{
  sub_225106AE0();
  swift_bridgeObjectRetain();
  sub_2250E9A00();
  return swift_bridgeObjectRelease();
}

void sub_2250E9A00()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v41 = v0;
  uint64_t v44 = v2;
  uint64_t v45 = v3;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1358);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_39_1();
  uint64_t v15 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v16;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  MEMORY[0x270FA5388](v19);
  uint64_t v42 = (char *)v37 - v20;
  uint64_t v21 = swift_allocObject();
  unint64_t v22 = v7;
  uint64_t v23 = v21;
  *(void *)(v21 + 16) = v5;
  uint64_t v24 = v7 >> 1;
  if (v24 == v9)
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v44(v5);
    swift_release();
    OUTLINED_FUNCTION_5_4();
    swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v39 = v22;
    uint64_t v40 = v5;
    v37[1] = v11;
    uint64_t v38 = v13;
    sub_2250E72D0(v11, v9, v22, v1);
    if (__swift_getEnumTagSinglePayload(v1, 1, v15) != 1)
    {
      uint64_t v26 = *(void (**)(void))(v43 + 32);
      OUTLINED_FUNCTION_11_4();
      v26();
      if (__OFADD__(v9, 1))
      {
        __break(1u);
      }
      else if (v24 >= v9 + 1)
      {
        uint64_t v27 = sub_2250FC924();
        uint64_t v29 = v28;
        uint64_t v38 = v31;
        unint64_t v39 = v30;
        OUTLINED_FUNCTION_11_4();
        v26();
        uint64_t v32 = v42;
        OUTLINED_FUNCTION_11_4();
        v26();
        uint64_t v33 = (void *)swift_allocObject();
        uint64_t v34 = v41;
        v33[2] = v23;
        void v33[3] = v34;
        v33[4] = v27;
        v33[5] = v29;
        uint64_t v35 = v38;
        v33[6] = v39;
        v33[7] = v35;
        uint64_t v36 = v45;
        v33[8] = v44;
        v33[9] = v36;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_unknownObjectRetain();
        sub_2250EA0F4();
        swift_release();
        (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v15);
        swift_release();
        swift_unknownObjectRelease();
        OUTLINED_FUNCTION_5_4();
        return;
      }
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_2250E9CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v42 = a4;
  uint64_t v43 = a9;
  uint64_t v44 = a5;
  uint64_t v12 = sub_225106430();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (void **)((char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = (uint64_t *)(a2 + 16);
  sub_2250E2CC8(a1, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = *v18;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2251070F0();
    __swift_project_value_buffer(v21, (uint64_t)qword_2680C5BC0);
    id v22 = v20;
    id v23 = v20;
    uint64_t v24 = sub_2251070D0();
    os_log_type_t v25 = sub_225107390();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v47 = (uint64_t)v20;
      v48[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v41 = v26 + 4;
      id v28 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F30);
      uint64_t v29 = sub_225107220();
      uint64_t v47 = sub_2250B72A8(v29, v30, v48);
      sub_225107420();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2250AF000, v24, v25, "LocationResolutionFlow templatingError: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v27, -1, -1);
      MEMORY[0x22A62D170](v26, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v13 + 32))(v15, v18, v12);
    swift_beginAccess();
    sub_2250EA56C();
    uint64_t v31 = *(void *)(*v19 + 16);
    sub_2250EA5B8(v31, v32, v33, v34, v35, v36, v37);
    uint64_t v38 = *v19;
    *(void *)(v38 + 16) = v31 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 16))(v38+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v31, v15, v12);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  swift_beginAccess();
  uint64_t v39 = *v19;
  swift_bridgeObjectRetain();
  sub_2250E9A00(v42, v44, v45, v46, v39, a8, v43);
  return swift_bridgeObjectRelease();
}

void sub_2250EA0F4()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_38_1();
  sub_2250EA264(0);
  uint64_t v4 = (void *)sub_225106AC0();
  if (v4)
  {
    uint64_t v5 = v4;
    sub_2250F5A80(v4);
    sub_2250E9400();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2250EA4E8();
    uint64_t v7 = OUTLINED_FUNCTION_27_1();
    *uint64_t v8 = 0;
    uint64_t *v0 = v7;
    swift_storeEnumTagMultiPayload();
    v2(v0);
    sub_2250D12E8((uint64_t)v0, (uint64_t *)&unk_2680C1200);
    OUTLINED_FUNCTION_5_4();
  }
}

unint64_t sub_2250EA264(char a1)
{
  return 0xD000000000000013;
}

unint64_t sub_2250EA2C0(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 2:
      unint64_t result = 0x54746361746E6F43;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250EA35C()
{
  OUTLINED_FUNCTION_12_3();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 8))(v0 + *(void *)(v1 + 96));
  return v0;
}

uint64_t sub_2250EA3C4()
{
  sub_2250EA35C();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t type metadata accessor for LocationDisambiguationStrategy()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2250EA414()
{
  return sub_2250E751C();
}

uint64_t sub_2250EA434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2250EA464(a1, a2, a3, a4, a5, MEMORY[0x263F6F4B0]);
}

uint64_t sub_2250EA44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2250EA464(a1, a2, a3, a4, a5, MEMORY[0x263F6F4B8]);
}

uint64_t sub_2250EA464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = type metadata accessor for LocationDisambiguationStrategy();
  return a6(a1, a2, a3, v10, a5);
}

unint64_t sub_2250EA4E8()
{
  unint64_t result = qword_2680C1350;
  if (!qword_2680C1350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1350);
  }
  return result;
}

uint64_t sub_2250EA534()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2250EA56C()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v1;
  if (!result)
  {
    uint64_t result = sub_225102EE8(0, *(void *)(v1 + 16) + 1, 1, v1, v3, v4, v5);
    uint64_t *v0 = result;
  }
  return result;
}

uint64_t sub_2250EA5B8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v8 = *(void *)(*v7 + 24);
  if (result + 1 > (uint64_t)(v8 >> 1))
  {
    uint64_t result = sub_225102EE8(v8 > 1, result + 1, 1, *v7, a5, a6, a7);
    *uint64_t v7 = result;
  }
  return result;
}

uint64_t sub_2250EA5F8()
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2250EA648(uint64_t a1)
{
  return sub_2250E9CFC(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_2250EA67C()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2250EA6BC(uint64_t a1)
{
  return sub_2250E959C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2250EA6C8(unint64_t a1, uint64_t a2)
{
  return sub_2250E8F84(a1, a2, *(uint64_t **)(v2 + 16), *(void *)(v2 + 24));
}

id sub_2250EA6D0(uint64_t a1, uint64_t a2)
{
  return sub_2250E85FC(a1, a2, v2);
}

uint64_t type metadata accessor for LocationDisambiguationStrategy.Error()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2250EA6F0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2250EA738(uint64_t a1)
{
  return sub_2250E7B5C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_2250EA744()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2250EA79C(uint64_t a1)
{
  return sub_2250E7C38(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(uint64_t *))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_2250EA7AC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *sub_2250EA82C(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    unsigned int v6 = (void *)(*(void *)(a5 + 56) + 16 * a2);
    uint64_t v7 = v6[1];
    *uint64_t result = *v6;
    result[1] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for EncodedContact.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17SiriInferenceFlow23LocationFormattingErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250EAA20);
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

unsigned char *sub_2250EAA48(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocationFormattingError()
{
  return &type metadata for LocationFormattingError;
}

unint64_t sub_2250EAA68()
{
  unint64_t result = qword_2680C1420[0];
  if (!qword_2680C1420[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2680C1420);
  }
  return result;
}

uint64_t sub_2250EAAB4()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_4(uint64_t a1)
{
  *unint64_t v1 = a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t LocationResolutionErrorFlowProvider.init(deviceState:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2250BFD9C(a1, a2);
}

uint64_t LocationResolutionErrorFlowProvider.makeFlow(forError:)(uint64_t a1)
{
  uint64_t v2 = sub_225106680();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v55[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F6D2E0])
  {
    uint64_t v7 = OUTLINED_FUNCTION_0_5();
    v8(v7);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2251070F0();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_33(v9, (uint64_t)qword_2680C5BC0);
    os_log_type_t v11 = sub_225107380();
    if (OUTLINED_FUNCTION_51_1(v11))
    {
      uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v12);
      OUTLINED_FUNCTION_24_3(&dword_2250AF000, v13, v14, "contact not found");
      OUTLINED_FUNCTION_5_11();
    }
    goto LABEL_30;
  }
  if (v6 == *MEMORY[0x263F6D2F0])
  {
    uint64_t v15 = OUTLINED_FUNCTION_0_5();
    v16(v15);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2251070F0();
    uint64_t v18 = (void *)OUTLINED_FUNCTION_33(v17, (uint64_t)qword_2680C5BC0);
    os_log_type_t v19 = sub_225107380();
    if (OUTLINED_FUNCTION_51_1(v19))
    {
      uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v20);
      OUTLINED_FUNCTION_24_3(&dword_2250AF000, v21, v22, "address not present");
      OUTLINED_FUNCTION_5_11();
    }
  }
  else
  {
    if (v6 == *MEMORY[0x263F6D2F8])
    {
      uint64_t v23 = OUTLINED_FUNCTION_0_5();
      v24(v23);
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_2251070F0();
      uint64_t v10 = (void *)OUTLINED_FUNCTION_33(v25, (uint64_t)qword_2680C5BC0);
      os_log_type_t v26 = sub_225107380();
      if (OUTLINED_FUNCTION_51_1(v26))
      {
        uint64_t v27 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_62_0(v27);
        OUTLINED_FUNCTION_24_3(&dword_2250AF000, v28, v29, "location geocode error for multiple contacts");
        OUTLINED_FUNCTION_5_11();
      }
      goto LABEL_30;
    }
    if (v6 != *MEMORY[0x263F6D2D0])
    {
      if (v6 != *MEMORY[0x263F6D2D8])
      {
        if (v6 != *MEMORY[0x263F6D2E8])
        {
          OUTLINED_FUNCTION_7_4();
          uint64_t v53 = swift_allocObject();
          long long v54 = v57;
          *(_OWORD *)(v53 + 16) = v56;
          *(_OWORD *)(v53 + 32) = v54;
          *(void *)(v53 + 48) = v58;
          sub_2251064F0();
          sub_225105F70();
          OUTLINED_FUNCTION_6_7();
          *(void *)&long long v56 = sub_225105F60();
          uint64_t v39 = sub_225105FE0();
          swift_release();
          (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
          return v39;
        }
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_2251070F0();
        uint64_t v50 = OUTLINED_FUNCTION_33(v49, (uint64_t)qword_2680C5BC0);
        os_log_type_t v51 = sub_225107380();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)OUTLINED_FUNCTION_6_2();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl(&dword_2250AF000, v50, v51, "me card not present", v52, 2u);
          MEMORY[0x22A62D170](v52, -1, -1);
        }

        sub_2251064F0();
        sub_225105F70();
        OUTLINED_FUNCTION_6_7();
        *(void *)&long long v56 = sub_225105F60();
        uint64_t v39 = sub_225105FE0();
        goto LABEL_31;
      }
      uint64_t v40 = OUTLINED_FUNCTION_0_5();
      v41(v40);
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_2251070F0();
      uint64_t v10 = (void *)OUTLINED_FUNCTION_33(v42, (uint64_t)qword_2680C5BC0);
      os_log_type_t v43 = sub_225107380();
      if (OUTLINED_FUNCTION_51_1(v43))
      {
        uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_62_0(v44);
        OUTLINED_FUNCTION_24_3(&dword_2250AF000, v45, v46, "location geocode error for multiple contacts");
        OUTLINED_FUNCTION_5_11();
      }
LABEL_30:

      OUTLINED_FUNCTION_7_4();
      uint64_t v47 = swift_allocObject();
      OUTLINED_FUNCTION_1_7(v47);
      sub_225105F70();
      OUTLINED_FUNCTION_6_7();
      *(void *)&long long v56 = sub_225105F60();
      uint64_t v39 = sub_225105FE0();
LABEL_31:
      swift_release();
      return v39;
    }
    uint64_t v30 = OUTLINED_FUNCTION_0_5();
    v31(v30);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_2251070F0();
    uint64_t v18 = (void *)OUTLINED_FUNCTION_33(v32, (uint64_t)qword_2680C5BC0);
    os_log_type_t v33 = sub_225107380();
    if (OUTLINED_FUNCTION_51_1(v33))
    {
      uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_62_0(v34);
      OUTLINED_FUNCTION_24_3(&dword_2250AF000, v35, v36, "location geocode error");
      OUTLINED_FUNCTION_5_11();
    }
  }

  OUTLINED_FUNCTION_7_4();
  uint64_t v37 = swift_allocObject();
  id v38 = OUTLINED_FUNCTION_3_10(v37);
  sub_2251064F0();
  sub_225105F70();
  OUTLINED_FUNCTION_6_7();
  *(void *)&long long v56 = sub_225105F60();
  uint64_t v39 = sub_225105FE0();
  swift_release();

  return v39;
}

uint64_t sub_2250EB2E8(uint64_t a1, uint64_t a2)
{
  type metadata accessor for GenericViews();
  swift_initStackObject();
  sub_225106640();
  sub_2250E13C4((uint64_t)v5, a1, a2);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_2250EB35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a8(a3, a4, a5, a6, a7, a1, a2);
}

uint64_t sub_2250EB3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return a6(a3, a4, a5, a1, a2);
}

uint64_t sub_2250EB474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2250EB510(a3, (uint64_t)v8);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  long long v6 = v8[1];
  *(_OWORD *)(v5 + 32) = v8[0];
  *(_OWORD *)(v5 + 48) = v6;
  *(void *)(v5 + 64) = v9;
  swift_retain();
  sub_2251062C0();
  return swift_release();
}

uint64_t sub_2250EB510(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2250EB548()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2250EB580(uint64_t a1, uint64_t a2)
{
  return sub_2250EB474(a1, a2, v2 + 16);
}

uint64_t sub_2250EB588(uint64_t a1, void (*a2)(unsigned char *))
{
  sub_2250E070C();
  a2(v4);
  return sub_2250B6BE8((uint64_t)v4, (uint64_t *)&unk_2680C11E0);
}

uint64_t sub_2250EB604@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1118);
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2251061E0();
  uint64_t v7 = sub_225106390();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = sub_225106650();
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  uint64_t v9 = MEMORY[0x263F6FFF0];
  a2[3] = v8;
  a2[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_225106330();
  sub_2250B6BE8((uint64_t)v11, &qword_2680C1220);
  return sub_2250B6BE8((uint64_t)v6, &qword_2680C1118);
}

uint64_t sub_2250EB754()
{
  return objectdestroy_2Tm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2250EB76C()
{
  return objectdestroy_2Tm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2250EB784(uint64_t a1, uint64_t a2)
{
  return sub_2250EB3F4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2250E111C);
}

uint64_t sub_2250EB7BC(uint64_t a1, uint64_t a2)
{
  return sub_2250EB838(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2250E0858);
}

uint64_t objectdestroy_8Tm()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0238](v0, 81, 7);
}

uint64_t sub_2250EB820(uint64_t a1, uint64_t a2)
{
  return sub_2250EB838(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2250E00F4);
}

uint64_t sub_2250EB838(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return sub_2250EB35C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), v3 + 40, *(unsigned __int8 *)(v3 + 80), a3);
}

uint64_t sub_2250EB864()
{
  return objectdestroy_2Tm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2250EB87C(uint64_t a1, uint64_t a2)
{
  return sub_2250EB3F4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2250E0EE0);
}

ValueMetadata *type metadata accessor for LocationResolutionErrorFlowProvider()
{
  return &type metadata for LocationResolutionErrorFlowProvider;
}

uint64_t sub_2250EB8C0()
{
  return objectdestroy_2Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_2Tm(void (*a1)(void))
{
  a1(*(void *)(v1 + 24));
  __swift_destroy_boxed_opaque_existential_1(v1 + 32);
  return MEMORY[0x270FA0238](v1, 72, 7);
}

uint64_t sub_2250EB920(uint64_t a1)
{
  return sub_2250EB588(a1, *(void (**)(unsigned char *))(v1 + 16));
}

uint64_t sub_2250EB92C@<X0>(uint64_t *a1@<X8>)
{
  return sub_2250EB604(*(void **)(v1 + 16), a1);
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = v2;
  long long v5 = *(_OWORD *)(v3 - 88);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 - 104);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(v3 - 72);
  return sub_2251064F0();
}

id OUTLINED_FUNCTION_3_10(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  long long v7 = *(_OWORD *)(v5 - 88);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v5 - 104);
  *(_OWORD *)(a1 + 56) = v7;
  *(void *)(a1 + 72) = *(void *)(v5 - 72);
  *(unsigned char *)(a1 + 80) = v2;
  return v1;
}

void OUTLINED_FUNCTION_5_11()
{
  JUMPOUT(0x22A62D170);
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_2250EB510(v0, v1 - 104);
}

uint64_t sub_2250EBA04(uint64_t a1)
{
  uint64_t v14 = sub_225106AE0();
  uint64_t v3 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = v1;
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_2250CE500();
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2680C15F0) - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    do
    {
      swift_getKeyPath();
      swift_getAtKeyPath();
      swift_release();
      uint64_t v7 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2250CE500();
        uint64_t v7 = v15;
      }
      unint64_t v11 = *(void *)(v7 + 16);
      if (v11 >= *(void *)(v7 + 24) >> 1)
      {
        sub_2250CE500();
        uint64_t v7 = v15;
      }
      *(void *)(v7 + 16) = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v11, v5, v14);
      uint64_t v15 = v7;
      v9 += v10;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_2250EBC2C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_39_4();
  uint64_t v4 = v1 + *(void *)(v3 + 104);
  swift_beginAccess();
  OUTLINED_FUNCTION_39_4();
  OUTLINED_FUNCTION_39_4();
  type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_4_9();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(a1, v4);
}

uint64_t sub_2250EBCE0(uint64_t a1)
{
  OUTLINED_FUNCTION_39_4();
  uint64_t v4 = v1 + *(void *)(v3 + 104);
  swift_beginAccess();
  OUTLINED_FUNCTION_39_4();
  OUTLINED_FUNCTION_39_4();
  type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t sub_2250EBD9C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v4 = v1 + *(void *)(v3 + 136);
  OUTLINED_FUNCTION_50_3();
  return sub_2250DF6DC(v4, a1);
}

uint64_t sub_2250EBDEC(uint64_t a1)
{
  OUTLINED_FUNCTION_45_2();
  uint64_t v4 = v1 + *(void *)(v3 + 136);
  swift_beginAccess();
  sub_2250DF744(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2250EBE50()
{
  return swift_retain();
}

uint64_t sub_2250EBE70()
{
  OUTLINED_FUNCTION_45_2();
  *(void *)(v0 + *(void *)(v1 + 144)) = v2;
  return swift_release();
}

const char *sub_2250EBE98()
{
  return "SiriInference";
}

const char *sub_2250EBEAC()
{
  return "native_flow_location_resolution";
}

uint64_t LocationResolverFlow.__allocating_init(nextFlow:resolutionStrategy:locale:timeZone:)()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_47_2();
  LocationResolverFlow.init(nextFlow:resolutionStrategy:locale:timeZone:)();
  return v0;
}

void *LocationResolverFlow.init(nextFlow:resolutionStrategy:locale:timeZone:)()
{
  OUTLINED_FUNCTION_59_1();
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 136);
  uint64_t v5 = sub_225106670();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
  OUTLINED_FUNCTION_45_2();
  *(void *)((char *)v1 + *(void *)(v6 + 144)) = 0;
  v1[2] = v3;
  OUTLINED_FUNCTION_45_2();
  sub_225106AE0();
  uint64_t v7 = OUTLINED_FUNCTION_58_2();
  __swift_storeEnumTagSinglePayload(v7, v8, 3, v9);
  OUTLINED_FUNCTION_45_2();
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(void))(v10 + 32))();
  unint64_t v11 = (char *)v1 + *(void *)(*v1 + 112);
  sub_225105F00();
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(char *, uint64_t))(v12 + 32))(v11, v2);
  uint64_t v13 = (char *)v1 + *(void *)(*v1 + 120);
  sub_225105F50();
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(char *, uint64_t))(v14 + 32))(v13, v0);
  return v1;
}

void sub_2250EC0C0()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_7();
  uint64_t v34 = v5;
  OUTLINED_FUNCTION_15_4();
  uint64_t v6 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_7();
  uint64_t v33 = v10;
  sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v12;
  uint64_t v36 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_40_3();
  type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_61_2();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v31 - v14;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2251070F0();
  __swift_project_value_buffer(v16, (uint64_t)qword_2680C5BC0);
  swift_retain_n();
  uint64_t v17 = sub_2251070D0();
  os_log_type_t v18 = sub_225107380();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = OUTLINED_FUNCTION_22_4();
    v31[2] = v8;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = OUTLINED_FUNCTION_21_3();
    v31[1] = v2;
    uint64_t v37 = v21;
    uint64_t v32 = v6;
    *(_DWORD *)uint64_t v20 = 136315138;
    v31[0] = v20 + 4;
    sub_2250EBC2C((uint64_t)v15);
    uint64_t v22 = sub_225107220();
    uint64_t v24 = sub_2250B72A8(v22, v23, &v37);
    OUTLINED_FUNCTION_33_3(v24);
    uint64_t v6 = v32;
    sub_225107420();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v17, v18, "state of LocationResolverFlow: %s", v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {

    swift_release_n();
  }
  sub_2251065A0();
  uint64_t v26 = v35;
  uint64_t v25 = v36;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v35 + 88))(v0, v36) == *MEMORY[0x263F6FF78])
  {
    (*(void (**)(uint64_t, uint64_t))(v26 + 96))(v0, v25);
    __swift_instantiateConcreteTypeFromMangledName(qword_2680C1240);
    OUTLINED_FUNCTION_68_1();
    OUTLINED_FUNCTION_18_3();
    v27();
    uint64_t v28 = v34;
    OUTLINED_FUNCTION_29_2();
    v29();
    __swift_storeEnumTagSinglePayload(v28, 0, 1, v6);
    sub_2250EBDEC(v28);
    swift_retain();
    sub_2250EBE70();
    swift_release();
    OUTLINED_FUNCTION_47_2();
    OUTLINED_FUNCTION_52_3();
    v30();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v0, v25);
  }
  OUTLINED_FUNCTION_5_4();
}

void sub_2250EC498()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v98 = v0;
  uint64_t v99 = v1;
  sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v95 = v3;
  uint64_t v96 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_7();
  uint64_t v94 = v4;
  OUTLINED_FUNCTION_15_4();
  uint64_t v89[6] = sub_2251068C0();
  OUTLINED_FUNCTION_0();
  v89[5] = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v7);
  v89[4] = sub_225106950();
  OUTLINED_FUNCTION_0();
  v89[3] = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1358);
  uint64_t v12 = OUTLINED_FUNCTION_9(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_7();
  uint64_t v90 = v13;
  sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v92 = v15;
  uint64_t v93 = v14;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_27_2();
  uint64_t v18 = v16 - v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_31_2();
  v89[7] = v20;
  OUTLINED_FUNCTION_15_4();
  sub_225106840();
  OUTLINED_FUNCTION_0();
  v89[8] = v22;
  v89[9] = v21;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_4_7();
  uint64_t v91 = v23;
  OUTLINED_FUNCTION_65_1();
  uint64_t v24 = type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_9(v24);
  OUTLINED_FUNCTION_61_2();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)v89 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v29 = OUTLINED_FUNCTION_9(v28);
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_27_2();
  uint64_t v32 = v30 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)v89 - v34;
  uint64_t v36 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v97 = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_4_7();
  uint64_t v40 = v39;
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_65_1();
  v100[3] = type metadata accessor for LocationResolverFlow.FeatureFlags();
  v100[4] = swift_getWitnessTable();
  char v41 = sub_225106660();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v100);
  if (v41)
  {
    sub_2250EBD9C((uint64_t)v35);
    OUTLINED_FUNCTION_5_9((uint64_t)v35, 1, v36);
    if (v42)
    {
      sub_2250E4AA4((uint64_t)v35, &qword_2680C0F88);
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_2251070F0();
      uint64_t v44 = (void *)OUTLINED_FUNCTION_33(v43, (uint64_t)qword_2680C5BC0);
      os_log_type_t v45 = sub_225107390();
      if (OUTLINED_FUNCTION_22_2(v45))
      {
        uint64_t v46 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v46);
        OUTLINED_FUNCTION_6_4(&dword_2250AF000, v47, v48, "nlIntent is nil in LocationResolverFlow::execute, returning early");
        OUTLINED_FUNCTION_7_1();
      }

      sub_2250ECE84();
      uint64_t v49 = v94;
      OUTLINED_FUNCTION_12_4();
      swift_release();
      uint64_t v50 = OUTLINED_FUNCTION_53_2();
      v51(v50);
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v49, v96);
    }
    else
    {
      uint64_t v58 = v36;
      uint64_t v59 = v40;
      v89[0] = v58;
      OUTLINED_FUNCTION_18_3();
      v60();
      OUTLINED_FUNCTION_65_1();
      if (v61())
      {
        sub_2250EBC2C((uint64_t)v27);
        uint64_t v62 = v93;
        switch(__swift_getEnumTagSinglePayload((uint64_t)v27, 3, v93))
        {
          case 1u:
            sub_2250ED860();
            break;
          case 2u:
            sub_225106830();
            OUTLINED_FUNCTION_29_2();
            v71();
            OUTLINED_FUNCTION_45_3(v32, 0);
            uint64_t v72 = v90;
            OUTLINED_FUNCTION_65_1();
            v73();
            sub_2250E4AA4(v32, &qword_2680C0F88);
            OUTLINED_FUNCTION_5_9(v72, 1, v62);
            if (v42)
            {
              sub_2250E4AA4(v72, &qword_2680C1358);
              if (qword_2680C0698 != -1) {
                swift_once();
              }
              uint64_t v74 = sub_2251070F0();
              uint64_t v75 = (void *)OUTLINED_FUNCTION_33(v74, (uint64_t)qword_2680C5BC0);
              os_log_type_t v76 = sub_225107390();
              if (OUTLINED_FUNCTION_22_2(v76))
              {
                os_log_type_t v77 = (_WORD *)OUTLINED_FUNCTION_6_2();
                OUTLINED_FUNCTION_19_1(v77);
                OUTLINED_FUNCTION_6_4(&dword_2250AF000, v78, v79, "no location node present in the intent, skipping to nextFlow");
                OUTLINED_FUNCTION_7_1();
              }

              sub_2250ECE84();
              OUTLINED_FUNCTION_12_4();
              swift_release();
              uint64_t v80 = OUTLINED_FUNCTION_53_2();
              v81(v80);
              OUTLINED_FUNCTION_5_6();
              v82();
            }
            else
            {
              OUTLINED_FUNCTION_68_1();
              OUTLINED_FUNCTION_18_3();
              v83();
              sub_2250ED380();
              sub_2251068B0();
              uint64_t v84 = sub_225106810();
              OUTLINED_FUNCTION_5_6();
              v85();
              OUTLINED_FUNCTION_5_6();
              v86();
              sub_2250EBA04(v84);
              swift_bridgeObjectRelease();
              sub_2250EF1FC();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_52_3();
              v87();
            }
            OUTLINED_FUNCTION_5_6();
            v88();
            break;
          case 3u:
            sub_2250F1A7C(v98);
            break;
          default:
            uint64_t v63 = v92;
            OUTLINED_FUNCTION_18_3();
            v64();
            sub_2250EF9AC();
            (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v18, v62);
            break;
        }
      }
      else
      {
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v65 = sub_2251070F0();
        uint64_t v66 = (void *)OUTLINED_FUNCTION_33(v65, (uint64_t)qword_2680C5BC0);
        os_log_type_t v67 = sub_225107380();
        if (OUTLINED_FUNCTION_22_2(v67))
        {
          uint64_t v68 = (_WORD *)OUTLINED_FUNCTION_6_2();
          OUTLINED_FUNCTION_19_1(v68);
          OUTLINED_FUNCTION_6_4(&dword_2250AF000, v69, v70, "resolutionStrategy.shouldResolve returned false, returning early");
          OUTLINED_FUNCTION_7_1();
        }

        sub_2250F14D8();
      }
      (*(void (**)(uint64_t, void))(v97 + 8))(v59, v89[0]);
    }
  }
  else
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_2251070F0();
    uint64_t v53 = (void *)OUTLINED_FUNCTION_33(v52, (uint64_t)qword_2680C5BC0);
    os_log_type_t v54 = sub_225107380();
    if (OUTLINED_FUNCTION_22_2(v54))
    {
      uint64_t v55 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v55);
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v56, v57, "native location resolution is disabled, returning early");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250F14D8();
  }
  OUTLINED_FUNCTION_5_4();
}

void (*sub_2250ECE84())()
{
  return sub_2250F2AE8;
}

uint64_t sub_2250ECEC4()
{
  return sub_225106960();
}

uint64_t sub_2250ECEFC(uint64_t a1)
{
  uint64_t v2 = sub_225106AE0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15F0);
  return sub_225106970();
}

void sub_2250ECFD4()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v0 = type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_27_2();
  uint64_t v6 = v4 - v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - v8;
  sub_2250EBC2C((uint64_t)&v27 - v8);
  uint64_t v10 = sub_225106AE0();
  OUTLINED_FUNCTION_5_9((uint64_t)v9, 3, v10);
  if (v11)
  {
    __swift_storeEnumTagSinglePayload(v6, 3, 3, v10);
    sub_2250EBCE0(v6);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2251070F0();
    __swift_project_value_buffer(v12, (uint64_t)qword_2680C5BC0);
    swift_retain_n();
    uint64_t v13 = sub_2251070D0();
    os_log_type_t v14 = sub_225107380();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_22_4();
      uint64_t v29 = OUTLINED_FUNCTION_21_3();
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_2250EBC2C(v6);
      uint64_t v16 = sub_225107220();
      uint64_t v18 = sub_2250B72A8(v16, v17, &v29);
      OUTLINED_FUNCTION_33_3(v18);
      sub_225107420();
      OUTLINED_FUNCTION_69_0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2250AF000, v13, v14, "[LocationResolverFlow::onFlowCompletion] setting state to %s", v15, 0xCu);
      OUTLINED_FUNCTION_46_4();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      OUTLINED_FUNCTION_69_0();
    }
  }
  else
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2251070F0();
    __swift_project_value_buffer(v19, (uint64_t)qword_2680C5BC0);
    swift_retain_n();
    uint64_t v20 = sub_2251070D0();
    os_log_type_t v21 = sub_225107390();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)OUTLINED_FUNCTION_22_4();
      uint64_t v23 = OUTLINED_FUNCTION_21_3();
      uint64_t v28 = v0;
      uint64_t v29 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v27 = v22 + 4;
      sub_2250EBC2C(v6);
      uint64_t v24 = sub_225107220();
      uint64_t v26 = sub_2250B72A8(v24, v25, &v29);
      OUTLINED_FUNCTION_33_3(v26);
      sub_225107420();
      OUTLINED_FUNCTION_69_0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2250AF000, v20, v21, "[LocationResolverFlow::onFlowCompletion] unexpected state: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v0 = v28;
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      OUTLINED_FUNCTION_69_0();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v0);
  }
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250ED380()
{
  uint64_t v12 = sub_225105F50();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_0();
  sub_225105F00();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_27_2();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_49_2();
  sub_2250ED52C();
  OUTLINED_FUNCTION_45_2();
  uint64_t v10 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_32_4();
  v10();
  OUTLINED_FUNCTION_32_4();
  v10();
  OUTLINED_FUNCTION_32_4();
  v10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v0 + *(void *)(*(void *)v0 + 120), v12);
  return sub_225106940();
}

double sub_2250ED52C()
{
  type metadata accessor for LocationService();
  OUTLINED_FUNCTION_4_9();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_29_3();
  sub_225106160();
  if (qword_2680C0690 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_225107100();
  __swift_project_value_buffer(v2, (uint64_t)qword_2680C5BA8);
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(void))(v3 + 16))();
  sub_2250BFD9C(&v19, v0);
  uint64_t v4 = sub_2250F2DD8();
  if (v4)
  {
    uint64_t v5 = v4;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2251070F0();
    __swift_project_value_buffer(v6, (uint64_t)qword_2680C5BC0);
    uint64_t v7 = v5;
    uint64_t v8 = sub_2251070D0();
    os_log_type_t v9 = sub_225107380();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134218240;
      [v7 lat];
      *(void *)&long long v19 = v11;
      sub_225107420();
      *(_WORD *)(v10 + 12) = 2048;
      [v7 lng];
      *(void *)&long long v19 = v12;
      sub_225107420();

      _os_log_impl(&dword_2250AF000, v8, v9, "latitude: %f, longitude: %f", (uint8_t *)v10, 0x16u);
      OUTLINED_FUNCTION_7_1();
    }
    else
    {

      uint64_t v8 = v7;
    }

    [v7 lat];
    double v15 = v17;
    [v7 lng];
  }
  else
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2251070F0();
    uint64_t v7 = OUTLINED_FUNCTION_33(v13, (uint64_t)qword_2680C5BC0);
    os_log_type_t v14 = sub_225107390();
    double v15 = 0.0;
    if (os_log_type_enabled(v7, v14))
    {
      uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_6_2();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2250AF000, v7, v14, "did not get location information from LocationService", v16, 2u);
      OUTLINED_FUNCTION_7_1();
    }
  }

  sub_2250DF54C(v0);
  return v15;
}

void sub_2250ED860()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v153 = v2;
  uint64_t v4 = v3;
  uint64_t v5 = *v0;
  uint64_t v6 = *v0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15B8);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v9);
  uint64_t v146 = sub_225106680();
  OUTLINED_FUNCTION_0();
  os_log_t v138 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_8_7((uint64_t)&v129 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v143 = sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v142 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v15);
  uint64_t v155 = *((void *)v5 + 10);
  OUTLINED_FUNCTION_1_8();
  uint64_t v134 = v16;
  OUTLINED_FUNCTION_61_2();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_7_3((uint64_t)&v129 - v18);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15C0);
  OUTLINED_FUNCTION_0();
  uint64_t v147 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_55_0();
  uint64_t v150 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_31_2();
  uint64_t v151 = v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v27 = OUTLINED_FUNCTION_9(v26);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v129 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1358);
  uint64_t v31 = OUTLINED_FUNCTION_9(v30);
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (char *)&v129 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v34;
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  uint64_t v132 = (char *)&v129 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_31_2();
  uint64_t v136 = v39;
  uint64_t v41 = MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v129 - v42;
  uint64_t v131 = v44;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_31_2();
  uint64_t v152 = v45;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v135 = v43;
  uint64_t v46 = sub_2251070F0();
  uint64_t v47 = __swift_project_value_buffer(v46, (uint64_t)qword_2680C5BC0);
  swift_retain_n();
  uint64_t v154 = v47;
  uint64_t v48 = sub_2251070D0();
  os_log_type_t v49 = sub_225107380();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v130 = v6;
    uint64_t v148 = v4;
    uint64_t v149 = v35;
    uint64_t v50 = (uint8_t *)OUTLINED_FUNCTION_22_4();
    v157[0] = OUTLINED_FUNCTION_21_3();
    *(_DWORD *)uint64_t v50 = 136315138;
    os_log_type_t v51 = v1;
    if (sub_2250EBE50())
    {
      uint64_t v52 = sub_2251065E0();
      swift_release();
    }
    else
    {
      uint64_t v52 = 0;
    }
    uint64_t v158 = v52;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10C0);
    uint64_t v53 = sub_225107220();
    uint64_t v158 = sub_2250B72A8(v53, v54, v157);
    sub_225107420();
    swift_release_n();
    uint64_t v1 = v51;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v48, v49, "handling initialized state intent: %s", v50, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();

    uint64_t v4 = v148;
    uint64_t v35 = v149;
    uint64_t v6 = v130;
  }
  else
  {

    swift_release_n();
  }
  uint64_t v55 = (char *)v1 + *((void *)*v1 + 16);
  sub_2250EBD9C((uint64_t)v29);
  uint64_t v56 = *((void *)v6 + 11);
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 24))(v29, v155, v56);
  sub_2250E4AA4((uint64_t)v29, &qword_2680C0F88);
  OUTLINED_FUNCTION_5_9((uint64_t)v33, 1, v156);
  if (v57)
  {
    sub_2250E4AA4((uint64_t)v33, &qword_2680C1358);
    uint64_t v58 = (void *)sub_2251070D0();
    os_log_type_t v59 = sub_225107380();
    if (OUTLINED_FUNCTION_22_2(v59))
    {
      uint64_t v60 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v60);
      OUTLINED_FUNCTION_6_4(&dword_2250AF000, v61, v62, "no location node present in the intent, skipping to nextFlow");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250F14D8();
  }
  else
  {
    uint64_t v63 = *(void (**)(uint64_t, char *, uint64_t))(v35 + 32);
    v63(v152, v33, v156);
    sub_2250EF06C();
    uint64_t v145 = v63;
    uint64_t v149 = v35;
    uint64_t v146 = (uint64_t)v1;
    uint64_t v148 = v4;
    uint64_t v64 = v147;
    uint64_t v65 = v144;
    OUTLINED_FUNCTION_18_3();
    v66();
    os_log_type_t v67 = *(void (**)(void))(v64 + 16);
    uint64_t v68 = v140;
    OUTLINED_FUNCTION_54_1();
    v67();
    uint64_t v69 = sub_2251070D0();
    os_log_type_t v70 = sub_225107380();
    if (os_log_type_enabled(v69, v70))
    {
      os_log_t v138 = v69;
      uint64_t v72 = (uint8_t *)OUTLINED_FUNCTION_22_4();
      uint64_t v137 = OUTLINED_FUNCTION_21_3();
      v157[0] = v137;
      uint64_t v130 = v72;
      uint64_t v129 = v67;
      *(_DWORD *)uint64_t v72 = 136315138;
      uint64_t v150 = (void (*)(void))(v72 + 4);
      sub_2250DF698(&qword_2680C15C8, &qword_2680C15C0);
      uint64_t v73 = sub_2251077A0();
      uint64_t v75 = sub_2250B72A8(v73, v74, v157);
      OUTLINED_FUNCTION_56_2(v75);
      os_log_type_t v67 = v129;
      sub_225107420();
      swift_bridgeObjectRelease();
      uint64_t v150 = *(void (**)(void))(v64 + 8);
      OUTLINED_FUNCTION_49();
      v76();
      uint64_t v69 = v138;
      _os_log_impl(&dword_2250AF000, v138, v70, "recommendation: %s", v130, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();
    }
    else
    {
      uint64_t v150 = *(void (**)(void))(v64 + 8);
      ((void (*)(uint64_t, uint64_t))v150)(v68, v65);
    }

    os_log_type_t v77 = v139;
    OUTLINED_FUNCTION_54_1();
    v67();
    int v78 = (*(uint64_t (**)(uint64_t *, uint64_t))(v64 + 88))(v77, v65);
    uint64_t v79 = v149;
    if (v78 == *MEMORY[0x263F6D398])
    {
      uint64_t v80 = OUTLINED_FUNCTION_27_5();
      v81(v80);
      OUTLINED_FUNCTION_35_4();
      v82();
      uint64_t v83 = (void *)sub_2251070D0();
      os_log_type_t v84 = sub_225107380();
      OUTLINED_FUNCTION_38_2(v84);
      OUTLINED_FUNCTION_64_1();
      if (v85)
      {
        uint64_t v86 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v86);
        OUTLINED_FUNCTION_36_2(&dword_2250AF000, v87, v88, "handling confident recommendation");
        OUTLINED_FUNCTION_7_1();
      }

      sub_2250EF9AC();
      uint64_t v89 = *(void (**)(void))(v79 + 8);
      OUTLINED_FUNCTION_33_2();
      v89();
      OUTLINED_FUNCTION_49();
      v90();
LABEL_25:
      OUTLINED_FUNCTION_33_2();
      v89();
      goto LABEL_27;
    }
    int v91 = v78;
    if (v78 == *MEMORY[0x263F6D380])
    {
      uint64_t v92 = OUTLINED_FUNCTION_27_5();
      v93(v92);
      OUTLINED_FUNCTION_35_4();
      v94();
      uint64_t v95 = sub_2251070D0();
      os_log_type_t v96 = sub_225107380();
      if (os_log_type_enabled(v95, v96))
      {
        uint64_t v97 = (uint8_t *)OUTLINED_FUNCTION_6_2();
        *(_WORD *)uint64_t v97 = 0;
        _os_log_impl(&dword_2250AF000, v95, v96, "handling needsConfirmation recommendation like a confident recommendation", v97, 2u);
        OUTLINED_FUNCTION_7_1();
      }

      uint64_t v98 = v155;
      type metadata accessor for LocationConfirmationStrategy();
      uint64_t v99 = v133;
      (*(void (**)(uint64_t, char *, uint64_t))(v134 + 16))(v133, v55, v98);
      uint64_t v100 = sub_2250E4C9C(v99);
      swift_getWitnessTable();
      sub_225105F90();
      uint64_t v101 = *(void (**)(void))(v79 + 16);
      OUTLINED_FUNCTION_54_1();
      v101();
      uint64_t v154 = v100;
      swift_retain();
      sub_2251064F0();
      v157[0] = sub_225105F80();
      OUTLINED_FUNCTION_54_1();
      v101();
      uint64_t v102 = (void *)swift_allocObject();
      v102[2] = v155;
      v102[3] = v56;
      v102[4] = v146;
      OUTLINED_FUNCTION_35_4();
      v103();
      swift_retain();
      swift_getWitnessTable();
      uint64_t v104 = v141;
      sub_225106340();
      swift_release();
      swift_release();
      v148(v104);
      swift_release();
      OUTLINED_FUNCTION_5_6();
      v105();
      uint64_t v89 = *(void (**)(void))(v79 + 8);
      OUTLINED_FUNCTION_33_2();
      v89();
      OUTLINED_FUNCTION_49();
      v106();
      goto LABEL_25;
    }
    if (v78 == *MEMORY[0x263F6D388])
    {
      uint64_t v107 = OUTLINED_FUNCTION_27_5();
      v108(v107);
      uint64_t v109 = *v77;
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_2251070D0();
      os_log_type_t v111 = sub_225107380();
      if (os_log_type_enabled(v110, v111))
      {
        uint64_t v112 = (uint8_t *)OUTLINED_FUNCTION_22_4();
        *(_DWORD *)uint64_t v112 = 134349056;
        v157[0] = *(void *)(v109 + 16);
        sub_225107420();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2250AF000, v110, v111, "handling needsDisambiguation recommendation with locations: %{public}ld", v112, 0xCu);
        OUTLINED_FUNCTION_7_1();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      OUTLINED_FUNCTION_64_1();
      uint64_t v121 = v150;
      sub_2250EF1FC();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_49();
      v121();
LABEL_26:
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v152, v156);
      goto LABEL_27;
    }
    int v113 = *MEMORY[0x263F6D390];
    uint64_t v114 = (void *)sub_2251070D0();
    if (v91 == v113)
    {
      os_log_type_t v115 = sub_225107390();
      OUTLINED_FUNCTION_38_2(v115);
      OUTLINED_FUNCTION_64_1();
      if (v116)
      {
        uint64_t v117 = (_WORD *)OUTLINED_FUNCTION_6_2();
        OUTLINED_FUNCTION_19_1(v117);
        OUTLINED_FUNCTION_36_2(&dword_2250AF000, v118, v119, "got .none recommendation, returning to the next flow without performing any inference");
        OUTLINED_FUNCTION_7_1();
      }

      sub_2250F14D8();
      OUTLINED_FUNCTION_49();
      v120();
      goto LABEL_26;
    }
    os_log_type_t v122 = sub_225107380();
    OUTLINED_FUNCTION_38_2(v122);
    OUTLINED_FUNCTION_64_1();
    if (v123)
    {
      uint64_t v124 = (_WORD *)OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_19_1(v124);
      OUTLINED_FUNCTION_36_2(&dword_2250AF000, v125, v126, "unknown recommendation, returning to the next flow without performing any inference");
      OUTLINED_FUNCTION_7_1();
    }

    sub_2250F14D8();
    uint64_t v127 = v150;
    OUTLINED_FUNCTION_9_3();
    v127();
    OUTLINED_FUNCTION_33_2();
    v128();
    OUTLINED_FUNCTION_9_3();
    v127();
  }
LABEL_27:
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250EE908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v60 = a3;
  uint64_t v5 = type metadata accessor for LocationResolverFlow.State();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v72 = (uint64_t)&v57 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1228);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v71 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2251064C0();
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v62 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v57 - v12;
  uint64_t v14 = sub_225106580();
  uint64_t v67 = *(void *)(v14 - 8);
  uint64_t v68 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15D0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v57 - v22;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v63 = v13;
  uint64_t v66 = v16;
  uint64_t v24 = sub_2251070F0();
  uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_2680C5BC0);
  uint64_t v69 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v70 = a1;
  v69(v23, a1, v17);
  uint64_t v61 = v25;
  uint64_t v26 = sub_2251070D0();
  os_log_type_t v27 = sub_225107380();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v59 = a2;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v58 = swift_slowAlloc();
    uint64_t v74 = v58;
    *(_DWORD *)uint64_t v29 = 136315138;
    char v57 = v29 + 4;
    sub_2250DF698(&qword_2680C15D8, &qword_2680C15D0);
    uint64_t v30 = sub_2251077A0();
    uint64_t v73 = sub_2250B72A8(v30, v31, &v74);
    sub_225107420();
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v18 + 8);
    v32(v23, v17);
    _os_log_impl(&dword_2250AF000, v26, v27, "confirmation result: %s", v29, 0xCu);
    uint64_t v33 = v58;
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v33, -1, -1);
    MEMORY[0x22A62D170](v29, -1, -1);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, uint64_t))(v18 + 8);
    v32(v23, v17);
  }

  uint64_t v34 = (uint64_t)v71;
  v69(v21, v70, v17);
  if ((*(unsigned int (**)(char *, uint64_t))(v18 + 88))(v21, v17) == *MEMORY[0x263F6FA10])
  {
    (*(void (**)(char *, uint64_t))(v18 + 96))(v21, v17);
    uint64_t v36 = v66;
    uint64_t v35 = v67;
    uint64_t v37 = v68;
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v66, v21, v68);
    sub_225106570();
    uint64_t v38 = v65;
    if (__swift_getEnumTagSinglePayload(v34, 1, v65) == 1)
    {
      sub_2250E4AA4(v34, &qword_2680C1228);
      uint64_t v39 = sub_2251070D0();
      os_log_type_t v40 = sub_225107390();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v41 = 0;
        _os_log_impl(&dword_2250AF000, v39, v40, "no confirmationResponse returned by confirmation strategy", v41, 2u);
        MEMORY[0x22A62D170](v41, -1, -1);
      }

      uint64_t v42 = sub_225106AE0();
      uint64_t v43 = v72;
      __swift_storeEnumTagSinglePayload(v72, 3, 3, v42);
      sub_2250EBCE0(v43);
    }
    else
    {
      uint64_t v48 = v63;
      uint64_t v47 = v64;
      (*(void (**)(char *, uint64_t, uint64_t))(v64 + 32))(v63, v34, v38);
      os_log_type_t v49 = v62;
      (*(void (**)(char *, void, uint64_t))(v47 + 104))(v62, *MEMORY[0x263F6FC98], v38);
      char v50 = sub_2251064B0();
      os_log_type_t v51 = *(void (**)(char *, uint64_t))(v47 + 8);
      v51(v49, v38);
      uint64_t v52 = sub_225106AE0();
      uint64_t v53 = v52;
      if (v50)
      {
        uint64_t v54 = v72;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 16))(v72, v60, v52);
        uint64_t v55 = v54;
        uint64_t v56 = 0;
      }
      else
      {
        uint64_t v54 = v72;
        uint64_t v55 = v72;
        uint64_t v56 = 2;
      }
      __swift_storeEnumTagSinglePayload(v55, v56, 3, v53);
      sub_2250EBCE0(v54);
      v51(v48, v38);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  }
  else
  {
    uint64_t v44 = sub_225106AE0();
    uint64_t v45 = v72;
    __swift_storeEnumTagSinglePayload(v72, 3, 3, v44);
    sub_2250EBCE0(v45);
    return ((uint64_t (*)(char *, uint64_t))v32)(v21, v17);
  }
}

uint64_t sub_2250EF06C()
{
  uint64_t v9 = sub_2251068C0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_40_3();
  sub_225106950();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_20_4();
  sub_225106840();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  sub_225106830();
  sub_2250ED380();
  sub_2251068B0();
  sub_225106820();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v9);
  OUTLINED_FUNCTION_52_3();
  v6();
  OUTLINED_FUNCTION_9_3();
  return v7();
}

void sub_2250EF1FC()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v3 = v2;
  uint64_t v10 = v4;
  sub_225106380();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_61_2();
  MEMORY[0x270FA5388](v6);
  type metadata accessor for LocationDisambiguationStrategy();
  OUTLINED_FUNCTION_54_1();
  v7();
  sub_2250E7470();
  swift_getWitnessTable();
  sub_225105FB0();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2251064F0();
  sub_225105FA0();
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = v0;
  v8[3] = v10;
  void v8[4] = v3;
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_225106340();
  swift_release();
  swift_release();
  v10(v1);
  swift_release();
  OUTLINED_FUNCTION_9_3();
  v9();
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250EF44C(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v44 = a3;
  uint64_t v6 = sub_225106380();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  MEMORY[0x270FA5388](v6);
  os_log_type_t v40 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LocationResolverFlow.State();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v38 = (char *)&v33 - v9;
  uint64_t v39 = sub_225106AE0();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v36 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15E0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - v16;
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_2251070F0();
  __swift_project_value_buffer(v18, (uint64_t)qword_2680C5BC0);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v46 = a1;
  v45(v17, a1, v11);
  uint64_t v19 = sub_2251070D0();
  os_log_type_t v20 = sub_225107380();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v35 = a2;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v48 = v34;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v33 = v22 + 4;
    sub_2250DF698(&qword_2680C15E8, &qword_2680C15E0);
    uint64_t v23 = sub_2251077A0();
    uint64_t v47 = sub_2250B72A8(v23, v24, &v48);
    sub_225107420();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25(v17, v11);
    _os_log_impl(&dword_2250AF000, v19, v20, "result: %s", v22, 0xCu);
    uint64_t v26 = v34;
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v26, -1, -1);
    MEMORY[0x22A62D170](v22, -1, -1);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25(v17, v11);
  }

  v45(v15, v46, v11);
  if ((*(unsigned int (**)(char *, uint64_t))(v12 + 88))(v15, v11) == *MEMORY[0x263F6FA10])
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v15, v11);
    uint64_t v28 = v36;
    uint64_t v27 = v37;
    uint64_t v29 = v39;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v36, v15, v39);
    uint64_t v30 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v38, v28, v29);
    __swift_storeEnumTagSinglePayload(v30, 0, 3, v29);
    sub_2250EBCE0(v30);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  }
  else
  {
    uint64_t v32 = v40;
    sub_225106370();
    v44(v32);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v42);
    return ((uint64_t (*)(char *, uint64_t))v25)(v15, v11);
  }
}

void sub_2250EF9AC()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v249 = v5;
  v251 = v6;
  uint64_t v238 = v7;
  OUTLINED_FUNCTION_2_1();
  uint64_t v239 = v8;
  uint64_t v250 = sub_225106380();
  OUTLINED_FUNCTION_0();
  uint64_t v253 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v11);
  uint64_t v237 = sub_2251065C0();
  OUTLINED_FUNCTION_0();
  uint64_t v236 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v14);
  uint64_t v244 = sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v243 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_8_7(v18);
  uint64_t v19 = sub_225106080();
  uint64_t v20 = OUTLINED_FUNCTION_9(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v21);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C15F8);
  uint64_t v23 = OUTLINED_FUNCTION_9(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v24);
  uint64_t v228 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v227 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v27);
  uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  OUTLINED_FUNCTION_4_9();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v29);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1130);
  uint64_t v31 = OUTLINED_FUNCTION_9(v30);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_7_3(v35);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v37 = OUTLINED_FUNCTION_9(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_7_3(v41);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1138);
  uint64_t v43 = OUTLINED_FUNCTION_9(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v44);
  uint64_t v233 = sub_225106B30();
  OUTLINED_FUNCTION_0();
  uint64_t v230 = v45;
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_8_7(v47);
  uint64_t v48 = sub_225106990();
  OUTLINED_FUNCTION_0();
  uint64_t v235 = v49;
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v51);
  uint64_t v53 = (char *)v220 - v52;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1140);
  uint64_t v55 = OUTLINED_FUNCTION_9(v54);
  MEMORY[0x270FA5388](v55);
  OUTLINED_FUNCTION_27_2();
  uint64_t v58 = v56 - v57;
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_49_2();
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1148);
  uint64_t v61 = OUTLINED_FUNCTION_9(v60);
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v62);
  uint64_t v64 = (char *)v220 - v63;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1150);
  uint64_t v66 = OUTLINED_FUNCTION_9(v65);
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_29_3();
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(qword_2680C1158);
  uint64_t v68 = OUTLINED_FUNCTION_9(v67);
  MEMORY[0x270FA5388](v68);
  OUTLINED_FUNCTION_20_4();
  id v241 = (id)sub_225106770();
  OUTLINED_FUNCTION_0();
  uint64_t v234 = v69;
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_57_0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x270FA5388](v71);
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_8_7(v72);
  uint64_t v246 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v245 = v73;
  MEMORY[0x270FA5388](v74);
  OUTLINED_FUNCTION_7_3((uint64_t)v220 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v77 = OUTLINED_FUNCTION_9(v76);
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_4_0();
  uint64_t v78 = sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v248 = v79;
  MEMORY[0x270FA5388](v80);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_7_3(v81);
  uint64_t v255 = v1;
  uint64_t v82 = sub_2250EBE50();
  unint64_t v83 = 0x2680C0000;
  uint64_t v247 = v82;
  if (v82)
  {
    sub_2250EBD9C(v2);
    OUTLINED_FUNCTION_5_9(v2, 1, v78);
    if (!v108)
    {
      v220[4] = v78;
      OUTLINED_FUNCTION_18_3();
      v92();
      OUTLINED_FUNCTION_29_2();
      v93();
      sub_225106AD0();
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v48);
      p_NumFields = &reflection metadata field descriptor LocationResolverFlow.NumFields;
      if (EnumTagSinglePayload)
      {
        os_log_type_t v96 = &qword_2680C1140;
        uint64_t v97 = v3;
LABEL_18:
        sub_2250E4AA4(v97, v96);
        uint64_t v109 = v240;
        __swift_storeEnumTagSinglePayload(v4, 1, 1, (uint64_t)v241);
LABEL_19:
        sub_2250E4AA4(v4, qword_2680C1158);
        OUTLINED_FUNCTION_67_1();
LABEL_20:
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v110 = sub_2251070F0();
        __swift_project_value_buffer(v110, (uint64_t)qword_2680C5BC0);
        os_log_type_t v111 = sub_2251070D0();
        os_log_type_t v112 = sub_225107380();
        if (os_log_type_enabled(v111, v112))
        {
          int v113 = (uint8_t *)OUTLINED_FUNCTION_22_4();
          uint64_t v258 = OUTLINED_FUNCTION_21_3();
          *(_DWORD *)int v113 = *((void *)p_NumFields + 264);
          OUTLINED_FUNCTION_50_3();
          sub_225106AB0();
          uint64_t v114 = sub_225106730();
          OUTLINED_FUNCTION_5_9(v109, 1, v114);
          if (v108)
          {
            sub_2250E4AA4(v109, &qword_2680C15F8);
            uint64_t v115 = 0;
            uint64_t v117 = 0;
          }
          else
          {
            uint64_t v115 = sub_225106720();
            uint64_t v117 = v116;
            OUTLINED_FUNCTION_4_9();
            (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v109, v114);
          }
          v257[0] = v115;
          v257[1] = v117;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1600);
          uint64_t v119 = sub_225107220();
          v257[0] = sub_2250B72A8(v119, v120, &v258);
          sub_225107420();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2250AF000, v111, v112, "location name is %s", v113, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_7_1();
        }

        uint64_t v121 = (void *)sub_2251065E0();
        os_log_type_t v122 = v254;
        OUTLINED_FUNCTION_50_3();
        int v123 = (void *)(*(uint64_t (**)(void *, NSObject *, void))(*(void *)(v239 + 88) + 72))(v121, v122, *(void *)(v239 + 80));

        if (v123)
        {
          id v124 = v123;
          OUTLINED_FUNCTION_66_1();
          sub_2251065F0();
          sub_225106600();
          sub_225106610();
          sub_225106620();
          swift_allocObject();
          uint64_t v125 = sub_2251065D0();
          uint64_t v126 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_2680C1240) + 48);
          uint64_t v127 = v242;
          OUTLINED_FUNCTION_29_2();
          v128();
          *(void *)(v127 + v126) = v125;
          OUTLINED_FUNCTION_66_1();
          (*(void (**)(uint64_t))(v129 + 104))(v127);
          uint64_t v130 = *(void *)(v4 + 16);
          OUTLINED_FUNCTION_29_2();
          v131();
          swift_retain();
          OUTLINED_FUNCTION_66_1();
          sub_2251065B0();
          char v132 = sub_225105FC0();
          OUTLINED_FUNCTION_5_6();
          v133();
          swift_retain_n();
          uint64_t v134 = sub_2251070D0();
          os_log_type_t v135 = sub_225107380();
          if (os_log_type_enabled(v134, v135))
          {
            uint64_t v136 = swift_slowAlloc();
            uint64_t v137 = OUTLINED_FUNCTION_21_3();
            id v241 = v124;
            v257[0] = v137;
            *(_DWORD *)uint64_t v136 = 67109378;
            LODWORD(v256) = v132 & 1;
            sub_225107420();
            *(_WORD *)(v136 + 8) = 2080;
            uint64_t v256 = v130;
            sub_225105FD0();
            sub_2250F2A94();
            OUTLINED_FUNCTION_67_1();
            uint64_t v138 = sub_2251077A0();
            uint64_t v256 = sub_2250B72A8(v138, v139, v257);
            sub_225107420();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2250AF000, v134, v135, "nextFlowOn: %{BOOL}d, flow is: %s", (uint8_t *)v136, 0x12u);
            OUTLINED_FUNCTION_46_4();
            id v124 = v241;
            OUTLINED_FUNCTION_7_1();
            OUTLINED_FUNCTION_7_1();
          }
          else
          {

            swift_release_n();
          }
          sub_2250ECE84();
          uint64_t v147 = v252;
          sub_225106350();
          swift_release();
          v251(v147);

          swift_release();
          swift_release();
          OUTLINED_FUNCTION_5_6();
          v148();
          OUTLINED_FUNCTION_63_1();
        }
        else
        {
          uint64_t v140 = (void *)sub_2251070D0();
          os_log_type_t v141 = sub_225107390();
          if (OUTLINED_FUNCTION_22_2(v141))
          {
            uint64_t v142 = (_WORD *)OUTLINED_FUNCTION_6_2();
            OUTLINED_FUNCTION_19_1(v142);
            OUTLINED_FUNCTION_6_4(&dword_2250AF000, v143, v144, "resolutionStrategy did return an intent with the resolved location, moving on to the next flow without setting location");
            OUTLINED_FUNCTION_7_1();
          }

          sub_2250F1498();
          OUTLINED_FUNCTION_12_4();
          swift_release();
          uint64_t v145 = OUTLINED_FUNCTION_44_4();
          v146(v145);
          swift_release();
          OUTLINED_FUNCTION_48_2();
        }
        OUTLINED_FUNCTION_5_6();
        v149();
        OUTLINED_FUNCTION_63_1();
        OUTLINED_FUNCTION_5_6();
        v150();
        OUTLINED_FUNCTION_63_1();
        goto LABEL_36;
      }
      uint64_t v98 = v235;
      uint64_t v99 = *(void *)(v235 + 16);
      uint64_t v238 = v235 + 16;
      v220[3] = v99;
      OUTLINED_FUNCTION_29_2();
      v100();
      sub_2250E4AA4(v3, &qword_2680C1140);
      sub_225106980();
      os_log_type_t v103 = *(void (**)(void))(v98 + 8);
      uint64_t v101 = v98 + 8;
      uint64_t v102 = v103;
      ((void (*)(char *, uint64_t))v103)(v53, v48);
      uint64_t v104 = sub_2251066E0();
      OUTLINED_FUNCTION_5_9((uint64_t)v64, 1, v104);
      if (v108)
      {
        os_log_type_t v96 = &qword_2680C1148;
        uint64_t v97 = (uint64_t)v64;
        goto LABEL_18;
      }
      uint64_t v235 = v101;
      sub_2251066C0();
      OUTLINED_FUNCTION_4_9();
      uint64_t v106 = *(void (**)(char *, uint64_t))(v105 + 8);
      v220[2] = v105 + 8;
      v106(v64, v104);
      uint64_t v107 = sub_225106790();
      OUTLINED_FUNCTION_5_9(v0, 1, v107);
      if (v108)
      {
        os_log_type_t v96 = &qword_2680C1150;
        uint64_t v97 = v0;
        goto LABEL_18;
      }
      v220[1] = v106;
      sub_225106780();
      OUTLINED_FUNCTION_4_9();
      OUTLINED_FUNCTION_5_6();
      v152();
      uint64_t v153 = (uint64_t)v241;
      OUTLINED_FUNCTION_5_9(v4, 1, (uint64_t)v241);
      uint64_t v109 = v240;
      if (v154) {
        goto LABEL_19;
      }
      OUTLINED_FUNCTION_68_1();
      OUTLINED_FUNCTION_18_3();
      v155();
      sub_225106AD0();
      if (__swift_getEnumTagSinglePayload(v58, 1, v48))
      {
        sub_2250E4AA4(v58, &qword_2680C1140);
        OUTLINED_FUNCTION_67_1();
      }
      else
      {
        OUTLINED_FUNCTION_29_2();
        v156();
        sub_2250E4AA4(v58, &qword_2680C1140);
        uint64_t v157 = v231;
        sub_225106980();
        OUTLINED_FUNCTION_49();
        v102();
        OUTLINED_FUNCTION_5_9(v157, 1, v104);
        uint64_t v4 = v255;
        if (!v108)
        {
          uint64_t v162 = v232;
          sub_2251066D0();
          OUTLINED_FUNCTION_5_6();
          v163();
          uint64_t v164 = OUTLINED_FUNCTION_58_2();
          OUTLINED_FUNCTION_5_9(v164, v165, v233);
          if (!v166)
          {
            OUTLINED_FUNCTION_18_3();
            v167();
            if (qword_2680C0698 != -1) {
              swift_once();
            }
            uint64_t v168 = sub_2251070F0();
            uint64_t v169 = __swift_project_value_buffer(v168, (uint64_t)qword_2680C5BC0);
            uint64_t v170 = v234;
            uint64_t v171 = v220[5];
            OUTLINED_FUNCTION_29_2();
            v172();
            uint64_t v238 = v169;
            uint64_t v173 = sub_2251070D0();
            os_log_type_t v174 = sub_225107380();
            if (OUTLINED_FUNCTION_38_2(v174))
            {
              uint64_t v175 = (uint8_t *)OUTLINED_FUNCTION_22_4();
              uint64_t v232 = OUTLINED_FUNCTION_21_3();
              v257[0] = v232;
              *(_DWORD *)uint64_t v175 = 136315138;
              uint64_t v176 = sub_225106760();
              uint64_t v178 = sub_2250B72A8(v176, v177, v257);
              OUTLINED_FUNCTION_57_1(v178);
              sub_225107420();
              swift_bridgeObjectRelease();
              uint64_t v235 = *(void *)(v170 + 8);
              OUTLINED_FUNCTION_33_2();
              v179();
              _os_log_impl(&dword_2250AF000, v173, (os_log_type_t)v153, "About to set locationName with bounded value: %s", v175, 0xCu);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_7_1();
              OUTLINED_FUNCTION_7_1();
            }
            else
            {
              uint64_t v235 = *(void *)(v170 + 8);
              ((void (*)(uint64_t, uint64_t))v235)(v171, v153);
            }

            uint64_t v180 = v224;
            uint64_t v181 = v220[8];
            uint64_t v182 = v220[7];
            sub_225106D50();
            swift_allocObject();
            sub_225106D40();
            uint64_t v183 = v220[6];
            sub_225106B10();
            uint64_t v184 = sub_225106750();
            OUTLINED_FUNCTION_5_9(v183, 1, v184);
            uint64_t v185 = v223;
            if (v108)
            {
              sub_2250E4AA4(v183, &qword_2680C1130);
              uint64_t v187 = 1;
            }
            else
            {
              sub_225106740();
              OUTLINED_FUNCTION_4_9();
              OUTLINED_FUNCTION_5_6();
              v186();
              sub_225106F20();
              uint64_t v187 = 0;
            }
            sub_225106F50();
            OUTLINED_FUNCTION_45_3(v182, v187);
            sub_225106CB0();
            swift_release();
            sub_2250E4AA4(v182, &qword_2680C0AB0);
            sub_225106B20();
            OUTLINED_FUNCTION_5_9(v181, 1, v184);
            if (v108)
            {
              sub_2250E4AA4(v181, &qword_2680C1130);
              uint64_t v190 = 1;
              uint64_t v189 = v221;
            }
            else
            {
              sub_225106740();
              OUTLINED_FUNCTION_4_9();
              OUTLINED_FUNCTION_5_6();
              v188();
              uint64_t v189 = v221;
              OUTLINED_FUNCTION_60_2();
              uint64_t v190 = 0;
            }
            OUTLINED_FUNCTION_45_3(v189, v190);
            sub_225106CC0();
            swift_release();
            sub_2250E4AA4(v189, &qword_2680C0AB0);
            uint64_t v191 = v222;
            sub_225106B00();
            uint64_t v192 = OUTLINED_FUNCTION_58_2();
            OUTLINED_FUNCTION_5_9(v192, v193, v184);
            if (v108)
            {
              sub_2250E4AA4(v191, &qword_2680C1130);
              uint64_t v195 = 1;
            }
            else
            {
              sub_225106740();
              OUTLINED_FUNCTION_4_9();
              OUTLINED_FUNCTION_5_6();
              v194();
              sub_225106F20();
              uint64_t v195 = 0;
            }
            uint64_t v196 = v229;
            OUTLINED_FUNCTION_45_3(v185, v195);
            sub_225106CD0();
            swift_release();
            sub_2250E4AA4(v185, &qword_2680C0AB0);
            sub_225106AF0();
            OUTLINED_FUNCTION_5_9(v180, 1, v184);
            if (v108)
            {
              sub_2250E4AA4(v180, &qword_2680C1130);
              uint64_t v198 = 1;
              uint64_t v184 = v225;
            }
            else
            {
              sub_225106740();
              OUTLINED_FUNCTION_4_9();
              OUTLINED_FUNCTION_5_6();
              v197();
              OUTLINED_FUNCTION_66_1();
              OUTLINED_FUNCTION_60_2();
              uint64_t v198 = 0;
            }
            OUTLINED_FUNCTION_45_3(v184, v198);
            sub_225106CA0();
            swift_release();
            sub_2250E4AA4(v184, &qword_2680C0AB0);
            sub_225106D10();
            swift_release();
            uint64_t v199 = sub_225106D30();
            swift_release();
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            id v201 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
            sub_225106EC0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_22510C7A0;
            *(void *)(inited + 32) = 0x746361746E6F63;
            *(void *)(inited + 40) = 0xE700000000000000;
            uint64_t v203 = sub_225106DE0();
            *(void *)(inited + 48) = v199;
            *(void *)(inited + 72) = v203;
            strcpy((char *)(inited + 80), "addressLabel");
            *(unsigned char *)(inited + 93) = 0;
            *(_WORD *)(inited + 94) = -5120;
            swift_retain();
            uint64_t v204 = sub_225106760();
            *(void *)(inited + 120) = MEMORY[0x263F8D310];
            *(void *)(inited + 96) = v204;
            *(void *)(inited + 104) = v205;
            sub_225107170();
            sub_225106E90();
            memset(v257, 0, 40);
            v206 = (void *)sub_225106E80();
            sub_2251070B0();
            sub_225106EB0();
            swift_bridgeObjectRelease();

            OUTLINED_FUNCTION_63_1();
            OUTLINED_FUNCTION_5_6();
            v207();
            sub_2250E4AA4((uint64_t)v257, &qword_2680C0D20);
            sub_225107890();
            if (v208)
            {
              swift_bridgeObjectRetain_n();
              v209 = sub_2251070D0();
              os_log_type_t v210 = sub_225107380();
              if (os_log_type_enabled(v209, v210))
              {
                v211 = (uint8_t *)OUTLINED_FUNCTION_22_4();
                v257[0] = OUTLINED_FUNCTION_21_3();
                *(_DWORD *)v211 = 136315138;
                uint64_t v4 = (uint64_t)(v211 + 4);
                swift_bridgeObjectRetain();
                uint64_t v212 = OUTLINED_FUNCTION_47_2();
                uint64_t v215 = sub_2250B72A8(v212, v213, v214);
                OUTLINED_FUNCTION_57_1(v215);
                OUTLINED_FUNCTION_67_1();
                uint64_t v109 = v240;
                sub_225107420();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_2250AF000, v209, v210, "Setting locationName to %s", v211, 0xCu);
                OUTLINED_FUNCTION_46_4();
                uint64_t v196 = v229;
                OUTLINED_FUNCTION_7_1();
                OUTLINED_FUNCTION_7_1();
              }
              else
              {

                swift_bridgeObjectRelease_n();
                uint64_t v196 = v229;
              }
              OUTLINED_FUNCTION_47_2();
              v216 = v254;
              sub_225106AA0();
              swift_release();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_55_1();
            }
            else
            {
              v216 = sub_2251070D0();
              os_log_type_t v217 = sub_225107380();
              if (os_log_type_enabled(v216, v217))
              {
                v218 = (uint8_t *)OUTLINED_FUNCTION_6_2();
                *(_WORD *)v218 = 0;
                _os_log_impl(&dword_2250AF000, v216, v217, "result from cat is nil", v218, 2u);
                OUTLINED_FUNCTION_7_1();
              }
              swift_release();

              OUTLINED_FUNCTION_55_1();
            }

            sub_2250E4AA4(v196, (uint64_t *)&unk_2680C1200);
            OUTLINED_FUNCTION_5_6();
            v219();
            OUTLINED_FUNCTION_49();
            ((void (*)(void))v216)();
            goto LABEL_45;
          }
LABEL_44:
          OUTLINED_FUNCTION_52_3();
          v161();
          sub_2250E4AA4(v162, &qword_2680C1138);
LABEL_45:
          p_NumFields = (_DWORD *)(&reflection metadata field descriptor LocationResolverFlow + 12);
          goto LABEL_20;
        }
        sub_2250E4AA4(v157, &qword_2680C1148);
      }
      uint64_t v162 = v232;
      uint64_t v158 = OUTLINED_FUNCTION_58_2();
      __swift_storeEnumTagSinglePayload(v158, v159, 1, v160);
      goto LABEL_44;
    }
    swift_release();
    sub_2250E4AA4(v2, &qword_2680C0F88);
    unint64_t v83 = 0x2680C0000uLL;
  }
  if (*(void *)(v83 + 1688) != -1) {
    swift_once();
  }
  uint64_t v84 = sub_2251070F0();
  int v85 = (void *)OUTLINED_FUNCTION_33(v84, (uint64_t)qword_2680C5BC0);
  os_log_type_t v86 = sub_225107390();
  if (OUTLINED_FUNCTION_22_2(v86))
  {
    uint64_t v87 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v87);
    OUTLINED_FUNCTION_6_4(&dword_2250AF000, v88, v89, "serverConversion and nlIntent are nil, returning early from handleLocationResolved");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250ECE84();
  OUTLINED_FUNCTION_12_4();
  swift_release();
  uint64_t v90 = OUTLINED_FUNCTION_44_4();
  v91(v90);
  OUTLINED_FUNCTION_48_2();
LABEL_36:
  OUTLINED_FUNCTION_5_6();
  v151();
  OUTLINED_FUNCTION_5_4();
}

void (*sub_2250F1498())()
{
  return sub_2250F2AE4;
}

void sub_2250F14D8()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v39 = v2;
  sub_225106380();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_7();
  uint64_t v38 = v4;
  sub_2251065C0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_29_3();
  sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v7;
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_49_2();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0F88);
  uint64_t v10 = OUTLINED_FUNCTION_9(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_20_4();
  uint64_t v11 = sub_225106670();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_38_1();
  uint64_t v13 = sub_2250EBE50();
  if (v13)
  {
    uint64_t v14 = v13;
    sub_2250EBD9C(v1);
    OUTLINED_FUNCTION_5_9(v1, 1, v11);
    if (!v15)
    {
      OUTLINED_FUNCTION_18_3();
      v22();
      uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_2680C1240) + 48);
      OUTLINED_FUNCTION_29_2();
      v24();
      *(void *)(v0 + v23) = v14;
      (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))(v0, *MEMORY[0x263F6FF78], v37);
      OUTLINED_FUNCTION_29_2();
      v25();
      swift_retain();
      sub_2251065B0();
      sub_225105FC0();
      OUTLINED_FUNCTION_5_6();
      v26();
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_2251070F0();
      __swift_project_value_buffer(v27, (uint64_t)qword_2680C5BC0);
      swift_retain_n();
      uint64_t v28 = sub_2251070D0();
      os_log_type_t v29 = sub_225107380();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = swift_slowAlloc();
        uint64_t v40 = OUTLINED_FUNCTION_21_3();
        *(_DWORD *)uint64_t v30 = 67109378;
        sub_225107420();
        *(_WORD *)(v30 + 8) = 2080;
        sub_225105FD0();
        sub_2250F2A94();
        uint64_t v31 = sub_2251077A0();
        sub_2250B72A8(v31, v32, &v40);
        sub_225107420();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2250AF000, v28, v29, "nextFlowOn: %{BOOL}d, flow is: %s", (uint8_t *)v30, 0x12u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_7_1();
      }
      else
      {

        swift_release_n();
      }
      sub_2250ECE84();
      sub_225106350();
      swift_release();
      v39(v38);
      swift_release();
      OUTLINED_FUNCTION_5_6();
      v33();
      OUTLINED_FUNCTION_5_6();
      v34();
      goto LABEL_16;
    }
    swift_release();
    sub_2250E4AA4(v1, &qword_2680C0F88);
  }
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2251070F0();
  uint64_t v17 = (void *)OUTLINED_FUNCTION_33(v16, (uint64_t)qword_2680C5BC0);
  os_log_type_t v18 = sub_225107390();
  if (OUTLINED_FUNCTION_22_2(v18))
  {
    uint64_t v19 = (_WORD *)OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_19_1(v19);
    OUTLINED_FUNCTION_6_4(&dword_2250AF000, v20, v21, "serverConversion and nlIntent are nil, returning early from passThroughIntent");
    OUTLINED_FUNCTION_7_1();
  }

  sub_2250ECE84();
  OUTLINED_FUNCTION_12_4();
  swift_release();
  v39(v38);
LABEL_16:
  OUTLINED_FUNCTION_5_6();
  v35();
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_2250F1A7C(void (*a1)(uint64_t))
{
  sub_225106380();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_38_1();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2251070F0();
  uint64_t v5 = OUTLINED_FUNCTION_33(v4, (uint64_t)qword_2680C5BC0);
  os_log_type_t v6 = sub_225107380();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_6_2();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2250AF000, v5, v6, "[LocationResolverFlow::execute] completed, returning .complete()", v7, 2u);
    OUTLINED_FUNCTION_7_1();
  }

  sub_225106370();
  a1(v1);
  OUTLINED_FUNCTION_47_2();
  OUTLINED_FUNCTION_33_2();
  return v8();
}

uint64_t LocationResolverFlow.deinit()
{
  swift_release();
  OUTLINED_FUNCTION_45_2();
  OUTLINED_FUNCTION_39_4();
  type metadata accessor for LocationResolverFlow.State();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v1();
  sub_225105F00();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v2();
  sub_225105F50();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v3();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_5_6();
  v4();
  sub_2250E4AA4(v0 + *(void *)(*(void *)v0 + 136), &qword_2680C0F88);
  OUTLINED_FUNCTION_45_2();
  swift_release();
  return v0;
}

uint64_t LocationResolverFlow.__deallocating_deinit()
{
  LocationResolverFlow.deinit();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_2250F1DA0()
{
  return 1;
}

void sub_2250F1DC8()
{
}

uint64_t sub_2250F1DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for LocationResolverFlow();
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t type metadata accessor for LocationResolverFlow.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for LocationResolverFlow.FeatureFlags()
{
  return __swift_instantiateGenericMetadata();
}

void sub_2250F1E5C()
{
  type metadata accessor for LocationResolverFlow.State();
  if (v0 <= 0x3F)
  {
    sub_225105F00();
    if (v1 <= 0x3F)
    {
      sub_225105F50();
      if (v2 <= 0x3F)
      {
        swift_checkMetadataState();
        if (v3 <= 0x3F)
        {
          sub_2250DF290();
          if (v4 <= 0x3F) {
            swift_initClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t type metadata accessor for LocationResolverFlow()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LocationResolverFlow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocationResolverFlow);
}

uint64_t dispatch thunk of LocationResolverFlow.__allocating_init(nextFlow:resolutionStrategy:locale:timeZone:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of LocationResolverFlow.on(input:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of LocationResolverFlow.execute(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

unsigned char *sub_2250F2088(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2250F2124);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250F214C()
{
  uint64_t result = sub_225106AE0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2250F21C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_225106AE0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_2250F22C0(uint64_t a1)
{
  uint64_t v2 = sub_225106AE0();
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 3, v2);
  if (!result)
  {
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_2250F2348(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_225106AE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 3, v6);
  }
  return a1;
}

void *sub_2250F2408(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_225106AE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 3, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 3, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 3, v6);
  return a1;
}

void *sub_2250F2550(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_225106AE0();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 3, v6);
  }
  return a1;
}

void *sub_2250F2610(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_225106AE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 3, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 3, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 3, v6);
  return a1;
}

uint64_t sub_2250F2758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2250F276C);
}

uint64_t sub_2250F276C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_225106AE0();
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 4) {
    return EnumTagSinglePayload - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_2250F27B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2250F27C8);
}

uint64_t sub_2250F27C8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_225106AE0();
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_2250F2828(uint64_t a1)
{
  uint64_t v2 = sub_225106AE0();
  return __swift_getEnumTagSinglePayload(a1, 3, v2);
}

uint64_t sub_2250F286C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_225106AE0();
  return __swift_storeEnumTagSinglePayload(a1, a2, 3, v4);
}

uint64_t sub_2250F28B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2250F28D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2250F2928()
{
  uint64_t v1 = sub_225106AE0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 40) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_2250F29CC(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_225106AE0() - 8);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_2250EE908(a1, v4, v5);
}

uint64_t sub_2250F2A40()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2250F2A80(uint64_t a1)
{
  return sub_2250EF44C(a1, *(void *)(v1 + 16), *(void (**)(char *))(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_2250F2A94()
{
  unint64_t result = qword_2680C10C8;
  if (!qword_2680C10C8)
  {
    sub_225105FD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C10C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_8_7@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_225106350();
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_27_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_3(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_36_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 2u);
}

BOOL OUTLINED_FUNCTION_38_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_3(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_46_4()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_2(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t OUTLINED_FUNCTION_57_1(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return sub_225106F20();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return swift_release_n();
}

void *sub_2250F2DD8()
{
  uint64_t v1 = v0;
  sub_225107130();
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v3;
  uint64_t v32 = v2;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v28 - v6;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F648F0]), sel_init);
  uint64_t v8 = sub_2251071E0();
  sub_2250F37FC(v8, v9, v7);
  sub_2250C6950(0, &qword_2680C1608);
  uint64_t v10 = (void *)sub_2251073D0();
  objc_msgSend(v7, sel_setMaxAge_, v10);

  uint64_t v28 = v1 + *(int *)(type metadata accessor for LocationService() + 20);
  id v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, sub_2250F31C4());
  objc_msgSend(v7, sel_setSearchTimeout_, v11);

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  sub_2250BAB54(v1, (uint64_t)v33);
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = v13;
  sub_2250C6950(0, &qword_2680C1610);
  char v15 = v12;
  swift_retain();
  sub_225106440();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  uint64_t v16 = v29;
  sub_225107120();
  uint64_t v17 = v30;
  MEMORY[0x22A62C3A0](v16, v28);
  os_log_type_t v18 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v19 = v16;
  uint64_t v20 = v32;
  v18(v19, v32);
  sub_2251073B0();
  v18(v17, v20);
  if (sub_225107110())
  {
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2251070F0();
    __swift_project_value_buffer(v21, (uint64_t)qword_2680C5BC0);
    uint64_t v22 = sub_2251070D0();
    os_log_type_t v23 = sub_225107390();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_2250AF000, v22, v23, "could not acquire location within the specified timeout", v24, 2u);
      MEMORY[0x22A62D170](v24, -1, -1);
      swift_release();
    }
    else
    {
      swift_release();
    }
    return 0;
  }
  else
  {

    swift_beginAccess();
    uint64_t v25 = *(void **)(v13 + 16);
    id v26 = v25;
    swift_release();
  }
  return v25;
}

double sub_2250F31C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_225107100();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v1, v2);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v2);
  if (v8 == *MEMORY[0x263F8F018])
  {
    uint64_t v9 = OUTLINED_FUNCTION_0_6();
    v10(v9);
    return OUTLINED_FUNCTION_2_6();
  }
  if (v8 == *MEMORY[0x263F8F000])
  {
    uint64_t v12 = OUTLINED_FUNCTION_0_6();
    v13(v12);
    double v14 = OUTLINED_FUNCTION_2_6();
    double v15 = 1000.0;
  }
  else if (v8 == *MEMORY[0x263F8EFE8])
  {
    uint64_t v16 = OUTLINED_FUNCTION_0_6();
    v17(v16);
    double v14 = OUTLINED_FUNCTION_2_6();
    double v15 = 100000.0;
  }
  else
  {
    if (v8 != *MEMORY[0x263F8EFE0])
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
      return 9.22337204e18;
    }
    uint64_t v18 = OUTLINED_FUNCTION_0_6();
    v19(v18);
    double v14 = OUTLINED_FUNCTION_2_6();
    double v15 = 100000000.0;
  }
  return v14 / v15;
}

uint64_t sub_2250F3348()
{
  uint64_t v0 = sub_225107100();
  __swift_allocate_value_buffer(v0, qword_2680C5BA8);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_2680C5BA8) = 50;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v1();
}

void sub_2250F33D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225106480();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1618);
  MEMORY[0x270FA5388](v13);
  double v15 = (void **)((char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250F3928(a1, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void **, uint64_t))(v7 + 32))(v12, v15, v6);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v32 = a2;
    uint64_t v16 = sub_2251070F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_2680C5BC0);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    uint64_t v17 = sub_2251070D0();
    os_log_type_t v18 = sub_225107380();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v34[0] = v31;
      *(_DWORD *)uint64_t v19 = 136315138;
      sub_2250F3990();
      uint64_t v20 = sub_2251077F0();
      uint64_t v33 = sub_2250B72A8(v20, v21, v34);
      sub_225107420();
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
      v22(v10, v6);
      _os_log_impl(&dword_2250AF000, v17, v18, "Error getting current location: %s", v19, 0xCu);
      uint64_t v23 = v31;
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v23, -1, -1);
      MEMORY[0x22A62D170](v19, -1, -1);
    }
    else
    {
      uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
      v22(v10, v6);
    }

    sub_2251073C0();
    v22(v12, v6);
  }
  else
  {
    uint64_t v24 = (id *)(a3 + 16);
    uint64_t v25 = *v15;
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F678F0]), sel_init);
    swift_beginAccess();
    id v27 = *v24;
    *uint64_t v24 = v26;

    swift_beginAccess();
    if (*v24)
    {
      id v28 = *v24;
      objc_msgSend(v25, sel_latitude);
      objc_msgSend(v28, sel_setLat_);
    }
    swift_beginAccess();
    if (*v24)
    {
      id v29 = *v24;
      objc_msgSend(v25, sel_longitude);
      objc_msgSend(v29, sel_setLng_);
    }
    sub_2251073C0();
  }
}

void sub_2250F37FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2251071A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDesiredAccuracy_, v4);
}

uint64_t type metadata accessor for LocationService()
{
  uint64_t result = qword_2680C1628;
  if (!qword_2680C1628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2250F38A8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2250F38E0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2250F3920(uint64_t a1)
{
  sub_2250F33D8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2250F3928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2250F3990()
{
  unint64_t result = qword_2680C1620;
  if (!qword_2680C1620)
  {
    sub_225106480();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1620);
  }
  return result;
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

void *sub_2250F3A44(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_225107100();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return v4;
}

uint64_t sub_2250F3B4C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_225107100();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_2250F3BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_225107100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t *sub_2250F3C70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_225107100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_2250F3CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_225107100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_2250F3D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_225107100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_2250F3E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2250F3E18);
}

uint64_t sub_2250F3E18(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_225107100();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_2250F3EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2250F3EB4);
}

uint64_t sub_2250F3EB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_225107100();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_2250F3F34()
{
  uint64_t result = sub_225107100();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return v0;
}

double OUTLINED_FUNCTION_2_6()
{
  return (double)*v0;
}

uint64_t sub_2250F3FF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  id v4 = sub_2250B568C(0, 0);
  if (!v4) {
    return a3(MEMORY[0x263F8EE78], 0);
  }
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22510C2B0;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22510C2B0;
  *(void *)(v7 + 32) = v5;
  uint64_t v14 = v7;
  sub_225107300();
  id v8 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v9 = sub_225107890();
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0xE000000000000000;
  }
  sub_2250F49C4();
  *(void *)(v6 + 32) = sub_22510563C(v14, v11, v12);
  sub_225107300();
  a3(v6, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2250F416C(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[MissingMeCardViewBuilder] Constructing no error punchout for Watch.");
}

uint64_t sub_2250F4178(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v3;
  sub_2251070C0();
  OUTLINED_FUNCTION_1_9();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_7();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2251070F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_2680C5BC0);
  uint64_t v13 = sub_2251070D0();
  os_log_type_t v14 = sub_225107380();
  if (os_log_type_enabled(v13, v14))
  {
    double v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v15 = 0;
    _os_log_impl(&dword_2250AF000, v13, v14, "[MissingMeCardViewBuilder] Constructing punchout button for macOS.", v15, 2u);
    MEMORY[0x22A62D170](v15, -1, -1);
  }

  sub_225106EC0();
  sub_225107170();
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a1;
  v16[4] = a2;
  sub_225106E90();
  swift_retain();
  swift_retain();
  uint64_t v17 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v2);
  return sub_2250C68F0((uint64_t)v20);
}

uint64_t sub_2250F4408(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  return sub_2250F3FF0(a2 + 56, a1, a3);
}

uint64_t sub_2250F4434(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[MissingMeCardViewBuilder] Constructing no error punchout for CarPlay.");
}

uint64_t sub_2250F4440(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[MissingMeCardViewBuilder] Constructing no error punchout for CarDND.");
}

uint64_t sub_2250F444C(uint64_t a1, void (*a2)(void, void), uint64_t a3, const char *a4)
{
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2251070F0();
  __swift_project_value_buffer(v6, (uint64_t)qword_2680C5BC0);
  uint64_t v7 = sub_2251070D0();
  os_log_type_t v8 = sub_225107380();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_2250AF000, v7, v8, a4, v9, 2u);
    MEMORY[0x22A62D170](v9, -1, -1);
  }

  sub_2250E33D4(MEMORY[0x263F8EE78], 0, a2);
  return swift_release();
}

uint64_t sub_2250F4560(uint64_t a1, uint64_t a2)
{
  sub_2251070C0();
  OUTLINED_FUNCTION_1_9();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_0_7();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2251070F0();
  __swift_project_value_buffer(v11, (uint64_t)qword_2680C5BC0);
  uint64_t v12 = sub_2251070D0();
  os_log_type_t v13 = sub_225107380();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    _os_log_impl(&dword_2250AF000, v12, v13, "[MissingMeCardViewBuilder] Constructing punchout button for iOS.", v14, 2u);
    MEMORY[0x22A62D170](v14, -1, -1);
  }

  sub_225106EC0();
  sub_225107170();
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  sub_225106E90();
  swift_retain();
  uint64_t v16 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_bridgeObjectRelease();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v2);
  return sub_2250C68F0((uint64_t)v18);
}

uint64_t sub_2250F47DC(uint64_t a1, void (*a2)(uint64_t, void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22510C2B0;
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22510C2B0;
  *(void *)(v4 + 32) = sub_2250B59E8();
  sub_225107300();
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v6 = sub_225107890();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0xE000000000000000;
  }
  sub_2250F49C4();
  *(void *)(v3 + 32) = sub_22510563C(v5, v8, v9);
  sub_225107300();
  a2(v3, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250F4920()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2250F4A50(v0 + 56);
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for MissingMeCardViewBuilder()
{
  return self;
}

uint64_t sub_2250F4984()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2250F49BC(uint64_t a1)
{
  return sub_2250F47DC(a1, *(void (**)(uint64_t, void))(v1 + 16));
}

unint64_t sub_2250F49C4()
{
  unint64_t result = qword_2680C1638;
  if (!qword_2680C1638)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2680C1638);
  }
  return result;
}

uint64_t sub_2250F4A04()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2250F4A44(uint64_t a1)
{
  return sub_2250F4408(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t, void))(v1 + 24));
}

uint64_t sub_2250F4A50(uint64_t a1)
{
  return a1;
}

uint64_t sub_2250F4AEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v3 = v2 == 0;
  return !a2 || v3;
}

uint64_t sub_2250F4B14(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_8(a1, qword_2680C5BC0);
}

uint64_t sub_2250F4B34(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_8(a1, qword_2680C5BD8);
}

uint64_t sub_2250F4B54(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_8(a1, qword_2680C5BF0);
}

uint64_t sub_2250F4B74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2251070F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2251070E0();
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t *a2)
{
  return sub_2250F4B74(a1, a2);
}

uint64_t sub_2250F4BFC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for PeopleAndAppSelectionPatternGenerator()
{
  return self;
}

uint64_t sub_2250F4C60(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225105DD0();
  id v7 = objc_msgSend(a1, sel_namePrefix);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105D60();
  id v8 = objc_msgSend(a1, sel_givenName);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105D10();
  id v9 = objc_msgSend(a1, sel_middleName);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105D50();
  id v10 = objc_msgSend(a1, sel_nickname);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105DC0();
  id v11 = objc_msgSend(a1, sel_familyName);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105D30();
  id v12 = objc_msgSend(a1, sel_nameSuffix);
  sub_2251071E0();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_9();
  sub_225105D70();
  sub_2250B64C0(a2, (uint64_t)v6);
  sub_225105D90();

  return sub_2250F4E24(a2);
}

uint64_t sub_2250F4E24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return v0;
}

void OUTLINED_FUNCTION_1_10()
{
}

uint64_t static PhonemeDataParser.parse(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = sub_225107210();
  uint64_t v4 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2251070F0();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2680C5BC0);
  id v9 = a1;
  id v10 = sub_2251070D0();
  os_log_type_t v11 = sub_225107380();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v32 = a2;
    uint64_t v14 = v13;
    uint64_t v36 = v13;
    uint64_t v31 = v8;
    *(_DWORD *)id v12 = 136315138;
    uint64_t v34 = sub_2250F5958(v9);
    uint64_t v35 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1600);
    uint64_t v16 = sub_225107220();
    uint64_t v34 = sub_2250B72A8(v16, v17, &v36);
    sub_225107420();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v10, v11, "[PhonemeDataParser] phonemeData: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v14;
    a2 = v32;
    MEMORY[0x22A62D170](v18, -1, -1);
    MEMORY[0x22A62D170](v12, -1, -1);
  }
  else
  {
  }
  sub_2250F5958(v9);
  if (v19
    && (sub_225107200(),
        uint64_t v20 = sub_2251071F0(),
        unint64_t v22 = v21,
        swift_bridgeObjectRelease(),
        uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v33),
        v22 >> 60 != 15))
  {
    id v29 = sub_2250B6370(v23);
    sub_2250F5274(v29, v30, a2);
    swift_bridgeObjectRelease();
    return sub_2250F59BC(v20, v22);
  }
  else
  {
    uint64_t v24 = sub_2251070D0();
    os_log_type_t v25 = sub_225107380();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_2250AF000, v24, v25, "phonemeData string is empty", v26, 2u);
      MEMORY[0x22A62D170](v26, -1, -1);
    }

    uint64_t v27 = sub_225106F10();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v27);
  }
}

uint64_t sub_2250F5234()
{
  sub_225105BE0();
  swift_allocObject();
  uint64_t result = sub_225105BD0();
  qword_2680C1640 = result;
  return result;
}

uint64_t sub_2250F5274@<X0>(NSObject *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v51 = (char *)a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AC0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225106F10();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  os_log_type_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v44 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v44 - v15;
  if (qword_2680C06B0 != -1) {
    swift_once();
  }
  sub_2250F59D0();
  sub_225105BC0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_2250F5A20((uint64_t)v6);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2251070F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_2680C5BC0);
    uint64_t v18 = sub_2251070D0();
    os_log_type_t v19 = sub_225107390();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2250AF000, v18, v19, "[PhonemeDataParser] Couldn't parse phonemeData", v20, 2u);
      MEMORY[0x22A62D170](v20, -1, -1);
    }

LABEL_9:
    uint64_t v21 = 1;
    return __swift_storeEnumTagSinglePayload((uint64_t)v51, v21, 1, v7);
  }
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v49 = v8 + 32;
  v48(v16, v6, v7);
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_2251070F0();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_2680C5BC0);
  swift_bridgeObjectRetain_n();
  os_log_type_t v25 = sub_2251070D0();
  os_log_type_t v26 = sub_225107380();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v47 = v24;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v52[1] = a2;
    uint64_t v53 = v46;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v44 = v27 + 4;
    uint64_t v45 = v27;
    v52[0] = (uint64_t)v50;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1600);
    uint64_t v28 = sub_225107220();
    v52[0] = sub_2250B72A8(v28, v29, &v53);
    sub_225107420();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_type_t v30 = v26;
    uint64_t v31 = v45;
    _os_log_impl(&dword_2250AF000, v25, v30, "[PhonemeDataParser] fullName: %s", v45, 0xCu);
    uint64_t v32 = v46;
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v32, -1, -1);
    MEMORY[0x22A62D170](v31, -1, -1);

    if (!a2) {
      goto LABEL_20;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2)
    {
LABEL_20:
      uint64_t v41 = sub_2251070D0();
      os_log_type_t v42 = sub_225107390();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_2250AF000, v41, v42, "[PhonemeDataParser] phonemeData checksum is invalid", v43, 2u);
        MEMORY[0x22A62D170](v43, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
      goto LABEL_9;
    }
  }
  if ((sub_225106F00() & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v33(v14, v16, v7);
  uint64_t v34 = sub_2251070D0();
  os_log_type_t v35 = sub_225107380();
  uint64_t v50 = v34;
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v52[0] = v47;
    *(_DWORD *)uint64_t v36 = 136315138;
    uint64_t v46 = (uint64_t)(v36 + 4);
    v33(v11, v14, v7);
    uint64_t v37 = sub_225107220();
    uint64_t v53 = sub_2250B72A8(v37, v38, v52);
    sub_225107420();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
    uint64_t v39 = v50;
    _os_log_impl(&dword_2250AF000, v50, v35, "[PhonemeDataParser] after: %s", v36, 0xCu);
    uint64_t v40 = v47;
    swift_arrayDestroy();
    MEMORY[0x22A62D170](v40, -1, -1);
    MEMORY[0x22A62D170](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  }
  v48(v51, v16, v7);
  uint64_t v21 = 0;
  return __swift_storeEnumTagSinglePayload((uint64_t)v51, v21, 1, v7);
}

uint64_t sub_2250F5958(void *a1)
{
  id v1 = objc_msgSend(a1, sel_phonemeData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2251071E0();

  return v3;
}

uint64_t sub_2250F59BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2250D1388(a1, a2);
  }
  return a1;
}

unint64_t sub_2250F59D0()
{
  unint64_t result = qword_2680C1648;
  if (!qword_2680C1648)
  {
    sub_225106F10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1648);
  }
  return result;
}

uint64_t sub_2250F5A20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2250F5A80(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510BA10;
  *(void *)(inited + 32) = 0x6E6F697461636F6CLL;
  *(void *)(inited + 40) = 0xE800000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1650);
  uint64_t v3 = swift_initStackObject();
  *(_OWORD *)(v3 + 16) = xmmword_22510BA10;
  *(void *)(v3 + 32) = 0x7365756C6176;
  *(void *)(v3 + 40) = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1658);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22510BA10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1660);
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_22510BA10;
  *(void *)(v5 + 32) = 0x73736572646461;
  *(void *)(v5 + 40) = 0xE700000000000000;
  id v6 = objc_msgSend(a1, sel__geoMapItem);
  if (v6
    && (id v7 = objc_msgSend(v6, sel_addressDictionary),
        swift_unknownObjectRelease(),
        v7))
  {
    uint64_t v8 = sub_225107160();
  }
  else
  {
    uint64_t v8 = sub_225107170();
  }
  uint64_t v9 = sub_2250F5CD0(v8);
  swift_bridgeObjectRelease();
  *(void *)(v5 + 48) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1668);
  *(void *)(v4 + 32) = sub_225107170();
  *(void *)(v3 + 48) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1670);
  uint64_t v10 = sub_225107170();
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1678);
  *(void *)(inited + 48) = v10;
  return sub_225107170();
}

uint64_t sub_2250F5CD0(uint64_t a1)
{
  sub_2250F66B4(a1, v58);
  uint64_t v2 = v58[0];
  uint64_t v48 = a1;
  uint64_t v49 = v58[1];
  int64_t v3 = v58[3];
  unint64_t v4 = v58[4];
  int64_t v5 = (unint64_t)(v58[2] + 64) >> 6;
  swift_bridgeObjectRetain_n();
  uint64_t v6 = MEMORY[0x263F8EE78];
  while (1)
  {
    if (v4)
    {
      unint64_t v7 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v8 = v7 | (v3 << 6);
      goto LABEL_22;
    }
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      uint64_t result = sub_2251077E0();
      __break(1u);
      return result;
    }
    if (v9 >= v5) {
      goto LABEL_30;
    }
    unint64_t v10 = *(void *)(v49 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v5) {
        goto LABEL_30;
      }
      unint64_t v10 = *(void *)(v49 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v5) {
          goto LABEL_30;
        }
        unint64_t v10 = *(void *)(v49 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v5) {
            goto LABEL_30;
          }
          unint64_t v10 = *(void *)(v49 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v3 + 5;
            if (v3 + 5 >= v5) {
              goto LABEL_30;
            }
            unint64_t v10 = *(void *)(v49 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v3 + 6;
              if (v3 + 6 >= v5) {
                goto LABEL_30;
              }
              unint64_t v10 = *(void *)(v49 + 8 * v11);
              if (!v10) {
                break;
              }
            }
          }
        }
      }
    }
LABEL_21:
    unint64_t v4 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    int64_t v3 = v11;
LABEL_22:
    sub_2250F66EC(*(void *)(v2 + 48) + 40 * v8, (uint64_t)&v55);
    v53[0] = v55;
    v53[1] = v56;
    uint64_t v54 = v57;
    sub_2250F66EC((uint64_t)v53, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      v50[0] = 0uLL;
    }
    sub_2250F6748((uint64_t)v53);
    uint64_t v13 = *((void *)&v50[0] + 1);
    if (*((void *)&v50[0] + 1))
    {
      uint64_t v14 = *(void *)&v50[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_225102D8C(0, *(void *)(v6 + 16) + 1, 1, v6);
        uint64_t v6 = v18;
      }
      unint64_t v16 = *(void *)(v6 + 16);
      unint64_t v15 = *(void *)(v6 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_225102D8C(v15 > 1, v16 + 1, 1, v6);
        uint64_t v6 = v19;
      }
      *(void *)(v6 + 16) = v16 + 1;
      uint64_t v17 = v6 + 16 * v16;
      *(void *)(v17 + 32) = v14;
      *(void *)(v17 + 40) = v13;
    }
  }
  int64_t v12 = v3 + 7;
  while (v12 < v5)
  {
    unint64_t v10 = *(void *)(v49 + 8 * v12++);
    if (v10)
    {
      int64_t v11 = v12 - 1;
      goto LABEL_21;
    }
  }
LABEL_30:
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v20 = (void *)sub_225107170();
  uint64_t v21 = *(void *)(v6 + 16);
  if (v21)
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = (unint64_t *)(v6 + 40);
    do
    {
      uint64_t v23 = *(v22 - 1);
      unint64_t v24 = *v22;
      swift_bridgeObjectRetain_n();
      sub_2250F62B8(1);
      uint64_t v25 = sub_225107400();
      uint64_t v27 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_2250F6378(1uLL, v23, v24);
      *(void *)&v53[0] = v25;
      *((void *)&v53[0] + 1) = v27;
      *(void *)&long long v55 = v28;
      *((void *)&v55 + 1) = v29;
      *(void *)&long long v56 = v30;
      *((void *)&v56 + 1) = v31;
      sub_2250F679C();
      swift_bridgeObjectRetain();
      sub_225107260();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2251074C0();
      *(void *)&long long v51 = v23;
      *((void *)&v51 + 1) = v24;
      swift_bridgeObjectRetain();
      sub_2251074C0();
      if (*(void *)(v48 + 16) && (unint64_t v32 = sub_2250F64C4((uint64_t)v53), (v33 & 1) != 0))
      {
        sub_2250B7A60(*(void *)(v48 + 56) + 32 * v32, (uint64_t)&v51);
      }
      else
      {
        long long v51 = 0u;
        long long v52 = 0u;
      }
      sub_2250F6748((uint64_t)v53);
      if (*((void *)&v52 + 1))
      {
        sub_2250BADA0(&v51, v50);
        swift_isUniquelyReferenced_nonNull_native();
        unint64_t v34 = sub_2250F64C4((uint64_t)&v55);
        if (__OFADD__(v20[2], (v35 & 1) == 0)) {
          goto LABEL_54;
        }
        unint64_t v36 = v34;
        char v37 = v35;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1688);
        if (sub_2251075D0())
        {
          unint64_t v38 = sub_2250F64C4((uint64_t)&v55);
          if ((v37 & 1) != (v39 & 1)) {
            goto LABEL_56;
          }
          unint64_t v36 = v38;
        }
        if (v37)
        {
          uint64_t v40 = (_OWORD *)(v20[7] + 32 * v36);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
          sub_2250BADA0(v50, v40);
        }
        else
        {
          v20[(v36 >> 6) + 8] |= 1 << v36;
          sub_2250F66EC((uint64_t)&v55, v20[6] + 40 * v36);
          sub_2250BADA0(v50, (_OWORD *)(v20[7] + 32 * v36));
          uint64_t v44 = v20[2];
          BOOL v45 = __OFADD__(v44, 1);
          uint64_t v46 = v44 + 1;
          if (v45) {
            goto LABEL_55;
          }
          _OWORD v20[2] = v46;
        }
        swift_bridgeObjectRelease();
        sub_2250F6748((uint64_t)&v55);
      }
      else
      {
        sub_2250BAC08((uint64_t)&v51);
        swift_bridgeObjectRetain();
        unint64_t v41 = sub_2250F64C4((uint64_t)&v55);
        char v43 = v42;
        swift_bridgeObjectRelease();
        if (v43)
        {
          swift_isUniquelyReferenced_nonNull_native();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1688);
          sub_2251075D0();
          sub_2250F6748(v20[6] + 40 * v41);
          sub_2250BADA0((_OWORD *)(v20[7] + 32 * v41), v50);
          sub_2251075E0();
          swift_bridgeObjectRelease();
        }
        else
        {
          memset(v50, 0, sizeof(v50));
        }
        sub_2250F6748((uint64_t)&v55);
        sub_2250BAC08((uint64_t)v50);
      }
      swift_bridgeObjectRelease();
      v22 += 2;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v20;
}

uint64_t sub_2250F62B8(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_225107250();
    uint64_t v1 = sub_2251072A0();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

unint64_t sub_2250F6378(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    uint64_t result = sub_225107250();
    if (v6) {
      uint64_t result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = sub_2251072A0();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2250F644C(uint64_t a1, uint64_t a2)
{
  sub_225107850();
  sub_225107240();
  uint64_t v4 = sub_225107880();
  return sub_2250F6508(a1, a2, v4);
}

unint64_t sub_2250F64C4(uint64_t a1)
{
  uint64_t v2 = sub_2251074A0();
  return sub_2250F65EC(a1, v2);
}

unint64_t sub_2250F6508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2251077B0() & 1) == 0)
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
      while (!v14 && (sub_2251077B0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2250F65EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2250F66EC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A62C710](v9, a1);
      sub_2250F6748((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2250F66B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_2250F66EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2250F6748(uint64_t a1)
{
  return a1;
}

unint64_t sub_2250F679C()
{
  unint64_t result = qword_2680C1680;
  if (!qword_2680C1680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1680);
  }
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactDisambiguationModel.init(contacts:prompt:contactSelectionDirectInvocationID:)(SiriInferenceFlow::ContactDisambiguationModel *__return_ptr retstr, Swift::OpaquePointer contacts, Swift::String prompt, Swift::String contactSelectionDirectInvocationID)
{
  object = contactSelectionDirectInvocationID._object;
  uint64_t countAndFlagsBits = contactSelectionDirectInvocationID._countAndFlagsBits;
  uint64_t v6 = prompt._object;
  uint64_t v20 = prompt._countAndFlagsBits;
  unint64_t rawValue = (unint64_t)contacts._rawValue;
  if ((unint64_t)contacts._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_225107620();
  }
  else
  {
    uint64_t v9 = *(void *)(((unint64_t)contacts._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v22 = countAndFlagsBits;
  uint64_t v21 = v6;
  if (!v9)
  {
    swift_bridgeObjectRelease();
    BOOL v11 = (void *)MEMORY[0x263F8EE78];
LABEL_14:
    retstr->contacts._unint64_t rawValue = (void *)rawValue;
    retstr->prompt._uint64_t countAndFlagsBits = v20;
    retstr->prompt._object = v21;
    retstr->contactSelectionDirectInvocationID._uint64_t countAndFlagsBits = v22;
    retstr->contactSelectionDirectInvocationID._object = object;
    retstr->contactSelectionDirectInvocationKey.value._uint64_t countAndFlagsBits = 0;
    retstr->contactSelectionDirectInvocationKey.value._object = 0;
    retstr->encodedContacts._unint64_t rawValue = v11;
    return;
  }
  uint64_t v27 = (void *)MEMORY[0x263F8EE78];
  sub_2250CE4C0(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    BOOL v11 = v27;
    unint64_t v23 = rawValue & 0xC000000000000001;
    uint64_t v24 = v9;
    unint64_t v25 = rawValue;
    do
    {
      if (v23) {
        MEMORY[0x22A62C790](v10, rawValue);
      }
      else {
        OUTLINED_FUNCTION_43_3();
      }
      sub_2250F80D8(v26);
      swift_release();
      uint64_t v13 = v26[0];
      uint64_t v12 = v26[1];
      uint64_t v14 = v26[2];
      uint64_t v15 = v26[3];
      uint64_t v27 = v11;
      unint64_t v17 = v11[2];
      unint64_t v16 = v11[3];
      if (v17 >= v16 >> 1)
      {
        BOOL v19 = OUTLINED_FUNCTION_16_4(v16);
        sub_2250CE4C0((char *)v19, v17 + 1, 1);
        BOOL v11 = v27;
      }
      ++v10;
      _OWORD v11[2] = v17 + 1;
      uint64_t v18 = &v11[4 * v17];
      v18[4] = v13;
      v18[5] = v12;
      v18[6] = v14;
      v18[7] = v15;
      unint64_t rawValue = v25;
    }
    while (v24 != v10);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
}

void sub_2250F69A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v67 = v21;
  uint64_t v68 = v22;
  uint64_t v65 = v23;
  uint64_t v66 = v24;
  uint64_t v63 = v25;
  uint64_t v64 = v26;
  uint64_t v62 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  char v35 = (char *)&v57 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  char v37 = (char *)&v57 - v36;
  swift_retain();
  sub_2250F80D8(v69);
  uint64_t v60 = v69[1];
  uint64_t v61 = v69[0];
  uint64_t v58 = v69[3];
  uint64_t v59 = v69[2];
  swift_retain();
  uint64_t v38 = sub_225106BF0();
  swift_release();
  if (!v38) {
    goto LABEL_4;
  }
  sub_225106B90();
  swift_release();
  uint64_t v39 = sub_225106F50();
  if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v39) == 1)
  {
    sub_2250DFF9C((uint64_t)v37);
LABEL_4:
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    goto LABEL_6;
  }
  uint64_t v40 = sub_225106F30();
  unint64_t v41 = v42;
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v37, v39);
LABEL_6:
  swift_retain();
  uint64_t v44 = sub_225106BF0();
  swift_release();
  if (v44)
  {
    sub_225106BA0();
    swift_release();
    uint64_t v45 = sub_225106F50();
    uint64_t v46 = OUTLINED_FUNCTION_45_4();
    if (__swift_getEnumTagSinglePayload(v46, v47, v45) != 1)
    {
      uint64_t v44 = sub_225106F30();
      unint64_t v48 = v49;
      OUTLINED_FUNCTION_4_9();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v45);
      goto LABEL_11;
    }
    sub_2250DFF9C((uint64_t)v35);
    uint64_t v44 = 0;
  }
  unint64_t v48 = 0xE000000000000000;
LABEL_11:
  swift_release();
  uint64_t v51 = v62;
  *uint64_t v31 = v29;
  v31[1] = v51;
  uint64_t v52 = v64;
  v31[2] = v63;
  void v31[3] = v52;
  uint64_t v53 = v66;
  v31[4] = v65;
  v31[5] = v53;
  uint64_t v54 = v68;
  v31[6] = v67;
  v31[7] = v54;
  uint64_t v55 = v61;
  v31[8] = a21;
  v31[9] = v55;
  uint64_t v56 = v59;
  v31[10] = v60;
  v31[11] = v56;
  v31[12] = v58;
  v31[13] = v40;
  v31[14] = v41;
  v31[15] = v44;
  v31[16] = v48;
  OUTLINED_FUNCTION_36_1();
}

uint64_t ContactHandleDisambiguationModel.init(contact:contactHandles:isDeviceLocked:contactSelectionDirectInvocationID:prompt:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2250F80D8(&v57);
  uint64_t v50 = v58;
  uint64_t v51 = v57;
  uint64_t v48 = v59;
  uint64_t v49 = v60;
  if (a2 >> 62)
  {
    OUTLINED_FUNCTION_35_5();
    uint64_t v15 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v53 = a4;
  if (!v15)
  {
    OUTLINED_FUNCTION_47_3();
    uint64_t v21 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a8 = a1;
    *(void *)(a8 + 8) = a2;
    *(unsigned char *)(a8 + 16) = a3 & 1;
    *(void *)(a8 + 24) = v53;
    *(void *)(a8 + 32) = a5;
    *(void *)(a8 + 40) = 0;
    *(void *)(a8 + 48) = 0;
    *(void *)(a8 + 56) = a6;
    *(void *)(a8 + 64) = a7;
    *(void *)(a8 + 72) = v51;
    *(void *)(a8 + 80) = v50;
    *(void *)(a8 + 88) = v48;
    *(void *)(a8 + 96) = v49;
    *(void *)(a8 + 104) = v21;
    return result;
  }
  unint64_t v16 = (char *)OUTLINED_FUNCTION_32_5(MEMORY[0x263F8EE78]);
  uint64_t result = (uint64_t)sub_2250CE4E0(v16, v17, v18);
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v45 = a6;
    uint64_t v46 = a8;
    uint64_t v47 = a7;
    uint64_t v20 = 0;
    uint64_t v21 = v66;
    unint64_t v54 = a2 & 0xC000000000000001;
    uint64_t v55 = v15;
    unint64_t v56 = a2;
    do
    {
      if (v54) {
        a1 = MEMORY[0x22A62C790](v20, a2);
      }
      else {
        OUTLINED_FUNCTION_43_3();
      }
      sub_2250F9010((uint64_t)&v57);
      swift_release();
      uint64_t v22 = v57;
      uint64_t v23 = v58;
      uint64_t v25 = v59;
      uint64_t v24 = v60;
      uint64_t v27 = v61;
      uint64_t v26 = v62;
      char v28 = v63;
      char v29 = v64;
      unint64_t v31 = *(void *)(v21 + 16);
      unint64_t v30 = *(void *)(v21 + 24);
      uint64_t v32 = v65;
      uint64_t v66 = v21;
      if (v31 >= v30 >> 1)
      {
        BOOL v34 = OUTLINED_FUNCTION_16_4(v30);
        uint64_t v36 = v35;
        uint64_t v43 = v38;
        uint64_t v44 = v37;
        char v41 = v40;
        char v42 = v39;
        sub_2250CE4E0((char *)v34, v31 + 1, 1);
        char v29 = v41;
        char v28 = v42;
        uint64_t v26 = v43;
        uint64_t v24 = v44;
        uint64_t v22 = v36;
        uint64_t v21 = v66;
      }
      ++v20;
      *(void *)(v21 + 16) = v31 + 1;
      uint64_t v33 = v21 + (v31 << 6);
      *(void *)(v33 + 32) = v22;
      *(void *)(v33 + 40) = v23;
      *(void *)(v33 + 48) = v25;
      *(void *)(v33 + 56) = v24;
      *(void *)(v33 + 64) = v27;
      *(void *)(v33 + 72) = v26;
      *(unsigned char *)(v33 + 80) = v28;
      *(unsigned char *)(v33 + 81) = v29;
      *(void *)(v33 + 88) = v32;
      a2 = v56;
    }
    while (v55 != v20);
    OUTLINED_FUNCTION_47_3();
    a7 = v47;
    a6 = v45;
    a8 = v46;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t static ContactDisambiguationSnippetPluginModel.bundleName.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_2680C1690;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static ContactDisambiguationSnippetPluginModel.bundleName.setter(uint64_t a1, void *a2)
{
  qword_2680C1690 = a1;
  off_2680C1698 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ContactDisambiguationSnippetPluginModel.bundleName.modify())()
{
  return j__swift_endAccess;
}

uint64_t ContactDisambiguationSnippetPluginModel.snippetHidden(for:idiom:)()
{
  return 0;
}

uint64_t sub_2250F6F68(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x8000000225109520 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000225109540 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000225109560)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_2251077B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_2250F70B0(char a1)
{
  if (!a1) {
    return 0xD000000000000015;
  }
  if (a1 == 1) {
    return 0xD00000000000001BLL;
  }
  return 0xD000000000000013;
}

uint64_t sub_2250F710C()
{
  return 12383;
}

uint64_t sub_2250F7118(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2251077B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

unint64_t sub_2250F718C()
{
  return sub_2250F70B0(*v0);
}

uint64_t sub_2250F7194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250F6F68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250F71BC(uint64_t a1)
{
  unint64_t v2 = sub_2250FC6AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F71F8(uint64_t a1)
{
  unint64_t v2 = sub_2250FC6AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2250F7238()
{
  return sub_2250E4C0C();
}

uint64_t sub_2250F7258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250F7118(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2250F7284()
{
  return sub_2250B9FF0();
}

uint64_t sub_2250F72A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250E4C50();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2250F72CC(uint64_t a1)
{
  unint64_t v2 = sub_2250FC6F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F7308(uint64_t a1)
{
  unint64_t v2 = sub_2250FC6F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2250F7344(uint64_t a1)
{
  unint64_t v2 = sub_2250FC88C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F7380(uint64_t a1)
{
  unint64_t v2 = sub_2250FC88C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2250F73BC()
{
  return sub_225107880();
}

uint64_t sub_2250F73FC(uint64_t a1)
{
  unint64_t v2 = sub_2250FC7F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F7438(uint64_t a1)
{
  unint64_t v2 = sub_2250FC7F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactDisambiguationSnippetPluginModel.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v1 = v0;
  char v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C16A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C16A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C16B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C16B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  sub_2250D96D8(v1, (uint64_t)v34);
  OUTLINED_FUNCTION_48_3(v3);
  sub_2250FC6AC();
  sub_2251078B0();
  sub_2250D96D8((uint64_t)v34, (uint64_t)v35);
  int v8 = sub_2250D98CC((uint64_t)v35);
  if (v8)
  {
    if (v8 == 1)
    {
      uint64_t v9 = nullsub_1(v35);
      char v26 = *(unsigned char *)(v9 + 16);
      long long v24 = *(_OWORD *)(v9 + 40);
      long long v25 = *(_OWORD *)(v9 + 24);
      long long v22 = *(_OWORD *)(v9 + 72);
      long long v23 = *(_OWORD *)(v9 + 56);
      uint64_t v21 = *(void *)(v9 + 88);
      v30[0] = 1;
      long long v19 = *(_OWORD *)v9;
      long long v20 = *(_OWORD *)(v9 + 96);
      sub_2250D96D8((uint64_t)v34, (uint64_t)v31);
      nullsub_1(v31);
      sub_2250FC7F4();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_225107710();
      *(_OWORD *)unint64_t v30 = v19;
      v30[16] = v26;
      *(_OWORD *)&v30[24] = v25;
      *(_OWORD *)&v30[40] = v24;
      *(_OWORD *)&v30[56] = v23;
      *(_OWORD *)&v30[72] = v22;
      *(void *)&v30[88] = v21;
      *(_OWORD *)&v30[96] = v20;
      sub_2250FC840();
    }
    else
    {
      unint64_t v16 = (const void *)nullsub_1(v35);
      v30[0] = 2;
      sub_2250D96D8((uint64_t)v34, (uint64_t)v31);
      uint64_t v17 = nullsub_1(v31);
      sub_2250D98D4(v17);
      sub_2250FC6F8();
      sub_225107710();
      memcpy(v30, v16, sizeof(v30));
      sub_2250FC744();
    }
    sub_225107770();
    OUTLINED_FUNCTION_5_6();
    v10();
    OUTLINED_FUNCTION_25_5();
    OUTLINED_FUNCTION_5_6();
    v18();
    sub_2250FC790((uint64_t)v34);
  }
  else
  {
    uint64_t v11 = nullsub_1(v35);
    long long v28 = *(_OWORD *)(v11 + 16);
    long long v29 = *(_OWORD *)v11;
    long long v27 = *(_OWORD *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 48);
    uint64_t v13 = *(void *)(v11 + 56);
    sub_2250FC88C();
    sub_225107710();
    v31[0] = v29;
    v31[1] = v28;
    v31[2] = v27;
    uint64_t v32 = v12;
    uint64_t v33 = v13;
    sub_2250FC8D8();
    sub_225107770();
    OUTLINED_FUNCTION_5_6();
    v14();
    OUTLINED_FUNCTION_25_5();
    OUTLINED_FUNCTION_5_6();
    v15();
  }
  OUTLINED_FUNCTION_36_1();
}

void ContactDisambiguationSnippetPluginModel.init(from:)()
{
  OUTLINED_FUNCTION_34_1();
  char v3 = v2;
  uint64_t v32 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C16F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1700);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_9_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1708);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_1();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1710);
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_11_5();
  BOOL v34 = v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FC6AC();
  sub_2251078A0();
  if (!v0)
  {
    uint64_t v12 = v1;
    uint64_t v13 = sub_225107700();
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      uint64_t v31 = v8;
      uint64_t v15 = v1;
      int v16 = *(unsigned __int8 *)(v13 + 32);
      sub_2250FC928(1, v14, v13, v13 + 32, 0, (2 * v14) | 1);
      uint64_t v18 = v17;
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      if (v18 == v20 >> 1)
      {
        if (v16)
        {
          if (v16 == 1)
          {
            LOBYTE(v35[0]) = 1;
            sub_2250FC7F4();
            OUTLINED_FUNCTION_42_4();
            sub_2250FC9F0();
            sub_2251076F0();
            uint64_t v24 = OUTLINED_FUNCTION_6_8();
            v25(v24);
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_23_4();
            v26();
            v35[0] = v36[0];
            LOBYTE(v35[1]) = v36[1];
            *((void *)&v35[1] + 1) = *((void *)&v36[1] + 1);
            *(void *)&v35[2] = *(void *)&v36[2];
            *(_OWORD *)((char *)&v35[2] + 8) = *(_OWORD *)((char *)&v36[2] + 8);
            *(_OWORD *)((char *)&v35[3] + 8) = *(_OWORD *)((char *)&v36[3] + 8);
            *(_OWORD *)((char *)&v35[4] + 8) = *(_OWORD *)((char *)&v36[4] + 8);
            *((void *)&v35[5] + 1) = *((void *)&v36[5] + 1);
            v35[6] = v36[6];
            sub_2250D9734((uint64_t)v35);
            sub_2250D96D8((uint64_t)v35, (uint64_t)v37);
            uint64_t v11 = (uint64_t)v34;
LABEL_15:
            sub_2250D96D8((uint64_t)v37, v32);
            goto LABEL_11;
          }
          LOBYTE(v35[0]) = 2;
          sub_2250FC6F8();
          OUTLINED_FUNCTION_42_4();
          uint64_t v11 = (uint64_t)v34;
          sub_2250FC9A4();
          sub_2251076F0();
          OUTLINED_FUNCTION_49();
          v29();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_23_4();
          v30();
          memcpy(v35, v36, 0x88uLL);
          sub_2250D96CC((uint64_t)v35);
        }
        else
        {
          LOBYTE(v35[0]) = 0;
          sub_2250FC88C();
          sub_225107680();
          sub_2250FCA3C();
          sub_2251076F0();
          uint64_t v11 = (uint64_t)v34;
          OUTLINED_FUNCTION_49();
          v27();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_23_4();
          v28();
          v35[0] = v36[0];
          v35[1] = v36[1];
          *(void *)&v35[2] = *(void *)&v36[2];
          *(_OWORD *)((char *)&v35[2] + 8) = *(_OWORD *)((char *)&v36[2] + 8);
          *((void *)&v35[3] + 1) = *((void *)&v36[3] + 1);
          sub_2250D979C((uint64_t)v35);
        }
        sub_2250D96D8((uint64_t)v35, (uint64_t)v37);
        goto LABEL_15;
      }
      uint64_t v11 = (uint64_t)v34;
      uint64_t v12 = v15;
      uint64_t v8 = v31;
    }
    else
    {
      uint64_t v11 = (uint64_t)v34;
    }
    sub_225107550();
    swift_allocError();
    long long v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1718);
    *long long v22 = &type metadata for ContactDisambiguationSnippetPluginModel;
    sub_225107690();
    sub_225107540();
    OUTLINED_FUNCTION_4_9();
    (*(void (**)(void *))(v23 + 104))(v22);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v12, v8);
    goto LABEL_11;
  }
  uint64_t v11 = (uint64_t)v3;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_1(v11);
  OUTLINED_FUNCTION_36_1();
}

void sub_2250F801C()
{
}

void sub_2250F8034()
{
}

uint64_t ContactDisambiguationModel.prompt.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactDisambiguationModel.contactSelectionDirectInvocationID.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactDisambiguationModel.contactSelectionDirectInvocationKey.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactDisambiguationModel.encodedContacts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2250F80D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v34 - v7;
  sub_225106DB0();
  uint64_t v9 = sub_225106F50();
  uint64_t v10 = OUTLINED_FUNCTION_45_4();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v10, v11, v9);
  sub_2250DFF9C((uint64_t)v8);
  if (EnumTagSinglePayload == 1)
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2251070F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_2680C5BD8);
    uint64_t v14 = sub_2251070D0();
    os_log_type_t v15 = sub_225107390();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
      OUTLINED_FUNCTION_39_5(&dword_2250AF000, v16, v17, "Contact fullName is nil!");
      OUTLINED_FUNCTION_7_1();
    }
  }
  uint64_t v19 = *(void *)(v3 + qword_2680C0B10);
  unint64_t v18 = *(void *)(v3 + qword_2680C0B10 + 8);
  if (!v18)
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2251070F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BD8);
    uint64_t v21 = sub_2251070D0();
    os_log_type_t v22 = sub_225107390();
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
      OUTLINED_FUNCTION_38_3(&dword_2250AF000, v23, v24, "Contact view data is nil!");
      OUTLINED_FUNCTION_7_1();
    }
  }
  sub_225106DB0();
  if (__swift_getEnumTagSinglePayload(v2, 1, v9) == 1)
  {
    sub_2250DFF9C(v2);
    uint64_t v25 = 0;
    unint64_t v26 = 0;
  }
  else
  {
    uint64_t v25 = sub_225106F30();
    unint64_t v26 = v27;
    OUTLINED_FUNCTION_4_9();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v2, v9);
  }
  if (v26) {
    uint64_t v29 = v25;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v26) {
    unint64_t v30 = v26;
  }
  else {
    unint64_t v30 = 0xE000000000000000;
  }
  if (v18) {
    uint64_t v31 = v19;
  }
  else {
    uint64_t v31 = 0;
  }
  *a1 = v29;
  a1[1] = v30;
  if (v18) {
    unint64_t v32 = v18;
  }
  else {
    unint64_t v32 = 0xE000000000000000;
  }
  a1[2] = v31;
  a1[3] = v32;
  return swift_bridgeObjectRetain();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactDisambiguationModel.init(contacts:prompt:contactSelectionDirectInvocationID:contactSelectionDirectInvocationKey:)(SiriInferenceFlow::ContactDisambiguationModel *__return_ptr retstr, Swift::OpaquePointer contacts, Swift::String prompt, Swift::String contactSelectionDirectInvocationID, Swift::String_optional contactSelectionDirectInvocationKey)
{
  object = contactSelectionDirectInvocationKey.value._object;
  uint64_t countAndFlagsBits = contactSelectionDirectInvocationKey.value._countAndFlagsBits;
  uint64_t v7 = contactSelectionDirectInvocationID._object;
  uint64_t v8 = contactSelectionDirectInvocationID._countAndFlagsBits;
  uint64_t v9 = prompt._object;
  uint64_t v28 = prompt._countAndFlagsBits;
  unint64_t rawValue = (unint64_t)contacts._rawValue;
  if ((unint64_t)contacts._rawValue >> 62)
  {
    OUTLINED_FUNCTION_35_5();
    uint64_t v12 = sub_225107620();
  }
  else
  {
    uint64_t v12 = *(void *)(((unint64_t)contacts._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v30 = v8;
  uint64_t v29 = v9;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)MEMORY[0x263F8EE78];
LABEL_14:
    retstr->contacts._unint64_t rawValue = (void *)rawValue;
    retstr->prompt._uint64_t countAndFlagsBits = v28;
    retstr->prompt._object = v29;
    retstr->contactSelectionDirectInvocationID._uint64_t countAndFlagsBits = v30;
    retstr->contactSelectionDirectInvocationID._object = v7;
    retstr->contactSelectionDirectInvocationKey.value._uint64_t countAndFlagsBits = countAndFlagsBits;
    retstr->contactSelectionDirectInvocationKey.value._object = object;
    retstr->encodedContacts._unint64_t rawValue = v17;
    return;
  }
  uint64_t v13 = (char *)OUTLINED_FUNCTION_32_5(MEMORY[0x263F8EE78]);
  sub_2250CE4C0(v13, v14, v15);
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v26 = countAndFlagsBits;
    unint64_t v27 = object;
    uint64_t v16 = 0;
    uint64_t v17 = v35;
    unint64_t v31 = rawValue & 0xC000000000000001;
    uint64_t v32 = v12;
    unint64_t v33 = rawValue;
    do
    {
      if (v31) {
        MEMORY[0x22A62C790](v16, rawValue);
      }
      else {
        OUTLINED_FUNCTION_43_3();
      }
      sub_2250F80D8(v34);
      swift_release();
      uint64_t v19 = v34[0];
      uint64_t v18 = v34[1];
      uint64_t v20 = v34[2];
      uint64_t v21 = v34[3];
      uint64_t v35 = v17;
      unint64_t v23 = v17[2];
      unint64_t v22 = v17[3];
      if (v23 >= v22 >> 1)
      {
        BOOL v25 = OUTLINED_FUNCTION_16_4(v22);
        sub_2250CE4C0((char *)v25, v23 + 1, 1);
        uint64_t v17 = v35;
      }
      ++v16;
      v17[2] = v23 + 1;
      uint64_t v24 = &v17[4 * v23];
      v24[4] = v19;
      v24[5] = v18;
      v24[6] = v20;
      v24[7] = v21;
      unint64_t rawValue = v33;
    }
    while (v32 != v16);
    swift_bridgeObjectRelease();
    object = v27;
    uint64_t countAndFlagsBits = v26;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_2250F8534(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746361746E6F63 && a2 == 0xE800000000000000;
  if (v2 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74706D6F7270 && a2 == 0xE600000000000000;
    if (v6 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000022 && a2 == 0x8000000225109580 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000023 && a2 == 0x80000002251095B0 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0x436465646F636E65 && a2 == 0xEF73746361746E6FLL)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      char v8 = sub_2251077B0();
      swift_bridgeObjectRelease();
      if (v8) {
        return 4;
      }
      else {
        return 5;
      }
    }
  }
}

uint64_t sub_2250F875C()
{
  return 5;
}

unint64_t sub_2250F8764(char a1)
{
  unint64_t result = 0x73746361746E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74706D6F7270;
      break;
    case 2:
      unint64_t result = 0xD000000000000022;
      break;
    case 3:
      unint64_t result = 0xD000000000000023;
      break;
    case 4:
      unint64_t result = 0x436465646F636E65;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2250F8828()
{
  return sub_2250F8764(*v0);
}

uint64_t sub_2250F8830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250F8534(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250F8858@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250F875C();
  *a1 = result;
  return result;
}

uint64_t sub_2250F8880(uint64_t a1)
{
  unint64_t v2 = sub_2250FCA88();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F88BC(uint64_t a1)
{
  unint64_t v2 = sub_2250FCA88();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactDisambiguationModel.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1738);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19_4();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCA88();
  sub_2251078B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1748);
  sub_2250FCB8C(&qword_2680C1750, &qword_2680C1758);
  OUTLINED_FUNCTION_36_3();
  OUTLINED_FUNCTION_13_5();
  if (!v0)
  {
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_7_5();
    sub_225107720();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1760);
    sub_2250FCAD4(&qword_2680C1768, &qword_2680C1760, (void (*)(void))sub_2250FCB40);
    OUTLINED_FUNCTION_36_3();
    OUTLINED_FUNCTION_13_5();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_36_1();
}

void ContactDisambiguationModel.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v12 = v11;
  int64_t v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1778);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_48_3(v12);
  sub_2250FCA88();
  sub_2251078A0();
  if (v10)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1748);
    sub_2250FCB8C(&qword_2680C1780, &qword_2680C1788);
    OUTLINED_FUNCTION_27_6();
    OUTLINED_FUNCTION_49_3();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_44_5();
    uint64_t v16 = sub_2251076C0();
    uint64_t v30 = v17;
    uint64_t v27 = v16;
    uint64_t v29 = a10;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2251076C0();
    LOBYTE(a10) = 3;
    uint64_t v19 = v18;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_44_5();
    uint64_t v28 = v19;
    uint64_t v25 = sub_2251076A0();
    uint64_t v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1760);
    uint64_t v22 = sub_2250FCAD4(&qword_2680C1790, &qword_2680C1760, (void (*)(void))sub_2250FCC50);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27_6();
    OUTLINED_FUNCTION_49_3();
    uint64_t v23 = OUTLINED_FUNCTION_1_11();
    v24(v23);
    if (v22)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *int64_t v14 = v29;
      v14[1] = v27;
      v14[2] = v30;
      v14[3] = v26;
      v14[4] = v28;
      v14[5] = v25;
      v14[6] = v21;
      v14[7] = a10;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_36_1();
}

void sub_2250F8F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ContactDisambiguationModel.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_2250F8F30()
{
}

uint64_t ContactHandleDisambiguationModel.isDeviceLocked.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ContactHandleDisambiguationModel.contactSelectionDirectInvocationID.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandleDisambiguationModel.contactSelectionDirectInvocationKey.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandleDisambiguationModel.prompt.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandleDisambiguationModel.encodedContact.getter@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_52_4(a1);
  return swift_bridgeObjectRetain();
}

uint64_t ContactHandleDisambiguationModel.handles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2250F9010@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_22_5();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v47 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v47 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v47 - v11;
  uint64_t v13 = sub_225106BF0();
  swift_release();
  if (!v13)
  {
    if (qword_2680C06A0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_2251070F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_2680C5BD8);
    uint64_t v15 = sub_2251070D0();
    os_log_type_t v16 = sub_225107390();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_6_2();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_2250AF000, v15, v16, "Handle is nil! Unable to create a contact handle for the view", v17, 2u);
      OUTLINED_FUNCTION_7_1();
    }
  }
  if (sub_225106BF0())
  {
    sub_225106B90();
    swift_release();
    uint64_t v18 = sub_225106F50();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v18) != 1)
    {
      sub_2250DFF9C((uint64_t)v12);
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v19 = sub_225106F50();
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v19);
  }
  sub_2250DFF9C((uint64_t)v12);
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_2251070F0();
  __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BD8);
  uint64_t v21 = sub_2251070D0();
  os_log_type_t v22 = sub_225107390();
  if (os_log_type_enabled(v21, v22))
  {
    *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
    OUTLINED_FUNCTION_38_3(&dword_2250AF000, v23, v24, "Nil handle label!");
    OUTLINED_FUNCTION_7_1();
  }

LABEL_16:
  if (sub_225106BF0())
  {
    sub_225106BA0();
    swift_release();
    sub_225106F50();
    uint64_t v25 = OUTLINED_FUNCTION_45_4();
    if (__swift_getEnumTagSinglePayload(v25, v26, v27) != 1)
    {
      sub_2250DFF9C((uint64_t)v10);
      goto LABEL_25;
    }
  }
  else
  {
    sub_225106F50();
    uint64_t v28 = OUTLINED_FUNCTION_45_4();
    __swift_storeEnumTagSinglePayload(v28, v29, 1, v30);
  }
  sub_2250DFF9C((uint64_t)v10);
  if (qword_2680C06A0 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_2251070F0();
  __swift_project_value_buffer(v31, (uint64_t)qword_2680C5BD8);
  uint64_t v32 = sub_2251070D0();
  os_log_type_t v33 = sub_225107390();
  if (os_log_type_enabled(v32, v33))
  {
    *(_WORD *)OUTLINED_FUNCTION_6_2() = 0;
    OUTLINED_FUNCTION_39_5(&dword_2250AF000, v34, v35, "No value set on handle");
    OUTLINED_FUNCTION_7_1();
  }

LABEL_25:
  if (!sub_225106BF0())
  {
LABEL_28:
    uint64_t v37 = 0;
    unint64_t v38 = 0;
    goto LABEL_30;
  }
  sub_225106B90();
  swift_release();
  uint64_t v36 = sub_225106F50();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v36) == 1)
  {
    sub_2250DFF9C((uint64_t)v7);
    goto LABEL_28;
  }
  uint64_t v37 = sub_225106F30();
  unint64_t v38 = v39;
  OUTLINED_FUNCTION_4_9();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v36);
LABEL_30:
  uint64_t v41 = sub_225106BF0();
  if (v41)
  {
    sub_225106BA0();
    swift_release();
    uint64_t v42 = sub_225106F50();
    if (__swift_getEnumTagSinglePayload(v1, 1, v42) != 1)
    {
      uint64_t v41 = sub_225106F30();
      unint64_t v43 = v44;
      OUTLINED_FUNCTION_4_9();
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v1, v42);
      return sub_2250FB820(v37, v38, v41, v43, a1);
    }
    sub_2250DFF9C(v1);
    uint64_t v41 = 0;
  }
  unint64_t v43 = 0;
  return sub_2250FB820(v37, v38, v41, v43, a1);
}

uint64_t ContactHandleDisambiguationModel.init(contact:contactHandles:isDeviceLocked:contactSelectionDirectInvocationID:contactSelectionDirectInvocationKey:prompt:)@<X0>(unint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2250F80D8(&v57);
  uint64_t v49 = v58;
  uint64_t v50 = v57;
  uint64_t v47 = v59;
  uint64_t v48 = v60;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_225107620();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v53 = a5;
  uint64_t v52 = a3;
  if (!v16)
  {
    OUTLINED_FUNCTION_47_3();
    uint64_t v20 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a8 = v16;
    *(void *)(a8 + 8) = a1;
    *(unsigned char *)(a8 + 16) = a2 & 1;
    *(void *)(a8 + 24) = v52;
    *(void *)(a8 + 32) = a4;
    *(void *)(a8 + 40) = v53;
    *(void *)(a8 + 48) = a6;
    *(void *)(a8 + 56) = a7;
    *(void *)(a8 + 64) = a9;
    *(void *)(a8 + 72) = v50;
    *(void *)(a8 + 80) = v49;
    *(void *)(a8 + 88) = v47;
    *(void *)(a8 + 96) = v48;
    *(void *)(a8 + 104) = v20;
    return result;
  }
  uint64_t v66 = MEMORY[0x263F8EE78];
  int64_t v17 = v16 & ~(v16 >> 63);
  uint64_t v56 = v16;
  uint64_t v16 = (uint64_t)&v66;
  uint64_t result = (uint64_t)sub_2250CE4E0(0, v17, 0);
  if ((v56 & 0x8000000000000000) == 0)
  {
    uint64_t v44 = a6;
    uint64_t v45 = a8;
    uint64_t v46 = a7;
    uint64_t v19 = 0;
    uint64_t v20 = v66;
    unint64_t v54 = a1 & 0xC000000000000001;
    unint64_t v55 = a1;
    do
    {
      if (v54) {
        uint64_t v16 = MEMORY[0x22A62C790](v19, a1);
      }
      else {
        OUTLINED_FUNCTION_43_3();
      }
      sub_2250F9010((uint64_t)&v57);
      swift_release();
      uint64_t v21 = v57;
      uint64_t v22 = v58;
      uint64_t v23 = v59;
      uint64_t v24 = v60;
      uint64_t v26 = v61;
      uint64_t v25 = v62;
      char v27 = v63;
      char v28 = v64;
      unint64_t v30 = *(void *)(v20 + 16);
      unint64_t v29 = *(void *)(v20 + 24);
      uint64_t v31 = v65;
      uint64_t v66 = v20;
      if (v30 >= v29 >> 1)
      {
        BOOL v33 = OUTLINED_FUNCTION_16_4(v29);
        uint64_t v35 = v34;
        uint64_t v42 = v37;
        uint64_t v43 = v36;
        char v40 = v39;
        char v41 = v38;
        sub_2250CE4E0((char *)v33, v30 + 1, 1);
        char v28 = v40;
        char v27 = v41;
        uint64_t v25 = v42;
        uint64_t v23 = v43;
        uint64_t v21 = v35;
        uint64_t v20 = v66;
      }
      ++v19;
      *(void *)(v20 + 16) = v30 + 1;
      uint64_t v32 = v20 + (v30 << 6);
      *(void *)(v32 + 32) = v21;
      *(void *)(v32 + 40) = v22;
      *(void *)(v32 + 48) = v23;
      *(void *)(v32 + 56) = v24;
      *(void *)(v32 + 64) = v26;
      *(void *)(v32 + 72) = v25;
      *(unsigned char *)(v32 + 80) = v27;
      *(unsigned char *)(v32 + 81) = v28;
      *(void *)(v32 + 88) = v31;
      a1 = v55;
    }
    while (v56 != v19);
    OUTLINED_FUNCTION_47_3();
    a7 = v46;
    a6 = v44;
    a8 = v45;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2250F9730(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x48746361746E6F63 && a2 == 0xEE0073656C646E61;
    if (v6 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6563697665447369 && a2 == 0xEE0064656B636F4CLL;
      if (v7 || (sub_2251077B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000022 && a2 == 0x8000000225109580 || (sub_2251077B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000023 && a2 == 0x80000002251095B0 || (sub_2251077B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x74706D6F7270 && a2 == 0xE600000000000000;
        if (v8 || (sub_2251077B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x436465646F636E65 && a2 == 0xEE00746361746E6FLL;
          if (v9 || (sub_2251077B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0x73656C646E6168 && a2 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            char v11 = sub_2251077B0();
            swift_bridgeObjectRelease();
            if (v11) {
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

unint64_t sub_2250F9AC0(char a1)
{
  unint64_t result = 0x746361746E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x48746361746E6F63;
      break;
    case 2:
      unint64_t result = 0x6563697665447369;
      break;
    case 3:
      unint64_t result = 0xD000000000000022;
      break;
    case 4:
      unint64_t result = 0xD000000000000023;
      break;
    case 5:
      unint64_t result = 0x74706D6F7270;
      break;
    case 6:
      unint64_t result = 0x436465646F636E65;
      break;
    case 7:
      unint64_t result = 0x73656C646E6168;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2250F9BEC()
{
  return sub_2250F9AC0(*v0);
}

uint64_t sub_2250F9BF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250F9730(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250F9C1C(uint64_t a1)
{
  unint64_t v2 = sub_2250FCC9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250F9C58(uint64_t a1)
{
  unint64_t v2 = sub_2250FCC9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactHandleDisambiguationModel.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17A0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  BOOL v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v0;
  uint64_t v9 = v0[1];
  uint64_t v30 = v0[3];
  uint64_t v31 = v9;
  uint64_t v11 = v0[4];
  uint64_t v12 = v0[5];
  uint64_t v28 = v0[6];
  uint64_t v29 = v11;
  uint64_t v13 = v0[7];
  uint64_t v26 = v0[8];
  uint64_t v27 = v12;
  uint64_t v14 = v0[10];
  uint64_t v21 = v0[9];
  uint64_t v22 = v14;
  uint64_t v23 = v0[11];
  uint64_t v15 = v0[13];
  uint64_t v24 = v0[12];
  uint64_t v25 = v13;
  uint64_t v16 = v3[3];
  int64_t v17 = v3;
  uint64_t v19 = v18;
  __swift_project_boxed_opaque_existential_1(v17, v16);
  sub_2250FCC9C();
  sub_2251078B0();
  uint64_t v32 = v10;
  type metadata accessor for ContactDialogPerson(0);
  sub_2250FCC0C(&qword_2680C1758);
  OUTLINED_FUNCTION_13_5();
  if (!v1)
  {
    uint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1748);
    sub_2250FCB8C(&qword_2680C1750, &qword_2680C1758);
    OUTLINED_FUNCTION_13_5();
    LOBYTE(v32) = 2;
    sub_225107750();
    LOBYTE(v32) = 3;
    OUTLINED_FUNCTION_7_5();
    LOBYTE(v32) = 4;
    sub_225107720();
    LOBYTE(v32) = 5;
    OUTLINED_FUNCTION_7_5();
    uint64_t v32 = v21;
    uint64_t v33 = v22;
    uint64_t v34 = v23;
    uint64_t v35 = v24;
    sub_2250FCB40();
    OUTLINED_FUNCTION_13_5();
    uint64_t v32 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17B0);
    sub_2250FCAD4(&qword_2680C17B8, &qword_2680C17B0, (void (*)(void))sub_2250FCCE8);
    OUTLINED_FUNCTION_13_5();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v19);
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_36_1();
}

void ContactHandleDisambiguationModel.init(from:)()
{
  OUTLINED_FUNCTION_34_1();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_48_3(v2);
  sub_2250FCC9C();
  OUTLINED_FUNCTION_31_3();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    type metadata accessor for ContactDialogPerson(0);
    sub_2250FCC0C(&qword_2680C1788);
    OUTLINED_FUNCTION_33_4();
    sub_2251076F0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1748);
    sub_2250FCB8C(&qword_2680C1780, &qword_2680C1788);
    swift_retain();
    OUTLINED_FUNCTION_33_4();
    sub_2251076F0();
    uint64_t v33 = v34[0];
    uint64_t v6 = v34[0];
    LOBYTE(v34[0]) = 2;
    swift_bridgeObjectRetain();
    char v7 = OUTLINED_FUNCTION_26_4((uint64_t)v34);
    LOBYTE(v34[0]) = 3;
    uint64_t v29 = OUTLINED_FUNCTION_10_5();
    LOBYTE(v34[0]) = 4;
    uint64_t v32 = v8;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2251076A0();
    uint64_t v31 = v10;
    uint64_t v28 = v9;
    LOBYTE(v34[0]) = 5;
    swift_bridgeObjectRetain();
    uint64_t v27 = OUTLINED_FUNCTION_10_5();
    uint64_t v12 = v11;
    unint64_t v13 = sub_2250FCC50();
    uint64_t v30 = v12;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_4();
    if (v13)
    {
      uint64_t v14 = OUTLINED_FUNCTION_1_11();
      v15(v14);
      swift_release();
      OUTLINED_FUNCTION_50_4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v16 = 0;
    }
    else
    {
      uint64_t v17 = v34[1];
      uint64_t v24 = v34[2];
      uint64_t v25 = v34[0];
      uint64_t v26 = v34[3];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17B0);
      uint64_t v18 = sub_2250FCAD4(&qword_2680C17D0, &qword_2680C17B0, (void (*)(void))sub_2250FCD34);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_24_4();
      if (!v18)
      {
        uint64_t v21 = OUTLINED_FUNCTION_1_11();
        v22(v21);
        uint64_t v23 = v34[0];
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(void *)uint64_t v4 = v33;
        *(void *)(v4 + 8) = v6;
        *(unsigned char *)(v4 + 16) = v7 & 1;
        *(void *)(v4 + 24) = v29;
        *(void *)(v4 + 32) = v32;
        *(void *)(v4 + 40) = v28;
        *(void *)(v4 + 48) = v31;
        *(void *)(v4 + 56) = v27;
        *(void *)(v4 + 64) = v30;
        *(void *)(v4 + 72) = v25;
        *(void *)(v4 + 80) = v17;
        *(void *)(v4 + 88) = v24;
        *(void *)(v4 + 96) = v26;
        *(void *)(v4 + 104) = v23;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_6;
      }
      uint64_t v19 = OUTLINED_FUNCTION_1_11();
      v20(v19);
      swift_release();
      OUTLINED_FUNCTION_50_4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v16 = 1;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
LABEL_6:
  OUTLINED_FUNCTION_36_1();
}

void sub_2250FA5D0()
{
}

void sub_2250FA5E8()
{
}

uint64_t ContactConfirmationModel.primaryButtonInvocationID.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactConfirmationModel.secondaryButtonInvocationID.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactConfirmationModel.changeButtonLabel.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactConfirmationModel.primaryActionButtonLabel.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactConfirmationModel.encodedContact.getter@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_52_4(a1);
  return swift_bridgeObjectRetain();
}

uint64_t ContactConfirmationModel.contactLabel.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

Swift::String __swiftcall ContactConfirmationModel.displayName()()
{
  uint64_t v1 = sub_225105C90();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2();
  uint64_t v7 = v6 - v5;
  uint64_t v9 = v0[9];
  uint64_t v8 = (void *)v0[10];
  uint64_t v10 = v0[15];
  uint64_t v11 = (void *)v0[16];
  swift_bridgeObjectRetain();
  sub_225105C60();
  sub_2250B71D8();
  uint64_t v12 = sub_225107450();
  unint64_t v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (v15) {
    char v16 = v8;
  }
  else {
    char v16 = v11;
  }
  if (v15) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = v10;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = v17;
  uint64_t v19 = v16;
  result._object = v19;
  result._uint64_t countAndFlagsBits = v18;
  return result;
}

uint64_t sub_2250FA830(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002251095E0 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000225109600 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000225109620 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000225109640 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    BOOL v6 = a1 == 0x436465646F636E65 && a2 == 0xEE00746361746E6FLL;
    if (v6 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      BOOL v7 = a1 == 0x4C746361746E6F63 && a2 == 0xEC0000006C656261;
      if (v7 || (sub_2251077B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0x487972616D697270 && a2 == 0xED0000656C646E61)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else
      {
        char v9 = sub_2251077B0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 7;
        }
        else {
          return 8;
        }
      }
    }
  }
}

uint64_t sub_2250FABA8()
{
  return 8;
}

unint64_t sub_2250FABB0(char a1)
{
  unint64_t result = 0x746361746E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0x436465646F636E65;
      break;
    case 6:
      unint64_t result = 0x4C746361746E6F63;
      break;
    case 7:
      unint64_t result = 0x487972616D697270;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2250FACE4()
{
  return sub_2250FABB0(*v0);
}

uint64_t sub_2250FACEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250FA830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250FAD14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250FABA8();
  *a1 = result;
  return result;
}

uint64_t sub_2250FAD3C(uint64_t a1)
{
  unint64_t v2 = sub_2250FCD80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250FAD78(uint64_t a1)
{
  unint64_t v2 = sub_2250FCD80();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactConfirmationModel.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17E0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19_4();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCD80();
  sub_2251078B0();
  type metadata accessor for ContactDialogPerson(0);
  sub_2250FCC0C(&qword_2680C1758);
  OUTLINED_FUNCTION_13_5();
  if (!v0)
  {
    OUTLINED_FUNCTION_20_5(1);
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_20_5(2);
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_20_5(3);
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_20_5(4);
    OUTLINED_FUNCTION_7_5();
    sub_2250FCB40();
    OUTLINED_FUNCTION_13_5();
    OUTLINED_FUNCTION_20_5(6);
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_20_5(7);
    OUTLINED_FUNCTION_7_5();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_36_1();
}

void ContactConfirmationModel.init(from:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17F0);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_9_7();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCD80();
  sub_2251078A0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    char v40 = v5;
    type metadata accessor for ContactDialogPerson(0);
    LOBYTE(v47[0]) = 0;
    sub_2250FCC0C(&qword_2680C1788);
    OUTLINED_FUNCTION_49_3();
    uint64_t v9 = v48;
    swift_retain();
    uint64_t v10 = v7;
    uint64_t v11 = (uint64_t)v3;
    uint64_t v12 = v10;
    uint64_t v39 = OUTLINED_FUNCTION_8_8();
    uint64_t v14 = v13;
    swift_bridgeObjectRetain();
    uint64_t v45 = v14;
    uint64_t v38 = OUTLINED_FUNCTION_8_8();
    uint64_t v16 = v15;
    swift_bridgeObjectRetain();
    uint64_t v44 = v16;
    uint64_t v37 = OUTLINED_FUNCTION_8_8();
    LOBYTE(v48) = 4;
    uint64_t v43 = v17;
    swift_bridgeObjectRetain();
    uint64_t v18 = OUTLINED_FUNCTION_8_8();
    uint64_t v42 = v19;
    uint64_t v36 = v18;
    LOBYTE(v47[0]) = 5;
    unint64_t v20 = sub_2250FCC50();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_49_3();
    if (v20)
    {
      uint64_t v21 = OUTLINED_FUNCTION_4_11();
      v22(v21);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v23 = 0;
    }
    else
    {
      uint64_t v34 = v50;
      uint64_t v35 = v48;
      LOBYTE(v48) = 6;
      uint64_t v41 = v49;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v24 = OUTLINED_FUNCTION_8_8();
      if (!v51)
      {
        uint64_t v33 = v24;
        uint64_t v28 = v25;
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_2251076C0();
        uint64_t v32 = v30;
        uint64_t v31 = v30;
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v46);
        v47[0] = v9;
        v47[1] = v39;
        _OWORD v47[2] = v45;
        v47[3] = v38;
        v47[4] = v44;
        v47[5] = v37;
        v47[6] = v43;
        v47[7] = v36;
        v47[8] = v42;
        v47[9] = v35;
        v47[10] = v41;
        v47[11] = v34;
        v47[12] = 0;
        v47[13] = v33;
        v47[14] = v28;
        v47[15] = v29;
        v47[16] = v31;
        sub_2250D98D4((uint64_t)v47);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        memcpy(v40, v47, 0x88uLL);
        __swift_destroy_boxed_opaque_existential_1(v11);
        uint64_t v48 = v9;
        uint64_t v49 = v39;
        uint64_t v50 = v45;
        uint64_t v51 = v38;
        uint64_t v52 = v44;
        uint64_t v53 = v37;
        uint64_t v54 = v43;
        uint64_t v55 = v36;
        uint64_t v56 = v42;
        uint64_t v57 = v35;
        uint64_t v58 = v41;
        uint64_t v59 = v34;
        uint64_t v60 = 0;
        uint64_t v61 = v33;
        uint64_t v62 = v28;
        uint64_t v63 = v29;
        uint64_t v64 = v32;
        sub_2250FCDCC((uint64_t)&v48);
        goto LABEL_6;
      }
      uint64_t v26 = OUTLINED_FUNCTION_4_11();
      v27(v26);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v23 = 1;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
LABEL_6:
  OUTLINED_FUNCTION_36_1();
}

void sub_2250FB684()
{
}

void sub_2250FB69C()
{
}

uint64_t ContactHandle.id.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandle.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ContactHandle.id.modify())()
{
  return nullsub_1;
}

uint64_t ContactHandle.label.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandle.method.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t ContactHandle.isFacetimeable.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t ContactHandle.isFacetimeable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t (*ContactHandle.isFacetimeable.modify())()
{
  return nullsub_1;
}

uint64_t ContactHandle.isiMessageable.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t ContactHandle.isiMessageable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 49) = result;
  return result;
}

uint64_t (*ContactHandle.isiMessageable.modify())()
{
  return nullsub_1;
}

uint64_t ContactHandle.index.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t ContactHandle.index.setter(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t (*ContactHandle.index.modify())()
{
  return nullsub_1;
}

uint64_t sub_2250FB820@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a2) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = 0xE000000000000000;
  if (a2) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = 0xE000000000000000;
  }
  if (a4) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 0;
  }
  if (a4) {
    unint64_t v6 = a4;
  }
  *(void *)a5 = v8;
  *(void *)(a5 + 8) = v6;
  *(void *)(a5 + 16) = v5;
  *(void *)(a5 + 24) = v7;
  *(void *)(a5 + 32) = v8;
  *(void *)(a5 + 40) = v6;
  *(_WORD *)(a5 + 48) = 0;
  *(void *)(a5 + 56) = -1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2250FB85C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
    if (v6 || (sub_2251077B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x646F6874656DLL && a2 == 0xE600000000000000;
      if (v7 || (sub_2251077B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6974656361467369 && a2 == 0xEE00656C6261656DLL;
        if (v8 || (sub_2251077B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x617373654D697369 && a2 == 0xEE00656C62616567;
          if (v9 || (sub_2251077B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_2251077B0();
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

uint64_t sub_2250FBAC4()
{
  return 6;
}

uint64_t sub_2250FBACC(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C6562616CLL;
      break;
    case 2:
      uint64_t result = 0x646F6874656DLL;
      break;
    case 3:
      uint64_t result = 0x6974656361467369;
      break;
    case 4:
      uint64_t result = 0x617373654D697369;
      break;
    case 5:
      uint64_t result = 0x7865646E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2250FBB9C()
{
  return sub_2250CD380();
}

uint64_t sub_2250FBBB8()
{
  return sub_2250FBACC(*v0);
}

uint64_t sub_2250FBBC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250FB85C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250FBBE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250FBAC4();
  *a1 = result;
  return result;
}

uint64_t sub_2250FBC10(uint64_t a1)
{
  unint64_t v2 = sub_2250FCE78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250FBC4C(uint64_t a1)
{
  unint64_t v2 = sub_2250FCE78();
  return MEMORY[0x270FA00B8](a1, v2);
}

void ContactHandle.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C17F8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_1();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCE78();
  OUTLINED_FUNCTION_40_4();
  sub_2251078B0();
  sub_225107740();
  if (!v0)
  {
    OUTLINED_FUNCTION_46_5();
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_7_5();
    sub_225107750();
    sub_225107750();
    sub_225107760();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_36_1();
}

void ContactHandle.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, char a11, char a12, char a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_34_1();
  a25 = v27;
  a26 = v28;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1808);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_48_3(v30);
  sub_2250FCE78();
  OUTLINED_FUNCTION_31_3();
  if (v26)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  else
  {
    a16 = 0;
    uint64_t v34 = OUTLINED_FUNCTION_10_5();
    uint64_t v36 = v35;
    a15 = 1;
    swift_bridgeObjectRetain();
    uint64_t v46 = OUTLINED_FUNCTION_10_5();
    a14 = 2;
    uint64_t v48 = v37;
    swift_bridgeObjectRetain();
    uint64_t v38 = OUTLINED_FUNCTION_10_5();
    uint64_t v47 = v39;
    uint64_t v45 = v38;
    a13 = 3;
    swift_bridgeObjectRetain();
    char v44 = OUTLINED_FUNCTION_26_4((uint64_t)&a13);
    a12 = 4;
    char v43 = OUTLINED_FUNCTION_26_4((uint64_t)&a12);
    uint64_t v40 = sub_2251076E0();
    uint64_t v41 = OUTLINED_FUNCTION_6_8();
    v42(v41);
    *(void *)uint64_t v32 = v34;
    *(void *)(v32 + 8) = v36;
    *(void *)(v32 + 16) = v46;
    *(void *)(v32 + 24) = v48;
    *(void *)(v32 + 32) = v45;
    *(void *)(v32 + 40) = v47;
    *(unsigned char *)(v32 + 48) = v44 & 1;
    *(unsigned char *)(v32 + 49) = v43 & 1;
    *(void *)(v32 + 56) = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_36_1();
}

#error "2250FC124: call analysis failed (funcsize=6)"

void sub_2250FC130()
{
}

uint64_t sub_2250FC148@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactHandle.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t EncodedContact.fullName.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t EncodedContact.base64EncodedViewData.getter()
{
  return OUTLINED_FUNCTION_5_12();
}

uint64_t sub_2250FC1C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000;
  if (v2 || (sub_2251077B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000225109660)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2251077B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2250FC2B8()
{
  return 2;
}

uint64_t sub_2250FC2C0(char a1)
{
  if (a1) {
    return 0xD000000000000015;
  }
  else {
    return 0x656D614E6C6C7566;
  }
}

uint64_t sub_2250FC2FC()
{
  return sub_2250FC2C0(*v0);
}

uint64_t sub_2250FC304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2250FC1C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2250FC32C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2250FC2B8();
  *a1 = result;
  return result;
}

uint64_t sub_2250FC354(uint64_t a1)
{
  unint64_t v2 = sub_2250FCEC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2250FC390(uint64_t a1)
{
  unint64_t v2 = sub_2250FCEC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

void EncodedContact.encode(to:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1810);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_39_1();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCEC4();
  OUTLINED_FUNCTION_40_4();
  sub_2251078B0();
  sub_225107740();
  if (!v0)
  {
    OUTLINED_FUNCTION_46_5();
    OUTLINED_FUNCTION_7_5();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_30_3();
  OUTLINED_FUNCTION_36_1();
}

void EncodedContact.init(from:)()
{
  OUTLINED_FUNCTION_34_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1820);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11_5();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2250FCEC4();
  sub_2251078A0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    uint64_t v10 = sub_2251076C0();
    uint64_t v12 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2251076C0();
    uint64_t v15 = v14;
    uint64_t v16 = v13;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    *uint64_t v5 = v10;
    v5[1] = v12;
    v5[2] = v16;
    v5[3] = v15;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_36_1();
}

void sub_2250FC67C()
{
}

void sub_2250FC694()
{
}

unint64_t sub_2250FC6AC()
{
  unint64_t result = qword_2680C16C0;
  if (!qword_2680C16C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16C0);
  }
  return result;
}

unint64_t sub_2250FC6F8()
{
  unint64_t result = qword_2680C16C8;
  if (!qword_2680C16C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16C8);
  }
  return result;
}

unint64_t sub_2250FC744()
{
  unint64_t result = qword_2680C16D0;
  if (!qword_2680C16D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16D0);
  }
  return result;
}

uint64_t sub_2250FC790(uint64_t a1)
{
  return a1;
}

unint64_t sub_2250FC7F4()
{
  unint64_t result = qword_2680C16D8;
  if (!qword_2680C16D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16D8);
  }
  return result;
}

unint64_t sub_2250FC840()
{
  unint64_t result = qword_2680C16E0;
  if (!qword_2680C16E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16E0);
  }
  return result;
}

unint64_t sub_2250FC88C()
{
  unint64_t result = qword_2680C16E8;
  if (!qword_2680C16E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16E8);
  }
  return result;
}

unint64_t sub_2250FC8D8()
{
  unint64_t result = qword_2680C16F0;
  if (!qword_2680C16F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C16F0);
  }
  return result;
}

uint64_t sub_2250FC928(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

unint64_t sub_2250FC9A4()
{
  unint64_t result = qword_2680C1720;
  if (!qword_2680C1720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1720);
  }
  return result;
}

unint64_t sub_2250FC9F0()
{
  unint64_t result = qword_2680C1728;
  if (!qword_2680C1728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1728);
  }
  return result;
}

unint64_t sub_2250FCA3C()
{
  unint64_t result = qword_2680C1730;
  if (!qword_2680C1730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1730);
  }
  return result;
}

unint64_t sub_2250FCA88()
{
  unint64_t result = qword_2680C1740;
  if (!qword_2680C1740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1740);
  }
  return result;
}

uint64_t sub_2250FCAD4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2250FCB40()
{
  unint64_t result = qword_2680C1770;
  if (!qword_2680C1770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1770);
  }
  return result;
}

uint64_t sub_2250FCB8C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2680C1748);
    sub_2250FCC0C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2250FCC0C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ContactDialogPerson(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2250FCC50()
{
  unint64_t result = qword_2680C1798;
  if (!qword_2680C1798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1798);
  }
  return result;
}

unint64_t sub_2250FCC9C()
{
  unint64_t result = qword_2680C17A8;
  if (!qword_2680C17A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C17A8);
  }
  return result;
}

unint64_t sub_2250FCCE8()
{
  unint64_t result = qword_2680C17C0;
  if (!qword_2680C17C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C17C0);
  }
  return result;
}

unint64_t sub_2250FCD34()
{
  unint64_t result = qword_2680C17D8;
  if (!qword_2680C17D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C17D8);
  }
  return result;
}

unint64_t sub_2250FCD80()
{
  unint64_t result = qword_2680C17E8;
  if (!qword_2680C17E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C17E8);
  }
  return result;
}

uint64_t sub_2250FCDCC(uint64_t a1)
{
  return a1;
}

unint64_t sub_2250FCE78()
{
  unint64_t result = qword_2680C1800;
  if (!qword_2680C1800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1800);
  }
  return result;
}

unint64_t sub_2250FCEC4()
{
  unint64_t result = qword_2680C1818;
  if (!qword_2680C1818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1818);
  }
  return result;
}

unint64_t sub_2250FCF14()
{
  unint64_t result = qword_2680C1828;
  if (!qword_2680C1828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1828);
  }
  return result;
}

unint64_t sub_2250FCF64()
{
  unint64_t result = qword_2680C1830;
  if (!qword_2680C1830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1830);
  }
  return result;
}

uint64_t sub_2250FCFB0()
{
  return MEMORY[0x263F8D320];
}

uint64_t destroy for ContactDisambiguationSnippetPluginModel(uint64_t a1)
{
  return sub_2250D90E0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(unsigned char *)(a1 + 136));
}

uint64_t initializeWithCopy for ContactDisambiguationSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  uint64_t v20 = *(void *)(a2 + 128);
  char v21 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v20;
  *(unsigned char *)(a1 + 136) = v21;
  return a1;
}

uint64_t assignWithCopy for ContactDisambiguationSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  uint64_t v34 = *(void *)(a2 + 128);
  char v35 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 128);
  char v25 = *(unsigned char *)(a1 + 136);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(void *)(a1 + 128) = v34;
  *(unsigned char *)(a1 + 136) = v35;
  sub_2250D90E0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25);
  return a1;
}

void *__swift_memcpy137_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x89uLL);
}

uint64_t assignWithTake for ContactDisambiguationSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 128);
  char v4 = *(unsigned char *)(a2 + 136);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 112);
  uint64_t v17 = *(void *)(a1 + 128);
  char v18 = *(unsigned char *)(a1 + 136);
  long long v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v19;
  long long v20 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v20;
  long long v21 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v21;
  long long v22 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v22;
  *(void *)(a1 + 128) = v3;
  *(unsigned char *)(a1 + 136) = v4;
  sub_2250D90E0(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactDisambiguationSnippetPluginModel(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 137))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 136);
      if (v3 <= 2) {
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

uint64_t storeEnumTagSinglePayload for ContactDisambiguationSnippetPluginModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 136) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 137) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 137) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 136) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2250FD3C4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 136) = a2;
  return result;
}

void type metadata accessor for ContactDisambiguationSnippetPluginModel()
{
}

uint64_t destroy for ContactDisambiguationModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ContactDisambiguationModel(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ContactDisambiguationModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ContactDisambiguationModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactDisambiguationModel(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ContactDisambiguationModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ContactDisambiguationModel()
{
}

uint64_t destroy for ContactHandleDisambiguationModel()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContactHandleDisambiguationModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContactHandleDisambiguationModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for ContactHandleDisambiguationModel(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactHandleDisambiguationModel(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ContactHandleDisambiguationModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ContactHandleDisambiguationModel()
{
}

uint64_t destroy for ContactConfirmationModel()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ContactConfirmationModel(void *a1, void *a2)
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
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  uint64_t v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  uint64_t v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
  a1[16] = a2[16];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ContactConfirmationModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy136_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

void *assignWithTake for ContactConfirmationModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[10];
  a1[9] = a2[9];
  a1[10] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[12];
  a1[11] = a2[11];
  a1[12] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[14];
  a1[13] = a2[13];
  a1[14] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[16];
  a1[15] = a2[15];
  a1[16] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactConfirmationModel(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 136))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ContactConfirmationModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ContactConfirmationModel()
{
}

uint64_t initializeWithCopy for ContactHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContactHandle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for ContactHandle(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactHandle(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for ContactHandle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ContactHandle()
{
}

uint64_t destroy for EncodedContact()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EncodedContact(void *a1, void *a2)
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

void *assignWithCopy for EncodedContact(void *a1, void *a2)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for EncodedContact(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for EncodedContact(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EncodedContact(uint64_t result, int a2, int a3)
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

void type metadata accessor for EncodedContact()
{
}

unsigned char *storeEnumTagSinglePayload for EncodedContact.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250FE2D4);
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

ValueMetadata *type metadata accessor for EncodedContact.CodingKeys()
{
  return &type metadata for EncodedContact.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ContactHandle.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250FE3D8);
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

ValueMetadata *type metadata accessor for ContactHandle.CodingKeys()
{
  return &type metadata for ContactHandle.CodingKeys;
}

ValueMetadata *type metadata accessor for ContactConfirmationModel.CodingKeys()
{
  return &type metadata for ContactConfirmationModel.CodingKeys;
}

unsigned char *_s17SiriInferenceFlow24ContactConfirmationModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2250FE4F4);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactHandleDisambiguationModel.CodingKeys()
{
  return &type metadata for ContactHandleDisambiguationModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContactDisambiguationModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactDisambiguationModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250FE680);
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

ValueMetadata *type metadata accessor for ContactDisambiguationModel.CodingKeys()
{
  return &type metadata for ContactDisambiguationModel.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ContactDisambiguationSnippetPluginModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2250FE784);
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

ValueMetadata *type metadata accessor for ContactDisambiguationSnippetPluginModel.CodingKeys()
{
  return &type metadata for ContactDisambiguationSnippetPluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for ContactDisambiguationSnippetPluginModel.ContactDisambiguationCodingKeys()
{
  return &type metadata for ContactDisambiguationSnippetPluginModel.ContactDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for ContactDisambiguationSnippetPluginModel.ContactHandleDisambiguationCodingKeys()
{
  return &type metadata for ContactDisambiguationSnippetPluginModel.ContactHandleDisambiguationCodingKeys;
}

unsigned char *_s17SiriInferenceFlow39ContactDisambiguationSnippetPluginModelO31ContactDisambiguationCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2250FE880);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactDisambiguationSnippetPluginModel.ContactConfirmationCodingKeys()
{
  return &type metadata for ContactDisambiguationSnippetPluginModel.ContactConfirmationCodingKeys;
}

unint64_t sub_2250FE8BC()
{
  unint64_t result = qword_2680C1838;
  if (!qword_2680C1838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1838);
  }
  return result;
}

unint64_t sub_2250FE90C()
{
  unint64_t result = qword_2680C1840;
  if (!qword_2680C1840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1840);
  }
  return result;
}

unint64_t sub_2250FE95C()
{
  unint64_t result = qword_2680C1848;
  if (!qword_2680C1848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1848);
  }
  return result;
}

unint64_t sub_2250FE9AC()
{
  unint64_t result = qword_2680C1850;
  if (!qword_2680C1850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1850);
  }
  return result;
}

unint64_t sub_2250FE9FC()
{
  unint64_t result = qword_2680C1858;
  if (!qword_2680C1858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1858);
  }
  return result;
}

unint64_t sub_2250FEA4C()
{
  unint64_t result = qword_2680C1860;
  if (!qword_2680C1860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1860);
  }
  return result;
}

unint64_t sub_2250FEA9C()
{
  unint64_t result = qword_2680C1868;
  if (!qword_2680C1868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1868);
  }
  return result;
}

unint64_t sub_2250FEAEC()
{
  unint64_t result = qword_2680C1870;
  if (!qword_2680C1870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1870);
  }
  return result;
}

unint64_t sub_2250FEB3C()
{
  unint64_t result = qword_2680C1878;
  if (!qword_2680C1878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1878);
  }
  return result;
}

unint64_t sub_2250FEB8C()
{
  unint64_t result = qword_2680C1880;
  if (!qword_2680C1880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1880);
  }
  return result;
}

unint64_t sub_2250FEBDC()
{
  unint64_t result = qword_2680C1888;
  if (!qword_2680C1888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1888);
  }
  return result;
}

unint64_t sub_2250FEC2C()
{
  unint64_t result = qword_2680C1890;
  if (!qword_2680C1890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1890);
  }
  return result;
}

unint64_t sub_2250FEC7C()
{
  unint64_t result = qword_2680C1898;
  if (!qword_2680C1898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1898);
  }
  return result;
}

unint64_t sub_2250FECCC()
{
  unint64_t result = qword_2680C18A0;
  if (!qword_2680C18A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18A0);
  }
  return result;
}

unint64_t sub_2250FED1C()
{
  unint64_t result = qword_2680C18A8;
  if (!qword_2680C18A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18A8);
  }
  return result;
}

unint64_t sub_2250FED6C()
{
  unint64_t result = qword_2680C18B0;
  if (!qword_2680C18B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18B0);
  }
  return result;
}

unint64_t sub_2250FEDBC()
{
  unint64_t result = qword_2680C18B8;
  if (!qword_2680C18B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18B8);
  }
  return result;
}

unint64_t sub_2250FEE0C()
{
  unint64_t result = qword_2680C18C0;
  if (!qword_2680C18C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18C0);
  }
  return result;
}

unint64_t sub_2250FEE5C()
{
  unint64_t result = qword_2680C18C8;
  if (!qword_2680C18C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18C8);
  }
  return result;
}

unint64_t sub_2250FEEAC()
{
  unint64_t result = qword_2680C18D0;
  if (!qword_2680C18D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18D0);
  }
  return result;
}

unint64_t sub_2250FEEFC()
{
  unint64_t result = qword_2680C18D8;
  if (!qword_2680C18D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18D8);
  }
  return result;
}

unint64_t sub_2250FEF4C()
{
  unint64_t result = qword_2680C18E0;
  if (!qword_2680C18E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18E0);
  }
  return result;
}

unint64_t sub_2250FEF9C()
{
  unint64_t result = qword_2680C18E8;
  if (!qword_2680C18E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18E8);
  }
  return result;
}

unint64_t sub_2250FEFEC()
{
  unint64_t result = qword_2680C18F0;
  if (!qword_2680C18F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18F0);
  }
  return result;
}

unint64_t sub_2250FF03C()
{
  unint64_t result = qword_2680C18F8;
  if (!qword_2680C18F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C18F8);
  }
  return result;
}

unint64_t sub_2250FF08C()
{
  unint64_t result = qword_2680C1900;
  if (!qword_2680C1900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1900);
  }
  return result;
}

unint64_t sub_2250FF0DC()
{
  unint64_t result = qword_2680C1908;
  if (!qword_2680C1908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2680C1908);
  }
  return result;
}

uint64_t sub_2250FF128(uint64_t a1)
{
  sub_2250D90E0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(unsigned char *)(a1 + 136));
  return swift_bridgeObjectRelease();
}

uint64_t sub_2250FF19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v14 = *(void *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 80);
  uint64_t v16 = *(void *)(a2 + 88);
  uint64_t v17 = *(void *)(a2 + 96);
  uint64_t v18 = *(void *)(a2 + 104);
  uint64_t v19 = *(void *)(a2 + 112);
  uint64_t v20 = *(void *)(a2 + 120);
  uint64_t v21 = *(void *)(a2 + 128);
  char v22 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v17;
  *(void *)(a1 + 104) = v18;
  *(void *)(a1 + 112) = v19;
  *(void *)(a1 + 120) = v20;
  *(void *)(a1 + 128) = v21;
  *(unsigned char *)(a1 + 136) = v22;
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2250FF2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v27 = *(void *)(a2 + 64);
  uint64_t v28 = *(void *)(a2 + 72);
  uint64_t v29 = *(void *)(a2 + 80);
  uint64_t v30 = *(void *)(a2 + 88);
  uint64_t v31 = *(void *)(a2 + 96);
  uint64_t v32 = *(void *)(a2 + 104);
  uint64_t v33 = *(void *)(a2 + 112);
  uint64_t v34 = *(void *)(a2 + 120);
  uint64_t v35 = *(void *)(a2 + 128);
  char v36 = *(unsigned char *)(a2 + 136);
  sub_2250D8F0C(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 128);
  char v25 = *(unsigned char *)(a1 + 136);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v27;
  *(void *)(a1 + 72) = v28;
  *(void *)(a1 + 80) = v29;
  *(void *)(a1 + 88) = v30;
  *(void *)(a1 + 96) = v31;
  *(void *)(a1 + 104) = v32;
  *(void *)(a1 + 112) = v33;
  *(void *)(a1 + 120) = v34;
  *(void *)(a1 + 128) = v35;
  *(unsigned char *)(a1 + 136) = v36;
  sub_2250D90E0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy152_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x98uLL);
}

uint64_t sub_2250FF464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 128);
  char v5 = *(unsigned char *)(a2 + 136);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)(a1 + 112);
  uint64_t v18 = *(void *)(a1 + 128);
  char v19 = *(unsigned char *)(a1 + 136);
  long long v20 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v20;
  long long v21 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v21;
  long long v22 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v22;
  long long v23 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v23;
  *(void *)(a1 + 128) = v4;
  *(unsigned char *)(a1 + 136) = v5;
  sub_2250D90E0(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18, v19);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2250FF514(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 152))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 144);
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

uint64_t sub_2250FF554(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
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
      *(void *)(result + 144) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PresentationModel()
{
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return sub_225107740();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_2251076C0();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_2251076C0();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_225107770();
}

BOOL OUTLINED_FUNCTION_16_4@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_20_5(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  return sub_2251076F0();
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_4(uint64_t a1)
{
  return MEMORY[0x270F9F2F0](a1, v1);
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return sub_2251078A0();
}

uint64_t OUTLINED_FUNCTION_32_5@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 72) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_33_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return v0;
}

void OUTLINED_FUNCTION_38_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_39_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_225107680();
}

uint64_t OUTLINED_FUNCTION_43_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_44_5()
{
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_45_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_5()
{
  *(unsigned char *)(v0 - 66) = 1;
  return *(void *)(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_47_3()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_48_3(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return sub_2251076F0();
}

uint64_t OUTLINED_FUNCTION_50_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52_4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  *a1 = v1[9];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2250FF9CC()
{
  uint64_t result = sub_225105E90();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_225105F40();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_2250FFAD4(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_2251075A0();
    uint64_t v9 = *(void *)(sub_225105E90() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_225107580();
      sub_2251075B0();
      sub_2251075C0();
      sub_225107590();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2250FFC1C()
{
  OUTLINED_FUNCTION_19_5();
  uint64_t v0 = swift_allocObject();
  sub_2250FFFD8();
  return v0;
}

char *sub_2250FFC7C(void (*a1)(void *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  void (*v30)(void *__return_ptr, char *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void v34[3];
  char *v35;

  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v5 = sub_225105E90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10E0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  v25[1] = a3;
  if (v12)
  {
    long long v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v28 = (void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v29 = v14;
    uint64_t v26 = v16;
    uint64_t v27 = (void (**)(char *, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    uint64_t v35 = (char *)MEMORY[0x263F8EE78];
    long long v25[2] = v13;
    while (1)
    {
      v29(v11, v15, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v5);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v5) == 1) {
        break;
      }
      (*v28)(v8, v11, v5);
      v30(v34, v8);
      if (v3)
      {
        (*v27)(v8, v5);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v35;
      }
      long long v17 = v8;
      (*v27)(v8, v5);
      uint64_t v18 = v34[0];
      if (v34[0])
      {
        uint64_t v32 = v34[2];
        uint64_t v33 = v34[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v35 = sub_225102F1C(0, *((void *)v35 + 2) + 1, 1, (uint64_t)v35);
        }
        unint64_t v20 = *((void *)v35 + 2);
        unint64_t v19 = *((void *)v35 + 3);
        if (v20 >= v19 >> 1) {
          uint64_t v35 = sub_225102F1C((char *)(v19 > 1), v20 + 1, 1, (uint64_t)v35);
        }
        long long v21 = v35;
        *((void *)v35 + 2) = v20 + 1;
        long long v22 = &v21[24 * v20];
        uint64_t v23 = v33;
        *((void *)v22 + 4) = v18;
        *((void *)v22 + 5) = v23;
        *((void *)v22 + 6) = v32;
      }
      v15 += v26;
      --v12;
      uint64_t v8 = v17;
      if (!v12) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = (char *)MEMORY[0x263F8EE78];
LABEL_14:
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v5);
  }
  swift_bridgeObjectRelease();
  return v35;
}

uint64_t sub_2250FFF98()
{
  return sub_225107880();
}

void sub_2250FFFD8()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_19_5();
  uint64_t v6 = *v0;
  uint64_t v7 = (uint64_t)v0 + qword_2680C1910;
  uint64_t v8 = sub_225105E90();
  OUTLINED_FUNCTION_23_2();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v10(v7, v3, v8);
  v10((uint64_t)v0 + qword_2680C1918, v2, v8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 80) - 8) + 32))((uint64_t)v0 + *(void *)(*v0 + 120), v1);
  uint64_t v11 = (uint64_t)v0 + qword_2680C1920;
  sub_225105F40();
  OUTLINED_FUNCTION_23_2();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, v5);
  OUTLINED_FUNCTION_5_4();
}

void sub_225100110()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v128 = v3;
  uint64_t v129 = v2;
  OUTLINED_FUNCTION_2_1();
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19D0);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_7();
  uint64_t v130 = v7;
  OUTLINED_FUNCTION_15_4();
  sub_225106670();
  OUTLINED_FUNCTION_0();
  uint64_t v131 = v8;
  uint64_t v132 = v9;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_57_0();
  int v123 = v10;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v11);
  id v124 = (char *)&v119 - v12;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v13);
  uint64_t v121 = (char *)&v119 - v14;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v15);
  os_log_type_t v122 = (char *)&v119 - v16;
  OUTLINED_FUNCTION_15_4();
  uint64_t v17 = sub_225106630();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v22 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19B0);
  uint64_t v24 = sub_225105E90();
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v25;
  uint64_t v28 = *(void *)(v27 + 72);
  unint64_t v29 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_22510C7A0;
  unint64_t v31 = v30 + v29;
  uint64_t v32 = *(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 16);
  v32(v31, v1 + qword_2680C1910, v24);
  v32(v31 + v28, v1 + qword_2680C1918, v24);
  uint64_t v33 = sub_2250FFAD4((void (*)(uint64_t *__return_ptr, uint64_t))sub_22510385C, v1, v30);
  swift_setDeallocating();
  sub_225102C3C();
  sub_2251065A0();
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 88))(v23, v17);
  if (v34 == *MEMORY[0x263F6FF50])
  {
    uint64_t v35 = OUTLINED_FUNCTION_15_5();
    v36(v35);
    uint64_t v37 = v131;
    uint64_t v38 = v124;
    (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v124, v23, v131);
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_2251070F0();
    uint64_t v40 = __swift_project_value_buffer(v39, (uint64_t)qword_2680C5BC0);
    uint64_t v41 = v123;
    (*(void (**)(void (*)(char *, uint64_t), char *, uint64_t))(v132 + 16))(v123, v38, v37);
    uint64_t v125 = (uint8_t *)v40;
    uint64_t v42 = sub_2251070D0();
    os_log_type_t v43 = sub_225107380();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v120 = v33;
      char v44 = (uint8_t *)OUTLINED_FUNCTION_22_4();
      v134[0] = OUTLINED_FUNCTION_21_3();
      *(_DWORD *)char v44 = 136315138;
      uint64_t v33 = (uint64_t)(v44 + 4);
      sub_22510387C(&qword_2680C19D8, MEMORY[0x263F73760]);
      uint64_t v45 = sub_2251077A0();
      uint64_t v47 = OUTLINED_FUNCTION_24_5(v45, v46);
      OUTLINED_FUNCTION_14_4(v47);
      uint64_t v38 = v124;
      sub_225107420();
      swift_bridgeObjectRelease();
      uint64_t v48 = OUTLINED_FUNCTION_11_6();
      v49(v48);
      _os_log_impl(&dword_2250AF000, v42, v43, "parsing disambiguation result, (nlv3 only), nlIntent: %s", v44, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_7_1();
    }
    else
    {
      uint64_t v71 = OUTLINED_FUNCTION_11_6();
      v72(v71);
    }

    (*(void (**)(void *__return_ptr, uint64_t, char *, void, void))(*(void *)(v126 + 88) + 40))(v134, v33, v38, *(void *)(v126 + 80), *(void *)(v126 + 88));
    swift_bridgeObjectRelease();
    uint64_t v73 = v134[0];
    if (v134[0])
    {
      swift_retain_n();
      uint64_t v74 = sub_2251070D0();
      os_log_type_t v75 = sub_225107380();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = (uint8_t *)OUTLINED_FUNCTION_22_4();
        uint64_t v126 = OUTLINED_FUNCTION_21_3();
        uint64_t v133 = v73;
        v134[0] = v126;
        *(_DWORD *)uint64_t v76 = 136315138;
        uint64_t v125 = v76 + 4;
        sub_225106A90();
        sub_22510387C(qword_2680C0FA0, MEMORY[0x263F6D778]);
        uint64_t v77 = sub_2251077A0();
        uint64_t v133 = OUTLINED_FUNCTION_24_5(v77, v78);
        uint64_t v37 = v131;
        sub_225107420();
        OUTLINED_FUNCTION_69_0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2250AF000, v74, v75, "Picked datetime after disambiguation (nlv3 only): %s", v76, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_7_1();
      }
      else
      {

        OUTLINED_FUNCTION_69_0();
      }
      v134[0] = v73;
      sub_225106A90();
      OUTLINED_FUNCTION_27_7();
      swift_storeEnumTagMultiPayload();
      uint64_t v95 = OUTLINED_FUNCTION_7_6();
      v96(v95);
      swift_release();
    }
    else
    {
      uint64_t v74 = type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
      swift_getWitnessTable();
      uint64_t v91 = OUTLINED_FUNCTION_6_9();
      *uint64_t v92 = 2;
      OUTLINED_FUNCTION_8_9(v91);
      uint64_t v93 = OUTLINED_FUNCTION_7_6();
      v94(v93);
    }
    sub_2250DF5F4((uint64_t)v74, &qword_2680C19D0);
    v41(v38, v37);
  }
  else
  {
    int v50 = v34;
    if (v34 == *MEMORY[0x263F6FF78])
    {
      uint64_t v51 = OUTLINED_FUNCTION_15_5();
      v52(v51);
      __swift_instantiateConcreteTypeFromMangledName(qword_2680C1240);
      swift_release();
      uint64_t v53 = v132;
      uint64_t v54 = v122;
      uint64_t v55 = v23;
      uint64_t v56 = v131;
      (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v122, v55, v131);
      if (qword_2680C0698 != -1) {
        swift_once();
      }
      uint64_t v57 = sub_2251070F0();
      uint64_t v58 = __swift_project_value_buffer(v57, (uint64_t)qword_2680C5BC0);
      uint64_t v59 = v121;
      uint64_t v60 = OUTLINED_FUNCTION_17_2();
      v61(v60);
      uint64_t v125 = (uint8_t *)v58;
      uint64_t v62 = sub_2251070D0();
      os_log_type_t v63 = sub_225107380();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v120 = v33;
        uint64_t v64 = (uint8_t *)OUTLINED_FUNCTION_22_4();
        v134[0] = OUTLINED_FUNCTION_21_3();
        *(_DWORD *)uint64_t v64 = 136315138;
        uint64_t v33 = (uint64_t)(v64 + 4);
        sub_22510387C(&qword_2680C19D8, MEMORY[0x263F73760]);
        uint64_t v65 = sub_2251077A0();
        uint64_t v67 = OUTLINED_FUNCTION_24_5(v65, v66);
        OUTLINED_FUNCTION_14_4(v67);
        uint64_t v54 = v122;
        sub_225107420();
        swift_bridgeObjectRelease();
        uint64_t v68 = *(void (**)(char *, uint64_t))(v132 + 8);
        v68(v59, v131);
        _os_log_impl(&dword_2250AF000, v62, v63, "parsing disambiguation result, (nlv3 plus server conversion), nlIntent: %s", v64, 0xCu);
        swift_arrayDestroy();
        uint64_t v69 = v131;
        OUTLINED_FUNCTION_7_1();
        uint64_t v70 = v68;
        OUTLINED_FUNCTION_7_1();
      }
      else
      {
        uint64_t v70 = *(void (**)(char *, uint64_t))(v53 + 8);
        v70(v59, v56);

        uint64_t v69 = v56;
      }
      (*(void (**)(void *__return_ptr, uint64_t, char *, void, void))(*(void *)(v126 + 88) + 40))(v134, v33, v54, *(void *)(v126 + 80), *(void *)(v126 + 88));
      swift_bridgeObjectRelease();
      uint64_t v97 = v134[0];
      if (v134[0])
      {
        swift_retain_n();
        uint64_t v98 = sub_2251070D0();
        os_log_type_t v99 = sub_225107380();
        if (os_log_type_enabled(v98, v99))
        {
          uint64_t v100 = (uint8_t *)OUTLINED_FUNCTION_22_4();
          uint64_t v101 = OUTLINED_FUNCTION_21_3();
          uint64_t v126 = (uint64_t)v70;
          uint64_t v133 = v97;
          v134[0] = v101;
          *(_DWORD *)uint64_t v100 = 136315138;
          sub_225106A90();
          sub_22510387C(qword_2680C0FA0, MEMORY[0x263F6D778]);
          uint64_t v69 = v131;
          uint64_t v102 = sub_2251077A0();
          uint64_t v133 = OUTLINED_FUNCTION_24_5(v102, v103);
          uint64_t v54 = v122;
          sub_225107420();
          OUTLINED_FUNCTION_69_0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2250AF000, v98, v99, "Picked datetime after disambiguation (nlv3 plus server conversion): %s", v100, 0xCu);
          swift_arrayDestroy();
          uint64_t v70 = (void (*)(char *, uint64_t))v126;
          OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_7_1();
        }
        else
        {

          OUTLINED_FUNCTION_69_0();
        }
        v134[0] = v97;
        sub_225106A90();
        OUTLINED_FUNCTION_27_7();
        swift_storeEnumTagMultiPayload();
        uint64_t v117 = OUTLINED_FUNCTION_7_6();
        v118(v117);
        swift_release();
      }
      else
      {
        uint64_t v98 = type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
        swift_getWitnessTable();
        uint64_t v113 = OUTLINED_FUNCTION_6_9();
        *uint64_t v114 = 2;
        OUTLINED_FUNCTION_8_9(v113);
        uint64_t v115 = OUTLINED_FUNCTION_7_6();
        v116(v115);
      }
      sub_2250DF5F4((uint64_t)v98, &qword_2680C19D0);
      v70(v54, v69);
    }
    else
    {
      int v79 = *MEMORY[0x263F6FF70];
      swift_bridgeObjectRelease();
      if (v50 == v79)
      {
        uint64_t v80 = OUTLINED_FUNCTION_21_4();
        v81(v80);
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v82 = sub_2251070F0();
        __swift_project_value_buffer(v82, (uint64_t)qword_2680C5BC0);
        unint64_t v83 = sub_2251070D0();
        os_log_type_t v84 = sub_225107380();
        if (os_log_type_enabled(v83, v84))
        {
          int v85 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int v85 = 0;
          _os_log_impl(&dword_2250AF000, v83, v84, "got direct invocation omg", v85, 2u);
          OUTLINED_FUNCTION_7_1();
        }

        uint64_t v86 = type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
        swift_getWitnessTable();
        uint64_t v87 = OUTLINED_FUNCTION_6_9();
        *uint64_t v88 = 0;
        OUTLINED_FUNCTION_8_9(v87);
        uint64_t v89 = OUTLINED_FUNCTION_7_6();
        v90(v89);
        sub_2250DF5F4(v86, &qword_2680C19D0);
      }
      else
      {
        if (qword_2680C0698 != -1) {
          swift_once();
        }
        uint64_t v104 = sub_2251070F0();
        __swift_project_value_buffer(v104, (uint64_t)qword_2680C5BC0);
        uint64_t v105 = sub_2251070D0();
        os_log_type_t v106 = sub_225107380();
        if (os_log_type_enabled(v105, v106))
        {
          uint64_t v107 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v107 = 0;
          _os_log_impl(&dword_2250AF000, v105, v106, "received unsupported parse", v107, 2u);
          OUTLINED_FUNCTION_7_1();
        }

        type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
        swift_getWitnessTable();
        uint64_t v108 = OUTLINED_FUNCTION_26_5();
        *uint64_t v109 = 0;
        uint64_t v110 = (uint64_t)v130;
        uint64_t *v130 = v108;
        swift_storeEnumTagMultiPayload();
        v129(v110);
        sub_2250DF5F4(v110, &qword_2680C19D0);
        uint64_t v111 = OUTLINED_FUNCTION_21_4();
        v112(v111);
      }
    }
  }
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_225100E64@<X0>(uint64_t *a1@<X8>)
{
  sub_2250DA42C();
  sub_225106A90();
  swift_allocObject();
  uint64_t result = sub_2251069B0();
  *a1 = result;
  return result;
}

void sub_225100ED4()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v65 = v2;
  uint64_t v64 = v3;
  OUTLINED_FUNCTION_2_1();
  uint64_t v86 = v4;
  uint64_t v83 = sub_2251064E0();
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_7();
  uint64_t v82 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19A8);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_4_7();
  uint64_t v81 = v9;
  OUTLINED_FUNCTION_15_4();
  uint64_t v80 = sub_225106470();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_4_7();
  uint64_t v79 = v12;
  OUTLINED_FUNCTION_15_4();
  uint64_t v78 = sub_225106300();
  OUTLINED_FUNCTION_0();
  uint64_t v68 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_57_0();
  uint64_t v77 = v15;
  OUTLINED_FUNCTION_28_1();
  MEMORY[0x270FA5388](v16);
  uint64_t v76 = (char *)v59 - v17;
  OUTLINED_FUNCTION_15_4();
  uint64_t v75 = sub_225106430();
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_4_7();
  uint64_t v84 = v20;
  OUTLINED_FUNCTION_15_4();
  sub_225106E50();
  swift_allocObject();
  sub_225106E40();
  uint64_t v21 = v0 + qword_2680C1910;
  sub_225105E80();
  sub_225106E30();
  swift_release();
  uint64_t v63 = sub_225106E20();
  swift_release();
  swift_allocObject();
  sub_225106E40();
  uint64_t v22 = v0 + qword_2680C1918;
  sub_225105E80();
  sub_225106E30();
  swift_release();
  uint64_t v23 = sub_225106E20();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19B0);
  uint64_t v24 = sub_225105E90();
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v25;
  uint64_t v28 = *(void *)(v27 + 72);
  unint64_t v29 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_22510C7A0;
  unint64_t v31 = v30 + v29;
  uint64_t v32 = *(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 16);
  v32(v31, v21, v24);
  v32(v31 + v28, v22, v24);
  uint64_t v33 = sub_2250FFC7C((void (*)(void *__return_ptr, char *))sub_2251037E0, v1, v30);
  swift_setDeallocating();
  sub_225102C3C();
  if (*((void *)v33 + 2) == 2)
  {
    v59[1] = v23;
    uint64_t v60 = (uint64_t *)v1;
    v88[0] = MEMORY[0x263F8EE78];
    sub_2250CE550();
    int v34 = 0;
    uint64_t v35 = 0;
    uint64_t v62 = v33;
    uint64_t v74 = v33 + 32;
    uint64_t v73 = (void (**)(uint64_t, char *, uint64_t))(v68 + 16);
    uint64_t v36 = v61;
    uint64_t v72 = v61 + 16;
    unsigned int v71 = *MEMORY[0x263F6FD28];
    uint64_t v70 = (void (**)(uint64_t, void, uint64_t))(v87 + 104);
    uint64_t v69 = v61 + 8;
    v68 += 8;
    uint64_t v67 = v85 + 32;
    long long v66 = xmmword_22510BA10;
    uint64_t v37 = v76;
    uint64_t v38 = v78;
    do
    {
      LODWORD(v87) = v34;
      uint64_t v86 = *(void *)&v74[24 * v35];
      swift_bridgeObjectRetain_n();
      swift_retain();
      OUTLINED_FUNCTION_17_2();
      sub_2251062E0();
      (*v73)(v77, v37, v38);
      __swift_storeEnumTagSinglePayload(v81, 1, 1, v38);
      swift_bridgeObjectRetain();
      uint64_t v39 = v79;
      OUTLINED_FUNCTION_17_2();
      sub_225106450();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19B8);
      unint64_t v40 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = v66;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 16))(v41 + v40, v39, v80);
      (*v70)(v82, v71, v83);
      OUTLINED_FUNCTION_17_2();
      sub_2251063E0();
      OUTLINED_FUNCTION_5_6();
      v42();
      OUTLINED_FUNCTION_5_6();
      v43();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v44 = v88[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2250CE550();
        uint64_t v44 = v88[0];
      }
      unint64_t v45 = *(void *)(v44 + 16);
      uint64_t v46 = v84;
      if (v45 >= *(void *)(v44 + 24) >> 1)
      {
        sub_2250CE550();
        uint64_t v44 = v88[0];
      }
      *(void *)(v44 + 16) = v45 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v85 + 32))(v44+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(void *)(v85 + 72) * v45, v46, v75);
      v88[0] = v44;
      int v34 = 1;
      uint64_t v35 = 1;
    }
    while ((v87 & 1) == 0);
    v88[0] = MEMORY[0x263F8EE78];
    sub_2251075A0();
    uint64_t v49 = *((void *)v62 + 2);
    swift_bridgeObjectRetain();
    int v50 = v60;
    if (v49)
    {
      uint64_t v51 = 0;
      uint64_t v52 = (uint64_t *)(v62 + 48);
      do
      {
        uint64_t v54 = *(v52 - 1);
        uint64_t v53 = *v52;
        uint64_t v55 = *(v52 - 2);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_225101910(v51, v55, v54, v53, v50);
        swift_bridgeObjectRelease();
        swift_release();
        sub_225107580();
        sub_2251075B0();
        sub_2251075C0();
        sub_225107590();
        v52 += 3;
        ++v51;
      }
      while (v49 != v51);
    }
    swift_bridgeObjectRelease();
    uint64_t v56 = v88[0];
    swift_bridgeObjectRelease();
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v64;
    v57[2] = v56;
    v57[3] = v58;
    v57[4] = v65;
    v57[5] = v50;
    v57[6] = v44;
    swift_retain();
    swift_retain();
    sub_225102114();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
    swift_getWitnessTable();
    uint64_t v47 = OUTLINED_FUNCTION_6_9();
    *uint64_t v48 = 1;
    v88[0] = v47;
    char v89 = 1;
    v64(v88);
    swift_release();
    swift_release();
    sub_2250DF5F4((uint64_t)v88, (uint64_t *)&unk_2680C11E0);
  }
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_22510175C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225106E50();
  swift_allocObject();
  sub_225106E40();
  sub_225105E80();
  sub_225106E30();
  swift_release();
  sub_225106E20();
  swift_release();
  sub_225106E10();
  uint64_t v5 = sub_225106F50();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    swift_release();
    uint64_t result = sub_2250DF5F4((uint64_t)v4, &qword_2680C0AB0);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_225106F30();
    uint64_t v9 = v10;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    uint64_t v7 = sub_2250DA42C();
    uint64_t result = swift_release();
  }
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  return result;
}

uint64_t sub_225101910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = *a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22510C2B0;
  sub_225106120();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2251060F0();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_225106110();
  swift_release();
  *(void *)(v7 + 32) = v8;
  sub_225107300();
  sub_225106A90();
  swift_allocObject();
  swift_retain();
  uint64_t v11 = sub_2251069B0();
  (*(void (**)(uint64_t *, uint64_t, void))(*(void *)(v6 + 88) + 48))(&v11, a1, *(void *)(v6 + 80));
  swift_release();
  sub_2251060A0();
  swift_allocObject();
  uint64_t v9 = sub_225106090();
  swift_release();
  return v9;
}

uint64_t sub_225101AC4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v33 = a6;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v32 = a2;
  uint64_t v35 = *a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1118);
  MEMORY[0x270FA5388](v7 - 8);
  int v34 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2251064A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_225106430();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2250E2CC8(a1, (uint64_t)v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
    swift_getWitnessTable();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = 0;
    v42[0] = v20;
    char v45 = 1;
    v36(v42);
    sub_2250DF5F4((uint64_t)v42, (uint64_t *)&unk_2680C11E0);
    uint64_t v22 = (uint64_t *)&unk_2680C1200;
    uint64_t v23 = v19;
  }
  else
  {
    uint64_t v31 = v14;
    uint64_t v24 = *(void (**)(char *, uint64_t *, uint64_t))(v14 + 32);
    uint64_t v30 = v13;
    v24(v16, v19, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_22510C2B0;
    sub_225106640();
    __swift_project_boxed_opaque_existential_1(v42, v43);
    sub_225106490();
    sub_2251061C0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    *(void *)(v25 + 32) = sub_225106140();
    v42[0] = v25;
    sub_225107300();
    sub_225106640();
    sub_225106640();
    __swift_project_boxed_opaque_existential_1(v40, v40[3]);
    sub_2251061E0();
    uint64_t v26 = (uint64_t)v34;
    (*(void (**)(uint64_t, void))(*(void *)(v35 + 88) + 64))(v33, *(void *)(v35 + 80));
    uint64_t v27 = sub_225106390();
    __swift_storeEnumTagSinglePayload(v26, 0, 1, v27);
    uint64_t v28 = sub_225106650();
    memset(v38, 0, sizeof(v38));
    uint64_t v39 = 0;
    uint64_t v43 = v28;
    uint64_t v44 = MEMORY[0x263F6FFF0];
    __swift_allocate_boxed_opaque_existential_1(v42);
    sub_225106320();
    swift_bridgeObjectRelease();
    sub_2250DF5F4((uint64_t)v38, &qword_2680C1220);
    sub_2250DF5F4(v26, &qword_2680C1118);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    char v45 = 0;
    v36(v42);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
    uint64_t v22 = (uint64_t *)&unk_2680C11E0;
    uint64_t v23 = v42;
  }
  return sub_2250DF5F4((uint64_t)v23, v22);
}

uint64_t sub_225102000(void (*a1)(void *))
{
  type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError();
  swift_getWitnessTable();
  uint64_t v2 = OUTLINED_FUNCTION_26_5();
  *uint64_t v3 = 0;
  v5[0] = v2;
  char v6 = 1;
  a1(v5);
  return sub_2250DF5F4((uint64_t)v5, (uint64_t *)&unk_2680C11E0);
}

uint64_t sub_2251020BC(void *a1, void (*a2)(void *))
{
  v5[0] = a1;
  char v6 = 1;
  id v3 = a1;
  a2(v5);
  return sub_2250DF5F4((uint64_t)v5, (uint64_t *)&unk_2680C11E0);
}

void sub_225102114()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0AB0);
  OUTLINED_FUNCTION_23_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2();
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2251070F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2680C5BC0);
  swift_retain_n();
  swift_retain_n();
  char v6 = sub_2251070D0();
  os_log_type_t v7 = sub_225107380();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    v15[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_225106E10();
    uint64_t v9 = sub_225107220();
    sub_2250B72A8(v9, v10, v15);
    sub_225107420();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_225106E10();
    uint64_t v11 = sub_225107220();
    sub_2250B72A8(v11, v12, v15);
    sub_225107420();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2250AF000, v6, v7, "earlierDate: %s laterDate: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_7_1();
  }
  else
  {

    swift_release_n();
    swift_release_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22510C7A0;
  *(void *)(inited + 32) = 0x447265696C726165;
  *(void *)(inited + 40) = 0xEB00000000657461;
  uint64_t v14 = sub_225106E60();
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 72) = v14;
  *(void *)(inited + 80) = 0x746144726574616CLL;
  *(void *)(inited + 120) = v14;
  *(void *)(inited + 88) = 0xE900000000000065;
  *(void *)(inited + 96) = v1;
  swift_retain();
  swift_retain();
  sub_225107170();
  sub_225102470();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_4();
}

void sub_225102470()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v18 = sub_2251070C0();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12 - v11;
  OUTLINED_FUNCTION_2_1();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225106EC0();
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v7;
  v16[3] = v5;
  v16[4] = v3;
  v16[5] = v1;
  sub_225106E90();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v17 = (void *)sub_225106E80();
  sub_2251070B0();
  sub_225106EA0();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v18);
  sub_2250DF5F4((uint64_t)v19, &qword_2680C0D20);
  OUTLINED_FUNCTION_5_4();
}

uint64_t sub_225102614(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v31 = a2;
  uint64_t v9 = sub_225106430();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1200);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void *)((char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (void **)((char *)v29 - v17);
  sub_2250E2CC8(a1, (uint64_t)v29 - v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = *v18;
    if (qword_2680C0698 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2251070F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_2680C5BC0);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_2251070D0();
    os_log_type_t v22 = sub_225107390();
    if (os_log_type_enabled(v21, v22))
    {
      v29[1] = a5;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v30 = a4;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v33 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_2250B72A8(v31, a3, &v33);
      sub_225107420();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2250AF000, v21, v22, "Failed to execute cat with id: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A62D170](v25, -1, -1);
      uint64_t v26 = v24;
      a4 = v30;
      MEMORY[0x22A62D170](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *uint64_t v16 = v19;
    swift_storeEnumTagMultiPayload();
    id v28 = v19;
    a4(v16);

    return sub_2250DF5F4((uint64_t)v16, (uint64_t *)&unk_2680C1200);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v10 + 32))(v12, v18, v9);
    (*(void (**)(void *, char *, uint64_t))(v10 + 16))(v16, v12, v9);
    swift_storeEnumTagMultiPayload();
    a4(v16);
    sub_2250DF5F4((uint64_t)v16, (uint64_t *)&unk_2680C1200);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t *sub_2251029BC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_225105E90();
  OUTLINED_FUNCTION_23_2();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 8);
  uint64_t v5 = OUTLINED_FUNCTION_17_2();
  v4(v5);
  ((void (*)(char *, uint64_t))v4)((char *)v0 + qword_2680C1918, v2);
  sub_225105F40();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_5_6();
  v6();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 120));
  return v0;
}

uint64_t sub_225102AD4()
{
  sub_2251029BC();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_225102B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_225102B5C(a1, a2, a3, a4, a5, MEMORY[0x263F6F4B0]);
}

uint64_t sub_225102B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_225102B5C(a1, a2, a3, a4, a5, MEMORY[0x263F6F4B8]);
}

uint64_t sub_225102B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_19_5();
  uint64_t v10 = type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy();
  return a6(v8, v7, v6, v10, a5);
}

uint64_t sub_225102BD8(void *a1, void (*a2)(void *))
{
  return sub_2251020BC(a1, a2);
}

uint64_t sub_225102BF0()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_225102C30(uint64_t a1)
{
  return sub_225102614(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_225102C3C()
{
  sub_225105E90();
  swift_arrayDestroy();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

void sub_225102CB8(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_20_6();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_18_4();
    }
  }
  else
  {
    int64_t v6 = a2;
  }
  int64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    int64_t v10 = *(void *)(a4 + 16);
  }
  else {
    int64_t v10 = v6;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_2680C19F0);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  if (a1)
  {
    sub_2250CDA44((char *)(a4 + 32), v9, v13);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_225103264(0, v9, v13, a4);
  }
}

void sub_225102D8C(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_225102DC0(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_225102DF4(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    OUTLINED_FUNCTION_20_6();
    if (v12 != v13)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_18_4();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v16 = (void *)swift_allocObject();
    size_t v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v18 = v16 + 4;
  if (a1)
  {
    a7(a4 + 32, v14, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v14, v18, a4);
  }
}

uint64_t sub_225102EE8(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return OUTLINED_FUNCTION_12_5(a1, a2, a3, a4, &qword_2680C0D38, MEMORY[0x263F6FB38], a7, sub_2250CDC38);
}

char *sub_225102F1C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19C0);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  if (v5)
  {
    sub_2250CDC50((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_225103564(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_225103014(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return OUTLINED_FUNCTION_12_5(a1, a2, a3, a4, &qword_2680C19B8, MEMORY[0x263F6FBA8], a7, sub_2250CDCB4);
}

uint64_t sub_225103048(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), void (*a8)(unint64_t, uint64_t, unint64_t))
{
  if (a3)
  {
    OUTLINED_FUNCTION_20_6();
    if (v14 != v15)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_18_4();
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v16 = *(void *)(a4 + 16);
  if (v13 <= v16) {
    uint64_t v17 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v17 = v13;
  }
  if (!v17)
  {
    uint64_t v21 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v18 = *(void *)(a6(0) - 8);
  uint64_t v19 = *(void *)(v18 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = (void *)swift_allocObject();
  size_t v22 = _swift_stdlib_malloc_size(v21);
  if (!v19 || (v22 - v20 == 0x8000000000000000 ? (BOOL v23 = v19 == -1) : (BOOL v23 = 0), v23))
  {
LABEL_23:
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_23_5();
    uint64_t result = sub_2251075F0();
    __break(1u);
    return result;
  }
  v21[2] = v16;
  v21[3] = 2 * ((uint64_t)(v22 - v20) / v19);
LABEL_18:
  uint64_t v24 = *(void *)(a6(0) - 8);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v26 = (unint64_t)v21 + v25;
  if (a1)
  {
    a8(a4 + v25, v16, v26);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_225103684(0, v16, v26, a4, a7);
  }
  return (uint64_t)v21;
}

char *sub_225103264(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_225107650();
  __break(1u);
  return result;
}

uint64_t sub_225103354(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_225107650();
  __break(1u);
  return result;
}

uint64_t sub_22510344C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19E8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_225107650();
  __break(1u);
  return result;
}

uint64_t sub_225103564(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2680C19C8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_225107650();
  __break(1u);
  return result;
}

uint64_t sub_225103684(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_23_5();
  uint64_t result = sub_225107650();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RelativeDateInWitchingHourDisambiguationStrategy.RelativeDateDisambiguationStrategyError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2251037E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_22510175C(a1);
}

uint64_t sub_2251037FC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22510384C(uint64_t a1)
{
  return sub_225101AC4(a1, *(void *)(v1 + 16), *(void (**)(uint64_t *))(v1 + 24), *(void *)(v1 + 32), *(uint64_t **)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_22510385C@<X0>(uint64_t *a1@<X8>)
{
  return sub_225100E64(a1);
}

uint64_t sub_22510387C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_2251038C4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x225103990);
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

uint64_t sub_2251039B8()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_9(uint64_t a1)
{
  **(void **)(v1 - 136) = a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_5(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t a7, void (*a8)(unint64_t, uint64_t, unint64_t))
{
  return sub_225103048(a1, a2, a3, a4, a5, a6, a6, a8);
}

uint64_t OUTLINED_FUNCTION_14_4(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_15_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_5(uint64_t a1, unint64_t a2)
{
  return sub_2250B72A8(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return sub_2251064D0();
}

uint64_t sub_225103B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_225106430();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1110);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_2251064E0();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2();
  uint64_t v21 = v20 - v19;
  sub_2251063F0();
  sub_225106420();
  uint64_t v22 = sub_225106420();
  sub_225103D20(v22);
  sub_225103E38(a3, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v4);
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1)
  {
    sub_225106400();
    uint64_t v23 = OUTLINED_FUNCTION_1_12();
    v24(v23);
    sub_225103EA0(v14);
  }
  else
  {
    uint64_t v25 = OUTLINED_FUNCTION_1_12();
    v26(v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v21, v14, v15);
  }
  return sub_2251063E0();
}

uint64_t sub_225103D20(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v10 = v4 + v2;
    }
    else {
      uint64_t v10 = v4;
    }
    uint64_t result = sub_225103014(result, v10, 1, v3, v7, v8, v9);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  uint64_t v12 = (*(void *)(v3 + 24) >> 1) - v11;
  uint64_t v13 = sub_225106470();
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t result = v13 - 8;
  uint64_t v14 = v15;
  if (v12 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t result = sub_2250CE25C(v6 + v16, v2, v3 + v16 + *(void *)(v14 + 72) * v11);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v17 = *(void *)(v3 + 16);
  BOOL v18 = __OFADD__(v17, v2);
  uint64_t v19 = v17 + v2;
  if (!v18)
  {
    *(void *)(v3 + 16) = v19;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_225103E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_225103EA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return v0;
}

id sub_225103F18(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_225105EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_2250B5E98(v10);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12)
  {
    id v13 = v10;
    sub_225105EB0();
    uint64_t v14 = a3;
    uint64_t v15 = a2;
    uint64_t v16 = sub_225105EA0();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v19 = v16;
    a2 = v15;
    a3 = v14;
    sub_2250B5F30(v19, v18, v13, (SEL *)&selRef_setAceId_);
  }
  id v20 = objc_allocWithZone(MEMORY[0x263F65000]);
  id v21 = v10;
  id v22 = objc_msgSend(v20, sel_init);
  uint64_t v23 = sub_2250B5610();
  sub_2250B5F30(v23, v24, v22, (SEL *)&selRef_setApplicationBundleIdentifier_);
  objc_msgSend(v21, sel_setSash_, v22);

  uint64_t v25 = sub_2251071E0();
  sub_2250B5F30(v25, v26, v21, (SEL *)&selRef_setItemType_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_22510C2B0;
  sub_2250C6950(0, &qword_2680C1A78);
  id v28 = a1;
  id v29 = a2;
  *(void *)(v27 + 32) = sub_225104E88(a1, v29);
  uint64_t v36 = v27;
  sub_225107300();
  sub_22510420C(v36, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C0D70);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_22510C660;
  *(void *)(v30 + 32) = sub_2251071E0();
  *(void *)(v30 + 40) = v31;
  *(void *)(v30 + 48) = sub_2251071E0();
  *(void *)(v30 + 56) = v32;
  *(void *)(v30 + 64) = sub_2251071E0();
  *(void *)(v30 + 72) = v33;
  sub_225104290(v30, v21);

  sub_2250F4A50(a3);
  return v21;
}

void sub_225104200(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_22510420C(uint64_t a1, void *a2)
{
  sub_2250C6950(0, (unint64_t *)&unk_2680C1A80);
  id v3 = (id)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setPersons_, v3);
}

void sub_225104290(uint64_t a1, void *a2)
{
  id v3 = (id)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setDisplayProperties_, v3);
}

id sub_2251042FC(void *a1, unint64_t a2)
{
  sub_2250C6950(0, (unint64_t *)&unk_2680C1A90);
  id v4 = a1;
  id v5 = sub_2251048D0(v4);
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v6, sel_setLocation_, v5);
  id v7 = v6;
  sub_22510469C(v5);
  if (v8)
  {
    uint64_t v9 = (void *)sub_2251071A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_msgSend(v7, sel_setLabel_, v9);

  id v10 = v7;
  id result = objc_msgSend(v4, sel__geoMapItem);
  if (result)
  {
    id v12 = objc_msgSend(result, sel__placeDataAsData);
    swift_unknownObjectRelease();
    if (v12)
    {
      uint64_t v13 = sub_225105E60();
      unint64_t v15 = v14;

      uint64_t v16 = (void *)sub_225105E40();
      sub_2250D1388(v13, v15);
    }
    else
    {
      uint64_t v16 = 0;
    }
    objc_msgSend(v10, sel_setPlaceData2_, v16);

    uint64_t v17 = sub_2251071E0();
    sub_225104700(v17, v18, v10);
    id v19 = v10;
    id v20 = objc_msgSend(v4, sel__geoMapItem);
    id v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, sel__resultProviderID);
      swift_unknownObjectRelease();
      id v21 = (void *)sub_225107840();
    }
    objc_msgSend(v19, sel_setLocalSearchProviderId_, v21);

    id v22 = objc_msgSend(v4, sel__geoMapItem);
    if (v22)
    {
      id v23 = objc_msgSend(v22, sel__reviewsAttribution);
      swift_unknownObjectRelease();
      if (v23)
      {
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64A60]), sel_init);
        id v25 = v23;
        sub_2251047DC(v25);
        if (v26)
        {
          uint64_t v27 = (void *)sub_2251071A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v27 = 0;
        }
        objc_msgSend(v24, sel_setAttributionId_, v27);

        __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
        uint64_t v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = xmmword_22510C2B0;
        *(void *)(v28 + 32) = v24;
        uint64_t v33 = v28;
        sub_225107300();
        id v29 = v24;
        sub_22510484C(v33, v19);
        uint64_t v30 = sub_2251071E0();
        sub_225104700(v30, v31, v19);
      }
    }
    swift_bridgeObjectRetain();
    if (a2 >> 62)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1B20);
      uint64_t v32 = sub_225107610();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2251077C0();
      uint64_t v32 = a2;
    }
    swift_bridgeObjectRelease();
    sub_225104764(v32, v19);

    return v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22510469C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_label);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2251071E0();

  return v3;
}

void sub_225104700(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2251071A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDetailType_, v4);
}

void sub_225104764(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1B20);
  id v3 = (id)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);
}

uint64_t sub_2251047DC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_providerID);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2251071E0();

  return v3;
}

void sub_22510484C(uint64_t a1, void *a2)
{
  sub_2250C6950(0, &qword_2680C1AA8);
  id v3 = (id)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setAttributions_, v3);
}

id sub_2251048D0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id result = OUTLINED_FUNCTION_5_13();
  if (result)
  {
    id v4 = objc_msgSend(result, sel_name);
    uint64_t v5 = swift_unknownObjectRelease();
    OUTLINED_FUNCTION_2_7(v5, sel_setLabel_);

    id v6 = OUTLINED_FUNCTION_5_13();
    id v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, sel_coordinate);
      swift_unknownObjectRelease();
      id v7 = (void *)sub_225107340();
    }
    objc_msgSend(v2, sel_setLatitude_, v7);

    id v8 = OUTLINED_FUNCTION_5_13();
    uint64_t v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, sel_coordinate);
      swift_unknownObjectRelease();
      uint64_t v9 = (void *)sub_225107340();
    }
    objc_msgSend(v2, sel_setLongitude_, v9);

    id result = OUTLINED_FUNCTION_5_13();
    if (result)
    {
      id v10 = objc_msgSend(result, sel_addressDictionary);
      swift_unknownObjectRelease();
      if (v10)
      {
        sub_225107160();
      }
      else
      {
        sub_225107170();
      }
      uint64_t v11 = sub_2250B6C44(a1, (SEL *)&selRef_fullThoroughfare);
      if (v12)
      {
        sub_2251071A0();
        uint64_t v11 = OUTLINED_FUNCTION_4_12();
      }
      else
      {
        id v10 = 0;
      }
      OUTLINED_FUNCTION_2_7(v11, sel_setStreet_);

      uint64_t v13 = sub_2250B6C44(a1, (SEL *)&selRef_thoroughfare);
      if (v14)
      {
        sub_2251071A0();
        uint64_t v13 = OUTLINED_FUNCTION_4_12();
      }
      else
      {
        id v10 = 0;
      }
      OUTLINED_FUNCTION_2_7(v13, sel_setThoroughfare_);

      uint64_t v15 = sub_2250B6C44(a1, (SEL *)&selRef_subThoroughfare);
      if (v16)
      {
        sub_2251071A0();
        uint64_t v15 = OUTLINED_FUNCTION_4_12();
      }
      else
      {
        id v10 = 0;
      }
      OUTLINED_FUNCTION_2_7(v15, sel_setSubThoroughfare_);

      uint64_t v17 = sub_2250B6C44(a1, (SEL *)&selRef_locality);
      if (v18)
      {
        sub_2251071A0();
        uint64_t v17 = OUTLINED_FUNCTION_4_12();
      }
      else
      {
        id v10 = 0;
      }
      OUTLINED_FUNCTION_2_7(v17, sel_setCity_);

      uint64_t v19 = OUTLINED_FUNCTION_3_11();
      OUTLINED_FUNCTION_1_13(v19, v20, v21, v22, v23, v24, v25, v26, v59, 0x437972746E756F43, 0xEB0000000065646FLL, v70[0], v71, v72, v73, v74, v75);
      sub_2250F6748((uint64_t)v70);
      if (v76)
      {
        if (OUTLINED_FUNCTION_0_10())
        {
          uint64_t v27 = v62;
          uint64_t v28 = v66;
          goto LABEL_27;
        }
      }
      else
      {
        sub_2250BAC08((uint64_t)&v75);
      }
      uint64_t v27 = 0;
      uint64_t v28 = 0xE000000000000000;
LABEL_27:
      sub_2250B5F30(v27, v28, v2, (SEL *)&selRef_setCountryCode_);
      uint64_t v29 = OUTLINED_FUNCTION_3_11();
      OUTLINED_FUNCTION_1_13(v29, v30, v31, v32, v33, v34, v35, v36, v60, 0xD000000000000016, 0x8000000225109740, v70[0], v71, v72, v73, v74, v75);
      sub_2250F6748((uint64_t)v70);
      if (v76)
      {
        if (OUTLINED_FUNCTION_0_10())
        {
          if ((v63 || v67 != 0xE000000000000000) && (sub_2251077B0() & 1) == 0)
          {
            uint64_t v45 = v63;
            uint64_t v46 = v67;
            goto LABEL_40;
          }
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_2250BAC08((uint64_t)&v75);
      }
      uint64_t v37 = OUTLINED_FUNCTION_3_11();
      OUTLINED_FUNCTION_1_13(v37, v38, v39, v40, v41, v42, v43, v44, v61, 0xD000000000000012, 0x8000000225109760, v70[0], v71, v72, v73, v74, v75);
      sub_2250F6748((uint64_t)v70);
      if (v76)
      {
        if (OUTLINED_FUNCTION_0_10())
        {
          uint64_t v45 = v64;
          uint64_t v46 = v68;
          goto LABEL_40;
        }
      }
      else
      {
        sub_2250BAC08((uint64_t)&v75);
      }
      uint64_t v45 = 0;
      uint64_t v46 = 0xE000000000000000;
LABEL_40:
      sub_2250B5F30(v45, v46, v2, (SEL *)&selRef_setStateCode_);
      uint64_t v47 = OUTLINED_FUNCTION_3_11();
      OUTLINED_FUNCTION_1_13(v47, v48, v49, v50, v51, v52, v53, v54, v61, 0x65646F4374736F50, 0xE800000000000000, v70[0], v71, v72, v73, v74, v75);
      swift_bridgeObjectRelease();
      sub_2250F6748((uint64_t)v70);
      if (v76)
      {
        if (OUTLINED_FUNCTION_0_10())
        {
          uint64_t v55 = v65;
          uint64_t v56 = v69;
LABEL_45:
          sub_2250B5F30(v55, v56, v2, (SEL *)&selRef_setPostalCode_);
          uint64_t v57 = sub_2251071E0();
          sub_2250B5F30(v57, v58, v2, (SEL *)&selRef_setRegionType_);

          return v2;
        }
      }
      else
      {
        sub_2250BAC08((uint64_t)&v75);
      }
      uint64_t v55 = 0;
      uint64_t v56 = 0xE000000000000000;
      goto LABEL_45;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_1_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17)
{
  return sub_2250C84E4((uint64_t)&a12, v17, &a17);
}

id OUTLINED_FUNCTION_2_7(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return sub_2251074C0();
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_5_13()
{
  return [v0 (SEL)(v1 + 3325)];
}

id sub_225104E88(void *a1, void *a2)
{
  char v89 = a1;
  id v90 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1AB0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v88 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v83 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C10E0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_225105E30();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_7();
  uint64_t v86 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2680C06B8);
  MEMORY[0x270FA5388](v15 - 8);
  OUTLINED_FUNCTION_4_7();
  uint64_t v87 = v16;
  uint64_t v17 = sub_225105EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_2250B5E98(v23);
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  if (!v25)
  {
    id v26 = v23;
    uint64_t v84 = v12;
    id v27 = v26;
    sub_225105EB0();
    uint64_t v28 = sub_225105EA0();
    uint64_t v85 = v10;
    uint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v17);
    uint64_t v10 = v85;
    sub_225104200(v28, v30, v27);

    uint64_t v12 = v84;
  }
  id v31 = v23;
  uint64_t v32 = v89;
  if (v89)
  {
    uint64_t v33 = self;
    id v34 = v23;
    id v31 = v32;
    id v35 = objc_msgSend(v33, sel_assistantIDFromContact_, v31);
    if (v35)
    {
      uint64_t v36 = v86;
      sub_225105E10();

      uint64_t v37 = v87;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v87, v36, v10);
      __swift_storeEnumTagSinglePayload(v37, 0, 1, v10);
      if (__swift_getEnumTagSinglePayload(v37, 1, v10) == 1)
      {
        id v35 = 0;
      }
      else
      {
        id v35 = (id)sub_225105E00();
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v37, v10);
      }
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v87, 1, 1, v10);
    }
    objc_msgSend(v34, sel_setIdentifier_, v35);

    id v38 = objc_msgSend(v31, sel_identifier);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v39, v40, v41, (SEL *)&selRef_setInternalGUID_);
    id v42 = objc_msgSend(v31, sel_birthday);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = (uint64_t)v88;
      sub_225105CA0();

      uint64_t v45 = sub_225105CF0();
      uint64_t v46 = v44;
      uint64_t v47 = 0;
    }
    else
    {
      uint64_t v45 = sub_225105CF0();
      uint64_t v44 = (uint64_t)v88;
      uint64_t v46 = (uint64_t)v88;
      uint64_t v47 = 1;
    }
    __swift_storeEnumTagSinglePayload(v46, v47, 1, v45);
    sub_225105540(v44, (uint64_t)v6);
    sub_225105CF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v45) == 1)
    {
      sub_2251055A8((uint64_t)v6);
      uint64_t v48 = sub_225105E90();
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v48);
      uint64_t v49 = 0;
    }
    else
    {
      sub_225105CC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v45 - 8) + 8))(v6, v45);
      uint64_t v50 = (uint64_t)v9;
      uint64_t v51 = sub_225105E90();
      uint64_t v49 = 0;
      if (__swift_getEnumTagSinglePayload(v50, 1, v51) != 1)
      {
        uint64_t v49 = (void *)sub_225105E70();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v51 - 8) + 8))(v50, v51);
      }
    }
    objc_msgSend(v34, sel_setBirthday_, v49);

    id v52 = objc_msgSend(v31, sel_organizationName);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v53, v54, v55, (SEL *)&selRef_setCompany_);
    id v56 = objc_msgSend(v31, sel_givenName);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v57, v58, v59, (SEL *)&selRef_setFirstName_);
    uint64_t v60 = sub_2250B6370();
    sub_2250B5F30(v60, v61, v34, (SEL *)&selRef_setFullName_);
    id v62 = objc_msgSend(v31, sel_familyName);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v63, v64, v65, (SEL *)&selRef_setLastName_);
    objc_msgSend(v34, sel_setMe_, v90);
    id v66 = objc_msgSend(v31, sel_middleName);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v67, v68, v69, (SEL *)&selRef_setMiddleName_);
    id v70 = objc_msgSend(v31, sel_nickname);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v71, v72, v73, (SEL *)&selRef_setNickName_);
    id v74 = objc_msgSend(v31, sel_namePrefix);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v75, v76, v77, (SEL *)&selRef_setPrefix_);
    id v78 = objc_msgSend(v31, sel_nameSuffix);
    sub_2251071E0();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_0_11(v79, v80, v81, (SEL *)&selRef_setSuffix_);
  }
  return v23;
}

uint64_t sub_225105540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2251055A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2680C1AB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0_11(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_2250B5F30(v4, v5, v6, a4);
}

void OUTLINED_FUNCTION_2_8()
{
}

id sub_22510563C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_225105878(a1, v6, (uint64_t *)&unk_2680C1B20);
  sub_2250B5F30(a2, a3, v6, (SEL *)&selRef_setText_);

  return v6;
}

id sub_2251056C0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_22510C2B0;
  sub_225105838();
  id v6 = v4;
  *(void *)(v5 + 32) = sub_225105790(a1, a2);
  sub_225107300();
  sub_225105878(v5, v6, &qword_2680C1B38);

  return v6;
}

id sub_225105790(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v5 = sub_2251071E0();
  uint64_t v7 = v6;
  id v8 = v4;
  sub_2250B5F30(v5, v7, v8, (SEL *)&selRef_setOrigin_);
  sub_2250B5F30(a1, a2, v8, (SEL *)&selRef_setUtterance_);

  return v8;
}

unint64_t sub_225105838()
{
  unint64_t result = qword_2680C1B30;
  if (!qword_2680C1B30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2680C1B30);
  }
  return result;
}

void sub_225105878(uint64_t a1, void *a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  id v4 = (id)sub_2251072E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v4);
}

uint64_t sub_2251058EC(uint64_t a1, uint64_t a2, long long *a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_2250BFD9C(a3, v3 + 32);
  return v3;
}

uint64_t sub_225105914(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[ShowContactViewBuilder] Constructing view for watchOS.");
}

uint64_t sub_225105920(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_225105950(a1, a2, a3, "[ShowContactViewBuilder] Constructing PersonSnippet with display properties for macOS.");
}

uint64_t sub_22510592C(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[ShowContactViewBuilder] Constructing no views for CarPlay.");
}

uint64_t sub_225105938(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_2250F444C(a1, a2, a3, "[ShowContactViewBuilder] Constructing no views for CarDNDMode.");
}

uint64_t sub_225105944(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  return sub_225105950(a1, a2, a3, "[ShowContactViewBuilder] Constructing compact view for iOS.");
}

uint64_t sub_225105950(uint64_t a1, void (*a2)(void, void), uint64_t a3, const char *a4)
{
  if (qword_2680C0698 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2251070F0();
  __swift_project_value_buffer(v7, (uint64_t)qword_2680C5BC0);
  id v8 = sub_2251070D0();
  os_log_type_t v9 = sub_225107380();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2250AF000, v8, v9, a4, v10, 2u);
    MEMORY[0x22A62D170](v10, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_2680C1AA0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22510C2B0;
  sub_225105B80();
  uint64_t v12 = *(void **)(a1 + 16);
  uint64_t v13 = *(void **)(a1 + 24);
  v15[3] = &type metadata for InstalledAppsProvider;
  v15[4] = &off_26D87B7F0;
  *(void *)(v11 + 32) = sub_225103F18(v12, v13, (uint64_t)v15);
  v15[0] = (id)v11;
  sub_225107300();
  sub_2250E33D4((unint64_t)v15[0], 0, a2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_225105AF8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return v0;
}

uint64_t sub_225105B28()
{
  sub_225105AF8();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for ShowContactViewBuilder()
{
  return self;
}

unint64_t sub_225105B80()
{
  unint64_t result = qword_2680C1B40;
  if (!qword_2680C1B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2680C1B40);
  }
  return result;
}

uint64_t sub_225105BC0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_225105BD0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_225105BE0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_225105BF0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_225105C00()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_225105C10()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_225105C20()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_225105C30()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_225105C40()
{
  return MEMORY[0x270EEE0F0]();
}

uint64_t sub_225105C50()
{
  return MEMORY[0x270EEE130]();
}

uint64_t sub_225105C60()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_225105C70()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_225105C80()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_225105C90()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_225105CA0()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_225105CB0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_225105CC0()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_225105CD0()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_225105CE0()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_225105CF0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_225105D00()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_225105D10()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_225105D20()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_225105D30()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_225105D40()
{
  return MEMORY[0x270EEF360]();
}

uint64_t sub_225105D50()
{
  return MEMORY[0x270EEF378]();
}

uint64_t sub_225105D60()
{
  return MEMORY[0x270EEF3A8]();
}

uint64_t sub_225105D70()
{
  return MEMORY[0x270EEF3C0]();
}

uint64_t sub_225105D80()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_225105D90()
{
  return MEMORY[0x270EEF400]();
}

uint64_t sub_225105DA0()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_225105DB0()
{
  return MEMORY[0x270EEF420]();
}

uint64_t sub_225105DC0()
{
  return MEMORY[0x270EEF428]();
}

uint64_t sub_225105DD0()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_225105DE0()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_225105DF0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_225105E00()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_225105E10()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_225105E20()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_225105E30()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_225105E40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_225105E50()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_225105E60()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_225105E70()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_225105E80()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_225105E90()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_225105EA0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_225105EB0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_225105EC0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_225105ED0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_225105EE0()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_225105EF0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_225105F00()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_225105F10()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_225105F20()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_225105F30()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_225105F40()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_225105F50()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_225105F60()
{
  return MEMORY[0x270F663C0]();
}

uint64_t sub_225105F70()
{
  return MEMORY[0x270F663C8]();
}

uint64_t sub_225105F80()
{
  return MEMORY[0x270F666D8]();
}

uint64_t sub_225105F90()
{
  return MEMORY[0x270F666E0]();
}

uint64_t sub_225105FA0()
{
  return MEMORY[0x270F66738]();
}

uint64_t sub_225105FB0()
{
  return MEMORY[0x270F66740]();
}

uint64_t sub_225105FC0()
{
  return MEMORY[0x270F66878]();
}

uint64_t sub_225105FD0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_225105FE0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_225105FF0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_225106030()
{
  return MEMORY[0x270F66DD8]();
}

uint64_t sub_225106040()
{
  return MEMORY[0x270F66DE0]();
}

uint64_t sub_225106050()
{
  return MEMORY[0x270F66DF8]();
}

uint64_t sub_225106060()
{
  return MEMORY[0x270F66E00]();
}

uint64_t sub_225106070()
{
  return MEMORY[0x270F66E20]();
}

uint64_t sub_225106080()
{
  return MEMORY[0x270F66E38]();
}

uint64_t sub_225106090()
{
  return MEMORY[0x270F66E80]();
}

uint64_t sub_2251060A0()
{
  return MEMORY[0x270F66EB0]();
}

uint64_t sub_2251060B0()
{
  return MEMORY[0x270F66EB8]();
}

uint64_t sub_2251060C0()
{
  return MEMORY[0x270F66EC0]();
}

uint64_t sub_2251060D0()
{
  return MEMORY[0x270F66EE0]();
}

uint64_t sub_2251060E0()
{
  return MEMORY[0x270F66EF0]();
}

uint64_t sub_2251060F0()
{
  return MEMORY[0x270F66F68]();
}

uint64_t sub_225106100()
{
  return MEMORY[0x270F66F80]();
}

uint64_t sub_225106110()
{
  return MEMORY[0x270F66FA0]();
}

uint64_t sub_225106120()
{
  return MEMORY[0x270F66FB8]();
}

uint64_t sub_225106130()
{
  return MEMORY[0x270F66FC0]();
}

uint64_t sub_225106140()
{
  return MEMORY[0x270F66FD0]();
}

uint64_t sub_225106150()
{
  return MEMORY[0x270F66FE0]();
}

uint64_t sub_225106160()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_225106170()
{
  return MEMORY[0x270F67190]();
}

uint64_t sub_225106180()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_225106190()
{
  return MEMORY[0x270F671B0]();
}

uint64_t sub_2251061A0()
{
  return MEMORY[0x270F671B8]();
}

uint64_t sub_2251061B0()
{
  return MEMORY[0x270F671D0]();
}

uint64_t sub_2251061C0()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_2251061D0()
{
  return MEMORY[0x270F671E0]();
}

uint64_t sub_2251061E0()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_2251061F0()
{
  return MEMORY[0x270F671F0]();
}

uint64_t sub_225106200()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_225106210()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_225106220()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_225106230()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_225106240()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_225106250()
{
  return MEMORY[0x270F67248]();
}

uint64_t sub_225106260()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_225106270()
{
  return MEMORY[0x270F67368]();
}

uint64_t sub_225106280()
{
  return MEMORY[0x270F67370]();
}

uint64_t sub_225106290()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_2251062A0()
{
  return MEMORY[0x270F67488]();
}

uint64_t sub_2251062B0()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_2251062C0()
{
  return MEMORY[0x270F67540]();
}

uint64_t sub_2251062D0()
{
  return MEMORY[0x270F675E8]();
}

uint64_t sub_2251062E0()
{
  return MEMORY[0x270F67648]();
}

uint64_t sub_2251062F0()
{
  return MEMORY[0x270F67650]();
}

uint64_t sub_225106300()
{
  return MEMORY[0x270F67658]();
}

uint64_t sub_225106310()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_225106320()
{
  return MEMORY[0x270F67690]();
}

uint64_t sub_225106330()
{
  return MEMORY[0x270F676C0]();
}

uint64_t sub_225106340()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_225106350()
{
  return MEMORY[0x270F67710]();
}

uint64_t sub_225106360()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_225106370()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_225106380()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_225106390()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_2251063A0()
{
  return MEMORY[0x270F67838]();
}

uint64_t sub_2251063B0()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_2251063C0()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_2251063D0()
{
  return MEMORY[0x270F678C8]();
}

uint64_t sub_2251063E0()
{
  return MEMORY[0x270F678F0]();
}

uint64_t sub_2251063F0()
{
  return MEMORY[0x270F678F8]();
}

uint64_t sub_225106400()
{
  return MEMORY[0x270F67900]();
}

uint64_t sub_225106410()
{
  return MEMORY[0x270F67918]();
}

uint64_t sub_225106420()
{
  return MEMORY[0x270F67928]();
}

uint64_t sub_225106430()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_225106440()
{
  return MEMORY[0x270F67970]();
}

uint64_t sub_225106450()
{
  return MEMORY[0x270F67A48]();
}

uint64_t sub_225106460()
{
  return MEMORY[0x270F67A58]();
}

uint64_t sub_225106470()
{
  return MEMORY[0x270F67A60]();
}

uint64_t sub_225106480()
{
  return MEMORY[0x270F67AF8]();
}

uint64_t sub_225106490()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_2251064A0()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_2251064B0()
{
  return MEMORY[0x270F67BB8]();
}

uint64_t sub_2251064C0()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_2251064D0()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_2251064E0()
{
  return MEMORY[0x270F67C60]();
}

uint64_t sub_2251064F0()
{
  return MEMORY[0x270F67D50]();
}

uint64_t sub_225106500()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_225106520()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_225106530()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_225106540()
{
  return MEMORY[0x270F68088]();
}

uint64_t sub_225106550()
{
  return MEMORY[0x270F680C0]();
}

uint64_t sub_225106560()
{
  return MEMORY[0x270F680D0]();
}

uint64_t sub_225106570()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_225106580()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_225106590()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_2251065A0()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_2251065B0()
{
  return MEMORY[0x270F68228]();
}

uint64_t sub_2251065C0()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_2251065D0()
{
  return MEMORY[0x270F68270]();
}

uint64_t sub_2251065E0()
{
  return MEMORY[0x270F68278]();
}

uint64_t sub_2251065F0()
{
  return MEMORY[0x270F68280]();
}

uint64_t sub_225106600()
{
  return MEMORY[0x270F68288]();
}

uint64_t sub_225106610()
{
  return MEMORY[0x270F68290]();
}

uint64_t sub_225106620()
{
  return MEMORY[0x270F68298]();
}

uint64_t sub_225106630()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_225106640()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_225106650()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_225106660()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_225106670()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_225106680()
{
  return MEMORY[0x270F65478]();
}

uint64_t sub_225106690()
{
  return MEMORY[0x270F654B8]();
}

uint64_t sub_2251066A0()
{
  return MEMORY[0x270F654C8]();
}

uint64_t sub_2251066B0()
{
  return MEMORY[0x270F654D0]();
}

uint64_t sub_2251066C0()
{
  return MEMORY[0x270F655C0]();
}

uint64_t sub_2251066D0()
{
  return MEMORY[0x270F655D0]();
}

uint64_t sub_2251066E0()
{
  return MEMORY[0x270F655D8]();
}

uint64_t sub_2251066F0()
{
  return MEMORY[0x270F65650]();
}

uint64_t sub_225106700()
{
  return MEMORY[0x270F656A0]();
}

uint64_t sub_225106710()
{
  return MEMORY[0x270F656A8]();
}

uint64_t sub_225106720()
{
  return MEMORY[0x270F656B8]();
}

uint64_t sub_225106730()
{
  return MEMORY[0x270F656C8]();
}

uint64_t sub_225106740()
{
  return MEMORY[0x270F656D8]();
}

uint64_t sub_225106750()
{
  return MEMORY[0x270F656F0]();
}

uint64_t sub_225106760()
{
  return MEMORY[0x270F657F8]();
}

uint64_t sub_225106770()
{
  return MEMORY[0x270F65800]();
}

uint64_t sub_225106780()
{
  return MEMORY[0x270F65808]();
}

uint64_t sub_225106790()
{
  return MEMORY[0x270F65828]();
}

uint64_t sub_2251067A0()
{
  return MEMORY[0x270F65830]();
}

uint64_t sub_2251067B0()
{
  return MEMORY[0x270F65838]();
}

uint64_t sub_2251067C0()
{
  return MEMORY[0x270F65840]();
}

uint64_t sub_2251067D0()
{
  return MEMORY[0x270F65848]();
}

uint64_t sub_2251067E0()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_2251067F0()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_225106800()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_225106810()
{
  return MEMORY[0x270F65870]();
}

uint64_t sub_225106820()
{
  return MEMORY[0x270F65878]();
}

uint64_t sub_225106830()
{
  return MEMORY[0x270F65880]();
}

uint64_t sub_225106840()
{
  return MEMORY[0x270F65888]();
}

uint64_t sub_225106850()
{
  return MEMORY[0x270F658F0]();
}

uint64_t sub_225106860()
{
  return MEMORY[0x270F65900]();
}

uint64_t sub_225106870()
{
  return MEMORY[0x270F65908]();
}

uint64_t sub_225106880()
{
  return MEMORY[0x270F65910]();
}

uint64_t sub_225106890()
{
  return MEMORY[0x270F65970]();
}

uint64_t sub_2251068A0()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_2251068B0()
{
  return MEMORY[0x270F65980]();
}

uint64_t sub_2251068C0()
{
  return MEMORY[0x270F65988]();
}

uint64_t sub_2251068D0()
{
  return MEMORY[0x270F65990]();
}

uint64_t sub_2251068E0()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_2251068F0()
{
  return MEMORY[0x270F659C8]();
}

uint64_t sub_225106900()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_225106910()
{
  return MEMORY[0x270F659E0]();
}

uint64_t sub_225106920()
{
  return MEMORY[0x270F659E8]();
}

uint64_t sub_225106930()
{
  return MEMORY[0x270F659F0]();
}

uint64_t sub_225106940()
{
  return MEMORY[0x270F659F8]();
}

uint64_t sub_225106950()
{
  return MEMORY[0x270F65A00]();
}

uint64_t sub_225106960()
{
  return MEMORY[0x270F65A58]();
}

uint64_t sub_225106970()
{
  return MEMORY[0x270F65A60]();
}

uint64_t sub_225106980()
{
  return MEMORY[0x270F65A70]();
}

uint64_t sub_225106990()
{
  return MEMORY[0x270F65A78]();
}

uint64_t sub_2251069A0()
{
  return MEMORY[0x270F65C38]();
}

uint64_t sub_2251069B0()
{
  return MEMORY[0x270F65C48]();
}

uint64_t sub_2251069C0()
{
  return MEMORY[0x270F65C60]();
}

uint64_t sub_2251069D0()
{
  return MEMORY[0x270F65C68]();
}

uint64_t sub_2251069E0()
{
  return MEMORY[0x270F65C70]();
}

uint64_t sub_2251069F0()
{
  return MEMORY[0x270F65C98]();
}

uint64_t sub_225106A00()
{
  return MEMORY[0x270F65CA8]();
}

uint64_t sub_225106A10()
{
  return MEMORY[0x270F65CB0]();
}

uint64_t sub_225106A20()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_225106A30()
{
  return MEMORY[0x270F65DB0]();
}

uint64_t sub_225106A40()
{
  return MEMORY[0x270F65DB8]();
}

uint64_t sub_225106A50()
{
  return MEMORY[0x270F65DD8]();
}

uint64_t sub_225106A60()
{
  return MEMORY[0x270F65DE8]();
}

uint64_t sub_225106A70()
{
  return MEMORY[0x270F65E00]();
}

uint64_t sub_225106A80()
{
  return MEMORY[0x270F65E08]();
}

uint64_t sub_225106A90()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_225106AA0()
{
  return MEMORY[0x270F65E48]();
}

uint64_t sub_225106AB0()
{
  return MEMORY[0x270F65E50]();
}

uint64_t sub_225106AC0()
{
  return MEMORY[0x270F65E58]();
}

uint64_t sub_225106AD0()
{
  return MEMORY[0x270F65E60]();
}

uint64_t sub_225106AE0()
{
  return MEMORY[0x270F65E70]();
}

uint64_t sub_225106AF0()
{
  return MEMORY[0x270F65E78]();
}

uint64_t sub_225106B00()
{
  return MEMORY[0x270F65E80]();
}

uint64_t sub_225106B10()
{
  return MEMORY[0x270F65E88]();
}

uint64_t sub_225106B20()
{
  return MEMORY[0x270F65E98]();
}

uint64_t sub_225106B30()
{
  return MEMORY[0x270F65EA0]();
}

uint64_t sub_225106B40()
{
  return MEMORY[0x270F72A00]();
}

uint64_t sub_225106B50()
{
  return MEMORY[0x270F72A08]();
}

uint64_t sub_225106B60()
{
  return MEMORY[0x270F72B20]();
}

uint64_t sub_225106B70()
{
  return MEMORY[0x270F72B28]();
}

uint64_t sub_225106B80()
{
  return MEMORY[0x270F64878]();
}

uint64_t sub_225106B90()
{
  return MEMORY[0x270F64880]();
}

uint64_t sub_225106BA0()
{
  return MEMORY[0x270F64888]();
}

uint64_t sub_225106BC0()
{
  return MEMORY[0x270F64B10]();
}

uint64_t sub_225106BD0()
{
  return MEMORY[0x270F64B18]();
}

uint64_t sub_225106BE0()
{
  return MEMORY[0x270F64B20]();
}

uint64_t sub_225106BF0()
{
  return MEMORY[0x270F64B28]();
}

uint64_t sub_225106C00()
{
  return MEMORY[0x270F64B30]();
}

uint64_t sub_225106C10()
{
  return MEMORY[0x270F64B38]();
}

uint64_t sub_225106C20()
{
  return MEMORY[0x270F64B40]();
}

uint64_t sub_225106C30()
{
  return MEMORY[0x270F64B48]();
}

uint64_t sub_225106C40()
{
  return MEMORY[0x270F64B50]();
}

uint64_t sub_225106C50()
{
  return MEMORY[0x270F64B58]();
}

uint64_t sub_225106C60()
{
  return MEMORY[0x270F64B68]();
}

uint64_t sub_225106C70()
{
  return MEMORY[0x270F64B78]();
}

uint64_t sub_225106C80()
{
  return MEMORY[0x270F64B80]();
}

uint64_t sub_225106C90()
{
  return MEMORY[0x270F64B88]();
}

uint64_t sub_225106CA0()
{
  return MEMORY[0x270F64B98]();
}

uint64_t sub_225106CB0()
{
  return MEMORY[0x270F64BA0]();
}

uint64_t sub_225106CC0()
{
  return MEMORY[0x270F64BA8]();
}

uint64_t sub_225106CD0()
{
  return MEMORY[0x270F64BB0]();
}

uint64_t sub_225106CE0()
{
  return MEMORY[0x270F64BB8]();
}

uint64_t sub_225106CF0()
{
  return MEMORY[0x270F64BC0]();
}

uint64_t sub_225106D00()
{
  return MEMORY[0x270F64BC8]();
}

uint64_t sub_225106D10()
{
  return MEMORY[0x270F64BD0]();
}

uint64_t sub_225106D20()
{
  return MEMORY[0x270F64BD8]();
}

uint64_t sub_225106D30()
{
  return MEMORY[0x270F64BE0]();
}

uint64_t sub_225106D40()
{
  return MEMORY[0x270F64BE8]();
}

uint64_t sub_225106D50()
{
  return MEMORY[0x270F64BF0]();
}

uint64_t sub_225106D60()
{
  return MEMORY[0x270F64BF8]();
}

uint64_t sub_225106D80()
{
  return MEMORY[0x270F64C10]();
}

uint64_t sub_225106D90()
{
  return MEMORY[0x270F64C18]();
}

uint64_t sub_225106DA0()
{
  return MEMORY[0x270F64C20]();
}

uint64_t sub_225106DB0()
{
  return MEMORY[0x270F64C28]();
}

uint64_t sub_225106DC0()
{
  return MEMORY[0x270F64C30]();
}

uint64_t sub_225106DD0()
{
  return MEMORY[0x270F64C40]();
}

uint64_t sub_225106DE0()
{
  return MEMORY[0x270F64C48]();
}

uint64_t sub_225106DF0()
{
  return MEMORY[0x270F64C50]();
}

uint64_t sub_225106E00()
{
  return MEMORY[0x270F64C58]();
}

uint64_t sub_225106E10()
{
  return MEMORY[0x270F64CE0]();
}

uint64_t sub_225106E20()
{
  return MEMORY[0x270F64CF8]();
}

uint64_t sub_225106E30()
{
  return MEMORY[0x270F64D08]();
}

uint64_t sub_225106E40()
{
  return MEMORY[0x270F64D10]();
}

uint64_t sub_225106E50()
{
  return MEMORY[0x270F64D18]();
}

uint64_t sub_225106E60()
{
  return MEMORY[0x270F64D30]();
}

uint64_t sub_225106E70()
{
  return MEMORY[0x270F64E30]();
}

uint64_t sub_225106E80()
{
  return MEMORY[0x270F64E98]();
}

uint64_t sub_225106E90()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_225106EA0()
{
  return MEMORY[0x270F64F30]();
}

uint64_t sub_225106EB0()
{
  return MEMORY[0x270F64F38]();
}

uint64_t sub_225106EC0()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_225106EE0()
{
  return MEMORY[0x270F64F60]();
}

uint64_t sub_225106EF0()
{
  return MEMORY[0x270F64F68]();
}

uint64_t sub_225106F00()
{
  return MEMORY[0x270F64F70]();
}

uint64_t sub_225106F10()
{
  return MEMORY[0x270F64F78]();
}

uint64_t sub_225106F20()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_225106F30()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_225106F40()
{
  return MEMORY[0x270F64FB0]();
}

uint64_t sub_225106F50()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_225106F60()
{
  return MEMORY[0x270F65000]();
}

uint64_t sub_225106F70()
{
  return MEMORY[0x270F65008]();
}

uint64_t sub_225106F80()
{
  return MEMORY[0x270F65010]();
}

uint64_t sub_225106F90()
{
  return MEMORY[0x270F65018]();
}

uint64_t sub_225106FA0()
{
  return MEMORY[0x270F65028]();
}

uint64_t sub_225106FB0()
{
  return MEMORY[0x270F65030]();
}

uint64_t sub_225106FC0()
{
  return MEMORY[0x270F65038]();
}

uint64_t sub_225106FD0()
{
  return MEMORY[0x270F65040]();
}

uint64_t sub_225106FE0()
{
  return MEMORY[0x270F65048]();
}

uint64_t sub_225106FF0()
{
  return MEMORY[0x270F65050]();
}

uint64_t sub_225107000()
{
  return MEMORY[0x270F65058]();
}

uint64_t sub_225107010()
{
  return MEMORY[0x270F65060]();
}

uint64_t sub_225107020()
{
  return MEMORY[0x270F65070]();
}

uint64_t sub_225107030()
{
  return MEMORY[0x270F65078]();
}

uint64_t sub_225107040()
{
  return MEMORY[0x270F65080]();
}

uint64_t sub_225107050()
{
  return MEMORY[0x270F65088]();
}

uint64_t sub_225107060()
{
  return MEMORY[0x270F65090]();
}

uint64_t sub_225107070()
{
  return MEMORY[0x270F650A0]();
}

uint64_t sub_225107080()
{
  return MEMORY[0x270F650A8]();
}

uint64_t sub_225107090()
{
  return MEMORY[0x270F650C8]();
}

uint64_t sub_2251070A0()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_2251070B0()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_2251070C0()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_2251070D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2251070E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2251070F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_225107100()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_225107110()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_225107120()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_225107130()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_225107140()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_225107150()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_225107160()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_225107170()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_225107180()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_225107190()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2251071A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2251071B0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2251071C0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2251071D0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2251071E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2251071F0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_225107200()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_225107210()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_225107220()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_225107230()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_225107240()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_225107250()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_225107260()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_225107270()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_225107280()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_225107290()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2251072A0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2251072B0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2251072C0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2251072D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2251072E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2251072F0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_225107300()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_225107310()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_225107320()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_225107330()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_225107340()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_225107350()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_225107360()
{
  return MEMORY[0x270F68420]();
}

uint64_t sub_225107370()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_225107380()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_225107390()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2251073A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2251073B0()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_2251073C0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_2251073D0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2251073E0()
{
  return MEMORY[0x270F68448]();
}

uint64_t sub_2251073F0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_225107400()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_225107410()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_225107420()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_225107430()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_225107440()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_225107450()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_225107460()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_225107470()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_225107480()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_225107490()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2251074A0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2251074B0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2251074C0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2251074D0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2251074E0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2251074F0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_225107500()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_225107510()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_225107520()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_225107530()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_225107540()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_225107550()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_225107560()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_225107570()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_225107580()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_225107590()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2251075A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2251075B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2251075C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2251075D0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2251075E0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2251075F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_225107600()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_225107610()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_225107620()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_225107630()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_225107640()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_225107650()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_225107670()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_225107680()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_225107690()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2251076A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2251076B0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2251076C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2251076E0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2251076F0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_225107700()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_225107710()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_225107720()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_225107730()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_225107740()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_225107750()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_225107760()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_225107770()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_225107780()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_225107790()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2251077A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2251077B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2251077C0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2251077D0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2251077E0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2251077F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_225107800()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_225107810()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_225107820()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_225107830()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_225107840()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_225107850()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_225107860()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_225107870()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_225107880()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_225107890()
{
  return MEMORY[0x270F651A0]();
}

uint64_t sub_2251078A0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2251078B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}