uint64_t sub_25DDECED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a2;
  if (a2)
  {
    v8 = self;
    swift_bridgeObjectRetain();
    v9 = objc_msgSend(v8, sel_VideosUICoreBundle);
    if (a4)
    {
      swift_bridgeObjectRetain();
      v10 = sub_25DDED680(v9, (SEL *)&selRef_bundleIdentifier);
      if (v11)
      {
        v12 = HIBYTE(v11) & 0xF;
        if ((v11 & 0x2000000000000000) == 0) {
          v12 = v10 & 0xFFFFFFFFFFFFLL;
        }
        if (v12)
        {
          v13 = objc_allocWithZone(MEMORY[0x263F847A0]);
          swift_bridgeObjectRetain();
          v14 = sub_25DDED4E8(a3, a4, a1, v4, 0, 0, 0);
          v15 = objc_msgSend(self, sel_sharedInstance);
          v16 = objc_msgSend(v15, sel_badgeForContentRating_drawUnknownRatingBadge_, v14, 0);
          if (v16)
          {
            v17 = v16;
            v18 = (id)MEMORY[0x2611C80F0]();
            if (v18)
            {
              v19 = v18;
              swift_bridgeObjectRelease();
              sub_25DDFE270();

              sub_25DDED6D8();
              sub_25DDED3EC();
              v4 = sub_25DDFE050();

              return v4;
            }
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA440);
            v25 = swift_allocObject();
            *(_OWORD *)(v25 + 16) = xmmword_25DDFE520;
            *(void *)(v25 + 56) = MEMORY[0x263F8D310];
            *(void *)(v25 + 64) = sub_25DDED49C();
            *(void *)(v25 + 32) = a1;
            *(void *)(v25 + 40) = v4;
            OUTLINED_FUNCTION_0((uint64_t)"^[%@](encapsulation: 'basic')");
            OUTLINED_FUNCTION_1();
          }
          else
          {
            swift_bridgeObjectRelease();
            v22 = sub_25DDED220(v14);
            if (v22)
            {
              v23 = v22;
              v24 = objc_msgSend(v15, sel_badgeForContentRating_drawUnknownRatingBadge_, v22, 0);
            }
            else
            {
              v24 = 0;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA440);
            v26 = swift_allocObject();
            *(_OWORD *)(v26 + 16) = xmmword_25DDFE520;
            *(void *)(v26 + 56) = MEMORY[0x263F8D310];
            *(void *)(v26 + 64) = sub_25DDED49C();
            *(void *)(v26 + 32) = a1;
            *(void *)(v26 + 40) = v4;
            OUTLINED_FUNCTION_0((uint64_t)"^[%@](encapsulation: 'basic')");
            OUTLINED_FUNCTION_1();
          }
          return 0;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA440);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_25DDFE520;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    *(void *)(v20 + 64) = sub_25DDED49C();
    *(void *)(v20 + 32) = a1;
    *(void *)(v20 + 40) = v4;
    OUTLINED_FUNCTION_0((uint64_t)"^[%@](encapsulation: 'basic')");
    OUTLINED_FUNCTION_1();
    return 0;
  }
  return v4;
}

id sub_25DDED220(void *a1)
{
  sub_25DDED680(a1, (SEL *)&selRef_ratingLabel);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25DDFE290();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  BOOL v6 = v3 == 6369841 && v5 == 0xE300000000000000;
  if (v6 || (sub_25DDFE2D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (objc_msgSend(a1, sel_ratingSystem) == (id)134)
    {
      id v7 = objc_msgSend(a1, sel_rank);
      uint64_t v8 = sub_25DDED680(a1, (SEL *)&selRef_ratingDescription);
      uint64_t v10 = v9;
      objc_allocWithZone(MEMORY[0x263F847A0]);
      uint64_t v11 = 12849;
      return sub_25DDED5C0(134, v11, 0xE200000000000000, (uint64_t)v7, v8, v10);
    }
  }
  else
  {
    if (v3 == 3682674 && v5 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_25DDFE2D0();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        return 0;
      }
    }
    if (objc_msgSend(a1, sel_ratingSystem) == (id)134)
    {
      id v7 = objc_msgSend(a1, sel_rank);
      uint64_t v8 = sub_25DDED680(a1, (SEL *)&selRef_ratingDescription);
      uint64_t v10 = v15;
      objc_allocWithZone(MEMORY[0x263F847A0]);
      uint64_t v11 = 14385;
      return sub_25DDED5C0(134, v11, 0xE200000000000000, (uint64_t)v7, v8, v10);
    }
  }
  return 0;
}

id sub_25DDED3EC()
{
  v0 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v0);

  return v1;
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

unint64_t sub_25DDED49C()
{
  unint64_t result = qword_26A6CA448;
  if (!qword_26A6CA448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA448);
  }
  return result;
}

id sub_25DDED4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v12 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  v13 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
LABEL_6:
  id v14 = objc_msgSend(v7, sel_initWithRatingSystemString_ratingLabel_rank_ratingDescription_, v11, v12, a5, v13);

  return v14;
}

id sub_25DDED5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a3)
  {
    uint64_t v10 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = (void *)sub_25DDFE260();
  swift_bridgeObjectRelease();
LABEL_6:
  id v12 = objc_msgSend(v6, sel_initWithRatingSystem_ratingLabel_rank_ratingDescription_, a1, v10, a4, v11);

  return v12;
}

uint64_t sub_25DDED680(void *a1, SEL *a2)
{
  if (![a1 *a2]) {
    return 0;
  }
  sub_25DDFE270();
  OUTLINED_FUNCTION_1();
  return v2;
}

unint64_t sub_25DDED6D8()
{
  unint64_t result = qword_26A6CA450;
  if (!qword_26A6CA450)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6CA450);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0@<X0>(uint64_t a1@<X8>)
{
  return MEMORY[0x270EF1A50](0xD00000000000001DLL, (a1 - 32) | 0x8000000000000000, v1);
}

void OUTLINED_FUNCTION_1()
{
}

uint64_t ConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v73 = a1;
  uint64_t v68 = sub_25DDFE090();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_2(v7);
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA458);
  OUTLINED_FUNCTION_0_0();
  uint64_t v74 = v13;
  uint64_t v75 = v14;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_4();
  uint64_t v17 = v16 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA460);
  OUTLINED_FUNCTION_0_0();
  uint64_t v71 = v19;
  uint64_t v72 = v18;
  uint64_t v21 = *(void *)(v20 + 64);
  uint64_t v22 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v70 = (char *)v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  v69 = (char *)v61 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v67 = (char *)v61 - v26;
  MEMORY[0x270FA5388](v25);
  v66 = (char *)v61 - v27;
  v61[0] = v1;
  v62 = v12;
  sub_25DDEDD50(v1, (uint64_t)v12);
  uint64_t v28 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v64 = ((v28 + 16) & ~v28) + v11;
  uint64_t v65 = (v28 + 16) & ~v28;
  uint64_t v29 = v65;
  uint64_t v63 = v28 | 7;
  uint64_t v30 = swift_allocObject();
  sub_25DDEDDB8((uint64_t)v12, v30 + v29);
  uint64_t v77 = v1;
  sub_25DDFE060();
  v31 = *(void (**)(uint64_t, void, uint64_t))(v3 + 104);
  uint64_t v32 = v6;
  uint64_t v33 = v6;
  uint64_t v34 = v68;
  v31(v33, *MEMORY[0x263F774E0], v68);
  v61[3] = sub_25DDEF2A0(&qword_26A6CA478, &qword_26A6CA458);
  uint64_t v35 = v74;
  sub_25DDFDF70();
  uint64_t v36 = *(void *)(v3 + 8);
  v61[1] = v3 + 8;
  v61[2] = v36;
  OUTLINED_FUNCTION_5();
  v37();
  v38 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
  v75 += 8;
  v38(v17, v35);
  uint64_t v39 = v61[0];
  uint64_t v40 = (uint64_t)v62;
  sub_25DDEDD50(v61[0], (uint64_t)v62);
  uint64_t v41 = swift_allocObject();
  sub_25DDEDDB8(v40, v41 + v65);
  uint64_t v76 = v39;
  sub_25DDFE060();
  v31(v32, *MEMORY[0x263F774D8], v34);
  v42 = v67;
  uint64_t v43 = v74;
  sub_25DDFDF70();
  OUTLINED_FUNCTION_5();
  v44();
  v38(v17, v43);
  uint64_t v46 = v71;
  uint64_t v45 = v72;
  v47 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  v48 = v69;
  v49 = v66;
  v47(v69, v66, v72);
  v50 = v70;
  v51 = v42;
  v47(v70, v42, v45);
  uint64_t v52 = *(unsigned __int8 *)(v46 + 80);
  uint64_t v53 = (v52 + 16) & ~v52;
  uint64_t v54 = (v21 + v52 + v53) & ~v52;
  uint64_t v55 = swift_allocObject();
  v56 = *(void (**)(uint64_t, char *, uint64_t))(v46 + 32);
  v56(v55 + v53, v48, v45);
  v56(v55 + v54, v50, v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA480);
  uint64_t v57 = sub_25DDFE180();
  unint64_t v58 = sub_25DDEE664();
  uint64_t v78 = v57;
  unint64_t v79 = v58;
  swift_getOpaqueTypeConformance2();
  sub_25DDFE130();
  v59 = *(void (**)(char *, uint64_t))(v46 + 8);
  v59(v51, v45);
  return ((uint64_t (*)(char *, uint64_t))v59)(v49, v45);
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result = qword_26A6CA490;
  if (!qword_26A6CA490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDEDD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDEDDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDEDE1C()
{
  return sub_25DDEE260(MEMORY[0x263F758D0]);
}

uint64_t sub_25DDEDE34@<X0>(uint64_t a1@<X8>)
{
  return sub_25DDEE2C4(MEMORY[0x263F758C8], a1);
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

uint64_t sub_25DDEDEAC(uint64_t a1, void (*a2)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4B8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v5 = v4 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C0);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v11 = v10 - v9;
  sub_25DDFE0F0();
  uint64_t v12 = sub_25DDFE1F0();
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1) {
    return sub_25DDEF330(v11, &qword_26A6CA4C8);
  }
  type metadata accessor for ConfirmationView();
  a2();
  uint64_t v14 = sub_25DDFDBC0();
  __swift_storeEnumTagSinglePayload(v8, 0, 1, v14);
  uint64_t v15 = sub_25DDFE160();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v15);
  sub_25DDFE1E0();
  sub_25DDEF330(v5, &qword_26A6CA4B8);
  sub_25DDEF330(v8, &qword_26A6CA4C0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for ConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v16 = v2 | 7;
  uint64_t v17 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v4 = v0 + v3;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v5();
  uint64_t v6 = v4 + v1[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  OUTLINED_FUNCTION_3();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  uint64_t v10 = (int *)sub_25DDFDDD0();
  uint64_t v11 = v6 + v10[5];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v11, v12);
  v9(v6 + v10[6], v7);
  v14(v6 + v10[7], v12);
  return MEMORY[0x270FA0238](v0, v17, v16);
}

uint64_t sub_25DDEE248()
{
  return sub_25DDEE260(MEMORY[0x263F758E0]);
}

