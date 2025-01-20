id NWRELocalizationBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_268694190 != -1) {
    dispatch_once(&qword_268694190, &unk_26E28BBF0);
  }
  v0 = (void *)qword_268694188;

  return v0;
}

uint64_t sub_22F104084()
{
  qword_268694188 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id NWRELocalizedString(void *a1)
{
  id v1 = a1;
  v2 = NWRELocalizationBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_26E28BFA0 table:0];

  return v3;
}

uint64_t NWRESampleRelevanceProvider()
{
  return MEMORY[0x270F59AC0](2);
}

uint64_t sub_22F104158()
{
  sub_22F1041D8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);

  return MEMORY[0x270FA0228](v0, 120, 7);
}

uint64_t type metadata accessor for DataSourceModel()
{
  return self;
}

uint64_t sub_22F1041D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_22F104298(a3, a4, a5, a6);
  }
  return result;
}

uint64_t sub_22F104298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

__n128 sub_22F1042FC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22F10430C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22F10432C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D()
{
  if (!qword_2686940D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2686940D0);
    }
  }
}

id sub_22F1043AC()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.38, 0.79, 0.97, 1.0);
  qword_2686940D8 = (uint64_t)result;
  return result;
}

uint64_t sub_22F1043FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8 = (void *)sub_22F10BEB0();
  v9 = (void *)sub_22F10BEB0();
  id v10 = NWRELocalizedString(v8);

  sub_22F10BEC0();
  sub_22F104BB8(&qword_2686940E0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22F10CC40;
  uint64_t v12 = MEMORY[0x263F8D310];
  *(void *)(v11 + 56) = MEMORY[0x263F8D310];
  unint64_t v13 = sub_22F104BFC();
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  *(void *)(v11 + 96) = v12;
  *(void *)(v11 + 104) = v13;
  *(void *)(v11 + 64) = v13;
  *(void *)(v11 + 72) = a3;
  *(void *)(v11 + 80) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_22F10BED0();
  swift_bridgeObjectRelease();
  return v14;
}

id sub_22F10453C(uint64_t a1)
{
  v2 = (void *)sub_22F10BEB0();
  id v3 = (id)NWCGlyphPrefixedTextProvider();

  v4 = (void *)sub_22F10BEB0();
  v5 = (void *)sub_22F10BEB0();
  id v6 = NWRELocalizedString(v4);

  sub_22F10BEC0();
  v7 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  v8 = self;
  id v9 = objc_msgSend(v8, sel_textProviderWithText_, v7);

  swift_bridgeObjectRetain();
  id v10 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_textProviderWithText_, v10);

  id v12 = *(id *)(a1 + 72);
  swift_bridgeObjectRetain();
  unint64_t v13 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v8, sel_textProviderWithText_, v13);

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D30]), sel_init);
  objc_msgSend(v15, sel_setBackgroundColor_, v12);
  objc_msgSend(v15, sel_setTextProvider_, v14);

  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D40]), sel_init);
  objc_msgSend(v16, sel_setHeaderTextProvider_, v3);
  objc_msgSend(v16, sel_setDescriptionAccessory_, v15);
  objc_msgSend(v16, sel_setDescription1TextProvider_, v9);
  objc_msgSend(v16, sel_setDescription2TextProvider_, v11);
  objc_msgSend(v16, sel_setStyle_, 0);
  if (qword_2686940B8 != -1) {
    swift_once();
  }
  objc_msgSend(v16, sel_setTintColor_, qword_2686940D8);

  return v16;
}

id sub_22F10480C(void *a1)
{
  id v27 = sub_22F10A268();
  v2 = (void *)sub_22F10BEB0();
  id v26 = (id)NWCGlyphPrefixedTextProvider();

  swift_bridgeObjectRetain();
  id v3 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  v4 = self;
  id v25 = objc_msgSend(v4, sel_textProviderWithText_, v3);

  v5 = (void *)sub_22F10BEB0();
  id v6 = (void *)sub_22F10BEB0();
  id v7 = NWRELocalizedString(v5);

  sub_22F10BEC0();
  sub_22F104BB8(&qword_2686940E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22F10CC50;
  uint64_t v10 = a1[9];
  uint64_t v9 = a1[10];
  uint64_t v11 = MEMORY[0x263F8D310];
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  unint64_t v12 = sub_22F104BFC();
  *(void *)(v8 + 64) = v12;
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_22F10BED0();
  swift_bridgeObjectRelease();
  unint64_t v13 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v4, sel_textProviderWithText_, v13);

  id v15 = (void *)sub_22F10BEB0();
  id v16 = (void *)sub_22F10BEB0();
  id v17 = NWRELocalizedString(v15);

  sub_22F10BEC0();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_22F10CC50;
  uint64_t v20 = a1[11];
  uint64_t v19 = a1[12];
  *(void *)(v18 + 56) = v11;
  *(void *)(v18 + 64) = v12;
  *(void *)(v18 + 32) = v20;
  *(void *)(v18 + 40) = v19;
  swift_bridgeObjectRetain();
  sub_22F10BED0();
  swift_bridgeObjectRelease();
  v21 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v4, sel_textProviderWithText_, v21);

  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D40]), sel_init);
  objc_msgSend(v23, sel_setHeaderTextProvider_, v26);
  objc_msgSend(v23, sel_setDescription1TextProvider_, v25);
  objc_msgSend(v23, sel_setOverrideBodyImage_, v27);
  objc_msgSend(v23, sel_setDescription2TextProvider_, v14);
  objc_msgSend(v23, sel_setDescription3TextProvider_, v22);
  objc_msgSend(v23, sel_setStyle_, 4);
  objc_msgSend(v23, sel_setTintColor_, 0);

  return v23;
}

uint64_t sub_22F104BB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_22F104BFC()
{
  unint64_t result = qword_2686940E8;
  if (!qword_2686940E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686940E8);
  }
  return result;
}

