SiriAutoCompleteAPI::AutoCompletePhraseSource_optional __swiftcall AutoCompletePhraseSource.init(rawValue:)(Swift::Int64 rawValue)
{
  char *v1;
  char v2;

  v2 = rawValue - 1;
  if ((unint64_t)(rawValue - 1) >= 8) {
    v2 = 8;
  }
  *v1 = v2;
  return (SiriAutoCompleteAPI::AutoCompletePhraseSource_optional)rawValue;
}

uint64_t AutoCompletePhraseSource.rawValue.getter()
{
  return *v0 + 1;
}

BOOL sub_25C5FBE34(char *a1, char *a2)
{
  return sub_25C5FBE40(*a1, *a2);
}

BOOL sub_25C5FBE40(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25C5FBE50(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x657361726870;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x657361726870;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6449656C646E7562;
      break;
    case 2:
      unint64_t v3 = 0x800000025C6202F0;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v5 = 0x656372756F73;
      break;
    case 4:
      unint64_t v5 = 0x6E65644964697575;
      unint64_t v3 = 0xEE00726569666974;
      break;
    case 5:
      unint64_t v5 = 0x72656E6547776B7ALL;
      unint64_t v3 = 0xEF64496E6F697461;
      break;
    case 6:
      unint64_t v5 = 0x7A696C616D726F6ELL;
      unint64_t v3 = 0xEF65726F63536465;
      break;
    case 7:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x746E756F43706174;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v2 = 0x6449656C646E7562;
      break;
    case 2:
      unint64_t v6 = 0x800000025C6202F0;
      unint64_t v2 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v2 = 0x656372756F73;
      break;
    case 4:
      unint64_t v2 = 0x6E65644964697575;
      unint64_t v6 = 0xEE00726569666974;
      break;
    case 5:
      unint64_t v2 = 0x72656E6547776B7ALL;
      unint64_t v6 = 0xEF64496E6F697461;
      break;
    case 6:
      unint64_t v2 = 0x7A696C616D726F6ELL;
      unint64_t v6 = 0xEF65726F63536465;
      break;
    case 7:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v2 = 0x746E756F43706174;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25C61EFB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25C5FC0DC()
{
  return sub_25C5FC0E4();
}

uint64_t sub_25C5FC0E4()
{
  return sub_25C61F080();
}

uint64_t sub_25C5FC130()
{
  return sub_25C61F080();
}

uint64_t sub_25C5FC178()
{
  return sub_25C5FC2D4();
}

uint64_t sub_25C5FC180()
{
  sub_25C61E9F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5FC2D4()
{
  return sub_25C61F070();
}

uint64_t sub_25C5FC300()
{
  return sub_25C5FC308();
}

uint64_t sub_25C5FC308()
{
  return sub_25C61F080();
}

uint64_t sub_25C5FC350()
{
  return sub_25C61F080();
}

SiriAutoCompleteAPI::AutoCompletePhraseSource_optional sub_25C5FC394(Swift::Int64 *a1)
{
  return AutoCompletePhraseSource.init(rawValue:)(*a1);
}

uint64_t sub_25C5FC39C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AutoCompletePhraseSource.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25C5FC3C4()
{
  return sub_25C61EB10();
}

uint64_t sub_25C5FC424()
{
  return sub_25C61EB00();
}

SiriAutoCompleteAPI::AutoCompleteTableColumnNames_optional __swiftcall AutoCompleteTableColumnNames.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_25C61EEC0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 8;
  if (v3 < 8) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t AutoCompleteTableColumnNames.rawValue.getter()
{
  unint64_t result = 0x657361726870;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6449656C646E7562;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x656372756F73;
      break;
    case 4:
      unint64_t result = 0x6E65644964697575;
      break;
    case 5:
      unint64_t result = 0x72656E6547776B7ALL;
      break;
    case 6:
      unint64_t result = 0x7A696C616D726F6ELL;
      break;
    case 7:
      unint64_t result = 0x746E756F43706174;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C5FC5EC(unsigned __int8 *a1, char *a2)
{
  return sub_25C5FBE50(*a1, *a2);
}

uint64_t sub_25C5FC5F8()
{
  return sub_25C5FC130();
}

uint64_t sub_25C5FC600()
{
  return sub_25C5FC180();
}

uint64_t sub_25C5FC608()
{
  return sub_25C5FC350();
}

SiriAutoCompleteAPI::AutoCompleteTableColumnNames_optional sub_25C5FC610(Swift::String *a1)
{
  return AutoCompleteTableColumnNames.init(rawValue:)(*a1);
}

unint64_t sub_25C5FC61C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AutoCompleteTableColumnNames.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C5FC644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5FC688();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C5FC670(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C5FC7A4(a1, a2, a3, a4, sub_25C5FC6C8);
}

uint64_t sub_25C5FC688()
{
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_25C5FC6C8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C5FC71C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C5FC760@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5FC7EC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C5FC78C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C5FC7A4(a1, a2, a3, a4, sub_25C5FC82C);
}

uint64_t sub_25C5FC7A4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_25C5FC7EC()
{
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_25C5FC82C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C5FC880())()
{
  return j__swift_endAccess;
}

uint64_t AutoCompletePhrase.bundleId.getter()
{
  return OUTLINED_FUNCTION_7();
}

uint64_t AutoCompletePhrase.iconInfo.getter()
{
  return sub_25C5FC980((uint64_t)&OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, MEMORY[0x263F74CA0]);
}

uint64_t AutoCompletePhrase.actionIdentifier.getter()
{
  return OUTLINED_FUNCTION_7();
}

void AutoCompletePhrase.source.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
}

uint64_t AutoCompletePhrase.uuidIdentifier.getter()
{
  return sub_25C5FC980((uint64_t)&OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier, MEMORY[0x263F07508]);
}

uint64_t sub_25C5FC980(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = OUTLINED_FUNCTION_7();
  return v3(v2);
}

uint64_t sub_25C5FC9E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5FCA54();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C5FCA14(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_25C5FCAA4(v1, v2);
}

uint64_t sub_25C5FCA54()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_2();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25C5FCAA4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_5();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C5FCAF0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C5FCB3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25C5FCBA4();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25C5FCB70(uint64_t a1)
{
  return sub_25C5FCBE8(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_25C5FCBA4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  OUTLINED_FUNCTION_2();
  return *(void *)v1;
}

uint64_t sub_25C5FCBE8(uint64_t a1, char a2)
{
  uint64_t result = OUTLINED_FUNCTION_5();
  *(void *)uint64_t v2 = a1;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_25C5FCC34())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C5FCC80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5FCCD4();
  *a1 = result;
  return result;
}

uint64_t sub_25C5FCCAC(uint64_t *a1)
{
  return sub_25C5FCD14(*a1);
}

uint64_t sub_25C5FCCD4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount;
  OUTLINED_FUNCTION_2();
  return *(void *)v1;
}

uint64_t sub_25C5FCD14(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_5();
  void *v1 = a1;
  return result;
}

uint64_t (*sub_25C5FCD4C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C5FCD98@<X0>(uint64_t a1@<X8>)
{
  return sub_25C5FCE54(a1);
}

uint64_t sub_25C5FCDBC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  MEMORY[0x270FA5388]();
  sub_25C5FDB20(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26B351500);
  return sub_25C5FCEEC();
}

uint64_t sub_25C5FCE54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  OUTLINED_FUNCTION_2();
  return sub_25C5FDB20(v3, a1, &qword_26B351500);
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

uint64_t sub_25C5FCEEC()
{
  swift_beginAccess();
  uint64_t v0 = OUTLINED_FUNCTION_7();
  sub_25C5FCF44(v0, v1);
  return swift_endAccess();
}

uint64_t sub_25C5FCF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_25C5FCFAC())()
{
  return j_j__swift_endAccess;
}

void *sub_25C5FCFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, char *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  v17 = v16;
  uint64_t v86 = a7;
  uint64_t v87 = a8;
  unint64_t v81 = a6;
  uint64_t v82 = a1;
  uint64_t v84 = a3;
  uint64_t v85 = a4;
  uint64_t v83 = a2;
  int v80 = a16;
  uint64_t v78 = a14;
  uint64_t v79 = a15;
  uint64_t v77 = a13;
  uint64_t v88 = a11;
  uint64_t v89 = a12;
  uint64_t v90 = a10;
  uint64_t v91 = a5;
  uint64_t v74 = sub_25C61E920();
  uint64_t v73 = *(void *)(v74 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v72 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351528);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25C61E970();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v75 = (uint64_t *)((char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v23);
  v76 = (char *)&v71 - v25;
  uint64_t v26 = sub_25C61E770();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  v29 = (char *)&v71 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v30 = *a9;
  v31 = (void *)((char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  void *v31 = 0;
  v31[1] = 0;
  v32 = (char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  *(void *)v32 = 0;
  v32[8] = 1;
  v33 = (char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  uint64_t v34 = sub_25C61E730();
  uint64_t v35 = (uint64_t)v33;
  unint64_t v36 = v81;
  __swift_storeEnumTagSinglePayload(v35, 1, 1, v34);
  uint64_t v37 = v83;
  v17[2] = v82;
  v17[3] = v37;
  uint64_t v38 = v85;
  uint64_t v39 = v86;
  v17[4] = v84;
  v17[5] = v38;
  v17[6] = v91;
  v17[7] = v36;
  v40 = (void *)((char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
  uint64_t v41 = v87;
  void *v40 = v39;
  v40[1] = v41;
  swift_bridgeObjectRetain();
  sub_25C61E760();
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))((uint64_t)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier, v29, v26);
  uint64_t v42 = v90;
  *((unsigned char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) = v30;
  swift_beginAccess();
  uint64_t v43 = v89;
  void *v31 = v88;
  v31[1] = v43;
  uint64_t v44 = v21;
  swift_bridgeObjectRelease();
  sub_25C5FDB20(v42, (uint64_t)v20, &qword_26B351528);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) != 1)
  {
    sub_25C5FDB78(v42, &qword_26B351528);
    swift_bridgeObjectRelease();
    v53 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v54 = v76;
    v53(v76, v20, v21);
    v53((char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, v54, v21);
LABEL_10:
    char v47 = v80;
    uint64_t v49 = v78;
    uint64_t v48 = v79;
    uint64_t v50 = v77;
    unint64_t v51 = 0x26B351000;
    unint64_t v52 = 0x26B351000;
    goto LABEL_15;
  }
  uint64_t v45 = v22;
  sub_25C5FDB78((uint64_t)v20, &qword_26B351528);
  uint64_t v46 = HIBYTE(v36) & 0xF;
  if ((v36 & 0x2000000000000000) == 0) {
    uint64_t v46 = v91 & 0xFFFFFFFFFFFFLL;
  }
  if (!v46)
  {
    swift_bridgeObjectRelease();
    uint64_t v55 = v73;
    v56 = v72;
    uint64_t v57 = v74;
    (*(void (**)(char *, void, uint64_t))(v73 + 104))(v72, *MEMORY[0x263F74C30], v74);
    uint64_t v58 = sub_25C61E910();
    uint64_t v60 = v59;
    sub_25C5FDB78(v42, &qword_26B351528);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
    v61 = v75;
    uint64_t *v75 = v58;
    v61[1] = v60;
    (*(void (**)(uint64_t *, void, uint64_t))(v45 + 104))(v61, *MEMORY[0x263F74C98], v44);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v45 + 32))((uint64_t)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, v61, v44);
    goto LABEL_10;
  }
  if (v91 == 0xD000000000000017 && v36 == 0x800000025C6203B0)
  {
    swift_bridgeObjectRelease();
    char v47 = v80;
    uint64_t v49 = v78;
    uint64_t v48 = v79;
    uint64_t v50 = v77;
    unint64_t v51 = 0x26B351000;
    unint64_t v52 = 0x26B351000;
  }
  else
  {
    char v62 = sub_25C61EFB0();
    unint64_t v63 = v36;
    char v47 = v80;
    uint64_t v49 = v78;
    uint64_t v48 = v79;
    uint64_t v50 = v77;
    unint64_t v51 = 0x26B351000uLL;
    unint64_t v52 = 0x26B351000uLL;
    if ((v62 & 1) == 0)
    {
      sub_25C5FDB78(v90, &qword_26B351528);
      v67 = (void *)((char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo);
      void *v67 = v91;
      v67[1] = v63;
      (*(void (**)(void))(v45 + 104))();
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB588);
  v65 = v75;
  uint64_t v91 = (uint64_t)v75 + *(int *)(v64 + 48);
  sub_25C5FDB78(v90, &qword_26B351528);
  uint64_t *v65 = 0x69662E656E6F6870;
  v65[1] = 0xEA00000000006C6CLL;
  uint64_t v66 = sub_25C61E960();
  __swift_storeEnumTagSinglePayload(v91, 1, 1, v66);
  (*(void (**)(uint64_t *, void, uint64_t))(v45 + 104))(v65, *MEMORY[0x263F74C90], v44);
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v45 + 32))((uint64_t)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, v65, v44);
LABEL_15:
  *(void *)((char *)v17 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount) = v50;
  uint64_t v68 = (uint64_t)v17 + *(void *)(v52 + 3176);
  swift_beginAccess();
  sub_25C5FCF44(v49, v68);
  swift_endAccess();
  v69 = (char *)v17 + *(void *)(v51 + 3152);
  swift_beginAccess();
  *(void *)v69 = v48;
  v69[8] = v47 & 1;
  return v17;
}

void *AutoCompletePhrase.__allocating_init(phrase:bundleId:actionIdentifier:source:iconInfo:zkwGenerationId:tapCount:recentTapTimeStamp:normalizedScore:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v31 = a3;
  unint64_t v32 = a4;
  long long v30 = a9;
  uint64_t v28 = a12;
  uint64_t v29 = a10;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  uint64_t v17 = OUTLINED_FUNCTION_23(v16);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351528);
  uint64_t v21 = OUTLINED_FUNCTION_23(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_19();
  char v22 = *a7;
  type metadata accessor for AutoCompletePhrase();
  uint64_t v23 = sub_25C5FD920();
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  char v35 = v22;
  sub_25C5FDB20(a8, v13, &qword_26B351528);
  sub_25C5FDB20(a11, (uint64_t)v19, &qword_26B351500);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_25C5FCFF8(v23, v25, v23, v25, v31, v32, v33, v34, &v35, v13, v30, *((uint64_t *)&v30 + 1), v29, (uint64_t)v19, v28, a13 & 1);
  sub_25C5FDB78(a11, &qword_26B351500);
  sub_25C5FDB78(a8, &qword_26B351528);
  return v26;
}

uint64_t type metadata accessor for AutoCompletePhrase()
{
  uint64_t result = qword_26B351760;
  if (!qword_26B351760) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5FD920()
{
  uint64_t v0 = sub_25C61E600();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v8 = (char *)v21 - v7;
  sub_25C600AEC(&qword_26B3514F0, MEMORY[0x263F06278]);
  sub_25C61EC90();
  int v22 = 46;
  sub_25C61EC80();
  v9 = (void *)sub_25C61EA10();
  sub_25C61E5F0();
  v10 = (void *)sub_25C61E5E0();
  v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v6, v0);
  id v12 = objc_msgSend(v9, sel_stringByTrimmingCharactersInSet_, v10);

  uint64_t v13 = sub_25C61EA20();
  uint64_t v15 = v14;

  v21[1] = v13;
  v21[2] = v15;
  sub_25C5FDE14();
  uint64_t v16 = sub_25C61EC70();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_25C5FE2F0(v16, v18);
  swift_bridgeObjectRelease();
  v11(v8, v0);
  return v19;
}

uint64_t sub_25C5FDB20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4();
  uint64_t v4 = OUTLINED_FUNCTION_7();
  v5(v4);
  return a2;
}

uint64_t sub_25C5FDB78(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_15();
  v4(v3);
  return a1;
}

uint64_t sub_25C5FDBC4()
{
  return 0x203A657361726850;
}

uint64_t sub_25C5FDCBC()
{
  uint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_25C61EA90();
  swift_bridgeObjectRetain();
  sub_25C61EA90();
  swift_bridgeObjectRelease();
  return v2;
}

double sub_25C5FDD44()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  OUTLINED_FUNCTION_2();
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t sub_25C5FDD94()
{
  OUTLINED_FUNCTION_2();
  sub_25C61EA30();
  sub_25C5FDE14();
  uint64_t v0 = sub_25C61EC50();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_25C5FDE14()
{
  unint64_t result = qword_26B351560;
  if (!qword_26B351560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351560);
  }
  return result;
}

uint64_t sub_25C5FDE60()
{
  sub_25C61E670();
  swift_allocObject();
  sub_25C61E660();
  sub_25C61E640();
  type metadata accessor for AutoCompletePhrase();
  sub_25C600AEC(&qword_26B351558, (void (*)(uint64_t))type metadata accessor for AutoCompletePhrase);
  uint64_t v0 = sub_25C61E650();
  swift_release();
  return v0;
}

uint64_t sub_25C5FE0B0()
{
  sub_25C61E630();
  swift_allocObject();
  sub_25C61E620();
  type metadata accessor for AutoCompletePhrase();
  sub_25C600AEC(&qword_26A5BB580, (void (*)(uint64_t))type metadata accessor for AutoCompletePhrase);
  sub_25C61E610();
  swift_release();
  return v1;
}

uint64_t sub_25C5FE2F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C605550((uint64_t)&unk_2709C5318);
  swift_bridgeObjectRetain();
  sub_25C5FE374(a1, a2, v4);
  return sub_25C61EAE0();
}

uint64_t sub_25C5FE374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_25C61EAA0();
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    do
    {
      sub_25C6011BC(v6, v7, a3);
      if ((v8 & 1) == 0) {
        MEMORY[0x26118BFB0](v6, v7);
      }
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_25C61EAA0();
      uint64_t v7 = v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static AutoCompletePhrase.== infix(_:_:)(void *a1, void *a2)
{
  OUTLINED_FUNCTION_2();
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  OUTLINED_FUNCTION_2();
  if (v4 != a2[2] || v5 != a2[3])
  {
    sub_25C61EFB0();
    uint64_t result = OUTLINED_FUNCTION_24();
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  if (a1[6] != a2[6] || a1[7] != a2[7])
  {
    sub_25C61EFB0();
    uint64_t result = OUTLINED_FUNCTION_24();
    if ((v10 & 1) == 0) {
      return result;
    }
  }
  if (*(void *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier) != *(void *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier)
    || *(void *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8) != *(void *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8))
  {
    sub_25C61EFB0();
    uint64_t result = OUTLINED_FUNCTION_24();
    if ((v12 & 1) == 0) {
      return result;
    }
  }
  if (*((unsigned __int8 *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) != *((unsigned __int8 *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source)
    || (sub_25C61E750() & 1) == 0)
  {
    return 0;
  }
  uint64_t v13 = (void *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = (void *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_2();
  uint64_t v17 = v16[1];
  if (!v15)
  {
    if (!v17)
    {
LABEL_29:
      uint64_t v20 = (double *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore);
      OUTLINED_FUNCTION_2();
      double v21 = *v20;
      LOBYTE(v20) = *((unsigned char *)v20 + 8);
      int v22 = (double *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore);
      OUTLINED_FUNCTION_2();
      uint64_t result = *((unsigned __int8 *)v22 + 8);
      if ((v20 & 1) == 0) {
        return (v21 == *v22) & ~result;
      }
      return result;
    }
    return 0;
  }
  if (!v17) {
    return 0;
  }
  if (v14 == *v16 && v15 == v17) {
    goto LABEL_29;
  }
  sub_25C61EFB0();
  uint64_t result = OUTLINED_FUNCTION_24();
  if (v19) {
    goto LABEL_29;
  }
  return result;
}

uint64_t sub_25C5FE620()
{
  return sub_25C61F060();
}

uint64_t sub_25C5FE64C()
{
  return sub_25C61F060();
}

uint64_t sub_25C5FE674(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x657361726870 && a2 == 0xE600000000000000;
  if (v2 || (sub_25C61EFB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C620370 || (sub_25C61EFB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_25C61EFB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6F666E496E6F6369 && a2 == 0xE800000000000000;
      if (v7 || (sub_25C61EFB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000025C6202F0 || (sub_25C61EFB0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
        if (v8 || (sub_25C61EFB0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x6E65644964697575 && a2 == 0xEE00726569666974;
          if (v9 || (sub_25C61EFB0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x72656E6547776B7ALL && a2 == 0xEF64496E6F697461;
            if (v10 || (sub_25C61EFB0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 0x7A696C616D726F6ELL && a2 == 0xEF65726F63536465;
              if (v11 || (sub_25C61EFB0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                BOOL v12 = a1 == 0x746E756F43706174 && a2 == 0xE800000000000000;
                if (v12 || (sub_25C61EFB0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0xD000000000000012 && a2 == 0x800000025C620390)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  char v13 = sub_25C61EFB0();
                  swift_bridgeObjectRelease();
                  if (v13) {
                    return 10;
                  }
                  else {
                    return 11;
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

uint64_t sub_25C5FEB10()
{
  return 11;
}

uint64_t sub_25C5FEB18()
{
  return sub_25C61F080();
}

uint64_t sub_25C5FEB60()
{
  return 0;
}

unint64_t sub_25C5FEB6C(char a1)
{
  unint64_t result = 0x657361726870;
  switch(a1)
  {
    case 1:
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6449656C646E7562;
      break;
    case 3:
      unint64_t result = 0x6F666E496E6F6369;
      break;
    case 5:
      unint64_t result = 0x656372756F73;
      break;
    case 6:
      unint64_t result = 0x6E65644964697575;
      break;
    case 7:
      unint64_t result = 0x72656E6547776B7ALL;
      break;
    case 8:
      unint64_t result = 0x7A696C616D726F6ELL;
      break;
    case 9:
      unint64_t result = 0x746E756F43706174;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C5FECDC()
{
  return sub_25C5FEB18();
}

uint64_t sub_25C5FECE4()
{
  return sub_25C5FE64C();
}

uint64_t sub_25C5FECEC()
{
  return sub_25C61F080();
}

unint64_t sub_25C5FED30()
{
  return sub_25C5FEB6C(*v0);
}

uint64_t sub_25C5FED38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5FE674(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5FED60()
{
  return sub_25C5FEB60();
}

uint64_t sub_25C5FED80@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5FEB10();
  *a1 = result;
  return result;
}

uint64_t sub_25C5FEDA8(uint64_t a1)
{
  unint64_t v2 = sub_25C5FF3FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5FEDE4(uint64_t a1)
{
  unint64_t v2 = sub_25C5FF3FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AutoCompletePhrase.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C61E970();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = OUTLINED_FUNCTION_15();
  v2(v1);
  swift_bridgeObjectRelease();
  sub_25C61E770();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = OUTLINED_FUNCTION_15();
  v4(v3);
  swift_bridgeObjectRelease();
  sub_25C5FDB78(v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp, &qword_26B351500);
  return v0;
}

uint64_t AutoCompletePhrase.__deallocating_deinit()
{
  AutoCompletePhrase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C5FEF58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  uint64_t v6 = OUTLINED_FUNCTION_23(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351578);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5FF3FC();
  sub_25C61F0A0();
  swift_beginAccess();
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  v25[0] = 0;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11(v8, v9, (uint64_t)v25);
  if (v8) {
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v10 = v3[4];
  uint64_t v11 = v3[5];
  v24[0] = 1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11(v10, v11, (uint64_t)v24);
  if (v10) {
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = v3[6];
  uint64_t v16 = v3[7];
  v24[0] = 2;
  OUTLINED_FUNCTION_11(v15, v16, (uint64_t)v24);
  v24[0] = 3;
  sub_25C61E970();
  sub_25C600AEC(&qword_26B351520, MEMORY[0x263F74CA0]);
  OUTLINED_FUNCTION_8();
  uint64_t v17 = *(void *)((char *)v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
  uint64_t v18 = *(void *)((char *)v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8);
  v24[0] = 4;
  OUTLINED_FUNCTION_11(v17, v18, (uint64_t)v24);
  v24[0] = *((unsigned char *)v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
  sub_25C5FF448();
  sub_25C61EF80();
  v24[0] = 6;
  sub_25C61E770();
  sub_25C600AEC(&qword_26B351508, MEMORY[0x263F07508]);
  OUTLINED_FUNCTION_8();
  double v21 = (void *)((char *)v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_6();
  uint64_t v22 = *v21;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22();
  sub_25C61EF30();
  if (v22)
  {
LABEL_3:
    uint64_t v12 = OUTLINED_FUNCTION_17();
    v13(v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_22();
    sub_25C61EF40();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_22();
    sub_25C61EF70();
    uint64_t v23 = (uint64_t)v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
    OUTLINED_FUNCTION_6();
    sub_25C5FDB20(v23, v2, &qword_26B351500);
    v25[63] = 10;
    sub_25C61E730();
    sub_25C600AEC(&qword_26B3514F8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_22();
    sub_25C61EF50();
    sub_25C5FDB78(v2, &qword_26B351500);
    uint64_t v19 = OUTLINED_FUNCTION_17();
    return v20(v19);
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

unint64_t sub_25C5FF3FC()
{
  unint64_t result = qword_26B351540;
  if (!qword_26B351540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351540);
  }
  return result;
}

unint64_t sub_25C5FF448()
{
  unint64_t result = qword_26B351530;
  if (!qword_26B351530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351530);
  }
  return result;
}

uint64_t sub_25C5FF494()
{
  return sub_25C61F080();
}

uint64_t AutoCompletePhrase.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  AutoCompletePhrase.init(from:)(a1);
  return v2;
}

void *AutoCompletePhrase.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  uint64_t v4 = OUTLINED_FUNCTION_23(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10();
  uint64_t v32 = v5;
  uint64_t v34 = sub_25C61E770();
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  uint64_t v33 = v8;
  sub_25C61E970();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v10;
  uint64_t v36 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  uint64_t v38 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB538);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_18();
  char v13 = (void *)((char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  *char v13 = 0;
  v13[1] = 0;
  uint64_t v14 = (char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  uint64_t v41 = v1;
  uint64_t v15 = (uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  uint64_t v16 = sub_25C61E730();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5FF3FC();
  sub_25C61F090();
  if (v39)
  {
    uint64_t v31 = v1;
    swift_bridgeObjectRelease();
    sub_25C5FDB78((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp, &qword_26B351500);
    type metadata accessor for AutoCompletePhrase();
    swift_deallocPartialClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v40 = v13;
    v1[2] = sub_25C61EF00();
    v1[3] = v18;
    OUTLINED_FUNCTION_16(1);
    v1[4] = sub_25C61EF00();
    v1[5] = v19;
    OUTLINED_FUNCTION_16(2);
    v1[6] = sub_25C61EF00();
    v1[7] = v20;
    sub_25C600AEC(&qword_26A5BB540, MEMORY[0x263F74CA0]);
    sub_25C61EF20();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, v38, v36);
    OUTLINED_FUNCTION_16(4);
    uint64_t v21 = sub_25C61EF00();
    uint64_t v22 = (void *)((char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
    *uint64_t v22 = v21;
    v22[1] = v23;
    sub_25C5FFE70();
    sub_25C61EF20();
    *((unsigned char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) = 3;
    sub_25C600AEC(&qword_26A5BB550, MEMORY[0x263F07508]);
    sub_25C61EF20();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier, v33, v34);
    uint64_t v24 = sub_25C61EED0();
    uint64_t v26 = v25;
    swift_beginAccess();
    uint64_t *v40 = v24;
    v40[1] = v26;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_25C61EEE0();
    LOBYTE(v24) = v28;
    swift_beginAccess();
    *(void *)uint64_t v14 = v27;
    v14[8] = v24 & 1;
    *(void *)((char *)v41 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount) = sub_25C61EF10();
    sub_25C600AEC(&qword_26A5BB558, MEMORY[0x263F07490]);
    sub_25C61EEF0();
    uint64_t v29 = OUTLINED_FUNCTION_9();
    v30(v29);
    swift_beginAccess();
    sub_25C5FCF44(v32, v15);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v41;
  }
  return v31;
}

uint64_t sub_25C5FFD18()
{
  return sub_25C5FDBC4();
}

uint64_t sub_25C5FFD3C(void **a1, void **a2)
{
  return static AutoCompletePhrase.== infix(_:_:)(*a1, *a2) & 1;
}

uint64_t sub_25C5FFD60@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = AutoCompletePhrase.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C5FFD8C(void *a1)
{
  return sub_25C5FEF58(a1);
}

uint64_t sub_25C5FFDB0()
{
  return sub_25C5FF494();
}

uint64_t sub_25C5FFDD4()
{
  return sub_25C5FE620();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
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

unint64_t sub_25C5FFE70()
{
  unint64_t result = qword_26A5BB548;
  if (!qword_26A5BB548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB548);
  }
  return result;
}

unint64_t sub_25C5FFEC0()
{
  unint64_t result = qword_26A5BB560;
  if (!qword_26A5BB560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB560);
  }
  return result;
}

unint64_t sub_25C5FFF10()
{
  unint64_t result = qword_26A5BB568;
  if (!qword_26A5BB568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB568);
  }
  return result;
}

uint64_t sub_25C5FFF5C()
{
  return sub_25C600AEC(&qword_26A5BB570, (void (*)(uint64_t))type metadata accessor for AutoCompletePhrase);
}

uint64_t sub_25C5FFFA4()
{
  return sub_25C61F080();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_25C5FFFFC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C600008(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AutoCompletePhraseSource()
{
  return &type metadata for AutoCompletePhraseSource;
}

uint64_t _s19SiriAutoCompleteAPI24AutoCompletePhraseSourceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19SiriAutoCompleteAPI24AutoCompletePhraseSourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x25C600174);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoCompleteTableColumnNames()
{
  return &type metadata for AutoCompleteTableColumnNames;
}

uint64_t sub_25C6001AC()
{
  return type metadata accessor for AutoCompletePhrase();
}

void sub_25C6001B4()
{
  sub_25C61E970();
  if (v0 <= 0x3F)
  {
    sub_25C61E770();
    if (v1 <= 0x3F)
    {
      sub_25C600760();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for AutoCompletePhrase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutoCompletePhrase);
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 248))(a1, a2 & 1);
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AutoCompletePhrase.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AutoCompletePhrase.loggingIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AutoCompletePhrase.getNormalizedScore.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedPhraseTokens.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AutoCompletePhrase.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AutoCompletePhrase.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AutoCompletePhrase.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AutoCompletePhrase.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 384))();
}

void sub_25C600760()
{
  if (!qword_26B351758)
  {
    sub_25C61E730();
    unint64_t v0 = sub_25C61EC10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B351758);
    }
  }
}

uint64_t getEnumTagSinglePayload for AutoCompletePhrase.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AutoCompletePhrase.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x25C60090CLL);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoCompletePhrase.CodingKeys()
{
  return &type metadata for AutoCompletePhrase.CodingKeys;
}

unint64_t sub_25C600948()
{
  unint64_t result = qword_26A5BB578;
  if (!qword_26A5BB578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB578);
  }
  return result;
}

unint64_t sub_25C600998()
{
  unint64_t result = qword_26B351550;
  if (!qword_26B351550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351550);
  }
  return result;
}

unint64_t sub_25C6009E8()
{
  unint64_t result = qword_26B351548;
  if (!qword_26B351548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351548);
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

void sub_25C600A6C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_25C600A78()
{
  unint64_t result = qword_26B351538;
  if (!qword_26B351538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351538);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25C600AEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_25C61EF80();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return *(void *)(v0 - 184);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9F428](a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_12(float a1)
{
  float *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

void OUTLINED_FUNCTION_20()
{
  JUMPOUT(0x26118CA00);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return 0;
}

uint64_t sub_25C600D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = MEMORY[0x263F8EE88];
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22)
  {
    uint64_t v2 = *(void *)(a2 + 16);
    uint64_t v3 = a2 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      if (v2)
      {
        uint64_t v6 = v23 + 56;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v7 = 0;
        while (1)
        {
          uint64_t v8 = (uint64_t *)(v3 + 16 * v7);
          uint64_t v10 = *v8;
          uint64_t v9 = v8[1];
          swift_bridgeObjectRetain();
          if (sub_25C61EAC0())
          {
            if (!*(void *)(v23 + 16)) {
              goto LABEL_14;
            }
            uint64_t v11 = sub_25C61F040();
            uint64_t v12 = -1 << *(unsigned char *)(v23 + 32);
            unint64_t v13 = v11 & ~v12;
            if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
              goto LABEL_14;
            }
            uint64_t v14 = *(void *)(v23 + 48);
            if (*(void *)(v14 + 8 * v13) != v7) {
              break;
            }
          }
LABEL_12:
          ++v7;
          swift_bridgeObjectRelease();
          if (v7 == v2)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
        uint64_t v15 = ~v12;
        while (1)
        {
          unint64_t v13 = (v13 + 1) & v15;
          if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v13) == v7) {
            goto LABEL_12;
          }
        }
LABEL_14:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C602D20(0, *(void *)(v5 + 16) + 1, 1, v5);
          uint64_t v5 = v19;
        }
        unint64_t v17 = *(void *)(v5 + 16);
        unint64_t v16 = *(void *)(v5 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_25C602D20(v16 > 1, v17 + 1, 1, v5);
          uint64_t v5 = v20;
        }
        *(void *)(v5 + 16) = v17 + 1;
        uint64_t v18 = v5 + 16 * v17;
        *(void *)(v18 + 32) = v10;
        *(void *)(v18 + 40) = v9;
        sub_25C605968();
      }
LABEL_19:
      ++v4;
    }
    while (v4 != v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t destroy for AutoCompleteQueryMatch()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s19SiriAutoCompleteAPI22AutoCompleteQueryMatchVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AutoCompleteQueryMatch(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for AutoCompleteQueryMatch(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoCompleteQueryMatch(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for AutoCompleteQueryMatch(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AutoCompleteQueryMatch()
{
  return &type metadata for AutoCompleteQueryMatch;
}

void sub_25C6011BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    OUTLINED_FUNCTION_5_0();
    sub_25C61E9F0();
    sub_25C61F080();
    OUTLINED_FUNCTION_1_0();
    if (v4)
    {
      OUTLINED_FUNCTION_4_0();
      BOOL v6 = v6 && v5 == v3;
      if (!v6 && (OUTLINED_FUNCTION_3_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_0_0();
        if (v7)
        {
          do
          {
            OUTLINED_FUNCTION_4_0();
            if (v6 && v8 == v3) {
              break;
            }
            if (OUTLINED_FUNCTION_3_0()) {
              break;
            }
            OUTLINED_FUNCTION_0_0();
          }
          while ((v10 & 1) != 0);
        }
      }
    }
  }
}

void sub_25C601284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    OUTLINED_FUNCTION_5_0();
    sub_25C61E9F0();
    sub_25C61F080();
    OUTLINED_FUNCTION_1_0();
    if (v4)
    {
      OUTLINED_FUNCTION_4_0();
      BOOL v6 = v6 && v5 == v3;
      if (!v6 && (OUTLINED_FUNCTION_3_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_0_0();
        if (v7)
        {
          do
          {
            OUTLINED_FUNCTION_4_0();
            if (v6 && v8 == v3) {
              break;
            }
            if (OUTLINED_FUNCTION_3_0()) {
              break;
            }
            OUTLINED_FUNCTION_0_0();
          }
          while ((v10 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_25C60134C(uint64_t *a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_25C61F050();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[3];
  LODWORD(a1) = *((unsigned __int8 *)a1 + 32);
  swift_bridgeObjectRetain();
  sub_25C61E9F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v22 = v6;
  sub_25C61E9F0();
  swift_bridgeObjectRelease();
  int v21 = (int)a1;
  sub_25C61F070();
  uint64_t v8 = sub_25C61F080();
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = v8 & ~v9;
  uint64_t v11 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return 0;
  }
  uint64_t v12 = ~v9;
  uint64_t v13 = *(void *)(a2 + 48);
  while (1)
  {
    uint64_t v14 = v13 + 40 * v10;
    uint64_t v15 = *(void *)(v14 + 16);
    uint64_t v16 = *(void *)(v14 + 24);
    int v17 = *(unsigned __int8 *)(v14 + 32);
    BOOL v18 = *(void *)v14 == v4 && *(void *)(v14 + 8) == v5;
    if (v18 || (sub_25C61EFB0() & 1) != 0)
    {
      BOOL v19 = v15 == v22 && v16 == v7;
      if (v19 || (sub_25C61EFB0()) && v17 == v21) {
        break;
      }
    }
    unint64_t v10 = (v10 + 1) & v12;
    if (((*(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

void *sub_25C6014D4()
{
  return &unk_2709C5358;
}

uint64_t sub_25C6014E0(char a1)
{
  if (a1) {
    return 0xD000000000000013;
  }
  else {
    return 0x64726F57706F7473;
  }
}

uint64_t sub_25C601520()
{
  type metadata accessor for StopWordAndNonSignificantWordList();
  swift_allocObject();
  uint64_t result = sub_25C60155C();
  qword_26A5BC330 = result;
  return result;
}

uint64_t sub_25C60155C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB590);
  *(void *)(v0 + 16) = sub_25C61E9E0();
  *(void *)(v0 + 16) = sub_25C6015EC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C6015EC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(qword_26B351988);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v77 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25C61E6F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v90 = (char *)&v77 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB590);
  uint64_t v9 = (void *)sub_25C61E9E0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v12 = sub_25C60224C(0xD000000000000021, 0x800000025C61FAE0, 0x7473696C70, 0xE500000000000000, v11);

  unint64_t v13 = 0x26B351000uLL;
  if (!v12)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
    goto LABEL_7;
  }
  sub_25C61E6D0();

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v14(v2, v7, v3);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
LABEL_7:
    sub_25C6022E0((uint64_t)v2);
    if (qword_26B351C40 != -1) {
LABEL_50:
    }
      swift_once();
    uint64_t v30 = sub_25C61E9D0();
    __swift_project_value_buffer(v30, (uint64_t)qword_26B351C28);
    uint64_t v31 = sub_25C61E9B0();
    os_log_type_t v32 = sub_25C61EBE0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_25C5FA000, v31, v32, "StopWordAndNonSignificantWordList: unable to get path to the list of stop words and non significant words", v33, 2u);
      OUTLINED_FUNCTION_20();
    }

    return (uint64_t)v9;
  }
  uint64_t v87 = v9;
  v14(v90, v2, v3);
  sub_25C61E630();
  swift_allocObject();
  uint64_t v15 = sub_25C61E620();
  uint64_t v16 = sub_25C61E700();
  uint64_t v17 = MEMORY[0x263F8EE58];
  uint64_t v86 = v4;
  uint64_t v18 = v16;
  unint64_t v20 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB598);
  sub_25C602340();
  sub_25C61E610();
  uint64_t v78 = v18;
  unint64_t v79 = v20;
  uint64_t v80 = v15;
  int v35 = 0;
  unint64_t v36 = 0;
  uint64_t v37 = (uint64_t)v91;
  unint64_t v89 = 0x800000025C620420;
  *(void *)&long long v38 = 136315138;
  long long v83 = v38;
  uint64_t v81 = v3;
  uint64_t v82 = v17 + 8;
  uint64_t v9 = v87;
  uint64_t v85 = (uint64_t)v91;
  while (1)
  {
    int v39 = v35;
    if (v36 >= qword_2709C5390)
    {
      __break(1u);
      goto LABEL_50;
    }
    if (*((unsigned char *)&unk_2709C5380 + v36 + 32)) {
      uint64_t v40 = 0xD000000000000013;
    }
    else {
      uint64_t v40 = 0x64726F57706F7473;
    }
    if (*((unsigned char *)&unk_2709C5380 + v36 + 32)) {
      unint64_t v41 = v89;
    }
    else {
      unint64_t v41 = 0xE900000000000073;
    }
    if (!*(void *)(v37 + 16) || (unint64_t v42 = sub_25C6086DC(), (v43 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      if (*(void *)(v13 + 3136) != -1) {
        swift_once();
      }
      uint64_t v54 = sub_25C61E9D0();
      __swift_project_value_buffer(v54, (uint64_t)qword_26B351C28);
      uint64_t v55 = sub_25C61E9B0();
      os_log_type_t v56 = sub_25C61EBF0();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = swift_slowAlloc();
        uint64_t v91 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = v83;
        *(void *)(v57 + 4) = sub_25C618C00(v40, v41, (uint64_t *)&v91);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C5FA000, v55, v56, "StopWordAndNonSignificantWordList: Unable to find key in the plist: %s", (uint8_t *)v57, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_20();
        uint64_t v37 = v85;
        OUTLINED_FUNCTION_20();
      }

      goto LABEL_47;
    }
    uint64_t v88 = v40;
    int v84 = v39;
    uint64_t v44 = *(void *)(*(void *)(v37 + 56) + 8 * v42);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    int64_t v45 = *(void *)(v44 + 16);
    if (v45)
    {
      uint64_t v87 = v9;
      uint64_t v91 = (void *)MEMORY[0x263F8EE78];
      sub_25C619440(0, v45, 0);
      uint64_t v46 = (uint64_t)v91;
      uint64_t v47 = v44 + 40;
      do
      {
        uint64_t v48 = sub_25C61EA30();
        uint64_t v50 = v49;
        uint64_t v91 = (void *)v46;
        unint64_t v52 = *(void *)(v46 + 16);
        unint64_t v51 = *(void *)(v46 + 24);
        if (v52 >= v51 >> 1)
        {
          sub_25C619440((char *)(v51 > 1), v52 + 1, 1);
          uint64_t v46 = (uint64_t)v91;
        }
        v47 += 16;
        *(void *)(v46 + 16) = v52 + 1;
        uint64_t v53 = v46 + 16 * v52;
        *(void *)(v53 + 32) = v48;
        *(void *)(v53 + 40) = v50;
        --v45;
      }
      while (v45);
      swift_bridgeObjectRelease();
      uint64_t v9 = v87;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v46 = MEMORY[0x263F8EE78];
    }
    uint64_t v92 = sub_25C61EBB0();
    uint64_t v58 = *(void *)(v46 + 16);
    uint64_t v4 = v86;
    if (v58)
    {
      uint64_t v59 = (uint64_t *)(v46 + 40);
      do
      {
        uint64_t v60 = *(v59 - 1);
        uint64_t v61 = *v59;
        swift_bridgeObjectRetain();
        sub_25C605A60((uint64_t *)&v91, v60, v61);
        swift_bridgeObjectRelease();
        v59 += 2;
        --v58;
      }
      while (v58);
    }
    swift_bridgeObjectRelease();
    char v62 = (void *)v92;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v91 = v9;
    unint64_t v64 = sub_25C6086DC();
    if (__OFADD__(v9[2], (v65 & 1) == 0)) {
      break;
    }
    unint64_t v66 = v64;
    char v67 = v65;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5B8);
    char v68 = sub_25C61EE70();
    LOBYTE(v39) = v84;
    uint64_t v69 = v88;
    if (v68)
    {
      unint64_t v70 = sub_25C6086DC();
      if ((v67 & 1) != (v71 & 1)) {
        goto LABEL_53;
      }
      unint64_t v66 = v70;
    }
    uint64_t v9 = v91;
    unint64_t v13 = 0x26B351000;
    if (v67)
    {
      uint64_t v72 = v91[7];
      swift_bridgeObjectRelease();
      *(void *)(v72 + 8 * v66) = v62;
    }
    else
    {
      v91[(v66 >> 6) + 8] |= 1 << v66;
      uint64_t v73 = (uint64_t *)(v9[6] + 16 * v66);
      *uint64_t v73 = v69;
      v73[1] = v41;
      *(void *)(v9[7] + 8 * v66) = v62;
      uint64_t v74 = v9[2];
      BOOL v75 = __OFADD__(v74, 1);
      uint64_t v76 = v74 + 1;
      if (v75)
      {
        __break(1u);
LABEL_53:
        uint64_t result = sub_25C61EFE0();
        __break(1u);
        return result;
      }
      v9[2] = v76;
      swift_bridgeObjectRetain();
    }
    uint64_t v3 = v81;
    uint64_t v37 = v85;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_47:
    int v35 = 1;
    unint64_t v36 = 1u;
    if (v39)
    {
      sub_25C602470(v78, v79);
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v90, v3);
      return (uint64_t)v9;
    }
  }
  __break(1u);
  swift_once();
  uint64_t v21 = sub_25C61E9D0();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B351C28);
  id v22 = v62;
  id v23 = v62;
  uint64_t v24 = sub_25C61E9B0();
  os_log_type_t v25 = sub_25C61EBF0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = v44;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v91 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = *(void *)(isUniquelyReferenced_nonNull_native + 1448);
    swift_getErrorValue();
    uint64_t v28 = sub_25C61EFF0();
    uint64_t v92 = sub_25C618C00(v28, v29, (uint64_t *)&v91);
    sub_25C61EC20();
    swift_bridgeObjectRelease();
    MEMORY[0x26118C8A0](v62);
    MEMORY[0x26118C8A0](v62);
    _os_log_impl(&dword_25C5FA000, v24, v25, "Unable to read the StopWordAndNonSignificantWordList due to error: %s", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    MEMORY[0x26118C8A0](v62);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v90, v26);
  }
  else
  {

    MEMORY[0x26118C8A0](v62);
    MEMORY[0x26118C8A0](v62);
    MEMORY[0x26118C8A0](v62);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v90, v44);
  }
  return (uint64_t)v87;
}

uint64_t sub_25C601FDC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    uint64_t v4 = 0xD000000000000013;
  }
  else {
    uint64_t v4 = 0x64726F57706F7473;
  }
  if (a3) {
    unint64_t v5 = 0x800000025C620420;
  }
  else {
    unint64_t v5 = 0xE900000000000073;
  }
  uint64_t v6 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25C6048C0(v4, v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v8 = sub_25C61EA30();
    sub_25C601284(v8, v9, v7);
    char v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  else
  {
    if (qword_26B351C40 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25C61E9D0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B351C28);
    uint64_t v14 = sub_25C61E9B0();
    os_log_type_t v15 = sub_25C61EBF0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      sub_25C618C00(v4, v5, &v17);
      sub_25C61EC20();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5FA000, v14, v15, "StopWordAndNonSignificantWordList: Unable to find key in StopWordAndNonSignificantWordList: %s", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }

    return 0;
  }
}

uint64_t sub_25C6021F0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for StopWordAndNonSignificantWordList()
{
  return self;
}

id sub_25C60224C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_25C61EA10();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_25C61EA10();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_25C6022E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B351988);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C602340()
{
  unint64_t result = qword_26A5BB5A0;
  if (!qword_26A5BB5A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BB598);
    sub_25C602404();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB5A0);
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

unint64_t sub_25C602404()
{
  unint64_t result = qword_26A5BB5A8;
  if (!qword_26A5BB5A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5BB5B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB5A8);
  }
  return result;
}

uint64_t sub_25C602470(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_25C61EFB0();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return *(void *)(v0 + 16 * v1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_25C61F050();
}

uint64_t sub_25C602548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = (void *)MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    OUTLINED_FUNCTION_7_0();
    id v8 = v71;
    uint64_t v9 = a1 + 40;
    do
    {
      uint64_t v10 = sub_25C61EA30();
      uint64_t v2 = v11;
      char v71 = v8;
      unint64_t v13 = v8[2];
      unint64_t v12 = v8[3];
      if (v13 >= v12 >> 1) {
        sub_25C619440((char *)(v12 > 1), v13 + 1, 1);
      }
      v9 += 16;
      v8[2] = v13 + 1;
      uint64_t v14 = &v8[2 * v13];
      v14[4] = v10;
      v14[5] = v2;
      --v4;
    }
    while (v4);
    unint64_t v5 = v7;
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(a2 + 16);
  if (v15)
  {
    OUTLINED_FUNCTION_7_0();
    unint64_t v5 = v71;
    uint64_t v16 = a2 + 40;
    do
    {
      uint64_t v17 = sub_25C61EA30();
      uint64_t v2 = v18;
      unint64_t v20 = v71[2];
      unint64_t v19 = v71[3];
      unint64_t v21 = v20 + 1;
      if (v20 >= v19 >> 1) {
        sub_25C619440((char *)(v19 > 1), v20 + 1, 1);
      }
      v16 += 16;
      v71[2] = v21;
      id v22 = &v71[2 * v20];
      v22[4] = v17;
      v22[5] = v2;
      --v15;
    }
    while (v15);
  }
  else
  {
    unint64_t v21 = v5[2];
  }
  unint64_t v68 = v8[2];
  if (!v68 || !v21)
  {
LABEL_59:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21 <= v68) {
      return v68;
    }
    else {
      return v21;
    }
  }
  uint64_t v23 = sub_25C602B24(0, v21 + 1);
  uint64_t v24 = (void *)sub_25C602BD8(v23, v68 + 1);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_98;
  }
  while (1)
  {
    if (v24[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      uint64_t v69 = v5;
      unint64_t v5 = (void *)v24[5];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v24[5] = v5;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_20;
      }
    }
    sub_25C603C98((uint64_t)v5);
    unint64_t v5 = v64;
LABEL_20:
    if (v5[2])
    {
      v5[4] = 1;
      v24[5] = v5;
      if (v68 != 1)
      {
        uint64_t v48 = 0;
        uint64_t v49 = v24 + 6;
        while ((unint64_t)(v48 + 2) < v24[2])
        {
          unint64_t v5 = (void *)v49[v48];
          char v50 = swift_isUniquelyReferenced_nonNull_native();
          v49[v48] = v5;
          if ((v50 & 1) == 0)
          {
            sub_25C603C98((uint64_t)v5);
            unint64_t v5 = v51;
            v49[v48] = v51;
          }
          if (!v5[2]) {
            goto LABEL_95;
          }
          v5[4] = v48 + 2;
          if (v68 - 1 == ++v48) {
            goto LABEL_22;
          }
        }
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
LABEL_22:
      if (v24[2])
      {
        uint64_t v2 = v24 + 4;
        unint64_t v5 = (void *)v24[4];
        char v26 = swift_isUniquelyReferenced_nonNull_native();
        v24[4] = v5;
        if (v26) {
          goto LABEL_24;
        }
        goto LABEL_103;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_103:
    sub_25C603C98((uint64_t)v5);
    unint64_t v5 = v65;
LABEL_24:
    if (v5[2] < 2uLL) {
      break;
    }
    v5[5] = 1;
    *uint64_t v2 = v5;
    unint64_t v70 = v21 - 1;
    if (v21 == 1)
    {
LABEL_26:
      unint64_t v66 = v21;
      char v67 = v8;
      uint64_t v27 = v69;
      if (!v8[2])
      {
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
      unint64_t v28 = 0;
      v8 += 4;
      unint64_t v29 = 1;
LABEL_28:
      if (v27[2])
      {
        unint64_t v30 = 0;
        uint64_t v31 = v69 + 5;
        while (1)
        {
          BOOL v32 = *v8 == *(v31 - 1) && v8[1] == *v31;
          BOOL v33 = !v32 && (unint64_t)((sub_25C61EFB0() & 1) == 0);
          unint64_t v34 = v24[2];
          if (v29 > v34) {
            break;
          }
          uint64_t v35 = v2[v28];
          if (v30 + 1 >= *(void *)(v35 + 16)) {
            goto LABEL_87;
          }
          uint64_t v36 = *(void *)(v35 + 8 * v30 + 40);
          BOOL v37 = __OFADD__(v36, 1);
          uint64_t v38 = v36 + 1;
          if (v37) {
            goto LABEL_88;
          }
          if (v29 >= v34) {
            goto LABEL_89;
          }
          unint64_t v5 = (void *)v2[v29];
          if (v30 >= v5[2]) {
            goto LABEL_90;
          }
          uint64_t v39 = v5[v30 + 4];
          BOOL v37 = __OFADD__(v39, 1);
          uint64_t v40 = v39 + 1;
          if (v37) {
            goto LABEL_91;
          }
          uint64_t v41 = *(void *)(v35 + 8 * v30 + 32);
          BOOL v37 = __OFADD__(v41, v33);
          int64_t v42 = v41 + v33;
          if (v37) {
            goto LABEL_92;
          }
          if (v40 >= v38) {
            int64_t v43 = v38;
          }
          else {
            int64_t v43 = v40;
          }
          if (v42 >= v43) {
            unint64_t v21 = v43;
          }
          else {
            unint64_t v21 = v42;
          }
          char v44 = swift_isUniquelyReferenced_nonNull_native();
          v2[v29] = v5;
          if ((v44 & 1) == 0)
          {
            sub_25C603C98((uint64_t)v5);
            unint64_t v5 = v45;
            v2[v29] = v45;
          }
          if (v30 + 1 >= v5[2]) {
            goto LABEL_93;
          }
          v5[v30 + 5] = v21;
          if (v70 == v30)
          {
            uint64_t v27 = v69;
            if (v29 != v68)
            {
              id v8 = &v67[2 * v29 + 4];
              unint64_t v28 = v29;
              if (v29++ >= v67[2]) {
                goto LABEL_58;
              }
              goto LABEL_28;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v55 = sub_25C602CCC((uint64_t)v24);
            if (v55)
            {
              uint64_t v56 = sub_25C602CFC(v55);
              char v58 = v57;
              swift_bridgeObjectRelease();
              if ((v58 & 1) == 0)
              {
                swift_bridgeObjectRelease();
                return v56;
              }
            }
            if (qword_26B3515D8[0] != -1) {
              goto LABEL_105;
            }
            goto LABEL_80;
          }
          v31 += 2;
          if (++v30 >= v69[2]) {
            goto LABEL_85;
          }
        }
      }
      else
      {
LABEL_85:
        __break(1u);
      }
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
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
      goto LABEL_94;
    }
    uint64_t v52 = 0;
    while (v24[2])
    {
      char v53 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v2 = v5;
      if ((v53 & 1) == 0)
      {
        sub_25C603C98((uint64_t)v5);
        unint64_t v5 = v54;
      }
      if ((unint64_t)(v52 + 2) >= v5[2]) {
        goto LABEL_97;
      }
      v5[v52 + 6] = v52 + 2;
      *uint64_t v2 = v5;
      if (v70 == ++v52) {
        goto LABEL_26;
      }
    }
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    sub_25C603CF0((uint64_t)v24);
    uint64_t v24 = v63;
  }
  __break(1u);
LABEL_105:
  swift_once();
LABEL_80:
  uint64_t v59 = sub_25C61E9D0();
  __swift_project_value_buffer(v59, (uint64_t)qword_26B3515A8);
  uint64_t v60 = sub_25C61E9B0();
  os_log_type_t v61 = sub_25C61EBF0();
  if (os_log_type_enabled(v60, v61))
  {
    char v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v62 = 0;
    _os_log_impl(&dword_25C5FA000, v60, v61, "EditDistance: The output matrix was unexpectedly empty.", v62, 2u);
    MEMORY[0x26118CA00](v62, -1, -1);
  }
  swift_bridgeObjectRelease();

  if (v66 <= v68) {
    return v68;
  }
  else {
    return v66;
  }
}

uint64_t sub_25C602B24(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_25C61EE80();
    __break(1u);
  }
  else if (a2)
  {
    uint64_t result = sub_25C61EB80();
    uint64_t v5 = 0;
    *(void *)(result + 16) = a2;
    do
    {
      uint64_t v6 = result + 8 * v5++;
      *(void *)(v6 + 32) = a1;
    }
    while (a2 != v5);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25C602BD8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_25C61EE80();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5D0);
      uint64_t v4 = (void *)sub_25C61EB80();
      uint64_t v5 = v4;
      v4[2] = a2;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        uint64_t v6 = a2 - 2;
        if (v6)
        {
          uint64_t v7 = v4 + 6;
          do
          {
            *v7++ = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_25C602CCC(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25C602CFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1) {
    return *(void *)(a1 + 8 * v1 + 24);
  }
  else {
    return 0;
  }
}

void sub_25C602D20(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_5_1();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_8_0();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_1();
    }
  }
  OUTLINED_FUNCTION_6_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5F0);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v4;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25C603904((char *)(a4 + 32), v4, (char *)(v10 + 32));
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_11_0();
    sub_25C6032A8(v12, v13, v14, v15);
  }
}

void sub_25C602DE4(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    OUTLINED_FUNCTION_5_1();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_8_0();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_1();
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
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 8);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v18 = v16 + 4;
  if (a1)
  {
    a7(a4 + 32, v14, v18);
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    a6(0, v14, v18, a4);
  }
}

uint64_t sub_25C602ECC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_25C602F14(a1, a2, a3, a4, &qword_26B351598, MEMORY[0x263F84768], MEMORY[0x263F84768]);
}

uint64_t sub_25C602EF0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_25C602F14(a1, a2, a3, a4, &qword_26B351588, MEMORY[0x263F846A0], MEMORY[0x263F846A0]);
}

uint64_t sub_25C602F14(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t), void (*a7)(uint64_t))
{
  if (a3)
  {
    OUTLINED_FUNCTION_5_1();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_8_0();
      if (v12)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_4_1();
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
  if (!v15)
  {
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v16 = OUTLINED_FUNCTION_10_0();
  uint64_t v17 = *(void *)(a6(v16) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v18 || (v21 - v19 == 0x8000000000000000 ? (BOOL v22 = v18 == -1) : (BOOL v22 = 0), v22))
  {
LABEL_23:
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_12_0();
    uint64_t result = sub_25C61EE80();
    __break(1u);
    return result;
  }
  v20[2] = v14;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v18);
LABEL_18:
  uint64_t v23 = OUTLINED_FUNCTION_10_0();
  uint64_t v24 = *(void *)(a6(v23) - 8);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v26 = (unint64_t)v20 + v25;
  if (a1)
  {
    sub_25C603AE8(a4 + v25, v14, v26, a7);
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    sub_25C6035AC(0, v14, v26, a4);
  }
  return (uint64_t)v20;
}

void sub_25C603118(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_5_1();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_8_0();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_1();
    }
  }
  OUTLINED_FUNCTION_6_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E8);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v4;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25C603BD8((char *)(a4 + 32), v4, (char *)(v10 + 32));
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_11_0();
    sub_25C6036EC(v12, v13, v14, v15);
  }
}

void sub_25C6031E4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_5_1();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_8_0();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_1();
    }
  }
  OUTLINED_FUNCTION_6_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5D8);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v4;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_25C603C3C((char *)(a4 + 32), v4, (char *)(v10 + 32));
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_11_0();
    sub_25C6037EC(v12, v13, v14, v15);
  }
}

uint64_t sub_25C6032A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25C61EEB0();
  __break(1u);
  return result;
}

char *sub_25C6033A0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_25C61EEB0();
  __break(1u);
  return result;
}

uint64_t sub_25C603494(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5D0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C61EEB0();
  __break(1u);
  return result;
}

uint64_t sub_25C6035AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = OUTLINED_FUNCTION_10_0();
    uint64_t v10 = *(void *)(v9(v8) - 8);
    uint64_t v11 = a4 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v12 = *(void *)(v10 + 72);
    unint64_t v13 = v11 + v12 * a1;
    unint64_t v14 = a3 + v12 * v4;
    if (v13 >= v14 || v13 + v12 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v14;
    }
  }
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_12_0();
  uint64_t result = sub_25C61EEB0();
  __break(1u);
  return result;
}

uint64_t sub_25C6036EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C61EEB0();
  __break(1u);
  return result;
}

uint64_t sub_25C6037EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C61EEB0();
  __break(1u);
  return result;
}

char *sub_25C603904(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_1();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_0(a3, result);
  }
  return result;
}

char *sub_25C603960(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C61EEB0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_25C6039F4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v7 = OUTLINED_FUNCTION_1_1();
    __break(1u);
    return MEMORY[0x270FA01D0](v7);
  }
  OUTLINED_FUNCTION_13_0();
  if (v5
    && (uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0),
        v3 + *(void *)(*(void *)(result - 8) + 72) * v2 > v4))
  {
    if (v4 != v3)
    {
      uint64_t v7 = OUTLINED_FUNCTION_3_1();
      return MEMORY[0x270FA01D0](v7);
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0);
    uint64_t v8 = OUTLINED_FUNCTION_3_1();
    return MEMORY[0x270FA01D8](v8);
  }
  return result;
}

uint64_t sub_25C603AE8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v11 = OUTLINED_FUNCTION_1_1();
    __break(1u);
    return MEMORY[0x270FA01D0](v11);
  }
  OUTLINED_FUNCTION_13_0();
  if (v8
    && (uint64_t v9 = OUTLINED_FUNCTION_10_0(),
        uint64_t result = ((uint64_t (*)(uint64_t))a4)(v9),
        v5 + *(void *)(*(void *)(result - 8) + 72) * v4 > v6))
  {
    if (v6 != v5)
    {
      uint64_t v11 = OUTLINED_FUNCTION_3_1();
      return MEMORY[0x270FA01D0](v11);
    }
  }
  else
  {
    uint64_t v12 = OUTLINED_FUNCTION_10_0();
    a4(v12);
    uint64_t v13 = OUTLINED_FUNCTION_3_1();
    return MEMORY[0x270FA01D8](v13);
  }
  return result;
}

char *sub_25C603BD8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_1();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_0(a3, result);
  }
  return result;
}

char *sub_25C603C3C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_1();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_0(a3, result);
  }
  return result;
}

void sub_25C603C98(uint64_t a1)
{
}

void sub_25C603CF0(uint64_t a1)
{
}

void sub_25C603D48(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_25C61EEB0();
}

void *OUTLINED_FUNCTION_2_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

char *OUTLINED_FUNCTION_7_0()
{
  return sub_25C619440(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return 0;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_25C603E98(uint64_t a1)
{
  return sub_25C603EEC(a1, qword_26B351C28);
}

uint64_t static Logger.indexCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C603F84(&qword_26B351C40, (uint64_t)qword_26B351C28, a1);
}

uint64_t sub_25C603ED4(uint64_t a1)
{
  return sub_25C603EEC(a1, qword_26B3515A8);
}

uint64_t sub_25C603EEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25C61E9D0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25C61E9C0();
}

uint64_t static Logger.queryCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C603F84(qword_26B3515D8, (uint64_t)qword_26B3515A8, a1);
}

uint64_t sub_25C603F84@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C61E9D0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_25C60401C()
{
  sub_25C60442C();
  uint64_t result = sub_25C61EC00();
  qword_26A5BB5F8 = result;
  return result;
}

id static SiriAutoCompleteSignpostOSLog.indexLog.getter()
{
  return sub_25C60413C(&qword_26A5BB528, (void **)&qword_26A5BB5F8);
}

uint64_t sub_25C6040AC()
{
  sub_25C60442C();
  uint64_t result = sub_25C61EC00();
  qword_26A5BB600 = result;
  return result;
}

id static SiriAutoCompleteSignpostOSLog.queryLog.getter()
{
  return sub_25C60413C(&qword_26A5BB530, (void **)&qword_26A5BB600);
}

id sub_25C60413C(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

void static SiriAutoCompleteSignpost.buildIndex.getter()
{
}

void static SiriAutoCompleteSignpost.phraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.siriKitIntentSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.appLaunchSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.voiceShortcutSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.appIntentTranscriptSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.appShortcutsSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.assistantIntentExamplePhrasesSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.staticSuggestionsSourcePhraseGeneration.getter()
{
}

void static SiriAutoCompleteSignpost.dBInsertion.getter()
{
}

void static SiriAutoCompleteSignpost.fetchAutoCompleteResults.getter()
{
}

uint64_t static SignpostLogger.begin(log:name:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25C604268(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F902A0]);
}

uint64_t static SignpostLogger.end(log:name:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_25C604268(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90298]);
}

uint64_t sub_25C604268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t))
{
  v15[1] = a5;
  uint64_t v9 = sub_25C61E9A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a8(v11);
  sub_25C61E990();
  sub_25C61E980();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t SignpostLogger.deinit()
{
  return v0;
}

uint64_t SignpostLogger.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

void type metadata accessor for Logger()
{
}

void type metadata accessor for SiriAutoCompleteSignpostOSLog()
{
}

void type metadata accessor for SiriAutoCompleteSignpost()
{
}

uint64_t type metadata accessor for SignpostLogger()
{
  return self;
}

uint64_t method lookup function for SignpostLogger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignpostLogger);
}

unint64_t sub_25C60442C()
{
  unint64_t result = qword_26A5BB608;
  if (!qword_26A5BB608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5BB608);
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

uint64_t sub_25C6044E0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C6044F4()
{
  uint64_t v9 = MEMORY[0x263F8EE88];
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_hiddenAppBundleIdentifiers);
  uint64_t v2 = sub_25C61EBA0();

  sub_25C604680(v2);
  id v3 = objc_msgSend(v0, sel_lockedAppBundleIdentifiers);
  uint64_t v4 = sub_25C61EBA0();

  sub_25C604680(v4);
  uint64_t v5 = (__CFString *)sub_25C61EA10();
  uint64_t v6 = (__CFString *)sub_25C61EA10();
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(v5, v6);

  if (v7)
  {
    self;
    if (swift_dynamicCastObjCClass()) {
      sub_25C61EB30();
    }
    swift_unknownObjectRelease();
  }
  return v9;
}

uint64_t sub_25C604680(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v2 << 6))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    swift_bridgeObjectRetain();
    sub_25C605A60(&v16, v14, v15);
    unint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v6 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_20;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_20;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_25C604804(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    int64_t v2 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v3 = *(v2 - 1);
      uint64_t v4 = *v2;
      swift_bridgeObjectRetain();
      sub_25C605A60(&v6, v3, v4);
      swift_bridgeObjectRelease();
      v2 += 2;
      --v1;
    }
    while (v1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C60488C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for DefaultBlockedAppsProvider()
{
  return self;
}

uint64_t sub_25C6048C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25C6086DC(), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25C604908(uint64_t a1, unint64_t a2)
{
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C61E9D0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3515A8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25C61E9B0();
  os_log_type_t v6 = sub_25C61EBE0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v10[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_25C618C00(0xD000000000000021, 0x800000025C620930, v10);
    sub_25C61EC20();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_25C618C00(a1, a2, v10);
    sub_25C61EC20();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5FA000, v5, v6, "Cache write: %s %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_25C608914(v8, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C6089AC);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C604B38()
{
  uint64_t v3 = v1;
  OUTLINED_FUNCTION_4_2();
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C61E9D0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B3515A8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25C61E9B0();
  os_log_type_t v6 = sub_25C61EBE0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v11[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_25C618C00(0xD00000000000001BLL, 0x800000025C620910, v11);
    sub_25C61EC20();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_25C618C00(v2, v0, v11);
    sub_25C61EC20();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5FA000, v5, v6, "Cache read: %s %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  OUTLINED_FUNCTION_3_2();
  uint64_t v8 = *(void *)(v3 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25C6048C4(v2, v0, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_25C604D5C()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_25C608914(v2, v1, v0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C6089AC);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C604DD8()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2();
  uint64_t v1 = *(void *)(v0 + 120);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_25C6086DC();
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C604E70()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_25C608914(v2, v1, v0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C6089AC);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C604EEC()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2();
  uint64_t v1 = *(void *)(v0 + 136);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_25C6086DC();
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C604F84()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_3();
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_retain();
  sub_25C608914(v2, v1, v0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C608AD4);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C605000()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2();
  uint64_t v1 = *(void *)(v0 + 128);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_25C6086DC();
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
    swift_retain();
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_25C605098()
{
  OUTLINED_FUNCTION_5_2();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    goto LABEL_55;
  }
LABEL_2:
  unint64_t v3 = MEMORY[0x263F8EE88];
LABEL_3:
  unint64_t v31 = v3;
  uint64_t v27 = v0 + 14;
  swift_beginAccess();
  uint64_t v4 = v0[14];
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v28 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & v5;
  int64_t v29 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (v8)
  {
LABEL_6:
    v8 &= v8 - 1;
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      if (sub_25C61EE90())
      {
        unint64_t v3 = sub_25C6056F4(MEMORY[0x263F8EE78]);
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    if (v10 >= v29) {
      goto LABEL_52;
    }
    uint64_t v11 = *(void *)(v28 + 8 * v10);
    ++v9;
    if (!v11)
    {
      int64_t v9 = v10 + 1;
      OUTLINED_FUNCTION_7_1();
      if (v12 == v13) {
        goto LABEL_52;
      }
      OUTLINED_FUNCTION_6_1();
      if (!v11)
      {
        int64_t v9 = v14 + 2;
        OUTLINED_FUNCTION_7_1();
        if (v12 == v13) {
          goto LABEL_52;
        }
        OUTLINED_FUNCTION_6_1();
        if (!v11)
        {
          int64_t v9 = v15 + 3;
          OUTLINED_FUNCTION_7_1();
          if (v12 == v13) {
            goto LABEL_52;
          }
          OUTLINED_FUNCTION_6_1();
          if (!v11)
          {
            int64_t v9 = v16 + 4;
            OUTLINED_FUNCTION_7_1();
            if (v12 == v13) {
              goto LABEL_52;
            }
            OUTLINED_FUNCTION_6_1();
            if (!v11) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    uint64_t v8 = (v11 - 1) & v11;
LABEL_30:
    v30[0] = v2;
    v30[1] = v1;
    sub_25C608C44();
    sub_25C608C90();
    swift_bridgeObjectRetain();
    uint64_t v0 = v30;
    if ((sub_25C61EA00() & 1) == 0) {
      goto LABEL_45;
    }
    uint64_t v0 = (void *)*v27;
    if (*(void *)(*v27 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25C6086DC();
      if (v21)
      {
        uint64_t v22 = *(void *)(v0[7] + 8 * v20);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v23 = v22;
        goto LABEL_37;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v23 = MEMORY[0x263F8EE78];
LABEL_37:
    if ((unint64_t)v23 >> 62)
    {
      if (v23 < 0) {
        uint64_t v0 = (void *)v23;
      }
      else {
        uint64_t v0 = (void *)(v23 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_25C61EE90();
      swift_bridgeObjectRelease();
      if (v24)
      {
LABEL_39:
        if (v24 < 1) {
          goto LABEL_54;
        }
        uint64_t v25 = 0;
        do
        {
          if ((v23 & 0xC000000000000001) != 0)
          {
            unint64_t v26 = (void *)MEMORY[0x26118C320](v25, v23);
          }
          else
          {
            unint64_t v26 = *(void **)(v23 + 8 * v25 + 32);
            swift_retain();
          }
          ++v25;
          uint64_t v0 = &v31;
          sub_25C605BD8(v30, v26);
          swift_release();
        }
        while (v24 != v25);
      }
    }
    else
    {
      uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v24) {
        goto LABEL_39;
      }
    }
LABEL_45:
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_6;
    }
  }
  int64_t v18 = v17 + 5;
  if (v18 >= v29)
  {
LABEL_52:
    swift_release();
    return;
  }
  uint64_t v11 = *(void *)(v28 + 8 * v18);
  if (v11)
  {
    int64_t v9 = v18;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    OUTLINED_FUNCTION_7_1();
    if (v12 == v13) {
      goto LABEL_52;
    }
    OUTLINED_FUNCTION_6_1();
    int64_t v18 = v19 + 1;
    if (v11) {
      goto LABEL_29;
    }
  }
  __break(1u);
}

uint64_t sub_25C605400()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_25C605440()
{
  sub_25C605400();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for TypingSessionCache()
{
  return self;
}

void *sub_25C605490()
{
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351750);
  v0[14] = OUTLINED_FUNCTION_2_1();
  v0[15] = OUTLINED_FUNCTION_2_1();
  type metadata accessor for AutoCompletePhrase();
  v0[16] = sub_25C61E9E0();
  v0[17] = OUTLINED_FUNCTION_2_1();
  return v0;
}

uint64_t sub_25C605528()
{
  return v0;
}

uint64_t sub_25C605534()
{
  return sub_25C605528();
}

uint64_t sub_25C605550(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351568);
  uint64_t result = sub_25C61EDB0();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_25C61F050();
    sub_25C61E9F0();
    uint64_t result = sub_25C61F080();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      uint64_t result = OUTLINED_FUNCTION_8_1(v14 + 16 * v10);
      BOOL v16 = v16 && v15 == v7;
      if (v16) {
        goto LABEL_21;
      }
      uint64_t result = OUTLINED_FUNCTION_1_3();
      if (result) {
        goto LABEL_21;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t result = OUTLINED_FUNCTION_8_1(v14 + 16 * v10);
        if (!v16 || v18 != v7)
        {
          uint64_t result = OUTLINED_FUNCTION_1_3();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    unint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    void *v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_26;
    }
    *(void *)(v3 + 16) = v23;
    uint64_t result = swift_bridgeObjectRetain();
LABEL_21:
    if (++v4 == v24) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_25C6056F4(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C61EE90();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB620);
  uint64_t result = sub_25C61EDB0();
  unint64_t v3 = result;
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C61EE90();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_26;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  uint64_t v22 = v5;
  while (1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t result = MEMORY[0x26118C320](v6, v1);
      uint64_t v8 = (void *)result;
    }
    else
    {
      if (v6 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_29;
      }
      uint64_t v8 = *(void **)(v1 + 32 + 8 * v6);
      uint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    sub_25C61F050();
    sub_25C61F060();
    uint64_t result = sub_25C61F080();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      type metadata accessor for AutoCompletePhrase();
      uint64_t v15 = (void *)swift_retain();
      char v16 = static AutoCompletePhrase.== infix(_:_:)(v15, v8);
      uint64_t result = swift_release();
      if (v16)
      {
LABEL_21:
        uint64_t result = swift_release();
        uint64_t v5 = v22;
        goto LABEL_25;
      }
      uint64_t v17 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v17;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0) {
          break;
        }
        uint64_t v18 = (void *)swift_retain();
        char v19 = static AutoCompletePhrase.== infix(_:_:)(v18, v8);
        uint64_t result = swift_release();
        if (v19) {
          goto LABEL_21;
        }
      }
      uint64_t v5 = v22;
    }
    *(void *)(v7 + 8 * v12) = v14 | v13;
    *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
    uint64_t v20 = *(void *)(v3 + 16);
    BOOL v9 = __OFADD__(v20, 1);
    uint64_t v21 = v20 + 1;
    if (v9) {
      goto LABEL_28;
    }
    *(void *)(v3 + 16) = v21;
LABEL_25:
    if (v6 == v5) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_25C605968()
{
  unint64_t v3 = v1;
  OUTLINED_FUNCTION_4_2();
  uint64_t v4 = *v1;
  uint64_t v5 = sub_25C61F040();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_25C606ECC(v0, v7, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v12;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(v4 + 48);
  if (*(void *)(v8 + 8 * v7) != v0)
  {
    uint64_t v9 = ~v6;
    do
    {
      unint64_t v7 = (v7 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v8 + 8 * v7) != v0);
  }
  uint64_t result = 0;
LABEL_8:
  *unint64_t v2 = v0;
  return result;
}

uint64_t sub_25C605A60(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25C61F050();
  swift_bridgeObjectRetain();
  sub_25C61E9F0();
  uint64_t v8 = sub_25C61F080();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  OUTLINED_FUNCTION_1_0();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    OUTLINED_FUNCTION_8_1(v12 + 16 * v10);
    BOOL v14 = v14 && v13 == a3;
    if (v14 || (OUTLINED_FUNCTION_1_3() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_1_0();
      if ((v19 & 1) == 0) {
        break;
      }
      OUTLINED_FUNCTION_8_1(v12 + 16 * v10);
      BOOL v21 = v14 && v20 == a3;
      if (v21 || (OUTLINED_FUNCTION_1_3() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25C606FF0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25C605BD8(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v8 = sub_25C61ED30();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for AutoCompletePhrase();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v22;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25C61ED20();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v18 = sub_25C6060D0(v7, result + 1);
    uint64_t v23 = v18;
    if (*(void *)(v18 + 24) <= *(void *)(v18 + 16))
    {
      swift_retain();
      sub_25C606828();
      uint64_t v19 = v23;
    }
    else
    {
      uint64_t v19 = v18;
      swift_retain();
    }
    sub_25C606E28((uint64_t)a2, v19);
    *unint64_t v3 = v19;
  }
  else
  {
    sub_25C61F050();
    sub_25C61F060();
    uint64_t v9 = sub_25C61F080();
    uint64_t v10 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v11 = v9 & ~v10;
    if ((*(void *)(v6 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
    {
      type metadata accessor for AutoCompletePhrase();
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)swift_retain();
      char v13 = static AutoCompletePhrase.== infix(_:_:)(v12, a2);
      swift_release();
      if (v13)
      {
LABEL_12:
        swift_release();
        swift_bridgeObjectRelease();
        *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v11);
        swift_retain();
        return 0;
      }
      uint64_t v14 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v14;
        if (((*(void *)(v6 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          break;
        }
        uint64_t v15 = (void *)swift_retain();
        char v16 = static AutoCompletePhrase.== infix(_:_:)(v15, a2);
        swift_release();
        if (v16) {
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = *v2;
    *unint64_t v2 = 0x8000000000000000;
    uint64_t v21 = swift_retain();
    sub_25C60718C(v21, v11, isUniquelyReferenced_nonNull_native);
    *unint64_t v2 = v24;
  }
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

uint64_t sub_25C605E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_25C61F050();
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v30 = a2;
  LODWORD(a2) = *(unsigned __int8 *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C61E9F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v34 = v7;
  sub_25C61E9F0();
  uint64_t v33 = v8;
  swift_bridgeObjectRelease();
  int v32 = a2;
  sub_25C61F070();
  uint64_t v9 = sub_25C61F080();
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  uint64_t v12 = v4 + 56;
  if ((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v13 = ~v10;
    uint64_t v14 = *(void *)(v4 + 48);
    while (1)
    {
      uint64_t v15 = v14 + 40 * v11;
      uint64_t v17 = *(void *)(v15 + 16);
      uint64_t v16 = *(void *)(v15 + 24);
      int v18 = *(unsigned __int8 *)(v15 + 32);
      BOOL v19 = *(void *)v15 == v5 && *(void *)(v15 + 8) == v6;
      if (v19 || (sub_25C61EFB0() & 1) != 0)
      {
        BOOL v20 = v17 == v34 && v16 == v33;
        if (v20 || (sub_25C61EFB0()) && v18 == v32) {
          break;
        }
      }
      unint64_t v11 = (v11 + 1) & v13;
      if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    sub_25C608D14(v30);
    uint64_t v24 = *(void *)(*v29 + 48) + 40 * v11;
    uint64_t v26 = *(void *)v24;
    uint64_t v25 = *(void *)(v24 + 8);
    uint64_t v27 = *(void *)(v24 + 16);
    uint64_t v28 = *(void *)(v24 + 24);
    LOBYTE(v24) = *(unsigned char *)(v24 + 32);
    *(void *)a1 = v26;
    *(void *)(a1 + 8) = v25;
    *(void *)(a1 + 16) = v27;
    *(void *)(a1 + 24) = v28;
    *(unsigned char *)(a1 + 32) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v35 = *v29;
    uint64_t *v29 = 0x8000000000000000;
    sub_25C608CDC(v30);
    sub_25C607328(v30, v11, isUniquelyReferenced_nonNull_native);
    uint64_t *v29 = v35;
    swift_bridgeObjectRelease();
    long long v22 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v30;
    *(_OWORD *)(a1 + 16) = v22;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(v30 + 32);
    return 1;
  }
}

uint64_t sub_25C6060D0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB620);
  uint64_t v2 = sub_25C61EDA0();
  uint64_t v14 = v2;
  sub_25C61ECC0();
  if (!sub_25C61ED50())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  type metadata accessor for AutoCompletePhrase();
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_25C606828();
      uint64_t v2 = v14;
    }
    sub_25C61F050();
    sub_25C61F060();
    uint64_t result = sub_25C61F080();
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_25C61ED50()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C6062C8()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB638);
  uint64_t result = sub_25C61ED90();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v7 = (uint64_t *)(v2 + 56);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = -1 << v8;
    uint64_t v28 = v1;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v6;
    uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = result + 56;
    if ((v9 & v6) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v13 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_25C61F040();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v11) {
        goto LABEL_32;
      }
      unint64_t v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        int64_t v5 = v15 + 1;
        if (v15 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v16 = v7[v5];
        if (!v16)
        {
          int64_t v5 = v15 + 2;
          if (v15 + 2 >= v11) {
            goto LABEL_32;
          }
          unint64_t v16 = v7[v5];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63) {
                sub_25C607544(0, v11, (void *)(v2 + 56));
              }
              else {
                *unint64_t v7 = v27;
              }
              unint64_t v1 = v28;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v5 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v11) {
                  goto LABEL_32;
                }
                unint64_t v16 = v7[v5];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25C60654C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351570);
  uint64_t v3 = sub_25C61ED90();
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
      int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25C61F050();
      sub_25C61E9F0();
      uint64_t result = sub_25C61F080();
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
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
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
              unint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25C607544(0, (unint64_t)(v29 + 63) >> 6, v30);
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25C606828()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB620);
  uint64_t result = sub_25C61ED90();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
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
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      sub_25C61F050();
      sub_25C61F060();
      uint64_t result = sub_25C61F080();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          BOOL v24 = v20 == v23;
          if (v20 == v23) {
            unint64_t v20 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
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
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                sub_25C607544(0, (unint64_t)(v26 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v26;
              }
              unint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v10) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v5];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25C606AD0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB640);
  uint64_t v3 = sub_25C61ED90();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    uint64_t v34 = v2;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      uint64_t v16 = *(void *)(v2 + 48) + 40 * i;
      uint64_t v17 = *(void *)v16;
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t v19 = *(void *)(v16 + 16);
      uint64_t v20 = *(void *)(v16 + 24);
      char v21 = *(unsigned char *)(v16 + 32);
      sub_25C61F050();
      swift_bridgeObjectRetain();
      sub_25C61E9F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25C61E9F0();
      swift_bridgeObjectRelease();
      sub_25C61F070();
      uint64_t result = sub_25C61F080();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v8 + 8 * (v23 >> 6))) == 0)
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
          uint64_t v29 = *(void *)(v8 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
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
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v8 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v8 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      uint64_t v30 = *(void *)(v4 + 48) + 40 * v25;
      *(void *)uint64_t v30 = v17;
      *(void *)(v30 + 8) = v18;
      *(void *)(v30 + 16) = v19;
      *(void *)(v30 + 24) = v20;
      *(unsigned char *)(v30 + 32) = v21;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v34;
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_38;
      }
      if (v13 >= v32) {
        goto LABEL_32;
      }
      unint64_t v14 = v33[v13];
      ++v10;
      if (!v14)
      {
        int64_t v10 = v13 + 1;
        if (v13 + 1 >= v32) {
          goto LABEL_32;
        }
        unint64_t v14 = v33[v10];
        if (!v14)
        {
          int64_t v10 = v13 + 2;
          if (v13 + 2 >= v32) {
            goto LABEL_32;
          }
          unint64_t v14 = v33[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v32)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v0;
              uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
              if (v31 > 63) {
                sub_25C607544(0, (unint64_t)(v31 + 63) >> 6, v33);
              }
              else {
                void *v33 = -1 << v31;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v33[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_39;
                }
                if (v10 >= v32) {
                  goto LABEL_32;
                }
                unint64_t v14 = v33[v10];
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
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_25C606E28(uint64_t a1, uint64_t a2)
{
  sub_25C61F050();
  sub_25C61F060();
  sub_25C61F080();
  unint64_t result = sub_25C61ECA0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_25C606ECC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25C6062C8();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_25C607560();
      goto LABEL_14;
    }
    sub_25C607C28();
  }
  uint64_t v8 = *v3;
  unint64_t result = sub_25C61F040();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      unint64_t result = sub_25C61EFD0();
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

uint64_t sub_25C606FF0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25C60654C();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_25C6076F8();
      goto LABEL_22;
    }
    sub_25C607E88();
  }
  uint64_t v11 = *v4;
  sub_25C61F050();
  sub_25C61E9F0();
  unint64_t result = sub_25C61F080();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_25C61EFB0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_25C61EFD0();
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
          unint64_t result = sub_25C61EFB0();
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
  char v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
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

uint64_t sub_25C60718C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = (void *)result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25C606828();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_25C6078AC();
      goto LABEL_14;
    }
    sub_25C608134();
  }
  uint64_t v8 = *v3;
  sub_25C61F050();
  sub_25C61F060();
  unint64_t result = sub_25C61F080();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for AutoCompletePhrase();
    unint64_t v10 = (void *)swift_retain();
    char v11 = static AutoCompletePhrase.== infix(_:_:)(v10, v5);
    unint64_t result = swift_release();
    if (v11)
    {
LABEL_13:
      unint64_t result = sub_25C61EFD0();
      __break(1u);
    }
    else
    {
      uint64_t v12 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)swift_retain();
        char v14 = static AutoCompletePhrase.== infix(_:_:)(v13, v5);
        unint64_t result = swift_release();
        if (v14) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v15 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v15 + 48) + 8 * a2) = v5;
  uint64_t v16 = *(void *)(v15 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    *(void *)(v15 + 16) = v18;
  }
  return result;
}

uint64_t sub_25C607328(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v31 = result;
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_25C606AD0();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_25C607A58();
      goto LABEL_22;
    }
    sub_25C6083B4();
  }
  uint64_t v8 = *v3;
  sub_25C61F050();
  uint64_t v9 = *(void *)v5;
  uint64_t v10 = *(void *)(v5 + 8);
  uint64_t v11 = *(void *)(v5 + 16);
  uint64_t v12 = *(void *)(v5 + 24);
  int v13 = *(unsigned __int8 *)(v5 + 32);
  swift_bridgeObjectRetain();
  sub_25C61E9F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v33 = v11;
  sub_25C61E9F0();
  swift_bridgeObjectRelease();
  int v32 = v13;
  sub_25C61F070();
  unint64_t result = sub_25C61F080();
  uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v14;
  uint64_t v15 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v8 + 48);
    do
    {
      uint64_t v18 = v17 + 40 * a2;
      unint64_t result = *(void *)v18;
      uint64_t v19 = *(void *)(v18 + 16);
      uint64_t v20 = *(void *)(v18 + 24);
      int v21 = *(unsigned __int8 *)(v18 + 32);
      BOOL v22 = *(void *)v18 == v9 && *(void *)(v18 + 8) == v10;
      if (v22 || (unint64_t result = sub_25C61EFB0(), (result & 1) != 0))
      {
        BOOL v23 = v19 == v33 && v20 == v12;
        if (v23 || (unint64_t result = sub_25C61EFB0(), (result & 1) != 0))
        {
          if (v21 == v32) {
            goto LABEL_25;
          }
        }
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_22:
  uint64_t v24 = *v30;
  *(void *)(*v30 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v25 = *(void *)(v24 + 48) + 40 * a2;
  long long v26 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v31;
  *(_OWORD *)(v25 + 16) = v26;
  *(unsigned char *)(v25 + 32) = *(unsigned char *)(v31 + 32);
  uint64_t v27 = *(void *)(v24 + 16);
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (!v28)
  {
    *(void *)(v24 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_25:
  unint64_t result = sub_25C61EFD0();
  __break(1u);
  return result;
}

uint64_t sub_25C607544(uint64_t result, uint64_t a2, void *a3)
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

void *sub_25C607560()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB638);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C61ED80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
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
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25C6076F8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351570);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C61ED80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    BOOL v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *BOOL v22 = *v20;
    v22[1] = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_25C6078AC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB620);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C61ED80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    unint64_t result = (void *)swift_retain();
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

void *sub_25C607A58()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB640);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C61ED80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v20 = 5 * i;
    uint64_t v21 = *(void *)(v2 + 48) + 8 * v20;
    uint64_t v23 = *(void *)v21;
    uint64_t v22 = *(void *)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    uint64_t v25 = *(void *)(v21 + 24);
    LOBYTE(v21) = *(unsigned char *)(v21 + 32);
    uint64_t v26 = *(void *)(v4 + 48) + 8 * v20;
    *(void *)uint64_t v26 = v23;
    *(void *)(v26 + 8) = v22;
    *(void *)(v26 + 16) = v24;
    *(void *)(v26 + 24) = v25;
    *(unsigned char *)(v26 + 32) = v21;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_25C607C28()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB638);
  uint64_t result = sub_25C61ED90();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
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
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_25C61F040();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    unint64_t v1 = v26;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25C607E88()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351570);
  uint64_t v3 = sub_25C61ED90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25C61F050();
    swift_bridgeObjectRetain();
    sub_25C61E9F0();
    uint64_t result = sub_25C61F080();
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
    BOOL v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *BOOL v28 = v18;
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
    unint64_t v1 = v0;
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

uint64_t sub_25C608134()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB620);
  uint64_t result = sub_25C61ED90();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
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
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    sub_25C61F050();
    sub_25C61F060();
    uint64_t result = sub_25C61F080();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    unint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25C6083B4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB640);
  uint64_t v3 = sub_25C61ED90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v32 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  uint64_t v33 = v2;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    uint64_t v16 = *(void *)(v2 + 48) + 40 * i;
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v16 + 16);
    uint64_t v20 = *(void *)(v16 + 24);
    char v21 = *(unsigned char *)(v16 + 32);
    sub_25C61F050();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25C61E9F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25C61E9F0();
    swift_bridgeObjectRelease();
    sub_25C61F070();
    uint64_t result = sub_25C61F080();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v8 + 8 * (v23 >> 6))) == 0)
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
        uint64_t v29 = *(void *)(v8 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v8 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v8 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = *(void *)(v4 + 48) + 40 * v25;
    *(void *)uint64_t v30 = v17;
    *(void *)(v30 + 8) = v18;
    *(void *)(v30 + 16) = v19;
    *(void *)(v30 + 24) = v20;
    *(unsigned char *)(v30 + 32) = v21;
    ++*(void *)(v4 + 16);
    uint64_t v2 = v33;
    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_36;
    }
    if (v13 >= v32) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v32) {
        goto LABEL_32;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v32) {
          goto LABEL_32;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v32)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
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
    if (v10 >= v32) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_25C6086DC()
{
  OUTLINED_FUNCTION_5_2();
  sub_25C61F050();
  sub_25C61E9F0();
  uint64_t v2 = sub_25C61F080();
  return sub_25C608794(v1, v0, v2);
}

unint64_t sub_25C608750(uint64_t a1)
{
  uint64_t v2 = sub_25C61F040();
  return sub_25C608878(a1, v2);
}

unint64_t sub_25C608794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C61EFB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25C61EFB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C608878(uint64_t a1, uint64_t a2)
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

uint64_t sub_25C608914(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  a4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v11;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C6089AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_25C6086DC();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB630);
  if ((sub_25C61EE70() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25C6086DC();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_25C61EFE0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  int64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_25C608BFC(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25C608AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_25C6086DC();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB628);
  if ((sub_25C61EE70() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_25C6086DC();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_25C61EFE0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  int64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_25C608BFC(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25C608BFC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_25C608C44()
{
  unint64_t result = qword_26A5BB610;
  if (!qword_26A5BB610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB610);
  }
  return result;
}

unint64_t sub_25C608C90()
{
  unint64_t result = qword_26A5BB618;
  if (!qword_26A5BB618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB618);
  }
  return result;
}

uint64_t sub_25C608CDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C608D14(uint64_t a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_25C61EFB0();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_25C61E9E0();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
}

uint64_t sub_25C608E00(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25C608E24, v1, 0);
}

uint64_t sub_25C608E24()
{
  if (*(void *)(*(void *)(v0 + 16) + 112))
  {
    swift_retain();
    uint64_t v1 = sub_25C61E7D0();
    swift_release();
    uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v2(v1);
  }
  else
  {
    sub_25C609294();
    swift_allocError();
    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_25C608F30()
{
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    sub_25C61E7F0();
    swift_release();
  }
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_25C608F88()
{
  sub_25C608F30();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for VectorDBWriteClientManager()
{
  return self;
}

uint64_t sub_25C608FD8()
{
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    sub_25C61E7A0();
    return swift_release();
  }
  else
  {
    sub_25C609294();
    swift_allocError();
    return swift_willThrow();
  }
}

uint64_t sub_25C609044(uint64_t a1)
{
  if (*(void *)(v1 + 112))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B351588);
    uint64_t v5 = sub_25C61E850();
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_25C61FCB0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16))(v3 + v7, a1, v5);
    swift_retain();
    sub_25C61E790();
    if (!v2)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_25C61E7C0();
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C609294();
    swift_allocError();
    swift_willThrow();
  }
  return v3;
}

uint64_t sub_25C6091C8()
{
  return 1;
}

uint64_t sub_25C6091D0()
{
  return sub_25C61F060();
}

uint64_t sub_25C6091F8()
{
  return sub_25C61F080();
}

uint64_t sub_25C609244()
{
  return sub_25C61F080();
}

unint64_t sub_25C609294()
{
  unint64_t result = qword_26B351400;
  if (!qword_26B351400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351400);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VectorDBWriteClientManager.DBWriteClientManagerErrors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for VectorDBWriteClientManager.DBWriteClientManagerErrors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C6093D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C6093F8()
{
  return 0;
}

ValueMetadata *type metadata accessor for VectorDBWriteClientManager.DBWriteClientManagerErrors()
{
  return &type metadata for VectorDBWriteClientManager.DBWriteClientManagerErrors;
}

unint64_t sub_25C609414()
{
  unint64_t result = qword_26A5BB650;
  if (!qword_26A5BB650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB650);
  }
  return result;
}

uint64_t sub_25C609460(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C609474(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25C609488()
{
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  uint64_t result = sub_25C60968C(v0);
  if (!v2)
  {
    if (qword_26B351C40 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C61E9D0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B351C28);
    unsigned int v4 = sub_25C61E9B0();
    os_log_type_t v5 = sub_25C61EBF0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25C5FA000, v4, v5, "Unable to fetch Siri locale", v6, 2u);
      MEMORY[0x26118CA00](v6, -1, -1);
    }

    return 0;
  }
  return result;
}

id sub_25C609594()
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_25C61EA20();
    unsigned int v4 = sub_25C6096FC(v2, v3, v1);

    return (id)(v4 != 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C609604()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 33, 7);
}

uint64_t type metadata accessor for DefaultProfanityPreferenceProvider()
{
  return self;
}

uint64_t sub_25C609660()
{
  *(void *)(v0 + 16) = sub_25C609488();
  *(void *)(v0 + 24) = v1;
  *(unsigned char *)(v0 + 32) = sub_25C609594() & 1;
  return v0;
}

uint64_t sub_25C60968C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C61EA20();

  return v3;
}

id sub_25C6096FC(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = (void *)sub_25C61EA10();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(a3, sel_effectiveBoolValueForSetting_, v4);

  return v5;
}

uint64_t sub_25C609758@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v100 = sub_25C61E8B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v82 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_25C61E900();
  OUTLINED_FUNCTION_0();
  uint64_t v84 = v8;
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t result = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_3;
    }
LABEL_21:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_22:
    *a2 = v14;
    return result;
  }
  uint64_t result = sub_25C61EE90();
  if (!result) {
    goto LABEL_21;
  }
LABEL_3:
  if (result >= 1)
  {
    unint64_t v68 = a2;
    uint64_t v13 = 0;
    unint64_t v79 = a1 & 0xC000000000000001;
    unsigned int v95 = *MEMORY[0x263F84720];
    v99 = (void (**)(void *, void, uint64_t))(v5 + 104);
    unsigned int v98 = *MEMORY[0x263F84740];
    int v78 = *MEMORY[0x263F84728];
    int v77 = *MEMORY[0x263F84748];
    uint64_t v76 = v84 + 32;
    int v75 = *MEMORY[0x263F84718];
    int v74 = *MEMORY[0x263F84738];
    uint64_t v14 = MEMORY[0x263F8EE78];
    long long v73 = xmmword_25C61FCB0;
    long long v72 = xmmword_25C61FEA0;
    unint64_t v71 = 0x800000025C6202F0;
    long long v70 = xmmword_25C61FEB0;
    unint64_t v81 = a1;
    uint64_t v80 = v11;
    uint64_t v69 = result;
    int64_t v15 = v82;
    do
    {
      uint64_t v90 = v13;
      uint64_t v89 = v14;
      if (v79)
      {
        uint64_t v16 = MEMORY[0x26118C320](v13, a1);
      }
      else
      {
        uint64_t v16 = *(void *)(a1 + 8 * v13 + 32);
        swift_retain();
      }
      v102 = (void *)v16;
      OUTLINED_FUNCTION_2();
      uint64_t v17 = *(void *)(v16 + 16);
      uint64_t v18 = *(void *)(v16 + 24);
      uint64_t v88 = v17;
      uint64_t v87 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B351580);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = v73;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_25C61EB50();
      uint64_t v86 = v19;
      *(void *)(v19 + 32) = v20;
      *(void *)(v19 + 40) = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B351590);
      uint64_t v22 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B351518) - 8);
      uint64_t v23 = *(void *)v22;
      uint64_t v96 = *(void *)(*(void *)v22 + 72);
      unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      uint64_t v25 = swift_allocObject();
      uint64_t v85 = v25;
      *(_OWORD *)(v25 + 16) = v72;
      unint64_t v26 = v25 + v24;
      unint64_t v27 = (void *)(v26 + v22[14]);
      *int64_t v15 = 0;
      v15[1] = 0;
      uint64_t v28 = v100;
      v101 = *v99;
      uint64_t v29 = v95;
      v101(v15, v95, v100);
      unint64_t v30 = v26;
      unint64_t v94 = v26;
      sub_25C61E890();
      uint64_t v31 = v102[3];
      *unint64_t v27 = v102[2];
      v27[1] = v31;
      uint64_t v32 = sub_25C61E8C0();
      uint64_t v33 = *(void *)(v32 - 8);
      uint64_t v92 = *(void (**)(void))(v33 + 104);
      uint64_t v93 = v33 + 104;
      uint64_t v91 = v32;
      ((void (*)(void *, void, uint64_t))v92)(v27, v98, v32);
      uint64_t v34 = v96;
      uint64_t v35 = v22[14];
      v97 = v22;
      uint64_t v36 = (void *)(v30 + v96 + v35);
      *int64_t v15 = 0;
      v15[1] = 0;
      BOOL v37 = v101;
      v101(v15, v29, v28);
      swift_bridgeObjectRetain();
      sub_25C61E890();
      uint64_t v38 = v102[7];
      *uint64_t v36 = v102[6];
      v36[1] = v38;
      uint64_t v39 = v92;
      OUTLINED_FUNCTION_2_2();
      v39();
      uint64_t v40 = (void *)(v94 + 2 * v34 + v22[14]);
      *int64_t v15 = 0;
      v15[1] = 0;
      v37(v15, v95, v100);
      swift_bridgeObjectRetain();
      sub_25C61E890();
      uint64_t v41 = *(void *)((char *)v102 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8);
      void *v40 = *(void *)((char *)v102 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
      v40[1] = v41;
      OUTLINED_FUNCTION_2_2();
      v39();
      uint64_t v42 = 3 * v34;
      unint64_t v43 = v94;
      char v44 = (uint64_t *)(v94 + v42 + v97[14]);
      *int64_t v15 = 0;
      v15[1] = 0;
      OUTLINED_FUNCTION_3_3();
      v45();
      swift_bridgeObjectRetain();
      sub_25C61E890();
      *char v44 = sub_25C61E740();
      v44[1] = v46;
      uint64_t v47 = v92;
      OUTLINED_FUNCTION_2_2();
      v47();
      uint64_t v48 = v96;
      uint64_t v49 = (void *)(v43 + 4 * v96 + v97[14]);
      *int64_t v15 = 0;
      *((unsigned char *)v15 + 8) = 1;
      OUTLINED_FUNCTION_3_3();
      v50();
      sub_25C61E890();
      *uint64_t v49 = *((unsigned __int8 *)v102 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) + 1;
      OUTLINED_FUNCTION_2_2();
      v47();
      unint64_t v51 = v43 + 5 * v48;
      *int64_t v15 = 0;
      *((unsigned char *)v15 + 8) = 0;
      uint64_t v52 = (void (*)(void))v101;
      OUTLINED_FUNCTION_3_3();
      v52();
      sub_25C61E890();
      char v53 = (double *)((char *)v102 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore);
      OUTLINED_FUNCTION_2();
      double v54 = *v53;
      if (*((unsigned char *)v53 + 8)) {
        double v54 = 0.0;
      }
      uint64_t v55 = v97;
      *(double *)(v51 + v97[14]) = v54;
      v47();
      unint64_t v56 = v43 + 6 * v96;
      *(_OWORD *)int64_t v15 = v70;
      OUTLINED_FUNCTION_3_3();
      v52();
      char v57 = v102;
      sub_25C61E890();
      char v58 = (void *)((char *)v57 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
      OUTLINED_FUNCTION_2();
      uint64_t v59 = *v58;
      unint64_t v60 = v58[1];
      if (!v60) {
        uint64_t v59 = 0;
      }
      unint64_t v61 = 0xE000000000000000;
      if (v60) {
        unint64_t v61 = v60;
      }
      char v62 = (void *)(v56 + v55[14]);
      *char v62 = v59;
      v62[1] = v61;
      v47();
      sub_25C61E8A0();
      sub_25C60ABFC();
      swift_bridgeObjectRetain();
      sub_25C61E9E0();
      sub_25C5FDE60();
      unint64_t v63 = v80;
      sub_25C61E8E0();
      uint64_t v14 = v89;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_25C602ECC(0, *(void *)(v14 + 16) + 1, 1, v14);
      }
      uint64_t v64 = v69;
      unint64_t v66 = *(void *)(v14 + 16);
      unint64_t v65 = *(void *)(v14 + 24);
      a1 = v81;
      uint64_t v67 = v90;
      if (v66 >= v65 >> 1) {
        uint64_t v14 = sub_25C602ECC(v65 > 1, v66 + 1, 1, v14);
      }
      uint64_t v13 = v67 + 1;
      *(void *)(v14 + 16) = v66 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v84 + 32))(v14+ ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80))+ *(void *)(v84 + 72) * v66, v63, v83);
      swift_release();
    }
    while (v64 != v13);
    uint64_t result = swift_bridgeObjectRelease();
    a2 = v68;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C60A0E8(unint64_t a1)
{
  id v2 = v1;
  unint64_t v10 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    unint64_t v8 = MEMORY[0x263F8EE78];
LABEL_15:
    swift_retain();
    unint64_t v9 = sub_25C60A2AC(v8, v2);
    swift_release();
    swift_beginAccess();
    sub_25C60A5F8(v9);
    swift_endAccess();
    return swift_retain();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C61EE90();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x26118C320](i, a1);
      }
      else {
        swift_retain();
      }
      OUTLINED_FUNCTION_2();
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25C61EA60();
      swift_bridgeObjectRelease();
      if (v7 <= 500)
      {
        sub_25C61EE20();
        sub_25C61EE50();
        sub_25C61EE60();
        sub_25C61EE30();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v8 = v10;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C60A2AC(unint64_t a1, uint64_t *a2)
{
  unint64_t v3 = a1;
  uint64_t v22 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_25C61EE90())
  {
    unint64_t v20 = v3 & 0xC000000000000001;
    a2 += 3;
    swift_beginAccess();
    uint64_t v5 = 4;
    unint64_t v19 = v3;
    while (1)
    {
      if (v20) {
        MEMORY[0x26118C320](v5 - 4, v3);
      }
      else {
        swift_retain();
      }
      uint64_t v6 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v7 = *a2;
      swift_beginAccess();
      sub_25C5FDE14();
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25C61EC60();
      sub_25C601284(v8, v9, v7);
      unint64_t v10 = a2;
      char v12 = v11;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_release();
        a2 = v10;
      }
      else
      {
        uint64_t v13 = sub_25C61EC60();
        uint64_t v15 = v14;
        swift_beginAccess();
        sub_25C605A60(&v21, v13, v15);
        swift_endAccess();
        uint64_t v16 = swift_bridgeObjectRelease();
        MEMORY[0x26118C050](v16);
        a2 = v10;
        if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C61EB70();
        }
        sub_25C61EB90();
        sub_25C61EB60();
      }
      ++v5;
      unint64_t v3 = v19;
      if (v6 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = v22;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_release();
  return v17;
}

uint64_t sub_25C60A520@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_2();
  unint64_t v2 = swift_bridgeObjectRetain();
  return sub_25C609758(v2, a1);
}

uint64_t VectorSearchAssets.Builder.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t VectorSearchAssets.Builder.__deallocating_deinit()
{
  VectorSearchAssets.Builder.deinit();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t static VectorSearchAssets.builder()()
{
  type metadata accessor for VectorSearchAssets.Builder();
  uint64_t result = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE88];
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *(void *)(result + 24) = v1;
  return result;
}

uint64_t sub_25C60A5F8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C61EE90();
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
    uint64_t v5 = sub_25C61EE90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
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
    unint64_t v4 = MEMORY[0x26118C330](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_25C60A8A0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C61EE90();
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
  return sub_25C61EB60();
}

void sub_25C60A7C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
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
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_25C603118(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_25C6189EC(a1 + 32, v2, v3 + 24 * v10 + 32);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *(void *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_25C60A8A0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C61EE90();
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
      uint64_t v8 = sub_25C61EE90();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25C60AC4C();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B351750);
            uint64_t v10 = sub_25C60AA30(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
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
        sub_25C618814((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10));
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

void (*sub_25C60AA30(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_25C60AAE0(v6, a2, a3);
  return sub_25C60AA98;
}

void sub_25C60AA98(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_25C60AAE0(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_25C61941C(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x26118C320](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return sub_25C60AB60;
}

uint64_t sub_25C60AB60()
{
  return swift_release();
}

uint64_t type metadata accessor for VectorSearchAssets.Builder()
{
  return self;
}

ValueMetadata *type metadata accessor for VectorSearchAssets()
{
  return &type metadata for VectorSearchAssets;
}

uint64_t method lookup function for VectorSearchAssets.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VectorSearchAssets.Builder);
}

uint64_t dispatch thunk of VectorSearchAssets.Builder.withPhrases(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of VectorSearchAssets.Builder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

unint64_t sub_25C60ABFC()
{
  unint64_t result = qword_26B351510;
  if (!qword_26B351510)
  {
    sub_25C61E8A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351510);
  }
  return result;
}

unint64_t sub_25C60AC4C()
{
  unint64_t result = qword_26A5BB658;
  if (!qword_26A5BB658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B351750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5BB658);
  }
  return result;
}

uint64_t sub_25C60ACB8()
{
  OUTLINED_FUNCTION_5_3();
  v1[28] = v2;
  v1[29] = v0;
  v1[26] = v3;
  v1[27] = v4;
  uint64_t v5 = sub_25C61E600();
  v1[30] = v5;
  v1[31] = *(void *)(v5 - 8);
  v1[32] = swift_task_alloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C60AD74()
{
  v0[18] = v0[26];
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[27];
  v0[22] = MEMORY[0x263F8EE78];
  v0[19] = v2;
  sub_25C61E5F0();
  sub_25C5FDE14();
  v0[33] = sub_25C61EC40();
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 8);
  uint64_t v4 = OUTLINED_FUNCTION_12_1();
  v3(v4);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C61EA60();
  BOOL v8 = __OFSUB__(v5, 1);
  uint64_t v9 = (uint64_t (*)())(v5 - 1);
  if (v8)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v0[28];
    uint64_t v11 = sub_25C60BCB4((uint64_t)v9);
    uint64_t v12 = MEMORY[0x26118BF70](v11);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    v0[20] = v12;
    v0[21] = v14;
    sub_25C61E5F0();
    v0[34] = sub_25C61EC70();
    v0[35] = v15;
    uint64_t v16 = OUTLINED_FUNCTION_12_1();
    v3(v16);
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_25C60AED8;
    uint64_t v6 = v10;
    uint64_t v7 = 0;
  }
  return MEMORY[0x270FA2498](v9, v6, v7);
}

uint64_t sub_25C60AED8()
{
  OUTLINED_FUNCTION_5_3();
  *(void *)(v0 + 288) = sub_25C604B38();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C60AF40()
{
  unint64_t v19 = v0;
  unint64_t v1 = v0[36];
  if (!v1) {
    goto LABEL_10;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C61EE90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C61E9D0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B3515A8);
    uint64_t v4 = sub_25C61E9B0();
    os_log_type_t v5 = sub_25C61EBE0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25C5FA000, v4, v5, "Typo recovery using all matched results leading up to current query", v6, 2u);
      OUTLINED_FUNCTION_20();
    }
    uint64_t v7 = v0[28];

    BOOL v8 = sub_25C60B23C;
    uint64_t v9 = v7;
  }
  else
  {
LABEL_10:
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25C61E9D0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B3515A8);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_25C61E9B0();
    os_log_type_t v12 = sub_25C61EBE0();
    BOOL v13 = os_log_type_enabled(v11, v12);
    unint64_t v14 = v0[35];
    if (v13)
    {
      uint64_t v15 = v0[34];
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      v0[25] = sub_25C618C00(v15, v14, &v18);
      sub_25C61EC20();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5FA000, v11, v12, "Typo recovery using previous query \"%s\" close matches", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v9 = v0[28];
    BOOL v8 = sub_25C60B730;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_25C60B23C()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C605098();
  *(void *)(v0 + 296) = v1;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_25C60B2A4()
{
  uint64_t v52 = v0;
  sub_25C60BD74(500, *(void *)(v0 + 296), v0 + 16);
  unint64_t v1 = sub_25C60D384(v0 + 16);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 16);
  *(unsigned char *)(v0 + 112) = *(unsigned char *)(v0 + 32);
  sub_25C60D678(v0 + 96);
  *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 40);
  *(unsigned char *)(v0 + 136) = *(unsigned char *)(v0 + 56);
  sub_25C60D678(v0 + 120);
  *(void *)(v0 + 192) = *(void *)(v0 + 64);
  uint64_t v2 = v0 + 192;
  sub_25C60D6B8(v0 + 192);
  uint64_t v3 = sub_25C61EA60();
  int64_t v4 = 21 * v3;
  if ((unsigned __int128)(v3 * (__int128)21) >> 64 == (21 * v3) >> 63)
  {
    int64_t v45 = (void *)(v0 + 184);
    *(void *)(v0 + 184) = MEMORY[0x263F8EE78];
    if (!(v1 >> 62))
    {
      uint64_t v48 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  else
  {
LABEL_30:
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_25C61EE90();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v48)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (void *)(v2 - 16);
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    int v41 = 136315394;
    uint64_t v40 = MEMORY[0x263F8EE58] + 8;
    long long v38 = xmmword_25C61FF30;
    uint64_t v47 = v4 / 100;
    int64_t v4 = v1 & 0xC000000000000001;
    unint64_t v43 = v1;
    uint64_t v44 = v0;
    unint64_t v42 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v4)
      {
        uint64_t v7 = MEMORY[0x26118C320](v5, v1);
      }
      else
      {
        uint64_t v7 = *(void *)(v1 + 8 * v5 + 32);
        swift_retain();
      }
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      uint64_t v50 = v5 + 1;
      uint64_t v8 = *(void *)(v0 + 264);
      uint64_t v2 = sub_25C5FDD94();
      uint64_t v9 = sub_25C60C17C(v8, v2, v47);
      swift_bridgeObjectRelease();
      if (v47 < v9) {
        goto LABEL_24;
      }
      uint64_t v49 = v9;
      if (qword_26B3515D8[0] != -1) {
        swift_once();
      }
      uint64_t v10 = sub_25C61E9D0();
      __swift_project_value_buffer(v10, (uint64_t)qword_26B3515A8);
      swift_retain();
      uint64_t v11 = sub_25C61E9B0();
      os_log_type_t v12 = sub_25C61EBE0();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        OUTLINED_FUNCTION_3_4(v14, v15, v16, v17, v18, v19, v20, v21, v38, *((uint64_t *)&v38 + 1), v39, v40, v41);
        uint64_t v23 = *(void *)(v7 + 16);
        unint64_t v22 = *(void *)(v7 + 24);
        swift_bridgeObjectRetain();
        *(void *)(v13 + 4) = sub_25C618C00(v23, v22, &v51);
        swift_bridgeObjectRelease();
        swift_release();
        *(_WORD *)(v13 + 12) = 2048;
        *(void *)(v13 + 14) = v49;
        _os_log_impl(&dword_25C5FA000, v11, v12, "Found phrase within fuzzyDistance threshold. Phrase: %s => EditDistance: %ld", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        unint64_t v1 = v43;
        uint64_t v0 = v44;
        OUTLINED_FUNCTION_20();
        int64_t v4 = v42;
        OUTLINED_FUNCTION_20();
      }
      else
      {
        swift_release();
      }

      uint64_t v24 = swift_retain();
      MEMORY[0x26118C050](v24);
      unint64_t v25 = *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v25 >> 1)
      {
        OUTLINED_FUNCTION_4_3(v25);
        sub_25C61EB70();
      }
      uint64_t v2 = (uint64_t)v6;
      sub_25C61EB90();
      sub_25C61EB60();
      if (v49 >= v46) {
        break;
      }
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB668);
      uint64_t v26 = swift_allocObject();
      OUTLINED_FUNCTION_11_1(v26, v27, v28, v29, v30, v31, v32, v33, v38);
      *int64_t v45 = v51;
      uint64_t v46 = v49;
LABEL_25:
      ++v5;
      if (v50 == v48) {
        goto LABEL_26;
      }
    }
    if (v49 == v46)
    {
      uint64_t v34 = swift_retain();
      MEMORY[0x26118C050](v34);
      unint64_t v35 = *(void *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v35 >> 1)
      {
        OUTLINED_FUNCTION_4_3(v35);
        sub_25C61EB70();
      }
      uint64_t v2 = (uint64_t)v45;
      sub_25C61EB90();
      sub_25C61EB60();
    }
LABEL_24:
    swift_release();
    goto LABEL_25;
  }
LABEL_26:
  uint64_t v36 = *(void *)(v0 + 224);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 312) = *(void *)(v0 + 176);
  return MEMORY[0x270FA2498](sub_25C60BBDC, v36, 0);
}

uint64_t sub_25C60B730()
{
  OUTLINED_FUNCTION_5_3();
  *(void *)(v0 + 304) = sub_25C604DD8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C60B7A4()
{
  unint64_t v56 = v0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  if (v0[38]) {
    unint64_t v2 = v0[38];
  }
  else {
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  uint64_t v3 = sub_25C61EA60();
  uint64_t v4 = 21 * v3;
  if ((unsigned __int128)(v3 * (__int128)21) >> 64 != (21 * v3) >> 63)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C61EE90();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
  uint64_t v51 = v0 + 23;
  v0[23] = v1;
  if (v2 >> 62) {
    goto LABEL_31;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_7:
    uint64_t v6 = 0;
    unint64_t v7 = v2 & 0xC000000000000001;
    uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    int v46 = 136315394;
    uint64_t v45 = MEMORY[0x263F8EE58] + 8;
    long long v43 = xmmword_25C61FF30;
    uint64_t v53 = v4 / 100;
    uint64_t v4 = (uint64_t)(v0 + 22);
    unint64_t v50 = v2 & 0xC000000000000001;
    while (1)
    {
      if (v7)
      {
        uint64_t v8 = MEMORY[0x26118C320](v6, v2);
      }
      else
      {
        uint64_t v8 = *(void *)(v2 + 8 * v6 + 32);
        swift_retain();
      }
      if (__OFADD__(v6, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      uint64_t v54 = v6 + 1;
      uint64_t v9 = v0[33];
      uint64_t v10 = sub_25C5FDD94();
      uint64_t v11 = sub_25C60C17C(v9, v10, v53);
      swift_bridgeObjectRelease();
      if (v53 < v11) {
        goto LABEL_26;
      }
      if (qword_26B3515D8[0] != -1) {
        swift_once();
      }
      uint64_t v12 = sub_25C61E9D0();
      __swift_project_value_buffer(v12, (uint64_t)qword_26B3515A8);
      swift_retain();
      uint64_t v13 = sub_25C61E9B0();
      os_log_type_t v14 = sub_25C61EBE0();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v48 = v11;
        uint64_t v15 = swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        OUTLINED_FUNCTION_3_4(v49, v16, v17, v18, v19, v20, v21, v22, v43, *((uint64_t *)&v43 + 1), v44, v45, v46);
        uint64_t v47 = v13;
        uint64_t v23 = v4;
        uint64_t v24 = v5;
        unint64_t v25 = v2;
        uint64_t v26 = *(void *)(v8 + 16);
        unint64_t v27 = *(void *)(v8 + 24);
        swift_bridgeObjectRetain();
        uint64_t v28 = v26;
        unint64_t v2 = v25;
        uint64_t v5 = v24;
        uint64_t v4 = v23;
        *(void *)(v15 + 4) = sub_25C618C00(v28, v27, &v55);
        swift_bridgeObjectRelease();
        swift_release();
        *(_WORD *)(v15 + 12) = 2048;
        uint64_t v13 = v47;
        uint64_t v11 = v48;
        *(void *)(v15 + 14) = v48;
        _os_log_impl(&dword_25C5FA000, v47, v14, "Found phrase within fuzzyDistance threshold. Phrase: %s => EditDistance: %ld", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_20();
      }
      else
      {
        swift_release();
      }

      uint64_t v29 = swift_retain();
      MEMORY[0x26118C050](v29);
      unint64_t v30 = *(void *)((*(void *)v4 & 0xFFFFFFFFFFFFFF8) + 0x18);
      unint64_t v7 = v50;
      if (*(void *)((*(void *)v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v30 >> 1)
      {
        OUTLINED_FUNCTION_4_3(v30);
        sub_25C61EB70();
      }
      sub_25C61EB90();
      sub_25C61EB60();
      if (v11 >= v52) {
        break;
      }
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB668);
      uint64_t v31 = swift_allocObject();
      OUTLINED_FUNCTION_11_1(v31, v32, v33, v34, v35, v36, v37, v38, v43);
      *uint64_t v51 = v55;
      uint64_t v52 = v11;
LABEL_27:
      ++v6;
      if (v54 == v5) {
        goto LABEL_32;
      }
    }
    if (v11 == v52)
    {
      uint64_t v39 = swift_retain();
      MEMORY[0x26118C050](v39);
      unint64_t v40 = *(void *)((*v51 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)((*v51 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v40 >> 1)
      {
        OUTLINED_FUNCTION_4_3(v40);
        sub_25C61EB70();
      }
      sub_25C61EB90();
      sub_25C61EB60();
    }
LABEL_26:
    swift_release();
    goto LABEL_27;
  }
LABEL_32:
  uint64_t v41 = v0[28];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[39] = v0[22];
  return MEMORY[0x270FA2498](sub_25C60BBDC, v41, 0);
}

uint64_t sub_25C60BBDC()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C604D5C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_25C60BC50()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = *(void *)(v0 + 184);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25C60BCB4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25C61EA70();
    uint64_t v1 = sub_25C61EAF0();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t sub_25C60BD74@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    unint64_t v34 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = sub_25C61ECB0();
      uint64_t v7 = v6;
      char v8 = 1;
    }
    else
    {
      uint64_t v5 = sub_25C60E45C(a2);
      uint64_t v7 = v9;
      char v8 = v10 & 1;
    }
    uint64_t v11 = sub_25C60DB28(a2);
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    uint64_t v32 = sub_25C60DD08(v5, v7, v8, v4, v11, v12, v14 & 1, a2);
    uint64_t v17 = v16;
    char v19 = v18;
    int v20 = ~v18;
    sub_25C60D6AC(v11, v13, v15);
    sub_25C60D6AC(v5, v7, v8);
    if (v20)
    {
      uint64_t v21 = v32;
    }
    else
    {
      uint64_t v21 = sub_25C60DB28(a2);
      uint64_t v17 = v22;
      char v19 = v23;
    }
    int v24 = v19 & 1;
    if (v34)
    {
      uint64_t v25 = sub_25C61ECB0();
      uint64_t v27 = v26;
      char v28 = 1;
    }
    else
    {
      uint64_t v25 = sub_25C60E45C(a2);
      uint64_t v27 = v29;
      char v28 = v30 & 1;
    }
    unint64_t result = sub_25C60D320(v25, v27, v28, v21, v17, v24);
    if (result)
    {
      v37[0] = v25;
      v37[1] = v27;
      char v38 = v28;
      uint64_t v39 = v21;
      uint64_t v40 = v17;
      BOOL v41 = v24 != 0;
      sub_25C60DB7C((uint64_t)v37, a2, (uint64_t)v35);
      swift_bridgeObjectRelease();
      sub_25C60D6AC(v25, v27, v28);
      unint64_t result = sub_25C60D6AC(v21, v17, v24);
      long long v31 = v35[1];
      *(_OWORD *)a3 = v35[0];
      *(_OWORD *)(a3 + 16) = v31;
      *(_OWORD *)(a3 + 32) = v35[2];
      *(void *)(a3 + 48) = v36;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C60BF6C(uint64_t a1, unint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C61EE90();
  swift_bridgeObjectRelease();
LABEL_4:
  uint64_t result = sub_25C60D6E4(0, v3, v5);
  if (v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = result;
  }
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C61EE90();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 < 0)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C61EE90();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    type metadata accessor for AutoCompletePhrase();
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      sub_25C61EDE0();
      uint64_t v11 = v12;
    }
    while (v8 != v12);
  }
  if (!v4) {
    return v2 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_25C61EEA0();
  swift_bridgeObjectRelease_n();
  return v13;
}

uint64_t sub_25C60C10C(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_25C60D6E4(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_25C60C17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    char v7 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v9 = *(v6 - 1);
      uint64_t v8 = *v6;
      uint64_t v10 = HIBYTE(*v6) & 0xF;
      if ((*v6 & 0x2000000000000000) == 0) {
        uint64_t v10 = v9 & 0xFFFFFFFFFFFFLL;
      }
      if (v10)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v195 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_13_1(v7[2]);
          char v7 = v195;
        }
        unint64_t v13 = v7[2];
        unint64_t v12 = v7[3];
        if (v13 >= v12 >> 1)
        {
          unint64_t v3 = (unint64_t)&v195;
          sub_25C619440((char *)(v12 > 1), v13 + 1, 1);
          char v7 = v195;
        }
        v7[2] = v13 + 1;
        char v14 = &v7[2 * v13];
        v14[4] = v9;
        v14[5] = v8;
      }
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(a2 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = (uint64_t *)(a2 + 40);
    uint64_t v17 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v19 = *(v16 - 1);
      uint64_t v18 = *v16;
      OUTLINED_FUNCTION_23_0();
      if (v20)
      {
        swift_bridgeObjectRetain();
        char v21 = swift_isUniquelyReferenced_nonNull_native();
        v195 = v17;
        if ((v21 & 1) == 0)
        {
          OUTLINED_FUNCTION_13_1(v17[2]);
          uint64_t v17 = v195;
        }
        unint64_t v22 = v17[2];
        char v23 = v17;
        if (v22 >= v17[3] >> 1)
        {
          OUTLINED_FUNCTION_21_0();
          char v23 = v195;
        }
        v23[2] = v22 + 1;
        int v24 = &v23[2 * v22];
        v24[4] = v19;
        v24[5] = v18;
        uint64_t v17 = v23;
      }
      v16 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v25 = (void *)sub_25C61E9E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5B0);
  uint64_t v26 = sub_25C61E9E0();
  v181 = v7;
  v189 = v17;
  uint64_t v180 = v7[2];
  if (!v180)
  {
    char v28 = (void *)MEMORY[0x263F8EE88];
    if (-v25[2] <= a3)
    {
      uint64_t v77 = 0;
      goto LABEL_101;
    }
    goto LABEL_99;
  }
  uint64_t v193 = v17[2];
  v184 = v7 + 4;
  v190 = v17 + 4;
  swift_retain();
  unint64_t v27 = 0;
  char v28 = (void *)MEMORY[0x263F8EE88];
  uint64_t v187 = v26;
  do
  {
    if (v27 >= v7[2])
    {
LABEL_250:
      __break(1u);
LABEL_251:
      __break(1u);
LABEL_252:
      __break(1u);
LABEL_253:
      __break(1u);
LABEL_254:
      __break(1u);
LABEL_255:
      __break(1u);
LABEL_256:
      __break(1u);
LABEL_257:
      __break(1u);
LABEL_258:
      __break(1u);
LABEL_259:
      __break(1u);
LABEL_260:
      __break(1u);
LABEL_261:
      __break(1u);
LABEL_262:
      __break(1u);
LABEL_263:
      __break(1u);
LABEL_264:
      __break(1u);
LABEL_265:
      __break(1u);
LABEL_266:
      __break(1u);
LABEL_267:
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_268:
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_269:
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_270;
    }
    if (!v193) {
      goto LABEL_61;
    }
    uint64_t v29 = &v184[2 * v27];
    long long v31 = (void *)*v29;
    uint64_t v30 = v29[1];
    swift_bridgeObjectRetain();
    swift_retain();
    for (unint64_t i = 0; i != v193; ++i)
    {
      if (i >= v17[2])
      {
        __break(1u);
        goto LABEL_237;
      }
      uint64_t v33 = &v190[2 * i];
      unint64_t v3 = *v33;
      unint64_t v34 = v33[1];
      if (v28[2])
      {
        uint64_t v35 = sub_25C61F040();
        uint64_t v36 = -1 << *((unsigned char *)v28 + 32);
        unint64_t v37 = v35 & ~v36;
        if ((*(void *)((char *)v28 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v37))
        {
          uint64_t v38 = v28[6];
          if (*(void *)(v38 + 8 * v37) == i) {
            continue;
          }
          uint64_t v39 = ~v36;
          while (1)
          {
            unint64_t v37 = (v37 + 1) & v39;
            if (((*(void *)((char *)v28 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v37) & 1) == 0) {
              break;
            }
            if (*(void *)(v38 + 8 * v37) == i) {
              goto LABEL_59;
            }
          }
        }
      }
      BOOL v40 = (void *)v3 == v31 && v34 == v30;
      if (v40 || (sub_25C61EFB0() & 1) != 0)
      {
        uint64_t v41 = sub_25C61F040();
        uint64_t v42 = -1 << *((unsigned char *)v28 + 32);
        unint64_t v43 = v41 & ~v42;
        if (((*(void *)((char *)v28 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v43) & 1) == 0) {
          goto LABEL_49;
        }
        uint64_t v44 = v28[6];
        if (*(void *)(v44 + 8 * v43) != i)
        {
          uint64_t v45 = ~v42;
          while (1)
          {
            unint64_t v43 = (v43 + 1) & v45;
            if (((*(void *)((char *)v28 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v43) & 1) == 0) {
              break;
            }
            if (*(void *)(v44 + 8 * v43) == i) {
              goto LABEL_50;
            }
          }
LABEL_49:
          char v46 = swift_isUniquelyReferenced_nonNull_native();
          v195 = v28;
          sub_25C606ECC(i, v43, v46);
          char v28 = v195;
          swift_bridgeObjectRelease();
        }
LABEL_50:
        swift_isUniquelyReferenced_nonNull_native();
        v195 = v25;
        unint64_t v47 = sub_25C608750(v27);
        if (!__OFADD__(v25[2], (v48 & 1) == 0))
        {
          unint64_t v49 = v47;
          char v50 = v48;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB680);
          unint64_t v3 = (unint64_t)&v195;
          if (sub_25C61EE70())
          {
            unint64_t v3 = (unint64_t)v195;
            unint64_t v51 = sub_25C608750(v27);
            if ((v50 & 1) != (v52 & 1)) {
              goto LABEL_271;
            }
            unint64_t v49 = v51;
          }
          uint64_t v25 = v195;
          if (v50)
          {
            *(void *)(v195[7] + 8 * v49) = 0;
          }
          else
          {
            v195[(v49 >> 6) + 8] |= 1 << v49;
            *(void *)(v25[6] + 8 * v49) = v27;
            *(void *)(v25[7] + 8 * v49) = 0;
            uint64_t v53 = v25[2];
            BOOL v54 = __OFADD__(v53, 1);
            uint64_t v55 = v53 + 1;
            if (v54) {
              goto LABEL_244;
            }
            v25[2] = v55;
          }
          swift_bridgeObjectRelease();
          uint64_t v17 = v189;
          continue;
        }
        __break(1u);
LABEL_241:
        __break(1u);
LABEL_242:
        __break(1u);
LABEL_243:
        __break(1u);
LABEL_244:
        __break(1u);
LABEL_245:
        __break(1u);
LABEL_246:
        swift_bridgeObjectRelease();
        swift_release_n();
        swift_release();
        if (!v172)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v171;
        }
LABEL_270:
        __break(1u);
        while (1)
        {
LABEL_271:
          sub_25C61EFE0();
          __break(1u);
        }
      }
LABEL_59:
      ;
    }
    swift_bridgeObjectRelease();
    swift_release();
    char v7 = v181;
    uint64_t v26 = v187;
LABEL_61:
    ++v27;
  }
  while (v27 != v180);
  swift_release();
  if (v7[2] - v25[2] > a3)
  {
LABEL_99:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return a3 + 1;
  }
  uint64_t v177 = v7[2];
  swift_retain();
  for (unint64_t j = 0; j != v180; ++j)
  {
    if (j >= v7[2]) {
      goto LABEL_254;
    }
    uint64_t v57 = &v184[2 * j];
    unint64_t v59 = *v57;
    unint64_t v58 = v57[1];
    uint64_t v60 = *(void *)(v26 + 16);
    swift_bridgeObjectRetain();
    if (v60 && (OUTLINED_FUNCTION_18_0(), (v61 & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_25C61EA60();
      if (v62)
      {
        uint64_t v63 = v62;
        if (v62 < 1)
        {
          uint64_t v64 = (void *)MEMORY[0x263F8EE78];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515A0);
          uint64_t v64 = (void *)swift_allocObject();
          _swift_stdlib_malloc_size(v64);
          OUTLINED_FUNCTION_19_0();
          v64[2] = v63;
          v64[3] = v65;
        }
        OUTLINED_FUNCTION_23_0();
        v195 = (void *)v59;
        unint64_t v196 = v58;
        uint64_t v197 = 0;
        uint64_t v198 = v66;
        swift_bridgeObjectRetain();
        do
        {
          if ((v63 & ~(v63 >> 63)) == 0) {
            goto LABEL_243;
          }
          unint64_t v3 = (unint64_t)&v195;
          uint64_t v67 = sub_25C61EAA0();
          if (!v68) {
            goto LABEL_269;
          }
          OUTLINED_FUNCTION_15_0(v67, v68, v64 + 4);
        }
        while (!v40);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v64 = (void *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      if (v64[2])
      {
        OUTLINED_FUNCTION_7_2(MEMORY[0x263F8EE78]);
        uint64_t v69 = v195;
        do
        {
          OUTLINED_FUNCTION_6_2();
          if (v59 >= v3 >> 1)
          {
            OUTLINED_FUNCTION_10_1();
            uint64_t v69 = v195;
          }
          OUTLINED_FUNCTION_8_2();
        }
        while (!v40);
        swift_release();
      }
      else
      {
        swift_release();
        uint64_t v69 = (void *)MEMORY[0x263F8EE78];
      }
      swift_isUniquelyReferenced_nonNull_native();
      v195 = (void *)v26;
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_22_0();
      if (v54) {
        goto LABEL_258;
      }
      unint64_t v72 = v70;
      char v73 = v71;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB678);
      uint64_t v17 = v189;
      if (OUTLINED_FUNCTION_16_0())
      {
        unint64_t v3 = (unint64_t)v195;
        unint64_t v74 = sub_25C6086DC();
        if ((v73 & 1) != (v75 & 1)) {
          goto LABEL_271;
        }
        unint64_t v72 = v74;
      }
      uint64_t v26 = (uint64_t)v195;
      if (v73)
      {
        unint64_t v3 = v195[7];
        swift_bridgeObjectRelease();
        *(void *)(v3 + 8 * v72) = v69;
      }
      else
      {
        OUTLINED_FUNCTION_0_4();
        if (v54) {
          goto LABEL_261;
        }
        *(void *)(v26 + 16) = v76;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v7 = v181;
    }
  }
  swift_release();
  uint64_t v77 = v177;
LABEL_101:
  uint64_t v182 = v17[2];
  if (v182)
  {
    uint64_t v178 = v77;
    v185 = v17 + 4;
    swift_retain();
    for (unint64_t k = 0; k != v182; ++k)
    {
      if (k >= v17[2]) {
        goto LABEL_253;
      }
      uint64_t v80 = &v185[2 * k];
      unint64_t v82 = *v80;
      unint64_t v81 = v80[1];
      uint64_t v83 = *(void *)(v26 + 16);
      swift_bridgeObjectRetain();
      if (v83 && (OUTLINED_FUNCTION_18_0(), (v84 & 1) != 0))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v85 = sub_25C61EA60();
        if (v85)
        {
          uint64_t v86 = v85;
          if (v85 < 1)
          {
            uint64_t v89 = (void *)MEMORY[0x263F8EE78];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515A0);
            uint64_t v87 = (void *)swift_allocObject();
            _swift_stdlib_malloc_size(v87);
            OUTLINED_FUNCTION_19_0();
            v87[2] = v86;
            v87[3] = v88;
            uint64_t v89 = v87;
          }
          uint64_t v91 = HIBYTE(v81) & 0xF;
          if ((v81 & 0x2000000000000000) == 0) {
            uint64_t v91 = v82 & 0xFFFFFFFFFFFFLL;
          }
          v195 = (void *)v82;
          unint64_t v196 = v81;
          uint64_t v197 = 0;
          uint64_t v198 = v91;
          swift_bridgeObjectRetain();
          uint64_t v90 = v89;
          do
          {
            if ((v86 & ~(v86 >> 63)) == 0) {
              goto LABEL_242;
            }
            unint64_t v3 = (unint64_t)&v195;
            uint64_t v92 = sub_25C61EAA0();
            if (!v93) {
              goto LABEL_268;
            }
            OUTLINED_FUNCTION_15_0(v92, v93, v90 + 4);
          }
          while (!v40);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v90 = (void *)MEMORY[0x263F8EE78];
        }
        unint64_t v191 = k;
        swift_bridgeObjectRelease();
        if (v90[2])
        {
          OUTLINED_FUNCTION_7_2(MEMORY[0x263F8EE78]);
          unint64_t v94 = v195;
          do
          {
            OUTLINED_FUNCTION_6_2();
            if (k >= v3 >> 1)
            {
              OUTLINED_FUNCTION_10_1();
              unint64_t v94 = v195;
            }
            OUTLINED_FUNCTION_8_2();
          }
          while (!v40);
          swift_release();
        }
        else
        {
          swift_release();
          unint64_t v94 = (void *)MEMORY[0x263F8EE78];
        }
        swift_isUniquelyReferenced_nonNull_native();
        v195 = (void *)v26;
        OUTLINED_FUNCTION_18_0();
        OUTLINED_FUNCTION_22_0();
        if (v54) {
          goto LABEL_257;
        }
        unint64_t v97 = v95;
        char v98 = v96;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB678);
        uint64_t v17 = v189;
        if (OUTLINED_FUNCTION_16_0())
        {
          unint64_t v3 = (unint64_t)v195;
          unint64_t v99 = sub_25C6086DC();
          if ((v98 & 1) != (v100 & 1)) {
            goto LABEL_271;
          }
          unint64_t v97 = v99;
        }
        uint64_t v26 = (uint64_t)v195;
        if (v98)
        {
          unint64_t v3 = v195[7];
          swift_bridgeObjectRelease();
          *(void *)(v3 + 8 * v97) = v94;
        }
        else
        {
          OUTLINED_FUNCTION_0_4();
          if (v54) {
            goto LABEL_260;
          }
          *(void *)(v26 + 16) = v101;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v7 = v181;
        unint64_t k = v191;
      }
    }
    swift_release();
    uint64_t v77 = v178;
  }
  if (v180)
  {
    v176 = v17 + 4;
    v102 = v28 + 7;
    uint64_t v171 = a3 + 1;
    BOOL v103 = __OFADD__(a3, 1);
    BOOL v172 = v103;
    uint64_t v173 = v77 - 1;
    swift_retain();
    uint64_t v104 = 0;
    unint64_t v105 = 0;
    uint64_t v188 = v26;
    while (1)
    {
      if (v105 >= v7[2]) {
        goto LABEL_263;
      }
      uint64_t v169 = v104;
      uint64_t v192 = v105;
      if (v25[2])
      {
        OUTLINED_FUNCTION_20_0();
        uint64_t v106 = v192;
        if (v107)
        {
          uint64_t v104 = v169;
          goto LABEL_234;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v175 = sub_25C61EAD0();
      uint64_t v109 = v108;
      uint64_t v110 = sub_25C61EA60();
      if ((unsigned __int128)(v110 * (__int128)51) >> 64 != (51 * v110) >> 63) {
        goto LABEL_264;
      }
      uint64_t v168 = 51 * v110;
      if (!v182)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_226;
      }
      swift_retain();
      unint64_t v111 = 0;
      uint64_t v174 = v109;
      do
      {
        if (v111 >= v17[2])
        {
          __break(1u);
          goto LABEL_250;
        }
        v112 = &v176[2 * v111];
        unint64_t v114 = *v112;
        unint64_t v113 = v112[1];
        if (v28[2])
        {
          uint64_t v115 = sub_25C61F040();
          uint64_t v116 = -1 << *((unsigned char *)v28 + 32);
          unint64_t v117 = v115 & ~v116;
          if ((*(void *)((char *)v102 + ((v117 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v117))
          {
            uint64_t v118 = v28[6];
            if (*(void *)(v118 + 8 * v117) == v111) {
              goto LABEL_223;
            }
            uint64_t v119 = ~v116;
            while (1)
            {
              unint64_t v117 = (v117 + 1) & v119;
              if (((*(void *)((char *)v102 + ((v117 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v117) & 1) == 0) {
                break;
              }
              if (*(void *)(v118 + 8 * v117) == v111) {
                goto LABEL_223;
              }
            }
          }
        }
        if (v25[2] && (unint64_t v120 = sub_25C608750(v192), (v121 & 1) != 0))
        {
          uint64_t v122 = *(void *)(v25[7] + 8 * v120);
          uint64_t v123 = v175;
        }
        else
        {
          uint64_t v122 = a3 + 1;
          uint64_t v123 = v175;
          if (v172) {
            goto LABEL_252;
          }
        }
        unint64_t v183 = v111;
        uint64_t v186 = v122;
        swift_bridgeObjectRetain();
        if (sub_25C61EAD0() == v123 && v124 == v109)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v126 = sub_25C61EFB0();
          swift_bridgeObjectRelease();
          if ((v126 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            uint64_t v127 = sub_25C61EA60();
            if (v127 >= v186) {
              uint64_t v128 = v186;
            }
            else {
              uint64_t v128 = v127;
            }
            swift_isUniquelyReferenced_nonNull_native();
            v195 = v25;
            OUTLINED_FUNCTION_20_0();
            OUTLINED_FUNCTION_14_0();
            if (v54) {
              goto LABEL_259;
            }
            unint64_t v131 = v129;
            char v132 = v130;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB680);
            uint64_t v17 = v189;
            if (OUTLINED_FUNCTION_17_0())
            {
              unint64_t v133 = sub_25C608750(v192);
              if ((v132 & 1) != (v134 & 1)) {
                goto LABEL_271;
              }
              unint64_t v131 = v133;
            }
            uint64_t v25 = v195;
            if ((v132 & 1) == 0)
            {
              OUTLINED_FUNCTION_1_4();
              if (v54) {
                goto LABEL_262;
              }
LABEL_221:
              v25[2] = v135;
              goto LABEL_222;
            }
            goto LABEL_219;
          }
        }
        if (*(void *)(v26 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v136 = sub_25C6086DC();
          uint64_t v179 = MEMORY[0x263F8EE78];
          if (v137)
          {
            uint64_t v179 = *(void *)(*(void *)(v26 + 56) + 8 * v136);
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v179 = MEMORY[0x263F8EE78];
        }
        if (v192 < v173)
        {
          if (*(void *)(v26 + 16))
          {
            unint64_t v138 = sub_25C6086DC();
            if (v139)
            {
              uint64_t v140 = *(void *)(*(void *)(v26 + 56) + 8 * v138);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              goto LABEL_211;
            }
          }
          swift_bridgeObjectRelease();
          goto LABEL_210;
        }
        uint64_t v141 = sub_25C61EA60();
        if (v141)
        {
          uint64_t v142 = v141;
          v194 = sub_25C60D604(v141, 0);
          v195 = (void *)v114;
          uint64_t v143 = HIBYTE(v113) & 0xF;
          if ((v113 & 0x2000000000000000) == 0) {
            uint64_t v143 = v114 & 0xFFFFFFFFFFFFLL;
          }
          unint64_t v196 = v113;
          uint64_t v197 = 0;
          uint64_t v198 = v143;
          uint64_t v144 = v142 & ~(v142 >> 63);
          swift_bridgeObjectRetain();
          uint64_t v145 = 4;
          do
          {
            if (!v144) {
              goto LABEL_241;
            }
            uint64_t v146 = sub_25C61EAA0();
            if (!v147) {
              goto LABEL_267;
            }
            v148 = &v194[v145];
            uint64_t *v148 = v146;
            v148[1] = v147;
            --v144;
            v145 += 2;
            --v142;
          }
          while (v142);
          swift_bridgeObjectRelease();
        }
        else
        {
          v194 = (void *)MEMORY[0x263F8EE78];
        }
        swift_bridgeObjectRelease();
        unint64_t v149 = sub_25C61EA60();
        char v7 = v181;
        if ((v149 & 0x8000000000000000) != 0) {
          goto LABEL_256;
        }
        int64_t v150 = v149;
        if (!v149 || (v151 = v194[2], v151 < v149) && (int64_t v150 = v194[2], !v151))
        {
          swift_release();
LABEL_210:
          uint64_t v140 = MEMORY[0x263F8EE78];
          goto LABEL_211;
        }
        v195 = (void *)MEMORY[0x263F8EE78];
        sub_25C619440(0, v150, 0);
        uint64_t v140 = (uint64_t)v195;
        v152 = v194 + 5;
        do
        {
          if (!v150) {
            goto LABEL_245;
          }
          uint64_t v154 = *(v152 - 1);
          uint64_t v153 = *v152;
          v195 = (void *)v140;
          unint64_t v155 = *(void *)(v140 + 16);
          unint64_t v156 = *(void *)(v140 + 24);
          swift_bridgeObjectRetain();
          if (v155 >= v156 >> 1)
          {
            OUTLINED_FUNCTION_21_0();
            uint64_t v140 = (uint64_t)v195;
          }
          *(void *)(v140 + 16) = v155 + 1;
          uint64_t v157 = v140 + 16 * v155;
          *(void *)(v157 + 32) = v154;
          *(void *)(v157 + 40) = v153;
          v152 += 2;
          --v150;
        }
        while (v150);
        swift_release();
        char v7 = v181;
LABEL_211:
        uint64_t v158 = sub_25C602548(v179, v140);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v158 >= v186) {
          uint64_t v128 = v186;
        }
        else {
          uint64_t v128 = v158;
        }
        swift_isUniquelyReferenced_nonNull_native();
        v195 = v25;
        OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_14_0();
        if (v54) {
          goto LABEL_251;
        }
        unint64_t v131 = v159;
        char v161 = v160;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB680);
        uint64_t v17 = v189;
        if (OUTLINED_FUNCTION_17_0())
        {
          unint64_t v162 = sub_25C608750(v192);
          if ((v161 & 1) != (v163 & 1)) {
            goto LABEL_271;
          }
          unint64_t v131 = v162;
        }
        uint64_t v25 = v195;
        if ((v161 & 1) == 0)
        {
          OUTLINED_FUNCTION_1_4();
          unint64_t v111 = v183;
          if (v54) {
            goto LABEL_255;
          }
          goto LABEL_221;
        }
LABEL_219:
        *(void *)(v25[7] + 8 * v131) = v128;
        unint64_t v111 = v183;
LABEL_222:
        swift_bridgeObjectRelease();
        uint64_t v26 = v188;
        v102 = v28 + 7;
        uint64_t v109 = v174;
LABEL_223:
        ++v111;
      }
      while (v111 != v182);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
LABEL_226:
      if (v25[2])
      {
        unint64_t v164 = OUTLINED_FUNCTION_20_0();
        if (v165)
        {
          uint64_t v166 = *(void *)(v25[7] + 8 * v164);
          goto LABEL_230;
        }
      }
      uint64_t v166 = a3 + 1;
      if (v172) {
        goto LABEL_266;
      }
LABEL_230:
      if (v168 / 100 < v166) {
        goto LABEL_246;
      }
      uint64_t v104 = v169 + v166;
      if (__OFADD__(v169, v166)) {
        goto LABEL_265;
      }
      if (v104 > a3)
      {
        uint64_t v167 = v169 + v166;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release_n();
        goto LABEL_239;
      }
      uint64_t v106 = v192;
LABEL_234:
      unint64_t v105 = v106 + 1;
      if (v105 == v180)
      {
        uint64_t v167 = v104;
        swift_release();
        goto LABEL_238;
      }
    }
  }
LABEL_237:
  uint64_t v167 = 0;
LABEL_238:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_239:
  swift_release();
  return v167;
}

uint64_t type metadata accessor for TypoRecoveryManager()
{
  return self;
}

uint64_t sub_25C60D320(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    if (a3)
    {
      char v6 = MEMORY[0x26118C210](a4, a5, result, a2);
      return (v6 & 1) == 0;
    }
  }
  else if ((a3 & 1) == 0)
  {
    if (a5 == a2)
    {
      char v6 = a4 < result;
      return (v6 & 1) == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C60D384(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  sub_25C60E110(*(void *)a1, v2, v3);
  sub_25C60E110(v4, v5, v6);
  uint64_t v8 = sub_25C60DEE0(v1, v2, v3, v4, v5, v6, v7);
  sub_25C60D6AC(v4, v5, v6);
  sub_25C60D6AC(v1, v2, v3);
  if (!v8) {
    return MEMORY[0x263F8EE78];
  }
  if (v8 <= 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB668);
    uint64_t v9 = (void *)swift_allocObject();
    size_t v10 = _swift_stdlib_malloc_size(v9);
    v9[2] = v8;
    v9[3] = (2 * ((uint64_t)(v10 - 32) / 8)) | 1;
  }
  sub_25C60E110(v1, v2, v3);
  sub_25C60E110(v4, v5, v6);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25C60D730((uint64_t)v19, (uint64_t)(v9 + 4), v8);
  uint64_t v12 = v21;
  uint64_t v13 = v22;
  char v14 = v23;
  uint64_t v15 = v24;
  uint64_t v16 = v25;
  char v17 = v26;
  sub_25C60D6AC(v19[0], v19[1], v20);
  sub_25C60D6AC(v12, v13, v14);
  swift_bridgeObjectRelease();
  uint64_t result = sub_25C60D6AC(v15, v16, v17);
  if (v11 == v8) {
    return (uint64_t)v9;
  }
  __break(1u);
  return result;
}

void sub_25C60D540(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E8);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 24);
    }
    if (v4 != a3)
    {
      sub_25C6189EC(a2 + 24 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

void *sub_25C60D604(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
  return v4;
}

uint64_t sub_25C60D678(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C60D6AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C60D6B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C60D6E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_25C60D730(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = result;
  uint64_t v6 = *(void *)v3;
  uint64_t v7 = *(void *)(v3 + 8);
  char v8 = *(unsigned char *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  uint64_t v10 = *(void *)(v3 + 32);
  char v11 = *(unsigned char *)(v3 + 40);
  uint64_t v12 = *(void *)(v3 + 48);
  uint64_t v45 = v6;
  uint64_t v46 = v7;
  char v47 = v8 & 1;
  uint64_t v48 = v9;
  uint64_t v49 = v10;
  char v50 = v11 & 1;
  uint64_t v51 = v12;
  uint64_t v52 = v6;
  uint64_t v53 = v7;
  char v54 = v8 & 1;
  if (!a2)
  {
    *(void *)uint64_t result = v6;
    *(void *)(result + 8) = v7;
    *(unsigned char *)(result + 16) = v8 & 1;
    *(void *)(result + 24) = v9;
    *(void *)(result + 32) = v10;
    *(unsigned char *)(result + 40) = v11 & 1;
    *(void *)(result + 48) = v12;
    *(void *)(result + 56) = v6;
    *(void *)(result + 64) = v7;
    *(unsigned char *)(result + 72) = v8 & 1;
    sub_25C60E110(v6, v7, v8 & 1);
    return 0;
  }
  if (!a3)
  {
    sub_25C60E110(v6, v7, v8 & 1);
    char v34 = v8;
    uint64_t v32 = v7;
    uint64_t v33 = v6;
LABEL_29:
    *(void *)uint64_t v5 = v33;
    *(void *)(v5 + 8) = v32;
    *(unsigned char *)(v5 + 16) = v34 & 1;
    *(void *)(v5 + 24) = v9;
    *(void *)(v5 + 32) = v10;
    *(unsigned char *)(v5 + 40) = v11 & 1;
    *(void *)(v5 + 48) = v12;
    *(void *)(v5 + 56) = v6;
    *(void *)(v5 + 64) = v7;
    *(unsigned char *)(v5 + 72) = v8 & 1;
    return v4;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  uint64_t v36 = result;
  uint64_t result = sub_25C60E110(v6, v7, v8 & 1);
  uint64_t v13 = 0;
  uint64_t v39 = v4;
  while (1)
  {
    uint64_t v15 = v52;
    uint64_t v14 = v53;
    char v16 = v54;
    uint64_t v17 = v48;
    uint64_t v18 = v49;
    char v19 = v50;
    uint64_t v42 = v13;
    if (v54)
    {
      if ((v50 & 1) == 0) {
        goto LABEL_39;
      }
      uint64_t result = MEMORY[0x26118C220](v52, v53, v48, v49);
      uint64_t v20 = v45;
      uint64_t v21 = v46;
      char v22 = v47;
      if (result) {
        goto LABEL_31;
      }
      if ((v47 & 1) == 0) {
        goto LABEL_40;
      }
      uint64_t result = MEMORY[0x26118C210](v15, v14, v45, v46);
      if (result) {
        goto LABEL_35;
      }
      uint64_t result = MEMORY[0x26118C210](v15, v14, v17, v18);
      if ((result & 1) == 0) {
        break;
      }
      goto LABEL_19;
    }
    if (v50) {
      goto LABEL_39;
    }
    if (v53 != v49) {
      goto LABEL_34;
    }
    uint64_t v20 = v45;
    uint64_t v21 = v46;
    char v22 = v47;
    if (v52 == v48)
    {
      uint64_t v17 = v52;
LABEL_31:
      uint64_t v35 = v51;
      *(void *)uint64_t v36 = v20;
      *(void *)(v36 + 8) = v21;
      *(unsigned char *)(v36 + 16) = v22;
      *(void *)(v36 + 24) = v17;
      *(void *)(v36 + 32) = v18;
      *(unsigned char *)(v36 + 40) = v16;
      *(void *)(v36 + 48) = v35;
      *(void *)(v36 + 56) = v15;
      *(void *)(v36 + 64) = v14;
      uint64_t v4 = v13;
      *(unsigned char *)(v36 + 72) = v16;
      return v4;
    }
    if (v47) {
      goto LABEL_40;
    }
    if (v53 != v46) {
      goto LABEL_36;
    }
    if (v52 < v45) {
      goto LABEL_37;
    }
    if (v52 >= v48) {
      break;
    }
LABEL_19:
    uint64_t v43 = v17;
    uint64_t v23 = v51;
    uint64_t result = sub_25C60E200(v15, v14, v16, v51);
    uint64_t v41 = result;
    if ((v23 & 0xC000000000000001) != 0)
    {
      if ((v16 & 1) == 0) {
        goto LABEL_41;
      }
      uint64_t v24 = sub_25C61ECD0();
      sub_25C60E110(v20, v21, 1);
      sub_25C60E110(v43, v18, v19);
      char v25 = v19;
      swift_bridgeObjectRetain();
      if (v24) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      uint64_t v30 = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB670);
      long long v31 = (void (*)(char *, void))sub_25C61EBC0();
      sub_25C61ED70();
      v31(v44, 0);
      char v16 = 1;
      uint64_t v29 = v43;
    }
    else
    {
      char v25 = v19;
      int64_t v26 = sub_25C60E11C(v15, v14, v16, v23);
      uint64_t v38 = v27;
      char v37 = v28;
      sub_25C60E110(v20, v21, v16);
      uint64_t v29 = v43;
      sub_25C60E110(v43, v18, v25);
      swift_bridgeObjectRetain();
      sub_25C60D6AC(v15, v14, v16);
      uint64_t v52 = v26;
      uint64_t v53 = v38;
      char v54 = v37 & 1;
      uint64_t v30 = v41;
    }
    sub_25C60D6AC(v20, v21, v16);
    sub_25C60D6AC(v29, v18, v25);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v4 = v39;
    *(void *)(a2 + 8 * v42) = v30;
    uint64_t v13 = v42 + 1;
    if (v39 == v42 + 1)
    {
      uint64_t v33 = v45;
      uint64_t v32 = v46;
      char v34 = v47;
      uint64_t v9 = v48;
      uint64_t v10 = v49;
      char v11 = v50;
      uint64_t v12 = v51;
      uint64_t v6 = v52;
      uint64_t v7 = v53;
      char v8 = v54;
      uint64_t v5 = v36;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25C60DB28(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_25C61ED60();
  }
  else {
    return 1 << *(unsigned char *)(a1 + 32);
  }
}

uint64_t sub_25C60DB7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = sub_25C61ECB0();
    uint64_t v26 = v7;
    uint64_t v27 = v6;
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = sub_25C60E45C(a2);
    uint64_t v26 = v10;
    uint64_t v27 = v9;
    char v8 = v11 & 1;
  }
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  char v14 = *(unsigned char *)(a1 + 16);
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 24);
  char v15 = *(unsigned char *)(a1 + 40);
  uint64_t v16 = sub_25C60DB28(a2);
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t result = sub_25C60D320(v27, v26, v8, v16, v17, v19 & 1);
  if ((result & 1) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_25C60D320(v27, v26, v8, v12, v13, v14);
  if ((result & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  char v23 = v14;
  char v22 = sub_25C60D320(v25, v24, v15, v16, v18, v20);
  sub_25C60D6AC(v27, v26, v8);
  uint64_t result = sub_25C60D6AC(v16, v18, v20);
  if (v22)
  {
    swift_bridgeObjectRetain();
    sub_25C60E110(v12, v13, v23);
    uint64_t result = sub_25C60E110(v25, v24, v15);
    *(void *)a3 = v12;
    *(void *)(a3 + 8) = v13;
    *(unsigned char *)(a3 + 16) = v23;
    *(void *)(a3 + 24) = v25;
    *(void *)(a3 + 32) = v24;
    *(unsigned char *)(a3 + 40) = v15;
    *(void *)(a3 + 48) = a2;
    return result;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_25C60DD08(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  if (a4 < 0)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  else
  {
    uint64_t v10 = a4;
    uint64_t v11 = result;
    int64_t v25 = result;
    uint64_t v26 = a2;
    char v27 = a3 & 1;
    uint64_t result = sub_25C60E110(result, a2, a3 & 1);
    if (v10)
    {
      unint64_t v12 = a8 & 0xC000000000000001;
      while (1)
      {
        int64_t v14 = v25;
        uint64_t v13 = v26;
        char v15 = v27;
        if (v27)
        {
          if ((a7 & 1) == 0) {
            goto LABEL_24;
          }
          if (MEMORY[0x26118C220](v25, v26, a5, a6))
          {
            a5 = v14;
LABEL_20:
            sub_25C60D6AC(a5, v13, v15);
            return 0;
          }
          if (v12)
          {
            if (sub_25C61ECD0()) {
              swift_isUniquelyReferenced_nonNull_native();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB670);
            uint64_t v21 = (uint64_t (*)(char *, void))sub_25C61EBC0();
            sub_25C61ED70();
            uint64_t result = v21(v24, 0);
            goto LABEL_16;
          }
        }
        else
        {
          if (a7) {
            goto LABEL_24;
          }
          if (v26 != a6)
          {
            __break(1u);
            goto LABEL_23;
          }
          if (v25 == a5) {
            goto LABEL_20;
          }
          if (v12) {
            goto LABEL_25;
          }
        }
        int64_t v16 = sub_25C60E11C(v14, v13, v15, a8);
        uint64_t v18 = v17;
        char v20 = v19;
        uint64_t result = sub_25C60D6AC(v14, v13, v15);
        int64_t v25 = v16;
        uint64_t v26 = v18;
        char v27 = v20 & 1;
LABEL_16:
        if (!--v10) {
          return v25;
        }
      }
    }
    return v11;
  }
  return result;
}

uint64_t sub_25C60DEE0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v9 = a2;
  uint64_t v10 = a1;
  int v11 = a3 & 1;
  int v12 = a6 & 1;
  uint64_t result = sub_25C60D320(a1, a2, a3 & 1, a4, a5, a6 & 1);
  if ((result & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v28 = v10;
  uint64_t v29 = v9;
  BOOL v30 = v11 != 0;
  if (sub_25C60E4DC(v10, v9, v11, v8, v7, v12)) {
    return 0;
  }
  uint64_t result = sub_25C60E110(v10, v9, v11);
  uint64_t v14 = 1;
  int v25 = v12;
  while (1)
  {
    if ((a7 & 0xC000000000000001) != 0)
    {
      if ((v11 & 1) == 0) {
        goto LABEL_26;
      }
      if (sub_25C61ECD0()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB670);
      char v23 = (uint64_t (*)(char *, void))sub_25C61EBC0();
      sub_25C61ED70();
      uint64_t result = v23(v27, 0);
      uint64_t v10 = v28;
      uint64_t v9 = v29;
      if (v30)
      {
LABEL_15:
        if (!v12) {
          goto LABEL_25;
        }
        uint64_t result = MEMORY[0x26118C220](v10, v9, v8, v7);
        LOBYTE(v11) = 1;
        if (result) {
          goto LABEL_21;
        }
        goto LABEL_17;
      }
    }
    else
    {
      int64_t v15 = sub_25C60E11C(v10, v9, v11, a7);
      uint64_t v17 = v16;
      char v19 = v18;
      uint64_t v20 = v7;
      uint64_t v21 = v8;
      BOOL v22 = v18 & 1;
      uint64_t result = sub_25C60D6AC(v10, v9, v11);
      uint64_t v28 = v15;
      uint64_t v29 = v17;
      uint64_t v9 = v17;
      uint64_t v10 = v15;
      BOOL v30 = v22;
      uint64_t v8 = v21;
      uint64_t v7 = v20;
      int v12 = v25;
      if (v19) {
        goto LABEL_15;
      }
    }
    if (v12) {
      goto LABEL_25;
    }
    if (v9 != v7) {
      break;
    }
    LOBYTE(v11) = 0;
    if (v10 == v8) {
      goto LABEL_20;
    }
LABEL_17:
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
LABEL_20:
      uint64_t v10 = v8;
LABEL_21:
      sub_25C60D6AC(v10, v9, v11);
      return v14;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25C60E110(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

int64_t sub_25C60E11C(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_25C60E200(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v5 = result;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if (a3) {
      goto LABEL_13;
    }
    if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result))
    {
      if (*(_DWORD *)(a4 + 36) == a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (sub_25C61ED00() == *(_DWORD *)(a4 + 36))
      {
        sub_25C61ED10();
        type metadata accessor for AutoCompletePhrase();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        sub_25C61F050();
        sub_25C61F060();
        uint64_t v8 = sub_25C61F080();
        uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
        unint64_t v5 = v8 & ~v9;
        if ((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
        {
          unint64_t v10 = (void *)swift_retain();
          char v11 = static AutoCompletePhrase.== infix(_:_:)(v10, v15);
          swift_release();
          if ((v11 & 1) == 0)
          {
            uint64_t v12 = ~v9;
            do
            {
              unint64_t v5 = (v5 + 1) & v12;
              if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
                goto LABEL_25;
              }
              uint64_t v13 = (void *)swift_retain();
              char v14 = static AutoCompletePhrase.== infix(_:_:)(v13, v15);
              swift_release();
            }
            while ((v14 & 1) == 0);
          }
          swift_release();
LABEL_20:
          unint64_t v7 = *(void **)(*(void *)(a4 + 48) + 8 * v5);
          swift_retain();
          return (uint64_t)v7;
        }
LABEL_25:
        uint64_t result = swift_release();
        __break(1u);
        goto LABEL_26;
      }
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    __break(1u);
    goto LABEL_24;
  }
  if (a3)
  {
    if (a4 < 0) {
      uint64_t v6 = a4;
    }
    else {
      uint64_t v6 = a4 & 0xFFFFFFFFFFFFFF8;
    }
    MEMORY[0x26118C270](result, a2, v6);
    type metadata accessor for AutoCompletePhrase();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    unint64_t v7 = v15;
    swift_unknownObjectRelease();
    return (uint64_t)v7;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25C60E45C(uint64_t a1)
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

BOOL sub_25C60E4DC(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if (a3)
  {
    if (a6) {
LABEL_9:
    }
      JUMPOUT(0x26118C220);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a6) {
    goto LABEL_8;
  }
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

void OUTLINED_FUNCTION_0_4()
{
  *(void *)(v2 + 8 * (v3 >> 6) + 64) |= 1 << v3;
  char v5 = (void *)(*(void *)(v2 + 48) + 16 * v3);
  *char v5 = *(void *)(v4 - 128);
  v5[1] = v1;
  *(void *)(*(void *)(v2 + 56) + 8 * v3) = v0;
}

void OUTLINED_FUNCTION_1_4()
{
  *(void *)(v1 + 8 * (v0 >> 6) + 64) |= 1 << v0;
  *(void *)(*(void *)(v1 + 48) + 8 * v0) = *(void *)(v3 - 136);
  *(void *)(*(void *)(v1 + 56) + 8 * v0) = v2;
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  *(void *)(v14 - 80) = a1;
  *uint64_t v13 = a13;
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_4_3@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  *(void *)(v1 - 120) = v0;
  return swift_bridgeObjectRetain();
}

char *OUTLINED_FUNCTION_7_2@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 120) = a1;
  return sub_25C619440(0, v1, 0);
}

void OUTLINED_FUNCTION_8_2()
{
  *(void *)(v0 + 16) = v2;
  uint64_t v5 = v0 + 16 * v3;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v1;
}

char *OUTLINED_FUNCTION_10_1()
{
  return sub_25C619440((char *)(v0 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(_OWORD *)(a1 + 16) = a9;
  *(void *)(a1 + 32) = v9;
  *(void *)(v10 - 80) = a1;
  return sub_25C61EB60();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return v0;
}

char *OUTLINED_FUNCTION_13_1@<X0>(uint64_t a1@<X8>)
{
  return sub_25C619440(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_15_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_25C61EE70();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_25C61EE70();
}

unint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_25C6086DC();
}

unint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v2 = *(void *)(v0 - 136);
  return sub_25C608750(v2);
}

char *OUTLINED_FUNCTION_21_0()
{
  if (!v1 & v0) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 0;
  }
  return sub_25C619440((char *)v4, v2, 1);
}

void sub_25C60E7B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int64_t v20 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!v5)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_25C619480(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v18 = a2 + 8 * a3;
    uint64_t v19 = v5;
    while (!__OFADD__(v8, 1))
    {
      if (a3 + v8 >= v20 || v8 >= v5) {
        goto LABEL_17;
      }
      uint64_t v22 = v8 + 1;
      uint64_t v10 = *(void *)(v18 + 8 * v8);
      swift_beginAccess();
      sub_25C61EA30();
      sub_25C5FDE14();
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25C61EC50();
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_25C600D9C(a5, v11);
      uint64_t v13 = sub_25C602548(v12, v11);
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_25C602548(a5, v11);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v16 = *(void *)(v23 + 16);
      unint64_t v15 = *(void *)(v23 + 24);
      if (v16 >= v15 >> 1) {
        sub_25C619480((char *)(v15 > 1), v16 + 1, 1);
      }
      *(void *)(v23 + 16) = v16 + 1;
      uint64_t v17 = v23 + 24 * v16;
      *(void *)(v17 + 32) = v10;
      *(void *)(v17 + 40) = a5;
      *(double *)(v17 + 48) = ((double)v13 + (double)v14) * 0.5;
      ++v8;
      uint64_t v5 = v19;
      if (v22 == v19) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
LABEL_19:
  __break(1u);
}

uint64_t sub_25C60EA00(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_25C61EFC0();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_25C60D540(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_25C60EAE8(unint64_t a1, uint64_t a2)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x26118C320](v4, a1);
LABEL_7:
        unint64_t v6 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        uint64_t v8 = *(void *)(v5 + 48);
        uint64_t v7 = *(void *)(v5 + 56);
        swift_bridgeObjectRetain();
        sub_25C601284(v8, v7, a2);
        char v10 = v9;
        swift_bridgeObjectRelease();
        if (v10)
        {
          swift_release();
        }
        else
        {
          sub_25C61EE20();
          sub_25C61EE50();
          sub_25C61EE60();
          sub_25C61EE30();
        }
        ++v4;
        if (v6 == v3)
        {
          uint64_t v11 = v14;
          goto LABEL_18;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_25C61EE90();
      if (!v3) {
        goto LABEL_17;
      }
    }
    uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
    swift_retain();
    goto LABEL_7;
  }
LABEL_17:
  uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

void *DefaultSiriAutoCompleteService.__allocating_init(featureFlagProvider:)(uint64_t a1)
{
  uint64_t v2 = sub_25C60ED70(0, a1);
  type metadata accessor for VectorDBWriteClientManager();
  uint64_t v3 = swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  *(void *)(v3 + 112) = v2;
  type metadata accessor for DefaultProfanityPreferenceProvider();
  swift_allocObject();
  uint64_t v4 = sub_25C609660();
  type metadata accessor for DefaultBlockedAppsProvider();
  uint64_t v5 = swift_allocObject();
  type metadata accessor for TypingSessionCache();
  swift_allocObject();
  unint64_t v6 = sub_25C605490();
  sub_25C60F93C(a1, (uint64_t)v9);
  uint64_t v7 = sub_25C61B418(v9, v3, v4, v5, (uint64_t)v6);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v7;
}

uint64_t sub_25C60ED70(int a1, uint64_t a2)
{
  uint64_t v54 = sub_25C61E870();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C61E8B0();
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char **)((char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_25C61E860();
  uint64_t v47 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v58 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C61E830();
  uint64_t v55 = *(void *)(v10 - 8);
  uint64_t v56 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  char v50 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v51 = (char *)&v46 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26B351988);
  MEMORY[0x270FA5388](v14 - 8);
  unint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25C61E6F0();
  uint64_t v48 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v57 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v46 - v20;
  sub_25C60F93C(a2, (uint64_t)v64);
  int v59 = a1;
  if (a1)
  {
    uint64_t v22 = v65;
    uint64_t v23 = v66;
    __swift_project_boxed_opaque_existential_1(v64, v65);
    LOBYTE(v22) = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
    if ((v22 & 1) == 0)
    {
      if (qword_26B351C40 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_25C61E9D0();
      __swift_project_value_buffer(v24, (uint64_t)qword_26B351C28);
      int v25 = sub_25C61E9B0();
      os_log_type_t v26 = sub_25C61EBE0();
      if (!os_log_type_enabled(v25, v26)) {
        goto LABEL_22;
      }
      char v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v61[0] = v28;
      *(_DWORD *)char v27 = 136315138;
      uint64_t v60 = sub_25C618C00(0xD000000000000038, 0x800000025C621100, v61);
      sub_25C61EC20();
      uint64_t v29 = "Function: %s > ftsQuery is not enabled. Not initializing ReadOnlyVectorDBClient";
LABEL_21:
      _os_log_impl(&dword_25C5FA000, v25, v26, v29, v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118CA00](v28, -1, -1);
      MEMORY[0x26118CA00](v27, -1, -1);
LABEL_22:

      return 0;
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  }
  sub_25C60F93C(a2, (uint64_t)v61);
  if (v59)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  }
  else
  {
    uint64_t v30 = v62;
    uint64_t v31 = v63;
    __swift_project_boxed_opaque_existential_1(v61, v62);
    LOBYTE(v30) = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    if ((v30 & 1) == 0)
    {
      if (qword_26B351C40 != -1) {
        swift_once();
      }
      uint64_t v44 = sub_25C61E9D0();
      __swift_project_value_buffer(v44, (uint64_t)qword_26B351C28);
      int v25 = sub_25C61E9B0();
      os_log_type_t v26 = sub_25C61EBE0();
      if (!os_log_type_enabled(v25, v26)) {
        goto LABEL_22;
      }
      char v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v61[0] = v28;
      *(_DWORD *)char v27 = 136315138;
      uint64_t v60 = sub_25C618C00(0xD000000000000038, 0x800000025C621100, v61);
      sub_25C61EC20();
      uint64_t v29 = "Function: %s > indexBuilding is not enabled. Not initializing WritableVectorDBClient";
      goto LABEL_21;
    }
  }
  sub_25C60F9A0((uint64_t)v16);
  uint64_t v32 = v17;
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_25C61CF04((uint64_t)v16, qword_26B351988);
    if (qword_26B351C40 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25C61E9D0();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B351C28);
    int v25 = sub_25C61E9B0();
    os_log_type_t v26 = sub_25C61EBF0();
    if (!os_log_type_enabled(v25, v26)) {
      goto LABEL_22;
    }
    char v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v61[0] = v28;
    *(_DWORD *)char v27 = 136315138;
    uint64_t v60 = sub_25C618C00(0xD000000000000038, 0x800000025C621100, v61);
    sub_25C61EC20();
    uint64_t v29 = "Function: %s > Unable to create a directory for the search index";
    goto LABEL_21;
  }
  uint64_t v34 = v48;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  uint64_t v36 = v21;
  uint64_t v46 = v21;
  v35(v21, v16, v32);
  uint64_t v37 = v34;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v57, v36, v32);
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v58, *MEMORY[0x263F846A8], v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351720);
  uint64_t v47 = v32;
  sub_25C61E8A0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25C61FEA0;
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v38 = *MEMORY[0x263F84720];
  uint64_t v39 = *(void (**)(void *, uint64_t, uint64_t))(v49 + 104);
  v39(v7, v38, v5);
  sub_25C61E890();
  *uint64_t v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_25C61E890();
  *uint64_t v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_25C61E890();
  *uint64_t v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_25C61E890();
  *uint64_t v7 = 0;
  *((unsigned char *)v7 + 8) = 1;
  v39(v7, *MEMORY[0x263F84728], v5);
  sub_25C61E890();
  *uint64_t v7 = 0;
  *((unsigned char *)v7 + 8) = 0;
  v39(v7, *MEMORY[0x263F84718], v5);
  sub_25C61E890();
  *(_OWORD *)uint64_t v7 = xmmword_25C61FEB0;
  v39(v7, v38, v5);
  sub_25C61E890();
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v53, *MEMORY[0x263F846E0], v54);
  BOOL v40 = v51;
  sub_25C61E820();
  uint64_t v42 = v55;
  uint64_t v41 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v50, v40, v56);
  sub_25C61E810();
  swift_allocObject();
  uint64_t v43 = sub_25C61E7B0();
  sub_25C61E7E0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v46, v47);
  return v43;
}

uint64_t sub_25C60F93C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C60F9A0@<X0>(uint64_t a1@<X8>)
{
  v56[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_25C61E6F0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v49[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v49[-v10];
  if (qword_26B351938 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_26B351940);
  uint64_t v54 = v4;
  uint64_t v12 = *(void (**)(void))(v4 + 16);
  OUTLINED_FUNCTION_88();
  v12();
  id v13 = objc_msgSend(self, sel_defaultManager);
  uint64_t v14 = (void *)sub_25C61E6B0();
  v56[0] = 0;
  unsigned int v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v56);

  if (v15)
  {
    uint64_t v16 = qword_26B351C40;
    id v17 = v56[0];
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25C61E9D0();
    uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_26B351C28);
    OUTLINED_FUNCTION_88();
    v12();
    uint64_t v20 = sub_25C61E9B0();
    os_log_type_t v21 = sub_25C61EBE0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = OUTLINED_FUNCTION_14_1();
      uint64_t v53 = (void *)OUTLINED_FUNCTION_40();
      v56[0] = v53;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v23 = OUTLINED_FUNCTION_81((uint64_t)"createDatabaseDirectory()");
      OUTLINED_FUNCTION_63(v23);
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v24 = sub_25C61E690();
      uint64_t v19 = v25;
      uint64_t v55 = sub_25C618C00(v24, v25, (uint64_t *)v56);
      sub_25C61EC20();
      swift_bridgeObjectRelease();
      uint64_t v26 = OUTLINED_FUNCTION_62();
      v27(v26);
      _os_log_impl(&dword_25C5FA000, v20, v21, "Function: %s > creating DB directory path: %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {
      uint64_t v44 = OUTLINED_FUNCTION_62();
      v45(v44);
    }

    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v19 + 32))(a1, v11, v2);
    uint64_t v43 = 0;
  }
  else
  {
    uint64_t v53 = (void *)a1;
    id v28 = v56[0];
    uint64_t v29 = (void *)sub_25C61E680();

    swift_willThrow();
    if (qword_26B351C40 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_25C61E9D0();
    __swift_project_value_buffer(v30, (uint64_t)qword_26B351C28);
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_88();
    v12();
    id v31 = v29;
    id v32 = v29;
    uint64_t v33 = sub_25C61E9B0();
    os_log_type_t v34 = sub_25C61EBF0();
    int v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = OUTLINED_FUNCTION_5_4();
      uint64_t v51 = (void *)OUTLINED_FUNCTION_39();
      uint64_t v52 = (void *)OUTLINED_FUNCTION_40();
      v56[0] = v52;
      *(_DWORD *)uint64_t v36 = 136315650;
      uint64_t v37 = OUTLINED_FUNCTION_81((uint64_t)"createDatabaseDirectory()");
      OUTLINED_FUNCTION_63(v37);
      *(_WORD *)(v36 + 12) = 2080;
      int v50 = v35;
      uint64_t v38 = sub_25C61E690();
      uint64_t v55 = sub_25C618C00(v38, v39, (uint64_t *)v56);
      OUTLINED_FUNCTION_78();
      swift_bridgeObjectRelease();
      BOOL v40 = *(void (**)(void))(v54 + 8);
      OUTLINED_FUNCTION_76();
      v40();
      *(_WORD *)(v36 + 22) = 2112;
      id v41 = v29;
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v55 = v42;
      OUTLINED_FUNCTION_78();
      *uint64_t v51 = v42;
      MEMORY[0x26118C8A0](v29);
      MEMORY[0x26118C8A0](v29);
      _os_log_impl(&dword_25C5FA000, v33, (os_log_type_t)v50, "Function: %s > Unable to create directory at path %s with error: %@", (uint8_t *)v36, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C0);
      uint64_t v43 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();

      MEMORY[0x26118C8A0](v29);
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_76();
      v40();
    }
    else
    {

      MEMORY[0x26118C8A0](v29);
      MEMORY[0x26118C8A0](v29);
      uint64_t v46 = *(void (**)(void))(v54 + 8);
      ((void (*)(unsigned char *, uint64_t))v46)(v8, v2);
      MEMORY[0x26118C8A0](v29);
      uint64_t v47 = OUTLINED_FUNCTION_121();
      v46(v47);
      uint64_t v43 = 1;
    }
    a1 = (uint64_t)v53;
  }
  return __swift_storeEnumTagSinglePayload(a1, v43, 1, v2);
}

uint64_t sub_25C60FF74()
{
  uint64_t v0 = sub_25C61E6F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_26B351940);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B351940);
  sub_25C61E6A0();
  sub_25C61E6C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t DefaultSiriAutoCompleteService.dropDB()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C6100B4, 0);
}

uint64_t sub_25C6100B4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 56);
  *(void *)(v0 + 24) = v1;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C6100D4, v1);
}

uint64_t sub_25C6100D4()
{
  OUTLINED_FUNCTION_37();
  sub_25C608FD8();
  OUTLINED_FUNCTION_22_1();
  return v0();
}

uint64_t DefaultSiriAutoCompleteService.deletePhrasesForSource(source:)()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v3 = v2;
  *(void *)(v1 + 56) = v0;
  uint64_t v4 = sub_25C61E8B0();
  *(void *)(v1 + 64) = v4;
  OUTLINED_FUNCTION_1_5(v4);
  *(void *)(v1 + 72) = v5;
  *(void *)(v1 + 80) = OUTLINED_FUNCTION_15_1();
  uint64_t v6 = sub_25C61E8A0();
  OUTLINED_FUNCTION_23(v6);
  *(void *)(v1 + 88) = OUTLINED_FUNCTION_15_1();
  uint64_t v7 = sub_25C61E850();
  *(void *)(v1 + 96) = v7;
  OUTLINED_FUNCTION_1_5(v7);
  *(void *)(v1 + 104) = v8;
  *(void *)(v1 + 112) = OUTLINED_FUNCTION_15_1();
  *(unsigned char *)(v1 + 144) = *v3;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25C610230()
{
  OUTLINED_FUNCTION_57();
  uint64_t v4 = *(unsigned __int8 *)(v1 + 144);
  OUTLINED_FUNCTION_92();
  *(unsigned char *)(v0 + 8) = 1;
  OUTLINED_FUNCTION_112();
  v5();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0);
  OUTLINED_FUNCTION_26();
  uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_122(v6, (__n128)xmmword_25C61FCB0);
  sub_25C61E880();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v7();
  *uint64_t v2 = v4 + 1;
  sub_25C61E8C0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v8();
  OUTLINED_FUNCTION_68();
  uint64_t v9 = *(void *)(v3 + 56);
  *(void *)(v1 + 120) = v9;
  return MEMORY[0x270FA2498](sub_25C6103B0, v9, 0);
}

uint64_t sub_25C6103B0()
{
  OUTLINED_FUNCTION_37();
  v0[16] = sub_25C609044(v0[14]);
  v0[17] = 0;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

#error "25C6104E4: call analysis failed (funcsize=113)"

#error "25C6106E8: call analysis failed (funcsize=120)"

uint64_t DefaultSiriAutoCompleteService.deletePhrasesForApp(bundleIds:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0);
  v1[9] = v3;
  OUTLINED_FUNCTION_1_5(v3);
  v1[10] = v4;
  v1[11] = OUTLINED_FUNCTION_15_1();
  uint64_t v5 = sub_25C61E8B0();
  v1[12] = v5;
  OUTLINED_FUNCTION_1_5(v5);
  v1[13] = v6;
  v1[14] = OUTLINED_FUNCTION_15_1();
  uint64_t v7 = sub_25C61E8A0();
  OUTLINED_FUNCTION_23(v7);
  v1[15] = OUTLINED_FUNCTION_15_1();
  uint64_t v8 = sub_25C61E850();
  v1[16] = v8;
  OUTLINED_FUNCTION_1_5(v8);
  v1[17] = v9;
  v1[18] = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25C61091C()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_86();
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v0[7];
  void *v1 = 0;
  v1[1] = 0;
  OUTLINED_FUNCTION_112();
  v3();
  sub_25C61E890();
  int64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = v0[10];
    uint64_t v23 = v0[9];
    uint64_t v24 = MEMORY[0x263F8EE78];
    uint64_t v6 = v0[7];
    sub_25C619460(0, v4, 0);
    sub_25C61E880();
    OUTLINED_FUNCTION_4();
    uint64_t v22 = *(void (**)(void))(v7 + 104);
    uint64_t v8 = (uint64_t *)(v6 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      uint64_t v11 = (void *)(v0[11] + *(int *)(v23 + 48));
      v22();
      *uint64_t v11 = v9;
      v11[1] = v10;
      sub_25C61E8C0();
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_29();
      v12();
      OUTLINED_FUNCTION_107();
      unint64_t v14 = *(void *)(v24 + 16);
      unint64_t v13 = *(void *)(v24 + 24);
      swift_bridgeObjectRetain();
      if (v14 >= v13 >> 1) {
        sub_25C619460(v13 > 1, v14 + 1, 1);
      }
      uint64_t v15 = v0[11];
      *(void *)(v24 + 16) = v14 + 1;
      sub_25C61B610(v15, v24+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v14);
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  uint64_t v16 = v0[8];
  sub_25C61E840();
  v0[19] = *(void *)(v16 + 56);
  OUTLINED_FUNCTION_23_1();
  return MEMORY[0x270FA2498](v17, v18, v19);
}

uint64_t sub_25C610B34()
{
  OUTLINED_FUNCTION_37();
  v0[20] = sub_25C609044(v0[18]);
  v0[21] = 0;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C610BB8()
{
  uint64_t v18 = v0;
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C61E9D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3515A8);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_25C61E9B0();
  os_log_type_t v4 = sub_25C61EBE0();
  if (OUTLINED_FUNCTION_36(v4))
  {
    uint64_t v16 = v0[20];
    uint64_t v5 = OUTLINED_FUNCTION_5_4();
    uint64_t v17 = OUTLINED_FUNCTION_40();
    *(_DWORD *)uint64_t v5 = 136315650;
    v0[4] = sub_25C618C00(0xD00000000000001FLL, 0x800000025C620AD0, &v17);
    OUTLINED_FUNCTION_71();
    sub_25C61EC20();
    *(_WORD *)(v5 + 12) = 2048;
    v0[5] = v16;
    sub_25C61EC20();
    *(_WORD *)(v5 + 22) = 2080;
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x26118C070](v6, MEMORY[0x263F8D310]);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[6] = sub_25C618C00(v7, v9, &v17);
    sub_25C61EC20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5FA000, v3, v1, "Function: %s > Successfully deleted %ld phrases from apps - %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    OUTLINED_FUNCTION_67();
    v10();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v11 = OUTLINED_FUNCTION_96();
    v12(v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v13 = OUTLINED_FUNCTION_94();
  return v14(v13);
}

#error "25C610F50: call analysis failed (funcsize=125)"

uint64_t DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 64) = v1;
  *(void *)(v2 + 72) = v3;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C6110A8, 0);
}

uint64_t sub_25C6110A8()
{
  OUTLINED_FUNCTION_57();
  uint64_t v1 = v0[9];
  if (!*(void *)(v1 + 16))
  {
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25C61E9D0();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_42(v6, (uint64_t)qword_26B3515A8);
    os_log_type_t v8 = sub_25C61EBE0();
    if (OUTLINED_FUNCTION_25(v8))
    {
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_97();
      OUTLINED_FUNCTION_50(4.8149e-34);
      v0[7] = OUTLINED_FUNCTION_83((uint64_t)"addPhrasesToVectorDB(vectorSearchAssets:)", v13);
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_28(&dword_25C5FA000, v9, v10, "Function: %s > addPhrasesToVectorDB called with 0 phrases; no-op");
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }

    OUTLINED_FUNCTION_32();
    __asm { BRAA            X2, X16 }
  }
  v0[2] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C611254;
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_32();
  return sub_25C608E00(v3);
}

uint64_t sub_25C611254()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 88) = v4;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C611338()
{
  OUTLINED_FUNCTION_117();
  if (qword_26B351C40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C61E9D0();
  uint64_t v3 = OUTLINED_FUNCTION_42(v2, (uint64_t)qword_26B351C28);
  os_log_type_t v4 = sub_25C61EBD0();
  if (OUTLINED_FUNCTION_25(v4))
  {
    uint64_t v5 = v1[11];
    uint64_t v6 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v6 = 136315394;
    OUTLINED_FUNCTION_84();
    v1[5] = sub_25C618C00(0xD000000000000029, v7, v8);
    sub_25C61EC20();
    *(_WORD *)(v6 + 12) = 2048;
    v1[6] = v5;
    sub_25C61EC20();
    _os_log_impl(&dword_25C5FA000, v3, v0, "Function: %s > Phrase insertion into VectorDB completed. Successfully inserted %ld records", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }

  OUTLINED_FUNCTION_34();
  return v9();
}

uint64_t sub_25C6114D0()
{
  OUTLINED_FUNCTION_117();
  if (qword_26B351C40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_25C61E9D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B351C28);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = (void *)sub_25C61E9B0();
  os_log_type_t v6 = sub_25C61EBF0();
  BOOL v7 = OUTLINED_FUNCTION_18_1(v6);
  os_log_type_t v8 = (void *)v0[12];
  if (v7)
  {
    uint64_t v9 = OUTLINED_FUNCTION_14_1();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_97();
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[3] = OUTLINED_FUNCTION_83((uint64_t)"addPhrasesToVectorDB(vectorSearchAssets:)", v17);
    sub_25C61EC20();
    *(_WORD *)(v9 + 12) = 2112;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v12;
    sub_25C61EC20();
    void *v10 = v12;
    MEMORY[0x26118C8A0](v8);
    MEMORY[0x26118C8A0](v8);
    OUTLINED_FUNCTION_115(&dword_25C5FA000, v13, v14, "Function: %s > Error encountered while attempting to insert assets into VectorDB: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    MEMORY[0x26118C8A0](v8);
  }
  else
  {
    MEMORY[0x26118C8A0](v0[12]);
    MEMORY[0x26118C8A0](v8);
    MEMORY[0x26118C8A0](v8);
  }
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15(0);
}

uint64_t DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  OUTLINED_FUNCTION_11_2();
  v3[6] = v4;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C611710, 0);
}

uint64_t sub_25C611710()
{
  OUTLINED_FUNCTION_57();
  uint64_t v1 = sub_25C60ED70(1, v0[5] + 16);
  v0[7] = v1;
  if (!v1)
  {
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25C61E9D0();
    os_log_type_t v6 = (void *)OUTLINED_FUNCTION_42(v5, (uint64_t)qword_26B3515A8);
    os_log_type_t v7 = sub_25C61EBE0();
    if (OUTLINED_FUNCTION_25(v7))
    {
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_97();
      OUTLINED_FUNCTION_50(4.8149e-34);
      OUTLINED_FUNCTION_82();
      v0[2] = sub_25C618C00(0xD000000000000022, v8, v9);
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_28(&dword_25C5FA000, v10, v11, "Function: %s > Unable to fetch autoCompleteResults; VectorDatabaseClient was not created");
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }

    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_32();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C6118C8;
  OUTLINED_FUNCTION_59(v0[3]);
  OUTLINED_FUNCTION_32();
  return DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:readOnlyClient:)();
}

uint64_t sub_25C6118C8()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C611990()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_22_1();
  return v0();
}

uint64_t DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:readOnlyClient:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[25] = v2;
  v1[26] = v0;
  v1[23] = v3;
  v1[24] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  OUTLINED_FUNCTION_23(v5);
  v1[27] = OUTLINED_FUNCTION_15_1();
  uint64_t v6 = sub_25C61E8B0();
  v1[28] = v6;
  OUTLINED_FUNCTION_1_5(v6);
  v1[29] = v7;
  v1[30] = OUTLINED_FUNCTION_15_1();
  uint64_t v8 = sub_25C61E8A0();
  OUTLINED_FUNCTION_23(v8);
  v1[31] = OUTLINED_FUNCTION_15_1();
  uint64_t v9 = sub_25C61E850();
  v1[32] = v9;
  OUTLINED_FUNCTION_1_5(v9);
  v1[33] = v10;
  v1[34] = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_25C611AEC()
{
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_61();
  uint64_t v2 = v0[33];
  uint64_t v1 = v0[34];
  uint64_t v20 = v0[32];
  uint64_t v3 = (void *)v0[30];
  uint64_t v4 = v0[23];
  uint64_t v5 = v0[24];
  *uint64_t v3 = 0;
  v3[1] = 0;
  OUTLINED_FUNCTION_112();
  v6();
  OUTLINED_FUNCTION_102();
  sub_25C61E890();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C8);
  uint64_t v7 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25C61FCB0;
  uint64_t v10 = (void *)(v9 + v8 + v7[14]);
  sub_25C61E880();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v11();
  void *v10 = v4;
  v10[1] = v5;
  sub_25C61E8C0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v12();
  OUTLINED_FUNCTION_107();
  swift_bridgeObjectRetain();
  sub_25C61E840();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351588);
  unint64_t v13 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v14 = swift_allocObject();
  v0[35] = v14;
  *(_OWORD *)(v14 + 16) = xmmword_25C61FCB0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16))(v14 + v13, v1, v20);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[36] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_25C611D58;
  OUTLINED_FUNCTION_7_3();
  return sub_25C6128AC(v16, v17);
}

uint64_t sub_25C611D58()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  *(void *)(v6 + 296) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C611E40()
{
  OUTLINED_FUNCTION_57();
  unint64_t v1 = v0[37];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C61EE90();
    swift_bridgeObjectRelease();
    if (v2 == 1)
    {
      swift_bridgeObjectRetain();
      if (sub_25C61EE90()) {
        goto LABEL_4;
      }
      swift_bridgeObjectRelease();
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2 == 1)
    {
      swift_bridgeObjectRetain();
LABEL_4:
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v3 = MEMORY[0x26118C320](0, v0[37]);
        goto LABEL_7;
      }
      if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v3 = *(void *)(v0[37] + 32);
        swift_retain();
LABEL_7:
        v0[38] = v3;
        uint64_t v4 = v0[26];
        OUTLINED_FUNCTION_70();
        v0[39] = *(void *)(v4 + 56);
        swift_retain();
        uint64_t v5 = OUTLINED_FUNCTION_98();
        return MEMORY[0x270FA2498](v5, v6, v7);
      }
      __break(1u);
      goto LABEL_22;
    }
  }
  if (qword_26B3515D8[0] != -1) {
LABEL_22:
  }
    swift_once();
  uint64_t v8 = sub_25C61E9D0();
  os_log_type_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B3515A8);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25C61E9B0();
  os_log_type_t v11 = sub_25C61EBF0();
  if (OUTLINED_FUNCTION_25(v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    swift_bridgeObjectRelease();
    v0[17] = v2;
    sub_25C61EC20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5FA000, v10, v9, "Unexpected records retrieved count: %ld", v12, 0xCu);
    OUTLINED_FUNCTION_20();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v13 = OUTLINED_FUNCTION_43();
  v14(v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  return v15();
}

uint64_t sub_25C6120E0()
{
  OUTLINED_FUNCTION_37();
  v0[40] = sub_25C609044(v0[34]);
  v0[41] = 0;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C612168()
{
  OUTLINED_FUNCTION_117();
  os_log_type_t v21 = v1;
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C61E9D0();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_42(v4, (uint64_t)qword_26B3515A8);
  os_log_type_t v6 = sub_25C61EBE0();
  if (OUTLINED_FUNCTION_18_1(v6))
  {
    uint64_t v3 = v1 + 21;
    uint64_t v7 = v1[40];
    uint64_t v0 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_97();
    *(_DWORD *)uint64_t v0 = 136315394;
    OUTLINED_FUNCTION_82();
    v1[21] = sub_25C618C00(0xD000000000000031, v8, v9);
    sub_25C61EC20();
    *(_WORD *)(v0 + 12) = 2048;
    v1[22] = v7;
    sub_25C61EC20();
    OUTLINED_FUNCTION_115(&dword_25C5FA000, v10, v11, "Function: %s > Successfully deleted all phrases corresponding to source tapped suggestion: %ld");
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }

  uint64_t result = OUTLINED_FUNCTION_93();
  if (__OFADD__(*(void *)v0, 1))
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_44(*(void *)v0 + 1);
    uint64_t v13 = sub_25C61E730();
    OUTLINED_FUNCTION_125(v13);
    OUTLINED_FUNCTION_91();
    sub_25C5FCF44(v2, v0);
    swift_endAccess();
    type metadata accessor for VectorSearchAssets.Builder();
    uint64_t inited = swift_initStackObject();
    uint64_t v15 = MEMORY[0x263F8EE88];
    *(void *)(inited + 16) = MEMORY[0x263F8EE78];
    *(void *)(inited + 24) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB668);
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_25C61FF30;
    *(void *)(v16 + 32) = v3;
    unint64_t v20 = v16;
    sub_25C61EB60();
    sub_25C60A0E8(v20);
    swift_bridgeObjectRelease();
    swift_release();
    sub_25C60A520((uint64_t *)&v20);
    swift_release();
    unint64_t v17 = v20;
    v1[42] = v20;
    v1[18] = v17;
    uint64_t v18 = (void *)swift_task_alloc();
    v1[43] = v18;
    *uint64_t v18 = v1;
    v18[1] = sub_25C612410;
    uint64_t v19 = (uint64_t *)OUTLINED_FUNCTION_127();
    return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(v19);
  }
  return result;
}

uint64_t sub_25C612410()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C6124F4()
{
  OUTLINED_FUNCTION_37();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_43();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  return v2();
}

uint64_t sub_25C61257C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_19_1();
  a21 = v25;
  a22 = v26;
  OUTLINED_FUNCTION_61();
  a20 = v22;
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  char v27 = (void *)v22[41];
  uint64_t v28 = sub_25C61E9D0();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B3515A8);
  id v29 = v27;
  id v30 = v27;
  id v31 = (void *)sub_25C61E9B0();
  os_log_type_t v32 = sub_25C61EBF0();
  BOOL v33 = OUTLINED_FUNCTION_36(v32);
  os_log_type_t v34 = (void *)v22[41];
  if (v33)
  {
    uint64_t v35 = OUTLINED_FUNCTION_14_1();
    uint64_t v36 = (void *)OUTLINED_FUNCTION_39();
    uint64_t v24 = OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v35 = 136315394;
    a11 = v24;
    v22[19] = sub_25C618C00(0xD000000000000031, 0x800000025C620B50, (uint64_t *)&a11);
    OUTLINED_FUNCTION_78();
    *(_WORD *)(v35 + 12) = 2112;
    uint64_t v37 = v34;
    uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
    v22[20] = v38;
    sub_25C61EC20();
    *uint64_t v36 = v38;
    MEMORY[0x26118C8A0](v34);
    MEMORY[0x26118C8A0](v34);
    OUTLINED_FUNCTION_48(&dword_25C5FA000, v39, v40, "Function: %s > Error encountered while attempting to delete phrases corresponding to tapped suggestion: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C0);
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    MEMORY[0x26118C8A0](v34);
  }
  else
  {
    MEMORY[0x26118C8A0](v22[41]);
    MEMORY[0x26118C8A0](v34);
    MEMORY[0x26118C8A0](v34);
  }
  uint64_t result = OUTLINED_FUNCTION_93();
  if (__OFADD__(*v34, 1))
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_44(*v34 + 1);
    uint64_t v42 = sub_25C61E730();
    OUTLINED_FUNCTION_125(v42);
    OUTLINED_FUNCTION_91();
    sub_25C5FCF44(v23, (uint64_t)v34);
    swift_endAccess();
    type metadata accessor for VectorSearchAssets.Builder();
    uint64_t inited = swift_initStackObject();
    uint64_t v44 = MEMORY[0x263F8EE88];
    *(void *)(inited + 16) = MEMORY[0x263F8EE78];
    *(void *)(inited + 24) = v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB668);
    uint64_t v45 = swift_initStackObject();
    *(_OWORD *)(v45 + 16) = xmmword_25C61FF30;
    *(void *)(v45 + 32) = v24;
    a11 = v45;
    sub_25C61EB60();
    sub_25C60A0E8(a11);
    swift_bridgeObjectRelease();
    swift_release();
    sub_25C60A520((uint64_t *)&a11);
    swift_release();
    unint64_t v46 = a11;
    v22[42] = a11;
    v22[18] = v46;
    uint64_t v47 = (void *)swift_task_alloc();
    v22[43] = v47;
    *uint64_t v47 = v22;
    v47[1] = sub_25C612410;
    OUTLINED_FUNCTION_127();
    OUTLINED_FUNCTION_7_3();
    return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(v48);
  }
  return result;
}

uint64_t sub_25C6128AC(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = sub_25C61E900();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C612970, 0, 0);
}

uint64_t sub_25C612970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_61();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v15 = sub_25C61E800();
  *(void *)(v14 + 88) = v15;
  uint64_t v16 = *(void *)(v15 + 16);
  *(void *)(v14 + 96) = v16;
  if (v16)
  {
    uint64_t v17 = *(void *)(v14 + 64);
    uint64_t v18 = *(void *)(v14 + 72);
    uint64_t v19 = *(void (**)(void, unint64_t, uint64_t))(v18 + 16);
    v18 += 16;
    int v20 = *(_DWORD *)(v18 + 64);
    *(_DWORD *)(v14 + 144) = v20;
    *(void *)(v14 + 104) = *(void *)(v18 + 56);
    *(void *)(v14 + 112) = v19;
    *(void *)(v14 + 120) = 0;
    v19(*(void *)(v14 + 80), v15 + ((v20 + 32) & ~(unint64_t)v20), v17);
    os_log_type_t v21 = (void *)swift_task_alloc();
    *(void *)(v14 + 128) = v21;
    *os_log_type_t v21 = v14;
    v21[1] = sub_25C612C68;
    OUTLINED_FUNCTION_99(*(void *)(v14 + 80));
    OUTLINED_FUNCTION_7_3();
    return sub_25C6131B8(v22);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_7_3();
    return v27(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_25C612C68()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 136) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C612D38()
{
  OUTLINED_FUNCTION_37();
  if (v0[17])
  {
    uint64_t v1 = swift_retain();
    MEMORY[0x26118C050](v1);
    OUTLINED_FUNCTION_111();
    if (v2) {
      OUTLINED_FUNCTION_105();
    }
    sub_25C61EB90();
    sub_25C61EB60();
    swift_release();
  }
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[15] + 1;
  OUTLINED_FUNCTION_67();
  v5();
  if (v4 == v3)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v6 = OUTLINED_FUNCTION_95();
    return v7(v6);
  }
  else
  {
    ++v0[15];
    OUTLINED_FUNCTION_45();
    v9();
    uint64_t v10 = (void *)swift_task_alloc();
    v0[16] = (uint64_t)v10;
    void *v10 = v0;
    v10[1] = sub_25C612C68;
    uint64_t v11 = OUTLINED_FUNCTION_99(v0[10]);
    return sub_25C6131B8(v11);
  }
}

uint64_t DefaultSiriAutoCompleteService.fetchPhrasesMatching(filters:)(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  OUTLINED_FUNCTION_11_2();
  v2[5] = v3;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C612ECC, 0);
}

uint64_t sub_25C612ECC()
{
  OUTLINED_FUNCTION_57();
  uint64_t v1 = sub_25C60ED70(1, v0[4] + 16);
  v0[6] = v1;
  if (!v1)
  {
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25C61E9D0();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_42(v7, (uint64_t)qword_26B3515A8);
    os_log_type_t v9 = sub_25C61EBE0();
    if (OUTLINED_FUNCTION_25(v9))
    {
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_97();
      OUTLINED_FUNCTION_50(4.8149e-34);
      OUTLINED_FUNCTION_82();
      v0[2] = sub_25C618C00(0xD00000000000001ELL, v10, v11);
      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_28(&dword_25C5FA000, v12, v13, "Function: %s > Unable to fetch autoCompleteResults; VectorDatabaseClient was not created");
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }

    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_32();
    __asm { BRAA            X2, X16 }
  }
  char v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *char v2 = v0;
  v2[1] = sub_25C61308C;
  OUTLINED_FUNCTION_99(v0[3]);
  OUTLINED_FUNCTION_32();
  return sub_25C6128AC(v3, v4);
}

uint64_t sub_25C61308C()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *char v2 = v1;
  *char v2 = *v0;
  *(void *)(v1 + 64) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C61315C()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  OUTLINED_FUNCTION_34();
  return v0();
}

uint64_t sub_25C6131B8(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_9_2((uint64_t)sub_25C6131D4, 0);
}

uint64_t sub_25C6131D4()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v1 = *(void *)(v0[4] + 144);
  v0[5] = v1;
  v0[6] = sub_25C61E8D0();
  v0[7] = v2;
  return MEMORY[0x270FA2498](sub_25C613244, v1, 0);
}

uint64_t sub_25C613244()
{
  OUTLINED_FUNCTION_5_3();
  *(void *)(v0 + 64) = sub_25C605000();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

#error "25C61357C: call analysis failed (funcsize=227)"

uint64_t sub_25C613680()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C604F84();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_25C6136F4()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C61CE2C(*(void *)(v0 + 72), *(void *)(v0 + 80));
  OUTLINED_FUNCTION_34();
  return v1();
}

id static DefaultSiriAutoCompleteService.databaseExists()()
{
  uint64_t v0 = sub_25C61E6F0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  if (qword_26B351938 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v0, (uint64_t)qword_26B351940);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v7, v0);
  sub_25C61E6C0();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v2 + 8);
  v8(v6, v0);
  id v9 = objc_msgSend(self, sel_defaultManager);
  sub_25C61E6E0();
  unint64_t v10 = (void *)sub_25C61EA10();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_fileExistsAtPath_, v10);

  uint64_t v12 = OUTLINED_FUNCTION_71();
  ((void (*)(uint64_t))v8)(v12);
  return v11;
}

uint64_t DefaultSiriAutoCompleteService.autoCompleteResults(for:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[8] = v2;
  v1[9] = v0;
  v1[7] = v3;
  OUTLINED_FUNCTION_11_2();
  v1[10] = v4;
  uint64_t v5 = sub_25C61E600();
  v1[11] = v5;
  OUTLINED_FUNCTION_1_5(v5);
  v1[12] = v6;
  v1[13] = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C6139A0()
{
  OUTLINED_FUNCTION_35();
  uint64_t v1 = v0[9];
  v0[2] = sub_25C61EA30();
  v0[3] = v2;
  sub_25C61E5F0();
  sub_25C5FDE14();
  v0[14] = sub_25C61EC70();
  v0[15] = v3;
  uint64_t v4 = OUTLINED_FUNCTION_47();
  v5(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + 144);
  v0[16] = v6;
  return MEMORY[0x270FA2498](sub_25C613A68, v6, 0);
}

uint64_t sub_25C613A68()
{
  OUTLINED_FUNCTION_5_3();
  *(void *)(v0 + 136) = sub_25C604EEC();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

#error "25C613D94: call analysis failed (funcsize=203)"

uint64_t sub_25C613E30()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 128);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v8 + 160) = v7;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C613F14, v4, 0);
}

uint64_t sub_25C613F14()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C604E70();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_25C613F88()
{
  OUTLINED_FUNCTION_5_3();
  swift_release();
  swift_task_dealloc();
  uint64_t v0 = OUTLINED_FUNCTION_95();
  return v1(v0);
}

uint64_t DefaultSiriAutoCompleteService.autoCompleteResults(for:readDatabaseClient:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[12] = v2;
  v1[13] = v0;
  v1[10] = v3;
  v1[11] = v4;
  OUTLINED_FUNCTION_11_2();
  v1[14] = v5;
  uint64_t v6 = sub_25C61E900();
  v1[15] = v6;
  OUTLINED_FUNCTION_1_5(v6);
  v1[16] = v7;
  v1[17] = OUTLINED_FUNCTION_15_1();
  uint64_t v8 = sub_25C61E8B0();
  v1[18] = v8;
  OUTLINED_FUNCTION_1_5(v8);
  v1[19] = v9;
  v1[20] = OUTLINED_FUNCTION_15_1();
  uint64_t v10 = sub_25C61E600();
  v1[21] = v10;
  OUTLINED_FUNCTION_1_5(v10);
  v1[22] = v11;
  v1[23] = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25C6140E4()
{
  *(void *)(v0 + 192) = type metadata accessor for SignpostLogger();
  if (qword_26A5BB530 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 168);
  static SignpostLogger.begin(log:name:telemetry:)(qword_26A5BB600, (uint64_t)"FetchAutoCompleteResults", 24, 2, (uint64_t)"enableTelemetry=YES", 19, 2);
  *(void *)(v0 + 16) = sub_25C61EA30();
  *(void *)(v0 + 24) = v4;
  sub_25C61E5F0();
  sub_25C5FDE14();
  uint64_t v5 = sub_25C61EC70();
  unint64_t v7 = v6;
  *(void *)(v0 + 200) = v5;
  *(void *)(v0 + 208) = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_51(qword_26A5BB600, (uint64_t)"FetchAutoCompleteResults", v40, v41, (uint64_t)"enableTelemetry=YES");
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_38();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v57 = v5;
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25C61E9D0();
  OUTLINED_FUNCTION_89(v9, (uint64_t)qword_26B3515A8);
  uint64_t v54 = v5;
  uint64_t v10 = sub_25C61E9B0();
  os_log_type_t v11 = sub_25C61EBE0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_40();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v0 + 64) = OUTLINED_FUNCTION_118((uint64_t)"enableTelemetry=YES", v52, v0 + 64, v53, v54, v55, v56, v57);
    sub_25C61EC20();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v13 = OUTLINED_FUNCTION_116();
    *(void *)(v0 + 72) = sub_25C618C00(v13, v14, v15);
    sub_25C61EC20();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5FA000, v10, v11, "Function: %s > Fetching autocomplete results for: '%s'", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }
  else
  {
    OUTLINED_FUNCTION_70();
  }

  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v16 = *(void *)(v0 + 160);
  *(void *)(v0 + 32) = MEMORY[0x263F8EE78];
  uint64_t v18 = OUTLINED_FUNCTION_116();
  sub_25C614F50(v18, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB6D8);
  int v20 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB6E0) - 8);
  uint64_t v21 = *(void *)(*(void *)v20 + 72);
  unint64_t v22 = (*(unsigned __int8 *)(*(void *)v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v20 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_25C61FFA0;
  unint64_t v24 = v23 + v22;
  uint64_t v25 = v20[14];
  *(void *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 8) = 1;
  uint64_t v26 = *(void (**)(uint64_t))(v17 + 104);
  uint64_t v27 = OUTLINED_FUNCTION_126();
  v26(v27);
  OUTLINED_FUNCTION_33();
  *(unsigned char *)(v24 + v25) = 1;
  uint64_t v28 = v20[14];
  *(void *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 8) = 0;
  uint64_t v29 = OUTLINED_FUNCTION_126();
  v26(v29);
  sub_25C61E890();
  *(unsigned char *)(v24 + v21 + v28) = 0;
  uint64_t v30 = sub_25C61E800();
  *(void *)(v0 + 216) = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)(v30 + 16);
  *(void *)(v0 + 224) = v31;
  if (v31)
  {
    uint64_t v32 = *(void *)(v0 + 120);
    uint64_t v33 = *(void *)(v0 + 128);
    os_log_type_t v34 = *(void (**)(void, unint64_t, uint64_t))(v33 + 16);
    v33 += 16;
    int v35 = *(_DWORD *)(v33 + 64);
    *(_DWORD *)(v0 + 304) = v35;
    *(void *)(v0 + 232) = *(void *)(v33 + 56);
    *(void *)(v0 + 240) = v34;
    *(void *)(v0 + 248) = 0;
    v34(*(void *)(v0 + 136), *(void *)(v0 + 216) + ((v35 + 32) & ~(unint64_t)v35), v32);
    uint64_t v36 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v36;
    *uint64_t v36 = v0;
    v36[1] = sub_25C614948;
    OUTLINED_FUNCTION_99(*(void *)(v0 + 136));
    OUTLINED_FUNCTION_38();
    return sub_25C6131B8(v37);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25C61E7F0();
    unint64_t v44 = *(void *)(v0 + 32);
    *(void *)(v0 + 272) = v44;
    if (v44 >> 62)
    {
      OUTLINED_FUNCTION_128();
      uint64_t v45 = sub_25C61EE90();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v45)
    {
      *(void *)(v0 + 296) = *(void *)(*(void *)(v0 + 104) + 144);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_98();
      OUTLINED_FUNCTION_38();
      return MEMORY[0x270FA2498](v46, v47, v48);
    }
    else
    {
      swift_bridgeObjectRelease();
      type metadata accessor for TypoRecoveryManager();
      int v50 = (void *)swift_task_alloc();
      *(void *)(v0 + 280) = v50;
      *int v50 = v0;
      v50[1] = sub_25C614C58;
      OUTLINED_FUNCTION_59(*(void *)(v0 + 200));
      OUTLINED_FUNCTION_38();
      return sub_25C60ACB8();
    }
  }
}

uint64_t sub_25C614948()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 264) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C614A18()
{
  OUTLINED_FUNCTION_37();
  if (v0[33])
  {
    uint64_t v1 = swift_retain();
    MEMORY[0x26118C050](v1);
    OUTLINED_FUNCTION_111();
    if (v2) {
      OUTLINED_FUNCTION_105();
    }
    sub_25C61EB90();
    sub_25C61EB60();
    swift_release();
  }
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[31] + 1;
  OUTLINED_FUNCTION_67();
  v5();
  if (v4 == v3)
  {
    swift_bridgeObjectRelease();
    sub_25C61E7F0();
    unint64_t v6 = v0[4];
    v0[34] = v6;
    if (v6 >> 62)
    {
      OUTLINED_FUNCTION_128();
      uint64_t v7 = sub_25C61EE90();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v7)
    {
      v0[37] = *(void *)(v0[13] + 144);
      swift_bridgeObjectRetain();
      uint64_t v8 = OUTLINED_FUNCTION_98();
      return MEMORY[0x270FA2498](v8, v9, v10);
    }
    else
    {
      swift_bridgeObjectRelease();
      type metadata accessor for TypoRecoveryManager();
      unint64_t v14 = (void *)swift_task_alloc();
      v0[35] = v14;
      *unint64_t v14 = v0;
      v14[1] = sub_25C614C58;
      OUTLINED_FUNCTION_59(v0[25]);
      return sub_25C60ACB8();
    }
  }
  else
  {
    ++v0[31];
    OUTLINED_FUNCTION_45();
    v11();
    uint64_t v12 = (void *)swift_task_alloc();
    v0[32] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_25C614948;
    uint64_t v13 = OUTLINED_FUNCTION_99(v0[17]);
    return sub_25C6131B8(v13);
  }
}

uint64_t sub_25C614C58()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_13_2();
  *char v2 = v1;
  *char v2 = *v0;
  *(void *)(v1 + 288) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C614D28()
{
  OUTLINED_FUNCTION_35();
  unint64_t v1 = v0[36];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  v0[4] = v1;
  uint64_t v4 = sub_25C615340(v1, v2, v3, 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_51(qword_26A5BB600, (uint64_t)"FetchAutoCompleteResults", v5, v6, (uint64_t)"enableTelemetry=YES");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v4);
}

uint64_t sub_25C614E04()
{
  OUTLINED_FUNCTION_5_3();
  sub_25C604908(*(void *)(v0 + 80), *(void *)(v0 + 88));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C614E78()
{
  OUTLINED_FUNCTION_35();
  uint64_t v1 = sub_25C615340(v0[4], v0[25], v0[26], 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_51(qword_26A5BB600, (uint64_t)"FetchAutoCompleteResults", v2, v3, (uint64_t)"enableTelemetry=YES");
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v1);
}

uint64_t sub_25C614F50(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = sub_25C61E8B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  uint64_t v54 = v7;
  uint64_t v8 = sub_25C61E8A0();
  uint64_t v9 = OUTLINED_FUNCTION_23(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  uint64_t v56 = v10;
  uint64_t v55 = sub_25C61E850();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  uint64_t v58 = 32;
  unint64_t v59 = 0xE100000000000000;
  sub_25C5FDE14();
  uint64_t v16 = sub_25C61EC50();
  uint64_t v17 = *(void *)(v16 + 16);
  v46[1] = v16;
  if (v17)
  {
    int v52 = *MEMORY[0x263F84720];
    uint64_t v51 = v5 + 104;
    int v18 = *MEMORY[0x263F846E8];
    int v49 = *MEMORY[0x263F84740];
    int v50 = v18;
    uint64_t v48 = v12 + 32;
    uint64_t v19 = (uint64_t *)(v16 + 40);
    uint64_t v20 = MEMORY[0x263F8EE78];
    long long v47 = xmmword_25C61FCB0;
    uint64_t v53 = v12;
    do
    {
      uint64_t v22 = *(v19 - 1);
      uint64_t v21 = *v19;
      uint64_t v23 = HIBYTE(*v19) & 0xF;
      if ((*v19 & 0x2000000000000000) == 0) {
        uint64_t v23 = v22 & 0xFFFFFFFFFFFFLL;
      }
      if (v23)
      {
        unint64_t v24 = v54;
        void *v54 = 0;
        v24[1] = 0;
        OUTLINED_FUNCTION_29();
        v25();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_102();
        sub_25C61E890();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C8);
        uint64_t v26 = v15;
        uint64_t v27 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0) - 8);
        unint64_t v28 = (*(unsigned __int8 *)(*(void *)v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v27 + 80);
        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = v47;
        uint64_t v30 = (void *)(v29 + v28 + v27[14]);
        sub_25C61E880();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_29();
        v31();
        uint64_t v60 = v22;
        uint64_t v61 = v21;
        sub_25C61EA90();
        uint64_t v32 = v61;
        *uint64_t v30 = v60;
        v30[1] = v32;
        uint64_t v33 = sub_25C61E8C0();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_29();
        v34();
        uint64_t v35 = (uint64_t)v30;
        uint64_t v15 = v26;
        __swift_storeEnumTagSinglePayload(v35, 0, 1, v33);
        OUTLINED_FUNCTION_87();
        sub_25C61E840();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          char v39 = OUTLINED_FUNCTION_53();
          uint64_t v20 = sub_25C602EF0(v39, v40, v41, v20);
        }
        unint64_t v37 = *(void *)(v20 + 16);
        unint64_t v36 = *(void *)(v20 + 24);
        uint64_t v38 = v53;
        if (v37 >= v36 >> 1)
        {
          char v42 = OUTLINED_FUNCTION_104(v36);
          uint64_t v20 = sub_25C602EF0(v42, v43, v44, v20);
        }
        *(void *)(v20 + 16) = v37 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v20+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v37, v26, v55);
      }
      v19 += 2;
      --v17;
    }
    while (v17);
  }
  else
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_25C615340(unint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  LOBYTE(v5) = a4;
  uint64_t v107 = a2;
  uint64_t v100 = sub_25C61E730();
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10();
  uint64_t v101 = v10;
  uint64_t v106 = v4;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 104), *(void *)(v4 + 128));
  uint64_t v11 = (uint64_t *)sub_25C6044F4();
  unint64_t v12 = swift_bridgeObjectRetain();
  unint64_t v13 = sub_25C60EAE8(v12, (uint64_t)v11);
  *(void *)&long long v105 = 0;
  if (qword_26B3515D8[0] != -1) {
    goto LABEL_56;
  }
  while (1)
  {
    uint64_t v14 = sub_25C61E9D0();
    OUTLINED_FUNCTION_89(v14, (uint64_t)qword_26B3515A8);
    uint64_t v108 = v11;
    uint64_t v15 = sub_25C61E9B0();
    os_log_type_t v16 = sub_25C61EBE0();
    uint64_t v17 = sub_25C61F000;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v18 = OUTLINED_FUNCTION_14_1();
      uint64_t v19 = OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_106(v19);
      OUTLINED_FUNCTION_119(4.8151e-34);
      uint64_t v20 = OUTLINED_FUNCTION_21_1((uint64_t)"assistantSuggestions");
      OUTLINED_FUNCTION_66(v20);
      *(_WORD *)(v18 + 12) = 2048;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25C61EE90();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_64();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5FA000, v15, v16, "Function: %s > INPUT Count: '%ld'", (uint8_t *)v18, 0x16u);
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();

      uint64_t v17 = sub_25C61F000;
    }
    else
    {

      OUTLINED_FUNCTION_70();
    }
    v111[0] = v107;
    v111[1] = a3;
    uint64_t v109 = 32;
    unint64_t v110 = 0xE100000000000000;
    sub_25C5FDE14();
    uint64_t v21 = sub_25C61EC50();
    if ((v5 & 1) == 0)
    {
      unint64_t v22 = OUTLINED_FUNCTION_116();
      uint64_t v24 = sub_25C616008(v22, v23);
      swift_bridgeObjectRelease();
      unint64_t v13 = v24;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_25C61E9B0();
    os_log_type_t v26 = sub_25C61EBE0();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = MEMORY[0x263F8EE58];
    if (v27)
    {
      uint64_t v29 = OUTLINED_FUNCTION_14_1();
      uint64_t v30 = OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_106(v30);
      OUTLINED_FUNCTION_119(COERCE_FLOAT(*((void *)v17 + 388)));
      uint64_t v31 = OUTLINED_FUNCTION_21_1((uint64_t)"assistantSuggestions");
      OUTLINED_FUNCTION_66(v31);
      *(_WORD *)(v29 + 12) = 2048;
      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_25C61EE90();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_64();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5FA000, v25, v26, "Function: %s > Count stopWordFilteredPhrases: '%ld'", (uint8_t *)v29, 0x16u);
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v32 = sub_25C60BF6C(20, v13);
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    unint64_t v38 = v37;
    swift_bridgeObjectRetain();
    uint64_t v39 = v105;
    sub_25C60E7B0(v32, v34, v36, v38, v21);
    uint64_t v41 = v40;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRetain();
    char v42 = sub_25C61E9B0();
    os_log_type_t v43 = sub_25C61EBE0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = OUTLINED_FUNCTION_14_1();
      uint64_t v45 = OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_106(v45);
      *(_DWORD *)uint64_t v44 = 136315394;
      uint64_t v46 = OUTLINED_FUNCTION_21_1((uint64_t)"assistantSuggestions");
      OUTLINED_FUNCTION_65(v46);
      *(_WORD *)(v44 + 12) = 2048;
      uint64_t v109 = *(void *)(v41 + 16);
      sub_25C61EC20();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5FA000, v42, v43, "Function: %s > Count result: '%ld'", (uint8_t *)v44, 0x16u);
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    sub_25C61633C();
    uint64_t v47 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v48 = (void *)sub_25C61E9B0();
    os_log_type_t v49 = sub_25C61EBE0();
    if (OUTLINED_FUNCTION_18_1(v49))
    {
      uint64_t v50 = OUTLINED_FUNCTION_14_1();
      uint64_t v51 = OUTLINED_FUNCTION_5_4();
      OUTLINED_FUNCTION_106(v51);
      OUTLINED_FUNCTION_119(4.8151e-34);
      uint64_t v52 = OUTLINED_FUNCTION_21_1((uint64_t)"assistantSuggestions");
      OUTLINED_FUNCTION_65(v52);
      *(_WORD *)(v50 + 12) = 2048;
      uint64_t v109 = *(void *)(v47 + 16);
      sub_25C61EC20();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_113(&dword_25C5FA000, v53, v54, "Function: %s > Count rankedBasedOnSourceAndNormalizedScore: '%ld'");
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v55 = sub_25C616384(v107, a3, v47);
    swift_bridgeObjectRelease();
    uint64_t v56 = v101;
    uint64_t v57 = sub_25C61E720();
    MEMORY[0x270FA5388](v57);
    *(&v91 - 2) = v106;
    *(&v91 - 1) = v56;
    v111[0] = v55;
    swift_bridgeObjectRetain();
    sub_25C619880((uint64_t (*)(uint64_t *, uint64_t *))sub_25C61BDB4, (uint64_t)(&v91 - 4));
    if (v39)
    {
      swift_release();
      __break(1u);
      JUMPOUT(0x25C615FE8);
    }
    swift_bridgeObjectRelease();
    uint64_t v58 = sub_25C6168E8(v111[0]);
    swift_release();
    uint64_t v59 = sub_25C60C10C(3, (uint64_t)v58);
    uint64_t v63 = sub_25C60EA00(v59, v60, v61, v62);
    swift_bridgeObjectRetain_n();
    uint64_t v64 = sub_25C61E9B0();
    uint64_t v65 = sub_25C61EBE0();
    if (os_log_type_enabled(v64, (os_log_type_t)v65))
    {
      uint64_t v66 = OUTLINED_FUNCTION_14_1();
      v111[0] = OUTLINED_FUNCTION_40();
      *(_DWORD *)uint64_t v66 = 136315394;
      uint64_t v109 = OUTLINED_FUNCTION_21_1((uint64_t)"assistantSuggestions");
      sub_25C61EC20();
      *(_WORD *)(v66 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_25C618C00(v107, a3, v111);
      sub_25C61EC20();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5FA000, v64, (os_log_type_t)v65, "Function: %s > Results matching query '%s'", (uint8_t *)v66, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3 = *(void *)(v63 + 16);
    if (!a3) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v92 = v63;
    uint64_t v67 = (uint64_t *)(v63 + 48);
    *(void *)&long long v68 = 136316418;
    long long v105 = v68;
    unint64_t v103 = (unint64_t)"siriKitIntentTranscript";
    unint64_t v104 = 0xD000000000000014;
    uint64_t v102 = v28 + 8;
    unint64_t v98 = 0xD000000000000017;
    unint64_t v97 = (unint64_t)"appIntentTranscript";
    unint64_t v96 = 0xD000000000000013;
    unint64_t v95 = (unint64_t)"assistantIntentExamplePhrases";
    unint64_t v94 = "staticSuggestions";
    uint64_t v93 = "typingSessionCache";
    do
    {
      uint64_t v69 = *(v67 - 2);
      uint64_t v70 = *v67;
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      char v71 = sub_25C61E9B0();
      os_log_type_t v72 = sub_25C61EBE0();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = swift_slowAlloc();
        uint64_t v107 = swift_slowAlloc();
        v111[0] = v107;
        *(_DWORD *)uint64_t v73 = v105;
        OUTLINED_FUNCTION_2();
        swift_bridgeObjectRetain();
        *(void *)(v73 + 4) = OUTLINED_FUNCTION_49();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 12) = 2080;
        OUTLINED_FUNCTION_2();
        swift_bridgeObjectRetain();
        *(void *)(v73 + 14) = OUTLINED_FUNCTION_49();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 22) = 2048;
        *(void *)(v73 + 24) = v70;
        swift_bridgeObjectRelease();
        swift_release();
        *(_WORD *)(v73 + 32) = 2080;
        uint64_t v74 = v104;
        unint64_t v75 = v103 | 0x8000000000000000;
        switch(*(unsigned char *)(v69 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source))
        {
          case 1:
            unint64_t v75 = v97 | 0x8000000000000000;
            uint64_t v76 = &v116;
            goto LABEL_32;
          case 2:
            unint64_t v75 = v95 | 0x8000000000000000;
            uint64_t v76 = &v115;
LABEL_32:
            uint64_t v74 = *(v76 - 32);
            break;
          case 3:
            unint64_t v75 = 0xE900000000000068;
            uint64_t v74 = 0x636E75614C707061;
            break;
          case 4:
            unint64_t v75 = 0xEB00000000747563;
            uint64_t v74 = 0x74726F6853707061;
            break;
          case 5:
            unint64_t v75 = 0xED00007475637472;
            uint64_t v74 = 0x6F68536563696F76;
            break;
          case 6:
            uint64_t v74 = 0xD00000000000001DLL;
            uint64_t v77 = &v114;
            goto LABEL_37;
          case 7:
            uint64_t v74 = 0xD000000000000011;
            uint64_t v77 = &v113;
LABEL_37:
            unint64_t v75 = *(v77 - 32) | 0x8000000000000000;
            break;
          default:
            break;
        }
        *(void *)(v73 + 34) = sub_25C618C00(v74, v75, v111);
        OUTLINED_FUNCTION_100();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 42) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v73 + 44) = OUTLINED_FUNCTION_49();
        OUTLINED_FUNCTION_100();
        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 52) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v73 + 54) = OUTLINED_FUNCTION_49();
        OUTLINED_FUNCTION_100();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C5FA000, v71, v72, "Phrase: %s, invocationPhrase: %s, editDistance: %f, source: %s, bundleId: %s, actionIdentifier: %s", (uint8_t *)v73, 0x3Eu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_20();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_100();
      }
      else
      {

        OUTLINED_FUNCTION_70();
        swift_release_n();
      }
      v67 += 3;
      --a3;
    }
    while (a3);
    uint64_t v78 = v92;
    swift_bridgeObjectRelease();
    a1 = *(void *)(v78 + 16);
    uint64_t v79 = MEMORY[0x263F8EE78];
    if (!a1) {
      goto LABEL_54;
    }
    uint64_t v112 = MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v11 = &v112;
    sub_25C61EE40();
    uint64_t v80 = v78;
    uint64_t v81 = 0;
    unint64_t v13 = v80 + 40;
    while (1)
    {
      uint64_t v5 = v81 + 1;
      if (__OFADD__(v81, 1)) {
        break;
      }
      uint64_t v82 = *(void *)(v13 - 8);
      OUTLINED_FUNCTION_2();
      a3 = *(void *)(v82 + 16);
      uint64_t v83 = *(void *)(v82 + 24);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_87();
      uint64_t v84 = sub_25C616E2C();
      if (v84 == a3 && v85 == v83)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v87 = v84;
        uint64_t v88 = v85;
        a3 = sub_25C61EFB0();
        swift_bridgeObjectRelease();
        if (a3) {
          swift_bridgeObjectRelease();
        }
        else {
          sub_25C5FC6C8(v87, v88);
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v11 = &v112;
      sub_25C61EE20();
      sub_25C61EE50();
      sub_25C61EE60();
      sub_25C61EE30();
      v13 += 24;
      ++v81;
      if (v5 == a1)
      {
        uint64_t v79 = v112;
        swift_release();
        goto LABEL_54;
      }
    }
    __break(1u);
LABEL_56:
    swift_once();
  }
  uint64_t v79 = MEMORY[0x263F8EE78];
LABEL_54:
  OUTLINED_FUNCTION_67();
  v89();
  swift_bridgeObjectRelease();
  return v79;
}

uint64_t sub_25C616008(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)(a2 + 16);
    unint64_t v23 = v3;
    unint64_t v24 = v3 & 0xC000000000000001;
    uint64_t v20 = v3 & 0xFFFFFFFFFFFFFF8;
    uint64_t v26 = v6;
    uint64_t v21 = v4;
    uint64_t v22 = a2;
    while (1)
    {
      if (v24)
      {
        MEMORY[0x26118C320](v5, v3);
      }
      else
      {
        if (v5 >= *(void *)(v20 + 16)) {
          goto LABEL_33;
        }
        swift_retain();
      }
      if (__OFADD__(v5++, 1)) {
        break;
      }
      uint64_t v8 = sub_25C5FDD94();
      uint64_t v9 = v8;
      if (!v6)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      unint64_t v25 = v5;
      uint64_t v10 = *(void *)(v8 + 16);
      swift_bridgeObjectRetain();
      BOOL v27 = (uint64_t *)(v9 + 40);
      for (uint64_t i = 1; ; ++i)
      {
        swift_bridgeObjectRetain();
        if (v10) {
          break;
        }
        swift_bridgeObjectRelease();
LABEL_22:
        if (i == v6)
        {
          swift_release();
          swift_bridgeObjectRelease();
          a2 = v22;
          swift_bridgeObjectRelease();
          unint64_t v3 = v23;
          uint64_t v4 = v21;
          goto LABEL_27;
        }
      }
      uint64_t v12 = v9;
      swift_bridgeObjectRetain();
      unint64_t v13 = v27;
      uint64_t v14 = v10;
      while (1)
      {
        uint64_t v15 = *(v13 - 1);
        uint64_t v16 = *v13;
        swift_bridgeObjectRetain();
        if (sub_25C61EAC0()) {
          break;
        }
        swift_bridgeObjectRelease();
LABEL_19:
        v13 += 2;
        if (!--v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = v12;
          swift_bridgeObjectRelease();
          uint64_t v6 = v26;
          goto LABEL_22;
        }
      }
      if (qword_26A5BB520 != -1) {
        swift_once();
      }
      char v17 = sub_25C601FDC(v15, v16, 0);
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = swift_retain();
      MEMORY[0x26118C050](v18);
      if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25C61EB70();
      }
      sub_25C61EB90();
      sub_25C61EB60();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v6 = v26;
      unint64_t v3 = v23;
      uint64_t v4 = v21;
      a2 = v22;
      swift_bridgeObjectRelease();
LABEL_27:
      unint64_t v5 = v25;
LABEL_29:
      if (v5 == v4)
      {
        swift_bridgeObjectRelease();
        return v28;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C61EE90();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_25C61633C()
{
  swift_bridgeObjectRetain();
  sub_25C619814(&v0);
}

uint64_t sub_25C616384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = MEMORY[0x263F8EE78];
  uint64_t v45 = MEMORY[0x263F8EE88];
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4)
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = MEMORY[0x263F8EE78];
  uint64_t v7 = (void *)(a3 + 48);
  do
  {
    long long v43 = *((_OWORD *)v7 - 1);
    double v8 = *(double *)v7;
    uint64_t v9 = *(void *)(v43 + 56);
    uint64_t v10 = *(void *)(v43 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
    uint64_t v11 = *(void *)(v43 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8);
    char v12 = *(unsigned char *)(v43 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    v47[0] = *(void *)(v43 + 48);
    v47[1] = v9;
    v47[2] = v10;
    v47[3] = v11;
    char v48 = v12;
    OUTLINED_FUNCTION_2();
    if (sub_25C61EA30() == a1 && v13 == a2)
    {
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
LABEL_15:
      swift_retain();
      swift_bridgeObjectRetain();
      sub_25C61B250(0, 0, v43, *((uint64_t *)&v43 + 1), v8);
LABEL_16:
      sub_25C605E80((uint64_t)v44, (uint64_t)v47);
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    char v15 = sub_25C61EFB0();
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
    uint64_t v16 = v45;
    swift_bridgeObjectRetain();
    char v17 = sub_25C60134C(v47, v16);
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      uint64_t v22 = v46;
      swift_retain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        char v36 = OUTLINED_FUNCTION_53();
        sub_25C603118(v36, v37, v38, v22);
        uint64_t v22 = v39;
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_25C603118(v23 > 1, v24 + 1, 1, v22);
        uint64_t v22 = v40;
      }
      *(void *)(v22 + 16) = v24 + 1;
      uint64_t v25 = v22 + 24 * v24;
      *(_OWORD *)(v25 + 32) = v43;
      *(double *)(v25 + 48) = v8;
      uint64_t v46 = v22;
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v18 = v42;
    }
    else
    {
      char v26 = OUTLINED_FUNCTION_53();
      sub_25C603118(v26, v27, v28, v29);
      uint64_t v18 = v30;
    }
    unint64_t v20 = *(void *)(v18 + 16);
    unint64_t v19 = *(void *)(v18 + 24);
    if (v20 >= v19 >> 1)
    {
      char v31 = OUTLINED_FUNCTION_104(v19);
      sub_25C603118(v31, v32, v33, v34);
      uint64_t v18 = v35;
    }
    *(void *)(v18 + 16) = v20 + 1;
    uint64_t v42 = v18;
    unint64_t v21 = v18 + 24 * v20;
    *(_OWORD *)(v21 + 32) = v43;
    *(double *)(v21 + 48) = v8;
    swift_bridgeObjectRelease();
    swift_release_n();
LABEL_17:
    v7 += 3;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
LABEL_26:
  swift_bridgeObjectRelease();
  sub_25C60A7C0(v42);
  return v46;
}

BOOL sub_25C6166DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  double v3 = sub_25C61673C(*a1);
  return sub_25C61673C(v2) < v3;
}

long double sub_25C61673C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  uint64_t v4 = OUTLINED_FUNCTION_23(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_25C61E730();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_90();
  uint64_t v11 = a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  OUTLINED_FUNCTION_2();
  sub_25C61CDC4(v11, (uint64_t)v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_25C61CF04((uint64_t)v6, &qword_26B351500);
    double v12 = 1.0;
  }
  else
  {
    uint64_t v13 = OUTLINED_FUNCTION_121();
    v14(v13);
    sub_25C61E710();
    double v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
    double v12 = v16 / 3600.0;
  }
  char v17 = (uint64_t *)(a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount);
  OUTLINED_FUNCTION_2();
  double v18 = (double)*v17;
  return pow(0.99, v12) * v18;
}

char *sub_25C6168E8(uint64_t a1)
{
  uint64_t v60 = *(void *)(a1 + 16);
  if (!v60)
  {
    uint64_t v29 = (uint64_t *)MEMORY[0x263F8EE78];
    goto LABEL_30;
  }
  uint64_t v59 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v63 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v61 = v2;
    uint64_t v3 = (uint64_t *)(v59 + 24 * v2);
    uint64_t v4 = *v3;
    uint64_t v5 = v3[1];
    uint64_t v6 = v3[2];
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v62 = v4;
    uint64_t v7 = sub_25C5FDD94();
    uint64_t v8 = v7;
    uint64_t v67 = *(void *)(v5 + 16);
    if (v67)
    {
      uint64_t v9 = *(void *)(v7 + 16);
      swift_bridgeObjectRetain();
      char v10 = 0;
      unint64_t v11 = 0;
      uint64_t v65 = v5;
      uint64_t v66 = (uint64_t *)(v8 + 40);
      while (1)
      {
        char v64 = v10;
        unint64_t v12 = v11;
        while (1)
        {
          if (v12 >= *(void *)(v5 + 16))
          {
            __break(1u);
            goto LABEL_58;
          }
          unint64_t v11 = v12 + 1;
          if (v9) {
            break;
          }
LABEL_17:
          unint64_t v12 = v11;
          if (v11 == v67)
          {
            swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = v8;
        swift_bridgeObjectRetain();
        uint64_t v1 = v66;
        uint64_t v14 = v9;
        uint64_t v15 = v9;
        while (1)
        {
          uint64_t v16 = *(v1 - 1);
          uint64_t v17 = *v1;
          swift_bridgeObjectRetain();
          if (sub_25C61EAC0()) {
            break;
          }
          swift_bridgeObjectRelease();
LABEL_15:
          v1 += 2;
          if (!--v15)
          {
            swift_bridgeObjectRelease();
            uint64_t v8 = v13;
            swift_bridgeObjectRelease();
            uint64_t v5 = v65;
            uint64_t v9 = v14;
            goto LABEL_17;
          }
        }
        if (qword_26A5BB520 != -1) {
          swift_once();
        }
        char v18 = sub_25C601FDC(v16, v17, 1);
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_15;
        }
        swift_bridgeObjectRelease();
        uint64_t v8 = v13;
        swift_bridgeObjectRelease();
        char v10 = 1;
        uint64_t v5 = v65;
        uint64_t v9 = v14;
        if (v11 == v67)
        {
          swift_bridgeObjectRelease();
          char v64 = 1;
          goto LABEL_22;
        }
      }
    }
    char v64 = 0;
LABEL_22:
    swift_bridgeObjectRelease();
    swift_retain();
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v19 = v63;
    }
    else
    {
      char v23 = OUTLINED_FUNCTION_53();
      sub_25C6031E4(v23, v24, v25, v26);
      uint64_t v19 = v27;
    }
    unint64_t v21 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_25C6031E4(v20 > 1, v21 + 1, 1, v19);
      uint64_t v19 = v28;
    }
    *(void *)(v19 + 16) = v21 + 1;
    uint64_t v63 = v19;
    uint64_t v22 = v19 + 32 * v21;
    *(void *)(v22 + 32) = v62;
    *(void *)(v22 + 40) = v5;
    *(void *)(v22 + 48) = v6;
    *(unsigned char *)(v22 + 56) = v64 & 1;
    swift_bridgeObjectRelease_n();
    swift_release_n();
    uint64_t v2 = v61 + 1;
  }
  while (v61 + 1 != v60);
  swift_bridgeObjectRelease();
  uint64_t v29 = (uint64_t *)v63;
LABEL_30:
  uint64_t v1 = v29;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_59;
  }
  while (2)
  {
    uint64_t v30 = v1[2];
    if (v30)
    {
      uint64_t v31 = 0;
      uint64_t v32 = v1 + 4;
      uint64_t v33 = 32;
      do
      {
        uint64_t v34 = &v32[4 * v31];
        if ((v34[3] & 1) == 0)
        {
          if (v31 >= v30 - 1) {
            break;
          }
          uint64_t v35 = v33 - 32 * v30;
          char v36 = &v32[4 * v30--];
          while ((*(unsigned char *)(v36 - 1) & 1) == 0)
          {
            --v30;
            v35 += 32;
            v36 -= 4;
            if (v31 >= v30) {
              goto LABEL_44;
            }
          }
          long long v37 = *(_OWORD *)v34;
          uint64_t v38 = v34[2];
          if (v35 || v34 >= v36)
          {
            long long v39 = *((_OWORD *)v36 - 1);
            *(_OWORD *)uint64_t v34 = *((_OWORD *)v36 - 2);
            *((_OWORD *)v34 + 1) = v39;
          }
          *((_OWORD *)v36 - 2) = v37;
          *(v36 - 2) = v38;
          *((unsigned char *)v36 - 8) = 0;
        }
        ++v31;
        v33 += 32;
      }
      while (v31 < v30);
LABEL_44:
      if (v1[2] < (unint64_t)v31)
      {
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
LABEL_46:
      uint64_t v31 = 0;
    }
    unint64_t v40 = (2 * v31) | 1;
    uint64_t v41 = (void *)sub_25C6170E8(v31, (uint64_t)v1);
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    unint64_t v47 = v46;
    uint64_t v69 = v1 + 4;
    swift_bridgeObjectRetain();
    sub_25C61BFAC(v41, v43, v45, v47);
    char v48 = 0;
    uint64_t v1 = (uint64_t *)(v40 >> 1);
    if (v40 >> 1)
    {
      uint64_t v68 = MEMORY[0x263F8EE78];
      uint64_t result = sub_25C619480(0, v40 >> 1, 0);
      if (((v40 >> 1) & 0x8000000000000000) != 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v50 = v68;
      uint64_t v51 = v69 + 2;
      while ((uint64_t)v48 < (uint64_t)v1)
      {
        uint64_t v52 = *(v51 - 2);
        uint64_t v53 = *(v51 - 1);
        uint64_t v54 = *v51;
        unint64_t v56 = *(void *)(v68 + 16);
        unint64_t v55 = *(void *)(v68 + 24);
        swift_retain();
        swift_bridgeObjectRetain();
        if (v56 >= v55 >> 1) {
          sub_25C619480((char *)(v55 > 1), v56 + 1, 1);
        }
        *(void *)(v68 + 16) = v56 + 1;
        uint64_t v57 = (void *)(v68 + 24 * v56);
        v57[4] = v52;
        v57[5] = v53;
        v57[6] = v54;
        char v48 = (uint64_t *)((char *)v48 + 1);
        v51 += 4;
        if (v1 == v48)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          return (char *)v50;
        }
      }
LABEL_58:
      __break(1u);
LABEL_59:
      sub_25C603D48((uint64_t)v1);
      uint64_t v1 = v58;
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return (char *)MEMORY[0x263F8EE78];
}

uint64_t sub_25C616E2C()
{
  OUTLINED_FUNCTION_4_2();
  sub_25C61E950();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_90();
  if ((*(unsigned char *)(*__swift_project_boxed_opaque_existential_1((void *)(v0 + 64), *(void *)(v0 + 88)) + 32) & 1) != 0
    || !*(void *)(*__swift_project_boxed_opaque_existential_1((void *)(v0 + 64), *(void *)(v0 + 88)) + 24))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v2 = self;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_71();
    uint64_t v3 = (void *)sub_25C61EA10();
    uint64_t v4 = (void *)sub_25C61EA10();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v2, sel_filterProfanity_locale_, v3, v4);

    sub_25C61EA20();
    OUTLINED_FUNCTION_96();
    sub_25C61E930();
    sub_25C61E940();
    uint64_t v6 = OUTLINED_FUNCTION_121();
    v7(v6);
    if (qword_26B3515D8[0] != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25C61E9D0();
    OUTLINED_FUNCTION_89(v8, (uint64_t)qword_26B3515A8);
    uint64_t v9 = (void *)sub_25C61E9B0();
    os_log_type_t v10 = sub_25C61EBE0();
    if (OUTLINED_FUNCTION_18_1(v10))
    {
      uint64_t v11 = OUTLINED_FUNCTION_14_1();
      uint64_t v18 = OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_119(4.8151e-34);
      sub_25C618C00(0xD000000000000018, 0x800000025C620E10, &v18);
      sub_25C61EC20();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v12 = OUTLINED_FUNCTION_71();
      sub_25C618C00(v12, v13, v14);
      sub_25C61EC20();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_113(&dword_25C5FA000, v15, v16, "Function: %s > Profanity filtered phrase: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_20();
    }
    else
    {

      OUTLINED_FUNCTION_70();
    }
  }
  return OUTLINED_FUNCTION_71();
}

uint64_t sub_25C6170E8(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_25C617148()
{
  return sub_25C61F070();
}

BOOL sub_25C6171CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (v9 = sub_25C61EFB0(), BOOL result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6) {
      return v4 == v7;
    }
    char v12 = sub_25C61EFB0();
    BOOL result = 0;
    if (v12) {
      return v4 == v7;
    }
  }
  return result;
}

uint64_t sub_25C617274()
{
  return sub_25C61F080();
}

uint64_t sub_25C617310()
{
  return sub_25C61F080();
}

uint64_t sub_25C6173A4(uint64_t a1, double *a2)
{
  double v2 = *(double *)(a1 + 16);
  double v3 = *a2;
  double v4 = a2[2];
  unsigned int v5 = *(unsigned __int8 *)(*(void *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
  if (v2 != v4)
  {
    int v8 = *(unsigned __int8 *)(*(void *)&v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v5 - 1 > 1)
    {
      unsigned int v11 = v8 - 3;
      BOOL v7 = v2 >= v4 || v11 >= 0xFFFFFFFE;
      return !v7;
    }
    if ((v8 - 1) > 1) {
      return 1;
    }
LABEL_6:
    double v9 = sub_25C5FDD44();
    return sub_25C5FDD44() < v9;
  }
  unsigned int v6 = *(unsigned __int8 *)(*(void *)&v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
  BOOL v7 = v5 >= v6;
  if (v5 == v6) {
    goto LABEL_6;
  }
  return !v7;
}

uint64_t DefaultSiriAutoCompleteService.flushAssistantSuggestions()()
{
  OUTLINED_FUNCTION_5_3();
  v1[7] = v0;
  uint64_t v2 = sub_25C61E8B0();
  v1[8] = v2;
  OUTLINED_FUNCTION_1_5(v2);
  v1[9] = v3;
  v1[10] = OUTLINED_FUNCTION_15_1();
  uint64_t v4 = sub_25C61E8A0();
  OUTLINED_FUNCTION_23(v4);
  v1[11] = OUTLINED_FUNCTION_15_1();
  uint64_t v5 = sub_25C61E850();
  v1[12] = v5;
  OUTLINED_FUNCTION_1_5(v5);
  v1[13] = v6;
  v1[14] = OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C61753C()
{
  OUTLINED_FUNCTION_117();
  if (qword_26B3515D8[0] != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C61E9D0();
  v1[15] = __swift_project_value_buffer(v4, (uint64_t)qword_26B3515A8);
  uint64_t v5 = (void *)sub_25C61E9B0();
  os_log_type_t v6 = sub_25C61EBE0();
  if (OUTLINED_FUNCTION_25(v6))
  {
    uint64_t v2 = v1 + 6;
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_50(4.8149e-34);
    OUTLINED_FUNCTION_84();
    v1[6] = sub_25C618C00(0xD00000000000001BLL, v7, v8);
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_28(&dword_25C5FA000, v9, v10, "Function: %s > Flushing all assistant suggestions");
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();
  }

  OUTLINED_FUNCTION_92();
  *(unsigned char *)(v0 + 8) = 1;
  OUTLINED_FUNCTION_112();
  v11();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0);
  OUTLINED_FUNCTION_26();
  char v12 = (__n128 *)OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_122(v12, (__n128)xmmword_25C61FCB0);
  sub_25C61E880();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v13();
  *uint64_t v2 = 1;
  sub_25C61E8C0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_29();
  v14();
  OUTLINED_FUNCTION_68();
  uint64_t v15 = *(void *)(v3 + 56);
  v1[16] = v15;
  return MEMORY[0x270FA2498](sub_25C617798, v15, 0);
}

uint64_t sub_25C617798()
{
  OUTLINED_FUNCTION_37();
  v0[17] = sub_25C609044(v0[14]);
  v0[18] = 0;
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_25C617820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_19_1();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_61();
  a20 = v22;
  char v25 = (void *)sub_25C61E9B0();
  os_log_type_t v26 = sub_25C61EBE0();
  if (OUTLINED_FUNCTION_36(v26))
  {
    uint64_t v27 = v22[17];
    a10 = v22[14];
    uint64_t v28 = OUTLINED_FUNCTION_14_1();
    a11 = OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v28 = 136315394;
    v22[4] = sub_25C618C00(0xD00000000000001BLL, 0x800000025C620C20, &a11);
    sub_25C61EC20();
    *(_WORD *)(v28 + 12) = 2048;
    v22[5] = v27;
    sub_25C61EC20();
    OUTLINED_FUNCTION_48(&dword_25C5FA000, v29, v30, "Function: %s > Successfully deleted all phrases corresponding to source 'assistantSuggestions' with return code: %ld");
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    OUTLINED_FUNCTION_76();
    v31();
  }
  else
  {

    uint64_t v32 = OUTLINED_FUNCTION_47();
    v33(v32);
  }
  OUTLINED_FUNCTION_108();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_7_3();
  return v35(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C617998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_27();
  a23 = v25;
  a24 = v26;
  OUTLINED_FUNCTION_86();
  a22 = v24;
  uint64_t v27 = (void *)v24[18];
  id v28 = v27;
  id v29 = v27;
  uint64_t v30 = sub_25C61E9B0();
  os_log_type_t v31 = sub_25C61EBF0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (void *)v24[18];
    a10 = v24[13];
    a11 = v24[12];
    a12 = v24[14];
    uint64_t v33 = OUTLINED_FUNCTION_14_1();
    uint64_t v34 = (void *)OUTLINED_FUNCTION_39();
    a9 = OUTLINED_FUNCTION_5_4();
    a13 = a9;
    *(_DWORD *)uint64_t v33 = 136315394;
    v24[2] = sub_25C618C00(0xD00000000000001BLL, 0x800000025C620C20, &a13);
    sub_25C61EC20();
    *(_WORD *)(v33 + 12) = 2112;
    id v35 = v32;
    uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
    v24[3] = v36;
    sub_25C61EC20();
    *uint64_t v34 = v36;
    MEMORY[0x26118C8A0](v32);
    MEMORY[0x26118C8A0](v32);
    OUTLINED_FUNCTION_77(&dword_25C5FA000, v30, v37, "Function: %s > Error encountered while attempting to delete phrases corresponding to source 'assistantSuggestions': %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C0);
    OUTLINED_FUNCTION_75();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_110();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_20();

    MEMORY[0x26118C8A0](v32);
    OUTLINED_FUNCTION_67();
    v38();
  }
  else
  {
    uint64_t v39 = v24[18];
    uint64_t v41 = v24[13];
    uint64_t v40 = v24[14];
    uint64_t v42 = v24[12];

    MEMORY[0x26118C8A0](v39);
    MEMORY[0x26118C8A0](v39);
    MEMORY[0x26118C8A0](v39);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  }
  OUTLINED_FUNCTION_108();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_23_1();
  return v44(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t DefaultSiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)()
{
  OUTLINED_FUNCTION_5_3();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[9] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C617C44;
  return DefaultSiriAutoCompleteService.flushAssistantSuggestions()();
}

uint64_t sub_25C617C44()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C617D0C()
{
  OUTLINED_FUNCTION_37();
  uint64_t v9 = v0;
  unint64_t v1 = v0[7];
  type metadata accessor for VectorSearchAssets.Builder();
  uint64_t inited = swift_initStackObject();
  uint64_t v3 = MEMORY[0x263F8EE88];
  *(void *)(inited + 16) = MEMORY[0x263F8EE78];
  *(void *)(inited + 24) = v3;
  sub_25C60A0E8(v1);
  swift_release();
  sub_25C60A520(&v8);
  swift_release();
  uint64_t v4 = v8;
  v0[10] = v8;
  v0[6] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25C617E08;
  os_log_type_t v6 = (uint64_t *)OUTLINED_FUNCTION_127();
  return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(v6);
}

uint64_t sub_25C617E08()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_1();
  return v3();
}

uint64_t DefaultSiriAutoCompleteService.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();
  return v0;
}

uint64_t DefaultSiriAutoCompleteService.__deallocating_deinit()
{
  DefaultSiriAutoCompleteService.deinit();
  return MEMORY[0x270FA0228](v0, 152, 7);
}

uint64_t sub_25C617F58(uint64_t *a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C61D1CC;
  return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(a1);
}

uint64_t sub_25C617FF0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25C618098;
  return DefaultSiriAutoCompleteService.autoCompleteResults(for:)();
}

uint64_t sub_25C618098()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_95();
  return v4(v3);
}

uint64_t sub_25C61815C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25C61D1D4;
  return DefaultSiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)();
}

uint64_t sub_25C6181F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25C61828C;
  return DefaultSiriAutoCompleteService.deletePhrasesForSource(source:)();
}

uint64_t sub_25C61828C()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  return v3();
}

uint64_t sub_25C61834C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25C6183E4;
  return DefaultSiriAutoCompleteService.deletePhrasesForApp(bundleIds:)();
}

uint64_t sub_25C6183E4()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  return v5(v2);
}

uint64_t sub_25C6184AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C61D1D4;
  return DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:)(a1, a2);
}

uint64_t sub_25C618554(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C61D1CC;
  return DefaultSiriAutoCompleteService.fetchPhrasesMatching(filters:)(a1);
}

uint64_t sub_25C6185EC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25C61828C;
  return DefaultSiriAutoCompleteService.dropDB()();
}

uint64_t sub_25C61867C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C61868C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C6186C8(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_25C61EE80();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_25C61EB80();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25C618764(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_56();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_123();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_55();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25C618814(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_56();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_123();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_4_2();
  if (v4 + 8 * v3 > v2 && v2 + 8 * v3 > v4)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_55();
    goto LABEL_11;
  }
  type metadata accessor for AutoCompletePhrase();
  OUTLINED_FUNCTION_124();
  return swift_arrayInitWithCopy();
}

uint64_t sub_25C6188D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0) - 8) + 72) * a2,
         unint64_t v6 = a3 + v5,
         unint64_t v7 = a1 + v5,
         v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_25C61EEB0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25C6189EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_56();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_123();
    __break(1u);
    return result;
  }
  if (a3 + 24 * a2 > a1 && a1 + 24 * a2 > a3)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_55();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25C618AA0(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_56();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_123();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_4_2();
  if (v4 + 32 * v3 > v2 && v2 + 32 * v3 > v4)
  {
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_55();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E0);
  OUTLINED_FUNCTION_124();
  return swift_arrayInitWithCopy();
}

uint64_t sub_25C618B60(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C618B88(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C618C00(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C61EC20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C618C00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v9 = sub_25C618CD0(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_25C61CE40((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_25C61CE40((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_25C618CD0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C618E28((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C61EC30();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C618F00(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C61EE10();
    if (!v8)
    {
      uint64_t result = sub_25C61EE80();
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

void *sub_25C618E28(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C61EEB0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C618F00(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C618F98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C619174(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C619174((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C618F98(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C61EAB0();
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
  unint64_t v3 = sub_25C61910C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C61EDD0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C61EEB0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C61EE80();
  __break(1u);
  return result;
}

void *sub_25C61910C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB788);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C619174(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB788);
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
    sub_25C619324(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C61924C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C61924C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C61EEB0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C619324(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C61EEB0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25C6193B4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25C6193C4()
{
  return sub_25C61EC20();
}

uint64_t sub_25C6193EC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_25C61941C(unint64_t result, char a2, uint64_t a3)
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

char *sub_25C619440(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C6194A0(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

size_t sub_25C619460(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25C619584(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25C619480(char *a1, int64_t a2, char a3)
{
  size_t result = sub_25C619728(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_25C6194A0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C603904(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C618764((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_25C619584(size_t result, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515C8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
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
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = a4 + v16;
  if (v5)
  {
    sub_25C6039F4(v17, v8);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6188D0(v17, v8, (unint64_t)v13 + v16);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_25C619728(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C603BD8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C6189EC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_25C619814(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C61BDD4((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v4[0] = (uint64_t)(v2 + 32);
  v4[1] = v3;
  sub_25C619904(v4);
  *a1 = v2;
}

uint64_t sub_25C619880(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t a2)
{
  char v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v5 = sub_25C61BDD4((uint64_t)v5);
  }
  uint64_t result = sub_25C619ED0(a1, a2);
  *uint64_t v2 = v5;
  return result;
}

void sub_25C619904(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_25C61EF90();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_114;
    }
    if (v3) {
      sub_25C61A49C(0, v3, 1, a1);
    }
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v82 = a1;
    uint64_t v83 = sub_25C6186C8(v3 / 2);
    uint64_t v88 = v6;
    uint64_t v85 = v3;
    if (v3 <= 0)
    {
      uint64_t v9 = (char *)MEMORY[0x263F8EE78];
      unint64_t v25 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_79:
      if (v25 >= 2)
      {
        uint64_t v75 = *v82;
        do
        {
          unint64_t v76 = v25 - 2;
          if (v25 < 2) {
            goto LABEL_109;
          }
          if (!v75) {
            goto LABEL_123;
          }
          uint64_t v77 = v9;
          uint64_t v78 = *(void *)&v9[16 * v76 + 32];
          uint64_t v79 = *(void *)&v9[16 * v25 + 24];
          sub_25C61AAFC((char *)(v75 + 24 * v78), (char *)(v75 + 24 * *(void *)&v9[16 * v25 + 16]), v75 + 24 * v79, v88);
          if (v1)
          {
            swift_bridgeObjectRelease();
            uint64_t v3 = v85;
            goto LABEL_75;
          }
          if (v79 < v78) {
            goto LABEL_110;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v77 = sub_25C61B23C((uint64_t)v77);
          }
          if (v76 >= *((void *)v77 + 2)) {
            goto LABEL_111;
          }
          uint64_t v80 = &v77[16 * v76 + 32];
          *(void *)uint64_t v80 = v78;
          *((void *)v80 + 1) = v79;
          unint64_t v81 = *((void *)v77 + 2);
          if (v25 > v81) {
            goto LABEL_112;
          }
          memmove(&v77[16 * v25 + 16], &v77[16 * v25 + 32], 16 * (v81 - v25));
          uint64_t v9 = v77;
          *((void *)v77 + 2) = v81 - 1;
          unint64_t v25 = v81 - 1;
        }
        while (v81 > 2);
      }
      swift_bridgeObjectRelease();
      if (v85 < -1)
      {
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
      }
      else
      {
        *(void *)(v83 + 16) = 0;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = *a1;
      uint64_t v9 = (char *)MEMORY[0x263F8EE78];
      uint64_t v84 = v5;
      uint64_t v87 = *a1;
      while (1)
      {
        uint64_t v10 = v9;
        char v11 = sub_25C61A76C(&v89, v8, v3, v7);
        if (v1) {
          break;
        }
        uint64_t v12 = v89;
        if (v11)
        {
          if (v89 < v7) {
            goto LABEL_115;
          }
          if (v7 < v89)
          {
            uint64_t v13 = 24 * v89;
            uint64_t v14 = 24 * v7;
            uint64_t v15 = v89;
            uint64_t v16 = v7;
            do
            {
              if (v16 != --v15)
              {
                if (!v87) {
                  goto LABEL_122;
                }
                uint64_t v17 = v87 + v14;
                uint64_t v18 = v87 + v13;
                uint64_t v19 = *(void *)(v87 + v14 + 16);
                long long v20 = *(_OWORD *)(v87 + v14);
                uint64_t v21 = *(void *)(v87 + v13 - 8);
                *(_OWORD *)uint64_t v17 = *(_OWORD *)(v87 + v13 - 24);
                *(void *)(v17 + 16) = v21;
                *(_OWORD *)(v18 - 24) = v20;
                *(void *)(v18 - 8) = v19;
              }
              ++v16;
              v13 -= 24;
              v14 += 24;
            }
            while (v16 < v15);
          }
        }
        if (v12 < v3)
        {
          if (__OFSUB__(v12, v7)) {
            goto LABEL_116;
          }
          if (v12 - v7 < v5)
          {
            if (__OFADD__(v7, v5)) {
              goto LABEL_118;
            }
            if (v7 + v5 >= v3) {
              uint64_t v22 = v3;
            }
            else {
              uint64_t v22 = v7 + v5;
            }
            if (v22 < v7)
            {
LABEL_119:
              __break(1u);
              goto LABEL_120;
            }
            sub_25C61A49C(v7, v22, v12, v82);
            uint64_t v12 = v22;
          }
        }
        if (v12 < v7) {
          goto LABEL_113;
        }
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v9 = v10;
        }
        else {
          uint64_t v9 = sub_25C61B144(0, *((void *)v10 + 2) + 1, 1, v10);
        }
        unint64_t v24 = *((void *)v9 + 2);
        unint64_t v23 = *((void *)v9 + 3);
        unint64_t v25 = v24 + 1;
        uint64_t v8 = v87;
        uint64_t v86 = v12;
        if (v24 >= v23 >> 1)
        {
          uint64_t v74 = sub_25C61B144((char *)(v23 > 1), v24 + 1, 1, v9);
          uint64_t v8 = v87;
          uint64_t v9 = v74;
        }
        *((void *)v9 + 2) = v25;
        uint64_t v26 = v9 + 32;
        uint64_t v27 = (uint64_t *)&v9[16 * v24 + 32];
        *uint64_t v27 = v7;
        v27[1] = v12;
        if (v24)
        {
          while (1)
          {
            unint64_t v28 = v25 - 1;
            if (v25 >= 4)
            {
              uint64_t v33 = &v26[16 * v25];
              uint64_t v34 = *((void *)v33 - 8);
              uint64_t v35 = *((void *)v33 - 7);
              BOOL v39 = __OFSUB__(v35, v34);
              uint64_t v36 = v35 - v34;
              if (v39) {
                goto LABEL_98;
              }
              uint64_t v38 = *((void *)v33 - 6);
              uint64_t v37 = *((void *)v33 - 5);
              BOOL v39 = __OFSUB__(v37, v38);
              uint64_t v31 = v37 - v38;
              char v32 = v39;
              if (v39) {
                goto LABEL_99;
              }
              unint64_t v40 = v25 - 2;
              uint64_t v41 = &v26[16 * v25 - 32];
              uint64_t v43 = *(void *)v41;
              uint64_t v42 = *((void *)v41 + 1);
              BOOL v39 = __OFSUB__(v42, v43);
              uint64_t v44 = v42 - v43;
              if (v39) {
                goto LABEL_100;
              }
              BOOL v39 = __OFADD__(v31, v44);
              uint64_t v45 = v31 + v44;
              if (v39) {
                goto LABEL_102;
              }
              if (v45 >= v36)
              {
                uint64_t v63 = &v26[16 * v28];
                uint64_t v65 = *(void *)v63;
                uint64_t v64 = *((void *)v63 + 1);
                BOOL v39 = __OFSUB__(v64, v65);
                uint64_t v66 = v64 - v65;
                if (v39) {
                  goto LABEL_108;
                }
                BOOL v56 = v31 < v66;
                goto LABEL_59;
              }
            }
            else
            {
              if (v25 != 3)
              {
                uint64_t v57 = *((void *)v9 + 4);
                uint64_t v58 = *((void *)v9 + 5);
                BOOL v39 = __OFSUB__(v58, v57);
                uint64_t v50 = v58 - v57;
                char v51 = v39;
                goto LABEL_53;
              }
              uint64_t v30 = *((void *)v9 + 4);
              uint64_t v29 = *((void *)v9 + 5);
              BOOL v39 = __OFSUB__(v29, v30);
              uint64_t v31 = v29 - v30;
              char v32 = v39;
            }
            if (v32) {
              goto LABEL_101;
            }
            unint64_t v40 = v25 - 2;
            uint64_t v46 = &v26[16 * v25 - 32];
            uint64_t v48 = *(void *)v46;
            uint64_t v47 = *((void *)v46 + 1);
            BOOL v49 = __OFSUB__(v47, v48);
            uint64_t v50 = v47 - v48;
            char v51 = v49;
            if (v49) {
              goto LABEL_103;
            }
            uint64_t v52 = &v26[16 * v28];
            uint64_t v54 = *(void *)v52;
            uint64_t v53 = *((void *)v52 + 1);
            BOOL v39 = __OFSUB__(v53, v54);
            uint64_t v55 = v53 - v54;
            if (v39) {
              goto LABEL_105;
            }
            if (__OFADD__(v50, v55)) {
              goto LABEL_107;
            }
            if (v50 + v55 >= v31)
            {
              BOOL v56 = v31 < v55;
LABEL_59:
              if (v56) {
                unint64_t v28 = v40;
              }
              goto LABEL_61;
            }
LABEL_53:
            if (v51) {
              goto LABEL_104;
            }
            uint64_t v59 = &v26[16 * v28];
            uint64_t v61 = *(void *)v59;
            uint64_t v60 = *((void *)v59 + 1);
            BOOL v39 = __OFSUB__(v60, v61);
            uint64_t v62 = v60 - v61;
            if (v39) {
              goto LABEL_106;
            }
            if (v62 < v50) {
              goto LABEL_69;
            }
LABEL_61:
            unint64_t v67 = v28 - 1;
            if (v28 - 1 >= v25)
            {
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              __break(1u);
LABEL_100:
              __break(1u);
LABEL_101:
              __break(1u);
LABEL_102:
              __break(1u);
LABEL_103:
              __break(1u);
LABEL_104:
              __break(1u);
LABEL_105:
              __break(1u);
LABEL_106:
              __break(1u);
LABEL_107:
              __break(1u);
LABEL_108:
              __break(1u);
LABEL_109:
              __break(1u);
LABEL_110:
              __break(1u);
LABEL_111:
              __break(1u);
LABEL_112:
              __break(1u);
LABEL_113:
              __break(1u);
LABEL_114:
              __break(1u);
LABEL_115:
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
              goto LABEL_119;
            }
            if (!v8) {
              goto LABEL_121;
            }
            uint64_t v68 = v9;
            uint64_t v69 = &v26[16 * v67];
            uint64_t v70 = *(void *)v69;
            char v71 = &v26[16 * v28];
            uint64_t v72 = *((void *)v71 + 1);
            sub_25C61AAFC((char *)(v8 + 24 * *(void *)v69), (char *)(v8 + 24 * *(void *)v71), v8 + 24 * v72, v88);
            if (v72 < v70) {
              goto LABEL_95;
            }
            if (v28 > *((void *)v68 + 2)) {
              goto LABEL_96;
            }
            *(void *)uint64_t v69 = v70;
            *(void *)&v26[16 * v67 + 8] = v72;
            unint64_t v73 = *((void *)v68 + 2);
            if (v28 >= v73) {
              goto LABEL_97;
            }
            unint64_t v25 = v73 - 1;
            memmove(&v26[16 * v28], v71 + 16, 16 * (v73 - 1 - v28));
            uint64_t v9 = v68;
            *((void *)v68 + 2) = v73 - 1;
            uint64_t v8 = v87;
            if (v73 <= 2) {
              goto LABEL_69;
            }
          }
        }
        unint64_t v25 = 1;
LABEL_69:
        uint64_t v3 = v85;
        uint64_t v7 = v86;
        uint64_t v5 = v84;
        if (v86 >= v85) {
          goto LABEL_79;
        }
      }
      swift_bridgeObjectRelease();
LABEL_75:
      if (v3 < -1) {
        goto LABEL_117;
      }
      *(void *)(v83 + 16) = 0;
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_25C619ED0(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2[1];
  uint64_t result = sub_25C61EF90();
  if (result >= v5)
  {
    if (v5 < 0) {
      goto LABEL_113;
    }
    if (v5) {
      return sub_25C61A5F4(0, v5, 1, a1, a2);
    }
  }
  else
  {
    uint64_t v7 = result;
    unint64_t v81 = v2;
    uint64_t v82 = sub_25C6186C8(v5 / 2);
    uint64_t v87 = v8;
    uint64_t v85 = v5;
    if (v5 <= 0)
    {
      uint64_t v11 = MEMORY[0x263F8EE78];
      unint64_t v25 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_78:
      uint64_t result = v11;
      if (v25 >= 2)
      {
        uint64_t v74 = *v81;
        do
        {
          unint64_t v75 = v25 - 2;
          if (v25 < 2) {
            goto LABEL_108;
          }
          if (!v74) {
            goto LABEL_122;
          }
          uint64_t v76 = result;
          uint64_t v77 = *(void *)(result + 32 + 16 * v75);
          uint64_t v78 = *(void *)(result + 32 + 16 * (v25 - 1) + 8);
          uint64_t result = sub_25C61ADB4((char *)(v74 + 24 * v77), (char *)(v74 + 24 * *(void *)(result + 32 + 16 * (v25 - 1))), v74 + 24 * v78, v87, a1);
          if (v4)
          {
            uint64_t result = swift_bridgeObjectRelease();
            uint64_t v5 = v85;
            goto LABEL_74;
          }
          if (v78 < v77) {
            goto LABEL_109;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_25C61B23C(v76);
            uint64_t v76 = result;
          }
          if (v75 >= *(void *)(v76 + 16)) {
            goto LABEL_110;
          }
          uint64_t v79 = (void *)(v76 + 32 + 16 * v75);
          *uint64_t v79 = v77;
          v79[1] = v78;
          unint64_t v80 = *(void *)(v76 + 16);
          if (v25 > v80) {
            goto LABEL_111;
          }
          memmove((void *)(v76 + 32 + 16 * (v25 - 1)), (const void *)(v76 + 32 + 16 * v25), 16 * (v80 - v25));
          uint64_t result = v76;
          *(void *)(v76 + 16) = v80 - 1;
          unint64_t v25 = v80 - 1;
        }
        while (v80 > 2);
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (v85 < -1)
      {
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
      }
      else
      {
        *(void *)(v82 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = *v2;
      uint64_t v11 = MEMORY[0x263F8EE78];
      uint64_t v83 = v7;
      uint64_t v86 = *v2;
      while (1)
      {
        uint64_t result = sub_25C61A904(&v90, v10, v5, v9, a1);
        if (v4) {
          break;
        }
        uint64_t v12 = v90;
        if (result)
        {
          if (v90 < v9) {
            goto LABEL_114;
          }
          if (v9 < v90)
          {
            uint64_t v13 = 24 * v90;
            uint64_t v14 = 24 * v9;
            uint64_t v15 = v90;
            uint64_t v16 = v9;
            do
            {
              if (v16 != --v15)
              {
                if (!v86) {
                  goto LABEL_121;
                }
                uint64_t v17 = v86 + v14;
                uint64_t v18 = v86 + v13;
                uint64_t v19 = *(void *)(v86 + v14 + 16);
                long long v20 = *(_OWORD *)(v86 + v14);
                uint64_t v21 = *(void *)(v86 + v13 - 8);
                *(_OWORD *)uint64_t v17 = *(_OWORD *)(v86 + v13 - 24);
                *(void *)(v17 + 16) = v21;
                *(_OWORD *)(v18 - 24) = v20;
                *(void *)(v18 - 8) = v19;
              }
              ++v16;
              v13 -= 24;
              v14 += 24;
            }
            while (v16 < v15);
          }
        }
        if (v12 < v5)
        {
          if (__OFSUB__(v12, v9)) {
            goto LABEL_115;
          }
          if (v12 - v9 < v7)
          {
            if (__OFADD__(v9, v7)) {
              goto LABEL_117;
            }
            if (v9 + v7 >= v5) {
              uint64_t v22 = v5;
            }
            else {
              uint64_t v22 = v9 + v7;
            }
            if (v22 < v9)
            {
LABEL_118:
              __break(1u);
              goto LABEL_119;
            }
            uint64_t result = sub_25C61A5F4(v9, v22, v12, a1, a2);
            uint64_t v12 = v22;
          }
        }
        if (v12 < v9) {
          goto LABEL_112;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_25C61B144(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        unint64_t v24 = *(void *)(v11 + 16);
        unint64_t v23 = *(void *)(v11 + 24);
        unint64_t v25 = v24 + 1;
        uint64_t v10 = v86;
        if (v24 >= v23 >> 1)
        {
          uint64_t result = (uint64_t)sub_25C61B144((char *)(v23 > 1), v24 + 1, 1, (char *)v11);
          uint64_t v10 = v86;
          uint64_t v11 = result;
        }
        *(void *)(v11 + 16) = v25;
        uint64_t v26 = v11 + 32;
        uint64_t v27 = (uint64_t *)(v11 + 32 + 16 * v24);
        *uint64_t v27 = v9;
        v27[1] = v12;
        uint64_t v84 = v12;
        if (v24)
        {
          while (1)
          {
            unint64_t v28 = v25 - 1;
            if (v25 >= 4)
            {
              unint64_t v33 = v26 + 16 * v25;
              uint64_t v34 = *(void *)(v33 - 64);
              uint64_t v35 = *(void *)(v33 - 56);
              BOOL v39 = __OFSUB__(v35, v34);
              uint64_t v36 = v35 - v34;
              if (v39) {
                goto LABEL_97;
              }
              uint64_t v38 = *(void *)(v33 - 48);
              uint64_t v37 = *(void *)(v33 - 40);
              BOOL v39 = __OFSUB__(v37, v38);
              uint64_t v31 = v37 - v38;
              char v32 = v39;
              if (v39) {
                goto LABEL_98;
              }
              unint64_t v40 = v25 - 2;
              uint64_t v41 = (uint64_t *)(v26 + 16 * (v25 - 2));
              uint64_t v43 = *v41;
              uint64_t v42 = v41[1];
              BOOL v39 = __OFSUB__(v42, v43);
              uint64_t v44 = v42 - v43;
              if (v39) {
                goto LABEL_99;
              }
              BOOL v39 = __OFADD__(v31, v44);
              uint64_t v45 = v31 + v44;
              if (v39) {
                goto LABEL_101;
              }
              if (v45 >= v36)
              {
                uint64_t v63 = (uint64_t *)(v26 + 16 * v28);
                uint64_t v65 = *v63;
                uint64_t v64 = v63[1];
                BOOL v39 = __OFSUB__(v64, v65);
                uint64_t v66 = v64 - v65;
                if (v39) {
                  goto LABEL_107;
                }
                BOOL v56 = v31 < v66;
                goto LABEL_59;
              }
            }
            else
            {
              if (v25 != 3)
              {
                uint64_t v57 = *(void *)(v11 + 32);
                uint64_t v58 = *(void *)(v11 + 40);
                BOOL v39 = __OFSUB__(v58, v57);
                uint64_t v50 = v58 - v57;
                char v51 = v39;
                goto LABEL_53;
              }
              uint64_t v30 = *(void *)(v11 + 32);
              uint64_t v29 = *(void *)(v11 + 40);
              BOOL v39 = __OFSUB__(v29, v30);
              uint64_t v31 = v29 - v30;
              char v32 = v39;
            }
            if (v32) {
              goto LABEL_100;
            }
            unint64_t v40 = v25 - 2;
            uint64_t v46 = (uint64_t *)(v26 + 16 * (v25 - 2));
            uint64_t v48 = *v46;
            uint64_t v47 = v46[1];
            BOOL v49 = __OFSUB__(v47, v48);
            uint64_t v50 = v47 - v48;
            char v51 = v49;
            if (v49) {
              goto LABEL_102;
            }
            uint64_t v52 = (uint64_t *)(v26 + 16 * v28);
            uint64_t v54 = *v52;
            uint64_t v53 = v52[1];
            BOOL v39 = __OFSUB__(v53, v54);
            uint64_t v55 = v53 - v54;
            if (v39) {
              goto LABEL_104;
            }
            if (__OFADD__(v50, v55)) {
              goto LABEL_106;
            }
            if (v50 + v55 >= v31)
            {
              BOOL v56 = v31 < v55;
LABEL_59:
              if (v56) {
                unint64_t v28 = v40;
              }
              goto LABEL_61;
            }
LABEL_53:
            if (v51) {
              goto LABEL_103;
            }
            uint64_t v59 = (uint64_t *)(v26 + 16 * v28);
            uint64_t v61 = *v59;
            uint64_t v60 = v59[1];
            BOOL v39 = __OFSUB__(v60, v61);
            uint64_t v62 = v60 - v61;
            if (v39) {
              goto LABEL_105;
            }
            if (v62 < v50) {
              goto LABEL_69;
            }
LABEL_61:
            unint64_t v67 = v28 - 1;
            if (v28 - 1 >= v25)
            {
              __break(1u);
LABEL_94:
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              __break(1u);
LABEL_100:
              __break(1u);
LABEL_101:
              __break(1u);
LABEL_102:
              __break(1u);
LABEL_103:
              __break(1u);
LABEL_104:
              __break(1u);
LABEL_105:
              __break(1u);
LABEL_106:
              __break(1u);
LABEL_107:
              __break(1u);
LABEL_108:
              __break(1u);
LABEL_109:
              __break(1u);
LABEL_110:
              __break(1u);
LABEL_111:
              __break(1u);
LABEL_112:
              __break(1u);
LABEL_113:
              __break(1u);
LABEL_114:
              __break(1u);
LABEL_115:
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
              goto LABEL_118;
            }
            if (!v10) {
              goto LABEL_120;
            }
            uint64_t v68 = v11;
            uint64_t v69 = (uint64_t *)(v26 + 16 * v67);
            uint64_t v70 = *v69;
            char v71 = (void *)(v26 + 16 * v28);
            uint64_t v72 = v71[1];
            uint64_t result = sub_25C61ADB4((char *)(v10 + 24 * *v69), (char *)(v10 + 24 * *v71), v10 + 24 * v72, v87, a1);
            if (v72 < v70) {
              goto LABEL_94;
            }
            if (v28 > *(void *)(v68 + 16)) {
              goto LABEL_95;
            }
            uint64_t *v69 = v70;
            *(void *)(v26 + 16 * v67 + 8) = v72;
            unint64_t v73 = *(void *)(v68 + 16);
            if (v28 >= v73) {
              goto LABEL_96;
            }
            uint64_t v11 = v68;
            unint64_t v25 = v73 - 1;
            uint64_t result = (uint64_t)memmove((void *)(v26 + 16 * v28), v71 + 2, 16 * (v73 - 1 - v28));
            *(void *)(v68 + 16) = v73 - 1;
            uint64_t v10 = v86;
            if (v73 <= 2) {
              goto LABEL_69;
            }
          }
        }
        unint64_t v25 = 1;
LABEL_69:
        uint64_t v9 = v84;
        uint64_t v5 = v85;
        uint64_t v4 = 0;
        uint64_t v7 = v83;
        if (v84 >= v85) {
          goto LABEL_78;
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_74:
      if (v5 < -1) {
        goto LABEL_116;
      }
      *(void *)(v82 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_25C61A49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 == a2) {
    return;
  }
  uint64_t v4 = a3;
  uint64_t v6 = *a4;
  uint64_t v7 = *a4 + 24 * a3 - 24;
  while (2)
  {
    uint64_t v8 = (double *)(v6 + 24 * v4);
    double v9 = *v8;
    double v10 = v8[2];
    uint64_t v11 = a1;
    uint64_t v12 = v7;
    do
    {
      uint64_t v13 = *(void *)v12;
      double v14 = *(double *)(v12 + 16);
      unsigned int v15 = *(unsigned __int8 *)(*(void *)&v9 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v10 == v14)
      {
        unsigned int v16 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
        if (v15 != v16)
        {
          if (v15 >= v16) {
            break;
          }
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      int v17 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v15 - 1 < 2)
      {
        if ((v17 - 1) > 1) {
          goto LABEL_16;
        }
LABEL_10:
        double v18 = sub_25C5FDD44();
        if (sub_25C5FDD44() >= v18) {
          break;
        }
        goto LABEL_16;
      }
      unsigned int v19 = v17 - 3;
      if (v10 >= v14 || v19 > 0xFFFFFFFD) {
        break;
      }
LABEL_16:
      if (!v6)
      {
        __break(1u);
        return;
      }
      double v10 = *(double *)(v12 + 40);
      long long v21 = *(_OWORD *)(v12 + 24);
      *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
      *(void *)(v12 + 40) = *(void *)(v12 + 16);
      *(_OWORD *)uint64_t v12 = v21;
      *(double *)(v12 + 16) = v10;
      double v9 = *(double *)&v21;
      v12 -= 24;
      ++v11;
    }
    while (v4 != v11);
    ++v4;
    v7 += 24;
    if (v4 != a2) {
      continue;
    }
    break;
  }
}

uint64_t sub_25C61A5F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, void *), uint64_t a5)
{
  v26[4] = a5;
  if (a3 != a2)
  {
    uint64_t v7 = result;
    uint64_t v8 = *v5;
    double v9 = (void *)(*v5 + 24 * a3);
    uint64_t v19 = result;
    uint64_t v22 = *v5;
LABEL_4:
    double v10 = (uint64_t *)(v8 + 24 * a3);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = v10[2];
    long long v21 = v9;
    uint64_t v23 = a3;
    while (1)
    {
      v26[0] = v11;
      v26[1] = v12;
      uint64_t v15 = *(v9 - 3);
      uint64_t v14 = *(v9 - 2);
      v26[2] = v13;
      uint64_t v16 = *(v9 - 1);
      v25[0] = v15;
      v25[1] = v14;
      v25[2] = v16;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      char v17 = a4(v26, v25);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      if (v6) {
        break;
      }
      if ((v17 & 1) == 0)
      {
        uint64_t v8 = v22;
        uint64_t v18 = v23;
LABEL_11:
        a3 = v18 + 1;
        double v9 = v21 + 3;
        uint64_t v7 = v19;
        if (a3 != a2) {
          goto LABEL_4;
        }
        return result;
      }
      uint64_t v8 = v22;
      if (!v22)
      {
        __break(1u);
        return result;
      }
      uint64_t v11 = *v9;
      uint64_t v12 = v9[1];
      uint64_t v13 = v9[2];
      *(_OWORD *)double v9 = *(_OWORD *)(v9 - 3);
      long long v9[2] = *(v9 - 1);
      *(v9 - 2) = v12;
      *(v9 - 1) = v13;
      *(v9 - 3) = v11;
      v9 -= 3;
      ++v7;
      uint64_t v18 = v23;
      if (v23 == v7) {
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t sub_25C61A76C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 + 1 >= a3)
  {
    LOBYTE(v5) = 0;
    uint64_t v8 = a4 + 1;
  }
  else
  {
    uint64_t v8 = a3;
    double v10 = (long long *)(a2 + 24 * (a4 + 1));
    uint64_t v11 = *((void *)v10 + 2);
    long long v28 = *v10;
    uint64_t v29 = v11;
    uint64_t v12 = (long long *)(a2 + 24 * a4);
    uint64_t v13 = *((void *)v12 + 2);
    long long v26 = *v12;
    uint64_t v27 = v13;
    int v14 = sub_25C6173A4((uint64_t)&v28, (double *)&v26);
    if (v4) {
      return v5 & 1;
    }
    int v5 = v14;
    uint64_t v15 = a4 + 2;
    if (a4 + 2 < v8)
    {
      uint64_t v16 = a2 + 24 * a4 + 40;
      while (1)
      {
        double v17 = *(double *)(v16 + 24);
        uint64_t v18 = *(void *)(v16 - 16);
        unsigned int v19 = *(unsigned __int8 *)(*(void *)(v16 + 8)
                                 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
        if (v17 == *(double *)v16) {
          break;
        }
        unsigned int v22 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) - 1;
        if (v19 - 1 >= 2)
        {
          if (v22 > 1)
          {
            BOOL v24 = v17 < *(double *)v16;
            goto LABEL_13;
          }
          if (v5) {
            goto LABEL_25;
          }
        }
        else
        {
          if (v22 <= 1) {
            goto LABEL_12;
          }
          if ((v5 & 1) == 0) {
            goto LABEL_25;
          }
        }
LABEL_17:
        ++v15;
        v16 += 24;
        if (v15 >= v8) {
          goto LABEL_26;
        }
      }
      unsigned int v20 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v19 == v20)
      {
LABEL_12:
        double v23 = sub_25C5FDD44();
        BOOL v24 = sub_25C5FDD44() < v23;
LABEL_13:
        BOOL v21 = v24;
      }
      else
      {
        BOOL v21 = v19 < v20;
      }
      if ((v5 ^ v21)) {
        goto LABEL_25;
      }
      goto LABEL_17;
    }
LABEL_25:
    uint64_t v8 = v15;
  }
LABEL_26:
  *a1 = v8;
  return v5 & 1;
}

uint64_t sub_25C61A904(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, uint64_t *))
{
  uint64_t v6 = a4 + 1;
  if (a4 + 1 >= a3)
  {
    char v16 = 0;
    *a1 = v6;
  }
  else
  {
    uint64_t v35 = a3;
    double v9 = (uint64_t *)(a2 + 24 * v6);
    uint64_t v10 = v9[1];
    uint64_t v11 = v9[2];
    uint64_t v32 = *v9;
    uint64_t v33 = v10;
    uint64_t v34 = v11;
    uint64_t v12 = (uint64_t *)(a2 + 24 * a4);
    uint64_t v13 = v12[1];
    uint64_t v14 = v12[2];
    uint64_t v29 = *v12;
    uint64_t v30 = v13;
    uint64_t v31 = v14;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    int v28 = a5(&v32, &v29);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v5)
    {
      uint64_t v27 = a5;
      uint64_t v17 = a4 + 2;
      if (a4 + 2 >= v35)
      {
        char v16 = v28;
      }
      else
      {
        uint64_t v18 = (uint64_t *)(a2 + 24 * a4 + 64);
        while (1)
        {
          uint64_t v19 = *(v18 - 1);
          uint64_t v20 = *v18;
          uint64_t v32 = *(v18 - 2);
          uint64_t v33 = v19;
          uint64_t v34 = v20;
          uint64_t v21 = *(v18 - 4);
          uint64_t v22 = *(v18 - 3);
          uint64_t v29 = *(v18 - 5);
          uint64_t v30 = v21;
          uint64_t v31 = v22;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          int v23 = v27(&v32, &v29);
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
          char v16 = v28;
          if ((v28 ^ v23)) {
            break;
          }
          ++v17;
          v18 += 3;
          if (v17 >= v35)
          {
            uint64_t v17 = v35;
            BOOL v24 = a1;
            char v16 = v28;
            goto LABEL_13;
          }
        }
      }
      BOOL v24 = a1;
LABEL_13:
      *BOOL v24 = v17;
    }
  }
  return v16 & 1;
}

uint64_t sub_25C61AAFC(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  if (v9 >= v11)
  {
    sub_25C603BD8(a2, (uint64_t)(a3 - (void)a2) / 24, a4);
    uint64_t v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_13;
    }
    unint64_t v31 = a3 - 24;
    uint64_t v50 = v4;
    while (1)
    {
      uint64_t v32 = (char *)(v31 + 24);
      uint64_t v33 = v12 - 24;
      uint64_t v34 = v6 - 24;
      uint64_t v35 = *((void *)v6 - 3);
      double v36 = *((double *)v12 - 1);
      double v37 = *((double *)v6 - 1);
      unsigned int v38 = *(unsigned __int8 *)(*((void *)v12 - 3) + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v36 == v37) {
        break;
      }
      int v40 = *(unsigned __int8 *)(v35 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v38 - 1 < 2)
      {
        if ((v40 - 1) > 1) {
          goto LABEL_44;
        }
LABEL_43:
        uint64_t v41 = v12;
        double v42 = sub_25C5FDD44();
        double v43 = sub_25C5FDD44();
        uint64_t v12 = v41;
        uint64_t v4 = v50;
        if (v43 >= v42) {
          goto LABEL_60;
        }
        goto LABEL_44;
      }
      unsigned int v47 = v40 - 3;
      if (v36 >= v37 || v47 > 0xFFFFFFFD)
      {
LABEL_60:
        BOOL v49 = v32 != v12 || v31 >= (unint64_t)v12;
        uint64_t v34 = v33;
        uint64_t v12 = v33;
        if (!v49) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }
LABEL_44:
      BOOL v44 = v32 != v6 || v31 >= (unint64_t)v6;
      v6 -= 24;
      if (!v44) {
        goto LABEL_50;
      }
LABEL_49:
      long long v45 = *(_OWORD *)v34;
      *(void *)(v31 + 16) = *((void *)v34 + 2);
      *(_OWORD *)unint64_t v31 = v45;
LABEL_50:
      v31 -= 24;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_13;
      }
    }
    unsigned int v39 = *(unsigned __int8 *)(v35 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v38 != v39)
    {
      if (v38 >= v39) {
        goto LABEL_60;
      }
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  sub_25C603BD8(a1, (a2 - a1) / 24, a4);
  uint64_t v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    char v16 = &v4[24 * v9];
    while (1)
    {
      double v17 = *((double *)v6 + 2);
      uint64_t v18 = *(void *)v4;
      double v19 = *((double *)v4 + 2);
      unsigned int v20 = *(unsigned __int8 *)(*(void *)v6 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v17 == v19) {
        break;
      }
      int v22 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v20 - 1 < 2)
      {
        if ((v22 - 1) > 1) {
          goto LABEL_21;
        }
LABEL_20:
        double v23 = sub_25C5FDD44();
        double v24 = sub_25C5FDD44();
        uint64_t v12 = v16;
        if (v24 >= v23) {
          goto LABEL_34;
        }
        goto LABEL_21;
      }
      unsigned int v29 = v22 - 3;
      if (v17 >= v19 || v29 > 0xFFFFFFFD)
      {
LABEL_34:
        unint64_t v25 = v4;
        BOOL v26 = v7 == v4;
        v4 += 24;
        if (v26) {
          goto LABEL_23;
        }
LABEL_22:
        long long v27 = *(_OWORD *)v25;
        *((void *)v7 + 2) = *((void *)v25 + 2);
        *(_OWORD *)uint64_t v7 = v27;
        goto LABEL_23;
      }
LABEL_21:
      unint64_t v25 = v6;
      BOOL v26 = v7 == v6;
      v6 += 24;
      if (!v26) {
        goto LABEL_22;
      }
LABEL_23:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_7;
      }
    }
    unsigned int v21 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v20 != v21)
    {
      if (v20 >= v21) {
        goto LABEL_34;
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_7:
  uint64_t v6 = v7;
LABEL_13:
  sub_25C603BD8(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_25C61ADB4(char *a1, char *a2, unint64_t a3, char *a4, uint64_t (*a5)(uint64_t *, uint64_t *))
{
  uint64_t v6 = v5;
  uint64_t v7 = a4;
  uint64_t v9 = a1;
  uint64_t v10 = a2 - a1;
  uint64_t v11 = (a2 - a1) / 24;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = (uint64_t)(a3 - (void)a2) / 24;
  if (v11 < v13)
  {
    sub_25C603BD8(a1, (a2 - a1) / 24, a4);
    uint64_t v15 = &v7[24 * v11];
    if ((unint64_t)a2 >= a3 || v10 < 24)
    {
LABEL_7:
      double v17 = v9;
    }
    else
    {
      double v23 = a2;
      uint64_t v57 = &v7[24 * v11];
      while (1)
      {
        uint64_t v50 = v9;
        uint64_t v24 = *((void *)v23 + 1);
        unint64_t v25 = v23;
        uint64_t v26 = *((void *)v23 + 2);
        uint64_t v54 = *(void *)v23;
        uint64_t v55 = v24;
        uint64_t v56 = v26;
        uint64_t v27 = *((void *)v7 + 1);
        uint64_t v28 = *((void *)v7 + 2);
        uint64_t v51 = *(void *)v7;
        uint64_t v52 = v27;
        uint64_t v53 = v28;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        char v29 = a5(&v54, &v51);
        if (v6)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v20 = (v57 - v7) / 24;
          unsigned int v21 = v7;
          double v17 = v50;
          goto LABEL_14;
        }
        char v30 = v29;
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        if (v30)
        {
          unint64_t v31 = v25;
          double v23 = v25 + 24;
          uint64_t v32 = v50;
          BOOL v33 = v50 == v25;
        }
        else
        {
          unint64_t v31 = v7;
          uint64_t v32 = v50;
          BOOL v33 = v50 == v7;
          v7 += 24;
          double v23 = v25;
        }
        uint64_t v15 = v57;
        if (!v33)
        {
          long long v34 = *(_OWORD *)v31;
          *((void *)v32 + 2) = *((void *)v31 + 2);
          *(_OWORD *)uint64_t v32 = v34;
        }
        uint64_t v9 = v32 + 24;
        if (v7 >= v15) {
          break;
        }
        uint64_t v6 = 0;
        if ((unint64_t)v23 >= a3) {
          goto LABEL_7;
        }
      }
      double v17 = v9;
    }
    goto LABEL_13;
  }
  sub_25C603BD8(a2, (uint64_t)(a3 - (void)a2) / 24, a4);
  double v17 = a2;
  uint64_t v15 = &v7[24 * v13];
  if (v9 >= a2 || v12 < 24)
  {
LABEL_13:
    uint64_t v20 = (v15 - v7) / 24;
    unsigned int v21 = v7;
LABEL_14:
    sub_25C603BD8(v21, v20, v17);
    return 1;
  }
  unint64_t v35 = a3 - 24;
  unsigned int v47 = v7;
  while (1)
  {
    uint64_t v57 = v15;
    uint64_t v37 = *((void *)v15 - 2);
    double v36 = v15 - 24;
    uint64_t v38 = *((void *)v15 - 1);
    uint64_t v54 = *((void *)v15 - 3);
    uint64_t v55 = v37;
    uint64_t v56 = v38;
    uint64_t v48 = v17;
    uint64_t v40 = *((void *)v17 - 2);
    unsigned int v39 = v17 - 24;
    uint64_t v41 = *((void *)v17 - 1);
    uint64_t v51 = *((void *)v17 - 3);
    uint64_t v52 = v40;
    uint64_t v53 = v41;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    char v42 = a5(&v54, &v51);
    if (v5) {
      break;
    }
    char v43 = v42;
    BOOL v44 = (char *)(v35 + 24);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    if (v43)
    {
      BOOL v45 = v44 != v48 || v35 >= (unint64_t)v48;
      double v17 = v39;
      uint64_t v15 = v57;
    }
    else
    {
      BOOL v45 = v44 != v57 || v35 >= (unint64_t)v57;
      unsigned int v39 = v36;
      uint64_t v15 = v36;
      double v17 = v48;
    }
    if (v45)
    {
      long long v46 = *(_OWORD *)v39;
      *(void *)(v35 + 16) = *((void *)v39 + 2);
      *(_OWORD *)unint64_t v35 = v46;
    }
    uint64_t v7 = v47;
    if (v17 > v9)
    {
      v35 -= 24;
      if (v15 > v47) {
        continue;
      }
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25C603BD8(v47, (v57 - v47) / 24, v48);
  return 1;
}

char *sub_25C61B144(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB780);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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

char *sub_25C61B23C(uint64_t a1)
{
  return sub_25C61B144(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25C61B250(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = *v5;
  uint64_t v8 = *(void *)(*v5 + 16);
  if (v8 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = result;
  uint64_t v10 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v12 = v8 + v11;
  if (__OFADD__(v8, v11))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v12 > *(void *)(v7 + 24) >> 1)
  {
    if (v8 <= v12) {
      uint64_t v17 = v8 + v11;
    }
    else {
      uint64_t v17 = v8;
    }
    sub_25C603118(isUniquelyReferenced_nonNull_native, v17, 1, v7);
    uint64_t v7 = v18;
  }
  uint64_t v19 = v7 + 32;
  uint64_t v20 = v7 + 32 + 24 * v9;
  uint64_t result = swift_arrayDestroy();
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v21 = *(void *)(v7 + 16);
  if (__OFSUB__(v21, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_25C603BD8((char *)(v19 + 24 * a2), v21 - a2, (char *)(v20 + 24));
  uint64_t v22 = *(void *)(v7 + 16);
  BOOL v23 = __OFADD__(v22, v11);
  uint64_t v24 = v22 + v11;
  if (!v23)
  {
    *(void *)(v7 + 16) = v24;
LABEL_16:
    *(void *)uint64_t v20 = a3;
    uint64_t v25 = v19 + 24 * v9;
    *(void *)(v25 + 8) = a4;
    *(double *)(v25 + 16) = a5;
    *char v5 = v7;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

void *sub_25C61B38C(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[11] = type metadata accessor for DefaultProfanityPreferenceProvider();
  a6[12] = &off_2709C5750;
  a6[8] = a3;
  a6[16] = type metadata accessor for DefaultBlockedAppsProvider();
  a6[17] = &off_2709C56B0;
  a6[13] = a4;
  sub_25C61CEEC(a1, (uint64_t)(a6 + 2));
  a6[7] = a2;
  a6[18] = a5;
  return a6;
}

void *sub_25C61B418(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = type metadata accessor for DefaultProfanityPreferenceProvider();
  uint64_t v26 = &off_2709C5750;
  v24[0] = a3;
  uint64_t v22 = type metadata accessor for DefaultBlockedAppsProvider();
  BOOL v23 = &off_2709C56B0;
  v21[0] = a4;
  type metadata accessor for DefaultSiriAutoCompleteService();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (void *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_25C61B38C(a1, a2, *v13, *v17, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t sub_25C61B610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3515D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of SiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1CC;
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.autoCompleteResults(for:)()
{
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_85();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1CC;
  uint64_t v3 = OUTLINED_FUNCTION_72();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1D4;
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.deletePhrasesForSource(source:)()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1D4;
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.deletePhrasesForApp(bundleIds:)()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1D0;
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.increaseTapCountForPhrase(phrase:)()
{
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_85();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1D4;
  uint64_t v3 = OUTLINED_FUNCTION_72();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.fetchPhrasesMatching(filters:)()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_41(v0);
  void *v1 = v2;
  v1[1] = sub_25C61D1CC;
  uint64_t v3 = OUTLINED_FUNCTION_16_1();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteService.dropDB()()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_4_2();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 64) + **(int **)(v0 + 64));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_41(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_25C61828C;
  uint64_t v4 = OUTLINED_FUNCTION_71();
  return v6(v4);
}

uint64_t type metadata accessor for DefaultSiriAutoCompleteService()
{
  return self;
}

uint64_t method lookup function for DefaultSiriAutoCompleteService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultSiriAutoCompleteService);
}

BOOL sub_25C61BDB4(uint64_t *a1, uint64_t *a2)
{
  return sub_25C6166DC(a1, a2);
}

char *sub_25C61BDD4(uint64_t a1)
{
  return sub_25C619728(0, *(void *)(a1 + 16), 0, a1);
}

size_t sub_25C61BDE8(size_t result)
{
  int64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)v1;
  int64_t v5 = v3 >> 1;
  if ((v3 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull();
  *(void *)uint64_t v1 = v4;
  if ((result & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(v1 + 16);
  int64_t v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v8 = *(void *)(v1 + 8);
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    uint64_t result = swift_release();
    goto LABEL_23;
  }
  unint64_t v17 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v18 = (v17 >> 1) - v10;
  BOOL v19 = __OFADD__(v7, v18);
  v7 += v18;
  if (!v19)
  {
LABEL_23:
    if (v7 >= v2) {
      goto LABEL_21;
    }
LABEL_8:
    uint64_t v11 = *(void *)(v1 + 16);
    int64_t v12 = v5 - v11;
    if (__OFSUB__(v5, v11))
    {
      __break(1u);
    }
    else
    {
      uint64_t v13 = *(void *)(v1 + 8);
      if (v12 <= v2) {
        int64_t v14 = v2;
      }
      else {
        int64_t v14 = v5 - v11;
      }
      if (v14)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5D8);
        uint64_t v4 = (void *)swift_allocObject();
        uint64_t result = _swift_stdlib_malloc_size(v4);
        uint64_t v4[2] = v12;
        v4[3] = 2 * ((uint64_t)(result - 32) / 32);
      }
      else
      {
        uint64_t v4 = (void *)MEMORY[0x263F8EE78];
      }
      if (v5 >= v11)
      {
        uint64_t result = sub_25C618AA0(v13 + 32 * v11, v5 - v11);
        if (!__OFSUB__(0, v11))
        {
          uint64_t v15 = v4[2];
          uint64_t v16 = v11 + v15;
          if (!__OFADD__(v11, v15))
          {
            if (v16 >= v11)
            {
              uint64_t result = swift_unknownObjectRelease();
              if ((v16 & 0x8000000000000000) == 0)
              {
                *(void *)(v1 + 8) = &v4[-4 * v11 + 4];
                *(void *)(v1 + 16) = v11;
                *(void *)(v1 + 24) = (2 * v16) | 1;
LABEL_21:
                *(void *)uint64_t v1 = v4;
                return result;
              }
              goto LABEL_30;
            }
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    __break(1u);
    goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_25C61BFAC(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = result;
  uint64_t result = (void *)sub_25C61C414((a4 >> 1) - a3);
  uint64_t v11 = v4[2];
  unint64_t v10 = v4[3];
  uint64_t v12 = (v10 >> 1) - v11;
  if (__OFSUB__(v10 >> 1, v11))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v13 = v4[1] + 32 * v11 + 32 * v12;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    uint64_t v16 = v12;
    goto LABEL_10;
  }
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {
    swift_unknownObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(v14 + 16);
  if (v13 != v14 + 32 * v15 + 32)
  {
    uint64_t result = (void *)swift_release();
    goto LABEL_8;
  }
  unint64_t v17 = *(void *)(v14 + 24);
  uint64_t result = (void *)swift_release();
  uint64_t v18 = (v17 >> 1) - v15;
  BOOL v19 = __OFADD__(v12, v18);
  uint64_t v16 = v12 + v18;
  if (v19)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_10:
  uint64_t v20 = v16 - v12;
  if (__OFSUB__(v16, v12))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      uint64_t v6 = 0;
      unint64_t v5 = a3;
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  if (v20 < v6)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  sub_25C618AA0(a2 + 32 * a3, v6);
  if (v6 > 0)
  {
    uint64_t result = (void *)(v12 + v6);
    if (__OFADD__(v12, v6))
    {
LABEL_29:
      __break(1u);
      return result;
    }
    sub_25C61C51C((uint64_t)result);
  }
LABEL_18:
  if (v6 == v20)
  {
    v22[0] = v9;
    v22[1] = a2;
    v22[2] = a3;
    v22[3] = a4;
    v22[4] = v5;
    return sub_25C61C5D4(v22);
  }
  else
  {
    return (void *)swift_unknownObjectRelease();
  }
}

uint64_t sub_25C61C164(uint64_t result, uint64_t a2)
{
  if (__OFSUB__(0, a2))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(result + 16);
  BOOL v3 = __OFADD__(a2, v2);
  uint64_t v4 = a2 + v2;
  if (v3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < a2)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0) {
LABEL_9:
  }
    __break(1u);
  return result;
}

uint64_t sub_25C61C1AC(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4[2];
  unint64_t v6 = (unint64_t)v4[3] >> 1;
  uint64_t v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)result;
  uint64_t v10 = *(void *)(*(void *)result + 16);
  BOOL v11 = __OFSUB__(v10, a2);
  uint64_t v12 = v10 - a2;
  if (v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v13 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v14 = v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v11 = __OFSUB__(v14, v13);
  uint64_t v15 = v14 - v13;
  if (v11)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v31 = v15;
  unint64_t v17 = (char *)(v9 + 32);
  uint64_t v18 = v9 + 32 + 32 * a2;
  char v29 = (char *)(v18 + 32 * a3);
  uint64_t result = sub_25C61CBA4(v7);
  uint64_t v30 = v9;
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v28 = v4[2];
    uint64_t v20 = (char *)(v4[1] + 32 * v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E0);
    swift_arrayDestroy();
    sub_25C603C3C(v20, a2, v17);
    swift_arrayDestroy();
    a4(v18, a3);
    sub_25C603C3C(&v20[32 * a2 + 32 * v31], v13, v29);
    swift_arrayDestroy();
    *(void *)(v19 + 16) = 0;
    uint64_t v21 = v28;
    swift_release();
LABEL_15:
    swift_retain();
    swift_unknownObjectRelease();
    uint64_t result = sub_25C61C164(v30, v21);
    *uint64_t v4 = result;
    v4[1] = v25;
    uint64_t v4[2] = v26;
    v4[3] = v27;
    return result;
  }
  uint64_t v21 = v4[2];
  uint64_t v22 = v21 + a2;
  if (__OFADD__(v21, a2)) {
    goto LABEL_21;
  }
  if (v22 < v21)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (__OFSUB__(v22, v21))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E0);
  swift_arrayInitWithCopy();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))a4)(&v17[32 * a2], a3);
  int64_t v23 = v22 + v31;
  if (__OFADD__(v22, v31))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v24 = (unint64_t)v4[3] >> 1;
  if (v24 < v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFSUB__(v24, v23))
  {
    swift_arrayInitWithCopy();
    goto LABEL_15;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25C61C414(uint64_t result)
{
  uint64_t v3 = v1[2];
  unint64_t v2 = v1[3];
  uint64_t v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = result;
  if ((v2 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v6 = v1[1];
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v7 + 16);
  if (v6 + 32 * v3 + 32 * v4 != v7 + 32 * v8 + 32)
  {
    swift_release();
LABEL_7:
    uint64_t v9 = v4;
    goto LABEL_9;
  }
  unint64_t v10 = *(void *)(v7 + 24);
  uint64_t result = swift_release();
  uint64_t v11 = (v10 >> 1) - v8;
  BOOL v12 = __OFADD__(v4, v11);
  uint64_t v9 = v4 + v11;
  if (v12)
  {
LABEL_20:
    __break(1u);
    return result;
  }
LABEL_9:
  uint64_t result = v4 + v5;
  if (__OFADD__(v4, v5))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v9 < result)
  {
    if (v9 + 0x4000000000000000 >= 0)
    {
      uint64_t v13 = 2 * v9;
      if (v13 > result) {
        uint64_t result = v13;
      }
      goto LABEL_14;
    }
    goto LABEL_19;
  }
LABEL_14:
  return sub_25C61BDE8(result);
}

uint64_t sub_25C61C51C(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = v3 >> 1;
  BOOL v5 = __OFSUB__(v3 >> 1, v2);
  uint64_t v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7) {
    return result;
  }
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(result + 16);
  BOOL v5 = __OFADD__(v8, v7);
  uint64_t v9 = v8 + v7;
  if (v5) {
    goto LABEL_13;
  }
  *(void *)(result + 16) = v9;
  uint64_t result = swift_release();
  uint64_t v10 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 24) = v3 & 1 | (2 * v10);
  return result;
}

void *sub_25C61C5D4(void *result)
{
  uint64_t v2 = v1[2];
  unint64_t v3 = v1[3];
  uint64_t v4 = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2)) {
    goto LABEL_58;
  }
  unint64_t v6 = result[3];
  uint64_t v5 = result[4];
  uint64_t v37 = (uint64_t)result;
  if (v5 == v6 >> 1)
  {
LABEL_47:
    return (void *)sub_25C61CB78(v37);
  }
  int64_t v7 = v6 >> 1;
  uint64_t v46 = result[2];
  if (v5 < v46 || v5 >= v7) {
    goto LABEL_59;
  }
  uint64_t v9 = v5 + 1;
  uint64_t v38 = result[1];
  uint64_t v10 = (uint64_t *)(v38 + 32 * v5);
  char v11 = *((unsigned char *)v10 + 24);
  uint64_t v12 = v10[1];
  uint64_t v42 = v10[2];
  uint64_t v45 = *v10;
  swift_retain();
  uint64_t v41 = v12;
  uint64_t result = (void *)swift_bridgeObjectRetain();
  uint64_t v40 = v1;
  while (1)
  {
    uint64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    uint64_t v47 = sub_25C61C95C(v4, v4 + 1, *v1, v1[1], v2, v3);
    uint64_t v14 = sub_25C61CB5C();
    sub_25C61C1AC((uint64_t)&v47, v4, 0, (void (*)(uint64_t, uint64_t))v14);
    swift_release();
    uint64_t result = (void *)swift_release();
    uint64_t v2 = v1[2];
    unint64_t v15 = v1[3];
    uint64_t v16 = (v15 >> 1) - v2;
    if (__OFSUB__(v15 >> 1, v2)) {
      goto LABEL_52;
    }
    uint64_t v17 = v1[1];
    unint64_t v44 = v1[3];
    unint64_t v43 = v15 >> 1;
    if ((v15 & 1) == 0) {
      goto LABEL_16;
    }
    sub_25C61EFC0();
    swift_unknownObjectRetain();
    uint64_t v18 = swift_dynamicCastClass();
    if (!v18)
    {
      swift_unknownObjectRelease();
      uint64_t v18 = MEMORY[0x263F8EE78];
    }
    uint64_t v19 = *(void *)(v18 + 16);
    if (v17 + 32 * v2 + 32 * v16 != v18 + 32 * v19 + 32)
    {
      uint64_t result = (void *)swift_release();
LABEL_16:
      uint64_t v20 = v16;
      goto LABEL_18;
    }
    unint64_t v21 = *(void *)(v18 + 24);
    uint64_t result = (void *)swift_release();
    uint64_t v22 = (v21 >> 1) - v19;
    uint64_t v20 = v16 + v22;
    if (__OFADD__(v16, v22)) {
      goto LABEL_57;
    }
LABEL_18:
    if (v4 >= v20) {
      goto LABEL_21;
    }
    uint64_t v23 = v17 + 32 * v2 + 32 * v4;
    *(void *)uint64_t v23 = v45;
    *(void *)(v23 + 8) = v41;
    *(void *)(v23 + 16) = v42;
    *(unsigned char *)(v23 + 24) = v11 & 1;
    if (v9 == v7)
    {
      uint64_t v45 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      char v11 = 0;
      ++v4;
      uint64_t v9 = v7;
LABEL_21:
      uint64_t v1 = v40;
      goto LABEL_38;
    }
    uint64_t v39 = v2;
    if (v9 < v46 || v9 >= v7)
    {
LABEL_50:
      __break(1u);
      break;
    }
    uint64_t v25 = 0;
    uint64_t v26 = v17 + 32 * v39 + 32 * v4;
    uint64_t v27 = v38 + 32 * v9++;
    while (1)
    {
      uint64_t v28 = *(void *)(v27 + v25 + 8);
      uint64_t v29 = *(void *)(v27 + v25 + 16);
      char v11 = *(unsigned char *)(v27 + v25 + 24);
      if (v13 >= v20)
      {
        uint64_t v42 = *(void *)(v27 + v25 + 16);
        uint64_t v45 = *(void *)(v27 + v25);
        uint64_t v41 = *(void *)(v27 + v25 + 8);
        goto LABEL_37;
      }
      uint64_t v30 = v26 + v25;
      *(void *)(v30 + 32) = *(void *)(v27 + v25);
      *(void *)(v30 + 40) = v28;
      *(void *)(v30 + 48) = v29;
      *(unsigned char *)(v30 + 56) = v11;
      if (v7 == v9) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t result = (void *)swift_retain();
      v25 += 32;
      BOOL v31 = v9 >= v46 && v9 < v7;
      ++v9;
      ++v13;
      if (!v31) {
        goto LABEL_50;
      }
    }
    uint64_t v45 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    char v11 = 0;
    uint64_t v20 = v13 + 1;
    uint64_t v9 = v7;
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
    uint64_t v4 = v20;
    uint64_t v2 = v39;
    uint64_t v1 = v40;
LABEL_38:
    BOOL v32 = __OFSUB__(v4, v16);
    uint64_t v33 = v4 - v16;
    unint64_t v3 = v44;
    if (v32) {
      goto LABEL_53;
    }
    if (v33)
    {
      sub_25C61EFC0();
      swift_unknownObjectRetain();
      uint64_t result = (void *)swift_dynamicCastClass();
      if (!result)
      {
        swift_unknownObjectRelease();
        uint64_t result = (void *)MEMORY[0x263F8EE78];
      }
      uint64_t v34 = result[2];
      BOOL v32 = __OFADD__(v34, v33);
      uint64_t v35 = v34 + v33;
      if (v32) {
        goto LABEL_54;
      }
      result[2] = v35;
      uint64_t result = (void *)swift_release();
      unint64_t v36 = v43 + v33;
      if (__OFADD__(v43, v33)) {
        goto LABEL_55;
      }
      if ((v36 & 0x8000000000000000) != 0) {
        goto LABEL_56;
      }
      unint64_t v3 = v44 & 1 | (2 * v36);
      v1[3] = v3;
    }
    if (!v45) {
      goto LABEL_47;
    }
  }
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
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_25C61C95C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v7 = a2;
  uint64_t v6 = result;
  if ((a6 & 1) == 0) {
    goto LABEL_32;
  }
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = a4 + 32 * a5 + 32 * v8;
  if (v13 == v11 + 32 * v12 + 32)
  {
    unint64_t v15 = *(void *)(v11 + 24);
    uint64_t result = swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = MEMORY[0x263F8EE78];
    }
    uint64_t v18 = *(void *)(v17 + 16);
    if (v13 == v17 + 32 * v18 + 32)
    {
      unint64_t v20 = *(void *)(v17 + 24);
      uint64_t result = swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  uint64_t v19 = *(void *)(v17 + 16);
  if (v13 == v17 + 32 * v19 + 32)
  {
    unint64_t v23 = *(void *)(v17 + 24);
    uint64_t result = swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = v25;
  }
  if (!v26) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5D8);
  uint64_t v27 = (void *)swift_allocObject();
  size_t v28 = _swift_stdlib_malloc_size(v27);
  v27[2] = v6;
  v27[3] = 2 * ((uint64_t)(v28 - 32) / 32);
  return (uint64_t)v27;
}

uint64_t (*sub_25C61CB5C())()
{
  return nullsub_1;
}

uint64_t sub_25C61CB78(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C61CBA4(uint64_t a1)
{
  uint64_t isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  sub_25C61EFC0();
  swift_unknownObjectRetain();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = *(void *)(v9 + 24);
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1) {
      return 0;
    }
    sub_25C61EFC0();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x263F8EE78];
    }
    uint64_t v16 = (v8 + 32 * v6 - a1 - 32) / 32;
    uint64_t isUniquelyReferenced_nonNull = v7 + v16;
    if (!__OFADD__(v7, v16))
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4) {
        return a1;
      }
LABEL_19:
      sub_25C61CD10(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C61CD10(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = v7 + 32 + 32 * result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5BB5E0);
  uint64_t result = swift_arrayDestroy();
  BOOL v9 = __OFSUB__(a3, v4);
  uint64_t v10 = a3 - v4;
  if (v9)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(v7 + 16);
  if (__OFSUB__(v11, a2)) {
    goto LABEL_11;
  }
  uint64_t result = (uint64_t)sub_25C603C3C((char *)(v7 + 32 + 32 * a2), v11 - a2, (char *)(v8 + 32 * a3));
  uint64_t v12 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v12, v10);
  uint64_t v13 = v12 + v10;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(v7 + 16) = v13;
LABEL_7:
  if (a3 > 0) {
LABEL_13:
  }
    __break(1u);
  return result;
}

uint64_t sub_25C61CDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C61CE2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C602470(a1, a2);
  }
  return a1;
}

uint64_t sub_25C61CE40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_25C61CEEC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C61CF04(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_67();
  v3();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DefaultSiriAutoCompleteService.UniqueIdentifiers()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultSiriAutoCompleteService.UniqueIdentifiers()
{
  return &type metadata for DefaultSiriAutoCompleteService.UniqueIdentifiers;
}

unint64_t sub_25C61D180()
{
  unint64_t result = qword_26A5BB790;
  if (!qword_26A5BB790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB790);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](a1, a2, 0);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_18_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_1@<X0>(uint64_t a1@<X8>)
{
  return sub_25C618C00(0xD00000000000004CLL, a1 | 0x8000000000000000, (uint64_t *)(v1 - 152));
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_25(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_30@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return sub_25C618C00(0xD00000000000001CLL, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  return sub_25C618C00(0xD00000000000001FLL, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_25C61E890();
}

BOOL OUTLINED_FUNCTION_36(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_25C61E9B0();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return *(void *)(v0 + 272);
}

uint64_t OUTLINED_FUNCTION_44@<X0>(uint64_t a1@<X8>)
{
  void *v1 = a1;
  return sub_25C61E720();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

void OUTLINED_FUNCTION_48(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_25C618C00(v0, v1, (uint64_t *)(v2 - 152));
}

void OUTLINED_FUNCTION_50(float a1)
{
  float *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static SignpostLogger.end(log:name:telemetry:)(a1, a2, 24, 2, a5, 19, 2);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_59@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_64()
{
  *(void *)(v1 - 176) = v0;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_66(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_68()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return sub_25C61E840();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_77(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_78()
{
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_79(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_25C61EC20();
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return sub_25C618C00(0xD000000000000019, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_81@<X0>(uint64_t a1@<X8>)
{
  return sub_25C618C00(0xD000000000000019, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_83@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_25C618C00(0xD000000000000029, (a1 - 32) | 0x8000000000000000, &a2);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_92()
{
  **(void **)(v0 + 80) = 0;
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_94()
{
  return *(void *)(v0 + 168) == 0;
}

uint64_t OUTLINED_FUNCTION_95()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_98()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_99@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_100()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return 0x657361726870;
}

id OUTLINED_FUNCTION_103()
{
  *(_WORD *)(v1 + 12) = 2112;
  return v0;
}

BOOL OUTLINED_FUNCTION_104@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_105()
{
  return sub_25C61EB70();
}

uint64_t OUTLINED_FUNCTION_106(uint64_t result)
{
  *(void *)(v1 - 152) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_107()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_113(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_114(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_115(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_116()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_118@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  return sub_25C618C00(0xD00000000000002CLL, a1 | 0x8000000000000000, (uint64_t *)va);
}

void OUTLINED_FUNCTION_119(float a1)
{
  float *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_121()
{
  return v0;
}

__n128 *OUTLINED_FUNCTION_122(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_123()
{
  return sub_25C61EEB0();
}

uint64_t OUTLINED_FUNCTION_124()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_125(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t OUTLINED_FUNCTION_126()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_127()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_128()
{
  return swift_bridgeObjectRetain();
}

void SiriAutoCompleteFeatureFlags.domain.getter()
{
}

void SiriAutoCompleteFeatureFlags.feature.getter()
{
}

BOOL static SiriAutoCompleteFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SiriAutoCompleteFeatureFlags.hash(into:)()
{
  return sub_25C61F060();
}

uint64_t SiriAutoCompleteFeatureFlags.hashValue.getter()
{
  return sub_25C61F080();
}

const char *sub_25C61DE94()
{
  return "TypeToSiriAutoComplete";
}

void sub_25C61DEA8()
{
}

void SiriUIFeatureFlags.domain.getter()
{
}

void SiriUIFeatureFlags.feature.getter()
{
}

uint64_t static SiriUIFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriUIFeatureFlags.hash(into:)()
{
  return sub_25C61F060();
}

uint64_t SiriUIFeatureFlags.hashValue.getter()
{
  return sub_25C61F080();
}

uint64_t sub_25C61DF58()
{
  return SiriUIFeatureFlags.hashValue.getter();
}

uint64_t sub_25C61DF70()
{
  return SiriUIFeatureFlags.hash(into:)();
}

const char *sub_25C61DF88()
{
  return "SiriUI";
}

const char *sub_25C61DF9C()
{
  return "sae";
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()()
{
  return sub_25C61E0CC(0);
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isSAEUIEnabled()()
{
  if (objc_msgSend(self, sel_isSAEEnabled))
  {
    uint64_t v3 = &type metadata for SiriUIFeatureFlags;
    unint64_t v4 = sub_25C61E02C();
    char v0 = sub_25C61E780();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    char v0 = 0;
  }
  return v0 & 1;
}

unint64_t sub_25C61E02C()
{
  unint64_t result = qword_26A5BB798;
  if (!qword_26A5BB798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB798);
  }
  return result;
}

unint64_t sub_25C61E078()
{
  unint64_t result = qword_26B351958;
  if (!qword_26B351958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351958);
  }
  return result;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()()
{
  return sub_25C61E0CC(2);
}

uint64_t sub_25C61E0CC(char a1)
{
  if (objc_msgSend(self, sel_isSAEEnabled)
    && (os_log_type_t v6 = &type metadata for SiriUIFeatureFlags,
        unint64_t v7 = sub_25C61E02C(),
        char v2 = sub_25C61E780(),
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v5),
        (v2 & 1) != 0))
  {
    os_log_type_t v6 = &type metadata for SiriAutoCompleteFeatureFlags;
    unint64_t v7 = sub_25C61E078();
    v5[0] = a1;
    char v3 = sub_25C61E780();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()()
{
  if (objc_msgSend(self, sel_isSAEEnabled)
    && (os_log_type_t v6 = &type metadata for SiriUIFeatureFlags,
        unint64_t v7 = sub_25C61E02C(),
        char v0 = sub_25C61E780(),
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v5),
        (v0 & 1) != 0))
  {
    os_log_type_t v6 = &type metadata for SiriAutoCompleteFeatureFlags;
    unint64_t v1 = sub_25C61E078();
    unint64_t v7 = v1;
    v5[0] = 0;
    char v2 = sub_25C61E780();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    char v3 = 0;
    if (v2)
    {
      os_log_type_t v6 = &type metadata for SiriAutoCompleteFeatureFlags;
      unint64_t v7 = v1;
      v5[0] = 4;
      char v3 = sub_25C61E780();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    }
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

unint64_t sub_25C61E250()
{
  unint64_t result = qword_26A5BB7A0;
  if (!qword_26A5BB7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB7A0);
  }
  return result;
}

unint64_t sub_25C61E2A0()
{
  unint64_t result = qword_26A5BB7A8;
  if (!qword_26A5BB7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5BB7A8);
  }
  return result;
}

BOOL sub_25C61E2EC()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()();
}

BOOL sub_25C61E308()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()();
}

BOOL sub_25C61E324()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for SiriAutoCompleteFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriAutoCompleteFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25C61E4D0);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void type metadata accessor for SiriAutoCompleteFeatureFlags()
{
}

unsigned char *storeEnumTagSinglePayload for SiriUIFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C61E5A0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for SiriUIFeatureFlags()
{
}

void type metadata accessor for DefaultSiriAutoCompleteFeatureFlagsProvider()
{
}

uint64_t sub_25C61E5E0()
{
  return MEMORY[0x270EEE158]();
}

uint64_t sub_25C61E5F0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25C61E600()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25C61E610()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25C61E620()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25C61E630()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25C61E640()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_25C61E650()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25C61E660()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25C61E670()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25C61E680()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C61E690()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25C61E6A0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25C61E6B0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25C61E6C0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25C61E6D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25C61E6E0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25C61E6F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C61E700()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25C61E710()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25C61E720()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25C61E730()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C61E740()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C61E750()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25C61E760()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C61E770()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C61E780()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25C61E790()
{
  return MEMORY[0x270F83A30]();
}

uint64_t sub_25C61E7A0()
{
  return MEMORY[0x270F83A40]();
}

uint64_t sub_25C61E7B0()
{
  return MEMORY[0x270F83A58]();
}

uint64_t sub_25C61E7C0()
{
  return MEMORY[0x270F83A60]();
}

uint64_t sub_25C61E7D0()
{
  return MEMORY[0x270F83A70]();
}

uint64_t sub_25C61E7E0()
{
  return MEMORY[0x270F83AA8]();
}

uint64_t sub_25C61E7F0()
{
  return MEMORY[0x270F83AB8]();
}

uint64_t sub_25C61E800()
{
  return MEMORY[0x270F83AC8]();
}

uint64_t sub_25C61E810()
{
  return MEMORY[0x270F83AD0]();
}

uint64_t sub_25C61E820()
{
  return MEMORY[0x270F83AE0]();
}

uint64_t sub_25C61E830()
{
  return MEMORY[0x270F83B20]();
}

uint64_t sub_25C61E840()
{
  return MEMORY[0x270F83B28]();
}

uint64_t sub_25C61E850()
{
  return MEMORY[0x270F83B30]();
}

uint64_t sub_25C61E860()
{
  return MEMORY[0x270F83B38]();
}

uint64_t sub_25C61E870()
{
  return MEMORY[0x270F83B78]();
}

uint64_t sub_25C61E880()
{
  return MEMORY[0x270F83B80]();
}

uint64_t sub_25C61E890()
{
  return MEMORY[0x270F83B88]();
}

uint64_t sub_25C61E8A0()
{
  return MEMORY[0x270F83B98]();
}

uint64_t sub_25C61E8B0()
{
  return MEMORY[0x270F83BB0]();
}

uint64_t sub_25C61E8C0()
{
  return MEMORY[0x270F83BB8]();
}

uint64_t sub_25C61E8D0()
{
  return MEMORY[0x270F83BE0]();
}

uint64_t sub_25C61E8E0()
{
  return MEMORY[0x270F83BE8]();
}

uint64_t sub_25C61E8F0()
{
  return MEMORY[0x270F83BF8]();
}

uint64_t sub_25C61E900()
{
  return MEMORY[0x270F83C08]();
}

uint64_t sub_25C61E910()
{
  return MEMORY[0x270F71B38]();
}

uint64_t sub_25C61E920()
{
  return MEMORY[0x270F71B40]();
}

uint64_t sub_25C61E930()
{
  return MEMORY[0x270F71C18]();
}

uint64_t sub_25C61E940()
{
  return MEMORY[0x270F71C20]();
}

uint64_t sub_25C61E950()
{
  return MEMORY[0x270F71C28]();
}

uint64_t sub_25C61E960()
{
  return MEMORY[0x270F71C98]();
}

uint64_t sub_25C61E970()
{
  return MEMORY[0x270F71CA0]();
}

uint64_t sub_25C61E980()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25C61E990()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25C61E9A0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25C61E9B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C61E9C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C61E9D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C61E9E0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C61E9F0()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_25C61EA00()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25C61EA10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C61EA20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C61EA30()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25C61EA40()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25C61EA50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C61EA60()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25C61EA70()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25C61EA80()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_25C61EA90()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C61EAA0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25C61EAB0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C61EAC0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25C61EAD0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25C61EAE0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25C61EAF0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25C61EB00()
{
  return MEMORY[0x270F9DAC0]();
}

uint64_t sub_25C61EB10()
{
  return MEMORY[0x270F9DB40]();
}

uint64_t sub_25C61EB20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C61EB30()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25C61EB40()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C61EB50()
{
  return MEMORY[0x270F83C10]();
}

uint64_t sub_25C61EB60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C61EB70()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C61EB80()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C61EB90()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C61EBA0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25C61EBB0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25C61EBC0()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_25C61EBD0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C61EBE0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C61EBF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C61EC00()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C61EC10()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C61EC20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C61EC30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C61EC40()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25C61EC50()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25C61EC60()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_25C61EC70()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25C61EC80()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_25C61EC90()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_25C61ECA0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C61ECB0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_25C61ECC0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25C61ECD0()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_25C61ECE0()
{
  return MEMORY[0x270F9E828]();
}

uint64_t sub_25C61ECF0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_25C61ED00()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_25C61ED10()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_25C61ED20()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25C61ED30()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25C61ED40()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_25C61ED50()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25C61ED60()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_25C61ED70()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_25C61ED80()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C61ED90()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C61EDA0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25C61EDB0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25C61EDC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C61EDD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C61EDE0()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25C61EDF0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C61EE00()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25C61EE10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C61EE20()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C61EE30()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C61EE40()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25C61EE50()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C61EE60()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C61EE70()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C61EE80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C61EE90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C61EEA0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25C61EEB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C61EEC0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C61EED0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25C61EEE0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25C61EEF0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25C61EF00()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25C61EF10()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25C61EF20()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C61EF30()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25C61EF40()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25C61EF50()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25C61EF70()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25C61EF80()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C61EF90()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25C61EFA0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C61EFB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C61EFC0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25C61EFD0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C61EFE0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C61EFF0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25C61F000()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C61F010()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C61F020()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C61F030()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C61F040()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25C61F050()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C61F060()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C61F070()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25C61F080()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C61F090()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C61F0A0()
{
  return MEMORY[0x270F9FD98]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}