uint64_t sub_25DDEE260(void (*a1)(void))
{
  uint64_t v3 = *(void *)(type metadata accessor for ConfirmationView() - 8);
  return sub_25DDEDEAC(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_25DDEE2C4@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for ConfirmationView();
  a1();
  sub_25DDEF2E4();
  uint64_t result = sub_25DDFDF50();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_25DDEE340@<X0>(uint64_t a1@<X8>)
{
  return sub_25DDEE2C4(MEMORY[0x263F758D8], a1);
}

uint64_t sub_25DDEE370()
{
  uint64_t v0 = sub_25DDFE180();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA460);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA458);
  uint64_t v5 = sub_25DDEF2A0(&qword_26A6CA478, &qword_26A6CA458);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  swift_getOpaqueTypeConformance2();
  uint64_t v6 = sub_25DDFDF60();
  uint64_t v7 = MEMORY[0x263F1B720];
  uint64_t v8 = MEMORY[0x263F774B0];
  uint64_t v14 = MEMORY[0x263F1B720];
  uint64_t v15 = MEMORY[0x263F774B0];
  uint64_t v12 = v6;
  uint64_t v9 = sub_25DDFDF60();
  v11[3] = v7;
  v11[4] = v8;
  v11[0] = v9;
  sub_25DDFE170();
  sub_25DDEE664();
  sub_25DDFE010();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25DDEE528()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA460);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  uint64_t v9 = v8 + v6;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v7);
}

uint64_t sub_25DDEE5E8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA460);
  OUTLINED_FUNCTION_2(v0);
  return sub_25DDEE370();
}

unint64_t sub_25DDEE664()
{
  unint64_t result = qword_26A6CA488;
  if (!qword_26A6CA488)
  {
    sub_25DDFE180();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA488);
  }
  return result;
}

uint64_t sub_25DDEE6B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDEE6D8()
{
  return sub_25DDFE000();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v20(v9, v10, v11);
    uint64_t v12 = (int *)sub_25DDFDDD0();
    uint64_t v13 = v12[5];
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v20(&v9[v12[6]], &v10[v12[6]], v11);
    v17(&v9[v12[7]], &v10[v12[7]], v16);
  }
  return a1;
}

uint64_t destroy for ConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = (int *)sub_25DDFDDD0();
  uint64_t v9 = v5 + v8[5];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v13)((void *)(v10 - 8), v9, v10);
  v7(v5 + v8[6], v6);
  uint64_t v11 = v5 + v8[7];
  return v13(v11, v10);
}

uint64_t initializeWithCopy for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDDD0();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t assignWithCopy for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDDD0();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t initializeWithTake for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDDD0();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t assignWithTake for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v18(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDDD0();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v18(v8 + v11[6], v9 + v11[6], v10);
  v16(v8 + v11[7], v9 + v11[7], v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDEF038);
}

uint64_t sub_25DDEF038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25DDFDDD0();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDEF0F0);
}

uint64_t sub_25DDEF0F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25DDFDDD0();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25DDEF19C()
{
  uint64_t result = sub_25DDFE110();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25DDFDDD0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25DDEF264()
{
  return sub_25DDEF2A0(&qword_26A6CA4A0, &qword_26A6CA4A8);
}

uint64_t sub_25DDEF2A0(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25DDEF2E4()
{
  unint64_t result = qword_26A6CA4B0;
  if (!qword_26A6CA4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA4B0);
  }
  return result;
}

uint64_t sub_25DDEF330(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_25DDEF3F8()
{
  sub_25DDF1C44();
  sub_25DDFE2B0();
  sub_25DDFE2B0();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_25DDFE2D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t DisambiguationList.body.getter()
{
  uint64_t v0 = type metadata accessor for DisambiguationList();
  uint64_t v1 = OUTLINED_FUNCTION_2(v0);
  MEMORY[0x270FA5388](v1);
  sub_25DDF2110();
  swift_allocObject();
  sub_25DDF2408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4E0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA4E8);
  sub_25DDEF2A0(&qword_26A6CA4F0, &qword_26A6CA4E8);
  swift_getOpaqueTypeConformance2();
  return sub_25DDFE130();
}

uint64_t type metadata accessor for DisambiguationList()
{
  uint64_t result = qword_26A6CA4F8;
  if (!qword_26A6CA4F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDEF664@<X0>(uint64_t a1@<X8>)
{
  v11[1] = a1;
  uint64_t v1 = type metadata accessor for DisambiguationList();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_25DDFE1D0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4E8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x2611C7BF0](v5);
  uint64_t v17 = MEMORY[0x263F8D310];
  uint64_t v18 = MEMORY[0x263F77998];
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  sub_25DDFE1C0();
  sub_25DDF2110();
  swift_allocObject();
  sub_25DDF2408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA518);
  sub_25DDF1B70();
  sub_25DDFE190();
  sub_25DDFDE00();
  sub_25DDEF3F8();
  sub_25DDEF2A0(&qword_26A6CA4F0, &qword_26A6CA4E8);
  sub_25DDFE010();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_25DDEF928()
{
  return sub_25DDF1B0C((uint64_t (*)(uint64_t))sub_25DDEF664);
}

uint64_t sub_25DDEF940()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDEF95C()
{
  uint64_t v0 = type metadata accessor for DisambiguationList();
  MEMORY[0x270FA5388](v0 - 8);
  sub_25DDFDDF0();
  sub_25DDF2110();
  swift_allocObject();
  sub_25DDF2408();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA538);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA540);
  sub_25DDEF2A0(&qword_26A6CA548, &qword_26A6CA538);
  sub_25DDFE1B0();
  sub_25DDF2024(&qword_26A6CA528, MEMORY[0x263F77720]);
  swift_getOpaqueTypeConformance2();
  sub_25DDF2024(&qword_26A6CA550, MEMORY[0x263F758F8]);
  return sub_25DDFE070();
}

uint64_t sub_25DDEFBA4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v35 = a2;
  uint64_t v2 = sub_25DDFDE70();
  uint64_t v31 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v33 = v3;
  uint64_t v34 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DisambiguationList();
  v25[1] = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  v25[2] = v5;
  uint64_t v28 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA558);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_25DDFE1B0();
  uint64_t v29 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA540);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  long long v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25DDFDE20();
  uint64_t v16 = MEMORY[0x263F8D310];
  uint64_t v17 = MEMORY[0x263F77998];
  uint64_t v62 = MEMORY[0x263F8D310];
  uint64_t v63 = MEMORY[0x263F77998];
  if (v15) {
    uint64_t v18 = v14;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v19 = 0xE000000000000000;
  if (v15) {
    unint64_t v19 = v15;
  }
  uint64_t v60 = v18;
  unint64_t v61 = v19;
  uint64_t v20 = sub_25DDFDE40();
  if (v21)
  {
    *((void *)&v58 + 1) = v16;
    uint64_t v59 = v17;
    *(void *)&long long v57 = v20;
    *((void *)&v57 + 1) = v21;
  }
  else
  {
    uint64_t v59 = 0;
    long long v57 = 0u;
    long long v58 = 0u;
  }
  uint64_t v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  sub_25DDF0090((uint64_t)v8);
  sub_25DDF1E58();
  uint64_t v22 = sub_25DDFDF60();
  sub_25DDEF330((uint64_t)v8, &qword_26A6CA558);
  uint64_t v37 = MEMORY[0x263F1B720];
  uint64_t v38 = MEMORY[0x263F774B0];
  uint64_t v36 = v22;
  sub_25DDFE1A0();
  sub_25DDF2110();
  sub_25DDF2110();
  swift_allocObject();
  sub_25DDF2408();
  sub_25DDF2408();
  sub_25DDF2024(&qword_26A6CA528, MEMORY[0x263F77720]);
  uint64_t v23 = v32;
  sub_25DDFDFA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v23);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v35, v13, v27);
}

uint64_t sub_25DDF0090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v87 = a1;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B8);
  MEMORY[0x270FA5388](v76);
  uint64_t v77 = (char *)&v61 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA598);
  MEMORY[0x270FA5388](v85);
  uint64_t v78 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5C0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5C8);
  MEMORY[0x270FA5388](v82);
  uint64_t v84 = (uint64_t)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5D0);
  MEMORY[0x270FA5388](v70);
  uint64_t v71 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA580);
  MEMORY[0x270FA5388](v83);
  uint64_t v75 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA570);
  MEMORY[0x270FA5388](v9);
  v86 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_25DDFDB70();
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  v67 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5D8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25DDFDC10();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v16 = sub_25DDFE0A0();
  uint64_t v80 = *(void *)(v16 - 8);
  uint64_t v81 = v16;
  MEMORY[0x270FA5388](v16);
  unint64_t v79 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5E0);
  uint64_t v73 = *(void *)(v18 - 8);
  uint64_t v74 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v66 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v72 = (char *)&v61 - v21;
  uint64_t v22 = sub_25DDFDB50();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5E8);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v28 = (char *)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDFDE60();
  uint64_t v29 = sub_25DDFDE50();
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29) == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_25DDF1ED4();
    return sub_25DDFDEF0();
  }
  else
  {
    uint64_t v65 = v3;
    uint64_t v64 = v5;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        sub_25DDFDC00();
        swift_bridgeObjectRelease();
        long long v49 = v79;
        sub_25DDFE0B0();
        uint64_t v50 = v68;
        long long v51 = v67;
        uint64_t v52 = v69;
        (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F76620], v69);
        uint64_t v53 = sub_25DDF2024(&qword_26A6CA588, MEMORY[0x263F77558]);
        long long v54 = v66;
        uint64_t v55 = v81;
        sub_25DDFDF80();
        (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v49, v55);
        long long v57 = v72;
        uint64_t v56 = v73;
        uint64_t v58 = v74;
        (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v54, v74);
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v71, v57, v58);
        swift_storeEnumTagMultiPayload();
        uint64_t v88 = v55;
        uint64_t v89 = v53;
        swift_getOpaqueTypeConformance2();
        uint64_t v59 = (uint64_t)v75;
        sub_25DDFDEF0();
        sub_25DDF24E4(v59, v84, &qword_26A6CA580);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1F50();
        sub_25DDF206C();
        uint64_t v60 = (uint64_t)v86;
        sub_25DDFDEF0();
        sub_25DDEF330(v59, &qword_26A6CA580);
        sub_25DDF24E4(v60, (uint64_t)v64, &qword_26A6CA570);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1ED4();
        sub_25DDFDEF0();
        sub_25DDEF330(v60, &qword_26A6CA570);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v57, v58);
        break;
      case 2u:
      case 3u:
        sub_25DDFDBF0();
        uint64_t v44 = v79;
        sub_25DDFE0B0();
        uint64_t v46 = v80;
        uint64_t v45 = v81;
        (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v77, v44, v81);
        swift_storeEnumTagMultiPayload();
        sub_25DDF2024(&qword_26A6CA588, MEMORY[0x263F77558]);
        uint64_t v47 = (uint64_t)v78;
        sub_25DDFDEF0();
        sub_25DDF24E4(v47, v84, &qword_26A6CA598);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1F50();
        sub_25DDF206C();
        uint64_t v48 = (uint64_t)v86;
        sub_25DDFDEF0();
        sub_25DDEF330(v47, &qword_26A6CA598);
        sub_25DDF24E4(v48, (uint64_t)v64, &qword_26A6CA570);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1ED4();
        sub_25DDFDEF0();
        sub_25DDEF330(v48, &qword_26A6CA570);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v44, v45);
        break;
      default:
        uint64_t v63 = v23;
        uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
        unint64_t v61 = v25;
        uint64_t v62 = v22;
        v31(v25, v28, v22);
        __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v22);
        sub_25DDFDBE0();
        sub_25DDEF330((uint64_t)v14, &qword_26A6CA5D8);
        uint64_t v32 = v79;
        sub_25DDFE0B0();
        uint64_t v33 = v68;
        uint64_t v34 = v67;
        uint64_t v35 = v69;
        (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F76620], v69);
        uint64_t v36 = sub_25DDF2024(&qword_26A6CA588, MEMORY[0x263F77558]);
        uint64_t v37 = v66;
        uint64_t v38 = v81;
        sub_25DDFDF80();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v32, v38);
        uint64_t v40 = v73;
        uint64_t v39 = v74;
        uint64_t v41 = v72;
        (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v37, v74);
        (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v71, v41, v39);
        swift_storeEnumTagMultiPayload();
        uint64_t v88 = v38;
        uint64_t v89 = v36;
        swift_getOpaqueTypeConformance2();
        uint64_t v42 = (uint64_t)v75;
        sub_25DDFDEF0();
        sub_25DDF24E4(v42, v84, &qword_26A6CA580);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1F50();
        sub_25DDF206C();
        uint64_t v43 = (uint64_t)v86;
        sub_25DDFDEF0();
        sub_25DDEF330(v42, &qword_26A6CA580);
        sub_25DDF24E4(v43, (uint64_t)v64, &qword_26A6CA570);
        swift_storeEnumTagMultiPayload();
        sub_25DDF1ED4();
        sub_25DDFDEF0();
        sub_25DDEF330(v43, &qword_26A6CA570);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v61, v62);
        break;
    }
  }
  return result;
}