id sub_22F104C50(uint64_t a1)
{
  uint64_t v2 = sub_22F10BE10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22F10BDA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = sub_22F10AB78();
  uint64_t v11 = (void *)sub_22F10BEB0();
  id v12 = (id)NWCGlyphPrefixedTextProvider();

  uint64_t v13 = type metadata accessor for InterestingHourWeather();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v13 + 32), v6);
  uint64_t v14 = sub_22F10BD60();
  id v15 = objc_msgSend(self, sel_textProviderWithDate_, v14);

  objc_msgSend(v15, sel_setPrefersDesignatorToMinutes_, 1);
  objc_msgSend(v15, sel_setDisallowBothMinutesAndDesignator_, 1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D40]), sel_init);
  objc_msgSend(v16, sel_setHeaderTextProvider_, v12);
  sub_22F10BDD0();
  LOBYTE(v14) = sub_22F108EE4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v14)
  {
    objc_msgSend(v16, sel_setOverrideHeaderImage_, v10);
    objc_msgSend(v16, sel_setHeaderImageEdge_, 2);
  }
  else
  {
    objc_msgSend(v16, sel_setOverrideBodyImage_, v10);
  }
  objc_msgSend(v16, sel_setDescription1TextProvider_, v15);
  objc_msgSend(v16, sel_setStyle_, 1);
  objc_msgSend(v16, sel_setTintColor_, 0);

  return v16;
}

id sub_22F104F40(uint64_t *a1)
{
  id v2 = sub_22F10BC14();
  uint64_t v3 = (void *)sub_22F10BEB0();
  id v4 = (id)NWCGlyphPrefixedTextProvider();

  sub_22F1043FC(a1[7], a1[8], a1[9], a1[10]);
  v5 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_textProviderWithText_, v5);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D40]), sel_init);
  objc_msgSend(v7, sel_setHeaderTextProvider_, v4);
  objc_msgSend(v7, sel_setOverrideHeaderImage_, v2);
  objc_msgSend(v7, sel_setHeaderImageEdge_, 2);
  objc_msgSend(v7, sel_setDescription1TextProvider_, v6);
  objc_msgSend(v7, sel_setStyle_, 1);
  objc_msgSend(v7, sel_setTintColor_, 0);

  return v7;
}

uint64_t sub_22F105088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v35 = sub_22F10BE30();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  v34 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22F10BE40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22F10BE20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  MEMORY[0x270FA5388]();
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22F10BDA0();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22F10BE70();
  uint64_t v30 = *(void *)(v14 - 8);
  uint64_t v31 = v14;
  MEMORY[0x270FA5388]();
  id v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F104BB8(&qword_268694100);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F10BE60();
  sub_22F10BD90();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F07780], v7);
  uint64_t v19 = v4;
  uint64_t v20 = v3;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07800], v3);
  v21 = v34;
  uint64_t v22 = v35;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v34, *MEMORY[0x263F077E0], v35);
  sub_22F10BE50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v21, v22);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v28);
  uint64_t v23 = v32;
  v24 = v13;
  uint64_t v25 = v33;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v33);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v18, 1, v25) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v36, v18, v25);
  }
  sub_22F10BD90();
  return sub_22F105EF8((uint64_t)v18);
}

id sub_22F105520()
{
  sub_22F10BEC0();
  v0 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();

  return v0;
}

id sub_22F10570C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SampleDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SampleDataSource()
{
  return self;
}

void sub_22F105764(uint64_t a1, unint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v58 = a4;
  *(void *)&long long v57 = a1;
  uint64_t v54 = type metadata accessor for InterestingHourWeather();
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_22F10BDA0();
  uint64_t v8 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388]();
  id v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22F10BEA0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2686940C0 != -1) {
    swift_once();
  }
  v55 = v10;
  uint64_t v15 = sub_22F105E24(v11, (uint64_t)qword_268694198);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_bridgeObjectRetain_n();
  id v16 = sub_22F10BE80();
  os_log_type_t v17 = sub_22F10BF80();
  BOOL v18 = os_log_type_enabled(v16, v17);
  v59 = a3;
  if (v18)
  {
    v56 = v7;
    uint64_t v53 = v8;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v62 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    if (!a2)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v22 = v57;
    uint64_t v61 = sub_22F109608(v57, a2, &v62);
    sub_22F10BFA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22F102000, v16, v17, "Collecting elements for %s.", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FB19E0](v21, -1, -1);
    MEMORY[0x230FB19E0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v23 = sub_22F10BEC0();
    uint64_t v25 = v24;
    uint64_t v8 = v53;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v26 = sub_22F10BEC0();
    uint64_t v25 = v27;
    if (!a2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    uint64_t v23 = v26;
    v56 = v7;
    uint64_t v22 = v57;
  }
  uint64_t v28 = v60;
  if (v23 == v22 && v25 == a2)
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = v56;
LABEL_12:
    uint64_t v31 = *MEMORY[0x263F00B58];
    uint64_t v32 = *(void *)(MEMORY[0x263F00B58] + 8);
    uint64_t v33 = (void *)sub_22F10BEB0();
    v34 = (void *)sub_22F10BEB0();
    id v35 = NWRELocalizedString(v33);

    uint64_t v36 = sub_22F10BEC0();
    uint64_t v38 = v37;

    uint64_t v39 = (uint64_t)v55;
    sub_22F105088((uint64_t)v55);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(&v29[*(int *)(v54 + 32)], v39, v28);
    *(void *)uint64_t v29 = v31;
    *((void *)v29 + 1) = v32;
    *((void *)v29 + 2) = v36;
    *((void *)v29 + 3) = v38;
    v29[32] = 0;
    strcpy(v29 + 40, "cloud.sun.fill");
    v29[55] = -18;
    id v40 = sub_22F104C50((uint64_t)v29);
    id v41 = (id)NWRESampleRelevanceProvider();
    sub_22F104BB8(&qword_2686940F0);
    uint64_t v42 = swift_allocObject();
    long long v57 = xmmword_22F10CC60;
    *(_OWORD *)(v42 + 16) = xmmword_22F10CC60;
    *(void *)(v42 + 32) = v41;
    uint64_t v62 = v42;
    sub_22F10BF40();
    id v43 = objc_allocWithZone(MEMORY[0x263F62D60]);
    uint64_t v44 = v8;
    id v45 = v40;
    v56 = (char *)v41;
    v46 = (void *)sub_22F10BEB0();
    sub_22F105E5C();
    v47 = (void *)sub_22F10BF30();
    swift_bridgeObjectRelease();
    id v48 = objc_msgSend(v43, sel_initWithIdentifier_content_action_relevanceProviders_privacyBehavior_, v46, v45, 0, v47, 0);

    v49 = v59;
    if (v59)
    {
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v57;
      *(void *)(v50 + 32) = v48;
      uint64_t v62 = v50;
      sub_22F10BF40();
      uint64_t v51 = v62;
      id v52 = v48;
      v49(v51);

      swift_bridgeObjectRelease();
      sub_22F105E9C((uint64_t)v29);
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v39, v60);
      return;
    }
    __break(1u);
    goto LABEL_18;
  }
  char v30 = sub_22F10C030();
  swift_bridgeObjectRelease();
  uint64_t v29 = v56;
  if (v30) {
    goto LABEL_12;
  }
LABEL_15:
  if (v59)
  {
    v59(0);
    return;
  }
LABEL_19:
  __break(1u);
}

uint64_t sub_22F105DD4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22F105DE4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22F105E1C(uint64_t a1)
{
  sub_22F106040(a1, *(void *)(v1 + 16));
}

uint64_t sub_22F105E24(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_22F105E5C()
{
  unint64_t result = qword_2686940F8;
  if (!qword_2686940F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686940F8);
  }
  return result;
}

uint64_t sub_22F105E9C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InterestingHourWeather();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F105EF8(uint64_t a1)
{
  uint64_t v2 = sub_22F104BB8(&qword_268694100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F105F58()
{
  uint64_t v0 = sub_22F10BEA0();
  sub_22F105FDC(v0, qword_268694198);
  sub_22F105E24(v0, (uint64_t)qword_268694198);
  return sub_22F10BE90();
}

uint64_t *sub_22F105FDC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_22F106040(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    sub_22F108EA8(0, &qword_268694140);
    uint64_t v3 = sub_22F10BF30();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_22F1060C8()
{
  uint64_t v1 = OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___model;
  if (*(void *)(v0 + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___model))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___model);
  }
  else
  {
    type metadata accessor for DataSourceModel();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = 1;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(void *)(v0 + v1) = v2;
    swift_retain();
  }
  swift_retain();
  return v2;
}

id sub_22F106150()
{
  uint64_t v1 = OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___dateFormatter;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___dateFormatter);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___dateFormatter);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    objc_msgSend(v4, sel_setDateStyle_, 0);
    objc_msgSend(v4, sel_setTimeStyle_, 1);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_22F1061EC()
{
  uint64_t v1 = OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___morningRoutineRelevanceProvider;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___morningRoutineRelevanceProvider);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___morningRoutineRelevanceProvider);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62D48]), sel_initWithDailyRoutineType_, 0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_22F106264()
{
  uint64_t v56 = sub_22F10BDA0();
  uint64_t v52 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v60 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_22F104BB8(&qword_268694130);
  MEMORY[0x270FA5388](v2 - 8);
  v63 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ConditionsObservation();
  uint64_t v51 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = v0;
  uint64_t v7 = (void *)sub_22F1060C8();
  uint64_t v8 = v7[3];
  id v10 = (__CFString *)v7[5];
  uint64_t v11 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v7[6];
  uint64_t v12 = v7[7];
  uint64_t v13 = (void (**)(char *, uint64_t))v7[8];
  uint64_t v14 = v7[9];
  uint64_t v9 = v7[2];
  id v64 = (id)v7[4];
  uint64_t v65 = v8;
  uint64_t v62 = v10;
  uint64_t v58 = v11;
  *(void *)&long long v57 = v12;
  uint64_t v53 = v14;
  uint64_t v54 = v13;
  sub_22F108ABC(v9, v8, (uint64_t)v64, (uint64_t)v10, (uint64_t)v11, v12);
  swift_release();
  uint64_t result = 0;
  if (v9 != 1)
  {
    v55 = v6;
    uint64_t v59 = v4;
    uint64_t v16 = swift_bridgeObjectRetain();
    sub_22F1041D8(v16, v65, (uint64_t)v64, (uint64_t)v62, (uint64_t)v58, v57);
    if (v9)
    {
      uint64_t v69 = MEMORY[0x263F8EE78];
      uint64_t v17 = *(void *)(v9 + 16);
      if (v17)
      {
        uint64_t v53 = v9;
        uint64_t v18 = v9 + 32;
        uint64_t v58 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56);
        uint64_t v54 = (void (**)(char *, uint64_t))(v52 + 8);
        uint64_t v62 = @"com.apple.weather.watchapp";
        long long v57 = xmmword_22F10CC60;
        uint64_t v20 = v60;
        uint64_t v19 = v61;
        uint64_t v21 = (uint64_t)v63;
        do
        {
          sub_22F108BE4(v18, (uint64_t)v68);
          sub_22F108BE4((uint64_t)v68, (uint64_t)v67);
          sub_22F104BB8(&qword_268694138);
          if (swift_dynamicCast())
          {
            long long v71 = v66[2];
            long long v72 = v66[3];
            long long v73 = v66[4];
            v70[0] = v66[0];
            v70[1] = v66[1];
            *(void *)&v66[0] = sub_22F10BEC0();
            *((void *)&v66[0] + 1) = v22;
            swift_bridgeObjectRetain();
            sub_22F10BF00();
            swift_bridgeObjectRelease();
            id v23 = sub_22F10453C((uint64_t)v70);
            if ((v71 & 1) == 0)
            {
              *(void *)&v66[0] = 0;
              *((void *)&v66[0] + 1) = 0xE000000000000000;
              v67[0] = v70[0];
              type metadata accessor for CLLocationCoordinate2D();
              sub_22F10BFF0();
            }
            uint64_t v65 = v17;
            sub_22F1060C8();
            swift_release();
            swift_bridgeObjectRelease();
            id v34 = objc_allocWithZone(MEMORY[0x263F62D80]);
            LODWORD(v35) = 0.5;
            id v36 = objc_msgSend(v34, sel_initWithPriority_, v35);
            sub_22F104BB8(&qword_2686940F0);
            uint64_t v37 = swift_allocObject();
            *(_OWORD *)(v37 + 16) = v57;
            *(void *)(v37 + 32) = v36;
            *(void *)&v66[0] = v37;
            sub_22F10BF40();
            id v64 = v36;
            if (*(void *)&v66[0] >> 62)
            {
              uint64_t v49 = *(void *)&v66[0] & 0xFFFFFFFFFFFFFF8;
              if (*(uint64_t *)&v66[0] < 0) {
                uint64_t v49 = *(void *)&v66[0];
              }
              uint64_t v52 = v49;
              sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
              id v50 = v36;
              swift_bridgeObjectRetain();
              sub_22F10C010();
              swift_bridgeObjectRelease();
            }
            else
            {
              id v38 = v36;
              swift_bridgeObjectRetain();
              sub_22F10C040();
              sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
            }
            swift_bridgeObjectRelease();
            id v39 = objc_allocWithZone(MEMORY[0x263F62D60]);
            id v40 = v23;
            id v41 = (void *)sub_22F10BEB0();
            swift_bridgeObjectRelease();
            sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
            uint64_t v42 = (void *)sub_22F10BF30();
            swift_bridgeObjectRelease();
            id v43 = objc_msgSend(v39, sel_initWithIdentifier_content_action_relevanceProviders_privacyBehavior_, v41, v40, 0, v42, 1);

            id v44 = v43;
            MEMORY[0x230FB1460]();
            if (*(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_22F10BF50();
            }
            sub_22F10BF60();
            sub_22F10BF40();

            sub_22F108E1C((uint64_t)v70);
            uint64_t v20 = v60;
            uint64_t v19 = v61;
            uint64_t v21 = (uint64_t)v63;
            uint64_t v17 = v65;
          }
          else
          {
            sub_22F108BE4((uint64_t)v68, (uint64_t)v66);
            uint64_t v24 = v59;
            int v25 = swift_dynamicCast();
            uint64_t v26 = *v58;
            if (v25)
            {
              v26(v21, 0, 1, v24);
              uint64_t v27 = (uint64_t)v55;
              sub_22F108D08(v21, (uint64_t)v55);
              id v28 = sub_22F106150();
              sub_22F10BD40();
              uint64_t v29 = (void *)sub_22F10BD60();
              (*v54)(v20, v56);
              id v30 = objc_msgSend(v28, sel_stringFromDate_, v29);

              sub_22F10BEC0();
              *(void *)&v66[0] = sub_22F10BEC0();
              *((void *)&v66[0] + 1) = v31;
              swift_bridgeObjectRetain();
              sub_22F10BF00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              sub_22F10BF00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_22F106B2C(v19, v27);
              id v32 = sub_22F108840(v27);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v33 = v32;
              MEMORY[0x230FB1460]();
              if (*(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_22F10BF50();
              }
              sub_22F10BF60();
              sub_22F10BF40();

              sub_22F108D6C(v27, (uint64_t (*)(void))type metadata accessor for ConditionsObservation);
              uint64_t v21 = (uint64_t)v63;
            }
            else
            {
              v26(v21, 1, 1, v24);
              sub_22F108C48(v21, &qword_268694130);
              if (qword_2686940C0 != -1) {
                swift_once();
              }
              uint64_t v45 = sub_22F10BEA0();
              sub_22F105E24(v45, (uint64_t)qword_268694198);
              v46 = sub_22F10BE80();
              os_log_type_t v47 = sub_22F10BF90();
              if (os_log_type_enabled(v46, v47))
              {
                id v48 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)id v48 = 0;
                _os_log_impl(&dword_22F102000, v46, v47, "Unknown model; skipping.", v48, 2u);
                MEMORY[0x230FB19E0](v48, -1, -1);
              }
            }
          }
          sub_22F108DCC((uint64_t)v68);
          v18 += 40;
          --v17;
        }
        while (v17);
        swift_bridgeObjectRelease();
        return v69;
      }
      else
      {
        swift_bridgeObjectRelease();
        return MEMORY[0x263F8EE78];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22F106B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  uint64_t v2 = sub_22F10BDA0();
  uint64_t v31 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v30 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_22F10BD50();
  uint64_t v34 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = self;
  id v17 = sub_22F1061EC();
  id v33 = objc_msgSend(v16, sel_dependentProviderWithProvider_invertsRelevance_, v17, 1);

  uint64_t v18 = type metadata accessor for ConditionsObservation();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v32 + *(int *)(v18 + 44), v12);
  sub_22F10BD20();
  sub_22F10BD40();
  sub_22F10BD70();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v6, v2);
  id v20 = objc_allocWithZone(MEMORY[0x263F62D50]);
  uint64_t v21 = (void *)sub_22F10BD10();
  uint64_t v22 = (void *)sub_22F10BD60();
  id v23 = (void *)sub_22F10BD60();
  id v24 = objc_msgSend(v20, sel_initWithEventInterval_becomesIrrelevantDate_firstBecomesRelevantDate_recentDuration_, v21, v22, v23, 0.0);

  sub_22F104BB8(&qword_2686940F0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_22F10CCB0;
  *(void *)(v25 + 32) = v33;
  *(void *)(v25 + 40) = v24;
  uint64_t v35 = v25;
  sub_22F10BF40();
  uint64_t v26 = v35;
  uint64_t v27 = v9;
  uint64_t v28 = v31;
  v19(v27, v31);
  v19(v11, v28);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v34);
  return v26;
}

uint64_t sub_22F106E40()
{
  uint64_t v71 = type metadata accessor for InterestingHourWeather();
  uint64_t v60 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v73 = (uint64_t)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_22F10BDA0();
  uint64_t v63 = *(void *)(v74 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v74);
  long long v72 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v61 = (char *)&v60 - v4;
  uint64_t v5 = sub_22F104BB8(&qword_268694130);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ConditionsObservation();
  uint64_t v64 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v62 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = v0;
  uint64_t v10 = (void *)sub_22F1060C8();
  uint64_t v11 = v10[3];
  uint64_t v13 = (__CFString *)v10[5];
  uint64_t v15 = v10[6];
  uint64_t v14 = (void (**)(char *, uint64_t))v10[7];
  uint64_t v16 = v10[8];
  uint64_t v17 = v10[9];
  uint64_t v12 = v10[2];
  uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))v10[4];
  uint64_t v70 = v11;
  v67 = v14;
  v68 = v13;
  *(void *)&long long v66 = v16;
  uint64_t v65 = v17;
  sub_22F108ABC(v12, v11, (uint64_t)v69, (uint64_t)v13, v15, (uint64_t)v14);
  swift_release();
  uint64_t result = 0;
  if (v12 != 1)
  {
    uint64_t v19 = swift_bridgeObjectRetain();
    sub_22F1041D8(v19, v70, (uint64_t)v69, (uint64_t)v68, v15, (uint64_t)v67);
    if (v12)
    {
      uint64_t v79 = MEMORY[0x263F8EE78];
      uint64_t v20 = *(void *)(v12 + 16);
      if (v20)
      {
        uint64_t v21 = v12 + 32;
        uint64_t v22 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56);
        while (1)
        {
          sub_22F108BE4(v21, (uint64_t)&v77);
          sub_22F104BB8(&qword_268694138);
          int v23 = swift_dynamicCast();
          id v24 = *v22;
          if (v23) {
            break;
          }
          v24(v7, 1, 1, v8);
          sub_22F108C48((uint64_t)v7, &qword_268694130);
          v21 += 40;
          if (!--v20) {
            goto LABEL_7;
          }
        }
        v24(v7, 0, 1, v8);
        swift_bridgeObjectRelease();
        uint64_t v25 = v62;
        sub_22F108D08((uint64_t)v7, v62);
        uint64_t v26 = v75;
        id v27 = sub_22F106150();
        uint64_t v28 = v61;
        sub_22F10BD40();
        uint64_t v29 = (void *)sub_22F10BD60();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v28, v74);
        id v30 = objc_msgSend(v27, sel_stringFromDate_, v29);

        sub_22F10BEC0();
        uint64_t v77 = sub_22F10BEC0();
        unint64_t v78 = v31;
        swift_bridgeObjectRetain();
        sub_22F10BF00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_22F10BF00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22F1077F8(v26, v25);
        id v32 = sub_22F108840(v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v33 = v32;
        MEMORY[0x230FB1460]();
        if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_22F10BF50();
        }
        sub_22F10BF60();
        sub_22F10BF40();

        sub_22F108D6C(v25, (uint64_t (*)(void))type metadata accessor for ConditionsObservation);
      }
      else
      {
LABEL_7:
        swift_bridgeObjectRelease();
      }
      uint64_t v34 = (void *)sub_22F1060C8();
      uint64_t v36 = v34[3];
      uint64_t v37 = v34[4];
      id v38 = (__CFString *)v34[6];
      id v39 = (void (**)(char *, uint64_t))v34[7];
      uint64_t v35 = v34[2];
      uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))v34[5];
      uint64_t v70 = v37;
      v67 = v39;
      v68 = v38;
      sub_22F108ABC(v35, v36, v37, (uint64_t)v69, (uint64_t)v38, (uint64_t)v39);
      swift_release();
      if (v35 != 1)
      {
        swift_bridgeObjectRetain();
        sub_22F1041D8(v35, v36, v70, (uint64_t)v69, (uint64_t)v68, (uint64_t)v67);
        if (v36)
        {
          uint64_t v65 = v36;
          uint64_t v40 = *(void *)(v36 + 16);
          uint64_t v42 = v73;
          uint64_t v41 = v74;
          id v43 = v72;
          if (v40)
          {
            uint64_t v44 = v65 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
            uint64_t v70 = *(void *)(v60 + 72);
            uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))(v63 + 16);
            v67 = (void (**)(char *, uint64_t))(v63 + 8);
            v68 = @"com.apple.weather.watchapp";
            long long v66 = xmmword_22F10CC60;
            do
            {
              sub_22F108CA4(v44, v42);
              (*v69)(v43, v42 + *(int *)(v71 + 32), v41);
              id v45 = sub_22F106150();
              v46 = (void *)sub_22F10BD60();
              id v47 = objc_msgSend(v45, sel_stringFromDate_, v46);

              sub_22F10BEC0();
              uint64_t v77 = sub_22F10BEC0();
              unint64_t v78 = v48;
              swift_bridgeObjectRetain();
              sub_22F10BF00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              sub_22F10BF00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v49 = sub_22F104C50(v42);
              if ((*(unsigned char *)(v42 + 32) & 1) == 0)
              {
                uint64_t v77 = 0;
                unint64_t v78 = 0xE000000000000000;
                long long v76 = *(_OWORD *)v42;
                type metadata accessor for CLLocationCoordinate2D();
                sub_22F10BFF0();
              }
              sub_22F1060C8();
              swift_release();
              swift_bridgeObjectRelease();
              id v50 = objc_allocWithZone(MEMORY[0x263F62D50]);
              id v43 = v72;
              uint64_t v51 = (void *)sub_22F10BD60();
              id v52 = objc_msgSend(v50, sel_initWithEventDate_, v51);

              sub_22F104BB8(&qword_2686940F0);
              uint64_t v53 = swift_allocObject();
              *(_OWORD *)(v53 + 16) = v66;
              *(void *)(v53 + 32) = v52;
              uint64_t v77 = v53;
              sub_22F10BF40();
              id v54 = objc_allocWithZone(MEMORY[0x263F62D60]);
              id v55 = v49;
              uint64_t v56 = (void *)sub_22F10BEB0();
              swift_bridgeObjectRelease();
              sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
              long long v57 = (void *)sub_22F10BF30();
              swift_bridgeObjectRelease();
              id v58 = objc_msgSend(v54, sel_initWithIdentifier_content_action_relevanceProviders_privacyBehavior_, v56, v55, 0, v57, 1);

              id v59 = v58;
              MEMORY[0x230FB1460]();
              if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_22F10BF50();
              }
              sub_22F10BF60();
              sub_22F10BF40();

              uint64_t v41 = v74;
              (*v67)(v43, v74);
              uint64_t v42 = v73;
              sub_22F108D6C(v73, (uint64_t (*)(void))type metadata accessor for InterestingHourWeather);
              v44 += v70;
              --v40;
            }
            while (v40);
          }
          swift_bridgeObjectRelease();
        }
      }
      return v79;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22F1077F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_22F10BDA0();
  uint64_t v29 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v29 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = sub_22F10BD50();
  uint64_t v31 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = sub_22F1061EC();
  uint64_t v17 = type metadata accessor for ConditionsObservation();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2 + *(int *)(v17 + 44), v13);
  sub_22F10BD20();
  sub_22F10BD40();
  sub_22F10BD70();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v7, v3);
  id v19 = objc_allocWithZone(MEMORY[0x263F62D50]);
  uint64_t v20 = (void *)sub_22F10BD10();
  uint64_t v21 = (void *)sub_22F10BD60();
  uint64_t v22 = (void *)sub_22F10BD60();
  id v23 = objc_msgSend(v19, sel_initWithEventInterval_becomesIrrelevantDate_firstBecomesRelevantDate_recentDuration_, v20, v21, v22, 0.0);

  sub_22F104BB8(&qword_2686940F0);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22F10CCB0;
  *(void *)(v24 + 32) = v30;
  *(void *)(v24 + 40) = v23;
  uint64_t v32 = v24;
  sub_22F10BF40();
  uint64_t v25 = v32;
  uint64_t v26 = v10;
  uint64_t v27 = v29;
  v18(v26, v29);
  v18(v12, v27);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v31);
  return v25;
}