uint64_t sub_25DDF0E48()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4B8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDFE0F0();
  uint64_t v9 = sub_25DDFE1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25DDEF330((uint64_t)v8, &qword_26A6CA4C8);
  }
  sub_25DDFDE30();
  uint64_t v11 = sub_25DDFE160();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v11);
  sub_25DDFE1E0();
  sub_25DDEF330((uint64_t)v2, &qword_26A6CA4B8);
  sub_25DDEF330((uint64_t)v5, &qword_26A6CA4C0);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationList(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = sub_25DDFDE10();
    uint64_t v13 = *(int *)(v12 + 20);
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = *(int *)(v12 + 24);
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for DisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = sub_25DDFDE10();
  uint64_t v8 = v5 + *(int *)(v7 + 20);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v5 + *(int *)(v7 + 24);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  return v12(v10, v11);
}

uint64_t initializeWithCopy for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = sub_25DDFDE10();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = *(int *)(v11 + 24);
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = sub_25DDFDE10();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(v11 + 24);
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = sub_25DDFDE10();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = *(int *)(v11 + 24);
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = sub_25DDFDE10();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = *(int *)(v11 + 24);
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF18D8);
}

uint64_t sub_25DDF18D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25DDFDE10();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF1968);
}

uint64_t sub_25DDF1968(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25DDFDE10();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_25DDF19EC()
{
  uint64_t result = sub_25DDFE110();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25DDFDE10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25DDF1AB4()
{
  return sub_25DDEF2A0(&qword_26A6CA508, &qword_26A6CA510);
}

uint64_t sub_25DDF1AF4()
{
  return sub_25DDF1B0C((uint64_t (*)(uint64_t))sub_25DDEF95C);
}

uint64_t sub_25DDF1B0C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_1_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a1(v4);
}

unint64_t sub_25DDF1B70()
{
  unint64_t result = qword_26A6CA520;
  if (!qword_26A6CA520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA518);
    sub_25DDFE1B0();
    sub_25DDF2024(&qword_26A6CA528, MEMORY[0x263F77720]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA520);
  }
  return result;
}

unint64_t sub_25DDF1C44()
{
  unint64_t result = qword_26A6CA530;
  if (!qword_26A6CA530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA530);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 16) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v9();
  sub_25DDFDE10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v11();
  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_25DDF1DF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_1_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25DDEFBA4(v5, a1);
}

unint64_t sub_25DDF1E58()
{
  unint64_t result = qword_26A6CA560;
  if (!qword_26A6CA560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA558);
    sub_25DDF1ED4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA560);
  }
  return result;
}

unint64_t sub_25DDF1ED4()
{
  unint64_t result = qword_26A6CA568;
  if (!qword_26A6CA568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA570);
    sub_25DDF1F50();
    sub_25DDF206C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA568);
  }
  return result;
}

unint64_t sub_25DDF1F50()
{
  unint64_t result = qword_26A6CA578;
  if (!qword_26A6CA578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA580);
    sub_25DDFE0A0();
    sub_25DDF2024(&qword_26A6CA588, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA578);
  }
  return result;
}

uint64_t sub_25DDF2024(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25DDF206C()
{
  unint64_t result = qword_26A6CA590;
  if (!qword_26A6CA590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA598);
    sub_25DDF2024(&qword_26A6CA588, MEMORY[0x263F77558]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA590);
  }
  return result;
}

uint64_t sub_25DDF2110()
{
  uint64_t v1 = OUTLINED_FUNCTION_8();
  v2(v1);
  OUTLINED_FUNCTION_3();
  uint64_t v3 = OUTLINED_FUNCTION_7();
  v4(v3);
  return v0;
}

uint64_t sub_25DDF2158()
{
  uint64_t v2 = *(void *)(type metadata accessor for DisambiguationList() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  sub_25DDFDE70();
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (((v3 + 16) & ~v3) + v4 + v9) & ~v9;
  uint64_t v26 = v10 + *(void *)(v8 + 64);
  uint64_t v11 = v3 | v9 | 7;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = *(void (**)(uint64_t))(v13 + 8);
  uint64_t v15 = OUTLINED_FUNCTION_6();
  v14(v15);
  sub_25DDFDE10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4D8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v17();
  uint64_t v18 = OUTLINED_FUNCTION_6();
  v14(v18);
  uint64_t v19 = v0 + v10 + *(int *)(v1 + 28);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  OUTLINED_FUNCTION_3();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v22(v19, v20);
  v22(v0 + v10 + *(int *)(v1 + 32), v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v24();
  return MEMORY[0x270FA0238](v0, v26, v11);
}

uint64_t sub_25DDF2408()
{
  uint64_t v2 = OUTLINED_FUNCTION_8();
  v3(v2);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25DDF245C()
{
  uint64_t v0 = type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_2(v0);
  uint64_t v1 = sub_25DDFDE70();
  OUTLINED_FUNCTION_1_1(v1);
  return sub_25DDF0E48();
}

uint64_t sub_25DDF24E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  uint64_t v4 = OUTLINED_FUNCTION_7();
  v5(v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return 0;
}

uint64_t *sub_25DDF25A0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_25DDFDDC0();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_25DDF26B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(sub_25DDFDDC0() + 20);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t sub_25DDF276C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDDC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t sub_25DDF2830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDDC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t sub_25DDF28F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDDC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_25DDF29B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDDC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_25DDF2A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF2A90);
}

uint64_t sub_25DDF2A90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFDDC0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_25DDF2AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF2AEC);
}

uint64_t sub_25DDF2AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFDDC0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FilteredListView()
{
  uint64_t result = qword_26A6CA5F8;
  if (!qword_26A6CA5F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDF2B80()
{
  uint64_t result = sub_25DDFDDC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DDF2C0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDF2C28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v36[1] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA608);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for FilteredListView();
  uint64_t v8 = OUTLINED_FUNCTION_2(v7);
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA610);
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_4();
  uint64_t v19 = v18 - v17;
  v36[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA618);
  OUTLINED_FUNCTION_0_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_4();
  uint64_t v25 = v24 - v23;
  sub_25DDF3568(v2, (uint64_t)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for FilteredListView);
  unint64_t v26 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v27 = swift_allocObject();
  sub_25DDF3374((uint64_t)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA620);
  sub_25DDEF2A0(&qword_26A6CA628, &qword_26A6CA620);
  sub_25DDFE130();
  uint64_t v28 = *MEMORY[0x263F775E0];
  sub_25DDFE140();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v29 + 104))(v6, v28);
  uint64_t v30 = *MEMORY[0x263F775F8];
  uint64_t v31 = sub_25DDFE150();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 104))(v6, v30, v31);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v31);
  uint64_t v33 = sub_25DDEF2A0(&qword_26A6CA630, &qword_26A6CA610);
  MEMORY[0x2611C7DD0](v6, v13, v33);
  sub_25DDF3624(v6, &qword_26A6CA608);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  v36[2] = v13;
  v36[3] = v33;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v36[0];
  sub_25DDFE010();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v25, v34);
}

uint64_t sub_25DDF2F9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = type metadata accessor for ResultsList();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v22 - v5;
  uint64_t v7 = sub_25DDFE230();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA638);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v22 - v15;
  uint64_t v17 = sub_25DDFDDB0();
  uint64_t v32 = MEMORY[0x263F8D310];
  uint64_t v33 = MEMORY[0x263F77998];
  uint64_t v30 = v17;
  uint64_t v31 = v18;
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  sub_25DDFE220();
  sub_25DDF3448();
  sub_25DDFE020();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_25DDF3498((uint64_t)v14, (uint64_t)v16);
  sub_25DDFDC40();
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  sub_25DDF3500((uint64_t)v16, (uint64_t)v14);
  sub_25DDF3568((uint64_t)v6, (uint64_t)v4, (void (*)(void))type metadata accessor for ResultsList);
  uint64_t v19 = v23;
  sub_25DDF3500((uint64_t)v14, v23);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA648);
  sub_25DDF3568((uint64_t)v4, v19 + *(int *)(v20 + 48), (void (*)(void))type metadata accessor for ResultsList);
  sub_25DDF35C8((uint64_t)v6);
  sub_25DDF3624((uint64_t)v16, &qword_26A6CA638);
  sub_25DDF35C8((uint64_t)v4);
  return sub_25DDF3624((uint64_t)v14, &qword_26A6CA638);
}

uint64_t sub_25DDF3280()
{
  uint64_t v1 = type metadata accessor for FilteredListView();
  OUTLINED_FUNCTION_2(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v11 + 8))(v10);
  uint64_t v12 = v10 + *(int *)(sub_25DDFDDC0() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v13 + 8))(v12);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25DDF3374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FilteredListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF33D8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for FilteredListView();
  return sub_25DDF2F9C(a1);
}

unint64_t sub_25DDF3448()
{
  unint64_t result = qword_26A6CA640;
  if (!qword_26A6CA640)
  {
    sub_25DDFE230();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA640);
  }
  return result;
}

uint64_t sub_25DDF3498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF3500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF3568(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DDF35C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ResultsList();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DDF3624(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25DDF3678()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_25DDF3734(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = (int *)sub_25DDFDC90();
    uint64_t v13 = v12[5];
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v9[v12[6]], &v10[v12[6]], v16);
    uint64_t v18 = v12[7];
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = v12[8];
    uint64_t v23 = &v9[v22];
    long long v24 = &v10[v22];
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  }
  return a1;
}