uint64_t sub_22F107AD0()
{
  uint64_t v0 = (void *)sub_22F1060C8();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v22 = v0[14];
  uint64_t v23 = v0[10];
  uint64_t v24 = v0[11];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v20 = v0[9];
  uint64_t v21 = v0[8];
  sub_22F108ABC(v2, v1, v6, v7, v8, v3);
  swift_release();
  if (v2 == 1) {
    return 0;
  }
  sub_22F108B80(v6, v7, v8, v3);
  uint64_t v17 = v4;
  uint64_t v19 = v4;
  sub_22F1041D8(v2, v1, v6, v7, v8, v3);
  if (!v3) {
    return 0;
  }
  v26[0] = v6;
  v26[1] = v7;
  v26[2] = v8;
  v26[3] = v3;
  char v27 = v21 & 1;
  uint64_t v28 = v20;
  uint64_t v29 = v23;
  uint64_t v30 = v24;
  uint64_t v31 = v5;
  uint64_t v32 = v4;
  uint64_t v33 = v22;
  sub_22F10BEC0();
  swift_bridgeObjectRetain();
  sub_22F10BF00();
  swift_bridgeObjectRelease();
  id v18 = sub_22F104F40(v26);
  if ((v21 & 1) == 0)
  {
    type metadata accessor for CLLocationCoordinate2D();
    sub_22F10BFF0();
  }
  sub_22F104298(v6, v7, v8, v3);
  sub_22F1060C8();
  swift_release();
  swift_bridgeObjectRelease();
  sub_22F107E38();
  id v10 = objc_allocWithZone(MEMORY[0x263F62D60]);
  id v11 = v18;
  uint64_t v12 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
  uint64_t v13 = (void *)sub_22F10BF30();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v10, sel_initWithIdentifier_content_action_relevanceProviders_privacyBehavior_, v12, v11, 0, v13, 1, v5, v19, v22, v17, v22);

  sub_22F104BB8(&qword_2686940F0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_22F10CC60;
  *(void *)(v15 + 32) = v14;
  uint64_t v25 = v15;
  sub_22F10BF40();
  uint64_t v9 = v25;

  return v9;
}

uint64_t sub_22F107E38()
{
  uint64_t v0 = sub_22F10BD50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22F104BB8(&qword_268694100);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v50 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v9 = sub_22F10BDA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v47 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v48 = (char *)&v41 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v41 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v51 = (char *)&v41 - v18;
  sub_22F10BD90();
  uint64_t v19 = (void *)sub_22F10BD60();
  id v49 = *(void (**)(char *, uint64_t))(v10 + 8);
  v49(v17, v9);
  id v20 = (id)REStartOfNextDayForDate();

  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_7;
  }
  uint64_t v45 = v0;
  uint64_t v46 = v10 + 8;
  id v43 = v3;
  uint64_t v44 = v1;
  sub_22F10BD80();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v17, v9);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v22(v8, 0, 1, v9);
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v23(v8, 1, v9) == 1)
  {
LABEL_7:
    uint64_t v39 = (uint64_t)v8;
LABEL_10:
    sub_22F108C48(v39, &qword_268694100);
    return MEMORY[0x263F8EE78];
  }
  uint64_t v41 = v23;
  uint64_t v42 = v22;
  uint64_t v24 = v8;
  uint64_t v25 = v21;
  v21(v51, v24, v9);
  uint64_t v26 = (void *)sub_22F10BD60();
  id v27 = (id)REEndOfDayForDate();

  if (!v27)
  {
    uint64_t v28 = v50;
    v42(v50, 1, 1, v9);
    goto LABEL_9;
  }
  sub_22F10BD80();

  uint64_t v28 = v50;
  v25(v50, v17, v9);
  v42(v28, 0, 1, v9);
  if (v41(v28, 1, v9) == 1)
  {
LABEL_9:
    v49(v51, v9);
    uint64_t v39 = (uint64_t)v28;
    goto LABEL_10;
  }
  uint64_t v29 = v48;
  v25(v48, v28, v9);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v31 = v51;
  v30(v17, v51, v9);
  v30(v47, v29, v9);
  uint64_t v32 = v43;
  sub_22F10BD30();
  id v33 = objc_allocWithZone(MEMORY[0x263F62D50]);
  uint64_t v34 = (void *)sub_22F10BD10();
  id v35 = objc_msgSend(v33, sel_initWithEventInterval_, v34);

  sub_22F104BB8(&qword_2686940F0);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_22F10CC60;
  *(void *)(v36 + 32) = v35;
  uint64_t v52 = v36;
  sub_22F10BF40();
  uint64_t v37 = v52;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v45);
  id v38 = v49;
  v49(v29, v9);
  v38(v31, v9);
  return v37;
}