uint64_t sub_25DDF3968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (int *)sub_25DDFDC90();
  uint64_t v8 = v5 + v7[5];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v5 + v7[6], v9);
  uint64_t v11 = v5 + v7[7];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v5 + v7[8];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  return v15(v13, v14);
}

uint64_t sub_25DDF3B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDC90();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  uint64_t v17 = v11[7];
  uint64_t v18 = v8 + v17;
  uint64_t v19 = v9 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = v11[8];
  uint64_t v22 = v8 + v21;
  uint64_t v23 = v9 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  return a1;
}

uint64_t sub_25DDF3CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDC90();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  uint64_t v17 = v11[7];
  uint64_t v18 = v8 + v17;
  uint64_t v19 = v9 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = v11[8];
  uint64_t v22 = v8 + v21;
  uint64_t v23 = v9 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

uint64_t sub_25DDF3EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDC90();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  uint64_t v17 = v11[7];
  uint64_t v18 = v8 + v17;
  uint64_t v19 = v9 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = v11[8];
  uint64_t v22 = v8 + v21;
  uint64_t v23 = v9 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  return a1;
}

uint64_t sub_25DDF40C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = (int *)sub_25DDFDC90();
  uint64_t v12 = v11[5];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  uint64_t v17 = v11[7];
  uint64_t v18 = v8 + v17;
  uint64_t v19 = v9 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = v11[8];
  uint64_t v22 = v8 + v21;
  uint64_t v23 = v9 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t sub_25DDF42A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF42BC);
}

uint64_t sub_25DDF42BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25DDFDC90();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25DDF4338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF434C);
}

uint64_t sub_25DDF434C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25DDFDC90();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PersonVideoFactListView()
{
  uint64_t result = qword_26A6CA658;
  if (!qword_26A6CA658) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDF4418()
{
  uint64_t result = sub_25DDFE110();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25DDFDC90();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25DDF44E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDF44FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v33[1] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA608);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for PersonVideoFactListView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA668);
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4();
  uint64_t v16 = v15 - v14;
  v33[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA670);
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_4();
  uint64_t v22 = v21 - v20;
  sub_25DDF5B58(v2, (uint64_t)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for PersonVideoFactListView);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = swift_allocObject();
  sub_25DDF5680((uint64_t)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA678);
  sub_25DDEF2A0(&qword_26A6CA680, &qword_26A6CA678);
  sub_25DDFE130();
  uint64_t v25 = *MEMORY[0x263F775E0];
  sub_25DDFE140();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v26 + 104))(v6, v25);
  uint64_t v27 = *MEMORY[0x263F775F8];
  uint64_t v28 = sub_25DDFE150();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 104))(v6, v27, v28);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v28);
  uint64_t v30 = sub_25DDEF2A0(&qword_26A6CA688, &qword_26A6CA668);
  MEMORY[0x2611C7DD0](v6, v10, v30);
  sub_25DDEF330(v6, &qword_26A6CA608);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
  v33[2] = v10;
  v33[3] = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v33[0];
  sub_25DDFE010();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v22, v31);
}

uint64_t sub_25DDF4894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v49 = type metadata accessor for ResultsList() - 8;
  uint64_t v3 = MEMORY[0x270FA5388](v49);
  uint64_t v50 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v48 = (char *)&v39 - v5;
  uint64_t v6 = type metadata accessor for PersonVideoFactListView();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v43 = *(void *)(v44 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA690);
  MEMORY[0x270FA5388](v40);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25DDFE210();
  uint64_t v45 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA698);
  uint64_t v47 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6A0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v42 = (uint64_t)&v39 - v19;
  uint64_t v20 = sub_25DDFDC50();
  uint64_t v21 = MEMORY[0x263F8D310];
  uint64_t v22 = MEMORY[0x263F77998];
  uint64_t v67 = MEMORY[0x263F8D310];
  uint64_t v68 = MEMORY[0x263F77998];
  uint64_t v65 = v20;
  uint64_t v66 = v23;
  uint64_t v24 = sub_25DDFDC70();
  uint64_t v63 = v21;
  uint64_t v64 = v22;
  uint64_t v61 = v24;
  uint64_t v62 = v25;
  uint64_t v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  sub_25DDF4EB8((uint64_t)v9);
  sub_25DDF5734();
  uint64_t v26 = sub_25DDFDF60();
  sub_25DDEF330((uint64_t)v9, &qword_26A6CA690);
  uint64_t v54 = MEMORY[0x263F774B0];
  uint64_t v53 = MEMORY[0x263F1B720];
  uint64_t v52 = v26;
  sub_25DDFE200();
  uint64_t v27 = a1;
  uint64_t v28 = v41;
  sub_25DDF5B58(v27, v41, (void (*)(void))type metadata accessor for PersonVideoFactListView);
  unint64_t v29 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v30 = swift_allocObject();
  sub_25DDF5680(v28, v30 + v29);
  uint64_t v31 = sub_25DDF5A40(&qword_26A6CA6B0, MEMORY[0x263F778A0]);
  sub_25DDFDFA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v10);
  uint64_t v65 = v10;
  uint64_t v66 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v46;
  sub_25DDFE020();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v32);
  uint64_t v33 = v42;
  sub_25DDF5A88((uint64_t)v18, v42);
  uint64_t v34 = (uint64_t)v48;
  sub_25DDFDC40();
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  sub_25DDF5AF0(v33, (uint64_t)v18);
  uint64_t v35 = v50;
  sub_25DDF5B58(v34, v50, (void (*)(void))type metadata accessor for ResultsList);
  uint64_t v36 = v51;
  sub_25DDF5AF0((uint64_t)v18, v51);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6B8);
  sub_25DDF5B58(v35, v36 + *(int *)(v37 + 48), (void (*)(void))type metadata accessor for ResultsList);
  sub_25DDF35C8(v34);
  sub_25DDEF330(v33, &qword_26A6CA6A0);
  sub_25DDF35C8(v35);
  return sub_25DDEF330((uint64_t)v18, &qword_26A6CA6A0);
}

uint64_t sub_25DDF4EB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_25DDFDB70();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v31 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25DDFDC10();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25DDFE0A0();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5E0);
  uint64_t v29 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5D8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = sub_25DDFDB50();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersonVideoFactListView();
  sub_25DDFDC80();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_25DDEF330((uint64_t)v14, &qword_26A6CA5D8);
    uint64_t v19 = 1;
    uint64_t v21 = v34;
    uint64_t v20 = v35;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v15);
    sub_25DDFDBE0();
    sub_25DDEF330((uint64_t)v12, &qword_26A6CA5D8);
    sub_25DDFE0B0();
    uint64_t v23 = v31;
    uint64_t v22 = v32;
    uint64_t v24 = v33;
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, *MEMORY[0x263F764E8], v33);
    sub_25DDF5A40(&qword_26A6CA588, MEMORY[0x263F77558]);
    sub_25DDFDF80();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v35, v8, v34);
    uint64_t v19 = 0;
    uint64_t v20 = v25;
    uint64_t v21 = v26;
  }
  return __swift_storeEnumTagSinglePayload(v20, v19, 1, v21);
}

uint64_t sub_25DDF5340()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4B8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = sub_25DDFDBC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersonVideoFactListView();
  sub_25DDFDC60();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    uint64_t v16 = &qword_26A6CA4C0;
    uint64_t v17 = (uint64_t)v11;
    return sub_25DDEF330(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  sub_25DDFE0F0();
  uint64_t v18 = sub_25DDFE1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v16 = &qword_26A6CA4C8;
    uint64_t v17 = (uint64_t)v5;
    return sub_25DDEF330(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  uint64_t v20 = sub_25DDFE160();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v20);
  sub_25DDFE1E0();
  sub_25DDEF330((uint64_t)v2, &qword_26A6CA4B8);
  sub_25DDEF330((uint64_t)v9, &qword_26A6CA4C0);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v5, v18);
}

uint64_t sub_25DDF5680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersonVideoFactListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF56E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PersonVideoFactListView();
  OUTLINED_FUNCTION_1_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25DDF4894(v5, a1);
}

unint64_t sub_25DDF5734()
{
  unint64_t result = qword_26A6CA6A8;
  if (!qword_26A6CA6A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA690);
    sub_25DDFE0A0();
    sub_25DDF5A40(&qword_26A6CA588, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA6A8);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for PersonVideoFactListView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v7();
  uint64_t v8 = v6 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v9();
  uint64_t v10 = sub_25DDFDC90();
  uint64_t v11 = v8 + *(int *)(v10 + 20);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v11, v12);
  v14(v8 + *(int *)(v10 + 24), v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v16();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25DDF5A00()
{
  uint64_t v0 = type metadata accessor for PersonVideoFactListView();
  OUTLINED_FUNCTION_1_1(v0);
  return sub_25DDF5340();
}

uint64_t sub_25DDF5A40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDF5A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF5AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF5B58(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DDF5BB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_25DDF5C74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_25DDF5D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_25DDF5E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_25DDF5EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_25DDF5FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_25DDF6060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25DDF611C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF6130);
}

uint64_t sub_25DDF6130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25DDFDD90();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25DDF61AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF61C0);
}

uint64_t sub_25DDF61C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25DDFDD90();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ResultsList()
{
  uint64_t result = qword_26A6CA6C8;
  if (!qword_26A6CA6C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25DDF628C()
{
  sub_25DDFE110();
  if (v0 <= 0x3F)
  {
    sub_25DDF6354();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25DDF6354()
{
  if (!qword_26A6CA6D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA6E0);
    unint64_t v0 = sub_25DDFDC20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6CA6D8);
    }
  }
}

uint64_t sub_25DDF63B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDF63CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v33[1] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA608);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for ResultsList();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6E8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4();
  uint64_t v16 = v15 - v14;
  v33[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6F0);
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_4();
  uint64_t v22 = v21 - v20;
  sub_25DDF6D08(v2, (uint64_t)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ResultsList);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = swift_allocObject();
  sub_25DDF6AE8((uint64_t)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6F8);
  sub_25DDF6BBC();
  sub_25DDFE130();
  uint64_t v25 = *MEMORY[0x263F775E0];
  sub_25DDFE140();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v26 + 104))(v6, v25);
  uint64_t v27 = *MEMORY[0x263F775F8];
  uint64_t v28 = sub_25DDFE150();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 104))(v6, v27, v28);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v28);
  uint64_t v30 = sub_25DDEF2A0(&qword_26A6CA710, &qword_26A6CA6E8);
  MEMORY[0x2611C7DD0](v6, v10, v30);
  sub_25DDF6C60(v6);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v10);
  v33[2] = v10;
  v33[3] = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v33[0];
  sub_25DDFE010();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v22, v31);
}

uint64_t sub_25DDF6738()
{
  return sub_25DDFE070();
}

uint64_t sub_25DDF688C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25DDFDF30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for VideoResult();
  sub_25DDF6D08(a1, a2 + *(int *)(v8 + 24), MEMORY[0x263F758A0]);
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  v10[1] = 0x4028000000000000;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1A6F0], v4);
  sub_25DDF6D68();
  return sub_25DDFDEA0();
}