uint64_t sub_22F108450(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = sub_22F10BEC0();
  if (!a2)
  {
    swift_bridgeObjectRelease();
    sub_22F10BEC0();
    swift_bridgeObjectRelease();
    sub_22F10BEC0();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_19:
    if (a3) {
      return ((uint64_t (*)(void))a3)(0);
    }
    goto LABEL_34;
  }
  if (v6 == a1 && v7 == a2)
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  char v9 = sub_22F10C030();
  uint64_t result = swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_22:
    if (!a3)
    {
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    sub_22F106264();
    goto LABEL_30;
  }
  if (sub_22F10BEC0() == a1 && v11 == a2)
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_22F10C030();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      if (sub_22F10BEC0() == a1 && v14 == a2)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      char v16 = sub_22F10C030();
      uint64_t result = swift_bridgeObjectRelease();
      if (v16)
      {
LABEL_28:
        if (a3)
        {
          sub_22F107AD0();
          goto LABEL_30;
        }
LABEL_36:
        __break(1u);
        return result;
      }
      goto LABEL_19;
    }
  }
  if (!a3)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_22F106E40();
LABEL_30:
  a3();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22F108734(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = qword_2686940C0;
  id v5 = a1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22F10BEA0();
  sub_22F105E24(v6, (uint64_t)qword_268694198);
  uint64_t v7 = sub_22F10BE80();
  os_log_type_t v8 = sub_22F10BF70();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v9 = 0;
    _os_log_impl(&dword_22F102000, v7, v8, a3, v9, 2u);
    MEMORY[0x230FB19E0](v9, -1, -1);
  }

  sub_22F1060C8();

  return swift_release();
}