uint64_t sub_25DDF69D0()
{
  uint64_t v1 = (int *)(type metadata accessor for ResultsList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  uint64_t v8 = v6 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA6C0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v9 + 8))(v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25DDF6AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ResultsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF6B4C()
{
  type metadata accessor for ResultsList();
  return sub_25DDF6738();
}

unint64_t sub_25DDF6BBC()
{
  unint64_t result = qword_26A6CA700;
  if (!qword_26A6CA700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA6F8);
    sub_25DDF6CC0(&qword_26A6CA708, (void (*)(uint64_t))type metadata accessor for VideoResult);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA700);
  }
  return result;
}

uint64_t sub_25DDF6C60(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA608);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DDF6CC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDF6D08(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_25DDF6D68()
{
  unint64_t result = qword_26A6CA730;
  if (!qword_26A6CA730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA730);
  }
  return result;
}

uint64_t sub_25DDF6DB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_25DDF6E70(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(sub_25DDFDD70() + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = &v10[v12];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_25DDF6FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v5 + *(int *)(sub_25DDFDD70() + 20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t sub_25DDF70C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25DDFDD70() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_25DDF71D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25DDFDD70() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_25DDF72E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25DDFDD70() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_25DDF73F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(sub_25DDFDD70() + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_25DDF7508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF751C);
}

uint64_t sub_25DDF751C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_25DDFDD70();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25DDF7598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF75AC);
}

uint64_t sub_25DDF75AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_25DDFDD70();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for StandardButtonView()
{
  uint64_t result = qword_26A6CA738;
  if (!qword_26A6CA738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDF7678()
{
  uint64_t result = sub_25DDFE110();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25DDFDD70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25DDF7740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDF775C()
{
  uint64_t v1 = type metadata accessor for StandardButtonView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_25DDF7FB0(v0, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_25DDF8018((uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA748);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA750);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA458);
  uint64_t v8 = sub_25DDFE120();
  uint64_t v9 = sub_25DDEF2A0(&qword_26A6CA478, &qword_26A6CA458);
  unint64_t v10 = sub_25DDF80CC();
  uint64_t v13 = v7;
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  unint64_t v16 = v10;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v6;
  uint64_t v14 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  return sub_25DDFE130();
}

uint64_t sub_25DDF7928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_25DDFE120();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for StandardButtonView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA458);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA750);
  uint64_t v14 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDF7FB0(a1, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  sub_25DDF8018((uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  uint64_t v28 = a1;
  sub_25DDFE060();
  sub_25DDFDF00();
  uint64_t v19 = sub_25DDEF2A0(&qword_26A6CA478, &qword_26A6CA458);
  unint64_t v20 = sub_25DDF80CC();
  uint64_t v21 = v25;
  sub_25DDFDFF0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v29 = v10;
  uint64_t v30 = v21;
  uint64_t v31 = v19;
  unint64_t v32 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v24;
  sub_25DDFE010();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v22);
}

uint64_t sub_25DDF7CC8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4B8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDFE0F0();
  uint64_t v9 = sub_25DDFE1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1) {
    return sub_25DDF82BC((uint64_t)v8, &qword_26A6CA4C8);
  }
  type metadata accessor for StandardButtonView();
  sub_25DDFDD50();
  uint64_t v11 = sub_25DDFDBC0();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  uint64_t v12 = sub_25DDFE160();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_25DDFE1E0();
  sub_25DDF82BC((uint64_t)v2, &qword_26A6CA4B8);
  sub_25DDF82BC((uint64_t)v5, &qword_26A6CA4C0);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_25DDF7EC4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for StandardButtonView();
  MEMORY[0x2611C7B70]();
  sub_25DDEF2E4();
  uint64_t v2 = sub_25DDFDF50();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_25DDFDF20();
  uint64_t v7 = sub_25DDFDF40();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_25DDF82AC(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_25DDF7FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandardButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF8018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandardButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDF807C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for StandardButtonView();
  OUTLINED_FUNCTION_1_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_25DDF7928(v5, a1);
}

unint64_t sub_25DDF80CC()
{
  unint64_t result = qword_26A6CA758;
  if (!qword_26A6CA758)
  {
    sub_25DDFE120();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA758);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = *(void *)(type metadata accessor for StandardButtonView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_25DDFE110();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5();
  v6();
  sub_25DDFDD70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA468);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5();
  v7();
  return MEMORY[0x270FA0238](v0, v3, v4);
}

uint64_t sub_25DDF8264()
{
  uint64_t v0 = type metadata accessor for StandardButtonView();
  OUTLINED_FUNCTION_1_1(v0);
  return sub_25DDF7CC8();
}

uint64_t sub_25DDF82A4@<X0>(uint64_t a1@<X8>)
{
  return sub_25DDF7EC4(a1);
}

uint64_t sub_25DDF82AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25DDF82BC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5();
  v3();
  return a1;
}

uint64_t sub_25DDF8308()
{
  return sub_25DDEF2A0(&qword_26A6CA760, &qword_26A6CA768);
}

uint64_t *sub_25DDF8358(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDFE110();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
    unint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    unint64_t v17 = (int *)sub_25DDFDD40();
    v16(&v13[v17[5]], &v14[v17[5]], v15);
    v16(&v13[v17[6]], &v14[v17[6]], v15);
    v16(&v13[v17[7]], &v14[v17[7]], v15);
    v16(&v13[v17[8]], &v14[v17[8]], v15);
    v16(&v13[v17[9]], &v14[v17[9]], v15);
    uint64_t v18 = v17[10];
    uint64_t v19 = &v13[v18];
    unint64_t v20 = &v14[v18];
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = v17[11];
    unint64_t v23 = &v13[v22];
    uint64_t v24 = &v14[v22];
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    v16(&v13[v17[12]], &v14[v17[12]], v15);
  }
  return a1;
}

uint64_t sub_25DDF8618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  unint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v16)((void *)(v8 - 8), v7, v8);
  uint64_t v9 = (int *)sub_25DDFDD40();
  v16(v7 + v9[5], v8);
  v16(v7 + v9[6], v8);
  v16(v7 + v9[7], v8);
  v16(v7 + v9[8], v8);
  v16(v7 + v9[9], v8);
  uint64_t v10 = v7 + v9[10];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v7 + v9[11];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v7 + v9[12];
  return ((uint64_t (*)(uint64_t, uint64_t))v16)(v14, v8);
}

uint64_t sub_25DDF8860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  unint64_t v16 = (int *)sub_25DDFDD40();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  uint64_t v17 = v16[10];
  uint64_t v18 = v12 + v17;
  uint64_t v19 = v13 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = v16[11];
  uint64_t v22 = v12 + v21;
  uint64_t v23 = v13 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_25DDF8AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24);
  v15(v12, v13, v14);
  unint64_t v16 = (int *)sub_25DDFDD40();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  uint64_t v17 = v16[10];
  uint64_t v18 = v12 + v17;
  uint64_t v19 = v13 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = v16[11];
  uint64_t v22 = v12 + v21;
  uint64_t v23 = v13 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_25DDF8D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  unint64_t v16 = (int *)sub_25DDFDD40();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  uint64_t v17 = v16[10];
  uint64_t v18 = v12 + v17;
  uint64_t v19 = v13 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = v16[11];
  uint64_t v22 = v12 + v21;
  uint64_t v23 = v13 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_25DDF8FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDFE110();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  unint64_t v16 = (int *)sub_25DDFDD40();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  uint64_t v17 = v16[10];
  uint64_t v18 = v12 + v17;
  uint64_t v19 = v13 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = v16[11];
  uint64_t v22 = v12 + v21;
  uint64_t v23 = v13 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_25DDF9220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDF9234);
}

uint64_t sub_25DDF9234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = sub_25DDFDD40();
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_25DDF92D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDF92EC);
}

uint64_t sub_25DDF92EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DDFE110();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_25DDFDD40();
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for VideoResult()
{
  uint64_t result = qword_26A6CA778;
  if (!qword_26A6CA778) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25DDF93E0()
{
  sub_25DDFE110();
  if (v0 <= 0x3F)
  {
    sub_25DDF94E4();
    if (v1 <= 0x3F)
    {
      sub_25DDFDD40();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25DDF94E4()
{
  if (!qword_26A6CA788)
  {
    sub_25DDF6D68();
    unint64_t v0 = sub_25DDFDEC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6CA788);
    }
  }
}

uint64_t sub_25DDF9540()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDF955C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = type metadata accessor for VideoResult();
  uint64_t v52 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v53 = v4;
  uint64_t v56 = (uint64_t)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA790);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA798);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_25DDFE210();
  uint64_t v14 = OUTLINED_FUNCTION_1_2(v13, (uint64_t)v72);
  uint64_t v49 = v15;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_4();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA698);
  uint64_t v17 = OUTLINED_FUNCTION_1_2(v16, (uint64_t)&v73);
  uint64_t v50 = v18;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_4();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7A0);
  uint64_t v20 = OUTLINED_FUNCTION_1_2(v19, (uint64_t)&v74);
  uint64_t v54 = v21;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7A8);
  MEMORY[0x270FA5388](v22 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v48 = v24 - v23;
  uint64_t v25 = sub_25DDFDD30();
  v72[0] = MEMORY[0x263F8D310];
  v72[1] = MEMORY[0x263F77998];
  if (v26) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = 0;
  }
  unint64_t v28 = 0xE000000000000000;
  if (v26) {
    unint64_t v28 = v26;
  }
  uint64_t v70 = v27;
  unint64_t v71 = v28;
  sub_25DDF9B20(v12);
  sub_25DDFB730(&qword_26A6CA7B0, &qword_26A6CA798, (void (*)(void))sub_25DDFB708);
  uint64_t v29 = sub_25DDFDF60();
  sub_25DDEF330(v12, &qword_26A6CA798);
  uint64_t v30 = MEMORY[0x263F1B720];
  uint64_t v31 = MEMORY[0x263F774B0];
  uint64_t v68 = MEMORY[0x263F1B720];
  uint64_t v69 = MEMORY[0x263F774B0];
  uint64_t v67 = v29;
  uint64_t v32 = sub_25DDFDCE0();
  if (v33)
  {
    *((void *)&v65 + 1) = MEMORY[0x263F8D310];
    uint64_t v66 = MEMORY[0x263F77998];
    *(void *)&long long v64 = v32;
    *((void *)&v64 + 1) = v33;
  }
  else
  {
    uint64_t v66 = 0;
    long long v64 = 0u;
    long long v65 = 0u;
  }
  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  sub_25DDFA1A8(v8);
  sub_25DDFB834();
  uint64_t v34 = sub_25DDFDF60();
  sub_25DDEF330(v8, &qword_26A6CA790);
  uint64_t v60 = v31;
  uint64_t v59 = v30;
  uint64_t v58 = v34;
  sub_25DDFE200();
  uint64_t v35 = v56;
  sub_25DDFB978(v2, v56);
  unint64_t v36 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v37 = swift_allocObject();
  sub_25DDFBC00(v35, v37 + v36);
  uint64_t v38 = sub_25DDFC340(&qword_26A6CA6B0, MEMORY[0x263F778A0]);
  uint64_t v39 = v51;
  sub_25DDFDFA0();
  swift_release();
  OUTLINED_FUNCTION_5();
  v40();
  uint64_t v70 = v39;
  unint64_t v71 = v38;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = v55;
  sub_25DDFE010();
  OUTLINED_FUNCTION_5();
  v43();
  uint64_t v70 = v42;
  unint64_t v71 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v44 = v48;
  sub_25DDFE020();
  OUTLINED_FUNCTION_5();
  v45();
  return sub_25DDFBCC4(v44, v57);
}

uint64_t sub_25DDF9B20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v49 = sub_25DDFE0D0();
  uint64_t v45 = *(void *)(v49 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v49);
  uint64_t v44 = (char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v43 = (char *)v40 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)v40 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)v40 - v8;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA830);
  MEMORY[0x270FA5388](v50);
  uint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA838);
  MEMORY[0x270FA5388](v47);
  uint64_t v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7C0);
  MEMORY[0x270FA5388](v52);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7D0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  uint64_t v46 = (char *)v1;
  uint64_t v18 = sub_25DDFDD00();
  uint64_t v20 = v19;
  uint64_t v21 = sub_25DDFDD10();
  uint64_t v23 = sub_25DDECED4(v18, v20, v21, v22);
  uint64_t v48 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_retain();
    *(void *)uint64_t v17 = sub_25DDFDEE0();
    *((void *)v17 + 1) = 0;
    v17[16] = 0;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA840);
    sub_25DDFB2F8(v23, &v17[*(int *)(v25 + 44)]);
    sub_25DDFC078((uint64_t)v17, (uint64_t)v12, &qword_26A6CA7D0);
    swift_storeEnumTagMultiPayload();
    sub_25DDFB7E0();
    sub_25DDFC340(&qword_26A6CA7D8, MEMORY[0x263F77580]);
    sub_25DDFDEF0();
    sub_25DDFC078((uint64_t)v14, (uint64_t)v10, &qword_26A6CA7C0);
    swift_storeEnumTagMultiPayload();
    sub_25DDFB708();
    sub_25DDFDEF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    sub_25DDEF330((uint64_t)v14, &qword_26A6CA7C0);
    return sub_25DDEF330((uint64_t)v17, &qword_26A6CA7D0);
  }
  else
  {
    uint64_t v27 = v43;
    unint64_t v28 = v44;
    v40[0] = v14;
    v40[1] = v15;
    uint64_t v30 = v41;
    uint64_t v29 = v42;
    uint64_t v46 = v10;
    uint64_t v31 = v45;
    uint64_t v32 = v49;
    if (v48)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_25DDFDCF0();
      if (v34) {
        uint64_t v35 = v33;
      }
      else {
        uint64_t v35 = 0;
      }
      if (v34) {
        unint64_t v36 = v34;
      }
      else {
        unint64_t v36 = 0xE000000000000000;
      }
      uint64_t v53 = v35;
      unint64_t v54 = v36;
      swift_bridgeObjectRetain();
      sub_25DDFE2A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25DDFE0E0();
      uint64_t v37 = v29;
      uint64_t v38 = v32;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v30, v37, v32);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v12, v30, v32);
      swift_storeEnumTagMultiPayload();
      sub_25DDFB7E0();
      sub_25DDFC340(&qword_26A6CA7D8, MEMORY[0x263F77580]);
      uint64_t v39 = v40[0];
      sub_25DDFDEF0();
      sub_25DDFC078(v39, (uint64_t)v46, &qword_26A6CA7C0);
      swift_storeEnumTagMultiPayload();
      sub_25DDFB708();
      sub_25DDFDEF0();
      swift_bridgeObjectRelease();
      sub_25DDEF330(v39, &qword_26A6CA7C0);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v38);
    }
    else
    {
      sub_25DDFDCF0();
      sub_25DDFE0E0();
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v27, v28, v32);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v46, v27, v32);
      swift_storeEnumTagMultiPayload();
      sub_25DDFB708();
      sub_25DDFC340(&qword_26A6CA7D8, MEMORY[0x263F77580]);
      sub_25DDFDEF0();
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v27, v32);
    }
  }
}

uint64_t sub_25DDFA1A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v106 = a1;
  uint64_t v88 = sub_25DDFDC30();
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v86 = (char *)&v79 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_25DDFDB90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v85 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v89 = (uint64_t)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7F8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v84 = (uint64_t)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25DDFDBB0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v83 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA800);
  MEMORY[0x270FA5388](v104);
  v105 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_25DDFDB70();
  uint64_t v92 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25DDFDC10();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v94 = sub_25DDFE0A0();
  uint64_t v91 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v90 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5E0);
  uint64_t v96 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  v95 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7E8);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  v99 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA808);
  uint64_t v103 = *(void *)(v93 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v93);
  v97 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v101 = (char *)&v79 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5D8);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  unint64_t v26 = (char *)&v79 - v25;
  uint64_t v27 = sub_25DDFDB50();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v79 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  sub_25DDFDD20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27) == 1)
  {
    sub_25DDEF330((uint64_t)v26, &qword_26A6CA5D8);
    uint64_t v31 = sub_25DDFDBD0();
    uint64_t v32 = v84;
    __swift_storeEnumTagSinglePayload(v84, 1, 1, v31);
    uint64_t v33 = sub_25DDFDB80();
    __swift_storeEnumTagSinglePayload(v89, 1, 1, v33);
    unint64_t v34 = v85;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v85, *MEMORY[0x263F767A0], v2);
    uint64_t v35 = *MEMORY[0x263F765B8];
    uint64_t v79 = v3;
    uint64_t v80 = v2;
    uint64_t v36 = v92;
    uint64_t v37 = *(void (**)(char *, void, uint64_t))(v92 + 104);
    uint64_t v81 = v92 + 104;
    uint64_t v82 = v37;
    uint64_t v38 = v13;
    v37(v13, v35, v107);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA810);
    uint64_t v39 = sub_25DDFDB60();
    uint64_t v40 = *(void *)(v39 - 8);
    unint64_t v41 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_25DDFE520;
    (*(void (**)(unint64_t, void, uint64_t))(v40 + 104))(v42 + v41, *MEMORY[0x263F76468], v39);
    sub_25DDFBD2C(v42);
    uint64_t v43 = v87;
    uint64_t v44 = v86;
    uint64_t v45 = v88;
    (*(void (**)(char *, void, uint64_t))(v87 + 104))(v86, *MEMORY[0x263F772A0], v88);
    uint64_t v46 = v89;
    sub_25DDFDBA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
    uint64_t v47 = *(void (**)(char *, uint64_t))(v36 + 8);
    uint64_t v48 = v107;
    v47(v13, v107);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v34, v80);
    sub_25DDEF330(v46, &qword_26A6CA7F0);
    sub_25DDEF330(v32, &qword_26A6CA7F8);
    uint64_t v49 = v90;
    sub_25DDFE0C0();
    uint64_t v50 = v48;
    v82(v38, *MEMORY[0x263F76578], v48);
    uint64_t v51 = sub_25DDFC340(&qword_26A6CA588, MEMORY[0x263F77558]);
    uint64_t v52 = v94;
    uint64_t v53 = v95;
    sub_25DDFDF80();
    v47(v38, v50);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v49, v52);
    uint64_t v108 = v52;
    uint64_t v109 = v51;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v56 = v98;
    uint64_t v55 = v99;
    sub_25DDFDFB0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v53, v56);
    uint64_t v108 = v56;
    uint64_t v109 = OpaqueTypeConformance2;
    uint64_t v57 = swift_getOpaqueTypeConformance2();
    uint64_t v58 = v97;
    uint64_t v59 = v102;
    sub_25DDFDF90();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v55, v59);
    uint64_t v60 = v103;
    long long v61 = v101;
    uint64_t v62 = v93;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v101, v58, v93);
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v105, v61, v62);
    swift_storeEnumTagMultiPayload();
    uint64_t v108 = v59;
    uint64_t v109 = v57;
    swift_getOpaqueTypeConformance2();
    sub_25DDFDEF0();
    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v61, v62);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v30, v26, v27);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 1, 1, v27);
    sub_25DDFDBE0();
    sub_25DDEF330((uint64_t)v24, &qword_26A6CA5D8);
    long long v64 = v90;
    sub_25DDFE0B0();
    uint64_t v65 = v92;
    uint64_t v66 = v107;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v13, *MEMORY[0x263F76578], v107);
    uint64_t v67 = sub_25DDFC340(&qword_26A6CA588, MEMORY[0x263F77558]);
    uint64_t v69 = v94;
    uint64_t v68 = v95;
    sub_25DDFDF80();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v13, v66);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v64, v69);
    uint64_t v108 = v69;
    uint64_t v109 = v67;
    uint64_t v70 = swift_getOpaqueTypeConformance2();
    uint64_t v72 = v98;
    unint64_t v71 = v99;
    sub_25DDFDFB0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v68, v72);
    uint64_t v108 = v72;
    uint64_t v109 = v70;
    uint64_t v73 = swift_getOpaqueTypeConformance2();
    uint64_t v74 = v97;
    uint64_t v75 = v102;
    sub_25DDFDF90();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v71, v75);
    uint64_t v76 = v103;
    uint64_t v77 = v101;
    uint64_t v78 = v93;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v101, v74, v93);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v105, v77, v78);
    swift_storeEnumTagMultiPayload();
    uint64_t v108 = v75;
    uint64_t v109 = v73;
    swift_getOpaqueTypeConformance2();
    sub_25DDFDEF0();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v78);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  }
}

uint64_t sub_25DDFAFC0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4B8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA4C0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = sub_25DDFDBC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  sub_25DDFDCD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    uint64_t v16 = &qword_26A6CA4C0;
    uint64_t v17 = (uint64_t)v11;
    return sub_25DDEF330(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  sub_25DDFE0F0();
  uint64_t v18 = sub_25DDFE1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v16 = &qword_26A6CA4C8;
    uint64_t v17 = (uint64_t)v5;
    return sub_25DDEF330(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  uint64_t v20 = sub_25DDFE160();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v20);
  sub_25DDFE1E0();
  sub_25DDEF330((uint64_t)v2, &qword_26A6CA4B8);
  sub_25DDEF330((uint64_t)v9, &qword_26A6CA4C0);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v5, v18);
}

uint64_t sub_25DDFB2F8@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v38 = a1;
  unint64_t v41 = a2;
  uint64_t v2 = sub_25DDFE030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25DDFE0D0();
  uint64_t v37 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v36 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v39 = (char *)&v36 - v13;
  type metadata accessor for VideoResult();
  sub_25DDFDCF0();
  sub_25DDFE0E0();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v12, v6);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v15 = sub_25DDFE040();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  sub_25DDFDEB0();
  sub_25DDFE080();
  sub_25DDFDED0();
  uint64_t v16 = v57;
  LOBYTE(v3) = v58;
  uint64_t v17 = v59;
  LOBYTE(v12) = v60;
  uint64_t v19 = v61;
  uint64_t v18 = v62;
  char v20 = sub_25DDFDF10();
  sub_25DDFDE90();
  uint64_t v42 = v15;
  uint64_t v43 = 0;
  __int16 v44 = 1;
  uint64_t v45 = v16;
  char v46 = v3;
  uint64_t v47 = v17;
  char v48 = (char)v12;
  uint64_t v49 = v19;
  uint64_t v50 = v18;
  char v51 = v20;
  uint64_t v52 = v21;
  uint64_t v53 = v22;
  uint64_t v54 = v23;
  uint64_t v55 = v24;
  char v56 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA848);
  sub_25DDFC104(&qword_26A6CA850, &qword_26A6CA848, (void (*)(void))sub_25DDFC0D4);
  uint64_t v25 = sub_25DDFDF60();
  swift_release();
  unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v27 = v40;
  uint64_t v28 = v39;
  uint64_t v29 = v37;
  v26(v40, v39, v37);
  LOBYTE(v42) = 1;
  uint64_t v30 = v41;
  v26(v41, v27, v29);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA878);
  *(void *)&v30[*(int *)(v31 + 48)] = v25;
  uint64_t v32 = &v30[*(int *)(v31 + 64)];
  char v33 = v42;
  *(void *)uint64_t v32 = 0;
  v32[8] = v33;
  unint64_t v34 = *(void (**)(char *, uint64_t))(v7 + 8);
  swift_retain();
  v34(v28, v29);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v34)(v27, v29);
}