id sub_22F108840(uint64_t a1)
{
  id v2 = sub_22F10480C((void *)a1);
  if ((*(unsigned char *)(a1 + 32) & 1) == 0)
  {
    type metadata accessor for CLLocationCoordinate2D();
    sub_22F10BFF0();
  }
  sub_22F1060C8();
  swift_release();
  swift_bridgeObjectRelease();
  id v3 = objc_allocWithZone(MEMORY[0x263F62D60]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  sub_22F108EA8(0, (unint64_t *)&qword_2686940F8);
  id v5 = (void *)sub_22F10BF30();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithIdentifier_content_action_relevanceProviders_privacyBehavior_, v4, v2, 0, v5, 1);

  return v6;
}

id sub_22F1089F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSource()
{
  return self;
}

uint64_t sub_22F108ABC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_22F108B80(a3, a4, a5, a6);
  }
  return result;
}

uint64_t sub_22F108B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22F108BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22F108C48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22F104BB8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22F108CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InterestingHourWeather();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F108D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConditionsObservation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F108D6C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22F108DCC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22F108E1C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22F108E70()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F108EA8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22F108EE4()
{
  uint64_t v0 = sub_22F10BDF0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F104BB8(&qword_268694150);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F10BE00();
  sub_22F10BDE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v6 = sub_22F10BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_22F10910C((uint64_t)v5);
    char v8 = 0;
  }
  else
  {
    sub_22F10BDB0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (qword_2686940C8 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_268694148;
    uint64_t v10 = sub_22F10BEE0();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    char v8 = sub_22F10920C(v10, v12, v9);
    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

uint64_t sub_22F10910C(uint64_t a1)
{
  uint64_t v2 = sub_22F104BB8(&qword_268694150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F10916C()
{
  sub_22F104BB8(&qword_268694108);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22F10CCC0;
  *(void *)(inited + 32) = 26746;
  *(void *)(inited + 40) = 0xE200000000000000;
  *(void *)(inited + 48) = 24938;
  *(void *)(inited + 56) = 0xE200000000000000;
  *(void *)(inited + 64) = 28523;
  *(void *)(inited + 72) = 0xE200000000000000;
  uint64_t v1 = sub_22F109344(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_268694148 = v1;
  return result;
}

uint64_t sub_22F10920C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_22F10C050();
    sub_22F10BEF0();
    uint64_t v6 = sub_22F10C060();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_22F10C030() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          char v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_22F10C030() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_22F109344(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_22F104BB8(&qword_268694158);
    uint64_t v3 = sub_22F10BFC0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_22F10C050();
      swift_bridgeObjectRetain();
      sub_22F10BEF0();
      uint64_t result = sub_22F10C060();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        char v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_22F10C030(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_22F10C030();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

id sub_22F1095B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BundleConfiguration()
{
  return self;
}

uint64_t sub_22F109608(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22F1096DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22F109F18((uint64_t)v12, *a3);
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
      sub_22F109F18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_22F108DCC((uint64_t)v12);
  return v7;
}

uint64_t sub_22F1096DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22F10BFB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22F109898(a5, a6);
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
  uint64_t v8 = sub_22F10BFE0();
  if (!v8)
  {
    sub_22F10C000();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22F10C020();
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

uint64_t sub_22F109898(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22F109930(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22F109B10(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22F109B10(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22F109930(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22F109AA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22F10BFD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22F10C000();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22F10BF10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22F10C020();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22F10C000();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22F109AA8(uint64_t a1, uint64_t a2)
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
  sub_22F104BB8(&qword_268694160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22F109B10(char a1, int64_t a2, char a3, char *a4)
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
    sub_22F104BB8(&qword_268694160);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_22F10C020();
  __break(1u);
  return result;
}

uint64_t sub_22F109C60(uint64_t a1, unint64_t a2)
{
  if (qword_2686940C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22F10BEA0();
  sub_22F105E24(v4, (uint64_t)qword_268694198);
  swift_bridgeObjectRetain_n();
  size_t v5 = sub_22F10BE80();
  os_log_type_t v6 = sub_22F10BF80();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v8;
    *(_DWORD *)int64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_22F109608(a1, a2, &v17);
    sub_22F10BFA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22F102000, v5, v6, "DataSource for %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FB19E0](v8, -1, -1);
    MEMORY[0x230FB19E0](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (sub_22F10BEC0() == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
    return type metadata accessor for DataSource();
  }
  char v11 = sub_22F10C030();
  swift_bridgeObjectRelease();
  if (v11) {
    return type metadata accessor for DataSource();
  }
  if (sub_22F10BEC0() == a1 && v12 == a2) {
    goto LABEL_13;
  }
  char v14 = sub_22F10C030();
  swift_bridgeObjectRelease();
  if (v14) {
    return type metadata accessor for SampleDataSource();
  }
  if (sub_22F10BEC0() == a1 && v15 == a2)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return type metadata accessor for SampleDataSource();
  }
  char v16 = sub_22F10C030();
  swift_bridgeObjectRelease();
  if (v16) {
    return type metadata accessor for SampleDataSource();
  }
  return 0;
}

uint64_t sub_22F109F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for TomorrowWeather(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AirQualityObservation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 72);
}

uint64_t initializeWithCopy for AirQualityObservation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  os_log_type_t v6 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for AirQualityObservation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 72);
  uint64_t v5 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for AirQualityObservation(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AirQualityObservation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  return a1;
}

uint64_t getEnumTagSinglePayload for AirQualityObservation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AirQualityObservation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AirQualityObservation()
{
  return &type metadata for AirQualityObservation;
}

id sub_22F10A268()
{
  id v0 = objc_msgSend(self, sel_configurationWithScale_, 3);
  swift_bridgeObjectRetain();
  id v1 = v0;
  unint64_t v2 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v2, v1);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_imageWithRenderingMode_, 1);

    id v1 = v3;
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }

  return v4;
}

void *sub_22F10A364(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  id v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v3 = *a2;
    id v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v5;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v6 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v7;
    uint64_t v8 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v8;
    uint64_t v9 = a2[12];
    uint64_t v10 = *(int *)(a3 + 44);
    uint64_t v16 = (uint64_t)a2 + v10;
    uint64_t v11 = a1 + v10;
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = v9;
    uint64_t v12 = sub_22F10BD50();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v16, v12);
  }
  return v3;
}

uint64_t sub_22F10A4B0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_22F10BD50();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_22F10A548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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
  uint64_t v9 = *(int *)(a3 + 44);
  uint64_t v14 = a2 + v9;
  uint64_t v10 = a1 + v9;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v11 = sub_22F10BD50();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v14, v11);
  return a1;
}

uint64_t sub_22F10A644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22F10BD50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22F10A778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v5 = *(int *)(a3 + 44);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v8 = sub_22F10BD50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22F10A81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 44);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_22F10BD50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_22F10A8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22F10A90C);
}

uint64_t sub_22F10A90C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22F10BD50();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22F10A9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22F10A9D0);
}