uint64_t sub_25DDFB708()
{
  return sub_25DDFB730(&qword_26A6CA7B8, &qword_26A6CA7C0, (void (*)(void))sub_25DDFB7E0);
}

uint64_t sub_25DDFB730(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_25DDFC340(&qword_26A6CA7D8, MEMORY[0x263F77580]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25DDFB7E0()
{
  unint64_t result = qword_26A6CA7C8;
  if (!qword_26A6CA7C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA7D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA7C8);
  }
  return result;
}

unint64_t sub_25DDFB834()
{
  unint64_t result = qword_26A6CA7E0;
  if (!qword_26A6CA7E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA790);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA7E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA5E0);
    sub_25DDFE0A0();
    sub_25DDFC340(&qword_26A6CA588, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA7E0);
  }
  return result;
}

uint64_t sub_25DDFB978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDFB9DC()
{
  uint64_t v1 = (int *)(type metadata accessor for VideoResult() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_25DDFE110();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA770);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v8();
  uint64_t v9 = v6 + v1[8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5A0);
  OUTLINED_FUNCTION_3();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v9, v10);
  uint64_t v13 = (int *)sub_25DDFDD40();
  uint64_t v14 = OUTLINED_FUNCTION_3_0(v13[5]);
  ((void (*)(uint64_t))v12)(v14);
  uint64_t v15 = OUTLINED_FUNCTION_3_0(v13[6]);
  ((void (*)(uint64_t))v12)(v15);
  uint64_t v16 = OUTLINED_FUNCTION_3_0(v13[7]);
  ((void (*)(uint64_t))v12)(v16);
  uint64_t v17 = OUTLINED_FUNCTION_3_0(v13[8]);
  ((void (*)(uint64_t))v12)(v17);
  uint64_t v18 = OUTLINED_FUNCTION_3_0(v13[9]);
  ((void (*)(uint64_t))v12)(v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA650);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5B0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  v20();
  uint64_t v21 = OUTLINED_FUNCTION_3_0(v13[12]);
  ((void (*)(uint64_t))v12)(v21);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25DDFBC00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDFBC64()
{
  type metadata accessor for VideoResult();
  return sub_25DDFAFC0();
}

uint64_t sub_25DDFBCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA7A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDFBD2C(uint64_t a1)
{
  uint64_t v2 = sub_25DDFDB60();
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA818);
  uint64_t result = sub_25DDFE2C0();
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
    sub_25DDFC340(&qword_26A6CA820, MEMORY[0x263F76470]);
    uint64_t v13 = sub_25DDFE240();
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
        sub_25DDFC340(&qword_26A6CA828, MEMORY[0x263F76470]);
        char v20 = sub_25DDFE250();
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

uint64_t sub_25DDFC078(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DDFC0D4()
{
  return sub_25DDFC104(&qword_26A6CA858, &qword_26A6CA860, (void (*)(void))sub_25DDFC180);
}

uint64_t sub_25DDFC104(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25DDFC180()
{
  unint64_t result = qword_26A6CA868;
  if (!qword_26A6CA868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA868);
  }
  return result;
}

unint64_t sub_25DDFC1F8()
{
  unint64_t result = qword_26A6CA880;
  if (!qword_26A6CA880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA7A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6CA698);
    sub_25DDFE210();
    sub_25DDFC340(&qword_26A6CA6B0, MEMORY[0x263F778A0]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_25DDFC340(&qword_26A6CA888, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA880);
  }
  return result;
}

uint64_t sub_25DDFC340(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t VideoResultDisambiguationList.body.getter()
{
  uint64_t v1 = type metadata accessor for VideoResultDisambiguationList();
  uint64_t v2 = OUTLINED_FUNCTION_2(v1);
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v2);
  sub_25DDFC6C0(v0, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_25DDFC728((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA890);
  sub_25DDEF2A0(&qword_26A6CA898, &qword_26A6CA890);
  return sub_25DDFE130();
}

uint64_t type metadata accessor for VideoResultDisambiguationList()
{
  uint64_t result = qword_26A6CA8A0;
  if (!qword_26A6CA8A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDFC520(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for VideoResultDisambiguationList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = sub_25DDFE1D0();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = MEMORY[0x2611C7AC0](v6);
  uint64_t v16 = MEMORY[0x263F8D310];
  uint64_t v17 = MEMORY[0x263F77998];
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  sub_25DDFE1C0();
  sub_25DDFC6C0(a1, (uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_25DDFC728((uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  type metadata accessor for ResultsList();
  sub_25DDFCFFC();
  return sub_25DDFE190();
}

uint64_t sub_25DDFC6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoResultDisambiguationList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDFC728(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VideoResultDisambiguationList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDFC78C()
{
  return sub_25DDFCF78(sub_25DDFC520);
}

uint64_t sub_25DDFC7A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25DDFC7C0()
{
  type metadata accessor for ResultsList();
  sub_25DDFDCA0();
  return _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
}

uint64_t *initializeBufferWithCopyOfBuffer for VideoResultDisambiguationList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_25DDFDCC0();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for VideoResultDisambiguationList(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(sub_25DDFDCC0() + 20);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t initializeWithCopy for VideoResultDisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDCC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for VideoResultDisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDCC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t initializeWithTake for VideoResultDisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDCC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for VideoResultDisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(sub_25DDFDCC0() + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoResultDisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDFCD00);
}

uint64_t sub_25DDFCD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFDCC0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for VideoResultDisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDFCD5C);
}

uint64_t sub_25DDFCD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDFDCC0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_25DDFCDA8()
{
  uint64_t result = sub_25DDFDCC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DDFCE34()
{
  return sub_25DDEF2A0(&qword_26A6CA8B0, &qword_26A6CA8B8);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = type metadata accessor for VideoResultDisambiguationList();
  OUTLINED_FUNCTION_2(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v0 + v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA470);
  OUTLINED_FUNCTION_0_1();
  (*(void (**)(uint64_t))(v11 + 8))(v10);
  uint64_t v12 = v10 + *(int *)(sub_25DDFDCC0() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6CA5F0);
  OUTLINED_FUNCTION_0_1();
  (*(void (**)(uint64_t))(v13 + 8))(v12);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25DDFCF60()
{
  return sub_25DDFCF78((uint64_t (*)(uint64_t))sub_25DDFC7C0);
}

uint64_t sub_25DDFCF78(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for VideoResultDisambiguationList() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

unint64_t sub_25DDFCFFC()
{
  unint64_t result = qword_26A6CA8C0;
  if (!qword_26A6CA8C0)
  {
    type metadata accessor for ResultsList();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6CA8C0);
  }
  return result;
}

uint64_t static SnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
{
  type metadata accessor for PersonVideoFactListView();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_0_2();
  uint64_t v73 = v2;
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = sub_25DDFDC90();
  uint64_t v4 = OUTLINED_FUNCTION_4_0(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_2();
  uint64_t v72 = v5;
  OUTLINED_FUNCTION_3_1();
  type metadata accessor for FilteredListView();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_2();
  uint64_t v71 = v7;
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = sub_25DDFDDC0();
  uint64_t v9 = OUTLINED_FUNCTION_4_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_2();
  uint64_t v70 = v10;
  OUTLINED_FUNCTION_3_1();
  type metadata accessor for StandardButtonView();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0_2();
  uint64_t v69 = v12;
  OUTLINED_FUNCTION_3_1();
  uint64_t v13 = sub_25DDFDD70();
  uint64_t v14 = OUTLINED_FUNCTION_4_0(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_2();
  uint64_t v68 = v15;
  OUTLINED_FUNCTION_3_1();
  type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_0_2();
  uint64_t v67 = v17;
  OUTLINED_FUNCTION_3_1();
  uint64_t v18 = sub_25DDFDDD0();
  uint64_t v19 = OUTLINED_FUNCTION_4_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_0_2();
  uint64_t v66 = v20;
  OUTLINED_FUNCTION_3_1();
  type metadata accessor for VideoResultDisambiguationList();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_0_2();
  uint64_t v65 = v22;
  OUTLINED_FUNCTION_3_1();
  uint64_t v23 = sub_25DDFDCC0();
  uint64_t v24 = OUTLINED_FUNCTION_4_0(v23);
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_4();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_4();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = sub_25DDFDE10();
  uint64_t v34 = OUTLINED_FUNCTION_4_0(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_4();
  uint64_t v37 = v36 - v35;
  type metadata accessor for ResultsList();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_4();
  uint64_t v41 = v40 - v39;
  uint64_t v42 = sub_25DDFDD90();
  uint64_t v43 = OUTLINED_FUNCTION_4_0(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_4();
  uint64_t v46 = v45 - v44;
  sub_25DDFDE80();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_4();
  uint64_t v50 = v49 - v48;
  sub_25DDFD9F0(a1, v49 - v48, MEMORY[0x263F75908]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_25DDFD990(v50, v37, MEMORY[0x263F758F0]);
      sub_25DDFD9F0(v37, v32 + *(int *)(v28 + 20), MEMORY[0x263F758F0]);
      _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
      sub_25DDFDA50((unint64_t *)&unk_26A6CA8F0, (void (*)(uint64_t))type metadata accessor for DisambiguationList);
      uint64_t v52 = sub_25DDFDF60();
      sub_25DDFDA98(v32, (void (*)(void))type metadata accessor for DisambiguationList);
      uint64_t v53 = (void (*)(void))MEMORY[0x263F758F0];
      uint64_t v54 = v37;
      break;
    case 2u:
      sub_25DDFD990(v50, v27, MEMORY[0x263F75898]);
      sub_25DDFD9F0(v27, v65, MEMORY[0x263F75898]);
      sub_25DDFDA50(&qword_26A6CA8E8, (void (*)(uint64_t))type metadata accessor for VideoResultDisambiguationList);
      uint64_t v52 = sub_25DDFDF60();
      sub_25DDFDA98(v65, (void (*)(void))type metadata accessor for VideoResultDisambiguationList);
      uint64_t v53 = (void (*)(void))MEMORY[0x263F75898];
      uint64_t v54 = v27;
      break;
    case 3u:
      uint64_t v55 = v50;
      uint64_t v56 = v66;
      sub_25DDFD990(v55, v66, MEMORY[0x263F758E8]);
      OUTLINED_FUNCTION_6_0();
      sub_25DDFD9F0(v66, v57, MEMORY[0x263F758E8]);
      _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
      sub_25DDFDA50(&qword_26A6CA8E0, (void (*)(uint64_t))type metadata accessor for ConfirmationView);
      uint64_t v52 = OUTLINED_FUNCTION_5_0();
      sub_25DDFDA98(v67, (void (*)(void))type metadata accessor for ConfirmationView);
      char v58 = (void (*)(void))MEMORY[0x263F758E8];
      goto LABEL_9;
    case 4u:
      uint64_t v59 = v50;
      uint64_t v56 = v68;
      sub_25DDFD990(v59, v68, MEMORY[0x263F758B0]);
      OUTLINED_FUNCTION_6_0();
      sub_25DDFD9F0(v68, v60, MEMORY[0x263F758B0]);
      _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
      sub_25DDFDA50(&qword_26A6CA8D8, (void (*)(uint64_t))type metadata accessor for StandardButtonView);
      uint64_t v52 = OUTLINED_FUNCTION_5_0();
      sub_25DDFDA98(v69, (void (*)(void))type metadata accessor for StandardButtonView);
      char v58 = (void (*)(void))MEMORY[0x263F758B0];
      goto LABEL_9;
    case 5u:
      uint64_t v61 = v50;
      uint64_t v56 = v70;
      sub_25DDFD990(v61, v70, MEMORY[0x263F758C0]);
      sub_25DDFD9F0(v70, v71, MEMORY[0x263F758C0]);
      sub_25DDFDA50(&qword_26A6CA8D0, (void (*)(uint64_t))type metadata accessor for FilteredListView);
      uint64_t v52 = sub_25DDFDF60();
      sub_25DDFDA98(v71, (void (*)(void))type metadata accessor for FilteredListView);
      char v58 = (void (*)(void))MEMORY[0x263F758C0];
      goto LABEL_9;
    case 6u:
      uint64_t v62 = v50;
      uint64_t v56 = v72;
      sub_25DDFD990(v62, v72, MEMORY[0x263F75890]);
      OUTLINED_FUNCTION_6_0();
      sub_25DDFD9F0(v72, v63, MEMORY[0x263F75890]);
      _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
      sub_25DDFDA50(&qword_26A6CA8C8, (void (*)(uint64_t))type metadata accessor for PersonVideoFactListView);
      uint64_t v52 = OUTLINED_FUNCTION_5_0();
      sub_25DDFDA98(v73, (void (*)(void))type metadata accessor for PersonVideoFactListView);
      char v58 = (void (*)(void))MEMORY[0x263F75890];
LABEL_9:
      uint64_t v53 = v58;
      uint64_t v54 = v56;
      break;
    default:
      sub_25DDFD990(v50, v46, MEMORY[0x263F758B8]);
      OUTLINED_FUNCTION_6_0();
      sub_25DDFD9F0(v46, v51, MEMORY[0x263F758B8]);
      _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
      sub_25DDFDA50((unint64_t *)&qword_26A6CA8C0, (void (*)(uint64_t))type metadata accessor for ResultsList);
      uint64_t v52 = OUTLINED_FUNCTION_5_0();
      sub_25DDFDA98(v41, (void (*)(void))type metadata accessor for ResultsList);
      uint64_t v53 = (void (*)(void))MEMORY[0x263F758B8];
      uint64_t v54 = v46;
      break;
  }
  sub_25DDFDA98(v54, v53);
  return v52;
}

uint64_t sub_25DDFD990(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25DDFD9F0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DDFDA50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDFDA98(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

ValueMetadata *type metadata accessor for SnippetProvider()
{
  return &type metadata for SnippetProvider;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_25DDFDF60();
}

uint64_t sub_25DDFDB50()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25DDFDB60()
{
  return MEMORY[0x270F73B98]();
}

uint64_t sub_25DDFDB70()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_25DDFDB80()
{
  return MEMORY[0x270F73CA0]();
}

uint64_t sub_25DDFDB90()
{
  return MEMORY[0x270F73D18]();
}

uint64_t sub_25DDFDBA0()
{
  return MEMORY[0x270F73E48]();
}

uint64_t sub_25DDFDBB0()
{
  return MEMORY[0x270F73F20]();
}

uint64_t sub_25DDFDBC0()
{
  return MEMORY[0x270F74128]();
}

uint64_t sub_25DDFDBD0()
{
  return MEMORY[0x270F75450]();
}

uint64_t sub_25DDFDBE0()
{
  return MEMORY[0x270F75640]();
}

uint64_t sub_25DDFDBF0()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_25DDFDC00()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_25DDFDC10()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25DDFDC20()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_25DDFDC30()
{
  return MEMORY[0x270F75778]();
}

uint64_t sub_25DDFDC40()
{
  return MEMORY[0x270F72CC0]();
}

uint64_t sub_25DDFDC50()
{
  return MEMORY[0x270F72CC8]();
}

uint64_t sub_25DDFDC60()
{
  return MEMORY[0x270F72CD0]();
}

uint64_t sub_25DDFDC70()
{
  return MEMORY[0x270F72CD8]();
}

uint64_t sub_25DDFDC80()
{
  return MEMORY[0x270F72CE0]();
}

uint64_t sub_25DDFDC90()
{
  return MEMORY[0x270F72CE8]();
}

uint64_t sub_25DDFDCA0()
{
  return MEMORY[0x270F72CF0]();
}

uint64_t sub_25DDFDCB0()
{
  return MEMORY[0x270F72CF8]();
}

uint64_t sub_25DDFDCC0()
{
  return MEMORY[0x270F72D00]();
}

uint64_t sub_25DDFDCD0()
{
  return MEMORY[0x270F72D08]();
}

uint64_t sub_25DDFDCE0()
{
  return MEMORY[0x270F72D10]();
}

uint64_t sub_25DDFDCF0()
{
  return MEMORY[0x270F72D18]();
}

uint64_t sub_25DDFDD00()
{
  return MEMORY[0x270F72D20]();
}

uint64_t sub_25DDFDD10()
{
  return MEMORY[0x270F72D28]();
}

uint64_t sub_25DDFDD20()
{
  return MEMORY[0x270F72D30]();
}

uint64_t sub_25DDFDD30()
{
  return MEMORY[0x270F72D38]();
}

uint64_t sub_25DDFDD40()
{
  return MEMORY[0x270F72D40]();
}

uint64_t sub_25DDFDD50()
{
  return MEMORY[0x270F72D48]();
}

uint64_t sub_25DDFDD60()
{
  return MEMORY[0x270F72D50]();
}

uint64_t sub_25DDFDD70()
{
  return MEMORY[0x270F72D58]();
}

uint64_t sub_25DDFDD80()
{
  return MEMORY[0x270F72D60]();
}

uint64_t sub_25DDFDD90()
{
  return MEMORY[0x270F72D68]();
}

uint64_t sub_25DDFDDA0()
{
  return MEMORY[0x270F72D70]();
}

uint64_t sub_25DDFDDB0()
{
  return MEMORY[0x270F72D78]();
}

uint64_t sub_25DDFDDC0()
{
  return MEMORY[0x270F72D80]();
}

uint64_t sub_25DDFDDD0()
{
  return MEMORY[0x270F72D88]();
}

uint64_t sub_25DDFDDE0()
{
  return MEMORY[0x270F72D90]();
}

uint64_t sub_25DDFDDF0()
{
  return MEMORY[0x270F72D98]();
}

uint64_t sub_25DDFDE00()
{
  return MEMORY[0x270F72DA0]();
}

uint64_t sub_25DDFDE10()
{
  return MEMORY[0x270F72DA8]();
}

uint64_t sub_25DDFDE20()
{
  return MEMORY[0x270F72DB0]();
}

uint64_t sub_25DDFDE30()
{
  return MEMORY[0x270F72DB8]();
}

uint64_t sub_25DDFDE40()
{
  return MEMORY[0x270F72DC0]();
}

uint64_t sub_25DDFDE50()
{
  return MEMORY[0x270F72DC8]();
}

uint64_t sub_25DDFDE60()
{
  return MEMORY[0x270F72DD0]();
}

uint64_t sub_25DDFDE70()
{
  return MEMORY[0x270F72DD8]();
}

uint64_t sub_25DDFDE80()
{
  return MEMORY[0x270F72DE0]();
}

uint64_t sub_25DDFDE90()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25DDFDEA0()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_25DDFDEB0()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_25DDFDEC0()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25DDFDED0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25DDFDEE0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25DDFDEF0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25DDFDF00()
{
  return MEMORY[0x270F75928]();
}

uint64_t sub_25DDFDF10()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25DDFDF20()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25DDFDF30()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25DDFDF40()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25DDFDF50()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25DDFDF60()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25DDFDF70()
{
  return MEMORY[0x270F75970]();
}

uint64_t sub_25DDFDF80()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_25DDFDF90()
{
  return MEMORY[0x270F759C0]();
}

uint64_t sub_25DDFDFA0()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_25DDFDFB0()
{
  return MEMORY[0x270F75A10]();
}

uint64_t sub_25DDFDFC0()
{
  return MEMORY[0x270F75A28]();
}

uint64_t sub_25DDFDFD0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25DDFDFE0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25DDFDFF0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_25DDFE000()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25DDFE010()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_25DDFE020()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_25DDFE030()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25DDFE040()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25DDFE050()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_25DDFE060()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25DDFE070()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25DDFE080()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25DDFE090()
{
  return MEMORY[0x270F75AD0]();
}

uint64_t sub_25DDFE0A0()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_25DDFE0B0()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_25DDFE0C0()
{
  return MEMORY[0x270F75B48]();
}

uint64_t sub_25DDFE0D0()
{
  return MEMORY[0x270F75B70]();
}

uint64_t sub_25DDFE0E0()
{
  return MEMORY[0x270F75B78]();
}

uint64_t sub_25DDFE0F0()
{
  return MEMORY[0x270F75B90]();
}

uint64_t _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF95LL9SnippetUI06ActionG0Vvpfi_0()
{
  return MEMORY[0x270F75BA8]();
}

uint64_t sub_25DDFE110()
{
  return MEMORY[0x270F75BB8]();
}

uint64_t sub_25DDFE120()
{
  return MEMORY[0x270F75BF8]();
}

uint64_t sub_25DDFE130()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25DDFE140()
{
  return MEMORY[0x270F75C40]();
}

uint64_t sub_25DDFE150()
{
  return MEMORY[0x270F75C50]();
}

uint64_t sub_25DDFE160()
{
  return MEMORY[0x270F75C68]();
}

uint64_t sub_25DDFE170()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_25DDFE180()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_25DDFE190()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_25DDFE1A0()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_25DDFE1B0()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_25DDFE1C0()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_25DDFE1D0()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_25DDFE1E0()
{
  return MEMORY[0x270F75EF0]();
}

uint64_t sub_25DDFE1F0()
{
  return MEMORY[0x270F75F00]();
}

uint64_t sub_25DDFE200()
{
  return MEMORY[0x270F75FC8]();
}

uint64_t sub_25DDFE210()
{
  return MEMORY[0x270F75FE0]();
}

uint64_t sub_25DDFE220()
{
  return MEMORY[0x270F76050]();
}

uint64_t sub_25DDFE230()
{
  return MEMORY[0x270F76060]();
}

uint64_t sub_25DDFE240()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25DDFE250()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25DDFE260()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DDFE270()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DDFE290()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25DDFE2A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25DDFE2B0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25DDFE2C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25DDFE2D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t _UIImageIdentityName()
{
  return MEMORY[0x270F82FA0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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