uint64_t sub_22F10A9D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22F10BD50();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ConditionsObservation()
{
  uint64_t result = qword_268694168;
  if (!qword_268694168) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F10AAC4()
{
  uint64_t result = sub_22F10BD50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_22F10AB78()
{
  uint64_t v0 = sub_22F10BE10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F10BDD0();
  char v4 = sub_22F108EE4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = objc_msgSend(self, sel_configurationWithScale_, v5);
  swift_bridgeObjectRetain();
  id v7 = v6;
  uint64_t v8 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v8, v7);

  if (v9)
  {
    id v10 = objc_msgSend(v9, sel_imageWithRenderingMode_, 1);

    id v7 = v9;
  }
  else
  {
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }

  return v10;
}

void *sub_22F10AD30(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  id v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    void *v3 = *a2;
    id v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v5;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v6 = a2[6];
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (uint64_t)a2 + v7;
    uint64_t v9 = a1 + v7;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v6;
    uint64_t v10 = sub_22F10BDA0();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t sub_22F10AE38(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_22F10BDA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_22F10AEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v9 = sub_22F10BDA0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

uint64_t sub_22F10AF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22F10BDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22F10B044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_22F10BDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22F10B0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_22F10BDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22F10B17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22F10B190);
}

uint64_t sub_22F10B190(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22F10BDA0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22F10B240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22F10B254);
}

uint64_t sub_22F10B254(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22F10BDA0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for InterestingHourWeather()
{
  uint64_t result = qword_268694178;
  if (!qword_268694178) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22F10B348()
{
  uint64_t result = sub_22F10BDA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for SiriFaceForecast(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SiriFaceForecast(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a1 + 16);
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    _OWORD *v5 = *(_OWORD *)v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    uint64_t v8 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v8;
    uint64_t v9 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v9;
    uint64_t v10 = *(void *)(a2 + 88);
    uint64_t v11 = *(void *)(a2 + 96);
    *(void *)(a1 + 88) = v10;
    *(void *)(a1 + 96) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(v6 + 48);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(v6 + 32);
    *(_OWORD *)(a1 + 64) = v12;
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(v6 + 64);
    *(void *)(a1 + 96) = *(void *)(v6 + 80);
    long long v13 = *(_OWORD *)(v6 + 16);
    _OWORD *v5 = *(_OWORD *)v6;
    *(_OWORD *)(a1 + 32) = v13;
  }
  return a1;
}

uint64_t assignWithCopy for SiriFaceForecast(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 16);
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
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
    }
    else
    {
      sub_22F10B708(a1 + 16);
      long long v7 = *(_OWORD *)(a2 + 32);
      _OWORD *v4 = *v5;
      *(_OWORD *)(a1 + 32) = v7;
      long long v9 = *(_OWORD *)(a2 + 64);
      long long v8 = *(_OWORD *)(a2 + 80);
      long long v10 = *(_OWORD *)(a2 + 48);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(_OWORD *)(a1 + 64) = v9;
      *(_OWORD *)(a1 + 80) = v8;
      *(_OWORD *)(a1 + 48) = v10;
    }
  }
  else if (v6)
  {
    _OWORD *v4 = *v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 32);
    _OWORD *v4 = *v5;
    *(_OWORD *)(a1 + 32) = v11;
    long long v12 = *(_OWORD *)(a2 + 48);
    long long v13 = *(_OWORD *)(a2 + 64);
    long long v14 = *(_OWORD *)(a2 + 80);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(_OWORD *)(a1 + 64) = v13;
    *(_OWORD *)(a1 + 80) = v14;
    *(_OWORD *)(a1 + 48) = v12;
  }
  return a1;
}

uint64_t sub_22F10B708(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for SiriFaceForecast(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SiriFaceForecast(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 40);
  if (!v4)
  {
    sub_22F10B708(a1 + 16);
LABEL_5:
    long long v8 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v9;
    return a1;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriFaceForecast(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 104)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriFaceForecast(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriFaceForecast()
{
  return &type metadata for SiriFaceForecast;
}

uint64_t destroy for TomorrowWeather()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TomorrowWeather(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TomorrowWeather(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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
  return a1;
}

__n128 initializeWithTake for TomorrowWeather(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for TomorrowWeather(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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
  return a1;
}

uint64_t getEnumTagSinglePayload for TomorrowWeather(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TomorrowWeather(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TomorrowWeather()
{
  return &type metadata for TomorrowWeather;
}

id sub_22F10BC14()
{
  id v0 = objc_msgSend(self, sel_configurationWithScale_, 2);
  swift_bridgeObjectRetain();
  id v1 = v0;
  unint64_t v2 = (void *)sub_22F10BEB0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v2, v1);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_imageWithRenderingMode_, 1);

    id v1 = v3;
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }

  return v4;
}

uint64_t sub_22F10BD10()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_22F10BD20()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_22F10BD30()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_22F10BD40()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_22F10BD50()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_22F10BD60()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22F10BD70()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_22F10BD80()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22F10BD90()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22F10BDA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22F10BDB0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_22F10BDC0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_22F10BDD0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22F10BDE0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_22F10BDF0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_22F10BE00()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_22F10BE10()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22F10BE20()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_22F10BE30()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_22F10BE40()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_22F10BE50()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_22F10BE60()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22F10BE70()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22F10BE80()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22F10BE90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22F10BEA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22F10BEB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22F10BEC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22F10BED0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22F10BEE0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22F10BEF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22F10BF00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22F10BF10()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22F10BF20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22F10BF30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22F10BF40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22F10BF50()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22F10BF60()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22F10BF70()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22F10BF80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22F10BF90()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22F10BFA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22F10BFB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22F10BFC0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22F10BFD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22F10BFE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22F10BFF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22F10C000()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22F10C010()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22F10C020()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22F10C030()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22F10C040()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22F10C050()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22F10C060()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t NWCGlyphPrefixedTextProvider()
{
  return MEMORY[0x270F4DAF0]();
}

uint64_t REEndOfDayForDate()
{
  return MEMORY[0x270F59A70]();
}

uint64_t REStartOfNextDayForDate()
{
  return MEMORY[0x270F59A98]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}