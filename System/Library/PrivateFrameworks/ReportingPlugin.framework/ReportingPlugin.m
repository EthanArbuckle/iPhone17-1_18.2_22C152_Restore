void sub_25B3A24F0(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

_DWORD *sub_25B3A24FC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void type metadata accessor for BMMLSEShareSheetFeedbackTimeoutOccurrence(uint64_t a1)
{
}

void type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(uint64_t a1)
{
}

void sub_25B3A2534(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25B3A2580()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Analytics()
{
  return self;
}

uint64_t AppSuggestionInferenceEventTimestamped.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25B3DCC98();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

id AppSuggestionInferenceEventTimestamped.event.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for AppSuggestionInferenceEventTimestamped(0) + 20));
  return v1;
}

uint64_t type metadata accessor for AppSuggestionInferenceEventTimestamped(uint64_t a1)
{
  return sub_25B3A7650(a1, (uint64_t *)&unk_26A4FB430);
}

uint64_t sub_25B3A2670(char a1)
{
  if (a1) {
    return 0x746E657665;
  }
  else {
    return 1702125924;
  }
}

BOOL sub_25B3A269C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25B3A26B4()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3A26FC()
{
  return sub_25B3DD3D8();
}

uint64_t sub_25B3A2728()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3A276C()
{
  return sub_25B3A2670(*v0);
}

uint64_t sub_25B3A2774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3A8F64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3A279C()
{
  return 0;
}

void sub_25B3A27A8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25B3A27B4(uint64_t a1)
{
  unint64_t v2 = sub_25B3A2AB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3A27F0(uint64_t a1)
{
  unint64_t v2 = sub_25B3A2AB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppSuggestionInferenceEventTimestamped.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB3E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3A2AB8();
  sub_25B3DD428();
  char v12 = 0;
  sub_25B3DCC98();
  sub_25B3A2B0C(&qword_26A4FB3F0, MEMORY[0x263F07490]);
  sub_25B3DD2E8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + *(int *)(type metadata accessor for AppSuggestionInferenceEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for AppSuggestions();
    sub_25B3A2B0C(&qword_26A4FB3F8, (void (*)(uint64_t))type metadata accessor for AppSuggestions);
    sub_25B3DD2E8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
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

unint64_t sub_25B3A2AB8()
{
  unint64_t result = qword_26A4FB3E8;
  if (!qword_26A4FB3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB3E8);
  }
  return result;
}

uint64_t sub_25B3A2B0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25B3A2B54(void *a1)
{
  return AppSuggestionInferenceEventTimestamped.encode(to:)(a1);
}

uint64_t _s15ReportingPlugin41PeopleSuggestionInferenceEventTimestampedV4date10Foundation4DateVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25B3DCC98();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

BOOL sub_25B3A2BD4()
{
  sub_25B3DCC68();
  double v1 = v0;
  sub_25B3DCC68();
  return v1 < v2;
}

BOOL sub_25B3A2C18()
{
  sub_25B3DCC68();
  double v1 = v0;
  sub_25B3DCC68();
  return v1 >= v2;
}

BOOL sub_25B3A2C5C()
{
  sub_25B3DCC68();
  double v1 = v0;
  sub_25B3DCC68();
  return v1 >= v2;
}

BOOL sub_25B3A2CA0()
{
  sub_25B3DCC68();
  double v1 = v0;
  sub_25B3DCC68();
  return v1 < v2;
}

BOOL sub_25B3A2CE4()
{
  sub_25B3DCC68();
  double v1 = v0;
  sub_25B3DCC68();
  return v1 == v2;
}

uint64_t AppSuggestionsJoiningResult.unmatchedInferenceEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSuggestionsJoiningResult.unmatchedFeedbackEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSuggestionsJoiningResult.errors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t collectAppSuggestionEvents()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB400);
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  v8 = (char *)&v40 - v7;
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v40 - v9;
  id v11 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(v12, sel_Inference);
  swift_unknownObjectRelease();
  id v14 = objc_msgSend(v13, sel_AppSuggestions);
  swift_unknownObjectRelease();
  id v15 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v16 = objc_msgSend(v15, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v16, sel_Feedback);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB408);
  v18 = (void *)swift_allocObject();
  v18[2] = MEMORY[0x263F8EE88];
  uint64_t v19 = MEMORY[0x263F8EE78];
  v18[3] = sub_25B3A6280(MEMORY[0x263F8EE78]);
  v18[4] = sub_25B3A6280(v19);
  v18[5] = sub_25B3A3344;
  v18[6] = 0;
  v18[7] = sub_25B3A3550;
  v18[8] = 0;
  v47 = v18;
  id v44 = v14;
  sub_25B3A3580(v14, v17, &v47, (uint64_t)v8);
  uint64_t v20 = v43;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v10, v8, v2);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  v41 = (uint64_t *)(v21 + 16);
  uint64_t v22 = swift_allocObject();
  v42 = a1;
  uint64_t v23 = v2;
  uint64_t v24 = v20;
  *(void *)(v22 + 16) = v19;
  v25 = (void **)(v22 + 16);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v5, v10, v23);
  sub_25B3A90CC(&qword_26A4FB418, &qword_26A4FB400);
  v40 = v10;
  swift_retain();
  swift_retain();

  swift_release();
  swift_release();
  uint64_t v43 = *(void *)(v24 + 8);
  ((void (*)(char *, uint64_t))v43)(v5, v23);
  v46[0] = v19;
  swift_beginAccess();
  uint64_t v26 = swift_bridgeObjectRetain();
  sub_25B3A4364(v26, v25, (unint64_t *)v46);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v27 = swift_bridgeObjectRetain();
  v28 = sub_25B3A82CC(v27);
  swift_bridgeObjectRelease();
  unint64_t v29 = sub_25B3A4508((unint64_t)v28);
  uint64_t v31 = v30;
  swift_release();
  unint64_t v45 = v29;
  swift_beginAccess();
  sub_25B3A4974(v31);
  swift_endAccess();
  sub_25B3A6AD4(v46, type metadata accessor for AppSuggestionInferenceEventTimestamped, (uint64_t (*)(uint64_t))sub_25B3D892C, type metadata accessor for AppSuggestionInferenceEventTimestamped, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_25B3C69EC);
  sub_25B3A6AD4((uint64_t *)&v45, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t (*)(uint64_t))sub_25B3D8918, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_25B3C69D4);

  uint64_t v32 = v23;
  v33 = v42;
  ((void (*)(char *, uint64_t))v43)(v40, v32);
  swift_release();
  v34 = v41;
  swift_beginAccess();
  uint64_t v35 = *v34;
  uint64_t v36 = v46[0];
  uint64_t v37 = v45;
  v38 = *v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t result = swift_release();
  void *v33 = v35;
  v33[1] = v36;
  v33[2] = v37;
  v33[3] = v38;
  return result;
}

uint64_t sub_25B3A3344@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25B3A3374(a1, "missing app suggestions identifier");
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25B3A3374(void *a1, const char *a2)
{
  uint64_t v4 = sub_25B3DCCC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_identifier);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_25B3DCDE8();

    return v10;
  }
  else
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25B3DCD98();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B346958);
    id v13 = sub_25B3DCD78();
    os_log_type_t v14 = sub_25B3DCF78();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_25B39F000, v13, v14, a2, v15, 2u);
      MEMORY[0x261163250](v15, -1, -1);
    }

    sub_25B3DCCB8();
    uint64_t v16 = sub_25B3DCCA8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
}

uint64_t sub_25B3A3550@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25B3A3374(a1, "missing feedback identifier");
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25B3A3580@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v29 = a2;
  uint64_t v34 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB510);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB498);
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v14 = (char *)&v29 - v13;
  type metadata accessor for AppSuggestionEventsHandler();
  id v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInitialContext_, *a3);
  uint64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_reversed);
  id v18 = objc_msgSend(a1, sel_publisherWithOptions_, v17);

  id v19 = objc_msgSend(v18, sel_withBookmark_, 0);
  sub_25B3DCD08();
  id v20 = objc_msgSend(v16, sel_reversed);
  id v21 = objc_msgSend(v29, sel_publisherWithOptions_, v20);

  id v22 = objc_msgSend(v21, sel_withBookmark_, 0);
  sub_25B3DCD08();
  id v23 = objc_msgSend(v15, sel_context);
  id v24 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB408);
  type metadata accessor for AppSuggestionsJointEvent(0);
  sub_25B3A90CC(&qword_26A4FB4A8, &qword_26A4FB498);
  v25 = v30;
  sub_25B3DCCF8();
  swift_release();

  uint64_t v26 = v32;
  sub_25B3DCCD8();
  sub_25B3DCD18();

  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v26);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v31 + 8);
  v27(v12, v9);
  return ((uint64_t (*)(char *, uint64_t))v27)(v14, v9);
}

uint64_t sub_25B3A393C@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v29 = a2;
  uint64_t v34 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB490);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB498);
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v14 = (char *)&v29 - v13;
  type metadata accessor for PeopleSuggestionEventsHandler();
  id v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInitialContext_, *a3);
  uint64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_reversed);
  id v18 = objc_msgSend(a1, sel_publisherWithOptions_, v17);

  id v19 = objc_msgSend(v18, sel_withBookmark_, 0);
  sub_25B3DCD08();
  id v20 = objc_msgSend(v16, sel_reversed);
  id v21 = objc_msgSend(v29, sel_publisherWithOptions_, v20);

  id v22 = objc_msgSend(v21, sel_withBookmark_, 0);
  sub_25B3DCD08();
  id v23 = objc_msgSend(v15, sel_context);
  id v24 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4A0);
  type metadata accessor for PeopleSuggestionsJointEvent(0);
  sub_25B3A90CC(&qword_26A4FB4A8, &qword_26A4FB498);
  v25 = v30;
  sub_25B3DCCF8();
  swift_release();

  uint64_t v26 = v32;
  sub_25B3DCCD8();
  sub_25B3DCD18();

  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v26);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v31 + 8);
  v27(v12, v9);
  return ((uint64_t (*)(char *, uint64_t))v27)(v14, v9);
}

void sub_25B3A3CF8(void *a1, uint64_t a2)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    uint64_t v4 = (void **)(a2 + 16);
    id v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      uint64_t v6 = v5;
      swift_beginAccess();
      uint64_t v7 = *v4;
      id v8 = v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v7 = sub_25B3B1358(0, v7[2] + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        uint64_t v7 = sub_25B3B1358((void *)(v10 > 1), v11 + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();
    }
    else
    {
      sub_25B3A9794();
      uint64_t v12 = swift_allocError();
      *(void *)uint64_t v13 = 0xD00000000000003BLL;
      *(void *)(v13 + 8) = 0x800000025B3E0C80;
      *(unsigned char *)(v13 + 16) = 1;
      swift_beginAccess();
      os_log_type_t v14 = *v4;
      char v15 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v14;
      if ((v15 & 1) == 0)
      {
        os_log_type_t v14 = sub_25B3B1358(0, v14[2] + 1, 1, v14);
        *uint64_t v4 = v14;
      }
      unint64_t v17 = v14[2];
      unint64_t v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        os_log_type_t v14 = sub_25B3B1358((void *)(v16 > 1), v17 + 1, 1, v14);
        *uint64_t v4 = v14;
      }
      v14[2] = v17 + 1;
      v14[v17 + 4] = v12;
      swift_endAccess();
    }
  }
}

uint64_t sub_25B3A3EE8(void *a1, uint64_t a2)
{
  swift_beginAccess();
  id v4 = a1;
  MEMORY[0x261162580]();
  if (*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_25B3DCEB8();
  sub_25B3DCED8();
  sub_25B3DCEA8();
  return swift_endAccess();
}

void sub_25B3A3F84(id *a1, void **a2, unint64_t *a3)
{
  uint64_t v7 = type metadata accessor for AppSuggestionInferenceEventTimestamped(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *a1;
  id v12 = objc_msgSend(*a1, sel_eventBody);
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = sub_25B3C7BF8(v12);
    if (v3)
    {
      swift_beginAccess();
      char v15 = *a2;
      id v16 = v3;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        char v15 = sub_25B3B1358(0, v15[2] + 1, 1, v15);
        *a2 = v15;
      }
      unint64_t v19 = v15[2];
      unint64_t v18 = v15[3];
      if (v19 >= v18 >> 1)
      {
        char v15 = sub_25B3B1358((void *)(v18 > 1), v19 + 1, 1, v15);
        *a2 = v15;
      }
      v15[2] = v19 + 1;
      v15[v19 + 4] = v3;
      swift_endAccess();
    }
    else
    {
      v28 = v14;
      objc_msgSend(v11, sel_timestamp);
      sub_25B3DCC28();
      *(void *)&v10[*(int *)(v7 + 20)] = v28;
      unint64_t v29 = *a3;
      id v30 = v28;
      char v31 = swift_isUniquelyReferenced_nonNull_native();
      *a3 = v29;
      if ((v31 & 1) == 0)
      {
        unint64_t v29 = sub_25B3B1468(0, *(void *)(v29 + 16) + 1, 1, v29);
        *a3 = v29;
      }
      unint64_t v33 = *(void *)(v29 + 16);
      unint64_t v32 = *(void *)(v29 + 24);
      if (v33 >= v32 >> 1)
      {
        unint64_t v29 = sub_25B3B1468(v32 > 1, v33 + 1, 1, v29);
        *a3 = v29;
      }
      *(void *)(v29 + 16) = v33 + 1;
      sub_25B3A972C((uint64_t)v10, v29+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v33, type metadata accessor for AppSuggestionInferenceEventTimestamped);
    }
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    sub_25B3DD168();
    sub_25B3DCE28();
    swift_getObjectType();
    sub_25B3DD458();
    sub_25B3DCE28();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    objc_msgSend(v11, sel_timestamp);
    sub_25B3DCEF8();
    uint64_t v20 = v35;
    unint64_t v21 = v36;
    sub_25B3A9794();
    uint64_t v22 = swift_allocError();
    *(void *)uint64_t v23 = v20;
    *(void *)(v23 + 8) = v21;
    *(unsigned char *)(v23 + 16) = 0;
    swift_beginAccess();
    id v24 = *a2;
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v24;
    if ((v25 & 1) == 0)
    {
      id v24 = sub_25B3B1358(0, v24[2] + 1, 1, v24);
      *a2 = v24;
    }
    unint64_t v27 = v24[2];
    unint64_t v26 = v24[3];
    if (v27 >= v26 >> 1)
    {
      id v24 = sub_25B3B1358((void *)(v26 > 1), v27 + 1, 1, v24);
      *a2 = v24;
    }
    v24[2] = v27 + 1;
    v24[v27 + 4] = v22;
    swift_endAccess();
  }
}

void sub_25B3A4364(uint64_t a1, void **a2, unint64_t *a3)
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
    sub_25B3A3F84(&v20, a2, a3);
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

unint64_t sub_25B3A4508(unint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0);
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_25B3DD248())
  {
    uint64_t v6 = 0;
    unint64_t v31 = a1 & 0xC000000000000001;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    v26[1] = 0x800000025B3E0C60;
    unint64_t v8 = MEMORY[0x263F8EE78];
    unint64_t v30 = a1;
LABEL_4:
    unint64_t v27 = v7;
    uint64_t v9 = v6;
    while (1)
    {
      id v10 = v31 ? (id)MEMORY[0x2611628B0](v9, a1) : *(id *)(a1 + 8 * v9 + 32);
      int64_t v11 = v10;
      uint64_t v6 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      id v12 = objc_msgSend(v10, sel_eventBody);
      if (!v12)
      {
        uint64_t v32 = 0;
        unint64_t v33 = 0xE000000000000000;
        sub_25B3DD168();
        sub_25B3DCE28();
        swift_getObjectType();
        sub_25B3DD458();
        sub_25B3DCE28();
        swift_bridgeObjectRelease();
        sub_25B3DCE28();
        objc_msgSend(v11, sel_timestamp);
        sub_25B3DCEF8();
        uint64_t v17 = v32;
        unint64_t v18 = v33;
        sub_25B3A9794();
        uint64_t v19 = swift_allocError();
        *(void *)uint64_t v20 = v17;
        *(void *)(v20 + 8) = v18;
        *(unsigned char *)(v20 + 16) = 0;
        unint64_t v21 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v21 = sub_25B3B1358(0, v21[2] + 1, 1, v21);
        }
        unint64_t v23 = v21[2];
        unint64_t v22 = v21[3];
        id v24 = v21;
        if (v23 >= v22 >> 1) {
          id v24 = sub_25B3B1358((void *)(v22 > 1), v23 + 1, 1, v21);
        }
        uint64_t v7 = v24;
        v24[2] = v23 + 1;
        v24[v23 + 4] = v19;

        a1 = v30;
        if (v6 == v5)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return v8;
        }
        goto LABEL_4;
      }
      unint64_t v13 = v12;
      id v14 = sub_25B3C808C(v12);
      objc_msgSend(v11, sel_timestamp);
      sub_25B3DCC28();
      *(void *)&v4[*(int *)(v29 + 20)] = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v8 = sub_25B3B1324(0, *(void *)(v8 + 16) + 1, 1, v8);
      }
      unint64_t v16 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 24);
      if (v16 >= v15 >> 1) {
        unint64_t v8 = sub_25B3B1324(v15 > 1, v16 + 1, 1, v8);
      }
      *(void *)(v8 + 16) = v16 + 1;
      sub_25B3A972C((uint64_t)v4, v8+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v16, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);

      ++v9;
      a1 = v30;
      if (v6 == v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25B3A4974(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25B3B1358(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[v8 + 4];
  if (a1 + 32 < v9 + 8 * v2 && v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB500);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3A4AD8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_25B3B195C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_25B3DCC98() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3A4C88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  unint64_t v3 = sub_25B3B1990(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[v8 + 4];
  if (a1 + 32 < v9 + 8 * v2 && v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4C8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3A4DEC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  unint64_t v3 = sub_25B3B1AC0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = &v3[v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3A4F34(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25B3DD248();
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
    uint64_t v5 = sub_25B3DD248();
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
    unint64_t v4 = MEMORY[0x2611628C0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25B3A8B44(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25B3DD248();
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
  return sub_25B3DCEA8();
}

id sub_25B3A5100(void *a1, void *a2)
{
  uint64_t v5 = sub_25B3DCC98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2;
  id v10 = objc_msgSend(a1, sel_eventBody);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_msgSend(v10, sel_appSuggestions);

    sub_25B3A9070();
    uint64_t v13 = sub_25B3DCE88();

    id v14 = objc_msgSend(a2, sel_eventBody);
    if (v14)
    {
      unint64_t v15 = v14;
      objc_msgSend(a1, sel_timestamp);
      sub_25B3DCC28();
      uint64_t v16 = (uint64_t)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_timestamp];
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_timestamp], v8, v5);
      unsigned int v17 = objc_msgSend(v15, sel_engagementType);
      uint64_t v18 = 0;
      switch(v17)
      {
        case 0u:
          swift_bridgeObjectRelease();
          if (qword_26B346880 != -1) {
            goto LABEL_49;
          }
          goto LABEL_5;
        case 1u:
          goto LABEL_32;
        case 2u:
          uint64_t v18 = 1;
          goto LABEL_32;
        case 3u:
          uint64_t v18 = 2;
          goto LABEL_32;
        case 4u:
          uint64_t v18 = 4;
          goto LABEL_32;
        case 5u:
          uint64_t v18 = 3;
          goto LABEL_32;
        case 6u:
          uint64_t v18 = 5;
          goto LABEL_32;
        case 7u:
          uint64_t v18 = 6;
LABEL_32:
          *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagement] = v18;
          uint64_t v48 = MEMORY[0x263F8EE88];
          uint64_t v47 = MEMORY[0x263F8EE80];
          if ((unint64_t)v13 >> 62)
          {
            if (v13 < 0) {
              uint64_t v5 = v13;
            }
            else {
              uint64_t v5 = v13 & 0xFFFFFFFFFFFFFF8;
            }
            swift_bridgeObjectRetain();
            uint64_t v16 = sub_25B3DD248();
            if (v16) {
              goto LABEL_34;
            }
          }
          else
          {
            uint64_t v16 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v16)
            {
LABEL_34:
              if (v16 >= 1)
              {
                uint64_t v38 = 0;
                do
                {
                  if ((v13 & 0xC000000000000001) != 0) {
                    id v39 = (id)MEMORY[0x2611628B0](v38, v13);
                  }
                  else {
                    id v39 = *(id *)(v13 + 8 * v38 + 32);
                  }
                  v40 = v39;
                  ++v38;
                  id v46 = v39;
                  sub_25B3A5880(&v46, (uint64_t)&v48, v15, &v47);
                }
                while (v16 != v38);

                swift_bridgeObjectRelease();
                uint64_t v42 = v47;
                uint64_t v41 = v48;
                goto LABEL_46;
              }
              __break(1u);
LABEL_49:
              swift_once();
LABEL_5:
              uint64_t v19 = sub_25B3DCD98();
              __swift_project_value_buffer(v19, (uint64_t)qword_26B346958);
              uint64_t v20 = sub_25B3DCD78();
              os_log_type_t v21 = sub_25B3DCF68();
              if (os_log_type_enabled(v20, v21))
              {
                uint64_t v22 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v22 = 0;
                int64_t v23 = "unexpected unknown engagement type";
LABEL_24:
                _os_log_impl(&dword_25B39F000, v20, v21, v23, v22, 2u);
                MEMORY[0x261163250](v22, -1, -1);
              }
LABEL_25:

              (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v5);
              goto LABEL_17;
            }
          }

          swift_bridgeObjectRelease();
          uint64_t v41 = MEMORY[0x263F8EE88];
          uint64_t v42 = MEMORY[0x263F8EE80];
LABEL_46:
          swift_bridgeObjectRelease();
          *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_inferenceModels] = v41;
          *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagedModelRanks] = v42;

          uint64_t v43 = (objc_class *)type metadata accessor for AppSuggestionsJointEvent(0);
          v45.receiver = v9;
          v45.super_class = v43;
          id v36 = objc_msgSendSuper2(&v45, sel_init);

          return v36;
        default:
          swift_bridgeObjectRelease();
          if (qword_26B346880 != -1) {
            swift_once();
          }
          uint64_t v37 = sub_25B3DCD98();
          __swift_project_value_buffer(v37, (uint64_t)qword_26B346958);
          uint64_t v20 = sub_25B3DCD78();
          os_log_type_t v21 = sub_25B3DCF68();
          if (!os_log_type_enabled(v20, v21)) {
            goto LABEL_25;
          }
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v22 = 0;
          int64_t v23 = "unexpected engagement type";
          goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_25B3DCD98();
    __swift_project_value_buffer(v30, (uint64_t)qword_26B346958);
    id v31 = a2;
    uint64_t v32 = sub_25B3DCD78();
    os_log_type_t v33 = sub_25B3DCF78();
    if (!os_log_type_enabled(v32, v33))
    {

      goto LABEL_18;
    }
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 134217984;
    objc_msgSend(v31, sel_timestamp);
    uint64_t v48 = v35;
    sub_25B3DD018();

    _os_log_impl(&dword_25B39F000, v32, v33, "no feedback in %f", v34, 0xCu);
    MEMORY[0x261163250](v34, -1, -1);
  }
  else
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25B3DCD98();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B346958);
    id v25 = a1;
    unint64_t v26 = sub_25B3DCD78();
    os_log_type_t v27 = sub_25B3DCF78();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 134217984;
      objc_msgSend(v25, sel_timestamp);
      uint64_t v48 = v29;
      sub_25B3DD018();

      _os_log_impl(&dword_25B39F000, v26, v27, "no app suggestions at %f", v28, 0xCu);
      MEMORY[0x261163250](v28, -1, -1);
    }
    else
    {
    }
  }
LABEL_17:

LABEL_18:
  type metadata accessor for AppSuggestionsJointEvent(0);
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_25B3A5880(id *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6 = *a1;
  id v7 = objc_msgSend(*a1, sel_transportBundleId);
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_25B3DCDE8();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(v6, sel_model);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25B3DCD98();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B346958);
    id v23 = v6;
    uint64_t v24 = sub_25B3DCD78();
    os_log_type_t v25 = sub_25B3DCF68();
    if (!os_log_type_enabled(v24, v25))
    {

      return;
    }
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v39 = v27;
    *(_DWORD *)unint64_t v26 = 136315138;
    unint64_t v28 = sub_25B3A5D68();
    uint64_t v40 = sub_25B3B1CCC(v28, v29, &v39);
    sub_25B3DD018();

    swift_bridgeObjectRelease();
    uint64_t v30 = "AppSuggestion missing required fields: %s";
    goto LABEL_14;
  }
  uint64_t v13 = v12;
  uint64_t v14 = sub_25B3DCDE8();
  uint64_t v16 = v15;

  swift_bridgeObjectRetain();
  sub_25B3D54BC(&v39, v14, v16);
  swift_bridgeObjectRelease();
  if (objc_msgSend(a3, sel_engagementType) != 2
    || (id v17 = objc_msgSend(a3, sel_engagementIdentifier)) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v18 = v17;
  uint64_t v19 = sub_25B3DCDE8();
  uint64_t v21 = v20;

  if (v9 == v19 && v11 == v21)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v31 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (!objc_msgSend(v6, sel_rank))
  {
    swift_bridgeObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_25B3DCD98();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B346958);
    id v36 = v6;
    uint64_t v24 = sub_25B3DCD78();
    os_log_type_t v25 = sub_25B3DCF68();
    if (!os_log_type_enabled(v24, v25))
    {

      return;
    }
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v39 = v27;
    *(_DWORD *)unint64_t v26 = 136315138;
    unint64_t v37 = sub_25B3A5D68();
    uint64_t v40 = sub_25B3B1CCC(v37, v38, &v39);
    sub_25B3DD018();

    swift_bridgeObjectRelease();
    uint64_t v30 = "Missing or negative rank: %s";
LABEL_14:
    _os_log_impl(&dword_25B39F000, v24, v25, v30, v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261163250](v27, -1, -1);
    MEMORY[0x261163250](v26, -1, -1);

    return;
  }
  unsigned int v32 = objc_msgSend(v6, sel_rank);
  if (v32 >= 0x100)
  {
    sub_25B3DD228();
    __break(1u);
  }
  else
  {
    char v33 = v32;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *a4;
    *a4 = 0x8000000000000000;
    sub_25B3D82F4(v33, v14, v16, isUniquelyReferenced_nonNull_native);
    *a4 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_25B3A5D68()
{
  uint64_t v1 = v0;
  sub_25B3DD168();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_transportBundleId);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_25B3DCDE8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB478);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v7 = objc_msgSend(v1, sel_model, v4, v6);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_25B3DCDE8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  objc_msgSend(v1, sel_rank, v9, v11);
  sub_25B3DD318();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return 0xD000000000000014;
}

id AppSuggestionsJointEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AppSuggestionsJointEvent.init()()
{
}

id AppSuggestionsJointEvent.__deallocating_deinit()
{
  return sub_25B3A6240(type metadata accessor for AppSuggestionsJointEvent);
}

uint64_t sub_25B3A60A4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  id v8 = objc_msgSend(v7, sel_context);
  a4(a3);
  swift_unknownObjectRelease();

  return swift_release();
}

id sub_25B3A61B0(uint64_t a1)
{
  return sub_25B3A61C8(a1, (SEL *)&selRef_initWithInitalContext_);
}

id sub_25B3A61BC(uint64_t a1)
{
  return sub_25B3A61C8(a1, (SEL *)&selRef_initWithInitialContext_);
}

id sub_25B3A61C8(uint64_t a1, SEL *a2)
{
  v7.receiver = objc_allocWithZone(v2);
  v7.super_class = v2;
  id v5 = objc_msgSendSuper2(&v7, *a2, a1);
  swift_release();
  return v5;
}

id sub_25B3A6228()
{
  return sub_25B3A6240((uint64_t (*)(void))type metadata accessor for AppSuggestionEventsHandler);
}

id sub_25B3A6240(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_25B3A6280(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB518);
  id v2 = (void *)sub_25B3DD278();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    objc_super v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25B3B2324(v5, v6);
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

uint64_t sub_25B3A639C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25B3A63D4(void *a1)
{
  sub_25B3A3CF8(a1, v1);
}

uint64_t sub_25B3A63DC(void *a1)
{
  return sub_25B3A3EE8(a1, v1);
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

unint64_t sub_25B3A6430(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4B0);
  id v2 = (void *)sub_25B3DD278();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 56);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 3);
    uint64_t v6 = (uint64_t)*(v4 - 2);
    int v7 = *((unsigned __int8 *)v4 - 8);
    id v8 = *v4;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_25B3B239C(v5, v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = v2[6] + 24 * result;
    *(void *)uint64_t v12 = v5;
    *(void *)(v12 + 8) = v6;
    *(unsigned char *)(v12 + 16) = v7;
    *(void *)(v2[7] + 8 * result) = v9;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 4;
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

unint64_t sub_25B3A656C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E8);
  id v2 = (void *)sub_25B3DD278();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 48);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    id v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    unint64_t result = sub_25B3B24D8((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v7;
    uint64_t v10 = v2[7] + 16 * result;
    *(unsigned char *)uint64_t v10 = v5;
    *(void *)(v10 + 8) = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_25B3A668C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E0);
  id v2 = (void *)sub_25B3DD278();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    char v7 = *((unsigned char *)v4 - 8);
    uint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25B3B2324(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = v2[7] + 16 * result;
    *(unsigned char *)uint64_t v12 = v7;
    *(void *)(v12 + 8) = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 4;
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

unint64_t sub_25B3A67B8(uint64_t a1)
{
  return sub_25B3A6808(a1, &qword_26A4FB4B8, &qword_26A4FB4C0, sub_25B3B2440);
}

unint64_t sub_25B3A67E0(uint64_t a1)
{
  return sub_25B3A6808(a1, &qword_26A4FB4F0, &qword_26A4FB4F8, sub_25B3B2588);
}

unint64_t sub_25B3A6808(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_25B3DD278();
  uint64_t v8 = (void *)v7;
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
    sub_25B3A9600(v11, (uint64_t)v18, a3);
    char v12 = v18[0];
    unint64_t result = a4(v18[0]);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v8[6] + result) = v12;
    unint64_t result = sub_25B3A95E8(&v19, v8[7] + 40 * result);
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
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

unint64_t sub_25B3A6944(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB480);
  uint64_t v2 = sub_25B3DD278();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25B3A9600(v6, (uint64_t)&v15, &qword_26A4FB488);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25B3B2324(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25B3A90B0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_25B3A6A7C(uint64_t *a1)
{
  return sub_25B3A6AD4(a1, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t (*)(uint64_t))sub_25B3D8918, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_25B3C69D4);
}

uint64_t sub_25B3A6AD4(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), void (*a5)(unint64_t *, unint64_t *, unint64_t *))
{
  uint64_t v9 = *(void *)(a2(0) - 8);
  uint64_t v10 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = a3(v10);
  }
  uint64_t v11 = *(void *)(v10 + 16);
  v13[0] = v10 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  v13[1] = v11;
  uint64_t result = sub_25B3A6BB0(v13, a4, a4, a5);
  *a1 = v10;
  return result;
}

uint64_t sub_25B3A6BB0(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void), void (*a4)(unint64_t *, unint64_t *, unint64_t *))
{
  v153 = a4;
  uint64_t v6 = v4;
  uint64_t v8 = a2(0);
  uint64_t v154 = *(void *)(v8 - 8);
  uint64_t v155 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v150 = (uint64_t)&v144 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v162 = (uint64_t)&v144 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v159 = (uint64_t)&v144 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v158 = (uint64_t)&v144 - v15;
  uint64_t v16 = a1[1];
  uint64_t result = sub_25B3DD308();
  if (result >= v16)
  {
    if (v16 < 0) {
      goto LABEL_139;
    }
    if (v16) {
      return sub_25B3A83B8(0, v16, 1, a1, a3, a3);
    }
    return result;
  }
  if (v16 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 + 1;
  }
  if (v16 < -1) {
    goto LABEL_147;
  }
  v164 = a3;
  uint64_t v146 = result;
  if (v16 < 2)
  {
    uint64_t v22 = (char *)MEMORY[0x263F8EE78];
    unint64_t v152 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80));
    uint64_t v145 = MEMORY[0x263F8EE78];
    if (v16 != 1)
    {
      unint64_t v24 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      v134 = v22;
      if (v24 >= 2)
      {
        uint64_t v135 = *a1;
        do
        {
          unint64_t v136 = v24 - 2;
          if (v24 < 2) {
            goto LABEL_134;
          }
          if (!v135) {
            goto LABEL_146;
          }
          v137 = v134;
          uint64_t v138 = *(void *)&v134[16 * v136 + 32];
          uint64_t v139 = *(void *)&v134[16 * v24 + 24];
          sub_25B3A864C(v135 + *(void *)(v154 + 72) * v138, v135 + *(void *)(v154 + 72) * *(void *)&v134[16 * v24 + 16], v135 + *(void *)(v154 + 72) * v139, v152, v164, v164, v153);
          if (v6) {
            break;
          }
          if (v139 < v138) {
            goto LABEL_135;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v137 = sub_25B3C6C04((uint64_t)v137);
          }
          if (v136 >= *((void *)v137 + 2)) {
            goto LABEL_136;
          }
          v140 = v137 + 32;
          v141 = &v137[16 * v136 + 32];
          *(void *)v141 = v138;
          *((void *)v141 + 1) = v139;
          v142 = v137;
          unint64_t v143 = *((void *)v137 + 2);
          if (v24 > v143) {
            goto LABEL_137;
          }
          memmove(&v140[16 * v24 - 16], &v140[16 * v24], 16 * (v143 - v24));
          v134 = v142;
          *((void *)v142 + 2) = v143 - 1;
          unint64_t v24 = v143 - 1;
        }
        while (v143 > 2);
      }
LABEL_103:
      swift_bridgeObjectRelease();
      *(void *)(v145 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v19 = v18 >> 1;
    uint64_t v20 = sub_25B3DCEC8();
    *(void *)(v20 + 16) = v19;
    uint64_t v21 = *(unsigned __int8 *)(v154 + 80);
    uint64_t v145 = v20;
    unint64_t v152 = v20 + ((v21 + 32) & ~v21);
  }
  uint64_t v23 = 0;
  uint64_t v22 = (char *)MEMORY[0x263F8EE78];
  v160 = a1;
  while (1)
  {
    uint64_t v25 = v23 + 1;
    uint64_t v151 = v23;
    if (v23 + 1 >= v16)
    {
      uint64_t v39 = v23;
      uint64_t v40 = v23 + 1;
    }
    else
    {
      uint64_t v157 = *a1;
      uint64_t v26 = v157;
      uint64_t v27 = *(void *)(v154 + 72);
      uint64_t v163 = v27;
      unint64_t v28 = a3;
      uint64_t v29 = v158;
      sub_25B3A9664(v157 + v27 * v25, v158, v28);
      uint64_t v30 = v26 + v27 * v151;
      uint64_t v31 = v159;
      sub_25B3A9664(v30, v159, v28);
      sub_25B3DCC68();
      double v33 = v32;
      sub_25B3DCC68();
      double v35 = v34;
      uint64_t v36 = v31;
      uint64_t v37 = v157;
      sub_25B3A96CC(v36, v28);
      uint64_t v38 = v29;
      a3 = v28;
      uint64_t v39 = v151;
      sub_25B3A96CC(v38, a3);
      uint64_t v40 = v39 + 2;
      if (v39 + 2 < v16)
      {
        v147 = v22;
        uint64_t v148 = v6;
        uint64_t v161 = v163 * v25;
        uint64_t v41 = v163 * v40;
        while (1)
        {
          uint64_t v42 = v16;
          uint64_t v43 = v40;
          uint64_t v44 = v158;
          objc_super v45 = v164;
          sub_25B3A9664(v37 + v41, v158, v164);
          uint64_t v46 = v159;
          sub_25B3A9664(v37 + v161, v159, v45);
          sub_25B3DCC68();
          double v48 = v47;
          sub_25B3DCC68();
          BOOL v50 = v48 >= v49;
          sub_25B3A96CC(v46, v45);
          sub_25B3A96CC(v44, v45);
          if (v33 < v35 == v50) {
            break;
          }
          uint64_t v40 = v43 + 1;
          v37 += v163;
          uint64_t v16 = v42;
          if (v42 == v43 + 1)
          {
            uint64_t v40 = v42;
            a3 = v164;
            a1 = v160;
            uint64_t v22 = v147;
            uint64_t v39 = v151;
            goto LABEL_23;
          }
        }
        a3 = v164;
        a1 = v160;
        uint64_t v22 = v147;
        uint64_t v40 = v43;
        uint64_t v39 = v151;
        uint64_t v16 = v42;
LABEL_23:
        uint64_t v6 = v148;
      }
      if (v33 < v35)
      {
        if (v40 < v39) {
          goto LABEL_140;
        }
        if (v39 < v40)
        {
          uint64_t v156 = v16;
          v147 = v22;
          uint64_t v148 = v6;
          uint64_t v51 = 0;
          uint64_t v52 = v163;
          uint64_t v53 = v163 * (v40 - 1);
          uint64_t v54 = v39;
          uint64_t v55 = v40 * v163;
          uint64_t v56 = v54;
          uint64_t v57 = v54 * v163;
          uint64_t v161 = v40;
          do
          {
            if (v56 != v40 + v51 - 1)
            {
              uint64_t v58 = v157;
              if (!v157) {
                goto LABEL_145;
              }
              unint64_t v59 = v157 + v57;
              uint64_t v60 = v157 + v53;
              sub_25B3A972C(v157 + v57, v150, v164);
              if (v57 < v53 || v59 >= v58 + v55)
              {
                swift_arrayInitWithTakeFrontToBack();
                uint64_t v52 = v163;
              }
              else
              {
                uint64_t v52 = v163;
                if (v57 != v53) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              a3 = v164;
              sub_25B3A972C(v150, v60, v164);
              uint64_t v40 = v161;
            }
            ++v56;
            --v51;
            v53 -= v52;
            v55 -= v52;
            v57 += v52;
          }
          while (v56 < v40 + v51);
          uint64_t v22 = v147;
          uint64_t v6 = v148;
          uint64_t v39 = v151;
          uint64_t v16 = v156;
        }
      }
    }
    if (v40 < v16)
    {
      if (__OFSUB__(v40, v39)) {
        goto LABEL_138;
      }
      if (v40 - v39 < v146) {
        break;
      }
    }
LABEL_56:
    if (v40 < v39) {
      goto LABEL_133;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v161 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v22 = sub_25B3C68D8(0, *((void *)v22 + 2) + 1, 1, v22);
    }
    unint64_t v83 = *((void *)v22 + 2);
    unint64_t v82 = *((void *)v22 + 3);
    unint64_t v24 = v83 + 1;
    if (v83 >= v82 >> 1) {
      uint64_t v22 = sub_25B3C68D8((char *)(v82 > 1), v83 + 1, 1, v22);
    }
    *((void *)v22 + 2) = v24;
    v84 = v22 + 32;
    v85 = &v22[16 * v83 + 32];
    uint64_t v86 = v161;
    *(void *)v85 = v39;
    *((void *)v85 + 1) = v86;
    if (v83)
    {
      while (1)
      {
        unint64_t v87 = v24 - 1;
        if (v24 >= 4)
        {
          v92 = &v84[16 * v24];
          uint64_t v93 = *((void *)v92 - 8);
          uint64_t v94 = *((void *)v92 - 7);
          BOOL v98 = __OFSUB__(v94, v93);
          uint64_t v95 = v94 - v93;
          if (v98) {
            goto LABEL_122;
          }
          uint64_t v97 = *((void *)v92 - 6);
          uint64_t v96 = *((void *)v92 - 5);
          BOOL v98 = __OFSUB__(v96, v97);
          uint64_t v90 = v96 - v97;
          char v91 = v98;
          if (v98) {
            goto LABEL_123;
          }
          unint64_t v99 = v24 - 2;
          v100 = &v84[16 * v24 - 32];
          uint64_t v102 = *(void *)v100;
          uint64_t v101 = *((void *)v100 + 1);
          BOOL v98 = __OFSUB__(v101, v102);
          uint64_t v103 = v101 - v102;
          if (v98) {
            goto LABEL_125;
          }
          BOOL v98 = __OFADD__(v90, v103);
          uint64_t v104 = v90 + v103;
          if (v98) {
            goto LABEL_128;
          }
          if (v104 >= v95)
          {
            v122 = &v84[16 * v87];
            uint64_t v124 = *(void *)v122;
            uint64_t v123 = *((void *)v122 + 1);
            BOOL v98 = __OFSUB__(v123, v124);
            uint64_t v125 = v123 - v124;
            if (v98) {
              goto LABEL_132;
            }
            BOOL v115 = v90 < v125;
            goto LABEL_93;
          }
        }
        else
        {
          if (v24 != 3)
          {
            uint64_t v116 = *((void *)v22 + 4);
            uint64_t v117 = *((void *)v22 + 5);
            BOOL v98 = __OFSUB__(v117, v116);
            uint64_t v109 = v117 - v116;
            char v110 = v98;
            goto LABEL_87;
          }
          uint64_t v89 = *((void *)v22 + 4);
          uint64_t v88 = *((void *)v22 + 5);
          BOOL v98 = __OFSUB__(v88, v89);
          uint64_t v90 = v88 - v89;
          char v91 = v98;
        }
        if (v91) {
          goto LABEL_124;
        }
        unint64_t v99 = v24 - 2;
        v105 = &v84[16 * v24 - 32];
        uint64_t v107 = *(void *)v105;
        uint64_t v106 = *((void *)v105 + 1);
        BOOL v108 = __OFSUB__(v106, v107);
        uint64_t v109 = v106 - v107;
        char v110 = v108;
        if (v108) {
          goto LABEL_127;
        }
        v111 = &v84[16 * v87];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v98 = __OFSUB__(v112, v113);
        uint64_t v114 = v112 - v113;
        if (v98) {
          goto LABEL_130;
        }
        if (__OFADD__(v109, v114)) {
          goto LABEL_131;
        }
        if (v109 + v114 >= v90)
        {
          BOOL v115 = v90 < v114;
LABEL_93:
          if (v115) {
            unint64_t v87 = v99;
          }
          goto LABEL_95;
        }
LABEL_87:
        if (v110) {
          goto LABEL_126;
        }
        v118 = &v84[16 * v87];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v98 = __OFSUB__(v119, v120);
        uint64_t v121 = v119 - v120;
        if (v98) {
          goto LABEL_129;
        }
        if (v121 < v109) {
          goto LABEL_14;
        }
LABEL_95:
        unint64_t v126 = v87 - 1;
        if (v87 - 1 >= v24)
        {
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
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
          goto LABEL_142;
        }
        uint64_t v127 = *a1;
        if (!*a1) {
          goto LABEL_144;
        }
        v128 = v22;
        v129 = &v84[16 * v126];
        uint64_t v130 = *(void *)v129;
        v131 = &v84[16 * v87];
        uint64_t v132 = *((void *)v131 + 1);
        sub_25B3A864C(v127 + *(void *)(v154 + 72) * *(void *)v129, v127 + *(void *)(v154 + 72) * *(void *)v131, v127 + *(void *)(v154 + 72) * v132, v152, v164, v164, v153);
        if (v6) {
          goto LABEL_103;
        }
        if (v132 < v130) {
          goto LABEL_119;
        }
        if (v87 > *((void *)v128 + 2)) {
          goto LABEL_120;
        }
        *(void *)v129 = v130;
        *(void *)&v84[16 * v126 + 8] = v132;
        unint64_t v133 = *((void *)v128 + 2);
        if (v87 >= v133) {
          goto LABEL_121;
        }
        uint64_t v22 = v128;
        unint64_t v24 = v133 - 1;
        memmove(&v84[16 * v87], v131 + 16, 16 * (v133 - 1 - v87));
        *((void *)v128 + 2) = v133 - 1;
        a3 = v164;
        a1 = v160;
        if (v133 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v24 = 1;
LABEL_14:
    uint64_t v16 = a1[1];
    uint64_t v23 = v161;
    if (v161 >= v16) {
      goto LABEL_106;
    }
  }
  if (__OFADD__(v39, v146)) {
    goto LABEL_141;
  }
  if (v39 + v146 >= v16) {
    uint64_t v61 = v16;
  }
  else {
    uint64_t v61 = v39 + v146;
  }
  if (v61 >= v39)
  {
    if (v40 != v61)
    {
      v147 = v22;
      uint64_t v148 = v6;
      uint64_t v62 = *(void *)(v154 + 72);
      uint64_t v63 = v62 * (v40 - 1);
      uint64_t v156 = v62;
      uint64_t v64 = v40 * v62;
      uint64_t v149 = v61;
      do
      {
        uint64_t v66 = 0;
        uint64_t v161 = v40;
        uint64_t v157 = v64;
        while (1)
        {
          uint64_t v163 = v39;
          uint64_t v67 = *a1;
          uint64_t v68 = v64 + v66 + *a1;
          uint64_t v69 = v158;
          sub_25B3A9664(v68, v158, a3);
          uint64_t v70 = v63;
          uint64_t v71 = v63 + v66 + v67;
          v72 = a3;
          uint64_t v73 = v159;
          sub_25B3A9664(v71, v159, v72);
          sub_25B3DCC68();
          double v75 = v74;
          sub_25B3DCC68();
          double v77 = v76;
          uint64_t v78 = v73;
          a3 = v72;
          sub_25B3A96CC(v78, v72);
          sub_25B3A96CC(v69, v72);
          if (v75 >= v77) {
            break;
          }
          uint64_t v79 = *a1;
          if (!*a1) {
            goto LABEL_143;
          }
          uint64_t v64 = v157;
          uint64_t v63 = v70;
          uint64_t v80 = v79 + v70 + v66;
          sub_25B3A972C(v79 + v157 + v66, v162, v164);
          swift_arrayInitWithTakeFrontToBack();
          a3 = v164;
          sub_25B3A972C(v162, v80, v164);
          v66 -= v156;
          uint64_t v39 = v163 + 1;
          a1 = v160;
          uint64_t v65 = v161;
          if (v161 == v163 + 1) {
            goto LABEL_49;
          }
        }
        uint64_t v65 = v161;
        uint64_t v63 = v70;
        uint64_t v64 = v157;
LABEL_49:
        uint64_t v40 = v65 + 1;
        v63 += v156;
        v64 += v156;
        uint64_t v39 = v151;
      }
      while (v40 != v149);
      uint64_t v40 = v149;
      uint64_t v22 = v147;
      uint64_t v6 = v148;
    }
    goto LABEL_56;
  }
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
  uint64_t result = sub_25B3DD228();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AppSuggestionsJointEvent(uint64_t a1)
{
  return sub_25B3A7650(a1, (uint64_t *)&unk_26A4FB440);
}

uint64_t sub_25B3A7650(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25B3A7688(uint64_t a1)
{
  uint64_t result = sub_25B3A2B0C(&qword_26A4FB420, (void (*)(uint64_t))type metadata accessor for AppSuggestionInferenceEventTimestamped);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25B3A76E0()
{
  return sub_25B3A2B0C(&qword_26A4FB428, (void (*)(uint64_t))type metadata accessor for AppSuggestionInferenceEventTimestamped);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppSuggestionInferenceEventTimestamped(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25B3DCC98();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B3DCC98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B3A7A88);
}

uint64_t sub_25B3A7A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
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

uint64_t storeEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B3A7B5C);
}

uint64_t sub_25B3A7B5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25B3DCC98();
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

uint64_t sub_25B3A7C18()
{
  uint64_t result = sub_25B3DCC98();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppSuggestionsJoiningResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppSuggestionsJoiningResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppSuggestionsJoiningResult(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppSuggestionsJoiningResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for AppSuggestionsJoiningResult(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSuggestionsJoiningResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSuggestionsJoiningResult(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSuggestionsJoiningResult()
{
  return &type metadata for AppSuggestionsJoiningResult;
}

uint64_t sub_25B3A7F14()
{
  return type metadata accessor for AppSuggestionsJointEvent(0);
}

uint64_t sub_25B3A7F1C()
{
  uint64_t result = sub_25B3DCC98();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AppSuggestionsJointEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSuggestionsJointEvent);
}

uint64_t type metadata accessor for AppSuggestionEventsHandler()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3A8170);
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

uint64_t sub_25B3A8198(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25B3A81A4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppSuggestionInferenceEventTimestamped.CodingKeys()
{
  return &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys;
}

unint64_t sub_25B3A81C4()
{
  unint64_t result = qword_26A4FB450;
  if (!qword_26A4FB450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB450);
  }
  return result;
}

unint64_t sub_25B3A821C()
{
  unint64_t result = qword_26A4FB458;
  if (!qword_26A4FB458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB458);
  }
  return result;
}

unint64_t sub_25B3A8274()
{
  unint64_t result = qword_26A4FB460;
  if (!qword_26A4FB460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB460);
  }
  return result;
}

void *sub_25B3A82CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B346850);
  int v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unsigned int v6 = sub_25B3A8D68(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25B3A90C0();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25B3A83B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v31 = a1;
  uint64_t v32 = a5(0);
  uint64_t v10 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v33 = (uint64_t)&v29 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  long long v17 = (char *)&v29 - v16;
  uint64_t v35 = a3;
  uint64_t v30 = a2;
  if (a3 != a2)
  {
    uint64_t v18 = *(void *)(v15 + 72);
    uint64_t v38 = v18 * (v35 - 1);
    uint64_t v34 = v18;
    uint64_t v37 = v18 * v35;
LABEL_5:
    uint64_t v19 = 0;
    uint64_t v20 = v31;
    while (1)
    {
      uint64_t v21 = *a4;
      sub_25B3A9664(v37 + v19 + *a4, (uint64_t)v17, a6);
      uint64_t v22 = v33;
      sub_25B3A9664(v38 + v19 + v21, v33, a6);
      sub_25B3DCC68();
      double v24 = v23;
      sub_25B3DCC68();
      double v26 = v25;
      sub_25B3A96CC(v22, a6);
      uint64_t result = sub_25B3A96CC((uint64_t)v17, a6);
      if (v24 >= v26)
      {
LABEL_4:
        v38 += v34;
        v37 += v34;
        if (++v35 == v30) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v27 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v28 = v27 + v38 + v19;
      sub_25B3A972C(v27 + v37 + v19, v36, a6);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_25B3A972C(v36, v28, a6);
      v19 -= v34;
      if (v35 == ++v20) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25B3A864C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), void (*a7)(unint64_t *, unint64_t *, unint64_t *))
{
  unint64_t v59 = a6;
  uint64_t v58 = a5(0);
  uint64_t v12 = MEMORY[0x270FA5388](v58);
  uint64_t v60 = (uint64_t)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v17 = *(void *)(v16 + 72);
  if (!v17)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_62;
  }
  int64_t v18 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_63;
  }
  uint64_t v19 = (uint64_t)(a2 - a1) / v17;
  unint64_t v63 = a1;
  unint64_t v62 = a4;
  uint64_t v20 = v18 / v17;
  uint64_t v55 = a7;
  if (v19 >= v18 / v17)
  {
    if ((v20 & 0x8000000000000000) == 0)
    {
      uint64_t v22 = v20 * v17;
      if (a4 < a2 || a2 + v22 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v35 = a4 + v22;
      unint64_t v61 = a4 + v22;
      unint64_t v63 = a2;
      if (v22 >= 1 && a1 < a2)
      {
        uint64_t v37 = -v17;
        unint64_t v56 = a1;
        unint64_t v57 = a4;
        do
        {
          unint64_t v38 = a3 + v37;
          uint64_t v39 = v59;
          sub_25B3A9664(v35 + v37, (uint64_t)v15, v59);
          unint64_t v40 = a2 + v37;
          unint64_t v41 = a3;
          uint64_t v42 = (uint64_t)v15;
          uint64_t v43 = v60;
          sub_25B3A9664(a2 + v37, v60, v39);
          sub_25B3DCC68();
          double v45 = v44;
          sub_25B3DCC68();
          double v47 = v46;
          uint64_t v48 = v43;
          uint64_t v15 = (char *)v42;
          sub_25B3A96CC(v48, v39);
          sub_25B3A96CC(v42, v39);
          if (v45 >= v47)
          {
            unint64_t v52 = v61;
            v61 += v37;
            if (v41 < v52 || v38 >= v52)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v40 = a2;
              unint64_t v51 = v56;
              unint64_t v50 = v57;
            }
            else
            {
              unint64_t v50 = v57;
              if (v41 != v52) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v40 = a2;
              unint64_t v51 = v56;
            }
          }
          else
          {
            if (v41 < a2 || v38 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v51 = v56;
              unint64_t v50 = v57;
            }
            else
            {
              BOOL v49 = v41 == a2;
              unint64_t v51 = v56;
              unint64_t v50 = v57;
              if (!v49) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v63 += v37;
          }
          unint64_t v35 = v61;
          if (v61 <= v50) {
            break;
          }
          a2 = v40;
          a3 = v38;
        }
        while (v40 > v51);
      }
      goto LABEL_60;
    }
  }
  else if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = v19 * v17;
    if (a4 < a1 || a1 + v21 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v23 = a4 + v21;
    unint64_t v61 = a4 + v21;
    if (v21 >= 1 && a2 < a3)
    {
      double v25 = v59;
      do
      {
        sub_25B3A9664(a2, (uint64_t)v15, v25);
        uint64_t v26 = a4;
        uint64_t v27 = v60;
        sub_25B3A9664(v26, v60, v25);
        sub_25B3DCC68();
        double v29 = v28;
        sub_25B3DCC68();
        double v31 = v30;
        sub_25B3A96CC(v27, v25);
        sub_25B3A96CC((uint64_t)v15, v25);
        unint64_t v32 = v63;
        if (v29 >= v31)
        {
          unint64_t v34 = v62 + v17;
          if (v63 < v62 || v63 >= v34)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v63 != v62)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v62 = v34;
          unint64_t v33 = a2;
        }
        else
        {
          unint64_t v33 = a2 + v17;
          if (v63 < a2 || v63 >= v33)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v63 == a2)
          {
            unint64_t v32 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v63 = v32 + v17;
        a4 = v62;
        if (v62 >= v23) {
          break;
        }
        a2 = v33;
      }
      while (v33 < a3);
    }
LABEL_60:
    v55(&v63, &v62, &v61);
    return 1;
  }
LABEL_64:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3A8B44(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25B3DD248();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25B3DD248();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25B3A90CC(&qword_26A4FB470, &qword_26A4FB468);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB468);
          uint64_t v12 = sub_25B3D8AC0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

void *sub_25B3A8D68(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
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
  uint64_t v11 = a2;
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
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
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

uint64_t sub_25B3A8F64(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E657665 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25B3A9070()
{
  unint64_t result = qword_26B346798;
  if (!qword_26B346798)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B346798);
  }
  return result;
}

_OWORD *sub_25B3A90B0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25B3A90C0()
{
  return swift_release();
}

uint64_t sub_25B3A90CC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25B3A9110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D8);
  BOOL v3 = (void *)sub_25B3DD278();
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  unint64_t result = sub_25B3B251C(v4);
  if (v9)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v10 = (void *)(a1 + 88);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v4;
    uint64_t v11 = (void *)(v3[7] + 24 * result);
    *uint64_t v11 = v5;
    v11[1] = v7;
    v11[2] = v6;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      break;
    }
    v3[2] = v14;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v15 = v10 + 4;
    unsigned __int8 v4 = *((unsigned char *)v10 - 24);
    uint64_t v5 = *(v10 - 2);
    uint64_t v7 = *(v10 - 1);
    uint64_t v16 = *v10;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25B3B251C(v4);
    uint64_t v10 = v15;
    uint64_t v6 = v16;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25B3A9238(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D0);
    BOOL v3 = (void *)sub_25B3DD278();
    for (unint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_25B3B246C(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_25B3A9310()
{
  swift_unknownObjectRetain();
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  if (v0)
  {
    swift_unknownObjectRetain();
    self;
    uint64_t v1 = swift_dynamicCastObjCClass();
    if (v1)
    {
      long long v2 = (void *)v1;
      objc_msgSend(v0, sel_timestamp);
      double v4 = v3;
      objc_msgSend(v2, sel_timestamp);
      double v6 = v5;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v4 <= v6) {
        return 1;
      }
      else {
        return -1;
      }
    }
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25B3DCD98();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B346958);
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain_n();
  uint64_t v9 = sub_25B3DCD78();
  os_log_type_t v10 = sub_25B3DCF68();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v7 = -1;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_getObjectType();
    uint64_t v13 = sub_25B3DD458();
    sub_25B3B1CCC(v13, v14, &v18);
    sub_25B3DD018();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_getObjectType();
    uint64_t v15 = sub_25B3DD458();
    sub_25B3B1CCC(v15, v16, &v18);
    sub_25B3DD018();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B39F000, v9, v10, "unexpected types: a: %s; b: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261163250](v12, -1, -1);
    MEMORY[0x261163250](v11, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease_n();
    return -1;
  }
  return v7;
}

uint64_t sub_25B3A95E8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25B3A9600(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B3A9664(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B3A96CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25B3A972C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_25B3A9794()
{
  unint64_t result = qword_26A4FB508;
  if (!qword_26A4FB508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB508);
  }
  return result;
}

uint64_t sub_25B3A97F8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25B3A9854()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25B3A9894()
{
  sub_25B3A9854();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for GreedyKeyedEventCombiner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for GreedyKeyedEventCombiner);
}

uint64_t sub_25B3A98E0()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_25B3DCDD8();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    uint64_t v3 = (void *)sub_25B3DCDD8();
    uint64_t v4 = (uint64_t)objc_msgSend(v2, sel_BOOLForKey_, v3);
  }
  else
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25B3DCD98();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B346958);
    double v6 = sub_25B3DCD78();
    os_log_type_t v7 = sub_25B3DCF68();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v4 = 2;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25B39F000, v6, v7, "unable to read sharing user defaults", v8, 2u);
      MEMORY[0x261163250](v8, -1, -1);
    }
    else
    {

      return 2;
    }
  }
  return v4;
}

BOOL sub_25B3A9A64()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB600);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25B3DCC98();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  os_log_type_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v21 - v8;
  if (objc_msgSend(self, sel_getUserDataDisposition) == 2) {
    return 0;
  }
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_standardUserDefaults);
  uint64_t v13 = (void *)sub_25B3DCDD8();
  id v14 = objc_msgSend(v12, sel_objectForKey_, v13);

  if (v14)
  {
    sub_25B3DD038();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_25B3A9DEC((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    int v15 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, v15 ^ 1u, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
      sub_25B3DCC58();
      double v17 = v16;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      return v17 > -1209600.0;
    }
  }
  else
  {
    sub_25B3A9E54((uint64_t)v22, &qword_26B3467B8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_25B3A9E54((uint64_t)v2, &qword_26A4FB600);
  id v18 = objc_msgSend(v11, sel_standardUserDefaults);
  sub_25B3DCC78();
  int64_t v19 = (void *)sub_25B3DCC48();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  uint64_t v20 = (void *)sub_25B3DCDD8();
  objc_msgSend(v18, sel_setValue_forKey_, v19, v20);

  return 1;
}

uint64_t sub_25B3A9DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3A9E54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t static Logging.subsystem.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_25B3A9ECC(uint64_t a1)
{
  return sub_25B3A9F0C(a1, qword_26B346958);
}

uint64_t sub_25B3A9EEC(uint64_t a1)
{
  return sub_25B3A9F0C(a1, qword_26A4FB608);
}

uint64_t sub_25B3A9F0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25B3DCD98();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25B3DCD88();
}

uint64_t static Logging.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A4FB1B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25B3DCD98();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A4FB608);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
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

uint64_t sub_25B3AA0A0(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of static MetricsManager.record(inference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of static MetricsManager.record(feedback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

BOOL static TimestampedEvent.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v20[1] = a2;
  uint64_t v6 = sub_25B3DCC98();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)v20 - v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v13(a3, a4);
  sub_25B3DCC68();
  double v15 = v14;
  double v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  v13(a3, a4);
  sub_25B3DCC68();
  double v18 = v17;
  v16(v10, v6);
  return v15 < v18;
}

BOOL static TimestampedEvent.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v20[1] = a2;
  uint64_t v6 = sub_25B3DCC98();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)v20 - v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v13(a3, a4);
  sub_25B3DCC68();
  double v15 = v14;
  double v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  v13(a3, a4);
  sub_25B3DCC68();
  double v18 = v17;
  v16(v10, v6);
  return v15 == v18;
}

uint64_t sub_25B3AA414(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_25B3A95E8((long long *)a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    uint64_t v5 = v14;
    uint64_t v6 = v15;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
    MEMORY[0x270FA5388](v7);
    uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(unsigned char *))(v10 + 16))(v9);
    sub_25B3B9164((uint64_t)v9, a2, isUniquelyReferenced_nonNull_native, &v12, v5, v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    *uint64_t v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25B3A9E54(a1, &qword_26A4FB690);
    sub_25B3D7974(a2, (uint64_t)v13);
    return sub_25B3A9E54((uint64_t)v13, &qword_26A4FB690);
  }
}

uint64_t static PeopleSuggesterMetricsCollector.sendMetrics()()
{
  uint64_t v1 = sub_25B3AA7C4();
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25B3DCD98();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B346958);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25B3DCD78();
  os_log_type_t v4 = sub_25B3DCF58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    sub_25B3DD018();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B39F000, v3, v4, "sending %ld events", v5, 0xCu);
    MEMORY[0x261163250](v5, -1, -1);

    uint64_t v6 = *(void *)(v1 + 16);
    if (!v6) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v6 = *(void *)(v1 + 16);
    if (!v6) {
      return swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25B3DCEE8();
    if (v0) {
      break;
    }
    ++v7;
    uint64_t v9 = (void *)MEMORY[0x261162BF0](v8);
    uint64_t v10 = (void *)sub_25B3DCDD8();
    sub_25B3BD648(0, &qword_26A4FB620);
    uint64_t v11 = (void *)sub_25B3DCDA8();
    AnalyticsSendEvent();

    swift_bridgeObjectRelease();
    if (v6 == v7) {
      return swift_bridgeObjectRelease_n();
    }
  }
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B3AA7C4()
{
  static PeopleSuggesterMetricsCollector.getMetrics()(&v47);
  uint64_t v0 = v47;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v46 = MEMORY[0x263F8EE78];
    sub_25B3B7B90(0, v1, 0);
    uint64_t v2 = 0;
    uint64_t v38 = v46;
    int64_t v35 = v1;
    while (1)
    {
      uint64_t v37 = v2;
      uint64_t v36 = swift_bridgeObjectRetain();
      uint64_t v3 = sub_25B3AB85C(v36);
      int64_t v4 = *(void *)(v3 + 16);
      if (v4) {
        break;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(MEMORY[0x263F8EE78] + 16)) {
        goto LABEL_26;
      }
LABEL_28:
      uint64_t v28 = MEMORY[0x263F8EE80];
LABEL_29:
      uint64_t v45 = v28;
      double v29 = (void *)swift_bridgeObjectRetain();
      sub_25B3B7724(v29, 1, &v45);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v30 = v45;
      uint64_t v31 = v38;
      uint64_t v46 = v38;
      unint64_t v33 = *(void *)(v38 + 16);
      unint64_t v32 = *(void *)(v38 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_25B3B7B90(v32 > 1, v33 + 1, 1);
        uint64_t v31 = v46;
      }
      uint64_t v2 = v37 + 1;
      *(void *)(v31 + 16) = v33 + 1;
      uint64_t v38 = v31;
      *(void *)(v31 + 8 * v33 + 32) = v30;
      if (v37 + 1 == v1)
      {
        swift_bridgeObjectRelease();
        return v38;
      }
    }
    uint64_t v45 = MEMORY[0x263F8EE78];
    sub_25B3B7BC0(0, v4, 0);
    uint64_t v5 = v45;
    uint64_t v6 = sub_25B3D8BF8(v3);
    int v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = v3 + 64;
    char v11 = *(unsigned char *)(v3 + 32);
    int v39 = v7;
    int64_t v40 = v4;
    uint64_t v41 = v3 + 64;
    while (1)
    {
      if (v6 < 0 || v6 >= 1 << v11)
      {
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
        uint64_t result = swift_unexpectedError();
        __break(1u);
        return result;
      }
      unint64_t v15 = (unint64_t)v6 >> 6;
      if ((*(void *)(v10 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(v3 + 36) != v8) {
        goto LABEL_36;
      }
      uint64_t v42 = v9;
      double v16 = *(void **)(*(void *)(v3 + 56) + 8 * v6);
      unint64_t v17 = PeopleSuggesterMetricsField.rawValue.getter();
      uint64_t v43 = v18;
      unint64_t v44 = v17;
      uint64_t v45 = v5;
      unint64_t v20 = *(void *)(v5 + 16);
      unint64_t v19 = *(void *)(v5 + 24);
      id v21 = v16;
      if (v20 >= v19 >> 1)
      {
        sub_25B3B7BC0(v19 > 1, v20 + 1, 1);
        uint64_t v5 = v45;
      }
      *(void *)(v5 + 16) = v20 + 1;
      uint64_t v22 = (void *)(v5 + 24 * v20);
      v22[4] = v44;
      v22[5] = v43;
      v22[6] = v21;
      char v11 = *(unsigned char *)(v3 + 32);
      unint64_t v12 = 1 << v11;
      if (v6 >= 1 << v11) {
        goto LABEL_37;
      }
      uint64_t v10 = v3 + 64;
      uint64_t v23 = *(void *)(v41 + 8 * v15);
      if ((v23 & (1 << v6)) == 0) {
        goto LABEL_38;
      }
      if (*(_DWORD *)(v3 + 36) != v8) {
        goto LABEL_39;
      }
      unint64_t v24 = v23 & (-2 << (v6 & 0x3F));
      if (v24)
      {
        unint64_t v12 = __clz(__rbit64(v24)) | v6 & 0xFFFFFFFFFFFFFFC0;
        int64_t v13 = v40;
        uint64_t v14 = v42;
      }
      else
      {
        unint64_t v25 = v15 + 1;
        unint64_t v26 = (v12 + 63) >> 6;
        int64_t v13 = v40;
        uint64_t v14 = v42;
        if (v15 + 1 < v26)
        {
          unint64_t v27 = *(void *)(v41 + 8 * v25);
          if (!v27)
          {
            unint64_t v25 = v15 + 2;
            if (v15 + 2 >= v26) {
              goto LABEL_6;
            }
            unint64_t v27 = *(void *)(v41 + 8 * v25);
            if (!v27)
            {
              while (v26 - 3 != v15)
              {
                unint64_t v27 = *(void *)(v3 + 88 + 8 * v15++);
                if (v27)
                {
                  unint64_t v25 = v15 + 2;
                  goto LABEL_19;
                }
              }
              goto LABEL_6;
            }
          }
LABEL_19:
          unint64_t v12 = __clz(__rbit64(v27)) + (v25 << 6);
        }
      }
LABEL_6:
      uint64_t v9 = v14 + 1;
      int v8 = v39;
      uint64_t v6 = v12;
      if (v9 == v13)
      {
        swift_bridgeObjectRelease();
        int64_t v1 = v35;
        if (!*(void *)(v5 + 16)) {
          goto LABEL_28;
        }
LABEL_26:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6C8);
        uint64_t v28 = sub_25B3DD278();
        goto LABEL_29;
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t static PeopleSuggesterMetricsCollector.sendShadowEvaluationMetrics(_:)(unint64_t a1)
{
  uint64_t v21 = _s15ReportingPlugin31PeopleSuggesterMetricsCollectorV019getShadowEvaluationE0ySaySDySSSo8NSObjectCGGSayAA0C21SuggestionsJointEventCGFZ_0(a1);
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25B3DCD98();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B346958);
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25B3DCD78();
  os_log_type_t v3 = sub_25B3DCF58();
  if (os_log_type_enabled(v2, v3))
  {
    int64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v4 = 134217984;
    uint64_t v23 = *(void *)(v21 + 16);
    sub_25B3DD018();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B39F000, v2, v3, "sending (%ld events", v4, 0xCu);
    MEMORY[0x261163250](v4, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v20 = *(void *)(v21 + 16);
  if (v20)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v6 = MEMORY[0x263F8D310];
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_25B3DCEE8();
      if (v22) {
        break;
      }
      swift_bridgeObjectRetain_n();
      unint64_t v12 = sub_25B3DCD78();
      os_log_type_t v13 = sub_25B3DCF58();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        uint64_t v23 = v19;
        *(_DWORD *)uint64_t v14 = 136315138;
        sub_25B3BD648(0, &qword_26A4FB620);
        swift_bridgeObjectRetain();
        uint64_t v8 = v6;
        uint64_t v15 = sub_25B3DCDB8();
        unint64_t v17 = v16;
        swift_bridgeObjectRelease();
        *(void *)(v14 + 4) = sub_25B3B1CCC(v15, v17, &v23);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25B39F000, v12, v13, "In production I'd be sending:\n %s", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261163250](v19, -1, -1);
        MEMORY[0x261163250](v14, -1, -1);
      }
      else
      {

        uint64_t v7 = swift_bridgeObjectRelease_n();
        uint64_t v8 = v6;
      }
      ++v5;
      uint64_t v9 = (void *)MEMORY[0x261162BF0](v7);
      uint64_t v10 = (void *)sub_25B3DCDD8();
      sub_25B3BD648(0, &qword_26A4FB620);
      char v11 = (void *)sub_25B3DCDA8();
      AnalyticsSendEvent();

      swift_bridgeObjectRelease();
      uint64_t v6 = v8;
      if (v20 == v5) {
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
  }
  return v21;
}

uint64_t sub_25B3AAFB4(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = v3;
  if (result > 2u)
  {
    *(unsigned char *)uint64_t v3 = 1;
    return result;
  }
  uint64_t v7 = a2;
  LOBYTE(v8) = result;
  if (a2 == 5 || !a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *(void **)(v3 + 8);
    unint64_t v57 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0x8000000000000000;
    unint64_t v12 = sub_25B3B251C(v8);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      goto LABEL_50;
    }
    char v16 = v11;
    if (v10[3] >= v15)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25B3B6988();
        uint64_t v10 = v57;
      }
    }
    else
    {
      sub_25B3B3890(v15, isUniquelyReferenced_nonNull_native);
      uint64_t v10 = v57;
      unint64_t v17 = sub_25B3B251C(v8);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_56;
      }
      unint64_t v12 = v17;
    }
    *(void *)(v5 + 8) = v10;
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void **)(v5 + 8);
    swift_bridgeObjectRetain();
    if ((v16 & 1) == 0)
    {
      unint64_t v20 = sub_25B3A9238(MEMORY[0x263F8EE78]);
      sub_25B3D87E4(v12, v8, 0, v20, v19, 0.0);
    }
    uint64_t v4 = v19[7];
    swift_bridgeObjectRelease();
    unint64_t v21 = v4 + 24 * v12;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v22 = (void *)(v21 + 8);
    uint64_t v24 = v23 + 1;
    if (v23 == -1) {
      goto LABEL_51;
    }
    *uint64_t v22 = v24;
    if ((a3 & 0x100) != 0) {
      goto LABEL_27;
    }
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0x8000000000000000;
    unint64_t v28 = sub_25B3B251C(v8);
    uint64_t v29 = v26[2];
    BOOL v30 = (v27 & 1) == 0;
    uint64_t v31 = v29 + v30;
    if (__OFADD__(v29, v30))
    {
      __break(1u);
    }
    else
    {
      LOBYTE(v4) = v27;
      if (v26[3] < v31)
      {
        sub_25B3B3890(v31, v25);
        unint64_t v32 = sub_25B3B251C(v8);
        if ((v4 & 1) != (v33 & 1)) {
          goto LABEL_56;
        }
        unint64_t v28 = v32;
        if ((v4 & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_23;
      }
      if (v25)
      {
        if (v27)
        {
LABEL_23:
          uint64_t v34 = v26[7];
          if (*(void *)(v34 + 24 * v28 + 16)) {
            *(double *)(v34 + 24 * v28) = 1.0 / (double)a3 + *(double *)(v34 + 24 * v28);
          }
          else {
            sub_25B3D7F14(v28, (uint64_t)v26);
          }
          *(void *)(v5 + 8) = v26;
LABEL_27:
          unint64_t v12 = (unint64_t)sub_25B3B0F14;
          goto LABEL_28;
        }
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
    }
    sub_25B3B6988();
    if (v4) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
  unint64_t v12 = 0;
LABEL_28:
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v36 = *(void **)(v5 + 8);
  unint64_t v57 = v36;
  *(void *)(v5 + 8) = 0x8000000000000000;
  a3 = sub_25B3B251C(v8);
  uint64_t v38 = v36[2];
  BOOL v39 = (v37 & 1) == 0;
  uint64_t v40 = v38 + v39;
  if (__OFADD__(v38, v39))
  {
    __break(1u);
    goto LABEL_48;
  }
  LOBYTE(v4) = v37;
  if (v36[3] >= v40)
  {
    if ((v35 & 1) == 0) {
      goto LABEL_52;
    }
    while (1)
    {
LABEL_33:
      *(void *)(v5 + 8) = v36;
      swift_bridgeObjectRelease();
      uint64_t v43 = *(void **)(v5 + 8);
      swift_bridgeObjectRetain();
      if ((v4 & 1) == 0)
      {
        unint64_t v44 = sub_25B3A9238(MEMORY[0x263F8EE78]);
        sub_25B3D87E4(a3, v8, 0, v44, v43, 0.0);
      }
      uint64_t v45 = v43[7];
      swift_bridgeObjectRelease();
      uint64_t v4 = v45 + 24 * a3 + 16;
      a3 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v46 = *(void **)v4;
      unint64_t v57 = *(void **)v4;
      *(void *)uint64_t v4 = 0x8000000000000000;
      unint64_t v8 = sub_25B3B246C(v7);
      uint64_t v48 = v46[2];
      BOOL v49 = (v47 & 1) == 0;
      uint64_t v50 = v48 + v49;
      if (__OFADD__(v48, v49))
      {
LABEL_48:
        __break(1u);
      }
      else
      {
        uint64_t v5 = v47;
        if (v46[3] >= v50)
        {
          if ((a3 & 1) == 0)
          {
            sub_25B3B67F8();
            uint64_t v46 = v57;
          }
        }
        else
        {
          sub_25B3B35C0(v50, a3);
          uint64_t v46 = v57;
          unint64_t v51 = sub_25B3B246C(v7);
          if ((v5 & 1) != (v52 & 1)) {
            goto LABEL_57;
          }
          unint64_t v8 = v51;
        }
        *(void *)uint64_t v4 = v46;
        swift_bridgeObjectRelease();
        uint64_t v53 = *(void **)v4;
        swift_bridgeObjectRetain();
        if ((v5 & 1) == 0) {
          sub_25B3D879C(v8, v7, 0, v53);
        }
        uint64_t v7 = v53[7];
        swift_bridgeObjectRelease();
        uint64_t v54 = *(void *)(v7 + 8 * v8);
        BOOL v55 = __CFADD__(v54, 1);
        uint64_t v56 = v54 + 1;
        if (!v55)
        {
          *(void *)(v7 + 8 * v8) = v56;
          return sub_25B3BD440(v12);
        }
      }
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      sub_25B3B6988();
      uint64_t v36 = v57;
    }
  }
  sub_25B3B3890(v40, v35);
  unint64_t v41 = sub_25B3B251C(v8);
  if ((v4 & 1) == (v42 & 1))
  {
    a3 = v41;
    goto LABEL_33;
  }
LABEL_56:
  sub_25B3DD378();
  __break(1u);
LABEL_57:
  uint64_t result = sub_25B3DD378();
  __break(1u);
  return result;
}

uint64_t sub_25B3AB460(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19[-1] - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v19[-1] - v8, v11, a2);
  if (swift_dynamicCast())
  {
    sub_25B3BD648(0, &qword_26A4FB6F0);
    uint64_t v3 = sub_25B3DCFB8();
  }
  else
  {
    if (swift_dynamicCast()) {
      goto LABEL_4;
    }
    if (swift_dynamicCast())
    {
      sub_25B3BD648(0, &qword_26A4FB6F0);
      uint64_t v3 = sub_25B3DCFA8();
      goto LABEL_9;
    }
    if (swift_dynamicCast())
    {
      id v12 = objc_allocWithZone(NSString);
      uint64_t v13 = (void *)sub_25B3DCDD8();
      swift_bridgeObjectRelease();
      uint64_t v3 = (uint64_t)objc_msgSend(v12, sel_initWithString_, v13);

      goto LABEL_9;
    }
    if (swift_dynamicCast())
    {
LABEL_4:
      sub_25B3BD648(0, &qword_26A4FB6F0);
      uint64_t v3 = sub_25B3DCFC8();
    }
    else
    {
      v10(v7, (uint64_t)v9, a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB690);
      swift_dynamicCast();
      sub_25B3BD578((uint64_t)&v23, (uint64_t)v22);
      if (v3)
      {
        sub_25B3BD5E0((uint64_t)v22, (uint64_t)v19);
        uint64_t v15 = v20;
        if (v20)
        {
          uint64_t v16 = v21;
          __swift_project_boxed_opaque_existential_1(v19, v20);
          uint64_t v3 = sub_25B3AB460(0, v15, v16);
          sub_25B3A9E54((uint64_t)v22, &qword_26A4FB690);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        }
        else
        {
          sub_25B3A9E54((uint64_t)v22, &qword_26A4FB690);
          sub_25B3A9E54((uint64_t)v19, &qword_26A4FB690);
          uint64_t v3 = 0;
        }
      }
      else
      {
        sub_25B3A9794();
        swift_allocError();
        *(void *)uint64_t v17 = 0xD000000000000021;
        *(void *)(v17 + 8) = 0x800000025B3E1210;
        *(unsigned char *)(v17 + 16) = 1;
        swift_willThrow();
        sub_25B3A9E54((uint64_t)v22, &qword_26A4FB690);
      }
    }
  }
LABEL_9:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, a2);
  return v3;
}

uint64_t sub_25B3AB85C(uint64_t a1)
{
  uint64_t v37 = MEMORY[0x263F8EE80];
  uint64_t v29 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  else {
    uint64_t v3 = -1;
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(v2 + 63) >> 6;
  uint64_t v5 = (_OWORD *)((char *)v35 + 8);
  uint64_t v38 = &v34;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (v4) {
    goto LABEL_7;
  }
LABEL_8:
  if (__OFADD__(v7++, 1))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  if (v7 >= v30) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v7);
  if (v11) {
    goto LABEL_16;
  }
  int64_t v12 = v7 + 1;
  if (v7 + 1 >= v30) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v12);
  if (v11)
  {
LABEL_15:
    int64_t v7 = v12;
    goto LABEL_16;
  }
  int64_t v12 = v7 + 2;
  if (v7 + 2 >= v30) {
    goto LABEL_40;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v12);
  if (v11) {
    goto LABEL_15;
  }
  int64_t v28 = v7 + 3;
  if (v7 + 3 >= v30)
  {
LABEL_40:
    swift_release();
    return v37;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v28);
  for (v7 += 3; !v11; ++v28)
  {
    int64_t v7 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      goto LABEL_42;
    }
    if (v7 >= v30) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v7);
  }
LABEL_16:
  unint64_t v4 = (v11 - 1) & v11;
  for (unint64_t i = __clz(__rbit64(v11)) + (v7 << 6); ; unint64_t i = v8 | (v7 << 6))
  {
    char v13 = *(unsigned char *)(*(void *)(a1 + 48) + i);
    sub_25B3BC63C(*(void *)(a1 + 56) + 40 * i, (uint64_t)v36 + 8);
    LOBYTE(v36[0]) = v13;
    v35[0] = v36[0];
    v35[1] = v36[1];
    v35[2] = v36[2];
    sub_25B3AD51C(v5, v32);
    if (v1) {
      break;
    }
    uint64_t v14 = v32[0];
    if (v32[0])
    {
      char v15 = v35[0];
      char v33 = v35[0];
      uint64_t v16 = v5;
      sub_25B3A95E8(v5, (uint64_t)v38);
      uint64_t v17 = v37;
      unint64_t v18 = *(void *)(v37 + 16);
      if (*(void *)(v37 + 24) <= v18)
      {
        sub_25B3B32B0(v18 + 1, 1);
        uint64_t v17 = v37;
      }
      sub_25B3DD3C8();
      PeopleSuggesterMetricsField.rawValue.getter();
      sub_25B3DCE18();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25B3DD408();
      uint64_t v19 = v17 + 64;
      uint64_t v20 = -1 << *(unsigned char *)(v17 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v17 + 64 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v17 + 64 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v19 + 8 * v22);
        }
        while (v27 == -1);
        unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
      }
      *(void *)(v19 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(unsigned char *)(*(void *)(v17 + 48) + v23) = v15;
      *(void *)(*(void *)(v17 + 56) + 8 * v23) = v14;
      ++*(void *)(v17 + 16);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      uint64_t v5 = v16;
      if (!v4) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t result = sub_25B3A9E54((uint64_t)v35, &qword_26A4FB720);
      if (!v4) {
        goto LABEL_8;
      }
    }
LABEL_7:
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
  }
  sub_25B3A9E54((uint64_t)v35, &qword_26A4FB720);
  swift_release();
  return swift_release();
}

uint64_t sub_25B3ABBE8(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263F8EE80];
  uint64_t v36 = MEMORY[0x263F8EE80];
  uint64_t v29 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v37 = &v33;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v7 << 6))
  {
    char v13 = *(unsigned char *)(*(void *)(a1 + 48) + i);
    sub_25B3BC63C(*(void *)(a1 + 56) + 40 * i, (uint64_t)v35 + 8);
    LOBYTE(v35[0]) = v13;
    v34[0] = v35[0];
    v34[1] = v35[1];
    v34[2] = v35[2];
    sub_25B3AD51C((void *)v34 + 1, v31);
    if (v1) {
      break;
    }
    uint64_t v14 = v31[0];
    if (!v31[0])
    {
      sub_25B3A9E54((uint64_t)v34, &qword_26A4FB6E0);
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    char v15 = v34[0];
    char v32 = v34[0];
    sub_25B3A95E8((_OWORD *)((char *)v34 + 8), (uint64_t)v37);
    unint64_t v16 = *(void *)(v3 + 16);
    if (*(void *)(v3 + 24) <= v16)
    {
      sub_25B3B442C(v16 + 1, 1);
      uint64_t v3 = v36;
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_25B3DD408();
    uint64_t v18 = v3 + 64;
    uint64_t v19 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v20 = v17 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v3 + 64 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v3 + 64 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_31;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      BOOL v25 = v21 == v24;
      if (v21 == v24) {
        unint64_t v21 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v18 + 8 * v21);
    }
    while (v26 == -1);
    unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
LABEL_31:
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(unsigned char *)(*(void *)(v3 + 48) + v22) = v15;
    *(void *)(*(void *)(v3 + 56) + 8 * v22) = v14;
    ++*(void *)(v3 + 16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    if (v6) {
      goto LABEL_7;
    }
LABEL_8:
    if (__OFADD__(v7++, 1)) {
      goto LABEL_41;
    }
    if (v7 >= v30) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v7);
    if (v11) {
      goto LABEL_16;
    }
    int64_t v12 = v7 + 1;
    if (v7 + 1 >= v30) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    if (v11) {
      goto LABEL_15;
    }
    int64_t v12 = v7 + 2;
    if (v7 + 2 >= v30) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    if (v11)
    {
LABEL_15:
      int64_t v7 = v12;
      goto LABEL_16;
    }
    int64_t v27 = v7 + 3;
    if (v7 + 3 >= v30) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v27);
    v7 += 3;
    if (!v11)
    {
      while (1)
      {
        int64_t v7 = v27 + 1;
        if (__OFADD__(v27, 1)) {
          break;
        }
        if (v7 >= v30) {
          goto LABEL_40;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v7);
        ++v27;
        if (v11) {
          goto LABEL_16;
        }
      }
LABEL_42:
      __break(1u);
      JUMPOUT(0x25B3AC1ECLL);
    }
LABEL_16:
    unint64_t v6 = (v11 - 1) & v11;
  }
  sub_25B3A9E54((uint64_t)v34, &qword_26A4FB6E0);
  swift_release();
LABEL_40:
  swift_release();
  return v3;
}

uint64_t static PeopleSuggesterMetricsCollector.getMetrics()@<X0>(void *a1@<X8>)
{
  unint64_t v126 = a1;
  uint64_t v3 = sub_25B3DCC98();
  uint64_t v125 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t inited = (uint64_t)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x263F8EE78];
  unint64_t v147 = sub_25B3A656C(MEMORY[0x263F8EE78]);
  unint64_t v146 = sub_25B3A668C(v6);
  uint64_t v134 = inited;
  sub_25B3DCC88();
  collectPeopleSuggestionEvents()(&v142);
  uint64_t v7 = v142;
  uint64_t v129 = v143;
  uint64_t v130 = *((void *)&v142 + 1);
  uint64_t v128 = *((void *)&v143 + 1);
  if ((unint64_t)v142 >> 62) {
    goto LABEL_51;
  }
  uint64_t v8 = *(void *)((v142 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  while (1)
  {
    uint64_t v133 = v7;
    uint64_t v127 = v3;
    if (v8)
    {
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v3 = 0;
        unint64_t v10 = v7 & 0xC000000000000001;
        unint64_t v1 = 0x43E0000000000000;
        while (1)
        {
          id v11 = v10 ? (id)MEMORY[0x2611628B0](v9, v7) : *(id *)(v7 + 8 * v9 + 32);
          uint64_t v7 = (uint64_t)v11;
          uint64_t inited = v134;
          sub_25B3DCC38();
          if ((~*(void *)&v12 & 0x7FF0000000000000) == 0) {
            break;
          }
          if (v12 <= -9.22337204e18) {
            goto LABEL_46;
          }
          if (v12 >= 9.22337204e18) {
            goto LABEL_47;
          }
          unint64_t v13 = (uint64_t)v12;
          if (((uint64_t)v12 & 0x8000000000000000) == 0)
          {
            if (v13 < 0x24EA00) {
              unsigned int v14 = 2;
            }
            else {
              unsigned int v14 = 3;
            }
            if (v13 < 0x93A80) {
              unsigned int v14 = 1;
            }
            if (v13 >= 0x15180) {
              uint64_t inited = v14;
            }
            else {
              uint64_t inited = 0;
            }
            uint64_t v2 = (uint64_t)(id)v7;
            uint64_t v15 = swift_bridgeObjectRetain();
            sub_25B3B9D20(v15, &v147, inited, v2);
            swift_bridgeObjectRelease();
          }
          ++v9;
          uint64_t v7 = v133;
          if (v8 == v9) {
            goto LABEL_24;
          }
        }
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
LABEL_151:
      __break(1u);
      goto LABEL_152;
    }
    uint64_t v3 = 0;
LABEL_24:
    swift_bridgeObjectRelease_n();
    collectAppSuggestionEvents()(&v142);
    long long v123 = v143;
    long long v124 = v142;
    uint64_t v16 = v142;
    if ((unint64_t)v142 >> 62) {
      break;
    }
    uint64_t v17 = *(void *)((v142 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v17) {
      goto LABEL_59;
    }
LABEL_26:
    if (v17 < 1)
    {
      __break(1u);
      goto LABEL_154;
    }
    uint64_t v2 = 0;
    unint64_t v1 = v16 & 0xC000000000000001;
    while (1)
    {
      id v18 = v1 ? (id)MEMORY[0x2611628B0](v2, v16) : *(id *)(v16 + 8 * v2 + 32);
      uint64_t v7 = (uint64_t)v18;
      sub_25B3DCC38();
      if ((~*(void *)&v19 & 0x7FF0000000000000) == 0) {
        break;
      }
      if (v19 <= -9.22337204e18) {
        goto LABEL_49;
      }
      if (v19 >= 9.22337204e18) {
        goto LABEL_50;
      }
      unint64_t v20 = (uint64_t)v19;
      if (((uint64_t)v19 & 0x8000000000000000) == 0)
      {
        if (v20 < 0x24EA00) {
          int v21 = 2;
        }
        else {
          int v21 = 3;
        }
        if (v20 < 0x93A80) {
          int v21 = 1;
        }
        if (v20 >= 0x15180) {
          unsigned int v22 = v21;
        }
        else {
          unsigned int v22 = 0;
        }
        id v23 = (id)v7;
        uint64_t v24 = swift_bridgeObjectRetain();
        sub_25B3BA008(v24, &v146, v22, (uint64_t)v23);
        swift_bridgeObjectRelease();
      }
      if (v17 == ++v2) {
        goto LABEL_59;
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    if (v7 < 0) {
      uint64_t inited = v7;
    }
    else {
      uint64_t inited = v7 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_25B3DD248();
  }
  if ((uint64_t)v142 < 0) {
    uint64_t inited = v142;
  }
  else {
    uint64_t inited = v142 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_25B3DD248();
  if (v17) {
    goto LABEL_26;
  }
LABEL_59:
  uint64_t v25 = swift_bridgeObjectRelease_n();
  uint64_t v26 = MEMORY[0x263F8EE78];
  *(void *)&long long v142 = MEMORY[0x263F8EE78];
  MEMORY[0x270FA5388](v25);
  *((void *)&v123 - 2) = &v142;
  uint64_t v27 = swift_bridgeObjectRetain();
  sub_25B3B9B50(v27, (void (*)(void **, unsigned char *))sub_25B3BC564);
  uint64_t v28 = swift_bridgeObjectRelease();
  uint64_t v29 = v142;
  *(void *)&long long v142 = v26;
  MEMORY[0x270FA5388](v28);
  *((void *)&v123 - 2) = &v142;
  uint64_t v30 = swift_bridgeObjectRetain();
  sub_25B3B9974(v30, (void (*)(void *, unsigned char *))sub_25B3BC57C);
  uint64_t v131 = 0;
  swift_bridgeObjectRelease();
  uint64_t v31 = v142;
  *(void *)&long long v142 = v29;
  sub_25B3A4C88(v31);
  uint64_t v32 = v142;
  v145[0] = v142;
  uint64_t v132 = (void *)sub_25B3ADC18(v134);
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void *)(v32 + 16);
  unint64_t v1 = 0x26A4FB000uLL;
  uint64_t v2 = (uint64_t)&qword_26A4FF4C0;
  if (!v33)
  {
LABEL_80:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB628);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25B3DE300;
    *(unsigned char *)(inited + 32) = 36;
    if (qword_26A4FB1C8 == -1)
    {
LABEL_81:
      uint64_t v43 = *(void *)v2;
      uint64_t v42 = *(void *)(v2 + 8);
      *(void *)(inited + 64) = MEMORY[0x263F8D310];
      *(void *)(inited + 72) = &protocol witness table for String;
      *(void *)(inited + 40) = v43;
      *(void *)(inited + 48) = v42;
      swift_bridgeObjectRetain();
      unint64_t v44 = sub_25B3A67B8(inited);
      uint64_t v45 = (void *)v145[0];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v7 = v133;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v45 = sub_25B3B19A4(0, v45[2] + 1, 1, v45, &qword_26A4FB698, &qword_26A4FB4C8);
      }
      unint64_t v48 = v45[2];
      unint64_t v47 = v45[3];
      if (v48 >= v47 >> 1) {
        uint64_t v45 = sub_25B3B19A4((void *)(v47 > 1), v48 + 1, 1, v45, &qword_26A4FB698, &qword_26A4FB4C8);
      }
      v45[2] = v48 + 1;
      v45[v48 + 4] = v44;
      v145[0] = v45;
      goto LABEL_88;
    }
LABEL_152:
    swift_once();
    goto LABEL_81;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v34 = 0;
  while (2)
  {
    uint64_t v35 = *(void *)(v32 + 8 * v34 + 32);
    uint64_t v36 = *(void *)(v35 + 16);
    swift_bridgeObjectRetain();
    if (v36)
    {
      uint64_t v37 = sub_25B3B25B4(36, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
      if ((v38 & 1) != 0
        && (sub_25B3BC63C(*(void *)(v35 + 56) + 40 * v37, (uint64_t)&v142),
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638),
            swift_dynamicCast()))
      {
        uint64_t v36 = *((void *)&v140 + 1);
        uint64_t v39 = v140;
      }
      else
      {
        uint64_t v39 = 0;
        uint64_t v36 = 0;
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    if (qword_26A4FB1C8 == -1)
    {
      if (v36) {
        goto LABEL_71;
      }
LABEL_61:
      swift_bridgeObjectRelease();
LABEL_62:
      if (v33 == ++v34)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_80;
      }
      continue;
    }
    break;
  }
  swift_once();
  if (!v36) {
    goto LABEL_61;
  }
LABEL_71:
  if (v39 != qword_26A4FF4C0 || v36 != *(void *)algn_26A4FF4C8)
  {
    char v41 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v41)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_87;
    }
    goto LABEL_62;
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_87:
  uint64_t v7 = v133;
LABEL_88:
  uint64_t v49 = v145[0];
  uint64_t v50 = *(void *)(v145[0] + 16);
  if (!v50)
  {
    swift_bridgeObjectRelease();
    goto LABEL_113;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = 0;
  while (2)
  {
    uint64_t v52 = *(void *)(v49 + 8 * v51 + 32);
    uint64_t v53 = *(void *)(v52 + 16);
    swift_bridgeObjectRetain();
    if (v53)
    {
      uint64_t v54 = sub_25B3B25B4(36, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
      if ((v55 & 1) != 0
        && (sub_25B3BC63C(*(void *)(v52 + 56) + 40 * v54, (uint64_t)&v142),
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638),
            swift_dynamicCast()))
      {
        uint64_t v53 = *((void *)&v140 + 1);
        uint64_t v56 = v140;
      }
      else
      {
        uint64_t v56 = 0;
        uint64_t v53 = 0;
      }
    }
    else
    {
      uint64_t v56 = 0;
    }
    if (*(void *)(v1 + 456) == -1)
    {
      if (v53) {
        goto LABEL_100;
      }
LABEL_90:
      swift_bridgeObjectRelease();
LABEL_91:
      if (v50 == ++v51)
      {
        swift_bridgeObjectRelease();
        goto LABEL_112;
      }
      continue;
    }
    break;
  }
  swift_once();
  if (!v53) {
    goto LABEL_90;
  }
LABEL_100:
  if (v56 != *(void *)v2 || v53 != *(void *)(v2 + 8))
  {
    char v58 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58) {
      goto LABEL_111;
    }
    goto LABEL_91;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_111:
  swift_bridgeObjectRelease();
  *(void *)&long long v142 = v51;
  *(void *)&long long v140 = 0;
  LOBYTE(v135) = byte_2708ECC10;
  unint64_t v59 = v132;
  sub_25B3AE058((unsigned __int8 *)&v135, v132, (unint64_t)&v140, (uint64_t)v145, (unint64_t)&v142);
  LOBYTE(v135) = byte_2708ECC11;
  sub_25B3AE058((unsigned __int8 *)&v135, v59, (unint64_t)&v140, (uint64_t)v145, (unint64_t)&v142);
  LOBYTE(v135) = byte_2708ECC12;
  sub_25B3AE058((unsigned __int8 *)&v135, v59, (unint64_t)&v140, (uint64_t)v145, (unint64_t)&v142);
  LOBYTE(v135) = byte_2708ECC13;
  sub_25B3AE058((unsigned __int8 *)&v135, v59, (unint64_t)&v140, (uint64_t)v145, (unint64_t)&v142);
LABEL_112:
  swift_bridgeObjectRelease();
  uint64_t v7 = v133;
LABEL_113:
  char v60 = sub_25B3A98E0();
  uint64_t v2 = v145[0];
  if (v60 != 2)
  {
    char v61 = v60 & 1;
    int64_t v62 = *(void *)(v145[0] + 16);
    if (!v62)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB628);
      uint64_t v86 = swift_initStackObject();
      *(_OWORD *)(v86 + 16) = xmmword_25B3DE300;
      *(unsigned char *)(v86 + 32) = 35;
      *(void *)(v86 + 64) = MEMORY[0x263F8D4F8];
      *(void *)(v86 + 72) = &protocol witness table for Bool;
      *(unsigned char *)(v86 + 40) = v61 ^ 1;
      uint64_t inited = sub_25B3A67B8(v86);
      if (swift_isUniquelyReferenced_nonNull_native())
      {
LABEL_134:
        unint64_t v88 = *(void *)(v2 + 16);
        unint64_t v87 = *(void *)(v2 + 24);
        if (v88 >= v87 >> 1) {
          uint64_t v2 = (uint64_t)sub_25B3B19A4((void *)(v87 > 1), v88 + 1, 1, (void *)v2, &qword_26A4FB698, &qword_26A4FB4C8);
        }
        *(void *)(v2 + 16) = v88 + 1;
        *(void *)(v2 + 8 * v88 + 32) = inited;
        v145[0] = v2;
        goto LABEL_137;
      }
LABEL_154:
      uint64_t v2 = (uint64_t)sub_25B3B19A4(0, *(void *)(v2 + 16) + 1, 1, (void *)v2, &qword_26A4FB698, &qword_26A4FB4C8);
      goto LABEL_134;
    }
    uint64_t v139 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25B3B7B60(0, v62, 0);
    unint64_t v1 = 0;
    char v63 = v61 ^ 1;
    while (2)
    {
      uint64_t inited = *(void *)(v2 + 8 * v1 + 32);
      *((void *)&v143 + 1) = MEMORY[0x263F8D4F8];
      uint64_t v144 = &protocol witness table for Bool;
      LOBYTE(v142) = v63;
      sub_25B3A95E8(&v142, (uint64_t)&v140);
      swift_bridgeObjectRetain();
      char v64 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v138 = (void *)inited;
      unint64_t v66 = sub_25B3B25B4(35, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
      uint64_t v67 = *(void *)(inited + 16);
      BOOL v68 = (v65 & 1) == 0;
      uint64_t v69 = v67 + v68;
      if (__OFADD__(v67, v68))
      {
        __break(1u);
LABEL_150:
        __break(1u);
        goto LABEL_151;
      }
      char v70 = v65;
      if (*(void *)(inited + 24) >= v69)
      {
        if (v64)
        {
          uint64_t v73 = v138;
          if ((v65 & 1) == 0) {
            goto LABEL_120;
          }
        }
        else
        {
          sub_25B3B6B40(&qword_26A4FB4B8);
          uint64_t v73 = v138;
          if ((v70 & 1) == 0) {
            goto LABEL_120;
          }
        }
      }
      else
      {
        sub_25B3B2C84(v69, v64);
        uint64_t v71 = sub_25B3B25B4(35, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
        if ((v70 & 1) != (v72 & 1))
        {
          uint64_t result = sub_25B3DD378();
          __break(1u);
          return result;
        }
        unint64_t v66 = v71;
        uint64_t v73 = v138;
        if ((v70 & 1) == 0)
        {
LABEL_120:
          uint64_t inited = v141;
          uint64_t v74 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
          MEMORY[0x270FA5388](v74);
          double v76 = (char *)&v123 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v77 + 16))(v76);
          char v78 = *v76;
          uint64_t v136 = MEMORY[0x263F8D4F8];
          v137 = &protocol witness table for Bool;
          LOBYTE(v135) = v78;
          v73[(v66 >> 6) + 8] |= 1 << v66;
          *(unsigned char *)(v73[6] + v66) = 35;
          sub_25B3A95E8(&v135, v73[7] + 40 * v66);
          uint64_t v79 = v73[2];
          BOOL v80 = __OFADD__(v79, 1);
          uint64_t v81 = v79 + 1;
          if (v80) {
            goto LABEL_150;
          }
          v73[2] = v81;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
          goto LABEL_125;
        }
      }
      uint64_t v82 = v73[7] + 40 * v66;
      __swift_destroy_boxed_opaque_existential_1Tm(v82);
      sub_25B3A95E8(&v140, v82);
LABEL_125:
      swift_bridgeObjectRelease();
      uint64_t v83 = v139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25B3B7B60(0, *(void *)(v83 + 16) + 1, 1);
        uint64_t v83 = v139;
      }
      unint64_t v85 = *(void *)(v83 + 16);
      unint64_t v84 = *(void *)(v83 + 24);
      if (v85 >= v84 >> 1)
      {
        sub_25B3B7B60(v84 > 1, v85 + 1, 1);
        uint64_t v83 = v139;
      }
      ++v1;
      *(void *)(v83 + 16) = v85 + 1;
      *(void *)(v83 + 8 * v85 + 32) = v73;
      if (v62 == v1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v145[0] = v83;
        uint64_t v7 = v133;
        goto LABEL_138;
      }
      continue;
    }
  }
LABEL_137:
  uint64_t v83 = v2;
LABEL_138:
  *(void *)&long long v142 = v7;
  *((void *)&v142 + 1) = v130;
  *(void *)&long long v143 = v129;
  *((void *)&v143 + 1) = v128;
  uint64_t v89 = sub_25B3CEEF0();
  char v90 = sub_25B3BA57C(v89, v134);
  swift_bridgeObjectRelease();
  BOOL v91 = sub_25B3A9A64();
  v92 = *(void **)(v83 + 16);
  uint64_t v93 = MEMORY[0x263F8EE78];
  if (v92)
  {
    BOOL v94 = v91;
    *(void *)&long long v135 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25B3B7B60(0, (int64_t)v92, 0);
    uint64_t v95 = 0;
    LODWORD(v131) = v94;
    uint64_t v132 = v92;
    do
    {
      uint64_t v96 = *(void *)(v83 + 8 * (void)v95 + 32);
      *((void *)&v143 + 1) = MEMORY[0x263F8D4F8];
      uint64_t v144 = &protocol witness table for Bool;
      LOBYTE(v142) = v131;
      sub_25B3A95E8(&v142, (uint64_t)&v140);
      swift_bridgeObjectRetain_n();
      char v97 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v139 = v96;
      uint64_t v98 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
      MEMORY[0x270FA5388](v98);
      v100 = (char *)&v123 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v101 + 16))(v100);
      sub_25B3B8ACC(*v100, 3, v97, &v139);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
      uint64_t v102 = v139;
      swift_bridgeObjectRelease();
      *(void *)&long long v142 = 5;
      uint64_t v103 = sub_25B3DD318();
      *((void *)&v143 + 1) = MEMORY[0x263F8D310];
      uint64_t v144 = (char **)&protocol witness table for String;
      *(void *)&long long v142 = v103;
      *((void *)&v142 + 1) = v104;
      sub_25B3A95E8(&v142, (uint64_t)&v140);
      char v105 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v139 = v102;
      uint64_t v106 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
      MEMORY[0x270FA5388](v106);
      BOOL v108 = (uint64_t *)((char *)&v123 - ((v107 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v109 + 16))(v108);
      sub_25B3B8CFC(*v108, v108[1], 4, v105, &v139);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
      uint64_t v110 = v139;
      swift_bridgeObjectRelease();
      if (v90 != 4)
      {
        *((void *)&v143 + 1) = &type metadata for UsageFrequency;
        uint64_t v144 = (char **)sub_25B3BC5E8();
        LOBYTE(v142) = v90;
        sub_25B3A95E8(&v142, (uint64_t)&v140);
        char v111 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v139 = v110;
        uint64_t v112 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
        MEMORY[0x270FA5388](v112);
        uint64_t v114 = (char *)&v123 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v115 + 16))(v114);
        sub_25B3B8F30(*v114, 40, v111, &v139);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
        uint64_t v110 = v139;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v93 = v135;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25B3B7B60(0, *(void *)(v93 + 16) + 1, 1);
        uint64_t v93 = v135;
      }
      unint64_t v117 = *(void *)(v93 + 16);
      unint64_t v116 = *(void *)(v93 + 24);
      if (v117 >= v116 >> 1)
      {
        sub_25B3B7B60(v116 > 1, v117 + 1, 1);
        uint64_t v93 = v135;
      }
      uint64_t v95 = (void *)((char *)v95 + 1);
      *(void *)(v93 + 16) = v117 + 1;
      *(void *)(v93 + 8 * v117 + 32) = v110;
    }
    while (v132 != v95);
    swift_bridgeObjectRelease();
    uint64_t v7 = v133;
  }
  swift_bridgeObjectRelease();
  v145[0] = v93;
  uint64_t v119 = v125;
  v118 = v126;
  *unint64_t v126 = v93;
  v118[1] = v7;
  uint64_t v120 = v129;
  v118[2] = v130;
  v118[3] = v120;
  v118[4] = v128;
  *(_OWORD *)(v118 + 5) = v124;
  *(_OWORD *)(v118 + 7) = v123;
  uint64_t v121 = *(void (**)(uint64_t, uint64_t))(v119 + 8);
  swift_bridgeObjectRetain();
  v121(v134, v127);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B3AD51C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t result = sub_25B3AB460(1, v5);
  if (v2)
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25B3DCD98();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B346958);
    sub_25B3BC63C((uint64_t)a1, (uint64_t)v19);
    id v8 = v2;
    id v9 = v2;
    unint64_t v10 = sub_25B3DCD78();
    os_log_type_t v11 = sub_25B3DCF78();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      unint64_t v13 = (void *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v14;
      *(_DWORD *)uint64_t v12 = 138412546;
      id v15 = v2;
      v18[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_25B3DD018();
      *unint64_t v13 = v18[0];

      *(_WORD *)(v12 + 12) = 2080;
      sub_25B3BC63C((uint64_t)v19, (uint64_t)v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
      uint64_t v16 = sub_25B3DCDF8();
      v18[0] = sub_25B3B1CCC(v16, v17, &v20);
      sub_25B3DD018();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      _os_log_impl(&dword_25B39F000, v10, v11, "%@: %s", (uint8_t *)v12, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
      swift_arrayDestroy();
      MEMORY[0x261163250](v13, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261163250](v14, -1, -1);
      MEMORY[0x261163250](v12, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    }
    uint64_t result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t PeopleSuggesterMetricsCollector.Result.metrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggesterMetricsCollector.Result.peopleSuggestionsJoiningResult.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v4 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggesterMetricsCollector.Result.appSuggestionsJoiningResult.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  uint64_t v5 = v1[7];
  uint64_t v4 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_25B3AD89C(id *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement);
  uint64_t v8 = *(void *)(a4 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks);
  uint64_t v9 = *(void *)(v8 + 16);
  id v10 = *a1;
  os_log_type_t v11 = v10;
  unsigned int v29 = a3;
  uint64_t v28 = v7;
  if (v9 && (unint64_t v12 = sub_25B3B24D8((uint64_t)v10), (v13 & 1) != 0))
  {
    int v14 = 0;
    int v15 = *(unsigned __int8 *)(*(void *)(v8 + 56) + v12);
  }
  else
  {
    int v15 = 0;
    int v14 = 1;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v17 = (void *)*a2;
  uint64_t v30 = (void *)*a2;
  *a2 = 0x8000000000000000;
  unint64_t v19 = sub_25B3B24D8((uint64_t)v11);
  uint64_t v20 = v17[2];
  BOOL v21 = (v18 & 1) == 0;
  uint64_t v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v4 = v18;
  if (v17[3] >= v22)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_10;
    }
LABEL_14:
    sub_25B3B6CFC();
    unint64_t v17 = v30;
    goto LABEL_10;
  }
  sub_25B3B413C(v22, isUniquelyReferenced_nonNull_native);
  unint64_t v17 = v30;
  unint64_t v23 = sub_25B3B24D8((uint64_t)v11);
  if ((v4 & 1) != (v24 & 1))
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_25B3DD378();
    __break(1u);
    return;
  }
  unint64_t v19 = v23;
LABEL_10:
  *a2 = v17;
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)*a2;
  if ((v4 & 1) == 0)
  {
    unint64_t v26 = sub_25B3A9110(MEMORY[0x263F8EE78]);
    sub_25B3D8834(v19, (uint64_t)v11, 0, v26, v25);
    id v27 = v11;
  }
  sub_25B3AAFB4(v29, v28, v15 | (v14 << 8));
}

uint64_t sub_25B3ADA4C(uint64_t *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v9 = *(void *)(a4 + OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagement);
  uint64_t v10 = *(void *)(a4 + OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagedModelRanks);
  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRetain();
  unsigned int v29 = a3;
  uint64_t v28 = v9;
  if (v11 && (unint64_t v12 = sub_25B3B2324(v8, v7), (v13 & 1) != 0))
  {
    int v14 = 0;
    int v15 = *(unsigned __int8 *)(*(void *)(v10 + 56) + v12);
  }
  else
  {
    int v15 = 0;
    int v14 = 1;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v17 = (void *)*a2;
  uint64_t v30 = (void *)*a2;
  *a2 = 0x8000000000000000;
  unint64_t v19 = sub_25B3B2324(v8, v7);
  uint64_t v20 = v17[2];
  BOOL v21 = (v18 & 1) == 0;
  uint64_t v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v4 = v18;
  if (v17[3] >= v22)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_10;
    }
LABEL_14:
    sub_25B3B6EBC();
    unint64_t v17 = v30;
    goto LABEL_10;
  }
  sub_25B3B49A4(v22, isUniquelyReferenced_nonNull_native);
  unint64_t v17 = v30;
  unint64_t v23 = sub_25B3B2324(v8, v7);
  if ((v4 & 1) != (v24 & 1))
  {
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v19 = v23;
LABEL_10:
  *a2 = v17;
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)*a2;
  if ((v4 & 1) == 0)
  {
    unint64_t v26 = sub_25B3A9110(MEMORY[0x263F8EE78]);
    sub_25B3D8880(v19, v8, v7, 0, v26, v25);
    swift_bridgeObjectRetain();
  }
  sub_25B3AAFB4(v29, v28, v15 | (v14 << 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B3ADC18(uint64_t a1)
{
  uint64_t v2 = sub_25B3DCC98();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = swift_allocObject();
  uint64_t v30 = v5;
  *(void *)(v5 + 16) = MEMORY[0x263F8EE80];
  uint64_t v32 = (uint64_t *)(v5 + 16);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  uint64_t v31 = v6 + 16;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = MEMORY[0x263F8EE88];
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v9 = objc_msgSend(v8, sel_Feedback);
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(self, sel_reversed);
  id v28 = objc_msgSend(v9, sel_publisherWithOptions_, v10);

  uint64_t v37 = sub_25B3BD284;
  uint64_t v38 = v6;
  uint64_t v11 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v34 = 1107296256;
  uint64_t v35 = sub_25B3AED00;
  uint64_t v36 = &block_descriptor;
  id v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  unint64_t v12 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, a1, v2);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v15 = (v4 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v14, v12, v13);
  *(void *)(v17 + v15) = v11;
  uint64_t v18 = v30;
  *(void *)(v17 + v16) = v29;
  *(void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8)) = v18;
  uint64_t v37 = sub_25B3BD370;
  uint64_t v38 = v17;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v34 = 1107296256;
  uint64_t v35 = sub_25B3AF484;
  uint64_t v36 = &block_descriptor_19;
  unint64_t v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  BOOL v21 = v27;
  id v20 = v28;
  id v22 = objc_msgSend(v28, sel_sinkWithCompletion_shouldContinue_, v27, v19);
  _Block_release(v19);
  _Block_release(v21);

  unint64_t v23 = v32;
  swift_beginAccess();
  uint64_t v24 = *v23;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v24;
}

uint64_t sub_25B3AE058(unsigned __int8 *a1, void *a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  id v10 = (char **)*a1;
  if (a2[2] && (uint64_t v5 = a2, v11 = sub_25B3B251C(*a1), (v12 & 1) != 0)) {
    uint64_t v13 = *(void *)(v5[7] + 8 * v11);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void *)a3 + v13;
  if (!__CFADD__(*(void *)a3, v13))
  {
    *(void *)a3 = v14;
    switch((unint64_t)v10)
    {
      case 1uLL:
        a3 = *(void *)a5;
        *((void *)&v52 + 1) = MEMORY[0x263F8D6C8];
        uint64_t v53 = (char **)&protocol witness table for Int;
        if (v14 < 0) {
          goto LABEL_132;
        }
        *(void *)&long long v51 = v14;
        uint64_t v5 = *(void **)a4;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)a4 = v5;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          goto LABEL_133;
        }
        if ((a3 & 0x8000000000000000) == 0) {
          goto LABEL_15;
        }
        goto LABEL_134;
      case 2uLL:
        a3 = *(void *)a5;
        *((void *)&v52 + 1) = MEMORY[0x263F8D6C8];
        uint64_t v53 = (char **)&protocol witness table for Int;
        if (v14 < 0) {
          goto LABEL_136;
        }
        *(void *)&long long v51 = v14;
        uint64_t v5 = *(void **)a4;
        char v19 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)a4 = v5;
        if ((v19 & 1) == 0) {
          goto LABEL_137;
        }
        if ((a3 & 0x8000000000000000) == 0) {
          goto LABEL_21;
        }
        goto LABEL_138;
      case 3uLL:
        unint64_t v6 = *(void *)a5;
        if (v13)
        {
          char v21 = 1;
          goto LABEL_53;
        }
        if ((v6 & 0x8000000000000000) != 0)
        {
LABEL_158:
          __break(1u);
          goto LABEL_159;
        }
        if (v6 >= *(void *)(*(void *)a4 + 16))
        {
LABEL_159:
          __break(1u);
          goto LABEL_160;
        }
        uint64_t v22 = *(void *)(*(void *)a4 + 8 * v6 + 32);
        if (*(void *)(v22 + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = sub_25B3B25B4(2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
          if (v24)
          {
            sub_25B3BC63C(*(void *)(v22 + 56) + 40 * v23, (uint64_t)&v51);
            swift_bridgeObjectRelease();
            if (*((void *)&v52 + 1))
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
              if (swift_dynamicCast())
              {
                char v21 = v50;
                goto LABEL_53;
              }
LABEL_52:
              char v21 = 0;
LABEL_53:
              a3 = MEMORY[0x263F8D4F8];
              id v10 = &protocol witness table for Bool;
              *((void *)&v52 + 1) = MEMORY[0x263F8D4F8];
              uint64_t v53 = &protocol witness table for Bool;
              LOBYTE(v51) = v21;
              uint64_t v5 = *(void **)a4;
              char v31 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)a4 = v5;
              if (v31)
              {
                if ((v6 & 0x8000000000000000) == 0) {
                  goto LABEL_55;
                }
                goto LABEL_141;
              }
LABEL_140:
              uint64_t v5 = sub_25B3D8954(v5);
              *(void *)a4 = v5;
              if ((v6 & 0x8000000000000000) == 0)
              {
LABEL_55:
                if (v6 < v5[2])
                {
                  sub_25B3AA414((uint64_t)&v51, 2);
                  uint64_t v5 = *(void **)a4;
                  unint64_t v6 = *(void *)a5;
                  if (v13)
                  {
                    char v32 = 1;
                    goto LABEL_71;
                  }
                  if ((v6 & 0x8000000000000000) != 0)
                  {
LABEL_164:
                    __break(1u);
                    goto LABEL_165;
                  }
                  if (v6 >= v5[2])
                  {
LABEL_165:
                    __break(1u);
                    goto LABEL_166;
                  }
                  uint64_t v33 = v5[v6 + 4];
                  if (*(void *)(v33 + 16))
                  {
                    swift_bridgeObjectRetain();
                    uint64_t v34 = sub_25B3B25B4(1, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
                    if (v35)
                    {
                      sub_25B3BC63C(*(void *)(v33 + 56) + 40 * v34, (uint64_t)&v51);
                    }
                    else
                    {
                      uint64_t v53 = 0;
                      long long v51 = 0u;
                      long long v52 = 0u;
                    }
                    swift_bridgeObjectRelease();
                    if (*((void *)&v52 + 1))
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
                      if (swift_dynamicCast())
                      {
                        char v32 = v50;
LABEL_70:
                        uint64_t v5 = *(void **)a4;
LABEL_71:
                        *((void *)&v52 + 1) = a3;
                        uint64_t v53 = v10;
                        LOBYTE(v51) = v32;
                        char v36 = swift_isUniquelyReferenced_nonNull_native();
                        *(void *)a4 = v5;
                        if (v36)
                        {
                          if ((v6 & 0x8000000000000000) == 0) {
                            goto LABEL_73;
                          }
                          goto LABEL_144;
                        }
LABEL_143:
                        uint64_t v5 = sub_25B3D8954(v5);
                        *(void *)a4 = v5;
                        if ((v6 & 0x8000000000000000) == 0)
                        {
LABEL_73:
                          if (v6 < v5[2])
                          {
                            char v37 = 1;
                            sub_25B3AA414((uint64_t)&v51, 1);
                            uint64_t v5 = *(void **)a4;
                            a5 = *(void *)a5;
                            if (v13) {
                              goto LABEL_111;
                            }
                            if ((a5 & 0x8000000000000000) != 0)
                            {
LABEL_166:
                              __break(1u);
                              goto LABEL_167;
                            }
                            if (a5 >= v5[2])
                            {
LABEL_167:
                              __break(1u);
                              goto LABEL_168;
                            }
                            uint64_t v38 = v5[a5 + 4];
                            if (*(void *)(v38 + 16))
                            {
                              swift_bridgeObjectRetain();
                              uint64_t v39 = sub_25B3B25B4(0, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
                              if (v40)
                              {
                                sub_25B3BC63C(*(void *)(v38 + 56) + 40 * v39, (uint64_t)&v51);
                              }
                              else
                              {
                                uint64_t v53 = 0;
                                long long v51 = 0u;
                                long long v52 = 0u;
                              }
                              swift_bridgeObjectRelease();
                              if (*((void *)&v52 + 1))
                              {
                                __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
                                if (swift_dynamicCast())
                                {
                                  char v37 = v50;
LABEL_110:
                                  uint64_t v5 = *(void **)a4;
LABEL_111:
                                  *((void *)&v52 + 1) = a3;
                                  uint64_t v53 = v10;
                                  LOBYTE(v51) = v37;
                                  char v47 = swift_isUniquelyReferenced_nonNull_native();
                                  *(void *)a4 = v5;
                                  if (v47)
                                  {
                                    if ((a5 & 0x8000000000000000) == 0) {
                                      goto LABEL_113;
                                    }
                                    goto LABEL_153;
                                  }
LABEL_152:
                                  uint64_t v5 = sub_25B3D8954(v5);
                                  *(void *)a4 = v5;
                                  if ((a5 & 0x8000000000000000) == 0)
                                  {
LABEL_113:
                                    if (a5 < v5[2])
                                    {
                                      uint64_t v16 = 0;
                                      return sub_25B3AA414((uint64_t)&v51, v16);
                                    }
                                    goto LABEL_154;
                                  }
LABEL_153:
                                  __break(1u);
LABEL_154:
                                  __break(1u);
                                  goto LABEL_155;
                                }
LABEL_109:
                                char v37 = 0;
                                goto LABEL_110;
                              }
                            }
                            else
                            {
                              uint64_t v53 = 0;
                              long long v51 = 0u;
                              long long v52 = 0u;
                            }
                            sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
                            goto LABEL_109;
                          }
                          goto LABEL_145;
                        }
LABEL_144:
                        __break(1u);
LABEL_145:
                        __break(1u);
                        goto LABEL_146;
                      }
LABEL_69:
                      char v32 = 0;
                      goto LABEL_70;
                    }
                  }
                  else
                  {
                    uint64_t v53 = 0;
                    long long v51 = 0u;
                    long long v52 = 0u;
                  }
                  sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
                  goto LABEL_69;
                }
LABEL_142:
                __break(1u);
                goto LABEL_143;
              }
LABEL_141:
              __break(1u);
              goto LABEL_142;
            }
          }
          else
          {
            uint64_t v53 = 0;
            long long v51 = 0u;
            long long v52 = 0u;
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          uint64_t v53 = 0;
          long long v51 = 0u;
          long long v52 = 0u;
        }
        sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
        goto LABEL_52;
      default:
        a5 = *(void *)a5;
        *((void *)&v52 + 1) = MEMORY[0x263F8D6C8];
        uint64_t v53 = (char **)&protocol witness table for Int;
        if (v14 < 0) {
          goto LABEL_128;
        }
        *(void *)&long long v51 = v14;
        uint64_t v5 = *(void **)a4;
        char v15 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)a4 = v5;
        if ((v15 & 1) == 0) {
          goto LABEL_129;
        }
        if ((a5 & 0x8000000000000000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_130;
    }
  }
  __break(1u);
LABEL_128:
  __break(1u);
LABEL_129:
  uint64_t v5 = sub_25B3D8954(v5);
  *(void *)a4 = v5;
  if ((a5 & 0x8000000000000000) != 0)
  {
LABEL_130:
    __break(1u);
  }
  else
  {
LABEL_10:
    if (a5 < v5[2])
    {
      uint64_t v16 = 16;
      return sub_25B3AA414((uint64_t)&v51, v16);
    }
  }
  __break(1u);
LABEL_132:
  __break(1u);
LABEL_133:
  uint64_t v5 = sub_25B3D8954(v5);
  *(void *)a4 = v5;
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    uint64_t v5 = sub_25B3D8954(v5);
    *(void *)a4 = v5;
    if ((a3 & 0x8000000000000000) != 0)
    {
LABEL_138:
      __break(1u);
      goto LABEL_139;
    }
LABEL_21:
    if (a3 >= v5[2])
    {
LABEL_139:
      __break(1u);
      goto LABEL_140;
    }
    sub_25B3AA414((uint64_t)&v51, 14);
    uint64_t v5 = *(void **)a4;
    unint64_t v6 = *(void *)a5;
    if (v13)
    {
      char v20 = 1;
      goto LABEL_93;
    }
    if ((v6 & 0x8000000000000000) != 0)
    {
LABEL_162:
      __break(1u);
      goto LABEL_163;
    }
    if (v6 >= v5[2])
    {
LABEL_163:
      __break(1u);
      goto LABEL_164;
    }
    uint64_t v28 = v5[v6 + 4];
    if (*(void *)(v28 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_25B3B25B4(2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
      if (v30)
      {
        sub_25B3BC63C(*(void *)(v28 + 56) + 40 * v29, (uint64_t)&v51);
        swift_bridgeObjectRelease();
        if (*((void *)&v52 + 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
          if (swift_dynamicCast())
          {
            char v20 = v50;
LABEL_92:
            uint64_t v5 = *(void **)a4;
LABEL_93:
            a3 = MEMORY[0x263F8D4F8];
            id v10 = &protocol witness table for Bool;
            *((void *)&v52 + 1) = MEMORY[0x263F8D4F8];
            uint64_t v53 = &protocol witness table for Bool;
            LOBYTE(v51) = v20;
            char v42 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)a4 = v5;
            if (v42)
            {
              if ((v6 & 0x8000000000000000) != 0)
              {
LABEL_150:
                __break(1u);
                goto LABEL_151;
              }
LABEL_95:
              if (v6 >= v5[2])
              {
LABEL_151:
                __break(1u);
                goto LABEL_152;
              }
              sub_25B3AA414((uint64_t)&v51, 2);
              uint64_t v5 = *(void **)a4;
              a5 = *(void *)a5;
              if (v13)
              {
                char v43 = 1;
                goto LABEL_122;
              }
              if ((a5 & 0x8000000000000000) != 0)
              {
LABEL_168:
                __break(1u);
                goto LABEL_169;
              }
              if (a5 >= v5[2])
              {
LABEL_169:
                __break(1u);
                JUMPOUT(0x25B3AEAECLL);
              }
              uint64_t v44 = v5[a5 + 4];
              if (*(void *)(v44 + 16))
              {
                swift_bridgeObjectRetain();
                uint64_t v45 = sub_25B3B25B4(1, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
                if (v46)
                {
                  sub_25B3BC63C(*(void *)(v44 + 56) + 40 * v45, (uint64_t)&v51);
                }
                else
                {
                  uint64_t v53 = 0;
                  long long v51 = 0u;
                  long long v52 = 0u;
                }
                swift_bridgeObjectRelease();
                if (*((void *)&v52 + 1))
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
                  if (swift_dynamicCast())
                  {
                    char v43 = v50;
LABEL_121:
                    uint64_t v5 = *(void **)a4;
LABEL_122:
                    *((void *)&v52 + 1) = a3;
                    uint64_t v53 = v10;
                    LOBYTE(v51) = v43;
                    char v48 = swift_isUniquelyReferenced_nonNull_native();
                    *(void *)a4 = v5;
                    if (v48)
                    {
                      if ((a5 & 0x8000000000000000) != 0)
                      {
LABEL_156:
                        __break(1u);
LABEL_157:
                        __break(1u);
                        goto LABEL_158;
                      }
LABEL_124:
                      if (a5 < v5[2])
                      {
                        uint64_t v16 = 1;
                        return sub_25B3AA414((uint64_t)&v51, v16);
                      }
                      goto LABEL_157;
                    }
LABEL_155:
                    uint64_t v5 = sub_25B3D8954(v5);
                    *(void *)a4 = v5;
                    if ((a5 & 0x8000000000000000) != 0) {
                      goto LABEL_156;
                    }
                    goto LABEL_124;
                  }
LABEL_120:
                  char v43 = 0;
                  goto LABEL_121;
                }
              }
              else
              {
                uint64_t v53 = 0;
                long long v51 = 0u;
                long long v52 = 0u;
              }
              sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
              goto LABEL_120;
            }
LABEL_149:
            uint64_t v5 = sub_25B3D8954(v5);
            *(void *)a4 = v5;
            if ((v6 & 0x8000000000000000) != 0) {
              goto LABEL_150;
            }
            goto LABEL_95;
          }
LABEL_91:
          char v20 = 0;
          goto LABEL_92;
        }
      }
      else
      {
        uint64_t v53 = 0;
        long long v51 = 0u;
        long long v52 = 0u;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v53 = 0;
      long long v51 = 0u;
      long long v52 = 0u;
    }
    sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
    goto LABEL_91;
  }
LABEL_15:
  if (a3 >= v5[2]) {
    goto LABEL_135;
  }
  sub_25B3AA414((uint64_t)&v51, 15);
  uint64_t v5 = *(void **)a4;
  a5 = *(void *)a5;
  if (v13)
  {
    char v18 = 1;
    goto LABEL_85;
  }
  if ((a5 & 0x8000000000000000) != 0)
  {
LABEL_160:
    __break(1u);
    goto LABEL_161;
  }
  if (a5 >= v5[2])
  {
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
  uint64_t v25 = v5[a5 + 4];
  if (!*(void *)(v25 + 16))
  {
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    goto LABEL_82;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_25B3B25B4(2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  if ((v27 & 1) == 0)
  {
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_82;
  }
  sub_25B3BC63C(*(void *)(v25 + 56) + 40 * v26, (uint64_t)&v51);
  swift_bridgeObjectRelease();
  if (!*((void *)&v52 + 1))
  {
LABEL_82:
    sub_25B3A9E54((uint64_t)&v51, &qword_26A4FB690);
    goto LABEL_83;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB638);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_83:
    char v18 = 0;
    goto LABEL_84;
  }
  char v18 = v50;
LABEL_84:
  uint64_t v5 = *(void **)a4;
LABEL_85:
  *((void *)&v52 + 1) = MEMORY[0x263F8D4F8];
  uint64_t v53 = &protocol witness table for Bool;
  LOBYTE(v51) = v18;
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)a4 = v5;
  if (v41)
  {
    if ((a5 & 0x8000000000000000) != 0)
    {
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
    goto LABEL_87;
  }
LABEL_146:
  uint64_t v5 = sub_25B3D8954(v5);
  *(void *)a4 = v5;
  if ((a5 & 0x8000000000000000) != 0) {
    goto LABEL_147;
  }
LABEL_87:
  if (a5 >= v5[2])
  {
LABEL_148:
    __break(1u);
    goto LABEL_149;
  }
  uint64_t v16 = 2;
  return sub_25B3AA414((uint64_t)&v51, v16);
}

void sub_25B3AEAFC(void *a1, uint64_t a2)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    uint64_t v4 = (void **)(a2 + 16);
    id v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      unint64_t v6 = v5;
      swift_beginAccess();
      id v7 = *v4;
      id v8 = v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        id v7 = sub_25B3B1358(0, v7[2] + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        id v7 = sub_25B3B1358((void *)(v10 > 1), v11 + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();
    }
    else
    {
      id v12 = objc_msgSend(a1, sel_description);
      uint64_t v13 = sub_25B3DCDE8();
      uint64_t v15 = v14;

      sub_25B3A9794();
      uint64_t v16 = swift_allocError();
      *(void *)uint64_t v17 = v13;
      *(void *)(v17 + 8) = v15;
      *(unsigned char *)(v17 + 16) = 2;
      swift_beginAccess();
      char v18 = *v4;
      char v19 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v18;
      if ((v19 & 1) == 0)
      {
        char v18 = sub_25B3B1358(0, v18[2] + 1, 1, v18);
        *uint64_t v4 = v18;
      }
      unint64_t v21 = v18[2];
      unint64_t v20 = v18[3];
      if (v21 >= v20 >> 1)
      {
        char v18 = sub_25B3B1358((void *)(v20 > 1), v21 + 1, 1, v18);
        *uint64_t v4 = v18;
      }
      v18[2] = v21 + 1;
      v18[v21 + 4] = v16;
      swift_endAccess();
    }
  }
}

void sub_25B3AED00(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_25B3AED68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v8 = sub_25B3DCC98();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = (uint64_t *)(a3 + 16);
  unint64_t v13 = 0x265494000uLL;
  objc_msgSend(a1, sel_timestamp);
  sub_25B3DCC28();
  char v24 = sub_25B3BCF9C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v24 == 3) {
    return 0;
  }
  if (v24 == 4)
  {
    uint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
    sub_25B3DD168();
LABEL_3:
    sub_25B3DCE28();
    [a1 *(SEL *)(v13 + 1944)];
    sub_25B3DCEF8();
    uint64_t v14 = v59;
    unint64_t v15 = v60;
    sub_25B3A9794();
    uint64_t v16 = swift_allocError();
    *(void *)uint64_t v17 = v14;
    *(void *)(v17 + 8) = v15;
    *(unsigned char *)(v17 + 16) = 2;
    swift_beginAccess();
    char v18 = (uint64_t *)*v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *id v12 = (uint64_t)v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v18 = sub_25B3B1358(0, v18[2] + 1, 1, v18);
      *id v12 = (uint64_t)v18;
    }
    unint64_t v21 = v18[2];
    unint64_t v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      char v18 = sub_25B3B1358((void *)(v20 > 1), v21 + 1, 1, v18);
      *id v12 = (uint64_t)v18;
    }
    v18[2] = v21 + 1;
    v18[v21 + 4] = v16;
    swift_endAccess();
    return 1;
  }
  unint64_t v25 = 0x265494000uLL;
  id v26 = objc_msgSend(a1, sel_eventBody);
  if (!v26) {
    return 1;
  }
  char v27 = v26;
  id v28 = objc_msgSend(v26, sel_timeouts);

  sub_25B3BD648(0, &qword_26B346810);
  unint64_t v29 = sub_25B3DCE88();

  if (v29 >> 62)
  {
LABEL_44:
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_25B3DD248();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_15;
    }
LABEL_45:
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v30) {
    goto LABEL_45;
  }
LABEL_15:
  id v31 = [a1 *(SEL *)(v25 + 1936)];
  if (!v31
    || (char v32 = v31, v33 = objc_msgSend(v31, sel_identifier), v32, !v33))
  {
    swift_bridgeObjectRelease();
    uint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
    sub_25B3DD168();
    goto LABEL_3;
  }
  uint64_t v34 = sub_25B3DCDE8();
  unint64_t v36 = v35;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v37 = sub_25B3D54BC((uint64_t *)&v58, v34, v36);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_25B3DCD98();
    __swift_project_value_buffer(v40, (uint64_t)qword_26B346958);
    swift_bridgeObjectRetain();
    char v41 = sub_25B3DCD78();
    os_log_type_t v42 = sub_25B3DCF58();
    if (os_log_type_enabled(v41, v42))
    {
      char v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v59 = v44;
      *(_DWORD *)char v43 = 136315138;
      swift_bridgeObjectRetain();
      char v58 = (void *)sub_25B3B1CCC(v34, v36, &v59);
      sub_25B3DD018();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25B39F000, v41, v42, "ignoring duplicate timeout session %s", v43, 0xCu);
      uint64_t v22 = 1;
      swift_arrayDestroy();
      MEMORY[0x261163250](v44, -1, -1);
      MEMORY[0x261163250](v43, -1, -1);

      return v22;
    }

LABEL_37:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  id v12 = (uint64_t *)(a5 + 16);
  swift_bridgeObjectRelease();
  a5 = v29 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  unint64_t v25 = 4;
  while (1)
  {
    if (a5) {
      id v38 = (id)MEMORY[0x2611628B0](v25 - 4, v29);
    }
    else {
      id v38 = *(id *)(v29 + 8 * v25);
    }
    a1 = v38;
    unint64_t v13 = v25 - 3;
    if (__OFADD__(v25 - 4, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    unsigned int v39 = objc_msgSend(v38, sel_occurrence);

    if (v39 == 1) {
      break;
    }
    ++v25;
    if (v13 == v30) {
      goto LABEL_37;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_beginAccess();
  char v45 = swift_isUniquelyReferenced_nonNull_native();
  char v58 = (void *)*v12;
  uint64_t v46 = (uint64_t)v58;
  *id v12 = 0x8000000000000000;
  unint64_t v48 = sub_25B3B251C(v24);
  uint64_t v49 = *(void *)(v46 + 16);
  BOOL v50 = (v47 & 1) == 0;
  uint64_t v51 = v49 + v50;
  if (__OFADD__(v49, v50))
  {
    __break(1u);
    goto LABEL_47;
  }
  LOBYTE(a1) = v47;
  if (*(void *)(v46 + 24) >= v51)
  {
    if ((v45 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_39;
  }
  sub_25B3B4CD4(v51, v45);
  uint64_t v46 = (uint64_t)v58;
  unint64_t v52 = sub_25B3B251C(v24);
  if ((a1 & 1) == (v53 & 1))
  {
    unint64_t v48 = v52;
    while (1)
    {
LABEL_39:
      *id v12 = v46;
      swift_bridgeObjectRelease();
      id v12 = (uint64_t *)*v12;
      swift_bridgeObjectRetain();
      if ((a1 & 1) == 0) {
        sub_25B3D88D4(v48, v24, 0, v12);
      }
      uint64_t v54 = v12[7];
      uint64_t v55 = *(void *)(v54 + 8 * v48);
      BOOL v56 = __CFADD__(v55, 1);
      uint64_t v57 = v55 + 1;
      if (!v56) {
        break;
      }
LABEL_47:
      __break(1u);
LABEL_48:
      sub_25B3B7080();
      uint64_t v46 = (uint64_t)v58;
    }
    *(void *)(v54 + 8 * v48) = v57;
    swift_endAccess();
    goto LABEL_45;
  }
  uint64_t result = sub_25B3DD378();
  __break(1u);
  return result;
}

uint64_t sub_25B3AF484(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_25B3AF4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB628);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B3DE840;
  *(unsigned char *)(inited + 32) = 36;
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = &protocol witness table for String;
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  *(unsigned char *)(inited + 80) = 2;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 112) = MEMORY[0x263F8D4F8];
  *(void *)(inited + 120) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 88) = a3;
  *(unsigned char *)(inited + 128) = 1;
  *(void *)(inited + 160) = v11;
  *(void *)(inited + 168) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 136) = a3;
  *(unsigned char *)(inited + 176) = 0;
  *(void *)(inited + 208) = v11;
  *(void *)(inited + 216) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 184) = a3;
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_25B3A67B8(inited);
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  unint64_t v19 = sub_25B3A9238(MEMORY[0x263F8EE78]);
  char v18 = byte_2708ECC38;
  sub_25B3AFC94((unint64_t)&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  char v18 = byte_2708ECC39;
  sub_25B3AFC94((unint64_t)&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  char v18 = byte_2708ECC3A;
  sub_25B3AFC94((unint64_t)&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  unint64_t v12 = v22;
  unint64_t v13 = *a5;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a5 = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v13 = sub_25B3B19A4(0, v13[2] + 1, 1, v13, &qword_26A4FB698, &qword_26A4FB4C8);
    *a5 = v13;
  }
  unint64_t v16 = v13[2];
  unint64_t v15 = v13[3];
  if (v16 >= v15 >> 1)
  {
    unint64_t v13 = sub_25B3B19A4((void *)(v15 > 1), v16 + 1, 1, v13, &qword_26A4FB698, &qword_26A4FB4C8);
    *a5 = v13;
  }
  uint64_t v13[2] = v16 + 1;
  v13[v16 + 4] = v12;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B3AF710(uint64_t a1, char a2, uint64_t a3, void **a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB628);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B3DE840;
  *(unsigned char *)(inited + 32) = 36;
  uint64_t v9 = sub_25B3B1004();
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = &protocol witness table for String;
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 48) = v11;
  *(unsigned char *)(inited + 80) = 2;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 112) = MEMORY[0x263F8D4F8];
  *(void *)(inited + 120) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 88) = a2;
  *(unsigned char *)(inited + 128) = 1;
  *(void *)(inited + 160) = v12;
  *(void *)(inited + 168) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 136) = a2;
  *(unsigned char *)(inited + 176) = 0;
  *(void *)(inited + 208) = v12;
  *(void *)(inited + 216) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 184) = a2;
  unint64_t v13 = sub_25B3A67B8(inited);
  uint64_t v53 = v13;
  uint64_t v14 = *(char **)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v14)
  {
    uint64_t v15 = v13;
    char v45 = a4;
    uint64_t v16 = *(void *)&v14[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
    uint64_t v17 = *(void *)&v14[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
    uint64_t v49 = v10;
    BOOL v50 = &protocol witness table for String;
    *(void *)&long long v48 = v16;
    *((void *)&v48 + 1) = v17;
    sub_25B3A95E8(&v48, (uint64_t)v46);
    char v18 = v14;
    swift_bridgeObjectRetain();
    LOBYTE(v17) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v15;
    uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x270FA5388](v19);
    uint64_t v21 = (uint64_t *)((char *)&v46[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v22 + 16))(v21);
    sub_25B3B8CFC(*v21, v21[1], 38, v17, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    uint64_t v23 = v52[0];
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
    uint64_t v25 = *(void *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8];
    uint64_t v49 = v10;
    BOOL v50 = &protocol witness table for String;
    *(void *)&long long v48 = v24;
    *((void *)&v48 + 1) = v25;
    sub_25B3A95E8(&v48, (uint64_t)v46);
    swift_bridgeObjectRetain();
    LOBYTE(v25) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v23;
    uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x270FA5388](v26);
    id v28 = (uint64_t *)((char *)&v46[-1] - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v29 + 16))(v28);
    sub_25B3B8CFC(*v28, v28[1], 39, v25, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    uint64_t v30 = v52[0];
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
    uint64_t v32 = *(void *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8];
    uint64_t v49 = v10;
    BOOL v50 = &protocol witness table for String;
    *(void *)&long long v48 = v31;
    *((void *)&v48 + 1) = v32;
    sub_25B3A95E8(&v48, (uint64_t)v46);
    swift_bridgeObjectRetain();
    LOBYTE(v32) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v30;
    uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x270FA5388](v33);
    unint64_t v35 = (uint64_t *)((char *)&v46[-1] - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v36 + 16))(v35);
    char v37 = v32;
    a4 = v45;
    sub_25B3B8CFC(*v35, v35[1], 37, v37, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    uint64_t v53 = v52[0];

    swift_bridgeObjectRelease();
  }
  *(void *)&long long v48 = 0;
  v46[0] = 0;
  v52[0] = sub_25B3A9238(MEMORY[0x263F8EE78]);
  char v51 = byte_2708ECC60;
  uint64_t v38 = a2 & 1;
  sub_25B3AFC94((unint64_t)&v51, (double *)&v48, v38, a3, v46, v52);
  char v51 = byte_2708ECC61;
  sub_25B3AFC94((unint64_t)&v51, (double *)&v48, v38, a3, v46, v52);
  char v51 = byte_2708ECC62;
  sub_25B3AFC94((unint64_t)&v51, (double *)&v48, v38, a3, v46, v52);
  uint64_t v39 = v53;
  uint64_t v40 = *a4;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v40;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v40 = sub_25B3B19A4(0, v40[2] + 1, 1, v40, &qword_26A4FB698, &qword_26A4FB4C8);
    *a4 = v40;
  }
  unint64_t v43 = v40[2];
  unint64_t v42 = v40[3];
  if (v43 >= v42 >> 1)
  {
    uint64_t v40 = sub_25B3B19A4((void *)(v42 > 1), v43 + 1, 1, v40, &qword_26A4FB698, &qword_26A4FB4C8);
    *a4 = v40;
  }
  v40[2] = v43 + 1;
  v40[v43 + 4] = v39;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25B3AFC94(unint64_t result, double *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t *a6)
{
  uint64_t v10 = *(unsigned __int8 *)result;
  double v11 = 0.0;
  if (*(void *)(a4 + 16))
  {
    uint64_t result = sub_25B3B251C(*(unsigned char *)result);
    if (v12) {
      double v11 = *(double *)(*(void *)(a4 + 56) + 24 * result);
    }
  }
  *a2 = v11 + *a2;
  uint64_t v13 = *(void *)(a4 + 16);
  if (v13)
  {
    uint64_t result = sub_25B3B251C(v10);
    if (v14) {
      uint64_t v13 = *(void *)(*(void *)(a4 + 56) + 24 * result + 8);
    }
    else {
      uint64_t v13 = 0;
    }
  }
  BOOL v15 = __CFADD__(*a5, v13);
  unint64_t v16 = *a5 + v13;
  if (v15)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  *a5 = v16;
  if (*(void *)(a4 + 16))
  {
    uint64_t result = sub_25B3B251C(v10);
    if (v17)
    {
      MEMORY[0x270FA5388](result);
      uint64_t v18 = swift_bridgeObjectRetain();
      sub_25B3BA1E4(v18, (uint64_t (*)(void, void))sub_25B3BD424);
      uint64_t result = swift_bridgeObjectRelease();
    }
    unint64_t v16 = *a5;
  }
  if (v16) {
    double v19 = *a2 / (double)v16;
  }
  else {
    double v19 = 0.0;
  }
  uint64_t v20 = *a6;
  if (!*(void *)(*a6 + 16)) {
    goto LABEL_20;
  }
  uint64_t result = sub_25B3B246C(0);
  uint64_t v21 = 0;
  if (v22)
  {
    uint64_t v21 = *(void *)(*(void *)(v20 + 56) + 8 * result);
    if (v21 < 0)
    {
      __break(1u);
LABEL_20:
      uint64_t v21 = 0;
    }
  }
  uint64_t v23 = *a6;
  if (!*(void *)(*a6 + 16)) {
    goto LABEL_25;
  }
  uint64_t result = sub_25B3B246C(2);
  if ((v24 & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v25 = *(void *)(*(void *)(v23 + 56) + 8 * result);
  if (v25 < 0)
  {
    __break(1u);
LABEL_25:
    uint64_t v25 = 0;
  }
  uint64_t v26 = *a6;
  if (*(void *)(*a6 + 16))
  {
    uint64_t result = sub_25B3B246C(4);
    if (v27)
    {
      uint64_t v28 = *(void *)(*(void *)(v26 + 56) + 8 * result);
      if ((v28 & 0x8000000000000000) == 0) {
        goto LABEL_31;
      }
      __break(1u);
    }
  }
  uint64_t v28 = 0;
LABEL_31:
  uint64_t v29 = *a6;
  uint64_t v30 = *(void *)(*a6 + 16);
  if (v30)
  {
    uint64_t result = sub_25B3B246C(3);
    if ((v31 & 1) == 0)
    {
LABEL_35:
      uint64_t v30 = 0;
      goto LABEL_36;
    }
    uint64_t v30 = *(void *)(*(void *)(v29 + 56) + 8 * result);
    if (v30 < 0)
    {
      __break(1u);
      goto LABEL_35;
    }
  }
LABEL_36:
  uint64_t v68 = v21;
  uint64_t v69 = v30;
  uint64_t v32 = *a6;
  if (!*(void *)(*a6 + 16)) {
    goto LABEL_40;
  }
  uint64_t result = sub_25B3B246C(5);
  if ((v33 & 1) == 0) {
    goto LABEL_40;
  }
  uint64_t v34 = *(void *)(*(void *)(v32 + 56) + 8 * result);
  if (v34 < 0)
  {
    __break(1u);
LABEL_40:
    uint64_t v34 = 0;
  }
  uint64_t v35 = *a6;
  uint64_t v67 = v28;
  if (*(void *)(*a6 + 16))
  {
    uint64_t result = sub_25B3B246C(6);
    if (v36)
    {
      uint64_t v37 = *(void *)(*(void *)(v35 + 56) + 8 * result);
      if ((v37 & 0x8000000000000000) == 0) {
        goto LABEL_46;
      }
      __break(1u);
    }
  }
  uint64_t v37 = 0;
LABEL_46:
  uint64_t v38 = *a6;
  uint64_t v39 = *(void *)(*a6 + 16);
  if (v39)
  {
    uint64_t result = sub_25B3B246C(1);
    if ((v40 & 1) == 0)
    {
LABEL_50:
      uint64_t v39 = 0;
      goto LABEL_51;
    }
    uint64_t v39 = *(void *)(*(void *)(v38 + 56) + 8 * result);
    if (v39 < 0)
    {
      __break(1u);
      goto LABEL_50;
    }
  }
LABEL_51:
  BOOL v41 = __OFADD__(v39, v34);
  uint64_t v42 = v39 + v34;
  if (v41)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  uint64_t v43 = v42 + v37;
  if (__OFADD__(v42, v37))
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  uint64_t v66 = v25;
  int64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = *a6;
  uint64_t v47 = 1 << *(unsigned char *)(*a6 + 32);
  uint64_t v48 = -1;
  if (v47 < 64) {
    uint64_t v48 = ~(-1 << v47);
  }
  uint64_t v50 = *(void *)(v46 + 64);
  uint64_t v49 = v46 + 64;
  unint64_t v51 = v48 & v50;
  int64_t v52 = (unint64_t)(v47 + 63) >> 6;
  while (v51)
  {
    unint64_t v53 = __clz(__rbit64(v51));
    v51 &= v51 - 1;
    unint64_t v54 = v53 | (v44 << 6);
LABEL_57:
    uint64_t v55 = *(void *)(*(void *)(*a6 + 56) + 8 * v54);
    BOOL v15 = __CFADD__(v45, v55);
    v45 += v55;
    if (v15)
    {
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
  }
  BOOL v41 = __OFADD__(v44++, 1);
  if (v41) {
    goto LABEL_92;
  }
  if (v44 < v52)
  {
    unint64_t v56 = *(void *)(v49 + 8 * v44);
    if (!v56)
    {
      int64_t v57 = v44 + 1;
      if (v44 + 1 >= v52) {
        goto LABEL_78;
      }
      unint64_t v56 = *(void *)(v49 + 8 * v57);
      if (!v56)
      {
        int64_t v57 = v44 + 2;
        if (v44 + 2 >= v52) {
          goto LABEL_78;
        }
        unint64_t v56 = *(void *)(v49 + 8 * v57);
        if (!v56)
        {
          int64_t v57 = v44 + 3;
          if (v44 + 3 >= v52) {
            goto LABEL_78;
          }
          unint64_t v56 = *(void *)(v49 + 8 * v57);
          if (!v56)
          {
            int64_t v57 = v44 + 4;
            if (v44 + 4 >= v52) {
              goto LABEL_78;
            }
            unint64_t v56 = *(void *)(v49 + 8 * v57);
            if (!v56)
            {
              int64_t v57 = v44 + 5;
              if (v44 + 5 >= v52) {
                goto LABEL_78;
              }
              unint64_t v56 = *(void *)(v49 + 8 * v57);
              if (!v56)
              {
                while (1)
                {
                  int64_t v44 = v57 + 1;
                  if (__OFADD__(v57, 1)) {
                    break;
                  }
                  if (v44 >= v52) {
                    goto LABEL_78;
                  }
                  unint64_t v56 = *(void *)(v49 + 8 * v44);
                  ++v57;
                  if (v56) {
                    goto LABEL_73;
                  }
                }
LABEL_97:
                __break(1u);
                JUMPOUT(0x25B3B0458);
              }
            }
          }
        }
      }
      int64_t v44 = v57;
    }
LABEL_73:
    unint64_t v58 = __clz(__rbit64(v56));
    unint64_t v51 = (v56 - 1) & v56;
    unint64_t v54 = v58 + (v44 << 6);
    goto LABEL_57;
  }
LABEL_78:
  if (v45 < 0)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  switch(v10)
  {
    case 1:
      uint64_t v71 = MEMORY[0x263F8D538];
      char v72 = (char **)&protocol witness table for Double;
      *(double *)char v70 = v19;
      sub_25B3AA414((uint64_t)v70, 6);
      uint64_t v61 = MEMORY[0x263F8D6C8];
      uint64_t v71 = MEMORY[0x263F8D6C8];
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v68;
      sub_25B3AA414((uint64_t)v70, 33);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v43;
      sub_25B3AA414((uint64_t)v70, 12);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v66;
      sub_25B3AA414((uint64_t)v70, 27);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v67;
      sub_25B3AA414((uint64_t)v70, 23);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v69;
      sub_25B3AA414((uint64_t)v70, 9);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v34;
      sub_25B3AA414((uint64_t)v70, 30);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v37;
      sub_25B3AA414((uint64_t)v70, 18);
      uint64_t v71 = v61;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v45;
      uint64_t result = sub_25B3AA414((uint64_t)v70, 21);
      if (*(void *)(a4 + 16))
      {
        uint64_t result = sub_25B3B251C(1u);
        if (v62)
        {
          if (*(void *)(*(void *)(a4 + 56) + 24 * result + 8))
          {
            uint64_t v71 = MEMORY[0x263F8D4F8];
            char v72 = &protocol witness table for Bool;
            LOBYTE(v70[0]) = 1;
            uint64_t v60 = 2;
            goto LABEL_81;
          }
        }
      }
      break;
    case 2:
      uint64_t v71 = MEMORY[0x263F8D538];
      char v72 = (char **)&protocol witness table for Double;
      *(double *)char v70 = v19;
      sub_25B3AA414((uint64_t)v70, 5);
      uint64_t v63 = MEMORY[0x263F8D6C8];
      uint64_t v71 = MEMORY[0x263F8D6C8];
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v68;
      sub_25B3AA414((uint64_t)v70, 32);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v43;
      sub_25B3AA414((uint64_t)v70, 11);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v66;
      sub_25B3AA414((uint64_t)v70, 26);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v67;
      sub_25B3AA414((uint64_t)v70, 22);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v69;
      sub_25B3AA414((uint64_t)v70, 8);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v34;
      sub_25B3AA414((uint64_t)v70, 29);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v37;
      sub_25B3AA414((uint64_t)v70, 17);
      uint64_t v71 = v63;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v45;
      uint64_t result = sub_25B3AA414((uint64_t)v70, 20);
      if (*(void *)(a4 + 16))
      {
        uint64_t result = sub_25B3B251C(2u);
        if (v64)
        {
          if (*(void *)(*(void *)(a4 + 56) + 24 * result + 8))
          {
            uint64_t v65 = MEMORY[0x263F8D4F8];
            uint64_t v71 = MEMORY[0x263F8D4F8];
            char v72 = &protocol witness table for Bool;
            LOBYTE(v70[0]) = 1;
            sub_25B3AA414((uint64_t)v70, 2);
            uint64_t v71 = v65;
            char v72 = &protocol witness table for Bool;
            LOBYTE(v70[0]) = 1;
            uint64_t v60 = 1;
            goto LABEL_81;
          }
        }
      }
      break;
    case 3:
      return result;
    default:
      uint64_t v71 = MEMORY[0x263F8D538];
      char v72 = (char **)&protocol witness table for Double;
      *(double *)char v70 = v19;
      sub_25B3AA414((uint64_t)v70, 7);
      uint64_t v59 = MEMORY[0x263F8D6C8];
      uint64_t v71 = MEMORY[0x263F8D6C8];
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v68;
      sub_25B3AA414((uint64_t)v70, 34);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v43;
      sub_25B3AA414((uint64_t)v70, 13);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v66;
      sub_25B3AA414((uint64_t)v70, 28);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v67;
      sub_25B3AA414((uint64_t)v70, 24);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v69;
      sub_25B3AA414((uint64_t)v70, 10);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v34;
      sub_25B3AA414((uint64_t)v70, 31);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v37;
      sub_25B3AA414((uint64_t)v70, 19);
      uint64_t v71 = v59;
      char v72 = (char **)&protocol witness table for Int;
      v70[0] = v45;
      uint64_t v60 = 25;
LABEL_81:
      uint64_t result = sub_25B3AA414((uint64_t)v70, v60);
      break;
  }
  return result;
}

uint64_t sub_25B3B0468(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  unint64_t v8 = 0;
  uint64_t result = sub_25B3A9238(MEMORY[0x263F8EE78]);
  uint64_t v93 = (void *)result;
  if (!*(void *)(a3 + 16))
  {
    double v10 = 0.0;
    goto LABEL_14;
  }
  uint64_t result = sub_25B3B251C(0);
  double v10 = 0.0;
  double v11 = 0.0;
  if (v12) {
    double v11 = *(double *)(*(void *)(a3 + 56) + 24 * result);
  }
  if (*(void *)(a3 + 16))
  {
    uint64_t result = sub_25B3B251C(0);
    if (v13)
    {
      unint64_t v14 = *(void *)(*(void *)(a3 + 56) + 24 * result + 8);
      if (!*(void *)(a3 + 16))
      {
LABEL_12:
        if (v14) {
          double v10 = (v11 + 0.0) / (double)v14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      unint64_t v14 = 0;
      if (!*(void *)(a3 + 16)) {
        goto LABEL_12;
      }
    }
    uint64_t result = sub_25B3B251C(0);
    if (v15)
    {
      MEMORY[0x270FA5388](result);
      unint64_t v4 = (unint64_t)v82;
      v82[2] = &v93;
      uint64_t v16 = swift_bridgeObjectRetain();
      sub_25B3BA1E4(v16, (uint64_t (*)(void, void))sub_25B3BD684);
      uint64_t result = swift_bridgeObjectRelease();
    }
    goto LABEL_12;
  }
LABEL_14:
  char v17 = v93;
  uint64_t v18 = v93[2];
  if (!v18)
  {
LABEL_27:
    uint64_t v26 = 0;
    uint64_t v86 = 0;
    unint64_t v4 = 0;
    uint64_t v19 = 0;
LABEL_31:
    uint64_t v23 = 0;
LABEL_32:
    uint64_t v27 = 0;
    goto LABEL_33;
  }
  uint64_t result = sub_25B3B246C(0);
  uint64_t v19 = 0;
  if (v20)
  {
    uint64_t v19 = *(void *)(v17[7] + 8 * result);
    if (v19 < 0)
    {
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
      goto LABEL_92;
    }
  }
  uint64_t v18 = v17[2];
  if (!v18)
  {
    uint64_t v26 = 0;
    uint64_t v86 = 0;
    unint64_t v4 = 0;
    goto LABEL_31;
  }
  uint64_t result = sub_25B3B246C(2);
  if ((v21 & 1) == 0)
  {
    unint64_t v4 = 0;
    uint64_t v18 = v17[2];
    if (v18) {
      goto LABEL_21;
    }
LABEL_30:
    uint64_t v26 = 0;
    uint64_t v86 = 0;
    goto LABEL_31;
  }
  unint64_t v4 = *(void *)(v17[7] + 8 * result);
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  uint64_t v18 = v17[2];
  if (!v18) {
    goto LABEL_30;
  }
LABEL_21:
  uint64_t result = sub_25B3B246C(4);
  if (v22)
  {
    uint64_t v23 = *(void *)(v17[7] + 8 * result);
    if ((v23 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v17[2];
      if (v18) {
        goto LABEL_24;
      }
LABEL_68:
      uint64_t v26 = 0;
      uint64_t v86 = 0;
      goto LABEL_32;
    }
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  uint64_t v23 = 0;
  uint64_t v18 = v17[2];
  if (!v18) {
    goto LABEL_68;
  }
LABEL_24:
  uint64_t result = sub_25B3B246C(3);
  if (v24)
  {
    uint64_t v18 = v17[7];
    uint64_t v25 = *(void *)(v18 + 8 * result);
    if (v25 < 0)
    {
      __break(1u);
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v18 = v17[2];
  uint64_t v86 = v25;
  if (!v18)
  {
LABEL_77:
    uint64_t v26 = 0;
    goto LABEL_32;
  }
  uint64_t result = sub_25B3B246C(5);
  if (v79)
  {
    uint64_t v27 = *(void *)(v17[7] + 8 * result);
    if ((v27 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v17[2];
      if (v18) {
        goto LABEL_74;
      }
LABEL_79:
      uint64_t v26 = 0;
      goto LABEL_33;
    }
LABEL_96:
    __break(1u);
    return result;
  }
  uint64_t v27 = 0;
  uint64_t v18 = v17[2];
  if (!v18) {
    goto LABEL_79;
  }
LABEL_74:
  uint64_t result = sub_25B3B246C(6);
  if (v80)
  {
    uint64_t v18 = v17[7];
    uint64_t v26 = *(void *)(v18 + 8 * result);
    if (v26 < 0)
    {
      __break(1u);
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  uint64_t v18 = v17[2];
  if (v18)
  {
    uint64_t result = sub_25B3B246C(1);
    if (v81)
    {
      uint64_t v18 = *(void *)(v17[7] + 8 * result);
      if ((v18 & 0x8000000000000000) == 0) {
        goto LABEL_33;
      }
      __break(1u);
LABEL_85:
      __break(1u);
    }
    uint64_t v18 = 0;
  }
LABEL_33:
  BOOL v28 = __OFADD__(v18, v27);
  uint64_t v29 = v18 + v27;
  if (v28)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  uint64_t v30 = v29 + v26;
  if (__OFADD__(v29, v26))
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  uint64_t v85 = v23;
  int64_t v31 = 0;
  uint64_t v23 = 0;
  uint64_t v32 = v17 + 8;
  uint64_t v33 = 1 << *((unsigned char *)v17 + 32);
  uint64_t v34 = -1;
  if (v33 < 64) {
    uint64_t v34 = ~(-1 << v33);
  }
  unint64_t v35 = v34 & v17[8];
  int64_t v36 = (unint64_t)(v33 + 63) >> 6;
  while (1)
  {
    if (v35)
    {
      unint64_t v37 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      unint64_t v38 = v37 | (v31 << 6);
      goto LABEL_39;
    }
    BOOL v28 = __OFADD__(v31++, 1);
    if (v28)
    {
      __break(1u);
      goto LABEL_88;
    }
    if (v31 >= v36) {
      break;
    }
    unint64_t v41 = v32[v31];
    if (!v41)
    {
      int64_t v42 = v31 + 1;
      if (v31 + 1 >= v36) {
        break;
      }
      unint64_t v41 = v32[v42];
      if (!v41)
      {
        int64_t v42 = v31 + 2;
        if (v31 + 2 >= v36) {
          break;
        }
        unint64_t v41 = v32[v42];
        if (!v41)
        {
          int64_t v42 = v31 + 3;
          if (v31 + 3 >= v36) {
            break;
          }
          unint64_t v41 = v32[v42];
          if (!v41)
          {
            int64_t v42 = v31 + 4;
            if (v31 + 4 >= v36) {
              break;
            }
            unint64_t v41 = v32[v42];
            if (!v41)
            {
              int64_t v42 = v31 + 5;
              if (v31 + 5 >= v36) {
                break;
              }
              unint64_t v41 = v32[v42];
              if (!v41)
              {
                while (1)
                {
                  int64_t v31 = v42 + 1;
                  if (__OFADD__(v42, 1)) {
                    break;
                  }
                  if (v31 >= v36) {
                    goto LABEL_60;
                  }
                  unint64_t v41 = v32[v31];
                  ++v42;
                  if (v41) {
                    goto LABEL_55;
                  }
                }
                __break(1u);
                goto LABEL_94;
              }
            }
          }
        }
      }
      int64_t v31 = v42;
    }
LABEL_55:
    unint64_t v43 = __clz(__rbit64(v41));
    unint64_t v35 = (v41 - 1) & v41;
    unint64_t v38 = v43 + (v31 << 6);
LABEL_39:
    uint64_t v39 = *(void *)(v17[7] + 8 * v38);
    BOOL v40 = __CFADD__(v23, v39);
    v23 += v39;
    if (v40) {
      goto LABEL_85;
    }
  }
LABEL_60:
  if (v23 < 0) {
    goto LABEL_91;
  }
  unint64_t v84 = a4;
  uint64_t v44 = v26;
  uint64_t v45 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB708);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B3DE850;
  *(unsigned char *)(inited + 32) = 13;
  uint64_t v47 = sub_25B3B1004();
  uint64_t v48 = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = &protocol witness table for String;
  *(void *)(inited + 40) = v47;
  *(void *)(inited + 48) = v49;
  *(unsigned char *)(inited + 80) = 2;
  *(void *)(inited + 112) = MEMORY[0x263F8D538];
  *(void *)(inited + 120) = &protocol witness table for Double;
  *(unsigned char *)(inited + 128) = 12;
  uint64_t v50 = MEMORY[0x263F8D6C8];
  *(double *)(inited + 88) = v10;
  *(void *)(inited + 160) = v50;
  *(void *)(inited + 168) = &protocol witness table for Int;
  *(void *)(inited + 136) = v19;
  *(unsigned char *)(inited + 176) = 5;
  *(void *)(inited + 208) = v50;
  *(void *)(inited + 216) = &protocol witness table for Int;
  *(void *)(inited + 184) = v45;
  *(unsigned char *)(inited + 224) = 8;
  *(void *)(inited + 256) = v50;
  *(void *)(inited + 264) = &protocol witness table for Int;
  *(void *)(inited + 232) = v4;
  *(unsigned char *)(inited + 272) = 7;
  *(void *)(inited + 304) = v50;
  *(void *)(inited + 312) = &protocol witness table for Int;
  *(void *)(inited + 280) = v85;
  *(unsigned char *)(inited + 320) = 3;
  *(void *)(inited + 352) = v50;
  *(void *)(inited + 360) = &protocol witness table for Int;
  *(void *)(inited + 328) = v86;
  *(unsigned char *)(inited + 368) = 10;
  *(void *)(inited + 400) = v50;
  *(void *)(inited + 408) = &protocol witness table for Int;
  *(void *)(inited + 376) = v27;
  *(unsigned char *)(inited + 416) = 6;
  *(void *)(inited + 448) = v50;
  *(void *)(inited + 456) = &protocol witness table for Int;
  *(void *)(inited + 424) = v44;
  uint64_t v51 = v48;
  *(unsigned char *)(inited + 464) = 9;
  *(void *)(inited + 496) = v50;
  *(void *)(inited + 504) = &protocol witness table for Int;
  *(void *)(inited + 472) = v23;
  *(unsigned char *)(inited + 512) = 1;
  *(void *)&long long v90 = 5;
  uint64_t v52 = sub_25B3DD318();
  *(void *)(inited + 544) = v51;
  *(void *)(inited + 552) = &protocol witness table for String;
  *(void *)(inited + 520) = v52;
  *(void *)(inited + 528) = v53;
  unint64_t v8 = sub_25B3A67E0(inited);
  unint64_t v54 = *(char **)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v54)
  {
    uint64_t v55 = *(void *)&v54[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
    uint64_t v56 = *(void *)&v54[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
    uint64_t v91 = v51;
    v92 = &protocol witness table for String;
    *(void *)&long long v90 = v55;
    *((void *)&v90 + 1) = v56;
    sub_25B3A95E8(&v90, (uint64_t)v88);
    int64_t v57 = v54;
    swift_bridgeObjectRetain();
    LOBYTE(v56) = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v87 = v8;
    uint64_t v58 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x270FA5388](v58);
    uint64_t v60 = (uint64_t *)((char *)&v83 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v61 + 16))(v60);
    sub_25B3B93D0(*v60, v60[1], 15, v56, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    unint64_t v62 = v87;
    swift_bridgeObjectRelease();
    uint64_t v63 = *(void *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
    uint64_t v64 = *(void *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8];
    uint64_t v91 = v51;
    v92 = &protocol witness table for String;
    *(void *)&long long v90 = v63;
    *((void *)&v90 + 1) = v64;
    sub_25B3A95E8(&v90, (uint64_t)v88);
    swift_bridgeObjectRetain();
    LOBYTE(v64) = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v87 = v62;
    uint64_t v65 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x270FA5388](v65);
    uint64_t v67 = (uint64_t *)((char *)&v83 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v68 + 16))(v67);
    sub_25B3B93D0(*v67, v67[1], 16, v64, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    unint64_t v69 = v87;
    swift_bridgeObjectRelease();
    uint64_t v70 = *(void *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
    uint64_t v71 = *(void *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8];
    uint64_t v91 = v51;
    v92 = &protocol witness table for String;
    *(void *)&long long v90 = v70;
    *((void *)&v90 + 1) = v71;
    sub_25B3A95E8(&v90, (uint64_t)v88);
    swift_bridgeObjectRetain();
    LOBYTE(v71) = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v87 = v69;
    uint64_t v72 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x270FA5388](v72);
    uint64_t v74 = (uint64_t *)((char *)&v83 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v75 + 16))(v74);
    sub_25B3B93D0(*v74, v74[1], 14, v71, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    unint64_t v8 = v87;

    swift_bridgeObjectRelease();
  }
  unint64_t v4 = (unint64_t)v84;
  char v17 = *v84;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)unint64_t v4 = v17;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_92:
    char v17 = sub_25B3B19A4(0, v17[2] + 1, 1, v17, &qword_26A4FB710, &qword_26A4FB718);
    *(void *)unint64_t v4 = v17;
  }
  unint64_t v78 = v17[2];
  unint64_t v77 = v17[3];
  if (v78 >= v77 >> 1)
  {
    char v17 = sub_25B3B19A4((void *)(v77 > 1), v78 + 1, 1, v17, &qword_26A4FB710, &qword_26A4FB718);
    *(void *)unint64_t v4 = v17;
  }
  v17[2] = v78 + 1;
  v17[v78 + 4] = v8;
  return swift_bridgeObjectRelease();
}

unint64_t sub_25B3B0DD4(uint64_t a1, uint64_t a2, void **a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v8 = *a3;
  char v22 = *a3;
  *a3 = (void *)0x8000000000000000;
  unint64_t v10 = sub_25B3B246C(a1);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  char v3 = v9;
  if (v8[3] >= v13)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    sub_25B3B35C0(v13, isUniquelyReferenced_nonNull_native);
    unint64_t v8 = v22;
    unint64_t v14 = sub_25B3B246C(a1);
    if ((v3 & 1) != (v15 & 1))
    {
      unint64_t result = sub_25B3DD378();
      __break(1u);
      return result;
    }
    unint64_t v10 = v14;
  }
  while (1)
  {
    *a3 = v8;
    unint64_t result = swift_bridgeObjectRelease();
    char v17 = *a3;
    if ((v3 & 1) == 0) {
      unint64_t result = sub_25B3D879C(v10, a1, 0, *a3);
    }
    uint64_t v18 = v17[7];
    uint64_t v19 = *(void *)(v18 + 8 * v10);
    BOOL v20 = __CFADD__(v19, a2);
    uint64_t v21 = v19 + a2;
    if (!v20) {
      break;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    sub_25B3B67F8();
    unint64_t v8 = v22;
  }
  *(void *)(v18 + 8 * v10) = v21;
  return result;
}

BOOL sub_25B3B0F00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_25B3B0F14@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_25B3A9238(MEMORY[0x263F8EE78]);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = result;
  return result;
}

uint64_t sub_25B3B0F48(char a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25B3DD228();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_25B3DCEC8();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_25B3B1004()
{
  unint64_t v1 = (unint64_t *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  if (*(unsigned char *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8))
  {
    if (v1[1])
    {
      unint64_t v2 = *v1;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (qword_26B346880 != -1) {
        swift_once();
      }
      unint64_t v2 = 0xD000000000000010;
      uint64_t v14 = sub_25B3DCD98();
      __swift_project_value_buffer(v14, (uint64_t)qword_26B346958);
      char v15 = sub_25B3DCD78();
      os_log_type_t v16 = sub_25B3DCF78();
      if (os_log_type_enabled(v15, v16))
      {
        char v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v17 = 0;
        _os_log_impl(&dword_25B39F000, v15, v16, "no model identifier", v17, 2u);
        MEMORY[0x261163250](v17, -1, -1);
      }
    }
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType);
    unint64_t v4 = v1[1];
    if (v4)
    {
      uint64_t v5 = *v1;
      uint64_t v6 = qword_26B346880;
      swift_bridgeObjectRetain();
      if (v6 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_25B3DCD98();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B346958);
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_25B3DCD78();
      os_log_type_t v9 = sub_25B3DCF78();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v19 = v11;
        *(_DWORD *)uint64_t v10 = 136315394;
        uint64_t v12 = PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(v3);
        sub_25B3B1CCC(v12, v13, &v19);
        sub_25B3DD018();
        swift_bridgeObjectRelease();
        *(_WORD *)(v10 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_25B3B1CCC(v5, v4, &v19);
        sub_25B3DD018();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25B39F000, v8, v9, "both modelType: %s & otherModelTypeIdentifier: %s", (uint8_t *)v10, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261163250](v11, -1, -1);
        MEMORY[0x261163250](v10, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(v3);
  }
  return v2;
}

uint64_t sub_25B3B1324(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25B3B149C(a1, a2, a3, a4, &qword_26A4FB680, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
}

void *sub_25B3B1358(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB410);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25B3B9694(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B3B1468(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25B3B149C(a1, a2, a3, a4, &qword_26A4FB730, type metadata accessor for AppSuggestionInferenceEventTimestamped, type metadata accessor for AppSuggestionInferenceEventTimestamped);
}

uint64_t sub_25B3B149C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_25B3DD228();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25B3BA350(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *sub_25B3B171C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25B3B97A0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25B3B1818(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346818);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25B3B9888(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B3B1928(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25B3B149C(a1, a2, a3, a4, &qword_26A4FB678, type metadata accessor for PeopleSuggestionInferenceEventTimestamped, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_25B3B195C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25B3B149C(a1, a2, a3, a4, &qword_26A4FB6B8, MEMORY[0x263F07490], MEMORY[0x263F07490]);
}

void *sub_25B3B1990(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25B3B19A4(a1, a2, a3, a4, &qword_26A4FB698, &qword_26A4FB4C8);
}

void *sub_25B3B19A4(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
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
      uint64_t v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      uint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25B3BD058(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

char *sub_25B3B1AC0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25B3B97A0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25B3B1BBC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB688);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25B3BD160(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B3B1CCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25B3B1DA0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25B3BD504((uint64_t)v12, *a3);
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
      sub_25B3BD504((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25B3B1DA0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25B3DD028();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25B3B1F5C(a5, a6);
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
  uint64_t v8 = sub_25B3DD1B8();
  if (!v8)
  {
    sub_25B3DD228();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25B3DD288();
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

uint64_t sub_25B3B1F5C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25B3B1FF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B3B21D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25B3B21D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25B3B1FF4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25B3B216C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25B3DD178();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25B3DD228();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25B3DCE38();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25B3DD288();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25B3DD228();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25B3B216C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25B3B21D4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B0);
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
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

unint64_t sub_25B3B2324(uint64_t a1, uint64_t a2)
{
  sub_25B3DD3C8();
  sub_25B3DCE18();
  uint64_t v4 = sub_25B3DD408();
  return sub_25B3B5870(a1, a2, v4);
}

unint64_t sub_25B3B239C(uint64_t a1, uint64_t a2, int a3)
{
  sub_25B3DD3C8();
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  sub_25B3DD3E8();
  uint64_t v6 = sub_25B3DD408();
  return sub_25B3B5954(a1, a2, a3, v6);
}

uint64_t sub_25B3B2440(uint64_t a1)
{
  return sub_25B3B25B4(a1, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
}

unint64_t sub_25B3B246C(uint64_t a1)
{
  sub_25B3DD3C8();
  sub_25B3DD3D8();
  uint64_t v2 = sub_25B3DD408();
  return sub_25B3B5B60(a1, v2);
}

unint64_t sub_25B3B24D8(uint64_t a1)
{
  uint64_t v2 = sub_25B3DCFD8();
  return sub_25B3B5BFC(a1, v2);
}

unint64_t sub_25B3B251C(unsigned __int8 a1)
{
  sub_25B3DD3C8();
  sub_25B3DD3D8();
  uint64_t v2 = sub_25B3DD408();
  return sub_25B3B5D08(a1, v2);
}

uint64_t sub_25B3B2588(uint64_t a1)
{
  return sub_25B3B25B4(a1, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5DA8);
}

uint64_t sub_25B3B25B4(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_25B3DD3C8();
  a2(v5);
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25B3DD408();
  return a3(a1, v6);
}

uint64_t sub_25B3B2654(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467A0);
  char v36 = a2;
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    uint64_t result = sub_25B3DD408();
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
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
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
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B296C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB658);
  char v37 = a2;
  uint64_t v6 = sub_25B3DD268();
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
  int64_t v34 = v2;
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
          unint64_t v3 = v34;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    uint64_t result = sub_25B3DD408();
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
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v34;
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
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B2C78(uint64_t a1, char a2)
{
  return sub_25B3B2FA4(a1, a2, &qword_26A4FB518);
}

uint64_t sub_25B3B2C84(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4B8);
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v31) {
      break;
    }
    uint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v32 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v31) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v32 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v31)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v32 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v31) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v32 + 8 * v13);
            ++v20;
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v20;
      }
    }
LABEL_21:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    char v21 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
    unint64_t v22 = (long long *)(*(void *)(v5 + 56) + 40 * v16);
    if (a2) {
      sub_25B3A95E8(v22, (uint64_t)v33);
    }
    else {
      sub_25B3BC63C((uint64_t)v22, (uint64_t)v33);
    }
    sub_25B3DD3C8();
    PeopleSuggesterMetricsField.rawValue.getter();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25B3DD408();
    uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v14 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v7 + 48) + v14) = v21;
    uint64_t result = sub_25B3A95E8(v33, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v18 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
  if (v30 >= 64) {
    bzero(v18, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v18 = -1 << v30;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B2FA4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_25B3DD268();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
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
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    uint64_t result = sub_25B3DD408();
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
          goto LABEL_41;
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
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  uint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_25B3B32B0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB728);
  char v6 = a2;
  uint64_t v7 = sub_25B3DD268();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v33 = v2;
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v33;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      id v31 = v30;
    }
    sub_25B3DD3C8();
    PeopleSuggesterMetricsField.rawValue.getter();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25B3DD408();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v3 = v33;
  int64_t v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v8;
  return result;
}

uint64_t sub_25B3B35C0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D0);
  uint64_t result = sub_25B3DD268();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v18 >= v12) {
          goto LABEL_31;
        }
        unint64_t v19 = v33[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v19 = v33[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v12)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v33 = -1 << v31;
              }
              unint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v33[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v19 = v33[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = 8 * v17;
      uint64_t v22 = *(void *)(*(void *)(v5 + 48) + v21);
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + v21);
      sub_25B3DD3C8();
      sub_25B3DD3D8();
      uint64_t result = sub_25B3DD408();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = 8 * v14;
      *(void *)(*(void *)(v7 + 48) + v15) = v22;
      *(void *)(*(void *)(v7 + 56) + v15) = v23;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B3890(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D8);
  char v35 = a2;
  uint64_t result = sub_25B3DD268();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    int64_t v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v34 = -1 << v32;
              }
              unint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
      unint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 24 * v19);
      uint64_t v29 = *v28;
      uint64_t v31 = v28[1];
      uint64_t v30 = v28[2];
      if ((v35 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_25B3DD3C8();
      sub_25B3DD3D8();
      uint64_t result = sub_25B3DD408();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 24 * v16);
      *unint64_t v17 = v29;
      v17[1] = v31;
      v17[2] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B3B90(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4F0);
  char v35 = a2;
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_42;
  }
  uint64_t v32 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v18 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v19 = v18 | (v12 << 6);
    goto LABEL_31;
  }
  int64_t v20 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_43;
  }
  if (v20 >= v33)
  {
    swift_release();
    unint64_t v3 = v32;
    unint64_t v21 = (void *)(v5 + 64);
    if (v35)
    {
LABEL_38:
      uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
      if (v30 >= 64) {
        bzero(v21, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *unint64_t v21 = -1 << v30;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    unint64_t v21 = (void *)(v5 + 64);
    unint64_t v22 = *(void *)(v34 + 8 * v20);
    ++v12;
    if (v22) {
      goto LABEL_30;
    }
    int64_t v12 = v20 + 1;
    if (v20 + 1 >= v33) {
      goto LABEL_35;
    }
    unint64_t v22 = *(void *)(v34 + 8 * v12);
    if (v22)
    {
LABEL_30:
      unint64_t v10 = (v22 - 1) & v22;
      unint64_t v19 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_31:
      char v28 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
      uint64_t v29 = (long long *)(*(void *)(v5 + 56) + 40 * v19);
      if (v35) {
        sub_25B3A95E8(v29, (uint64_t)v36);
      }
      else {
        sub_25B3BC63C((uint64_t)v29, (uint64_t)v36);
      }
      sub_25B3DD3C8();
      sub_25B3DCE18();
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_25B3DD408();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = v13 & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_8;
      }
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v14) >> 6;
      while (++v16 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v16 == v25;
        if (v16 == v25) {
          unint64_t v16 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v16);
        if (v27 != -1)
        {
          unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
LABEL_8:
          *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
          *(unsigned char *)(*(void *)(v7 + 48) + v17) = v28;
          sub_25B3A95E8(v36, *(void *)(v7 + 56) + 40 * v17);
          ++*(void *)(v7 + 16);
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      JUMPOUT(0x25B3B40F4);
    }
    int64_t v23 = v20 + 2;
    if (v23 < v33)
    {
      unint64_t v22 = *(void *)(v34 + 8 * v23);
      if (!v22)
      {
        while (1)
        {
          int64_t v12 = v23 + 1;
          if (__OFADD__(v23, 1)) {
            goto LABEL_44;
          }
          if (v12 >= v33) {
            goto LABEL_35;
          }
          unint64_t v22 = *(void *)(v34 + 8 * v12);
          ++v23;
          if (v22) {
            goto LABEL_30;
          }
        }
      }
      int64_t v12 = v23;
      goto LABEL_30;
    }
LABEL_35:
    swift_release();
    unint64_t v3 = v32;
    if (v35) {
      goto LABEL_38;
    }
  }
LABEL_42:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B413C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E8);
  char v38 = a2;
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
    uint64_t v31 = *(void *)(v5 + 56) + 16 * v21;
    char v32 = *(unsigned char *)v31;
    uint64_t v33 = *(void *)(v31 + 8);
    if ((v38 & 1) == 0)
    {
      id v34 = v30;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_25B3DCFD8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
          goto LABEL_41;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v30;
    uint64_t v19 = *(void *)(v7 + 56) + 16 * v18;
    *(unsigned char *)uint64_t v19 = v32;
    *(void *)(v19 + 8) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v36;
  int64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B442C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6E8);
  char v34 = a2;
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v20 >= v32) {
      break;
    }
    unint64_t v21 = v33[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v32) {
        break;
      }
      unint64_t v21 = v33[v12];
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v22 >= v32) {
          break;
        }
        unint64_t v21 = v33[v22];
        if (!v21)
        {
          while (1)
          {
            int64_t v12 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_41;
            }
            if (v12 >= v32) {
              goto LABEL_34;
            }
            unint64_t v21 = v33[v12];
            ++v22;
            if (v21) {
              goto LABEL_30;
            }
          }
        }
        int64_t v12 = v22;
      }
    }
LABEL_30:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_31:
    char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    BOOL v28 = *(void **)(*(void *)(v5 + 56) + 8 * v19);
    if ((v34 & 1) == 0) {
      id v29 = v28;
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_25B3DD408();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v14) >> 6;
    do
    {
      if (++v16 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x25B3B495CLL);
      }
      BOOL v25 = v16 == v24;
      if (v16 == v24) {
        unint64_t v16 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v11 + 8 * v16);
    }
    while (v26 == -1);
    unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
LABEL_8:
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
    ++*(void *)(v7 + 16);
  }
LABEL_34:
  swift_release();
  unint64_t v3 = v2;
  if (v34)
  {
    uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
    if (v30 >= 64) {
      bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      void *v33 = -1 << v30;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B49A4(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E0);
  char v42 = a2;
  uint64_t v6 = sub_25B3DD268();
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
  char v39 = v2;
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
    unint64_t v24 = (void *)(v5 + 64);
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
          unint64_t v3 = v39;
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
    int64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = *(void *)(v5 + 56) + v31;
    char v36 = *(unsigned char *)v35;
    uint64_t v37 = *(void *)(v35 + 8);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25B3DD3C8();
    sub_25B3DCE18();
    uint64_t result = sub_25B3DD408();
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
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = *(void *)(v7 + 56) + v18;
    *(unsigned char *)uint64_t v20 = v36;
    *(void *)(v20 + 8) = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B4CD4(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6C0);
  uint64_t result = sub_25B3DD268();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              unint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
      sub_25B3DD3C8();
      sub_25B3DD3D8();
      uint64_t result = sub_25B3DD408();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(void *)(*(void *)(v7 + 56) + 8 * v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B4F9C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B346888);
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_25B3DCFD8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
          goto LABEL_41;
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B5274(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB650);
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v33 = v2;
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    uint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    char v30 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((a2 & 1) == 0) {
      id v31 = v29;
    }
    uint64_t result = sub_25B3DCFD8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v29;
    *(unsigned char *)(*(void *)(v7 + 56) + v18) = v30;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v33;
  int64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25B3B5540(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4B0);
  char v37 = a2;
  uint64_t v6 = sub_25B3DD268();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
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
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v36[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v36[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v37)
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
            unint64_t v22 = v36[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v36[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 24 * v20;
      uint64_t v30 = *(void *)v28;
      uint64_t v29 = *(void *)(v28 + 8);
      char v31 = *(unsigned char *)(v28 + 16);
      uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v33 = v32;
      }
      sub_25B3DD3C8();
      swift_bridgeObjectRetain();
      sub_25B3DCE18();
      swift_bridgeObjectRelease();
      sub_25B3DD3E8();
      uint64_t result = sub_25B3DD408();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = *(void *)(v7 + 48) + 24 * v17;
      *(void *)uint64_t v18 = v30;
      *(void *)(v18 + 8) = v29;
      *(unsigned char *)(v18 + 16) = v31;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_25B3B5870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25B3DD328() & 1) == 0)
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
      while (!v14 && (sub_25B3DD328() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25B3B5954(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = v12 + 24 * v7;
      int v14 = *(unsigned __int8 *)(v13 + 16);
      if (*(void *)v13 == a1 && *(void *)(v13 + 8) == a2)
      {
        if (v14 == (a3 & 1)) {
          return v7;
        }
      }
      else if ((sub_25B3DD328() & 1) != 0 && ((v14 ^ a3) & 1) == 0)
      {
        return v7;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_25B3B5A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    while (1)
    {
      unint64_t v7 = PeopleSuggesterMetricsField.rawValue.getter();
      uint64_t v9 = v8;
      if (v7 == PeopleSuggesterMetricsField.rawValue.getter() && v9 == v10) {
        break;
      }
      char v12 = sub_25B3DD328();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v5 = (v5 + 1) & v6;
        if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
          continue;
        }
      }
      return v5;
    }
    swift_bridgeObjectRelease_n();
  }
  return v5;
}

unint64_t sub_25B3B5B60(uint64_t a1, uint64_t a2)
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

unint64_t sub_25B3B5BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_25B3DCFE8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_25B3DCFE8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_25B3B5D08(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25B3B5DA8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD00000000000001ALL;
      unint64_t v8 = 0x800000025B3E03A0;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v7 = 0x61746F745F72726DLL;
          unint64_t v8 = 0xE90000000000006CLL;
          break;
        case 3:
          unint64_t v7 = 0xD000000000000019;
          unint64_t v8 = 0x800000025B3E0850;
          break;
        case 4:
          unint64_t v7 = 0xD000000000000017;
          unint64_t v8 = 0x800000025B3E0870;
          break;
        case 5:
          unint64_t v7 = 0xD000000000000013;
          unint64_t v8 = 0x800000025B3E0890;
          break;
        case 6:
          unint64_t v7 = 0xD000000000000020;
          unint64_t v8 = 0x800000025B3E08B0;
          break;
        case 7:
          unint64_t v7 = 0xD00000000000001ELL;
          unint64_t v8 = 0x800000025B3E08E0;
          break;
        case 8:
          unint64_t v7 = 0xD00000000000001BLL;
          unint64_t v8 = 0x800000025B3E0900;
          break;
        case 9:
          unint64_t v7 = 0xD000000000000014;
          unint64_t v8 = 0x800000025B3E0920;
          break;
        case 0xA:
          unint64_t v7 = 0xD00000000000001CLL;
          unint64_t v8 = 0x800000025B3E0940;
          break;
        case 0xB:
          unint64_t v7 = 0xD000000000000015;
          unint64_t v8 = 0x800000025B3E0960;
          break;
        case 0xC:
          id v9 = "num_suggestLess_total";
          goto LABEL_20;
        case 0xD:
          unint64_t v7 = 0x6974736567677573;
          unint64_t v8 = 0xEF6C65646F4D6E6FLL;
          break;
        case 0xE:
          unint64_t v7 = 0xD000000000000011;
          unint64_t v8 = 0x800000025B3E07E0;
          break;
        case 0xF:
          unint64_t v7 = 0xD000000000000011;
          unint64_t v8 = 0x800000025B3E0800;
          break;
        case 0x10:
          id v9 = "trialExperimentId";
LABEL_20:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000010;
          break;
        case 0x11:
          unint64_t v7 = 0x72665F6567617375;
          unint64_t v8 = 0xEF79636E65757165;
          break;
        default:
          unint64_t v8 = 0xE900000000000072;
          unint64_t v7 = 0x65735577654E7369;
          break;
      }
      unint64_t v10 = 0xD00000000000001ALL;
      unint64_t v11 = 0x800000025B3E03A0;
      switch(v6)
      {
        case 1:
          goto LABEL_45;
        case 2:
          unint64_t v11 = 0xE90000000000006CLL;
          if (v7 != 0x61746F745F72726DLL) {
            goto LABEL_47;
          }
          goto LABEL_46;
        case 3:
          unint64_t v12 = 0xD000000000000019;
          uint64_t v13 = "";
          goto LABEL_41;
        case 4:
          unint64_t v12 = 0xD000000000000017;
          uint64_t v13 = "num_airdrop_engaged_total";
          goto LABEL_41;
        case 5:
          unint64_t v12 = 0xD000000000000013;
          uint64_t v13 = "num_airdrop_shown_total";
          goto LABEL_41;
        case 6:
          unint64_t v12 = 0xD000000000000020;
          uint64_t v13 = "num_bottomrow_total";
          goto LABEL_41;
        case 7:
          unint64_t v12 = 0xD00000000000001ELL;
          uint64_t v13 = "intent_app_total";
          goto LABEL_41;
        case 8:
          unint64_t v12 = 0xD00000000000001BLL;
          uint64_t v13 = "num_sharesheet_abandoned_total";
          goto LABEL_41;
        case 9:
          unint64_t v12 = 0xD000000000000014;
          uint64_t v13 = "num_sharesheet_others_total";
          goto LABEL_41;
        case 10:
          unint64_t v12 = 0xD00000000000001CLL;
          uint64_t v13 = "num_sharesheet_total";
          goto LABEL_41;
        case 11:
          unint64_t v12 = 0xD000000000000015;
          uint64_t v13 = "num_sharing_intent_app_total";
          goto LABEL_41;
        case 12:
          int v14 = "num_suggestLess_total";
          goto LABEL_44;
        case 13:
          unint64_t v11 = 0xEF6C65646F4D6E6FLL;
          if (v7 != 0x6974736567677573) {
            goto LABEL_47;
          }
          goto LABEL_46;
        case 14:
          unint64_t v12 = 0xD000000000000011;
          uint64_t v13 = "ng";
          goto LABEL_41;
        case 15:
          unint64_t v12 = 0xD000000000000011;
          uint64_t v13 = "trialDeploymentId";
LABEL_41:
          unint64_t v11 = (unint64_t)v13 | 0x8000000000000000;
          if (v7 != v12) {
            goto LABEL_47;
          }
          goto LABEL_46;
        case 16:
          int v14 = "trialExperimentId";
LABEL_44:
          unint64_t v11 = (unint64_t)v14 | 0x8000000000000000;
          unint64_t v10 = 0xD000000000000010;
LABEL_45:
          if (v7 == v10) {
            goto LABEL_46;
          }
          goto LABEL_47;
        case 17:
          unint64_t v11 = 0xEF79636E65757165;
          if (v7 != 0x72665F6567617375) {
            goto LABEL_47;
          }
          goto LABEL_46;
        default:
          unint64_t v11 = 0xE900000000000072;
          if (v7 != 0x65735577654E7369) {
            goto LABEL_47;
          }
LABEL_46:
          if (v8 == v11)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_47:
          char v15 = sub_25B3DD328();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v15) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

void *sub_25B3B62E8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_25B3B6488()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_25B3B6634()
{
  return sub_25B3B664C(&qword_26A4FB518);
}

void *sub_25B3B6640()
{
  return sub_25B3B6B40(&qword_26A4FB4B8);
}

id sub_25B3B664C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25B3DD258();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25B3B67F8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
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

void *sub_25B3B6988()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 56) + 24 * v15);
    uint64_t v17 = *v16;
    uint64_t v19 = v16[1];
    uint64_t v18 = v16[2];
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    int64_t v20 = (void *)(*(void *)(v4 + 56) + 24 * v15);
    *int64_t v20 = v17;
    v20[1] = v19;
    void v20[2] = v18;
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_25B3B6B40(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25B3DD258();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    char v17 = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    sub_25B3BC63C(*(void *)(v3 + 56) + 40 * v16, (uint64_t)v21);
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = v17;
    id result = (void *)sub_25B3A95E8(v21, *(void *)(v5 + 56) + 40 * v16);
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25B3B6CFC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    char v20 = *(unsigned char *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = *(void *)(v4 + 56) + v18;
    *(unsigned char *)uint64_t v22 = v20;
    *(void *)(v22 + 8) = v21;
    id v23 = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25B3B6EBC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(v2 + 56) + v16;
    char v21 = *(unsigned char *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    id v23 = (void *)(*(void *)(v4 + 48) + v16);
    *id v23 = v19;
    v23[1] = v18;
    uint64_t v24 = *(void *)(v4 + 56) + v16;
    *(unsigned char *)uint64_t v24 = v21;
    *(void *)(v24 + 8) = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_25B3B7080()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25B3B7210()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B346888);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_25B3B73BC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB650);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v16 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    char v17 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = v16;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v17;
    id result = v16;
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

id sub_25B3B7564()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD258();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    LOBYTE(v17) = *(unsigned char *)(v17 + 16);
    uint64_t v20 = 8 * v15;
    unint64_t v21 = *(void **)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(unsigned char *)(v22 + 16) = v17;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
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

void sub_25B3B7724(void *a1, char a2, void *a3)
{
  uint64_t v3 = a1[2];
  if (!v3) {
    goto LABEL_22;
  }
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  unint64_t v8 = (void *)a1[6];
  int64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_25B3B2324(v7, v6);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_25B3B664C(&qword_26A4FB6C8);
      if ((v16 & 1) == 0) {
        goto LABEL_13;
      }
    }
    goto LABEL_10;
  }
  sub_25B3B2FA4(v15, a2 & 1, &qword_26A4FB6C8);
  unint64_t v17 = sub_25B3B2324(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0)
    {
LABEL_13:
      unint64_t v21 = (void *)*a3;
      *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
      uint64_t v22 = (uint64_t *)(v21[6] + 16 * v12);
      *uint64_t v22 = v7;
      v22[1] = v6;
      *(void *)(v21[7] + 8 * v12) = v10;
      uint64_t v23 = v21[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24)
      {
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      long long v21[2] = v25;
      uint64_t v26 = v3 - 1;
      if (v3 != 1)
      {
        int64_t v27 = (void **)(a1 + 9);
        do
        {
          uint64_t v29 = (uint64_t)*(v27 - 2);
          uint64_t v28 = (uint64_t)*(v27 - 1);
          uint64_t v30 = *v27;
          char v31 = (void *)*a3;
          swift_bridgeObjectRetain();
          id v10 = v30;
          unint64_t v32 = sub_25B3B2324(v29, v28);
          uint64_t v34 = v31[2];
          BOOL v35 = (v33 & 1) == 0;
          BOOL v24 = __OFADD__(v34, v35);
          uint64_t v36 = v34 + v35;
          if (v24) {
            goto LABEL_23;
          }
          char v37 = v33;
          if (v31[3] < v36)
          {
            sub_25B3B2FA4(v36, 1, &qword_26A4FB6C8);
            unint64_t v32 = sub_25B3B2324(v29, v28);
            if ((v37 & 1) != (v38 & 1)) {
              goto LABEL_25;
            }
          }
          if (v37) {
            goto LABEL_10;
          }
          char v39 = (void *)*a3;
          *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
          int64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
          uint64_t *v40 = v29;
          v40[1] = v28;
          *(void *)(v39[7] + 8 * v32) = v10;
          uint64_t v41 = v39[2];
          BOOL v24 = __OFADD__(v41, 1);
          uint64_t v42 = v41 + 1;
          if (v24) {
            goto LABEL_24;
          }
          v39[2] = v42;
          v27 += 3;
        }
        while (--v26);
      }
LABEL_22:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_10:
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB500);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_25B3DD378();
  __break(1u);
LABEL_26:
  sub_25B3DD168();
  sub_25B3DCE28();
  sub_25B3DD218();
  sub_25B3DCE28();
  sub_25B3DD238();
  __break(1u);
}

uint64_t sub_25B3B7AB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B7C20(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7AD4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B7DBC(a1, a2, a3, (void *)*v3, &qword_26A4FB6B8, MEMORY[0x263F07490]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7B10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B8154(a1, a2, a3, (void *)*v3, &qword_26A4FB6A8, &qword_26A4FB6B0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7B40(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B8004(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25B3B7B60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B8154(a1, a2, a3, (void *)*v3, &qword_26A4FB698, &qword_26A4FB4C8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7B90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B8154(a1, a2, a3, (void *)*v3, &qword_26A4FB6F8, &qword_26A4FB700);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7BC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B82E4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7BE0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B848C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25B3B7C00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25B3B8764(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25B3B7C20(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467A8);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 4;
  uint64_t v13 = a4 + 4;
  size_t v14 = 3 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346788);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B7DBC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v12)
  {
    char v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  char v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  BOOL v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B8004(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B8154(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    uint64_t v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B82E4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6D0);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6D8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B848C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB668);
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
  unint64_t v13 = v10 + 4;
  int64_t v14 = a4 + 4;
  size_t v15 = 2 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v10 + 4, a4 + 4, v15 * 8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB670);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B8614(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B0);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B8764(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB660);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B88D0(unint64_t a1, char a2, char a3, void *a4)
{
  uint64_t v10 = MEMORY[0x263F8D4F8];
  int64_t v11 = &protocol witness table for Bool;
  LOBYTE(v9) = a3;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_25B3A95E8(&v9, a4[7] + 40 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_25B3B895C(unint64_t a1, char a2, char a3, void *a4)
{
  unint64_t v13 = &type metadata for UsageFrequency;
  unint64_t v14 = sub_25B3BC5E8();
  LOBYTE(v12) = a3;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_25B3A95E8(&v12, a4[7] + 40 * a1);
  uint64_t v9 = a4[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a4[2] = v11;
  }
  return result;
}

uint64_t sub_25B3B89FC(unint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_25B3A95E8(&v16, a4[7] + 40 * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_25B3B8ACC(char a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v7 = MEMORY[0x263F8D4F8];
  uint64_t v27 = MEMORY[0x263F8D4F8];
  uint64_t v28 = &protocol witness table for Bool;
  LOBYTE(v26) = a1;
  uint64_t v8 = (void *)*a4;
  unint64_t v10 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    long long v16 = (void *)*a4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 40 * v10;
      __swift_destroy_boxed_opaque_existential_1Tm(v17);
      return sub_25B3A95E8(&v26, v17);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25B3B6B40(&qword_26A4FB4B8);
    goto LABEL_7;
  }
  sub_25B3B2C84(v13, a3 & 1);
  uint64_t v19 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_14:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  long long v16 = (void *)*a4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v26, v7);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  sub_25B3B88D0(v10, a2, *v23, v16);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
}

uint64_t sub_25B3B8CFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  *(void *)&long long v27 = a1;
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v28 = MEMORY[0x263F8D310];
  uint64_t v29 = &protocol witness table for String;
  *((void *)&v27 + 1) = a2;
  char v9 = (void *)*a5;
  unint64_t v11 = sub_25B3B25B4(a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v15 = v10;
  uint64_t v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v17 = (void *)*a5;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = v17[7] + 40 * v11;
      __swift_destroy_boxed_opaque_existential_1Tm(v18);
      return sub_25B3A95E8(&v27, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_25B3B6B40(&qword_26A4FB4B8);
    goto LABEL_7;
  }
  sub_25B3B2C84(v14, a4 & 1);
  uint64_t v20 = sub_25B3B25B4(a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  uint64_t v17 = (void *)*a5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, v8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t *)((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  sub_25B3B9604(v11, a3, *v24, v24[1], v17);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v27);
}

uint64_t sub_25B3B8F30(char a1, uint64_t a2, char a3, void *a4)
{
  long long v27 = &type metadata for UsageFrequency;
  unint64_t v28 = sub_25B3BC5E8();
  LOBYTE(v26) = a1;
  uint64_t v8 = (void *)*a4;
  unint64_t v10 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = (void *)*a4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 40 * v10;
      __swift_destroy_boxed_opaque_existential_1Tm(v17);
      return sub_25B3A95E8(&v26, v17);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25B3B6B40(&qword_26A4FB4B8);
    goto LABEL_7;
  }
  sub_25B3B2C84(v13, a3 & 1);
  uint64_t v19 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_14:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  uint64_t v16 = (void *)*a4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v26, (uint64_t)&type metadata for UsageFrequency);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  sub_25B3B895C(v10, a2, *v23, v16);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
}

uint64_t sub_25B3B9164(uint64_t a1, uint64_t a2, char a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v31);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  uint64_t v13 = (void *)*a4;
  unint64_t v15 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
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
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = (void *)*a4;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7] + 40 * v15;
      __swift_destroy_boxed_opaque_existential_1Tm(v22);
      return sub_25B3A95E8(&v31, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_25B3B6B40(&qword_26A4FB4B8);
    goto LABEL_7;
  }
  sub_25B3B2C84(v18, a3 & 1);
  uint64_t v24 = sub_25B3B25B4(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5A40);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = (void *)*a4;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v31, v32);
  MEMORY[0x270FA5388](v26);
  unint64_t v28 = (char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  sub_25B3B89FC(v15, a2, (uint64_t)v28, v21, a5, a6);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
}

uint64_t sub_25B3B93D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  *(void *)&long long v27 = a1;
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v28 = MEMORY[0x263F8D310];
  uint64_t v29 = &protocol witness table for String;
  *((void *)&v27 + 1) = a2;
  char v9 = (void *)*a5;
  unint64_t v11 = sub_25B3B25B4(a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5DA8);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v15 = v10;
  uint64_t v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    BOOL v17 = (void *)*a5;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = v17[7] + 40 * v11;
      __swift_destroy_boxed_opaque_existential_1Tm(v18);
      return sub_25B3A95E8(&v27, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_25B3B6B40(&qword_26A4FB4F0);
    goto LABEL_7;
  }
  sub_25B3B3B90(v14, a4 & 1);
  uint64_t v20 = sub_25B3B25B4(a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_25B3B5DA8);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  BOOL v17 = (void *)*a5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, v8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t *)((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  sub_25B3B9604(v11, a3, *v24, v24[1], v17);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v27);
}

uint64_t sub_25B3B9604(unint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v10 = a3;
  uint64_t v11 = MEMORY[0x263F8D310];
  uint64_t v12 = &protocol witness table for String;
  *((void *)&v10 + 1) = a4;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a5[6] + a1) = a2;
  uint64_t result = sub_25B3A95E8(&v10, a5[7] + 40 * a1);
  uint64_t v7 = a5[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a5[2] = v9;
  }
  return result;
}

uint64_t sub_25B3B9694(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB500);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

char *sub_25B3B97A0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25B3DD288();
  __break(1u);
  return result;
}

char *sub_25B3B9888(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3B9974(uint64_t a1, void (*a2)(void *, unsigned char *))
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v7) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v24 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v19 = *(void *)(v24 + 8 * v9);
        if (!v19)
        {
          int64_t v9 = v18 + 3;
          if (v18 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v19 = *(void *)(v24 + 8 * v9);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v19 - 1) & v19;
    unint64_t v11 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = 16 * v11;
    BOOL v13 = (uint64_t *)(*(void *)(a1 + 48) + v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(a1 + 56) + v12;
    LOBYTE(v13) = *(unsigned char *)v16;
    uint64_t v17 = *(void *)(v16 + 8);
    v21[0] = v14;
    v21[1] = v15;
    v22[0] = (_BYTE)v13;
    uint64_t v23 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v21, v22);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v7) {
    return swift_release();
  }
  unint64_t v19 = *(void *)(v24 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v24 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_25B3B9B50(uint64_t a1, void (*a2)(void **, unsigned char *))
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v7) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v22 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v17 = *(void *)(v22 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v17 = *(void *)(v22 + 8 * v8);
        if (!v17)
        {
          int64_t v8 = v16 + 3;
          if (v16 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v17 = *(void *)(v22 + 8 * v8);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v17 - 1) & v17;
    unint64_t v10 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    unint64_t v11 = *(void **)(*(void *)(a1 + 48) + 8 * v10);
    uint64_t v12 = *(void *)(a1 + 56) + 16 * v10;
    char v13 = *(unsigned char *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    unint64_t v19 = v11;
    v20[0] = v13;
    uint64_t v21 = v14;
    id v15 = v11;
    swift_bridgeObjectRetain();
    a2(&v19, v20);
    swift_bridgeObjectRelease();
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v7) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v22 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

void sub_25B3B9D20(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25B3DD078();
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_25B3BC6C8();
    sub_25B3DCF48();
    uint64_t v7 = v26;
    uint64_t v23 = v27;
    uint64_t v8 = v28;
    int64_t v9 = v29;
    unint64_t v10 = v30;
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v23 = a1 + 56;
    uint64_t v12 = ~v11;
    uint64_t v13 = -v11;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v10 = v14 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v8 = v12;
    int64_t v9 = 0;
  }
  int64_t v22 = (unint64_t)(v8 + 64) >> 6;
  if ((v7 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (sub_25B3DD0F8())
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v31;
    swift_unknownObjectRelease();
    int64_t v16 = v9;
    uint64_t v17 = v10;
    while (v15)
    {
      id v31 = v15;
      sub_25B3AD89C(&v31, a2, a3, a4);

      if (v5) {
        break;
      }
      int64_t v9 = v16;
      unint64_t v10 = v17;
      if (v7 < 0) {
        goto LABEL_8;
      }
LABEL_11:
      if (v10)
      {
        uint64_t v17 = (v10 - 1) & v10;
        unint64_t v18 = __clz(__rbit64(v10)) | (v9 << 6);
        int64_t v16 = v9;
      }
      else
      {
        int64_t v16 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          return;
        }
        if (v16 >= v22) {
          break;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v16);
        if (!v19)
        {
          int64_t v20 = v9 + 2;
          if (v9 + 2 >= v22) {
            break;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v20);
          if (v19) {
            goto LABEL_22;
          }
          int64_t v20 = v9 + 3;
          if (v9 + 3 >= v22) {
            break;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v20);
          if (v19) {
            goto LABEL_22;
          }
          int64_t v20 = v9 + 4;
          if (v9 + 4 >= v22) {
            break;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v20);
          if (v19)
          {
LABEL_22:
            int64_t v16 = v20;
          }
          else
          {
            int64_t v16 = v9 + 5;
            if (v9 + 5 >= v22) {
              break;
            }
            unint64_t v19 = *(void *)(v23 + 8 * v16);
            if (!v19)
            {
              int64_t v21 = v9 + 6;
              while (v22 != v21)
              {
                unint64_t v19 = *(void *)(v23 + 8 * v21++);
                if (v19)
                {
                  int64_t v16 = v21 - 1;
                  goto LABEL_23;
                }
              }
              break;
            }
          }
        }
LABEL_23:
        uint64_t v17 = (v19 - 1) & v19;
        unint64_t v18 = __clz(__rbit64(v19)) + (v16 << 6);
      }
      id v15 = *(id *)(*(void *)(v7 + 48) + 8 * v18);
    }
  }
  sub_25B3A90C0();
}

uint64_t sub_25B3BA008(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v9 = a1 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a1 + 56);
  int64_t v24 = (unint64_t)(v10 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    int64_t v20 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    v23[0] = *v20;
    v23[1] = v21;
    swift_bridgeObjectRetain();
    sub_25B3ADA4C(v23, a2, a3, a4);
    if (v4)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v14 >= v24) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    if (!v18)
    {
      int64_t v19 = v14 + 1;
      if (v14 + 1 >= v24) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v9 + 8 * v19);
      if (v18) {
        goto LABEL_14;
      }
      int64_t v19 = v14 + 2;
      if (v14 + 2 >= v24) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v9 + 8 * v19);
      if (v18) {
        goto LABEL_14;
      }
      int64_t v19 = v14 + 3;
      if (v14 + 3 >= v24) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v9 + 8 * v19);
      if (v18)
      {
LABEL_14:
        int64_t v14 = v19;
        goto LABEL_15;
      }
      int64_t v22 = v14 + 4;
      if (v14 + 4 >= v24) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v9 + 8 * v22);
      v14 += 4;
      if (!v18) {
        break;
      }
    }
LABEL_15:
    unint64_t v12 = (v18 - 1) & v18;
  }
  while (1)
  {
    int64_t v14 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v14 >= v24) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    ++v22;
    if (v18) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25B3BA1E4(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v14 = *(void *)(v4 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        if (!v14)
        {
          int64_t v10 = v13 + 3;
          if (v13 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v14 = *(void *)(v4 + 8 * v10);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_5:
    uint64_t result = a2(*(void *)(*(void *)(a1 + 48) + 8 * v12), *(void *)(*(void *)(a1 + 56) + 8 * v12));
  }
  int64_t v15 = v13 + 4;
  if (v15 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25B3BA350(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
      return v13;
    }
  }
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

unint64_t sub_25B3BA4AC()
{
  unint64_t result = sub_25B3DCC38();
  if (v1 < 0.0)
  {
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v2 = 0xD00000000000001BLL;
    *(void *)(v2 + 8) = 0x800000025B3E0F20;
    *(unsigned char *)(v2 + 16) = 1;
    return swift_willThrow();
  }
  double v3 = v1 / 86400.0;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v3 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v3 < 1.84467441e19) {
    return (unint64_t)v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_25B3BA57C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB600);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  unint64_t v7 = (char *)v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v154 - v8;
  uint64_t v10 = sub_25B3DCC98();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)v154 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v161 = (uint64_t)v154 - v16;
  MEMORY[0x270FA5388](v15);
  v160 = (char *)v154 - v17;
  uint64_t v18 = *(void *)(a1 + 16);
  if (!v18) {
    return 4;
  }
  uint64_t v19 = *(unsigned __int8 *)(v11 + 80);
  v154[1] = a1;
  uint64_t v20 = a1 + ((v19 + 32) & ~v19);
  uint64_t v159 = *(void *)(v11 + 72);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v21(v9, v20 + v159 * (v18 - 1), v10);
  int64_t v22 = *(void **)(v11 + 56);
  uint64_t v156 = v11 + 56;
  v165 = v22;
  ((void (*)(char *, void, uint64_t, uint64_t))v22)(v9, 0, 1, v10);
  v154[2] = a2;
  uint64_t v23 = a2;
  uint64_t v24 = v11 + 16;
  v164 = v21;
  v21((char *)v161, v23, v10);
  uint64_t v25 = (uint64_t)v9;
  uint64_t v162 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v163 = v11 + 48;
  int v26 = v162(v9, 1, v10);
  uint64_t v27 = v11;
  if (v26 == 1)
  {
    int64_t v29 = v160;
    uint64_t v28 = v161;
    uint64_t v161 = *(void *)(v11 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v161)(v160, v28, v10);
    sub_25B3A9E54(v25, &qword_26A4FB600);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v161, v10);
    int64_t v29 = v160;
    uint64_t v161 = *(void *)(v11 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v161)(v160, v25, v10);
  }
  unint64_t v31 = sub_25B3BA4AC();
  uint64_t v158 = *(void (**)(char *, uint64_t))(v27 + 8);
  v158(v29, v10);
  if ((v31 & 0x8000000000000000) != 0) {
    goto LABEL_256;
  }
  if (__OFADD__(v31, 1)) {
    goto LABEL_254;
  }
  v154[0] = 0;
  uint64_t v167 = sub_25B3B0F48(0, v31 + 1);
  v160 = (char *)(v27 + 32);
  uint64_t v157 = v27 + 8;
  swift_bridgeObjectRetain();
  uint64_t v32 = 0;
  uint64_t v155 = v10;
  do
  {
    v164(v7, v20, v10);
    uint64_t v33 = v32 + 1;
    if (__OFADD__(v32, 1))
    {
      __break(1u);
LABEL_227:
      __break(1u);
      goto LABEL_228;
    }
    ((void (*)(char *, void, uint64_t, uint64_t))v165)(v7, 0, 1, v10);
    if (v162(v7, 1, v10) == 1) {
      goto LABEL_30;
    }
    ((void (*)(char *, char *, uint64_t))v161)(v14, v7, v10);
    sub_25B3DCC38();
    if (v34 >= 0.0)
    {
      double v35 = v34 / 86400.0;
      if ((~*(void *)&v35 & 0x7FF0000000000000) == 0) {
        goto LABEL_229;
      }
      if (v35 <= -1.0) {
        goto LABEL_230;
      }
      if (v35 >= 1.84467441e19) {
        goto LABEL_231;
      }
      uint64_t v36 = v7;
      char v37 = v14;
      uint64_t v38 = v24;
      uint64_t v39 = v18;
      unint64_t v40 = (unint64_t)v35;
      if (((unint64_t)v35 & 0x8000000000000000) != 0) {
        goto LABEL_232;
      }
      uint64_t v41 = (char *)v167;
      unint64_t v42 = *(void *)(v167 + 16);
      BOOL v43 = v40 >= v42;
      unint64_t v44 = v40 - v42;
      if (v43)
      {
        size_t v45 = v44 + 1;
        if (__OFADD__(v44, 1)) {
          goto LABEL_243;
        }
        if ((v45 & 0x8000000000000000) != 0) {
          goto LABEL_260;
        }
        if (v44 == -1)
        {
          uint64_t v46 = MEMORY[0x263F8EE78];
        }
        else
        {
          uint64_t v46 = sub_25B3DCEC8();
          *(void *)(v46 + 16) = v45;
          bzero((void *)(v46 + 32), v45);
        }
        sub_25B3A4DEC(v46);
        uint64_t v41 = (char *)v167;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v41 = sub_25B3D8968((uint64_t)v41);
      }
      if (*((void *)v41 + 2) <= v40) {
        goto LABEL_233;
      }
      v41[v40 + 32] = 1;
      uint64_t v167 = (uint64_t)v41;
      uint64_t v18 = v39;
      uint64_t v24 = v38;
      unint64_t v14 = v37;
      unint64_t v7 = v36;
      uint64_t v10 = v155;
    }
    v158(v14, v10);
    ++v32;
    v20 += v159;
  }
  while (v33 != v18);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v165)(v7, 1, 1, v10);
LABEL_30:
  swift_bridgeObjectRelease();
  uint64_t v47 = (void (*)(void, void, void))v167;
  uint64_t v48 = *(void *)(v167 + 16);
  if (!v48) {
    goto LABEL_37;
  }
  if (*(unsigned char *)(v167 + 32))
  {
    if (v48 != 1)
    {
      uint64_t v49 = 33;
      do
      {
        uint64_t v50 = v49 - 31;
        if (__OFADD__(v49 - 32, 1)) {
          goto LABEL_253;
        }
        if (*(unsigned char *)(v167 + v49) != 1) {
          goto LABEL_38;
        }
        ++v49;
      }
      while (v50 != v48);
    }
LABEL_37:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_38:
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  do
  {
    uint64_t v53 = v51 + 1;
    if (__OFADD__(v51, 1)) {
      goto LABEL_227;
    }
    BOOL v54 = __OFADD__(v52, 7);
    v52 += 7;
    if (v54) {
      uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    }
    ++v51;
  }
  while (v52 < v48);
  uint64_t v162 = (uint64_t (*)(char *, uint64_t, uint64_t))(v167 + 32);
  v166 = (void *)MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_25B3B7B10(0, v53 & ~(v53 >> 63), 0);
  if (v53 < 0) {
    goto LABEL_257;
  }
  uint64_t v55 = v166;
  uint64_t v163 = v48;
  v164 = (void (*)(char *, uint64_t, uint64_t))v47;
  if (!v53) {
    goto LABEL_74;
  }
  uint64_t v53 = 0;
  uint64_t v56 = 7;
  uint64_t v57 = 32;
  do
  {
    v165 = v55;
    if (v48 >= v56) {
      uint64_t v58 = v56;
    }
    else {
      uint64_t v58 = v48;
    }
    if (v53 >= (unint64_t)v48) {
      goto LABEL_238;
    }
    if (v53 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_239;
    }
    if (v48 >= v53 + 7) {
      uint64_t v59 = v53 + 7;
    }
    else {
      uint64_t v59 = v48;
    }
    if (v59 < v53) {
      goto LABEL_240;
    }
    unint64_t v60 = *((void *)v47 + 2);
    if (v60 < v53 || (uint64_t)v60 < v59) {
      goto LABEL_241;
    }
    sub_25B3DD338();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    uint64_t v61 = swift_dynamicCastClass();
    if (!v61)
    {
      swift_bridgeObjectRelease();
      uint64_t v61 = MEMORY[0x263F8EE78];
    }
    uint64_t v62 = v58 + v57;
    uint64_t v63 = *(void *)(v61 + 16);
    swift_release();
    uint64_t v64 = v62 - 32;
    if (v62 - 32 == v63)
    {
      uint64_t v65 = (char *)swift_dynamicCastClass();
      if (!v65)
      {
        swift_bridgeObjectRelease();
        uint64_t v65 = (char *)MEMORY[0x263F8EE78];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v65 = (char *)MEMORY[0x263F8EE78];
      if (v53 != v59)
      {
        if (v64 < 1)
        {
          if (v64 < 0) {
            goto LABEL_261;
          }
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
          uint64_t v65 = (char *)swift_allocObject();
          size_t v68 = _swift_stdlib_malloc_size(v65);
          *((void *)v65 + 2) = v64;
          *((void *)v65 + 3) = 2 * v68 - 64;
        }
        unint64_t v69 = v65 + 32;
        if ((char *)v162 + v53 < &v65[v62] && v69 < (char *)v162 + v59) {
          goto LABEL_261;
        }
        memcpy(v69, (char *)v162 + v53, v62 - 32);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v55 = v165;
    v166 = v165;
    unint64_t v67 = v165[2];
    unint64_t v66 = v165[3];
    if (v67 >= v66 >> 1)
    {
      sub_25B3B7B10(v66 > 1, v67 + 1, 1);
      uint64_t v55 = v166;
    }
    v55[2] = v67 + 1;
    v55[v67 + 4] = v65;
    v56 += 7;
    v57 -= 7;
    v53 += 7;
    --v51;
    uint64_t v48 = v163;
  }
  while (v51);
  if (v53 < v163)
  {
LABEL_74:
    uint64_t v70 = v53 + 7;
    uint64_t v71 = 32 - v53;
    uint64_t v72 = v53;
    while (1)
    {
      v165 = v55;
      uint64_t v73 = v48 >= v70 ? v70 : v48;
      uint64_t v74 = v72 + 7;
      if (__OFADD__(v72, 7)) {
        break;
      }
      if (v48 >= v74) {
        uint64_t v48 = v72 + 7;
      }
      if (v48 < v72) {
        goto LABEL_235;
      }
      if (v53 < 0) {
        goto LABEL_236;
      }
      uint64_t v75 = *((void *)v47 + 2);
      if (v75 < (unint64_t)v72 || v75 < v48) {
        goto LABEL_237;
      }
      sub_25B3DD338();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain_n();
      uint64_t v77 = swift_dynamicCastClass();
      if (!v77)
      {
        swift_bridgeObjectRelease();
        uint64_t v77 = MEMORY[0x263F8EE78];
      }
      uint64_t v78 = v73 + v71;
      uint64_t v79 = *(void *)(v77 + 16);
      swift_release();
      uint64_t v80 = v78 - 32;
      if (v78 - 32 == v79)
      {
        uint64_t v47 = (void (*)(void, void, void))v164;
        char v81 = (char *)swift_dynamicCastClass();
        if (!v81)
        {
          swift_bridgeObjectRelease();
          char v81 = (char *)MEMORY[0x263F8EE78];
        }
      }
      else
      {
        uint64_t v47 = (void (*)(void, void, void))v164;
        swift_bridgeObjectRelease();
        char v81 = (char *)MEMORY[0x263F8EE78];
        if (v72 != v48)
        {
          if (v80 < 1)
          {
            if (v80 < 0) {
              goto LABEL_261;
            }
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
            char v81 = (char *)swift_allocObject();
            size_t v84 = _swift_stdlib_malloc_size(v81);
            *((void *)v81 + 2) = v80;
            *((void *)v81 + 3) = 2 * v84 - 64;
          }
          uint64_t v85 = v81 + 32;
          if ((char *)v162 + v72 < &v81[v78] && v85 < (char *)v162 + v48) {
            goto LABEL_261;
          }
          memcpy(v85, (char *)v162 + v72, v78 - 32);
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v55 = v165;
      v166 = v165;
      unint64_t v83 = v165[2];
      unint64_t v82 = v165[3];
      if (v83 >= v82 >> 1)
      {
        sub_25B3B7B10(v82 > 1, v83 + 1, 1);
        uint64_t v55 = v166;
      }
      v55[2] = v83 + 1;
      v55[v83 + 4] = v81;
      v72 += 7;
      v70 += 7;
      v71 -= 7;
      uint64_t v48 = v163;
      if (v74 >= v163) {
        goto LABEL_103;
      }
    }
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
LABEL_236:
    __break(1u);
LABEL_237:
    __break(1u);
LABEL_238:
    __break(1u);
LABEL_239:
    __break(1u);
LABEL_240:
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
    __break(1u);
LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    __break(1u);
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
    goto LABEL_255;
  }
LABEL_103:
  swift_bridgeObjectRelease();
  int64_t v86 = v55[2];
  if (!v86)
  {
    swift_release();
    unint64_t v88 = (void *)MEMORY[0x263F8EE78];
    uint64_t v96 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v96) {
      goto LABEL_124;
    }
    goto LABEL_130;
  }
  v166 = (void *)MEMORY[0x263F8EE78];
  sub_25B3B7B40(0, v86, 0);
  uint64_t v87 = 0;
  unint64_t v88 = v166;
  while (2)
  {
    uint64_t v89 = v55[v87 + 4];
    uint64_t v90 = *(void *)(v89 + 16);
    if (v90)
    {
      if (*(unsigned char *)(v89 + 32) == 1) {
        goto LABEL_107;
      }
      if (v90 != 1)
      {
        if (*(unsigned char *)(v89 + 33))
        {
LABEL_107:
          char v91 = 1;
          goto LABEL_110;
        }
        if (v90 == 2) {
          goto LABEL_109;
        }
        uint64_t v94 = 34;
        while (1)
        {
          uint64_t v95 = v94 - 31;
          if (__OFADD__(v94 - 32, 1)) {
            break;
          }
          char v91 = *(unsigned char *)(v89 + v94);
          if ((v91 & 1) == 0)
          {
            ++v94;
            if (v95 != v90) {
              continue;
            }
          }
          goto LABEL_110;
        }
LABEL_228:
        __break(1u);
LABEL_229:
        __break(1u);
LABEL_230:
        __break(1u);
LABEL_231:
        __break(1u);
LABEL_232:
        __break(1u);
LABEL_233:
        __break(1u);
        goto LABEL_234;
      }
    }
LABEL_109:
    char v91 = 0;
LABEL_110:
    v166 = v88;
    unint64_t v93 = v88[2];
    unint64_t v92 = v88[3];
    if (v93 >= v92 >> 1)
    {
      sub_25B3B7B40(v92 > 1, v93 + 1, 1);
      unint64_t v88 = v166;
    }
    ++v87;
    v88[2] = v93 + 1;
    *((unsigned char *)v88 + v93 + 32) = v91;
    if (v87 != v86) {
      continue;
    }
    break;
  }
  swift_release();
  uint64_t v96 = v88[2];
  if (!v96) {
    goto LABEL_130;
  }
LABEL_124:
  if (v88[4])
  {
    if (v96 != 1)
    {
      uint64_t v97 = 33;
      while (1)
      {
        uint64_t v98 = v97 - 31;
        if (__OFADD__(v97 - 32, 1)) {
          break;
        }
        if (*((unsigned char *)v88 + v97) != 1) {
          goto LABEL_131;
        }
        ++v97;
        if (v98 == v96) {
          goto LABEL_130;
        }
      }
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
      sub_25B3DD228();
      __break(1u);
LABEL_261:
      uint64_t result = sub_25B3DD288();
      __break(1u);
      return result;
    }
LABEL_130:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_131:
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  do
  {
    uint64_t v101 = v99 + 1;
    if (__OFADD__(v99, 1)) {
      goto LABEL_242;
    }
    BOOL v54 = __OFADD__(v100, 4);
    v100 += 4;
    if (v54) {
      uint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    }
    ++v99;
  }
  while (v100 < v96);
  uint64_t v162 = (uint64_t (*)(char *, uint64_t, uint64_t))(v88 + 4);
  v166 = (void *)MEMORY[0x263F8EE78];
  sub_25B3B7B10(0, v101 & ~(v101 >> 63), 0);
  if (v101 < 0) {
    goto LABEL_259;
  }
  uint64_t v102 = (uint64_t)v166;
  v165 = (void *)v96;
  uint64_t v103 = 0;
  if (!v101) {
    goto LABEL_167;
  }
  uint64_t v104 = 4;
  uint64_t v105 = 32;
  do
  {
    uint64_t v163 = v102;
    if (v96 >= v104) {
      uint64_t v106 = v104;
    }
    else {
      uint64_t v106 = v96;
    }
    if (v103 >= (unint64_t)v96) {
      goto LABEL_249;
    }
    if (v103 == 0x7FFFFFFFFFFFFFFCLL) {
      goto LABEL_250;
    }
    if (v96 >= v103 + 4) {
      uint64_t v107 = v103 + 4;
    }
    else {
      uint64_t v107 = v96;
    }
    if (v107 < v103) {
      goto LABEL_251;
    }
    uint64_t v108 = v88[2];
    if (v108 < (unint64_t)v103 || v108 < v107) {
      goto LABEL_252;
    }
    uint64_t v109 = v103;
    sub_25B3DD338();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    uint64_t v110 = swift_dynamicCastClass();
    if (!v110)
    {
      swift_bridgeObjectRelease();
      uint64_t v110 = MEMORY[0x263F8EE78];
    }
    uint64_t v111 = v106 + v105;
    uint64_t v112 = *(void *)(v110 + 16);
    swift_release();
    uint64_t v113 = v111 - 32;
    if (v111 - 32 == v112)
    {
      uint64_t v114 = (char *)swift_dynamicCastClass();
      if (!v114)
      {
        swift_bridgeObjectRelease();
        uint64_t v114 = (char *)MEMORY[0x263F8EE78];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v114 = (char *)MEMORY[0x263F8EE78];
      if (v109 != v107)
      {
        if (v113 < 1)
        {
          v118 = v162;
          if (v113 < 0) {
            goto LABEL_261;
          }
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
          uint64_t v114 = (char *)swift_allocObject();
          size_t v117 = _swift_stdlib_malloc_size(v114);
          *((void *)v114 + 2) = v113;
          *((void *)v114 + 3) = 2 * v117 - 64;
          v118 = v162;
        }
        uint64_t v119 = v114 + 32;
        if ((char *)v118 + v109 < &v114[v111] && v119 < (char *)v118 + v107) {
          goto LABEL_261;
        }
        memcpy(v119, (char *)v118 + v109, v111 - 32);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v102 = v163;
    v166 = (void *)v163;
    unint64_t v116 = *(void *)(v163 + 16);
    unint64_t v115 = *(void *)(v163 + 24);
    if (v116 >= v115 >> 1)
    {
      sub_25B3B7B10(v115 > 1, v116 + 1, 1);
      uint64_t v102 = (uint64_t)v166;
    }
    *(void *)(v102 + 16) = v116 + 1;
    *(void *)(v102 + 8 * v116 + 32) = v114;
    v104 += 4;
    v105 -= 4;
    uint64_t v103 = v109 + 4;
    --v99;
    uint64_t v96 = (uint64_t)v165;
  }
  while (v99);
  if (v103 < (uint64_t)v165)
  {
LABEL_167:
    uint64_t v120 = v103 + 4;
    uint64_t v121 = 32 - v103;
    unint64_t v122 = v103;
    uint64_t v163 = v103;
    do
    {
      uint64_t v123 = v102;
      uint64_t v124 = v96 >= v120 ? v120 : v96;
      uint64_t v125 = v122 + 4;
      if (__OFADD__(v122, 4)) {
        goto LABEL_245;
      }
      if (v96 >= v125) {
        uint64_t v126 = v122 + 4;
      }
      else {
        uint64_t v126 = v96;
      }
      if (v126 < (uint64_t)v122) {
        goto LABEL_246;
      }
      if (v103 < 0) {
        goto LABEL_247;
      }
      uint64_t v127 = v88[2];
      if (v127 < v122 || v127 < v126) {
        goto LABEL_248;
      }
      sub_25B3DD338();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain_n();
      uint64_t v129 = swift_dynamicCastClass();
      if (!v129)
      {
        swift_bridgeObjectRelease();
        uint64_t v129 = MEMORY[0x263F8EE78];
      }
      uint64_t v130 = v124 + v121;
      uint64_t v131 = *(void *)(v129 + 16);
      swift_release();
      if (v130 - 32 == v131)
      {
        uint64_t v132 = (char *)swift_dynamicCastClass();
        uint64_t v102 = v123;
        if (!v132)
        {
          swift_bridgeObjectRelease();
          uint64_t v132 = (char *)MEMORY[0x263F8EE78];
        }
      }
      else
      {
        uint64_t v161 = v130 - 32;
        swift_bridgeObjectRelease();
        uint64_t v132 = (char *)MEMORY[0x263F8EE78];
        uint64_t v102 = v123;
        if (v122 != v126)
        {
          size_t v135 = v161;
          if (v161 < 1)
          {
            v137 = v162;
            if (v161 < 0) {
              goto LABEL_261;
            }
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6A0);
            uint64_t v132 = (char *)swift_allocObject();
            size_t v136 = _swift_stdlib_malloc_size(v132);
            size_t v135 = v161;
            v137 = v162;
            *((void *)v132 + 2) = v161;
            *((void *)v132 + 3) = 2 * v136 - 64;
          }
          uint64_t v138 = v132 + 32;
          if ((char *)v137 + v122 < &v132[v130] && v138 < (char *)v137 + v126) {
            goto LABEL_261;
          }
          memcpy(v138, (char *)v137 + v122, v135);
        }
      }
      swift_bridgeObjectRelease();
      v166 = (void *)v102;
      unint64_t v134 = *(void *)(v102 + 16);
      unint64_t v133 = *(void *)(v102 + 24);
      if (v134 >= v133 >> 1)
      {
        sub_25B3B7B10(v133 > 1, v134 + 1, 1);
        uint64_t v102 = (uint64_t)v166;
      }
      *(void *)(v102 + 16) = v134 + 1;
      *(void *)(v102 + 8 * v134 + 32) = v132;
      v122 += 4;
      v120 += 4;
      v121 -= 4;
      uint64_t v96 = (uint64_t)v165;
      uint64_t v103 = v163;
    }
    while (v125 < (uint64_t)v165);
  }
  swift_bridgeObjectRelease();
  int64_t v139 = *(void *)(v102 + 16);
  if (!v139)
  {
    swift_release();
    long long v142 = (void *)MEMORY[0x263F8EE78];
    uint64_t v151 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v151) {
      goto LABEL_224;
    }
LABEL_218:
    if (*((unsigned char *)v142 + 32) != 1)
    {
LABEL_225:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 3;
    }
    if (v151 == 1) {
      goto LABEL_224;
    }
    uint64_t v152 = 33;
    while (1)
    {
      uint64_t v153 = v152 - 31;
      if (__OFADD__(v152 - 32, 1)) {
        goto LABEL_258;
      }
      if (*((unsigned char *)v142 + v152) != 1) {
        goto LABEL_225;
      }
      ++v152;
      if (v153 == v151) {
        goto LABEL_224;
      }
    }
  }
  v166 = (void *)MEMORY[0x263F8EE78];
  uint64_t v140 = v102;
  sub_25B3B7B40(0, v139, 0);
  uint64_t v141 = 0;
  long long v142 = v166;
  uint64_t v143 = v140 + 32;
  while (2)
  {
    uint64_t v144 = *(void *)(v143 + 8 * v141);
    uint64_t v145 = *(void *)(v144 + 16);
    if (!v145) {
      goto LABEL_203;
    }
    if (*(unsigned char *)(v144 + 32) == 1) {
      goto LABEL_201;
    }
    if (v145 != 1)
    {
      if ((*(unsigned char *)(v144 + 33) & 1) == 0)
      {
        if (v145 != 2)
        {
          uint64_t v149 = 34;
          while (1)
          {
            uint64_t v150 = v149 - 31;
            if (__OFADD__(v149 - 32, 1)) {
              goto LABEL_244;
            }
            char v146 = *(unsigned char *)(v144 + v149);
            if ((v146 & 1) == 0)
            {
              ++v149;
              if (v150 != v145) {
                continue;
              }
            }
            goto LABEL_204;
          }
        }
        goto LABEL_203;
      }
LABEL_201:
      char v146 = 1;
    }
    else
    {
LABEL_203:
      char v146 = 0;
    }
LABEL_204:
    v166 = v142;
    unint64_t v148 = v142[2];
    unint64_t v147 = v142[3];
    if (v148 >= v147 >> 1)
    {
      sub_25B3B7B40(v147 > 1, v148 + 1, 1);
      long long v142 = v166;
    }
    ++v141;
    v142[2] = v148 + 1;
    *((unsigned char *)v142 + v148 + 32) = v146;
    if (v141 != v139) {
      continue;
    }
    break;
  }
  swift_release();
  uint64_t v151 = v142[2];
  if (v151) {
    goto LABEL_218;
  }
LABEL_224:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t _s15ReportingPlugin31PeopleSuggesterMetricsCollectorV019getShadowEvaluationE0ySaySDySSSo8NSObjectCGGSayAA0C21SuggestionsJointEventCGFZ_0(unint64_t a1)
{
  uint64_t v95 = sub_25B3DCC98();
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  double v3 = (char *)v93 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v5 = sub_25B3A656C(MEMORY[0x263F8EE78]);
  unint64_t v115 = v3;
  sub_25B3DCC88();
  if (a1 >> 62) {
    goto LABEL_76;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_25B3DD248())
  {
    unint64_t v7 = 0;
    unint64_t v114 = a1 & 0xC000000000000001;
    uint64_t v111 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
    uint64_t v110 = (const char *)(a1 + 32);
    uint64_t v118 = MEMORY[0x263F8EE50] + 8;
    unint64_t v113 = a1;
    uint64_t v112 = v6;
    while (1)
    {
      if (v114)
      {
        uint64_t v8 = (char *)MEMORY[0x2611628B0](v7, a1);
      }
      else
      {
        if (v7 >= *((void *)v111 + 2)) {
          goto LABEL_75;
        }
        uint64_t v8 = (char *)*(id *)&v110[8 * v7];
      }
      uint64_t v124 = v8;
      BOOL v9 = __OFADD__(v7++, 1);
      if (v9) {
        break;
      }
      uint64_t v10 = v5;
      uint64_t v5 = (uint64_t)v115;
      sub_25B3DCC38();
      if ((~*(void *)&v11 & 0x7FF0000000000000) == 0) {
        goto LABEL_72;
      }
      if (v11 <= -9.22337204e18) {
        goto LABEL_73;
      }
      if (v11 >= 9.22337204e18) {
        goto LABEL_74;
      }
      unint64_t v12 = (uint64_t)v11;
      if (((uint64_t)v11 & 0x8000000000000000) == 0)
      {
        unint64_t v13 = v12 >> 7;
        if (v12 < 0x24EA00) {
          int v14 = 2;
        }
        else {
          int v14 = 3;
        }
        if (v12 >= 0x93A80) {
          int v15 = v14;
        }
        else {
          int v15 = 1;
        }
        if (v13 < 0x2A3) {
          int v15 = 0;
        }
        LODWORD(v122) = v15;
        uint64_t v117 = v7;
        uint64_t v16 = *(void *)&v124[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels];
        if ((v16 & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          sub_25B3DD078();
          uint64_t v5 = type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
          sub_25B3BC6C8();
          sub_25B3DCF48();
          uint64_t v16 = v127[1];
          uint64_t v121 = v128;
          uint64_t v17 = v129;
          a1 = v130;
          unint64_t v18 = v131;
        }
        else
        {
          uint64_t v19 = -1 << *(unsigned char *)(v16 + 32);
          uint64_t v20 = *(void *)(v16 + 56);
          uint64_t v121 = v16 + 56;
          uint64_t v5 = ~v19;
          uint64_t v21 = -v19;
          if (v21 < 64) {
            uint64_t v22 = ~(-1 << v21);
          }
          else {
            uint64_t v22 = -1;
          }
          unint64_t v18 = v22 & v20;
          swift_bridgeObjectRetain();
          uint64_t v17 = v5;
          a1 = 0;
        }
        uint64_t v116 = v17;
        uint64_t v119 = v16 & 0x7FFFFFFFFFFFFFFFLL;
        int64_t v120 = (unint64_t)(v17 + 64) >> 6;
        for (i = v16; ; uint64_t v16 = i)
        {
          if (v16 < 0)
          {
            uint64_t v26 = sub_25B3DD0F8();
            if (!v26) {
              goto LABEL_4;
            }
            uint64_t v126 = v26;
            type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v27 = (id)v127[0];
            swift_unknownObjectRelease();
            unint64_t v25 = a1;
            uint64_t v23 = v18;
            if (!v27) {
              goto LABEL_4;
            }
          }
          else
          {
            if (v18)
            {
              uint64_t v23 = (v18 - 1) & v18;
              unint64_t v24 = __clz(__rbit64(v18)) | (a1 << 6);
              unint64_t v25 = a1;
            }
            else
            {
              int64_t v28 = a1 + 1;
              if (__OFADD__(a1, 1)) {
                goto LABEL_70;
              }
              if (v28 >= v120) {
                goto LABEL_4;
              }
              unint64_t v29 = *(void *)(v121 + 8 * v28);
              unint64_t v25 = a1 + 1;
              if (!v29)
              {
                unint64_t v25 = a1 + 2;
                if ((uint64_t)(a1 + 2) >= v120) {
                  goto LABEL_4;
                }
                unint64_t v29 = *(void *)(v121 + 8 * v25);
                if (!v29)
                {
                  unint64_t v25 = a1 + 3;
                  if ((uint64_t)(a1 + 3) >= v120) {
                    goto LABEL_4;
                  }
                  unint64_t v29 = *(void *)(v121 + 8 * v25);
                  if (!v29)
                  {
                    unint64_t v25 = a1 + 4;
                    if ((uint64_t)(a1 + 4) >= v120) {
                      goto LABEL_4;
                    }
                    unint64_t v29 = *(void *)(v121 + 8 * v25);
                    if (!v29)
                    {
                      unint64_t v30 = a1 + 5;
                      while (v120 != v30)
                      {
                        unint64_t v29 = *(void *)(v121 + 8 * v30++);
                        if (v29)
                        {
                          unint64_t v25 = v30 - 1;
                          goto LABEL_51;
                        }
                      }
LABEL_4:
                      sub_25B3A90C0();
                      uint64_t v4 = MEMORY[0x263F8EE78];
                      uint64_t v5 = v10;
                      a1 = v113;
                      uint64_t v6 = v112;
                      unint64_t v7 = v117;
                      goto LABEL_5;
                    }
                  }
                }
              }
LABEL_51:
              uint64_t v23 = (v29 - 1) & v29;
              unint64_t v24 = __clz(__rbit64(v29)) + (v25 << 6);
            }
            id v27 = *(id *)(*(void *)(v16 + 48) + 8 * v24);
            if (!v27) {
              goto LABEL_4;
            }
          }
          uint64_t v31 = *(void *)&v124[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement];
          uint64_t v32 = *(void *)&v124[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks];
          uint64_t v33 = *(void *)(v32 + 16);
          id v34 = v27;
          a1 = (unint64_t)v34;
          unint64_t v125 = v25;
          if (v33)
          {
            id v35 = v34;
            unint64_t v36 = sub_25B3B24D8((uint64_t)v35);
            unint64_t v18 = v23;
            int v38 = (v37 & 1) != 0 ? *(unsigned __int8 *)(*(void *)(v32 + 56) + v36) : 0;
            uint64_t v39 = v10;
            uint64_t v4 = v37 ^ 1u;
          }
          else
          {
            unint64_t v18 = v23;
            int v38 = 0;
            uint64_t v4 = 1;
            uint64_t v39 = v10;
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v127[0] = v39;
          uint64_t v5 = v10;
          unint64_t v42 = sub_25B3B24D8(a1);
          uint64_t v43 = *(void *)(v10 + 16);
          BOOL v44 = (v41 & 1) == 0;
          uint64_t v45 = v43 + v44;
          if (__OFADD__(v43, v44)) {
            break;
          }
          char v46 = v41;
          if (*(void *)(v10 + 24) >= v45)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_25B3B6CFC();
            }
          }
          else
          {
            sub_25B3B413C(v45, isUniquelyReferenced_nonNull_native);
            type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            unint64_t v47 = sub_25B3B24D8(a1);
            if ((v46 & 1) != (v48 & 1)) {
              goto LABEL_139;
            }
            unint64_t v42 = v47;
          }
          uint64_t v5 = v127[0];
          swift_bridgeObjectRelease();
          if ((v46 & 1) == 0)
          {
            *(void *)(v5 + 8 * (v42 >> 6) + 64) |= 1 << v42;
            *(void *)(*(void *)(v5 + 48) + 8 * v42) = a1;
            uint64_t v49 = *(void *)(v5 + 56) + 16 * v42;
            *(unsigned char *)uint64_t v49 = 0;
            *(void *)(v49 + 8) = MEMORY[0x263F8EE80];
            uint64_t v50 = *(void *)(v5 + 16);
            BOOL v9 = __OFADD__(v50, 1);
            uint64_t v51 = v50 + 1;
            if (v9) {
              goto LABEL_69;
            }
            *(void *)(v5 + 16) = v51;
            id v52 = (id)a1;
          }
          uint64_t v10 = v5;
          uint64_t v5 = *(void *)(v5 + 56) + 16 * v42;
          sub_25B3AAFB4(v122, v31, v38 & 0xFFFFFEFF | ((v4 & 1) << 8));

          a1 = v125;
        }
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
        break;
      }
      uint64_t v5 = v10;
LABEL_5:

      if (v7 == v6) {
        goto LABEL_77;
      }
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    swift_bridgeObjectRetain();
  }
LABEL_77:
  uint64_t v53 = swift_bridgeObjectRelease();
  v127[0] = v4;
  MEMORY[0x270FA5388](v53);
  v93[-2] = v127;
  uint64_t v54 = swift_bridgeObjectRetain();
  sub_25B3B9B50(v54, (void (*)(void **, unsigned char *))sub_25B3BD560);
  unint64_t v113 = v5;
  swift_bridgeObjectRelease();
  uint64_t v55 = v127[0];
  int64_t v56 = *(void *)(v127[0] + 16);
  if (!v56)
  {
    swift_bridgeObjectRelease();
    uint64_t v59 = MEMORY[0x263F8EE78];
    goto LABEL_132;
  }
  v127[0] = v4;
  uint64_t v57 = v55;
  sub_25B3B7B90(0, v56, 0);
  uint64_t v58 = 0;
  v93[1] = v57;
  uint64_t v98 = v57 + 32;
  uint64_t v59 = v127[0];
  uint64_t v118 = (uint64_t)"has_all_daily_data";
  uint64_t v111 = "";
  uint64_t v110 = "num_airdrop_engaged_total";
  uint64_t v109 = "num_airdrop_shown_total";
  uint64_t v108 = "num_bottomrow_total";
  uint64_t v107 = "intent_app_total";
  uint64_t v106 = "num_sharesheet_abandoned_total";
  uint64_t v105 = "num_sharesheet_others_total";
  uint64_t v104 = "num_sharesheet_total";
  uint64_t v103 = "num_sharing_intent_app_total";
  uint64_t v102 = "num_suggestLess_total";
  uint64_t v101 = "ng";
  uint64_t v100 = "trialDeploymentId";
  uint64_t v99 = "trialExperimentId";
  int64_t v96 = v56;
  do
  {
    uint64_t v117 = v58;
    uint64_t v116 = swift_bridgeObjectRetain();
    uint64_t v60 = sub_25B3ABBE8(v116);
    unint64_t v114 = 0;
    int64_t v61 = *(void *)(v60 + 16);
    if (v61)
    {
      uint64_t v112 = v59;
      uint64_t v126 = v4;
      sub_25B3B7BC0(0, v61, 0);
      uint64_t v62 = v126;
      uint64_t v64 = sub_25B3D8BF8(v60);
      uint64_t v65 = 0;
      uint64_t v66 = v60 + 64;
      char v67 = *(unsigned char *)(v60 + 32);
      uint64_t v119 = v63;
      uint64_t v97 = v60 + 88;
      uint64_t v121 = v60 + 64;
      uint64_t v122 = v60;
      int64_t v120 = v61;
      while (1)
      {
        if (v64 < 0 || v64 >= 1 << v67)
        {
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
          sub_25B3DD378();
          __break(1u);
LABEL_140:
          swift_unexpectedError();
          __break(1u);
          JUMPOUT(0x25B3BC51CLL);
        }
        unint64_t v70 = (unint64_t)v64 >> 6;
        if ((*(void *)(v66 + 8 * ((unint64_t)v64 >> 6)) & (1 << v64)) == 0) {
          goto LABEL_134;
        }
        if (*(_DWORD *)(v60 + 36) != v63) {
          goto LABEL_135;
        }
        uint64_t v124 = (char *)(v64 & 0x3F);
        unint64_t v125 = v63;
        uint64_t v71 = *(unsigned __int8 *)(*(void *)(v60 + 48) + v64);
        uint64_t v72 = *(void **)(*(void *)(v60 + 56) + 8 * v64);
        unint64_t v73 = 0xD00000000000001ALL;
        unint64_t v74 = v118 | 0x8000000000000000;
        uint64_t i = v65 + 1;
        switch(v71)
        {
          case 1:
            break;
          case 2:
            unint64_t v73 = 0x61746F745F72726DLL;
            unint64_t v74 = 0xE90000000000006CLL;
            break;
          case 3:
            unint64_t v73 = 0xD000000000000019;
            double v76 = (unint64_t *)&v140;
            goto LABEL_106;
          case 4:
            unint64_t v73 = 0xD000000000000017;
            double v76 = (unint64_t *)&v139;
            goto LABEL_106;
          case 5:
            unint64_t v73 = 0xD000000000000013;
            double v76 = (unint64_t *)&v138;
            goto LABEL_106;
          case 6:
            unint64_t v73 = 0xD000000000000020;
            double v76 = (unint64_t *)&v137;
            goto LABEL_106;
          case 7:
            unint64_t v73 = 0xD00000000000001ELL;
            double v76 = (unint64_t *)&v136;
            goto LABEL_106;
          case 8:
            unint64_t v73 = 0xD00000000000001BLL;
            double v76 = (unint64_t *)&v135;
            goto LABEL_106;
          case 9:
            unint64_t v73 = 0xD000000000000014;
            double v76 = (unint64_t *)&v134;
            goto LABEL_106;
          case 10:
            unint64_t v73 = 0xD00000000000001CLL;
            double v76 = (unint64_t *)&v133;
            goto LABEL_106;
          case 11:
            unint64_t v73 = 0xD000000000000015;
            double v76 = (unint64_t *)&v132;
            goto LABEL_106;
          case 12:
            uint64_t v75 = &v131;
            goto LABEL_94;
          case 13:
            unint64_t v74 = 0xEF6C65646F4D6E6FLL;
            unint64_t v73 = 0x6974736567677573;
            break;
          case 14:
            unint64_t v73 = 0xD000000000000011;
            double v76 = &v130;
            goto LABEL_106;
          case 15:
            unint64_t v73 = 0xD000000000000011;
            double v76 = (unint64_t *)&v129;
LABEL_106:
            unint64_t v74 = *(v76 - 32) | 0x8000000000000000;
            break;
          case 16:
            uint64_t v75 = (unint64_t *)&v128;
LABEL_94:
            unint64_t v74 = *(v75 - 32) | 0x8000000000000000;
            unint64_t v73 = 0xD000000000000010;
            break;
          case 17:
            unint64_t v74 = 0xEF79636E65757165;
            unint64_t v73 = 0x72665F6567617375;
            break;
          default:
            unint64_t v74 = 0xE900000000000072;
            unint64_t v73 = 0x65735577654E7369;
            break;
        }
        uint64_t v126 = v62;
        unint64_t v78 = *(void *)(v62 + 16);
        unint64_t v77 = *(void *)(v62 + 24);
        id v79 = v72;
        if (v78 >= v77 >> 1)
        {
          sub_25B3B7BC0(v77 > 1, v78 + 1, 1);
          uint64_t v62 = v126;
        }
        *(void *)(v62 + 16) = v78 + 1;
        uint64_t v80 = (void *)(v62 + 24 * v78);
        v80[4] = v73;
        v80[5] = v74;
        v80[6] = v79;
        uint64_t v60 = v122;
        char v67 = *(unsigned char *)(v122 + 32);
        unint64_t v68 = 1 << v67;
        if (v64 >= 1 << v67) {
          goto LABEL_136;
        }
        uint64_t v66 = v121;
        uint64_t v81 = *(void *)(v121 + 8 * v70);
        if ((v81 & (1 << v64)) == 0) {
          goto LABEL_137;
        }
        if (*(_DWORD *)(v122 + 36) != v125) {
          goto LABEL_138;
        }
        unint64_t v82 = v81 & (-2 << (char)v124);
        if (v82)
        {
          unint64_t v68 = __clz(__rbit64(v82)) | v64 & 0xFFFFFFFFFFFFFFC0;
          uint64_t v4 = MEMORY[0x263F8EE78];
          int64_t v69 = v120;
          uint64_t v65 = i;
        }
        else
        {
          unint64_t v83 = v70 + 1;
          unint64_t v84 = (v68 + 63) >> 6;
          uint64_t v4 = MEMORY[0x263F8EE78];
          int64_t v69 = v120;
          uint64_t v65 = i;
          if (v70 + 1 < v84)
          {
            unint64_t v85 = *(void *)(v121 + 8 * v83);
            if (!v85)
            {
              unint64_t v83 = v70 + 2;
              if (v70 + 2 >= v84) {
                goto LABEL_82;
              }
              unint64_t v85 = *(void *)(v121 + 8 * v83);
              if (!v85)
              {
                while (v84 - 3 != v70)
                {
                  unint64_t v85 = *(void *)(v97 + 8 * v70++);
                  if (v85)
                  {
                    unint64_t v83 = v70 + 2;
                    goto LABEL_115;
                  }
                }
                goto LABEL_82;
              }
            }
LABEL_115:
            unint64_t v68 = __clz(__rbit64(v85)) + (v83 << 6);
          }
        }
LABEL_82:
        uint64_t v63 = v119;
        uint64_t v64 = v68;
        if (v65 == v69)
        {
          swift_bridgeObjectRelease();
          int64_t v56 = v96;
          uint64_t v59 = v112;
          goto LABEL_123;
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v62 = v4;
LABEL_123:
    if (*(void *)(v62 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB6C8);
      uint64_t v86 = sub_25B3DD278();
    }
    else
    {
      uint64_t v86 = MEMORY[0x263F8EE80];
    }
    uint64_t v126 = v86;
    uint64_t v87 = (void *)swift_bridgeObjectRetain();
    unint64_t v88 = v114;
    sub_25B3B7724(v87, 1, &v126);
    if (v88) {
      goto LABEL_140;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v89 = v126;
    v127[0] = v59;
    unint64_t v91 = *(void *)(v59 + 16);
    unint64_t v90 = *(void *)(v59 + 24);
    if (v91 >= v90 >> 1)
    {
      sub_25B3B7B90(v90 > 1, v91 + 1, 1);
      uint64_t v59 = v127[0];
    }
    uint64_t v58 = v117 + 1;
    *(void *)(v59 + 16) = v91 + 1;
    *(void *)(v59 + 8 * v91 + 32) = v89;
  }
  while (v58 != v56);
  swift_bridgeObjectRelease();
LABEL_132:
  (*(void (**)(char *, uint64_t))(v94 + 8))(v115, v95);
  swift_bridgeObjectRelease();
  return v59;
}

uint64_t sub_25B3BC564(uint64_t *a1, uint64_t a2)
{
  return sub_25B3AF710(*a1, *(unsigned char *)a2, *(void *)(a2 + 8), *(void ***)(v2 + 16));
}

uint64_t sub_25B3BC57C(uint64_t *a1, unsigned __int8 *a2)
{
  return sub_25B3AF4DC(*a1, a1[1], *a2, *((void *)a2 + 1), *(void ***)(v2 + 16));
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

unint64_t sub_25B3BC5E8()
{
  unint64_t result = qword_26A4FB630;
  if (!qword_26A4FB630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB630);
  }
  return result;
}

uint64_t sub_25B3BC63C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25B3BC6A0(uint64_t a1)
{
  unint64_t result = sub_25B3BC6C8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25B3BC6C8()
{
  unint64_t result = qword_26A4FB640;
  if (!qword_26A4FB640)
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB640);
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector()
{
  return &type metadata for PeopleSuggesterMetricsCollector;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.Result()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PeopleSuggesterMetricsCollector.Result(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PeopleSuggesterMetricsCollector.Result(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PeopleSuggesterMetricsCollector.Result(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.Result(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.Result(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.Result()
{
  return &type metadata for PeopleSuggesterMetricsCollector.Result;
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.ModelDataBuilder()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
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

uint64_t assignWithTake for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.ModelDataBuilder()
{
  return &type metadata for PeopleSuggesterMetricsCollector.ModelDataBuilder;
}

uint64_t dispatch thunk of TimestampedEvent.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals()
{
  return &type metadata for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.TimeRange(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.TimeRange(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3BCF04);
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

unsigned char *sub_25B3BCF2C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.TimeRange()
{
  return &type metadata for PeopleSuggesterMetricsCollector.TimeRange;
}

unint64_t sub_25B3BCF48()
{
  unint64_t result = qword_26A4FB648;
  if (!qword_26A4FB648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB648);
  }
  return result;
}

uint64_t sub_25B3BCF9C()
{
  uint64_t result = sub_25B3DCC38();
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  unint64_t v2 = (uint64_t)v1;
  if ((uint64_t)v1 < 0) {
    return 4;
  }
  if (v2 >> 7 < 0x2A3) {
    return 0;
  }
  if (v2 < 0x93A80) {
    return 1;
  }
  if (v2 < 0x24EA00) {
    return 2;
  }
  return 3;
}

uint64_t sub_25B3BD058(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

char *sub_25B3BD160(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3BD24C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25B3BD284(void *a1)
{
  sub_25B3AEAFC(a1, v1);
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

uint64_t sub_25B3BD2A4()
{
  uint64_t v1 = sub_25B3DCC98();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_25B3BD370(void *a1)
{
  uint64_t v3 = *(void *)(sub_25B3DCC98() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v6);
  unint64_t v9 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_25B3AED68(a1, v1 + v4, v7, v8, v9);
}

unint64_t sub_25B3BD424(uint64_t a1, uint64_t a2)
{
  return sub_25B3B0DD4(a1, a2, *(void ***)(v2 + 16));
}

uint64_t sub_25B3BD440(uint64_t result)
{
  if (result) {
    return swift_release();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25B3BD504(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25B3BD560(uint64_t *a1, unsigned __int8 *a2)
{
  return sub_25B3B0468(*a1, *a2, *((void *)a2 + 1), *(void ***)(v2 + 16));
}

uint64_t sub_25B3BD578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3BD5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3BD648(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25B3BD6A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25B3DD328();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

unint64_t PeopleSuggesterShadowEvaluationField.rawValue.getter()
{
  unint64_t result = 0xD00000000000001ALL;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x61746F745F72726DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000019;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000020;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xA:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000015;
      break;
    case 0xC:
    case 0x10:
      unint64_t result = 0xD000000000000010;
      break;
    case 0xD:
      unint64_t result = 0x6974736567677573;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000011;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000011;
      break;
    case 0x11:
      unint64_t result = 0x72665F6567617375;
      break;
    default:
      unint64_t result = 0x65735577654E7369;
      break;
  }
  return result;
}

unint64_t PeopleSuggesterMetricsField.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x65735577654E7369;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
    case 7:
    case 0x21:
    case 0x22:
    case 0x27:
      unint64_t result = 0xD000000000000010;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000013;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000013;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000018;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000017;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000017;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000021;
      break;
    case 0x12:
      unint64_t result = 0xD000000000000020;
      break;
    case 0x13:
      unint64_t result = 0xD000000000000020;
      break;
    case 0x14:
      unint64_t result = 0xD000000000000015;
      break;
    case 0x15:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x16:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 0x17:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 0x18:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 0x19:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x1A:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x1B:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0x1C:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0x1D:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 0x1E:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x1F:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x20:
      unint64_t result = 0xD000000000000011;
      break;
    case 0x23:
      unint64_t result = 0xD000000000000012;
      break;
    case 0x24:
      unint64_t result = 0x6974736567677573;
      break;
    case 0x25:
      unint64_t result = 0xD000000000000011;
      break;
    case 0x26:
      unint64_t result = 0xD000000000000011;
      break;
    case 0x28:
      unint64_t result = 0x72665F6567617375;
      break;
    default:
      return result;
  }
  return result;
}

ReportingPlugin::PeopleSuggesterMetricsField_optional __swiftcall PeopleSuggesterMetricsField.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_25B3DD348();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 23;
  switch(v3)
  {
    case 0:
      goto LABEL_25;
    case 1:
      char v5 = 1;
      goto LABEL_25;
    case 2:
      char v5 = 2;
      goto LABEL_25;
    case 3:
      char v5 = 3;
      goto LABEL_25;
    case 4:
      char v5 = 4;
      goto LABEL_25;
    case 5:
      char v5 = 5;
      goto LABEL_25;
    case 6:
      char v5 = 6;
      goto LABEL_25;
    case 7:
      char v5 = 7;
      goto LABEL_25;
    case 8:
      char v5 = 8;
      goto LABEL_25;
    case 9:
      char v5 = 9;
      goto LABEL_25;
    case 10:
      char v5 = 10;
      goto LABEL_25;
    case 11:
      char v5 = 11;
      goto LABEL_25;
    case 12:
      char v5 = 12;
      goto LABEL_25;
    case 13:
      char v5 = 13;
      goto LABEL_25;
    case 14:
      char v5 = 14;
      goto LABEL_25;
    case 15:
      char v5 = 15;
      goto LABEL_25;
    case 16:
      char v5 = 16;
      goto LABEL_25;
    case 17:
      char v5 = 17;
      goto LABEL_25;
    case 18:
      char v5 = 18;
      goto LABEL_25;
    case 19:
      char v5 = 19;
      goto LABEL_25;
    case 20:
      char v5 = 20;
      goto LABEL_25;
    case 21:
      char v5 = 21;
      goto LABEL_25;
    case 22:
      char v5 = 22;
LABEL_25:
      char v6 = v5;
      break;
    case 23:
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    case 33:
      char v6 = 33;
      break;
    case 34:
      char v6 = 34;
      break;
    case 35:
      char v6 = 35;
      break;
    case 36:
      char v6 = 36;
      break;
    case 37:
      char v6 = 37;
      break;
    case 38:
      char v6 = 38;
      break;
    case 39:
      char v6 = 39;
      break;
    case 40:
      char v6 = 40;
      break;
    default:
      char v6 = 41;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

uint64_t sub_25B3BDF40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25B3BD6A0(*a1, *a2, (uint64_t (*)(void))PeopleSuggesterMetricsField.rawValue.getter) & 1;
}

uint64_t sub_25B3BDF78(uint64_t a1, uint64_t a2)
{
  return sub_25B3BE158(a1, a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter);
}

uint64_t sub_25B3BDF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B3BE1E0(a1, a2, a3, (void (*)(void))PeopleSuggesterMetricsField.rawValue.getter);
}

uint64_t sub_25B3BDFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B3BE260(a1, a2, a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter);
}

ReportingPlugin::PeopleSuggesterMetricsField_optional sub_25B3BDFC0(Swift::String *a1)
{
  return PeopleSuggesterMetricsField.init(rawValue:)(*a1);
}

unint64_t sub_25B3BDFCC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PeopleSuggesterMetricsField.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ReportingPlugin::PeopleSuggesterShadowEvaluationField_optional __swiftcall PeopleSuggesterShadowEvaluationField.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25B3DD348();
  result.value = swift_bridgeObjectRelease();
  char v5 = 18;
  if (v3 < 0x12) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t sub_25B3BE05C()
{
  unint64_t result = qword_26A4FB738;
  if (!qword_26A4FB738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB738);
  }
  return result;
}

uint64_t sub_25B3BE0B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25B3BD6A0(*a1, *a2, (uint64_t (*)(void))PeopleSuggesterShadowEvaluationField.rawValue.getter) & 1;
}

unint64_t sub_25B3BE0EC()
{
  unint64_t result = qword_26A4FB740;
  if (!qword_26A4FB740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB740);
  }
  return result;
}

uint64_t sub_25B3BE140(uint64_t a1, uint64_t a2)
{
  return sub_25B3BE158(a1, a2, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_25B3BE158(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_25B3DD3C8();
  a3(v4);
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  return sub_25B3DD408();
}

uint64_t sub_25B3BE1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B3BE1E0(a1, a2, a3, (void (*)(void))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_25B3BE1E0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_25B3DCE18();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B3BE248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25B3BE260(a1, a2, a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_25B3BE260(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_25B3DD3C8();
  a4(v5);
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  return sub_25B3DD408();
}

ReportingPlugin::PeopleSuggesterShadowEvaluationField_optional sub_25B3BE2CC(Swift::String *a1)
{
  return PeopleSuggesterShadowEvaluationField.init(rawValue:)(*a1);
}

unint64_t sub_25B3BE2D8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PeopleSuggesterShadowEvaluationField.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsField(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xD8) {
    goto LABEL_17;
  }
  if (a2 + 40 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 40) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 40;
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
      return (*a1 | (v4 << 8)) - 40;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 40;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x29;
  int v8 = v6 - 41;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggesterMetricsField(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 40 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 40) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD7)
  {
    unsigned int v6 = ((a2 - 216) >> 8) + 1;
    *unint64_t result = a2 + 40;
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
        JUMPOUT(0x25B3BE45CLL);
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
          *unint64_t result = a2 + 40;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsField()
{
  return &type metadata for PeopleSuggesterMetricsField;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterShadowEvaluationField(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggesterShadowEvaluationField(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *unint64_t result = a2 + 17;
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
        JUMPOUT(0x25B3BE5F0);
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
          *unint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterShadowEvaluationField()
{
  return &type metadata for PeopleSuggesterShadowEvaluationField;
}

unsigned char *storeEnumTagSinglePayload for UsageFrequency(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x25B3BE6F4);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageFrequency()
{
  return &type metadata for UsageFrequency;
}

unint64_t sub_25B3BE72C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25B3BE8D0(*a1);
  *a2 = result;
  return result;
}

void sub_25B3BE758(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25B3BE764()
{
  return sub_25B3DCE58();
}

unint64_t sub_25B3BE7B8()
{
  unint64_t result = qword_26A4FB748;
  if (!qword_26A4FB748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB748);
  }
  return result;
}

unint64_t sub_25B3BE80C(uint64_t a1)
{
  unint64_t result = sub_25B3BE834();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25B3BE834()
{
  unint64_t result = qword_26A4FB750;
  if (!qword_26A4FB750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB750);
  }
  return result;
}

void sub_25B3BE888()
{
  qword_26A4FF4B0 = 0x6C6C617265766FLL;
  *(void *)algn_26A4FF4B8 = 0xE700000000000000;
}

void sub_25B3BE8AC()
{
  qword_26A4FF4C0 = 0x74756F656D6974;
  *(void *)algn_26A4FF4C8 = 0xE700000000000000;
}

unint64_t sub_25B3BE8D0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

unint64_t sub_25B3BE8E0()
{
  unint64_t result = qword_26A4FB758;
  if (!qword_26A4FB758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB758);
  }
  return result;
}

uint64_t sub_25B3BE93C(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v6) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v2 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v2 + 8 * v8);
        if (!v16)
        {
          int64_t v8 = v15 + 3;
          if (v15 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v2 + 8 * v8);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    double v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25B3C297C(v12, v13, v14);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v6) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v2 + 8 * v17);
  if (v16)
  {
    int64_t v8 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v2 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_25B3BEAC8(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v6) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v13);
    ++v7;
    if (!v14)
    {
      int64_t v7 = v13 + 1;
      if (v13 + 1 >= v6) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v2 + 8 * v7);
      if (!v14)
      {
        int64_t v7 = v13 + 2;
        if (v13 + 2 >= v6) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v2 + 8 * v7);
        if (!v14)
        {
          int64_t v7 = v13 + 3;
          if (v13 + 3 >= v6) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v2 + 8 * v7);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v7 << 6);
LABEL_5:
    uint64_t v10 = 8 * v9;
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + v10);
    id v12 = *(id *)(*(void *)(a1 + 48) + v10);
    swift_bridgeObjectRetain();
    sub_25B3C1748(v12, v11);
    swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 >= v6)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v14 = *(void *)(v2 + 8 * v15);
  if (v14)
  {
    int64_t v7 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v6) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(uint64_t a1)
{
  uint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 0:
      return 0x6C6C69666B636162;
    case 1:
      return 0x4C4D65726F63;
    case 2:
    case 7:
    case 12:
    case 20:
      return result;
    case 3:
      return 0xD000000000000019;
    case 4:
      return 0xD000000000000014;
    case 5:
      return 0xD000000000000010;
    case 6:
      return 5131883;
    case 8:
      return 0xD000000000000021;
    case 9:
      uint64_t v3 = 0x6C6C414E4E6BLL;
      goto LABEL_9;
    case 10:
      return 0xD000000000000018;
    case 11:
      return 0x7265746E494E4E6BLL;
    case 13:
      return 0xD000000000000021;
    case 14:
      uint64_t v3 = 0x706F544E4E6BLL;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6853000000000000;
      break;
    case 15:
      uint64_t result = 0xD000000000000018;
      break;
    case 16:
      uint64_t result = 0x646F4D6C61636F6CLL;
      break;
    case 17:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 18:
      uint64_t result = 0xD000000000000014;
      break;
    case 19:
      uint64_t result = 0xD00000000000001CLL;
      break;
    case 21:
      uint64_t result = 0xD000000000000017;
      break;
    case 22:
      uint64_t result = 0x6F546E7275746572;
      break;
    case 23:
      uint64_t result = 0x696E694D656C7572;
      break;
    case 24:
      uint64_t result = 0xD000000000000011;
      break;
    case 25:
      uint64_t result = 0xD000000000000014;
      break;
    default:
      sub_25B3DD358();
      __break(1u);
      JUMPOUT(0x25B3BEEC4);
  }
  return result;
}

uint64_t sub_25B3BEF30()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  unint64_t v35 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25B3DD0C8();
    if (!v2) {
      goto LABEL_19;
    }
    uint64_t v3 = v2;
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_25B3DD1E8();
    uint64_t v37 = sub_25B3DD068();
    uint64_t v38 = v4;
    char v39 = 1;
    if ((v3 & 0x8000000000000000) == 0) {
      goto LABEL_7;
    }
    __break(1u);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v28 = sub_25B3C4C24(*(void *)(v33 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType));
    id v29 = objc_allocWithZone(MEMORY[0x263F2A280]);
    unint64_t v30 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    sub_25B3BD648(0, &qword_26B346848);
    uint64_t v31 = (void *)sub_25B3DCE78();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v29, sel_initWithIdentifier_sourceBundleId_peopleSuggestions_responseType_, v30, 0, v31, v28);

    return (uint64_t)v32;
  }
  uint64_t v40 = MEMORY[0x263F8EE78];
  sub_25B3DD1E8();
  uint64_t v37 = sub_25B3C7400(v1);
  uint64_t v38 = v6;
  char v39 = v7 & 1;
LABEL_7:
  uint64_t v34 = v1;
  while (1)
  {
    sub_25B3C7194(v37, v38, v39, v1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
    int64_t v17 = v16;
    if (v16[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score + 8])
    {
      unint64_t v18 = 0;
    }
    else
    {
      sub_25B3BD648(0, &qword_26A4FB6F0);
      unint64_t v18 = (void *)sub_25B3DCFA8();
    }
    swift_bridgeObjectRetain();
    uint64_t result = (uint64_t)sub_25B3C49AC();
    unsigned int v20 = v17[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] + 1;
    if ((v20 >> 8)) {
      break;
    }
    uint64_t v21 = (void *)result;
    id v22 = objc_allocWithZone(NSNumber);
    swift_bridgeObjectRetain();
    id v23 = objc_msgSend(v22, sel_initWithUnsignedChar_, v20);
    id v24 = objc_allocWithZone(MEMORY[0x263F2A288]);
    unint64_t v25 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    uint64_t v26 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_initWithIdentifier_model_modelIdentifier_transportBundleId_rank_score_, v25, 0, v21, v26, v23, v18);

    sub_25B3DD1C8();
    sub_25B3DD1F8();
    sub_25B3DD208();
    uint64_t result = sub_25B3DD1D8();
    if (v35)
    {
      uint64_t v1 = v34;
      if ((v39 & 1) == 0) {
        goto LABEL_22;
      }
      if (sub_25B3DD088()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB920);
      id v27 = (void (*)(char *, void))sub_25B3DCF38();
      sub_25B3DD118();
      v27(v36, 0);
      if (!--v3)
      {
LABEL_18:
        sub_25B3CB264(v37, v38, v39);
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v8 = v37;
      uint64_t v9 = v38;
      char v10 = v39;
      uint64_t v1 = v34;
      int64_t v11 = sub_25B3C707C(v37, v38, v39, v34);
      uint64_t v13 = v12;
      char v15 = v14;
      sub_25B3CB264(v8, v9, v10);
      uint64_t v37 = v11;
      uint64_t v38 = v13;
      char v39 = v15 & 1;
      if (!--v3) {
        goto LABEL_18;
      }
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

void sub_25B3BF3B0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  unint64_t v29 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25B3DD0C8();
    if (!v2) {
      goto LABEL_17;
    }
    uint64_t v3 = v2;
    uint64_t v35 = MEMORY[0x263F8EE78];
    sub_25B3DD1E8();
    uint64_t v32 = sub_25B3DD068();
    uint64_t v33 = v4;
    char v34 = 1;
    if ((v3 & 0x8000000000000000) == 0) {
      goto LABEL_7;
    }
    __break(1u);
  }
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    id v25 = objc_allocWithZone(MEMORY[0x263F2A270]);
    uint64_t v26 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    sub_25B3BD648(0, (unint64_t *)&qword_26B346798);
    id v27 = (void *)sub_25B3DCE78();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_initWithIdentifier_sourceBundleId_appSuggestions_, v26, 0, v27);

    return;
  }
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_25B3DD1E8();
  uint64_t v32 = sub_25B3C7400(v1);
  uint64_t v33 = v6;
  char v34 = v7 & 1;
LABEL_7:
  uint64_t v28 = v1;
  while (v3)
  {
    int64_t v14 = v32;
    uint64_t v13 = v33;
    char v15 = v34;
    sub_25B3C7194(v32, v33, v34, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
    unsigned int v17 = v16[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] + 1;
    if ((v17 >> 8)) {
      goto LABEL_20;
    }
    unint64_t v18 = v16;
    uint64_t v30 = v3;
    id v19 = objc_allocWithZone(NSNumber);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v20 = objc_msgSend(v19, sel_initWithUnsignedChar_, v17);
    id v21 = objc_allocWithZone(MEMORY[0x263F2A278]);
    id v22 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    id v23 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_initWithTransportBundleId_model_rank_, v22, v23, v20);

    sub_25B3DD1C8();
    sub_25B3DD1F8();
    sub_25B3DD208();
    sub_25B3DD1D8();
    if (v29)
    {
      uint64_t v1 = v28;
      if ((v15 & 1) == 0) {
        goto LABEL_21;
      }
      if (sub_25B3DD088()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346790);
      id v24 = (void (*)(char *, void))sub_25B3DCF38();
      sub_25B3DD118();
      v24(v31, 0);
      --v3;
      if (v30 == 1)
      {
LABEL_16:
        sub_25B3CB264(v32, v33, v34);
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v1 = v28;
      int64_t v8 = sub_25B3C707C(v14, v13, v15, v28);
      uint64_t v10 = v9;
      char v12 = v11;
      sub_25B3CB264(v14, v13, v15);
      uint64_t v32 = v8;
      uint64_t v33 = v10;
      char v34 = v12 & 1;
      uint64_t v3 = v30 - 1;
      if (v30 == 1) {
        goto LABEL_16;
      }
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
}

id sub_25B3BF7DC()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
  if (v1 >= 7) {
    goto LABEL_15;
  }
  unsigned int v25 = dword_25B3DFB70[v1];
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
  id v4 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = objc_msgSend(v4, sel_initWithUnsignedChar_, v3);
  id v23 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedChar_, *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount));
  id v22 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent));
  id v5 = objc_allocWithZone(MEMORY[0x263F2A268]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  char v7 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  int64_t v8 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v5, sel_initWithTrialExperimentId_trialTreatmentId_trialDeploymentId_, v6, v7, v8);

  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_25B3DD1E8();
    uint64_t v12 = 0;
    do
    {
      uint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
      if (v14)
      {
        if (v14 != 1)
        {
          while (1)
          {
            sub_25B3DD358();
            __break(1u);
LABEL_15:
            swift_bridgeObjectRetain();
          }
        }
        uint64_t v13 = 2;
      }
      else
      {
        uint64_t v13 = 1;
      }
      ++v12;
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A260]), sel_initWithOccurrence_, v13);
      sub_25B3DD1C8();
      sub_25B3DD1F8();
      sub_25B3DD208();
      sub_25B3DD1D8();
    }
    while (v11 != v12);
    swift_bridgeObjectRelease();
  }
  char v15 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  if (v2)
  {
    unint64_t v16 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = 0;
  }
  id v17 = objc_allocWithZone(MEMORY[0x263F2A250]);
  sub_25B3BD648(0, &qword_26B346810);
  unint64_t v18 = (void *)sub_25B3DCE78();
  swift_bridgeObjectRelease();
  LODWORD(v21) = 0;
  id v19 = objc_msgSend(v17, sel_initWithIdentifier_engagementType_engagementIdentifier_visiblePeopleSuggestionCount_visibleAppSuggestionCount_airdropPeopleSuggestionShown_inferenceSource_trialIdentifier_timeouts_, v15, v25, v16, v24, v23, v22, v21, v9, v18);

  return v19;
}

id PeopleSuggesterMetricsManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeopleSuggesterMetricsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PeopleSuggesterMetricsManager.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggesterMetricsManager);
}

void sub_25B3BFC84(void **a1)
{
}

void sub_25B3BFC8C()
{
}

uint64_t PeopleSuggestionInference.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  swift_bridgeObjectRetain();
  return v1;
}

id PeopleSuggestionInference.__allocating_init(id:)(uint64_t a1, uint64_t a2)
{
  id v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id PeopleSuggestionInference.init(id:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v5, sel_init);
}

void PeopleSuggestionInference.init()()
{
}

id PeopleSuggestionInference.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggestionInference);
}

uint64_t sub_25B3BFE00@<X0>(void *a1@<X8>)
{
  return sub_25B3C3FF0(&OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id, a1);
}

id PeopleSuggestions.__allocating_init(id:responseType:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (char *)objc_allocWithZone(v4);
  sub_25B3C89CC(a4);
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = a3;
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = a4;

  uint64_t v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v12, sel_init);
}

id PeopleSuggestions.init(id:responseType:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = v4;
  sub_25B3C89CC(a4);
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = a3;
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = a4;

  uint64_t v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t PeopleSuggestions.ResponseType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_25B3C0054@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_25B3C0070()
{
  return sub_25B3DCE58();
}

uint64_t PeopleSuggestions.PeopleSuggestion.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id);
  swift_bridgeObjectRetain();
  return v1;
}

id PeopleSuggestions.PeopleSuggestion.model.getter()
{
  return *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
}

uint64_t PeopleSuggestions.PeopleSuggestion.transportBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggestions.PeopleSuggestion.rank.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank);
}

uint64_t PeopleSuggestions.PeopleSuggestion.score.getter()
{
  return *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score);
}

unint64_t PeopleSuggestions.PeopleSuggestion.ModelType.init(rawValue:)(unint64_t a1)
{
  return sub_25B3CA500(a1);
}

BOOL sub_25B3C01AC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25B3C01C0()
{
  return sub_25B3DD3D8();
}

unint64_t sub_25B3C01EC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25B3CA500(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25B3C0220(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25B3C022C()
{
  return sub_25B3DCE58();
}

id PeopleSuggestions.PeopleSuggestion.Model.__allocating_init(modelType:trialIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  uint64_t v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  char v7 = (char *)objc_allocWithZone(v6);
  objc_super v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)objc_super v8 = a1;
  v8[8] = 0;
  id v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v12.receiver = v7;
  v12.super_class = v6;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

id PeopleSuggestions.PeopleSuggestion.Model.init(modelType:trialIdentifier:)(uint64_t a1, uint64_t a2)
{
  char v4 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  id v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = &v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)uint64_t v6 = a1;
  v6[8] = 0;
  char v7 = &v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(void *)char v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v10.receiver = v5;
  v10.super_class = v4;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

id PeopleSuggestions.PeopleSuggestion.Model.__allocating_init(modelIdentifier:trialIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  id v9 = (char *)objc_allocWithZone(v8);
  objc_super v10 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)objc_super v10 = 0;
  v10[8] = 1;
  uint64_t v11 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(void *)uint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a3;
  v14.receiver = v9;
  v14.super_class = v8;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

id PeopleSuggestions.PeopleSuggestion.Model.init(modelIdentifier:trialIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  id v7 = (char *)objc_allocWithZone(v6);
  id v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)id v8 = 0;
  v8[8] = 1;
  id v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(void *)id v9 = a1;
  *((void *)v9 + 1) = a2;
  *(void *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a3;
  v12.receiver = v7;
  v12.super_class = v6;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

uint64_t sub_25B3C0708()
{
  sub_25B3DD418();
  if (*(unsigned char *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) == 1)
  {
    sub_25B3DD3E8();
  }
  else
  {
    sub_25B3DD3E8();
    sub_25B3DD3D8();
  }
  if (*(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
  {
    sub_25B3DD3E8();
    swift_bridgeObjectRetain();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25B3DD3E8();
  }
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  sub_25B3DD3E8();
  if (v1)
  {
    id v2 = v1;
    sub_25B3DCFF8();
  }
  return sub_25B3DD3F8();
}

uint64_t sub_25B3C0840(uint64_t a1)
{
  sub_25B3CA534(a1, (uint64_t)v14);
  if (!v15)
  {
    sub_25B3CA59C((uint64_t)v14);
    goto LABEL_22;
  }
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    char v10 = 0;
    return v10 & 1;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8))
  {
    if ((v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8] & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if ((v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8] & 1) != 0 {
         || *(void *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType) != *(void *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType])
  }
  {
    goto LABEL_21;
  }
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
  uint64_t v3 = *(void *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8];
  if (v2)
  {
    if (!v3) {
      goto LABEL_21;
    }
    BOOL v4 = *(void *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier) == *(void *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier]
      && v2 == v3;
    if (!v4 && (sub_25B3DD328() & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (v3)
  {
LABEL_21:

    goto LABEL_22;
  }
  id v5 = *(void **)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  uint64_t v6 = *(void **)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier];
  if (!v5)
  {
    id v12 = v6;

    if (!v6)
    {
      char v10 = 1;
      return v10 & 1;
    }

    goto LABEL_22;
  }
  if (!v6) {
    goto LABEL_21;
  }
  type metadata accessor for TrialIdentifier();
  id v7 = v5;
  id v8 = v6;
  id v9 = v7;
  char v10 = sub_25B3DCFE8();

  return v10 & 1;
}

void PeopleSuggestions.PeopleSuggestion.Model.init()()
{
}

uint64_t sub_25B3C0A38(char a1)
{
  if (!a1) {
    return 0x7079546C65646F6DLL;
  }
  if (a1 == 1) {
    return 0xD000000000000018;
  }
  return 0x6564496C61697274;
}

uint64_t sub_25B3C0AAC()
{
  return sub_25B3C0A38(*v0);
}

uint64_t sub_25B3C0AB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CAA44(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B3C0ADC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25B3C0AE8(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA620();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C0B24(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA620();
  return MEMORY[0x270FA00B8](a1, v2);
}

id PeopleSuggestions.PeopleSuggestion.Model.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);
}

uint64_t sub_25B3C0BC8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB7B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CA620();
  sub_25B3DD428();
  char v9 = *(unsigned char *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8);
  uint64_t v13 = *(void *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType);
  char v14 = v9;
  char v12 = 0;
  sub_25B3CA674();
  sub_25B3DD2B8();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_25B3DD298();
    uint64_t v13 = *(void *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
    char v12 = 2;
    type metadata accessor for TrialIdentifier();
    sub_25B3CCC10(&qword_26A4FB7D0, (void (*)(void))type metadata accessor for TrialIdentifier);
    sub_25B3DD2B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3C0DDC(void *a1)
{
  return sub_25B3C0BC8(a1);
}

id PeopleSuggestions.PeopleSuggestion.__allocating_init(id:model:transportBundleId:rank:score:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, double a7)
{
  id v15 = objc_allocWithZone(v7);
  return PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(a1, a2, a3, a4, a5, a6, a7);
}

id PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, double a7)
{
  BOOL v13 = (~*(void *)&a7 & 0x7FF0000000000000) == 0;
  BOOL v14 = (*(void *)&a7 & 0xFFFFFFFFFFFFFLL) != 0;
  BOOL v15 = v13 && v14;
  if (v13 && v14) {
    double v16 = 0.0;
  }
  else {
    double v16 = a7;
  }
  id v17 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  unint64_t v18 = objc_allocWithZone(v17);
  id v19 = &v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id];
  *id v19 = a1;
  v19[1] = a2;
  *(void *)&v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model] = a3;
  id v20 = &v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId];
  *id v20 = a4;
  v20[1] = a5;
  v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] = a6;
  uint64_t v21 = (double *)&v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score];
  *uint64_t v21 = v16;
  *((unsigned char *)v21 + 8) = v15;
  v24.receiver = v18;
  v24.super_class = v17;
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

uint64_t sub_25B3C10F0(uint64_t a1)
{
  sub_25B3CA534(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_25B3CA59C((uint64_t)v7);
    goto LABEL_10;
  }
  type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    char v4 = 0;
    return v4 & 1;
  }
  BOOL v2 = *(void *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id) == *(void *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id]
    && *(void *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8) == *(void *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8];
  if (!v2 && (sub_25B3DD328() & 1) == 0)
  {

    goto LABEL_10;
  }
  sub_25B3BD648(0, &qword_26A4FB620);
  id v3 = *(id *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model];
  char v4 = sub_25B3DCFE8();

  return v4 & 1;
}

uint64_t static PeopleSuggestions.PeopleSuggestion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id) == *(void *)(a2
                                                                                             + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id)
    && *(void *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8) == *(void *)(a2
                                                                                                 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id
                                                                                                 + 8);
  if (!v2 && (sub_25B3DD328() & 1) == 0) {
    return 0;
  }
  sub_25B3BD648(0, &qword_26A4FB620);
  return sub_25B3DCFE8() & 1;
}

void PeopleSuggestions.PeopleSuggestion.init()()
{
}

unint64_t sub_25B3C1300(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C65646F6DLL;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 1802396018;
      break;
    case 4:
      unint64_t result = 0x65726F6373;
      break;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

unint64_t sub_25B3C1398()
{
  return sub_25B3C1300(*v0);
}

uint64_t sub_25B3C13A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CABAC(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B3C13C8(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_25B3C13D4(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA6EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C1410(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA6EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

id PeopleSuggestions.PeopleSuggestion.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggestions.PeopleSuggestion);
}

uint64_t sub_25B3C14C8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB7D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CA6EC();
  sub_25B3DD428();
  char v12 = 0;
  sub_25B3DD2C8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
    v10[15] = 1;
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_25B3CCC10(&qword_26A4FB7E8, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);
    sub_25B3DD2E8();
    v10[14] = 2;
    sub_25B3DD2C8();
    v10[13] = 3;
    sub_25B3DD2F8();
    v10[12] = 4;
    sub_25B3DD2A8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3C1724(void *a1)
{
  return sub_25B3C14C8(a1);
}

void sub_25B3C1748(void *a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(a2 + 16);
  if (v2)
  {
    uint64_t v3 = a2;
    if (!*(unsigned char *)(a2 + 32)) {
      goto LABEL_8;
    }
    if (qword_26B346880 != -1) {
      goto LABEL_24;
    }
    while (1)
    {
      uint64_t v5 = sub_25B3DCD98();
      __swift_project_value_buffer(v5, (uint64_t)qword_26B346958);
      uint64_t v6 = a1;
      uint64_t v7 = sub_25B3DCD78();
      os_log_type_t v8 = sub_25B3DCF68();
      log = v7;
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        objc_super v24 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 138412546;
        char v10 = v6;
        sub_25B3DD018();
        *objc_super v24 = v6;

        *(_WORD *)(v9 + 12) = 256;
        sub_25B3DD018();
        uint64_t v6 = log;
        _os_log_impl(&dword_25B39F000, log, v8, "Lowest rank for model %@ should be 0, not %hhu", (uint8_t *)v9, 0xFu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
        swift_arrayDestroy();
        MEMORY[0x261163250](v24, -1, -1);
        MEMORY[0x261163250](v9, -1, -1);
      }
      else
      {
      }
LABEL_8:
      uint64_t v2 = ((char *)v2 - 1);
      if (!v2) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v11 = 0;
      os_log_t loga = v2;
      uint64_t v27 = v3;
      while (v2 != v11)
      {
        uint64_t v13 = (uint64_t)v11 + v3;
        int v14 = *((unsigned __int8 *)&v11[4].isa + v3 + 1);
        if (((v14 - *((unsigned __int8 *)&v11[4].isa + v3)) & 0xFFFFFF00) != 0) {
          goto LABEL_23;
        }
        BOOL v15 = ((char *)&v11->isa + 1);
        if ((v14 - *((unsigned char *)&v11[4].isa + v3)) != 1)
        {
          if (qword_26B346880 != -1) {
            swift_once();
          }
          uint64_t v16 = sub_25B3DCD98();
          __swift_project_value_buffer(v16, (uint64_t)qword_26B346958);
          id v17 = a1;
          unint64_t v18 = a1;
          swift_bridgeObjectRetain();
          char v12 = sub_25B3DCD78();
          os_log_type_t v19 = sub_25B3DCF68();
          if (os_log_type_enabled(v12, v19))
          {
            uint64_t v20 = swift_slowAlloc();
            uint64_t v21 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v20 = 138413314;
            *(void *)(v20 + 4) = v18;
            *uint64_t v21 = v17;
            *(_WORD *)(v20 + 12) = 2048;
            *(void *)(v20 + 14) = v11;
            *(_WORD *)(v20 + 22) = 256;
            *(unsigned char *)(v20 + 24) = *(unsigned char *)(v13 + 32);
            swift_bridgeObjectRelease();
            *(_WORD *)(v20 + 25) = 2048;
            *(void *)(v20 + 27) = v15;
            *(_WORD *)(v20 + 35) = 256;
            *(unsigned char *)(v20 + 37) = v14;
            _os_log_impl(&dword_25B39F000, v12, v19, "Unexpected jump in ranks for model %@; rank[%ld]: %hhu, rank[%ld]: %hhu",
              (uint8_t *)v20,
              0x26u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
            swift_arrayDestroy();
            id v22 = v21;
            uint64_t v2 = loga;
            MEMORY[0x261163250](v22, -1, -1);
            uint64_t v23 = v20;
            uint64_t v3 = v27;
            MEMORY[0x261163250](v23, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease();
            char v12 = v18;
          }
          a1 = v17;
        }
        uint64_t v11 = ((char *)v11 + 1);
        if (v2 == v15)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_once();
    }
  }
}

void PeopleSuggestions.__allocating_init(id:)()
{
}

void PeopleSuggestions.init(id:)()
{
}

uint64_t sub_25B3C1B60(char a1)
{
  if (a1) {
    return 0x6974736567677573;
  }
  else {
    return 0x65736E6F70736572;
  }
}

uint64_t sub_25B3C1BA8()
{
  return sub_25B3C1B60(*v0);
}

uint64_t sub_25B3C1BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CAD74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3C1BD8(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA764();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C1C14(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA764();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3C1C50()
{
  return swift_bridgeObjectRelease();
}

id PeopleSuggestions.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggestions);
}

uint64_t sub_25B3C1C88(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB7F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CA764();
  sub_25B3DD428();
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType);
  HIBYTE(v10) = 0;
  sub_25B3CA7B8();
  sub_25B3DD2E8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB808);
    sub_25B3CA80C();
    sub_25B3DD2E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3C1E34(void *a1)
{
  return sub_25B3C1C88(a1);
}

uint64_t AppSuggestions.suggestions.getter()
{
  return swift_bridgeObjectRetain();
}

id AppSuggestions.__allocating_init(id:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  sub_25B3C7488(a3);
  *(void *)&v7[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = a3;

  os_log_type_t v8 = &v7[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)os_log_type_t v8 = a1;
  *((void *)v8 + 1) = a2;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v10, sel_init);
}

id AppSuggestions.init(id:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3;
  sub_25B3C7488(a3);
  *(void *)&v7[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = a3;

  os_log_type_t v8 = &v7[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(void *)os_log_type_t v8 = a1;
  *((void *)v8 + 1) = a2;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t AppSuggestions.AppSuggestion.transportBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSuggestions.AppSuggestion.model.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSuggestions.AppSuggestion.rank.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank);
}

id AppSuggestions.AppSuggestion.__allocating_init(transportBundleId:model:rank:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v11 = objc_allocWithZone(v5);
  char v12 = &v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
  *char v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
  *uint64_t v13 = a3;
  v13[1] = a4;
  v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id AppSuggestions.AppSuggestion.init(transportBundleId:model:rank:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = &v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
  *uint64_t v6 = a1;
  v6[1] = a2;
  uint64_t v7 = &v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
  *uint64_t v7 = a3;
  v7[1] = a4;
  v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for AppSuggestions.AppSuggestion();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t sub_25B3C2408(uint64_t a1)
{
  sub_25B3CA534(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_25B3CA59C((uint64_t)v7);
    goto LABEL_14;
  }
  type metadata accessor for AppSuggestions.AppSuggestion();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    char v4 = 0;
    return v4 & 1;
  }
  BOOL v2 = *(void *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId) == *(void *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId]
    && *(void *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8) == *(void *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8];
  if (!v2 && (sub_25B3DD328() & 1) == 0)
  {

    goto LABEL_14;
  }
  if (*(void *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model) == *(void *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_model]
    && *(void *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8) == *(void *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_model
                                                                                            + 8])
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_25B3DD328();
  }
  return v4 & 1;
}

uint64_t static AppSuggestions.AppSuggestion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId) == *(void *)(a2
                                                                                                 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId)
    && *(void *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8) == *(void *)(a2 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8);
  if (v4 || (v5 = sub_25B3DD328(), uint64_t result = 0, (v5 & 1) != 0))
  {
    if (*(void *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model) == *(void *)(a2
                                                                                       + OBJC_IVAR____PSAppSuggestionsMetricsItem_model)
      && *(void *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8) == *(void *)(a2
                                                                                           + OBJC_IVAR____PSAppSuggestionsMetricsItem_model
                                                                                           + 8))
    {
      return 1;
    }
    else
    {
      return sub_25B3DD328();
    }
  }
  return result;
}

id AppSuggestions.AppSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AppSuggestions.AppSuggestion.init()()
{
}

uint64_t sub_25B3C264C(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x6C65646F6DLL;
  }
  return 1802396018;
}

uint64_t sub_25B3C269C()
{
  return sub_25B3C264C(*v0);
}

uint64_t sub_25B3C26A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CAE80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3C26CC(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA8D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C2708(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA8D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

id AppSuggestions.AppSuggestion.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for AppSuggestions.AppSuggestion);
}

uint64_t sub_25B3C27B0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB840);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CA8D4();
  sub_25B3DD428();
  v8[15] = 0;
  sub_25B3DD2C8();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B3DD2C8();
    v8[13] = 2;
    sub_25B3DD2F8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25B3C2958(void *a1)
{
  return sub_25B3C27B0(a1);
}

void sub_25B3C297C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    uint64_t v4 = a3;
    unint64_t v6 = 0x26B346000uLL;
    if (!*(unsigned char *)(a3 + 32)) {
      goto LABEL_6;
    }
    if (qword_26B346880 != -1) {
      goto LABEL_23;
    }
    while (1)
    {
      uint64_t v7 = sub_25B3DCD98();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B346958);
      swift_bridgeObjectRetain_n();
      uint64_t v8 = sub_25B3DCD78();
      os_log_type_t v9 = sub_25B3DCF68();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v29 = v11;
        *(_DWORD *)uint64_t v10 = 136315394;
        swift_bridgeObjectRetain();
        sub_25B3B1CCC(a1, a2, &v29);
        sub_25B3DD018();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v10 + 12) = 256;
        sub_25B3DD018();
        _os_log_impl(&dword_25B39F000, v8, v9, "Lowest rank for model %s should be 0, not %hhu", (uint8_t *)v10, 0xFu);
        swift_arrayDestroy();
        uint64_t v12 = v11;
        unint64_t v6 = 0x26B346000;
        MEMORY[0x261163250](v12, -1, -1);
        MEMORY[0x261163250](v10, -1, -1);

LABEL_6:
        uint64_t v13 = v3 - 1;
        if (v3 == 1) {
          return;
        }
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v13 = v3 - 1;
        if (v3 == 1) {
          return;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v3 = 0;
      uint64_t v27 = v13;
      while (v13 != v3)
      {
        uint64_t v14 = v4 + v3;
        int v15 = *(unsigned __int8 *)(v4 + v3 + 33);
        if (((v15 - *(unsigned __int8 *)(v4 + v3 + 32)) & 0xFFFFFF00) != 0) {
          goto LABEL_22;
        }
        uint64_t v16 = v3 + 1;
        if ((v15 - *(unsigned char *)(v4 + v3 + 32)) != 1)
        {
          if (*(void *)(v6 + 2176) != -1) {
            swift_once();
          }
          uint64_t v17 = sub_25B3DCD98();
          __swift_project_value_buffer(v17, (uint64_t)qword_26B346958);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          unint64_t v18 = sub_25B3DCD78();
          os_log_type_t v19 = sub_25B3DCF68();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = v4;
            unint64_t v21 = a2;
            uint64_t v22 = swift_slowAlloc();
            uint64_t v23 = swift_slowAlloc();
            uint64_t v29 = v23;
            *(_DWORD *)uint64_t v22 = 136316162;
            swift_bridgeObjectRetain();
            *(void *)(v22 + 4) = sub_25B3B1CCC(a1, v21, &v29);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v22 + 12) = 2048;
            *(void *)(v22 + 14) = v3;
            *(_WORD *)(v22 + 22) = 256;
            char v24 = *(unsigned char *)(v14 + 32);
            swift_bridgeObjectRelease();
            *(unsigned char *)(v22 + 24) = v24;
            swift_bridgeObjectRelease();
            *(_WORD *)(v22 + 25) = 2048;
            *(void *)(v22 + 27) = v16;
            *(_WORD *)(v22 + 35) = 256;
            *(unsigned char *)(v22 + 37) = v15;
            _os_log_impl(&dword_25B39F000, v18, v19, "Unexpected jump in ranks for model %s; rank[%ld]: %hhu, rank[%ld]: %hhu",
              (uint8_t *)v22,
              0x26u);
            swift_arrayDestroy();
            uint64_t v25 = v23;
            uint64_t v13 = v27;
            MEMORY[0x261163250](v25, -1, -1);
            uint64_t v26 = v22;
            a2 = v21;
            uint64_t v4 = v20;
            unint64_t v6 = 0x26B346000;
            MEMORY[0x261163250](v26, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }
        }
        ++v3;
        if (v13 == v16)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      swift_once();
    }
  }
}

void AppSuggestions.__allocating_init(id:)()
{
}

void AppSuggestions.init(id:)()
{
}

void sub_25B3C2DD4()
{
}

uint64_t sub_25B3C2E00()
{
  return 1;
}

uint64_t sub_25B3C2E08()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3C2E4C()
{
  return sub_25B3DD3D8();
}

uint64_t sub_25B3C2E74()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3C2EB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CAFB4(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_25B3C2EE4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25B3C2EF0(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA94C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C2F2C(uint64_t a1)
{
  unint64_t v2 = sub_25B3CA94C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B3C2F68()
{
  return swift_bridgeObjectRelease();
}

id AppSuggestions.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for AppSuggestions);
}

uint64_t sub_25B3C2FA0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB850);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CA94C();
  sub_25B3DD428();
  v9[1] = *(void *)(v2 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB860);
  sub_25B3CA9A0();
  sub_25B3DD2E8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_25B3C30FC(void *a1)
{
  return sub_25B3C2FA0(a1);
}

uint64_t PeopleSuggesterFeedbackEvent.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.type.getter()
{
  return *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
}

uint64_t PeopleSuggesterFeedbackEvent.engagedSuggestionId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.airdropOptionPresent.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent);
}

uint64_t PeopleSuggesterFeedbackEvent.visiblePeopleSuggestionCount.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
}

uint64_t PeopleSuggesterFeedbackEvent.visibleAppSuggestionCount.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount);
}

uint64_t PeopleSuggesterFeedbackEvent.trialExperimentId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialExperimentId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.trialTreatmentId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialTreatmentId);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_25B3C3330()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PeopleSuggesterFeedbackEvent.trialDeploymentId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialDeploymentId);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t PeopleSuggesterFeedbackEvent.EngagementType.init(rawValue:)(unint64_t a1)
{
  return sub_25B3CB06C(a1);
}

unint64_t sub_25B3C33E8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25B3CB06C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25B3C341C()
{
  return sub_25B3DCE58();
}

BOOL PeopleSuggesterFeedbackEvent.Timeout.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_25B3C3490()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3C34D8()
{
  return sub_25B3DD408();
}

void *sub_25B3C351C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25B3C354C()
{
  return sub_25B3DCE58();
}

id sub_25B3C359C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_id];
  *uint64_t v16 = a1;
  v16[1] = a2;
  *(void *)&v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_type] = a3;
  uint64_t v17 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId];
  *uint64_t v17 = a4;
  v17[1] = a5;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent] = a6;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount] = a7;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount] = a8;
  unint64_t v18 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialExperimentId];
  void *v18 = a9;
  v18[1] = a10;
  os_log_type_t v19 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialTreatmentId];
  *os_log_type_t v19 = a11;
  v19[1] = a12;
  uint64_t v20 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialDeploymentId];
  *uint64_t v20 = a13;
  v20[1] = a14;
  *(void *)&v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts] = a15;
  v22.receiver = v15;
  v22.super_class = (Class)type metadata accessor for PeopleSuggesterFeedbackEvent();
  return objc_msgSendSuper2(&v22, sel_init);
}

id PeopleSuggesterFeedbackEvent.__allocating_init(id:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, long long a9, long long a10, uint64_t a11, uint64_t a12, char a13)
{
  id v19 = objc_allocWithZone(v13);
  if (a13) {
    uint64_t v20 = &unk_2708ED230;
  }
  else {
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
  }
  id v21 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  id v22 = sub_25B3C359C(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, a12, (uint64_t)v20);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

id PeopleSuggesterFeedbackEvent.init(id:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a15) {
    id v21 = &unk_2708ED258;
  }
  else {
    id v21 = (void *)MEMORY[0x263F8EE78];
  }
  id v22 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  id v23 = sub_25B3C359C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (uint64_t)v21);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v23;
}

void PeopleSuggesterFeedbackEvent.init()()
{
}

unint64_t sub_25B3C3A04(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701869940;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0x7374756F656D6974;
      break;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

unint64_t sub_25B3C3B14()
{
  return sub_25B3C3A04(*v0);
}

uint64_t sub_25B3C3B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CC724(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B3C3B44(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_25B3C3B50(uint64_t a1)
{
  unint64_t v2 = sub_25B3CB0A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C3B8C(uint64_t a1)
{
  unint64_t v2 = sub_25B3CB0A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

id PeopleSuggesterFeedbackEvent.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for PeopleSuggesterFeedbackEvent);
}

uint64_t sub_25B3C3C80(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB8C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CB0A0();
  sub_25B3DD428();
  LOBYTE(v11) = 0;
  sub_25B3DD2C8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
    HIBYTE(v10) = 1;
    sub_25B3CB0F4();
    sub_25B3DD2E8();
    LOBYTE(v11) = 2;
    sub_25B3DD298();
    LOBYTE(v11) = 3;
    sub_25B3DD2D8();
    LOBYTE(v11) = 4;
    sub_25B3DD2F8();
    LOBYTE(v11) = 5;
    sub_25B3DD2F8();
    LOBYTE(v11) = 6;
    sub_25B3DD2C8();
    LOBYTE(v11) = 7;
    sub_25B3DD2C8();
    LOBYTE(v11) = 8;
    sub_25B3DD2C8();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts);
    HIBYTE(v10) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB8E0);
    sub_25B3CB148();
    sub_25B3DD2E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3C3FC0(void *a1)
{
  return sub_25B3C3C80(a1);
}

uint64_t sub_25B3C3FE4@<X0>(void *a1@<X8>)
{
  return sub_25B3C3FF0(&OBJC_IVAR____PSFeedbackMetricsEventInternal_id, a1);
}

uint64_t sub_25B3C3FF0@<X0>(void *a1@<X2>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*v2 + *a1);
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id TrialIdentifier.__allocating_init(experiment:treatment:deployment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  int v15 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  *(void *)int v15 = a3;
  *((void *)v15 + 1) = a4;
  uint64_t v16 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *(void *)uint64_t v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id TrialIdentifier.init(experiment:treatment:deployment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  uint64_t v8 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  *(void *)uint64_t v8 = a3;
  *((void *)v8 + 1) = a4;
  os_log_type_t v9 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *(void *)os_log_type_t v9 = a5;
  *((void *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for TrialIdentifier();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_25B3C41F0()
{
  return sub_25B3DD3F8();
}

uint64_t sub_25B3C42DC(uint64_t a1)
{
  sub_25B3CA534(a1, (uint64_t)v8);
  if (!v9)
  {
    sub_25B3CA59C((uint64_t)v8);
    goto LABEL_20;
  }
  type metadata accessor for TrialIdentifier();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_20:
    char v5 = 0;
    return v5 & 1;
  }
  BOOL v2 = *(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment]
    && *(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
  if (!v2 && (sub_25B3DD328() & 1) == 0
    || (*(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment]
      ? (BOOL v3 = *(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8])
      : (BOOL v3 = 0),
        !v3 && (sub_25B3DD328() & 1) == 0))
  {

    goto LABEL_20;
  }
  if (*(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment]
    && *(void *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8) == *(void *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8])
  {

    char v5 = 1;
  }
  else
  {
    char v5 = sub_25B3DD328();
  }
  return v5 & 1;
}

uint64_t sub_25B3C4418(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_25B3DD038();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_25B3CA59C((uint64_t)v10);
  return v8 & 1;
}

void TrialIdentifier.init()()
{
}

uint64_t sub_25B3C4500(char a1)
{
  return *(void *)&aExperimetreatm[8 * a1];
}

uint64_t sub_25B3C4520()
{
  return sub_25B3C4500(*v0);
}

uint64_t sub_25B3C4528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B3CCAB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B3C4550(uint64_t a1)
{
  unint64_t v2 = sub_25B3CB210();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3C458C(uint64_t a1)
{
  unint64_t v2 = sub_25B3CB210();
  return MEMORY[0x270FA00B8](a1, v2);
}

id TrialIdentifier.__deallocating_deinit()
{
  return sub_25B3C45E0(type metadata accessor for TrialIdentifier);
}

id sub_25B3C45E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25B3C4680(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB910);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3CB210();
  sub_25B3DD428();
  v8[15] = 0;
  sub_25B3DD2C8();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B3DD2C8();
    v8[13] = 2;
    sub_25B3DD2C8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25B3C482C(void *a1)
{
  return sub_25B3C4680(a1);
}

uint64_t sub_25B3C4850(unint64_t a1)
{
  if (a1 < 0x1A) {
    return dword_25B3DFBC0[a1];
  }
  uint64_t result = sub_25B3DD358();
  __break(1u);
  return result;
}

id sub_25B3C48A4()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F2A598]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  unint64_t v2 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v0, sel_initWithTrialNamespace_task_treatment_deployment_, 0, v1, v2, v3);

  return v4;
}

id sub_25B3C49AC()
{
  uint64_t v1 = v0;
  if (*(unsigned char *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) == 1)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
    BOOL v3 = v2 == 0;
    if (v2) {
      uint64_t v4 = 20;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = sub_25B3C4850(*(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
    if (*(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
    {
      if (qword_26B346880 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_25B3DCD98();
      __swift_project_value_buffer(v5, (uint64_t)qword_26B346958);
      id v6 = sub_25B3DCD78();
      os_log_type_t v7 = sub_25B3DCF78();
      if (os_log_type_enabled(v6, v7))
      {
        char v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v9 = swift_slowAlloc();
        uint64_t v16 = v9;
        *(_DWORD *)char v8 = 136315138;
        type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(0);
        uint64_t v10 = sub_25B3DCDF8();
        sub_25B3B1CCC(v10, v11, &v16);
        sub_25B3DD018();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25B39F000, v6, v7, "incorrect model type with other: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261163250](v9, -1, -1);
        MEMORY[0x261163250](v8, -1, -1);
      }

      BOOL v3 = 0;
      uint64_t v4 = 20;
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  id v12 = *(id *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v12) {
    id v12 = sub_25B3C48A4();
  }
  if (v3)
  {
    uint64_t v13 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
  }
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A290]), sel_initWithModelType_trialIdentifier_otherModelTypeName_, v4, v12, v13);

  return v14;
}

uint64_t sub_25B3C4C24(unint64_t a1)
{
  if (a1 < 3) {
    return (a1 + 1);
  }
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25B3DCD98();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B346958);
  BOOL v3 = sub_25B3DCD78();
  os_log_type_t v4 = sub_25B3DCF68();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25B39F000, v3, v4, "Unhandled response type", v5, 2u);
    MEMORY[0x261163250](v5, -1, -1);
  }

  return 0;
}

uint64_t PeopleSuggestions.description.getter()
{
  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  sub_25B3DD168();
  uint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  unint64_t v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25B3DD0C8();
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_21:
    v29[0] = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346858);
    sub_25B3CB270();
    sub_25B3DCDC8();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    return v34;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_25B3B7C00(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    uint64_t result = sub_25B3DD068();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_25B3C7400(v1);
    char v6 = v8 & 1;
  }
  uint64_t v30 = result;
  uint64_t v31 = v4;
  char v32 = v6;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        int64_t v15 = v30;
        uint64_t v14 = v31;
        char v16 = v32;
        sub_25B3C7194(v30, v31, v32, v1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
        objc_super v18 = v17;
        id v19 = objc_msgSend(v17, sel_description);
        uint64_t v20 = sub_25B3DCDE8();
        uint64_t v22 = v21;

        uint64_t v23 = v33;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_25B3B7C00(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v33;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        unint64_t v24 = *(void *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          uint64_t result = sub_25B3B7C00(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v33;
        }
        *(void *)(v23 + 16) = v25 + 1;
        uint64_t v26 = v23 + 16 * v25;
        *(void *)(v26 + 32) = v20;
        *(void *)(v26 + 40) = v22;
        if (v28) {
          break;
        }
        int64_t v9 = sub_25B3C707C(v15, v14, v16, v1);
        uint64_t v11 = v10;
        char v13 = v12;
        sub_25B3CB264(v15, v14, v16);
        uint64_t v30 = v9;
        uint64_t v31 = v11;
        char v32 = v13 & 1;
        if (!--v2) {
          goto LABEL_20;
        }
      }
      if ((v16 & 1) == 0) {
        goto LABEL_23;
      }
      if (sub_25B3DD088()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB920);
      uint64_t v27 = (void (*)(void *, void))sub_25B3DCF38();
      sub_25B3DD118();
      v27(v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_25B3CB264(v30, v31, v32);
    swift_bridgeObjectRelease();
    uint64_t v7 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t PeopleSuggestions.ResponseType.description.getter(unint64_t a1)
{
  if (a1 > 2) {
    return 0x2053492054414857;
  }
  else {
    return *(void *)&aDefault[8 * a1];
  }
}

uint64_t sub_25B3C51CC()
{
  return PeopleSuggestions.ResponseType.description.getter(*v0);
}

uint64_t PeopleSuggestions.PeopleSuggestion.description.getter()
{
  sub_25B3DD168();
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v1 = *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
  id v2 = objc_msgSend(v1, sel_description);
  sub_25B3DCDE8();

  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  sub_25B3DD318();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB928);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return 0;
}

uint64_t TrialIdentifier.description.getter()
{
  sub_25B3DD168();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "(experiment: ");
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return v1[0];
}

uint64_t PeopleSuggestions.PeopleSuggestion.Model.description.getter()
{
  sub_25B3DD168();
  sub_25B3DCE28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB930);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB478);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v1 = *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB938);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return 0;
}

uint64_t sub_25B3C574C()
{
  return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*v0);
}

uint64_t AppSuggestions.description.getter()
{
  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  sub_25B3DD168();
  swift_bridgeObjectRelease();
  unint64_t v34 = 0xD000000000000014;
  unint64_t v35 = 0x800000025B3E1640;
  swift_bridgeObjectRetain();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  unint64_t v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25B3DD0C8();
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_21:
    v29[0] = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346858);
    sub_25B3CB270();
    sub_25B3DCDC8();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    return v34;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_25B3B7C00(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    uint64_t result = sub_25B3DD068();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_25B3C7400(v1);
    char v6 = v8 & 1;
  }
  uint64_t v30 = result;
  uint64_t v31 = v4;
  char v32 = v6;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        int64_t v15 = v30;
        uint64_t v14 = v31;
        char v16 = v32;
        sub_25B3C7194(v30, v31, v32, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
        objc_super v18 = v17;
        id v19 = objc_msgSend(v17, sel_description);
        uint64_t v20 = sub_25B3DCDE8();
        uint64_t v22 = v21;

        uint64_t v23 = v33;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_25B3B7C00(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v33;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        unint64_t v24 = *(void *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          uint64_t result = sub_25B3B7C00(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v33;
        }
        *(void *)(v23 + 16) = v25 + 1;
        uint64_t v26 = v23 + 16 * v25;
        *(void *)(v26 + 32) = v20;
        *(void *)(v26 + 40) = v22;
        if (v28) {
          break;
        }
        int64_t v9 = sub_25B3C707C(v15, v14, v16, v1);
        uint64_t v11 = v10;
        char v13 = v12;
        sub_25B3CB264(v15, v14, v16);
        uint64_t v30 = v9;
        uint64_t v31 = v11;
        char v32 = v13 & 1;
        if (!--v2) {
          goto LABEL_20;
        }
      }
      if ((v16 & 1) == 0) {
        goto LABEL_23;
      }
      if (sub_25B3DD088()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346790);
      uint64_t v27 = (void (*)(void *, void))sub_25B3DCF38();
      sub_25B3DD118();
      v27(v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_25B3CB264(v30, v31, v32);
    swift_bridgeObjectRelease();
    uint64_t v7 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

unint64_t AppSuggestions.AppSuggestion.description.getter()
{
  return 0xD000000000000014;
}

id sub_25B3C5CB4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t PeopleSuggesterFeedbackEvent.description.getter()
{
  return 0;
}

uint64_t sub_25B3C5FB4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B3C7064(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_25B3C6020(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25B3C6020(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25B3DD308();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        unsigned int v81 = *(unsigned __int8 *)(v79 + i);
        uint64_t v82 = v78;
        do
        {
          unsigned int v83 = *(unsigned __int8 *)(v79 + v82);
          if (v81 >= v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(unsigned char *)(v79 + v82 + 1) = v83;
          *(unsigned char *)(v79 + v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
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
    goto LABEL_146;
  }
  uint64_t v94 = result;
  uint64_t v95 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (unsigned __int8 *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v93 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          uint64_t v86 = v11;
          uint64_t v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_25B3C669C((unsigned __int8 *)(v84 + v88), (unsigned __int8 *)(v84 + *(void *)&v87[16 * v12 - 16]), v84 + v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v86 = sub_25B3C6C04((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          unint64_t v90 = &v86[16 * v85 + 32];
          *(void *)unint64_t v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          uint64_t v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v93 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v93 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25B3DCEC8();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v95;
    uint64_t v93 = v7;
    __dst = (unsigned __int8 *)(v7 + 32);
  }
  uint64_t v9 = 0;
  unint64_t v92 = v2;
  uint64_t v10 = *v2;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v96 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      unsigned int v14 = *(unsigned __int8 *)(v10 + v9);
      unsigned int v15 = *(unsigned __int8 *)(v10 + v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        unsigned int v16 = v14;
        while (1)
        {
          unsigned int v17 = *(unsigned __int8 *)(v10 + v9);
          if (v14 < v15 == v17 >= v16) {
            break;
          }
          ++v9;
          unsigned int v16 = v17;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          uint64_t v18 = v9 - 1;
          uint64_t v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              char v20 = *(unsigned char *)(v10 + v19);
              *(unsigned char *)(v10 + v19) = *(unsigned char *)(v10 + v18);
              *(unsigned char *)(v10 + v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v94) {
      goto LABEL_47;
    }
    uint64_t v21 = v13 + v94;
    if (__OFADD__(v13, v94)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      uint64_t v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      uint64_t v22 = (unsigned char *)(v10 + v9);
      do
      {
        unsigned int v23 = *(unsigned __int8 *)(v10 + v9);
        uint64_t v24 = v13;
        unint64_t v25 = v22;
        do
        {
          unsigned int v26 = *(v25 - 1);
          if (v23 >= v26) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          unsigned char *v25 = v26;
          *--unint64_t v25 = v23;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      uint64_t v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_25B3C68D8(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v96;
    if (v28 >= v27 >> 1)
    {
      unint64_t v77 = sub_25B3C68D8((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v96;
      uint64_t v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    uint64_t v29 = v11 + 32;
    uint64_t v30 = &v11[16 * v28 + 32];
    *(void *)uint64_t v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          BOOL v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            uint64_t v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        uint64_t v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        uint64_t v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        uint64_t v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
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
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        uint64_t v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        unint64_t v73 = v29;
        unint64_t v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_25B3C669C((unsigned __int8 *)(v10 + *(void *)v71), (unsigned __int8 *)(v10 + *(void *)v74), v10 + v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        uint64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v96;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v95;
    if (v9 >= v95)
    {
      uint64_t v2 = v92;
      uint64_t v8 = v93;
      goto LABEL_103;
    }
  }
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
  uint64_t result = sub_25B3DD228();
  __break(1u);
  return result;
}

uint64_t sub_25B3C669C(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  uint64_t v22 = __src;
  id v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  size_t v8 = a2 - __src;
  unint64_t v9 = a3 - (void)a2;
  uint64_t v21 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (void)a2))
  {
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (__dst != a2 || a3 <= (unint64_t)__dst) {
        memmove(__dst, a2, a3 - (void)a2);
      }
      unsigned int v14 = &v4[v9];
      char v20 = &v4[v9];
      uint64_t v22 = v6;
      if (v7 < v6 && (unsigned __int8 *)a3 != v6)
      {
        unsigned int v15 = (unsigned __int8 *)(a3 - 1);
        while (1)
        {
          unsigned int v16 = v15 + 1;
          unsigned int v17 = v6 - 1;
          unsigned int v18 = *(v6 - 1);
          if (*(v14 - 1) >= v18)
          {
            char v20 = v14 - 1;
            if (v16 < v14 || v15 >= v14 || v16 != v14) {
              *unsigned int v15 = *(v14 - 1);
            }
            --v14;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            if (v16 != v6 || v15 >= v6) {
              *unsigned int v15 = v18;
            }
            uint64_t v22 = --v6;
            if (v17 <= v7) {
              goto LABEL_38;
            }
          }
          --v15;
          if (v14 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst) {
      memmove(__dst, __src, v8);
    }
    uint64_t v10 = &v4[v8];
    char v20 = &v4[v8];
    if (v6 != v7 && (unint64_t)v6 < a3)
    {
      do
      {
        unsigned int v11 = *v6;
        unsigned int v12 = *v4;
        if (v11 >= v12)
        {
          if (v7 != v4) {
            *uint64_t v7 = v12;
          }
          uint64_t v21 = ++v4;
          uint64_t v13 = v6;
        }
        else
        {
          uint64_t v13 = v6 + 1;
          if (v7 < v6 || v7 >= v13 || v7 != v6) {
            *uint64_t v7 = v11;
          }
        }
        ++v7;
        if (v4 >= v10) {
          break;
        }
        uint64_t v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      uint64_t v22 = v7;
    }
LABEL_38:
    sub_25B3C6B60((void **)&v22, (const void **)&v21, &v20);
    return 1;
  }
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

char *sub_25B3C68D8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBA48);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unsigned int v14 = a4 + 32;
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

uint64_t sub_25B3C69D4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_25B3C6A1C(a1, a2, a3, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
}

uint64_t sub_25B3C69EC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_25B3C6A1C(a1, a2, a3, type metadata accessor for AppSuggestionInferenceEventTimestamped);
}

uint64_t sub_25B3C6A04(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_25B3C6A1C(a1, a2, a3, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_25B3C6A1C(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = sub_25B3DD288();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_25B3C6B60(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  int64_t v4 = *a3 - (void)v3;
  if (v4 < 0)
  {
    uint64_t result = (char *)sub_25B3DD288();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
    {
      return (char *)memmove(result, v3, v4);
    }
  }
  return result;
}

char *sub_25B3C6C04(uint64_t a1)
{
  return sub_25B3C68D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25B3C6C18(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467A0);
  uint64_t v4 = sub_25B3DD258();
  unint64_t v5 = (void *)v4;
  int64_t v6 = 0;
  uint64_t v29 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  uint64_t v27 = v8;
  int64_t v28 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v4 + 64;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    uint64_t v19 = (uint64_t *)(*(void *)(v29 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v30 = *(void *)(*(void *)(v29 + 56) + 8 * i);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25B3C5FB4(&v30);
    if (v2) {
      break;
    }
    uint64_t v2 = 0;
    swift_bridgeObjectRelease();
    uint64_t v22 = v30;
    *(void *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    unsigned int v23 = (void *)(v5[6] + 16 * i);
    *unsigned int v23 = v20;
    v23[1] = v21;
    *(void *)(v5[7] + 8 * i) = v22;
    uint64_t v24 = v5[2];
    BOOL v16 = __OFADD__(v24, 1);
    uint64_t v25 = v24 + 1;
    if (v16)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      break;
    }
    void v5[2] = v25;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v16 = __OFADD__(v6++, 1);
    if (v16) {
      goto LABEL_26;
    }
    if (v6 >= v28) {
      return (uint64_t)v5;
    }
    unint64_t v17 = *(void *)(v27 + 8 * v6);
    if (!v17)
    {
      int64_t v18 = v6 + 1;
      if (v6 + 1 >= v28) {
        return (uint64_t)v5;
      }
      unint64_t v17 = *(void *)(v27 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v6 + 2;
        if (v6 + 2 >= v28) {
          return (uint64_t)v5;
        }
        unint64_t v17 = *(void *)(v27 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v6 + 3;
          if (v6 + 3 >= v28) {
            return (uint64_t)v5;
          }
          unint64_t v17 = *(void *)(v27 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v6 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_27;
              }
              if (v6 >= v28) {
                return (uint64_t)v5;
              }
              unint64_t v17 = *(void *)(v27 + 8 * v6);
              ++v18;
              if (v17) {
                goto LABEL_15;
              }
            }
          }
        }
      }
      int64_t v6 = v18;
    }
LABEL_15:
    unint64_t v12 = (v17 - 1) & v17;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25B3C6E40(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B346888);
  uint64_t v4 = sub_25B3DD258();
  unint64_t v5 = (void *)v4;
  int64_t v6 = 0;
  uint64_t v25 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  int64_t v24 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v4 + 64;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    uint64_t v19 = *(void **)(*(void *)(v25 + 48) + 8 * i);
    uint64_t v26 = *(void *)(*(void *)(v25 + 56) + 8 * i);
    swift_bridgeObjectRetain_n();
    id v20 = v19;
    sub_25B3C5FB4(&v26);
    if (v2) {
      break;
    }
    uint64_t v2 = 0;
    swift_bridgeObjectRelease();
    *(void *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v5[6] + 8 * i) = v20;
    *(void *)(v5[7] + 8 * i) = v26;
    uint64_t v21 = v5[2];
    BOOL v16 = __OFADD__(v21, 1);
    uint64_t v22 = v21 + 1;
    if (v16)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      break;
    }
    void v5[2] = v22;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v16 = __OFADD__(v6++, 1);
    if (v16) {
      goto LABEL_26;
    }
    if (v6 >= v24) {
      return (uint64_t)v5;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v6);
    if (!v17)
    {
      int64_t v18 = v6 + 1;
      if (v6 + 1 >= v24) {
        return (uint64_t)v5;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v6 + 2;
        if (v6 + 2 >= v24) {
          return (uint64_t)v5;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v6 + 3;
          if (v6 + 3 >= v24) {
            return (uint64_t)v5;
          }
          unint64_t v17 = *(void *)(v8 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v6 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_27;
              }
              if (v6 >= v24) {
                return (uint64_t)v5;
              }
              unint64_t v17 = *(void *)(v8 + 8 * v6);
              ++v18;
              if (v17) {
                goto LABEL_15;
              }
            }
          }
        }
      }
      int64_t v6 = v18;
    }
LABEL_15:
    unint64_t v12 = (v17 - 1) & v17;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25B3C7064(uint64_t a1)
{
  return sub_25B3B8614(0, *(void *)(a1 + 16), 0, (char *)a1);
}

int64_t sub_25B3C707C(int64_t result, int a2, char a3, uint64_t a4)
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
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_25B3C7160(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
}

void sub_25B3C7178(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25B3C7194(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5, void (*a6)(void *))
{
  unint64_t v9 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v10 = a4;
      }
      else {
        uint64_t v10 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x261162800](a1, a2, v10);
      a6(a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_25B3DD0A8() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_25B3DD0B8();
  a6(a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v20;
  swift_unknownObjectRelease();
  uint64_t v11 = sub_25B3DCFD8();
  uint64_t v12 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v9 = v11 & ~v12;
  if (((*(void *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
  char v14 = sub_25B3DCFE8();

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = ~v12;
    do
    {
      unint64_t v9 = (v9 + 1) & v15;
      if (((*(void *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_26;
      }
      id v16 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
      char v17 = sub_25B3DCFE8();
    }
    while ((v17 & 1) == 0);
  }

LABEL_20:
  int64_t v18 = *(void **)(*(void *)(a4 + 48) + 8 * v9);
  id v19 = v18;
}

uint64_t sub_25B3C7400(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  unint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_25B3C7488(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v54 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_25B3DD0C8();
  }
  else {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  if (!v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v8 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v8) {
      goto LABEL_23;
    }
LABEL_8:
    unint64_t v9 = (void *)MEMORY[0x263F8EE80];
LABEL_39:
    swift_bridgeObjectRelease();
    uint64_t v51 = sub_25B3C6C18((uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_25B3BE93C(v51);
    return swift_release();
  }
  uint64_t v59 = MEMORY[0x263F8EE78];
  sub_25B3B7AB4(0, v2 & ~(v2 >> 63), 0);
  if (v54)
  {
    uint64_t v3 = sub_25B3DD068();
    char v6 = 1;
  }
  else
  {
    uint64_t v3 = sub_25B3C7400(v1);
    char v6 = v10 & 1;
  }
  uint64_t v56 = v3;
  uint64_t v57 = v4;
  char v58 = v6;
  if (v2 < 0) {
    goto LABEL_42;
  }
  uint64_t v53 = v1;
  do
  {
    while (1)
    {
      int64_t v17 = v56;
      uint64_t v16 = v57;
      char v18 = v58;
      sub_25B3C7194(v56, v57, v58, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
      id v20 = v19;
      uint64_t v21 = *(void *)&v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
      uint64_t v22 = *(void *)&v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8];
      char v23 = v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank];
      swift_bridgeObjectRetain();

      uint64_t v24 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25B3B7AB4(0, *(void *)(v24 + 16) + 1, 1);
        uint64_t v24 = v59;
      }
      unint64_t v26 = *(void *)(v24 + 16);
      unint64_t v25 = *(void *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_25B3B7AB4(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v59;
      }
      *(void *)(v24 + 16) = v26 + 1;
      uint64_t v27 = v24 + 24 * v26;
      *(void *)(v27 + 32) = v21;
      *(void *)(v27 + 40) = v22;
      *(unsigned char *)(v27 + 48) = v23;
      if (v54) {
        break;
      }
      uint64_t v1 = v53;
      int64_t v11 = sub_25B3C707C(v17, v16, v18, v53);
      uint64_t v13 = v12;
      char v15 = v14;
      sub_25B3CB264(v17, v16, v18);
      uint64_t v56 = v11;
      uint64_t v57 = v13;
      char v58 = v15 & 1;
      if (!--v2) {
        goto LABEL_22;
      }
    }
    uint64_t v1 = v53;
    if ((v18 & 1) == 0) {
      goto LABEL_43;
    }
    if (sub_25B3DD088()) {
      swift_isUniquelyReferenced_nonNull_native();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346790);
    int64_t v28 = (void (*)(void **, void))sub_25B3DCF38();
    sub_25B3DD118();
    v28(&v55, 0);
    --v2;
  }
  while (v2);
LABEL_22:
  sub_25B3CB264(v56, v57, v58);
  uint64_t v7 = v59;
  uint64_t v8 = *(void *)(v59 + 16);
  if (!v8) {
    goto LABEL_8;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  uint64_t v29 = (unsigned char *)(v7 + 48);
  unint64_t v9 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v31 = *((void *)v29 - 2);
    uint64_t v30 = *((void *)v29 - 1);
    char v32 = *v29;
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v55 = v9;
    unint64_t v35 = sub_25B3B2324(v31, v30);
    uint64_t v36 = v9[2];
    BOOL v37 = (v34 & 1) == 0;
    uint64_t v38 = v36 + v37;
    if (__OFADD__(v36, v37)) {
      break;
    }
    char v39 = v34;
    if (v9[3] >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25B3B62E8();
        unint64_t v9 = v55;
      }
    }
    else
    {
      sub_25B3B2654(v38, isUniquelyReferenced_nonNull_native);
      unint64_t v9 = v55;
      unint64_t v40 = sub_25B3B2324(v31, v30);
      if ((v39 & 1) != (v41 & 1)) {
        goto LABEL_44;
      }
      unint64_t v35 = v40;
    }
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      v9[(v35 >> 6) + 8] |= 1 << v35;
      BOOL v42 = (uint64_t *)(v9[6] + 16 * v35);
      uint64_t *v42 = v31;
      v42[1] = v30;
      *(void *)(v9[7] + 8 * v35) = MEMORY[0x263F8EE78];
      uint64_t v43 = v9[2];
      BOOL v44 = __OFADD__(v43, 1);
      uint64_t v45 = v43 + 1;
      if (v44) {
        goto LABEL_41;
      }
      void v9[2] = v45;
      swift_bridgeObjectRetain();
    }
    uint64_t v46 = v9[7];
    uint64_t v47 = *(char **)(v46 + 8 * v35);
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v46 + 8 * v35) = v47;
    if ((v48 & 1) == 0)
    {
      uint64_t v47 = sub_25B3B171C(0, *((void *)v47 + 2) + 1, 1, v47);
      *(void *)(v46 + 8 * v35) = v47;
    }
    unint64_t v50 = *((void *)v47 + 2);
    unint64_t v49 = *((void *)v47 + 3);
    if (v50 >= v49 >> 1)
    {
      uint64_t v47 = sub_25B3B171C((char *)(v49 > 1), v50 + 1, 1, v47);
      *(void *)(v46 + 8 * v35) = v47;
    }
    v29 += 24;
    *((void *)v47 + 2) = v50 + 1;
    v47[v50 + 32] = v32;
    swift_bridgeObjectRelease_n();
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t result = sub_25B3DD378();
  __break(1u);
  return result;
}

id sub_25B3C7944(void *a1)
{
  id v2 = objc_msgSend(a1, sel_transportBundleId);
  if (!v2)
  {
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v19 = sub_25B3DD458();
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v29 = v19;
    uint64_t v30 = v21;
LABEL_9:
    sub_25B3DCE28();
    uint64_t v26 = v30;
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v27 = v29;
    *(void *)(v27 + 8) = v26;
    *(unsigned char *)(v27 + 16) = 0;
    return (id)swift_willThrow();
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25B3DCDE8();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(a1, sel_model);
  if (!v7)
  {
    swift_bridgeObjectRelease();
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v22 = sub_25B3DD458();
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v29 = v22;
    uint64_t v30 = v24;
    goto LABEL_9;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_25B3DCDE8();
  uint64_t v11 = v10;

  if (!objc_msgSend(a1, sel_hasRank))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    uint64_t v29 = sub_25B3DD458();
    uint64_t v30 = v25;
    goto LABEL_9;
  }
  unsigned int v12 = objc_msgSend(a1, sel_rank);
  if (v12 >= 0x100)
  {
    id result = (id)sub_25B3DD228();
    __break(1u);
  }
  else
  {
    char v13 = v12;
    char v14 = (objc_class *)type metadata accessor for AppSuggestions.AppSuggestion();
    char v15 = objc_allocWithZone(v14);
    uint64_t v16 = (uint64_t *)&v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
    *uint64_t v16 = v4;
    v16[1] = v6;
    int64_t v17 = (uint64_t *)&v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
    *int64_t v17 = v9;
    v17[1] = v11;
    v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = v13;
    v28.receiver = v15;
    v28.super_class = v14;
    return objc_msgSendSuper2(&v28, sel_init);
  }
  return result;
}

id sub_25B3C7BF8(void *a1)
{
  id v3 = objc_msgSend(a1, sel_identifier);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_25B3DCDE8();
    uint64_t v7 = v6;

    id v8 = objc_msgSend(a1, sel_appSuggestions);
    sub_25B3BD648(0, (unint64_t *)&qword_26B346798);
    unint64_t v9 = sub_25B3DCE88();

    unint64_t v24 = MEMORY[0x263F8EE78];
    if (v9 >> 62) {
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v10; uint64_t v10 = sub_25B3DD248())
    {
      uint64_t v22 = v5;
      uint64_t v26 = v7;
      uint64_t v5 = 4;
      while (1)
      {
        id v11 = (v9 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2611628B0](v5 - 4, v9) : *(id *)(v9 + 8 * v5);
        unsigned int v12 = v11;
        uint64_t v7 = v5 - 3;
        if (__OFADD__(v5 - 4, 1)) {
          break;
        }
        sub_25B3C7944(v11);
        if (v1)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (id)swift_bridgeObjectRelease();
        }

        MEMORY[0x261162580]();
        if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25B3DCEB8();
        }
        sub_25B3DCED8();
        sub_25B3DCEA8();
        ++v5;
        if (v7 == v10)
        {
          swift_bridgeObjectRelease();
          unint64_t v18 = v24;
          uint64_t v7 = v26;
          uint64_t v5 = v22;
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    unint64_t v18 = MEMORY[0x263F8EE78];
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_25B3C8844(v18, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion, &qword_26B346780, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion, (void (*)(id *, uint64_t))sub_25B3D5488);
    swift_bridgeObjectRelease();
    uint64_t v20 = (char *)objc_allocWithZone((Class)type metadata accessor for AppSuggestions());
    sub_25B3C7488(v19);
    *(void *)&v20[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = v19;

    uint64_t v21 = (uint64_t *)&v20[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
    *uint64_t v21 = v5;
    v21[1] = v7;
    v23.receiver = v20;
    v23.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
    return objc_msgSendSuper2(&v23, sel_init);
  }
  else
  {
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v13 = sub_25B3DD458();
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    unint64_t v24 = v13;
    uint64_t v25 = v15;
    sub_25B3DCE28();
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v16 = v13;
    *(void *)(v16 + 8) = v15;
    *(unsigned char *)(v16 + 16) = 0;
    return (id)swift_willThrow();
  }
}

uint64_t sub_25B3C7F5C(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      sub_25B3A9794();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD000000000000017;
      uint64_t v4 = "unknown engagement type";
      goto LABEL_4;
    case 1:
      return result;
    case 2:
      uint64_t result = 1;
      break;
    case 3:
      uint64_t result = 2;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 3;
      break;
    case 6:
      uint64_t result = 5;
      break;
    case 7:
      uint64_t result = 6;
      break;
    default:
      sub_25B3A9794();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD00000000000001ALL;
      uint64_t v4 = "unexpected engagement type";
LABEL_4:
      *(void *)(v3 + 8) = (unint64_t)(v4 - 32) | 0x8000000000000000;
      *(unsigned char *)(v3 + 16) = 0;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

id sub_25B3C808C(void *a1)
{
  id v3 = objc_msgSend(a1, sel_identifier);
  if (!v3)
  {
    sub_25B3A9794();
    swift_allocError();
    id v11 = "BMMLSEShareSheetFeedback missing identifier";
    unint64_t v12 = 0xD00000000000002BLL;
LABEL_5:
    uint64_t v13 = v11 - 32;
LABEL_44:
    *(void *)uint64_t v10 = v12;
    *(void *)(v10 + 8) = (unint64_t)v13 | 0x8000000000000000;
    *(unsigned char *)(v10 + 16) = 0;
    return (id)swift_willThrow();
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_25B3DCDE8();
  uint64_t v7 = v6;

  uint64_t v8 = sub_25B3C7F5C((int)objc_msgSend(a1, sel_engagementType));
  if (v1) {
    return (id)swift_bridgeObjectRelease();
  }
  unint64_t v14 = v8;
  id v15 = objc_msgSend(a1, sel_engagementIdentifier);
  if (v15)
  {

    goto LABEL_10;
  }
  if (v14 <= 1)
  {
    swift_bridgeObjectRelease();
    sub_25B3A9794();
    swift_allocError();
    id v11 = "BMMLSEShareSheetFeedback missing engagement identifier";
    unint64_t v12 = 0xD000000000000036;
    goto LABEL_5;
  }
LABEL_10:
  if ((objc_msgSend(a1, sel_hasVisiblePeopleSuggestionCount) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25B3A9794();
    swift_allocError();
    uint64_t v36 = "BMMLSEShareSheetFeedback missing visiblePeopleSuggestionCount";
LABEL_43:
    unint64_t v12 = 0xD00000000000003DLL;
    uint64_t v13 = v36 - 32;
    goto LABEL_44;
  }
  if ((objc_msgSend(a1, sel_hasVisibleAppSuggestionCount) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25B3A9794();
    swift_allocError();
    id v11 = "BMMLSEShareSheetFeedback missing visibleAppSuggestionCount";
    unint64_t v12 = 0xD00000000000003ALL;
    goto LABEL_5;
  }
  if ((objc_msgSend(a1, sel_hasAirdropPeopleSuggestionShown) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25B3A9794();
    swift_allocError();
    uint64_t v36 = "BMMLSEShareSheetFeedback missing airdropPeopleSuggestionShown";
    goto LABEL_43;
  }
  id v16 = objc_msgSend(a1, sel_timeouts);
  sub_25B3BD648(0, &qword_26B346810);
  unint64_t v17 = sub_25B3DCE88();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25B3DD248();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v68 = v7;
  uint64_t v66 = v14;
  uint64_t v67 = v5;
  if (v18)
  {
    if (v18 >= 1)
    {
      uint64_t v19 = 0;
      uint64_t v20 = (void *)MEMORY[0x263F8EE78];
      uint64_t v69 = v18;
      while (1)
      {
        if ((v17 & 0xC000000000000001) != 0) {
          id v21 = (id)MEMORY[0x2611628B0](v19, v17);
        }
        else {
          id v21 = *(id *)(v17 + 8 * v19 + 32);
        }
        uint64_t v22 = v21;
        unsigned int v23 = objc_msgSend(v21, sel_occurrence);
        if (v23 == 2)
        {
          uint64_t v31 = 1;
          goto LABEL_33;
        }
        if (v23 == 1)
        {
          uint64_t v31 = 0;
LABEL_33:

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v20 = sub_25B3B1818(0, v20[2] + 1, 1, v20);
          }
          unint64_t v33 = v20[2];
          unint64_t v32 = v20[3];
          if (v33 >= v32 >> 1) {
            uint64_t v20 = sub_25B3B1818((void *)(v32 > 1), v33 + 1, 1, v20);
          }
          void v20[2] = v33 + 1;
          v20[v33 + 4] = v31;
          goto LABEL_20;
        }
        if (v23)
        {
          if (qword_26B346880 != -1) {
            swift_once();
          }
          uint64_t v34 = sub_25B3DCD98();
          __swift_project_value_buffer(v34, (uint64_t)qword_26B346958);
          uint64_t v25 = sub_25B3DCD78();
          os_log_type_t v35 = sub_25B3DCF78();
          if (!os_log_type_enabled(v25, v35)) {
            goto LABEL_19;
          }
          uint64_t v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v27 = 0;
          objc_super v28 = v25;
          os_log_type_t v29 = v35;
          uint64_t v30 = "new timeout";
        }
        else
        {
          if (qword_26B346880 != -1) {
            swift_once();
          }
          uint64_t v24 = sub_25B3DCD98();
          __swift_project_value_buffer(v24, (uint64_t)qword_26B346958);
          uint64_t v25 = sub_25B3DCD78();
          os_log_type_t v26 = sub_25B3DCF78();
          if (!os_log_type_enabled(v25, v26)) {
            goto LABEL_19;
          }
          uint64_t v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v27 = 0;
          objc_super v28 = v25;
          os_log_type_t v29 = v26;
          uint64_t v30 = "unknown timeout";
        }
        _os_log_impl(&dword_25B39F000, v28, v29, v30, v27, 2u);
        MEMORY[0x261163250](v27, -1, -1);
LABEL_19:

        uint64_t v18 = v69;
LABEL_20:
        if (v18 == ++v19) {
          goto LABEL_48;
        }
      }
    }
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v20 = (void *)MEMORY[0x263F8EE78];
LABEL_48:
  swift_bridgeObjectRelease_n();
  id v37 = objc_msgSend(a1, sel_engagementIdentifier);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v70 = sub_25B3DCDE8();
    uint64_t v40 = v39;
  }
  else
  {
    uint64_t v70 = 0;
    uint64_t v40 = 0;
  }
  unsigned __int8 v41 = objc_msgSend(a1, sel_airdropPeopleSuggestionShown);
  unsigned int v42 = objc_msgSend(a1, sel_visiblePeopleSuggestionCount);
  if (v42 >= 0x100 || (char v43 = v42, v44 = objc_msgSend(a1, sel_visibleAppSuggestionCount), v44 >= 0x100))
  {
LABEL_66:
    id result = (id)sub_25B3DD228();
    __break(1u);
    return result;
  }
  char v64 = v44;
  unint64_t v45 = 0xD000000000000019;
  id v46 = objc_msgSend(a1, sel_trialIdentifier);
  uint64_t v71 = 0x800000025B3E1D60;
  uint64_t v62 = v40;
  if (v46
    && (uint64_t v47 = v46,
        id v48 = objc_msgSend(v46, sel_trialExperimentId),
        v47,
        v48))
  {
    unint64_t v63 = sub_25B3DCDE8();
    uint64_t v71 = v49;
  }
  else
  {
    unint64_t v63 = 0xD000000000000019;
  }
  char v65 = v41;
  id v50 = objc_msgSend(a1, sel_trialIdentifier);
  unint64_t v51 = 0xD000000000000018;
  uint64_t v52 = 0x800000025B3E1D80;
  if (v50)
  {
    uint64_t v53 = v50;
    id v54 = objc_msgSend(v50, sel_trialTreatmentId);

    if (v54)
    {
      unint64_t v51 = sub_25B3DCDE8();
      uint64_t v52 = v55;
    }
  }
  id v56 = objc_msgSend(a1, sel_trialIdentifier);
  uint64_t v57 = 0x800000025B3E1DA0;
  if (v56)
  {
    char v58 = v56;
    id v59 = objc_msgSend(v56, sel_trialDeploymentId);

    if (v59)
    {
      unint64_t v45 = sub_25B3DCDE8();
      uint64_t v57 = v60;
    }
  }
  id v61 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  return sub_25B3C359C(v67, v68, v66, v70, v62, v65, v43, v64, v63, v71, v51, v52, v45, v57, (uint64_t)v20);
}

uint64_t sub_25B3C8844(unint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(void), void (*a5)(id *, uint64_t))
{
  unint64_t v10 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25B3DD248();
    swift_bridgeObjectRelease();
  }
  a2();
  sub_25B3CCC10(a3, a4);
  uint64_t result = sub_25B3DCF28();
  uint64_t v18 = result;
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25B3DD248();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v12) {
      return v18;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v12) {
      return v18;
    }
  }
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = MEMORY[0x2611628B0](i, a1);
        a5(&v17, v14);
      }
    }
    else
    {
      id v15 = (void **)(a1 + 32);
      do
      {
        id v16 = *v15++;
        a5(&v17, (uint64_t)v16);

        --v12;
      }
      while (v12);
    }
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_25B3C89CC(uint64_t a1)
{
  unint64_t v51 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_25B3DD0C8();
  }
  else {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  if (!v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v8 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v8) {
      goto LABEL_23;
    }
LABEL_8:
    unint64_t v9 = (void *)MEMORY[0x263F8EE80];
LABEL_39:
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_25B3C6E40((uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_25B3BEAC8(v49);
    return swift_release();
  }
  uint64_t v56 = MEMORY[0x263F8EE78];
  sub_25B3B7BE0(0, v2 & ~(v2 >> 63), 0);
  if (v51)
  {
    uint64_t v3 = sub_25B3DD068();
    char v6 = 1;
  }
  else
  {
    uint64_t v3 = sub_25B3C7400(a1);
    char v6 = v10 & 1;
  }
  uint64_t v53 = v3;
  uint64_t v54 = v4;
  char v55 = v6;
  if (v2 < 0) {
    goto LABEL_42;
  }
  do
  {
    while (1)
    {
      int64_t v17 = v53;
      uint64_t v16 = v54;
      char v18 = v55;
      sub_25B3C7194(v53, v54, v55, a1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
      uint64_t v20 = v19;
      char v21 = v19[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank];
      id v22 = *(id *)&v19[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model];

      uint64_t v23 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25B3B7BE0(0, *(void *)(v23 + 16) + 1, 1);
        uint64_t v23 = v56;
      }
      unint64_t v25 = *(void *)(v23 + 16);
      unint64_t v24 = *(void *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_25B3B7BE0(v24 > 1, v25 + 1, 1);
        uint64_t v23 = v56;
      }
      *(void *)(v23 + 16) = v25 + 1;
      uint64_t v26 = v23 + 16 * v25;
      *(void *)(v26 + 32) = v22;
      *(unsigned char *)(v26 + 40) = v21;
      if (v51) {
        break;
      }
      int64_t v11 = sub_25B3C707C(v17, v16, v18, a1);
      uint64_t v13 = v12;
      char v15 = v14;
      sub_25B3CB264(v17, v16, v18);
      uint64_t v53 = v11;
      uint64_t v54 = v13;
      char v55 = v15 & 1;
      if (!--v2) {
        goto LABEL_22;
      }
    }
    if ((v18 & 1) == 0) {
      goto LABEL_43;
    }
    if (sub_25B3DD088()) {
      swift_isUniquelyReferenced_nonNull_native();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB920);
    uint64_t v27 = (void (*)(void **, void))sub_25B3DCF38();
    sub_25B3DD118();
    v27(&v52, 0);
    --v2;
  }
  while (v2);
LABEL_22:
  sub_25B3CB264(v53, v54, v55);
  uint64_t v7 = v56;
  uint64_t v8 = *(void *)(v56 + 16);
  if (!v8) {
    goto LABEL_8;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  objc_super v28 = (id *)(v7 + 40);
  unint64_t v9 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    char v29 = *(unsigned char *)v28;
    id v30 = *(v28 - 1);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v52 = v9;
    unint64_t v33 = sub_25B3B24D8((uint64_t)v30);
    uint64_t v34 = v9[2];
    BOOL v35 = (v32 & 1) == 0;
    uint64_t v36 = v34 + v35;
    if (__OFADD__(v34, v35)) {
      break;
    }
    char v37 = v32;
    if (v9[3] >= v36)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25B3B7210();
        unint64_t v9 = v52;
      }
    }
    else
    {
      sub_25B3B4F9C(v36, isUniquelyReferenced_nonNull_native);
      unint64_t v9 = v52;
      unint64_t v38 = sub_25B3B24D8((uint64_t)v30);
      if ((v37 & 1) != (v39 & 1)) {
        goto LABEL_44;
      }
      unint64_t v33 = v38;
    }
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      v9[(v33 >> 6) + 8] |= 1 << v33;
      *(void *)(v9[6] + 8 * v33) = v30;
      *(void *)(v9[7] + 8 * v33) = MEMORY[0x263F8EE78];
      uint64_t v40 = v9[2];
      BOOL v41 = __OFADD__(v40, 1);
      uint64_t v42 = v40 + 1;
      if (v41) {
        goto LABEL_41;
      }
      void v9[2] = v42;
      id v43 = v30;
    }
    uint64_t v44 = v9[7];
    unint64_t v45 = *(char **)(v44 + 8 * v33);
    char v46 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v44 + 8 * v33) = v45;
    if ((v46 & 1) == 0)
    {
      unint64_t v45 = sub_25B3B171C(0, *((void *)v45 + 2) + 1, 1, v45);
      *(void *)(v44 + 8 * v33) = v45;
    }
    unint64_t v48 = *((void *)v45 + 2);
    unint64_t v47 = *((void *)v45 + 3);
    if (v48 >= v47 >> 1)
    {
      unint64_t v45 = sub_25B3B171C((char *)(v47 > 1), v48 + 1, 1, v45);
      *(void *)(v44 + 8 * v33) = v45;
    }
    *((void *)v45 + 2) = v48 + 1;
    v45[v48 + 32] = v29;

    v28 += 2;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  uint64_t result = sub_25B3DD378();
  __break(1u);
  return result;
}

uint64_t sub_25B3C8E60(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 1:
      uint64_t result = 0;
      break;
    case 2:
      uint64_t result = 1;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 5:
      uint64_t result = 3;
      break;
    case 6:
      uint64_t result = 4;
      break;
    case 7:
      uint64_t result = 5;
      break;
    case 8:
      uint64_t result = 6;
      break;
    case 9:
      uint64_t result = 7;
      break;
    case 10:
      uint64_t result = 8;
      break;
    case 11:
      uint64_t result = 9;
      break;
    case 12:
      uint64_t result = 10;
      break;
    case 13:
      uint64_t result = 11;
      break;
    case 14:
      uint64_t result = 12;
      break;
    case 15:
      uint64_t result = 13;
      break;
    case 16:
      uint64_t result = 14;
      break;
    case 17:
      uint64_t result = 15;
      break;
    case 18:
      uint64_t result = 16;
      break;
    case 19:
      uint64_t result = 17;
      break;
    case 21:
      uint64_t result = 18;
      break;
    case 22:
      uint64_t result = 19;
      break;
    case 24:
      uint64_t result = 20;
      break;
    case 25:
      uint64_t result = 21;
      break;
    case 26:
      uint64_t result = 22;
      break;
    case 27:
      uint64_t result = 23;
      break;
    case 28:
      uint64_t result = 24;
      break;
    case 29:
      uint64_t result = 25;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_25B3C9044(void *a1, void *a2)
{
  uint64_t v4 = sub_25B3C8E60((int)objc_msgSend(a1, sel_modelType));
  char v6 = v5;
  id v7 = objc_msgSend(a1, sel_otherModelTypeName);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_25B3DCDE8();
    uint64_t v11 = v10;

    if ((v6 & 1) == 0)
    {
      if (v11)
      {
        swift_bridgeObjectRelease();
        sub_25B3A9794();
        swift_allocError();
        *(void *)uint64_t v12 = 0xD00000000000002DLL;
        uint64_t v13 = "both modelType and otherModelTypeName are set";
LABEL_12:
        *(void *)(v12 + 8) = (unint64_t)(v13 - 32) | 0x8000000000000000;
        *(unsigned char *)(v12 + 16) = 0;
        swift_willThrow();
        return a2;
      }
      goto LABEL_7;
    }
    if (v11)
    {
      char v21 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      id v22 = objc_allocWithZone(v21);
      uint64_t v23 = (char *)objc_allocWithZone(v21);
      unint64_t v24 = &v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(void *)unint64_t v24 = 0;
      v24[8] = 1;
      unint64_t v25 = (uint64_t *)&v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      uint64_t *v25 = v9;
      v25[1] = v11;
      *(void *)&v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
      v29.receiver = v23;
      id v26 = a2;
      id v20 = objc_msgSendSuper2(&v29, sel_init, v28.receiver, v28.super_class, v29.receiver, v21);
      goto LABEL_10;
    }
LABEL_11:
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v12 = 0xD000000000000030;
    uint64_t v13 = "neither modelType and otherModelTypeName are set";
    goto LABEL_12;
  }
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_7:
  char v14 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  id v15 = objc_allocWithZone(v14);
  uint64_t v16 = (char *)objc_allocWithZone(v14);
  int64_t v17 = &v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)int64_t v17 = v4;
  v17[8] = 0;
  char v18 = (uint64_t *)&v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  uint64_t *v18 = v9;
  v18[1] = 0;
  *(void *)&v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v28.receiver = v16;
  id v19 = a2;
  id v20 = objc_msgSendSuper2(&v28, sel_init, v28.receiver, v14, v29.receiver, v29.super_class);
LABEL_10:
  a2 = v20;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return a2;
}

id sub_25B3C926C(void *a1, void *a2)
{
  id v6 = objc_msgSend(a1, sel_modelIdentifier);
  if (!v6) {
    goto LABEL_12;
  }
  id v7 = v6;
  uint64_t v8 = sub_25B3C9044(v6, a2);
  if (v2)
  {
LABEL_3:

    return v3;
  }
  id v3 = v8;
  if (!v8)
  {

LABEL_12:
    id v14 = objc_msgSend(a1, sel_model);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = sub_25B3DCDE8();
      uint64_t v18 = v17;

      id v19 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      id v20 = objc_allocWithZone(v19);
      char v21 = (char *)objc_allocWithZone(v19);
      id v22 = &v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(void *)id v22 = 0;
      unsigned char v22[8] = 1;
      uint64_t v23 = (uint64_t *)&v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *uint64_t v23 = v16;
      v23[1] = v18;
      *(void *)&v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
      v29.receiver = v21;
      v29.super_class = v19;
      id v24 = a2;
      id v3 = objc_msgSendSuper2(&v29, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
    }
    else
    {
      sub_25B3DD168();
      swift_getObjectType();
      uint64_t v25 = sub_25B3DD458();
      id v3 = v26;
      swift_bridgeObjectRelease();
      uint64_t v30 = v25;
      id v31 = v3;
      sub_25B3DCE28();
      sub_25B3A9794();
      swift_allocError();
      *(void *)uint64_t v27 = v25;
      *(void *)(v27 + 8) = v3;
      *(unsigned char *)(v27 + 16) = 0;
      swift_willThrow();
    }
    return v3;
  }
  id v9 = objc_msgSend(a1, sel_model);
  if (!v9) {
    goto LABEL_3;
  }

  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25B3DCD98();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B346958);
  uint64_t v11 = sub_25B3DCD78();
  os_log_type_t v12 = sub_25B3DCF78();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25B39F000, v11, v12, "both 'model' and 'modelIdentifier' set", v13, 2u);
    MEMORY[0x261163250](v13, -1, -1);
  }

  return v3;
}

void sub_25B3C9528(void *a1)
{
  id v3 = objc_msgSend(a1, sel_identifier);
  if (!v3)
  {
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v9 = sub_25B3DD458();
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v36 = v11;
    sub_25B3DCE28();
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v12 = v9;
    *(void *)(v12 + 8) = v11;
    *(unsigned char *)(v12 + 16) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_25B3DCDE8();
  uint64_t v7 = v6;

  id v8 = sub_25B3C926C(a1, 0);
  if (v1)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v13 = v8;
  id v14 = objc_msgSend(a1, sel_transportBundleId);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v28 = sub_25B3DD458();
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v35 = v28;
    uint64_t v36 = v30;
LABEL_13:
    sub_25B3DCE28();
    uint64_t v32 = v36;
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v33 = v35;
    *(void *)(v33 + 8) = v32;
    *(unsigned char *)(v33 + 16) = 0;
    swift_willThrow();

    return;
  }
  id v15 = v14;
  uint64_t v16 = sub_25B3DCDE8();
  uint64_t v18 = v17;

  if ((objc_msgSend(a1, sel_hasRank) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    uint64_t v35 = sub_25B3DD458();
    uint64_t v36 = v31;
    goto LABEL_13;
  }
  unsigned int v19 = objc_msgSend(a1, sel_rank);
  unsigned int v20 = objc_msgSend(a1, sel_hasScore);
  uint64_t v21 = 0;
  if (v20)
  {
    objc_msgSend(a1, sel_score);
    uint64_t v21 = v22;
  }
  if (v19 >= 0x100)
  {
    sub_25B3DD228();
    __break(1u);
  }
  else
  {
    uint64_t v23 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion();
    id v24 = objc_allocWithZone(v23);
    uint64_t v25 = (uint64_t *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id];
    uint64_t *v25 = v5;
    v25[1] = v7;
    *(void *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model] = v13;
    id v26 = (uint64_t *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId];
    *id v26 = v16;
    v26[1] = v18;
    v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] = v19;
    uint64_t v27 = &v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score];
    *(void *)uint64_t v27 = v21;
    v27[8] = v20 ^ 1;
    v34.receiver = v24;
    v34.super_class = v23;
    objc_msgSendSuper2(&v34, sel_init);
  }
}

id sub_25B3C98A0(void *a1)
{
  id v3 = objc_msgSend(a1, sel_identifier);
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = sub_25B3DCDE8();
    uint64_t v7 = v6;

    uint64_t v8 = 0;
    switch(objc_msgSend(a1, sel_responseType))
    {
      case 0u:
        sub_25B3A9794();
        swift_allocError();
        *(void *)uint64_t v9 = 0xD000000000000017;
        uint64_t v10 = "\"unknown\" response type";
        goto LABEL_6;
      case 1u:
        goto LABEL_9;
      case 2u:
        uint64_t v8 = 1;
        goto LABEL_9;
      case 3u:
        uint64_t v8 = 2;
LABEL_9:
        id v16 = objc_msgSend(a1, sel_peopleSuggestions);
        sub_25B3BD648(0, &qword_26B346848);
        unint64_t v17 = sub_25B3DCE88();

        unint64_t v29 = MEMORY[0x263F8EE78];
        if (v17 >> 62) {
          goto LABEL_24;
        }
        uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v18) {
          goto LABEL_25;
        }
        break;
      default:
        sub_25B3A9794();
        swift_allocError();
        *(void *)uint64_t v9 = 0xD000000000000011;
        uint64_t v10 = "new response type";
LABEL_6:
        *(void *)(v9 + 8) = (unint64_t)(v10 - 32) | 0x8000000000000000;
        *(unsigned char *)(v9 + 16) = 0;
        swift_willThrow();
        return (id)swift_bridgeObjectRelease();
    }
LABEL_11:
    uint64_t v26 = v8;
    unint64_t v27 = v5;
    uint64_t v31 = v7;
    unint64_t v5 = v17 & 0xC000000000000001;
    uint64_t v7 = 4;
    while (1)
    {
      uint64_t v8 = v7 - 4;
      if (v5) {
        id v19 = (id)MEMORY[0x2611628B0](v7 - 4, v17);
      }
      else {
        id v19 = *(id *)(v17 + 8 * v7);
      }
      unsigned int v20 = v19;
      uint64_t v21 = v7 - 3;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_24:
        swift_bridgeObjectRetain();
        uint64_t v18 = sub_25B3DD248();
        if (!v18)
        {
LABEL_25:
          swift_bridgeObjectRelease();
          unint64_t v22 = MEMORY[0x263F8EE78];
          goto LABEL_26;
        }
        goto LABEL_11;
      }
      sub_25B3C9528(v19);
      if (v1) {
        break;
      }

      MEMORY[0x261162580]();
      if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25B3DCEB8();
      }
      sub_25B3DCED8();
      sub_25B3DCEA8();
      ++v7;
      if (v21 == v18)
      {
        swift_bridgeObjectRelease();
        unint64_t v22 = v29;
        uint64_t v7 = v31;
        uint64_t v8 = v26;
        unint64_t v5 = v27;
LABEL_26:
        swift_bridgeObjectRelease();
        uint64_t v23 = sub_25B3C8844(v22, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion, &qword_26B346878, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion, (void (*)(id *, uint64_t))sub_25B3D566C);
        swift_bridgeObjectRelease();
        id v24 = (char *)objc_allocWithZone((Class)type metadata accessor for PeopleSuggestions());
        sub_25B3C89CC(v23);
        *(void *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = v8;
        *(void *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = v23;

        uint64_t v25 = (unint64_t *)&v24[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
        unint64_t *v25 = v5;
        v25[1] = v7;
        v28.receiver = v24;
        v28.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
        return objc_msgSendSuper2(&v28, sel_init);
      }
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    sub_25B3DD168();
    swift_getObjectType();
    uint64_t v11 = sub_25B3DD458();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    unint64_t v29 = v11;
    uint64_t v30 = v13;
    sub_25B3DCE28();
    sub_25B3A9794();
    swift_allocError();
    *(void *)uint64_t v14 = v11;
    *(void *)(v14 + 8) = v13;
    *(unsigned char *)(v14 + 16) = 0;
    return (id)swift_willThrow();
  }
}

void _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record9inferenceyAA0C19SuggestionInferenceC_tFZ_0(void *a1)
{
  type metadata accessor for PeopleSuggestions();
  uint64_t v2 = swift_dynamicCastClass();
  if (!v2)
  {
    type metadata accessor for AppSuggestions();
    uint64_t v13 = swift_dynamicCastClass();
    if (!v13)
    {
      if (qword_26B346880 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_25B3DCD98();
      __swift_project_value_buffer(v31, (uint64_t)qword_26B346958);
      id v40 = a1;
      uint64_t v25 = sub_25B3DCD78();
      os_log_type_t v32 = sub_25B3DCF68();
      if (os_log_type_enabled(v25, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v41 = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        swift_getObjectType();
        uint64_t v35 = sub_25B3DD458();
        sub_25B3B1CCC(v35, v36, &v41);
        sub_25B3DD018();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25B39F000, v25, v32, "unexpected inference type: %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261163250](v34, -1, -1);
        MEMORY[0x261163250](v33, -1, -1);
LABEL_25:

        return;
      }

LABEL_28:
      goto LABEL_29;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)(v13 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = a1;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_25B3DD0C8();
      swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_8:
        id v18 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
        swift_unknownObjectRelease();
        id v19 = objc_msgSend(v18, sel_ShareSheet);
        swift_unknownObjectRelease();
        id v20 = objc_msgSend(v19, sel_Inference);
        swift_unknownObjectRelease();
        id v21 = objc_msgSend(v20, sel_AppSuggestions);
        swift_unknownObjectRelease();
        id v11 = objc_msgSend(v21, sel_source);

        sub_25B3BF3B0();
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v37 = *(void *)(v15 + 16);
      id v38 = a1;
      if (v37) {
        goto LABEL_8;
      }
    }
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_25B3DCD98();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B346958);
    id v40 = a1;
    uint64_t v25 = sub_25B3DCD78();
    os_log_type_t v26 = sub_25B3DCF78();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      objc_super v28 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 138412290;
      uint64_t v41 = v14;
      id v29 = v40;
      sub_25B3DD018();
      void *v28 = v14;

      uint64_t v30 = "Ignoring empty app suggestions event %@";
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  if ((v4 & 0xC000000000000001) == 0)
  {
    uint64_t v22 = *(void *)(v4 + 16);
    id v23 = a1;
    if (v22) {
      goto LABEL_4;
    }
LABEL_11:
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25B3DCD98();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B346958);
    id v40 = a1;
    uint64_t v25 = sub_25B3DCD78();
    os_log_type_t v26 = sub_25B3DCF78();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      objc_super v28 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 138412290;
      uint64_t v41 = v3;
      id v29 = v40;
      sub_25B3DD018();
      void *v28 = v3;

      uint64_t v30 = "Ignoring empty people suggestions event %@";
LABEL_24:
      _os_log_impl(&dword_25B39F000, v25, v26, v30, v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
      swift_arrayDestroy();
      MEMORY[0x261163250](v28, -1, -1);
      MEMORY[0x261163250](v27, -1, -1);

      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_28;
  }
  id v5 = a1;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25B3DD0C8();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_11;
  }
LABEL_4:
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v9 = objc_msgSend(v8, sel_Inference);
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(v9, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v10, sel_source);

  uint64_t v12 = sub_25B3BEF30();
LABEL_9:
  id v40 = (id)v12;
  objc_msgSend(v11, sel_sendEvent_, v12);

LABEL_29:
}

void _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record8feedbackyAA0cD13FeedbackEventC_tFZ_0()
{
  id v0 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v1 = objc_msgSend(v0, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v2 = objc_msgSend(v1, sel_Feedback);
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v2, sel_source);

  id v4 = sub_25B3BF7DC();
  objc_msgSend(v3, sel_sendEvent_, v4);
}

uint64_t type metadata accessor for PeopleSuggesterMetricsManager()
{
  return self;
}

uint64_t type metadata accessor for PeopleSuggestionInference()
{
  return self;
}

unint64_t sub_25B3CA500(unint64_t result)
{
  if (result > 0x19) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model()
{
  return self;
}

uint64_t sub_25B3CA534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3CA59C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3467B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TrialIdentifier()
{
  return self;
}

unint64_t sub_25B3CA620()
{
  unint64_t result = qword_26A4FB7C0;
  if (!qword_26A4FB7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB7C0);
  }
  return result;
}

unint64_t sub_25B3CA674()
{
  unint64_t result = qword_26A4FB7C8;
  if (!qword_26A4FB7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB7C8);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions.PeopleSuggestion()
{
  return self;
}

unint64_t sub_25B3CA6EC()
{
  unint64_t result = qword_26A4FB7E0;
  if (!qword_26A4FB7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB7E0);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions()
{
  return self;
}

unint64_t sub_25B3CA764()
{
  unint64_t result = qword_26A4FB7F8;
  if (!qword_26A4FB7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB7F8);
  }
  return result;
}

unint64_t sub_25B3CA7B8()
{
  unint64_t result = qword_26A4FB800;
  if (!qword_26A4FB800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB800);
  }
  return result;
}

unint64_t sub_25B3CA80C()
{
  unint64_t result = qword_26A4FB810;
  if (!qword_26A4FB810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4FB808);
    sub_25B3CCC10(&qword_26A4FB818, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB810);
  }
  return result;
}

uint64_t type metadata accessor for AppSuggestions.AppSuggestion()
{
  return self;
}

unint64_t sub_25B3CA8D4()
{
  unint64_t result = qword_26A4FB848;
  if (!qword_26A4FB848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB848);
  }
  return result;
}

uint64_t type metadata accessor for AppSuggestions()
{
  return self;
}

unint64_t sub_25B3CA94C()
{
  unint64_t result = qword_26A4FB858;
  if (!qword_26A4FB858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB858);
  }
  return result;
}

unint64_t sub_25B3CA9A0()
{
  unint64_t result = qword_26A4FB868;
  if (!qword_26A4FB868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4FB860);
    sub_25B3CCC10(&qword_26A4FB870, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB868);
  }
  return result;
}

uint64_t sub_25B3CAA44(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079546C65646F6DLL && a2 == 0xE900000000000065;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025B3E1920 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6564496C61697274 && a2 == 0xEF7265696669746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B3CABAC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025B3E1840 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1802396018 && a2 == 0xE400000000000000 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_25B3CAD74(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65736E6F70736572 && a2 == 0xEC00000065707954;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B3CAE80(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025B3E1840 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1802396018 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B3CAFB4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25B3CB04C()
{
  return 0x6974736567677573;
}

unint64_t sub_25B3CB06C(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggesterFeedbackEvent()
{
  return self;
}

unint64_t sub_25B3CB0A0()
{
  unint64_t result = qword_26A4FB8C8;
  if (!qword_26A4FB8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB8C8);
  }
  return result;
}

unint64_t sub_25B3CB0F4()
{
  unint64_t result = qword_26A4FB8D0;
  if (!qword_26A4FB8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB8D0);
  }
  return result;
}

unint64_t sub_25B3CB148()
{
  unint64_t result = qword_26A4FB8E8;
  if (!qword_26A4FB8E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4FB8E0);
    sub_25B3CB1BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB8E8);
  }
  return result;
}

unint64_t sub_25B3CB1BC()
{
  unint64_t result = qword_26A4FB8F0;
  if (!qword_26A4FB8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB8F0);
  }
  return result;
}

unint64_t sub_25B3CB210()
{
  unint64_t result = qword_26A4FB918;
  if (!qword_26A4FB918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB918);
  }
  return result;
}

uint64_t sub_25B3CB264(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25B3CB270()
{
  unint64_t result = qword_26B346860;
  if (!qword_26B346860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B346858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B346860);
  }
  return result;
}

uint64_t sub_25B3CB2CC()
{
  return sub_25B3CCC10(&qword_26A4FB940, (void (*)(void))type metadata accessor for PeopleSuggesterFeedbackEvent);
}

uint64_t sub_25B3CB314()
{
  return sub_25B3CCC10(&qword_26A4FB948, (void (*)(void))type metadata accessor for PeopleSuggestionInference);
}

uint64_t sub_25B3CB35C(uint64_t a1)
{
  uint64_t result = sub_25B3CCC10(&qword_26A4FB950, (void (*)(void))type metadata accessor for PeopleSuggestionInference);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25B3CB3B4()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_25B3CB3C4()
{
  unint64_t result = qword_26A4FB958;
  if (!qword_26A4FB958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB958);
  }
  return result;
}

unint64_t sub_25B3CB41C()
{
  unint64_t result = qword_26A4FB960;
  if (!qword_26A4FB960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB960);
  }
  return result;
}

unint64_t sub_25B3CB474()
{
  unint64_t result = qword_26A4FB968;
  if (!qword_26A4FB968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB968);
  }
  return result;
}

unint64_t sub_25B3CB4CC()
{
  unint64_t result = qword_26A4FB970;
  if (!qword_26A4FB970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB970);
  }
  return result;
}

uint64_t sub_25B3CB520(uint64_t a1)
{
  uint64_t result = sub_25B3CCC10(&qword_26A4FB978, (void (*)(void))type metadata accessor for PeopleSuggesterFeedbackEvent);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for PeopleSuggestionInference(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggestionInference);
}

uint64_t dispatch thunk of PeopleSuggestionInference.__allocating_init(id:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PeopleSuggestions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggestions);
}

uint64_t dispatch thunk of PeopleSuggestions.__allocating_init(id:responseType:suggestions:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PeopleSuggestions.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

ValueMetadata *type metadata accessor for PeopleSuggestions.ResponseType()
{
  return &type metadata for PeopleSuggestions.ResponseType;
}

uint64_t method lookup function for PeopleSuggestions.PeopleSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggestions.PeopleSuggestion);
}

uint64_t dispatch thunk of PeopleSuggestions.PeopleSuggestion.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.ModelType()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.ModelType;
}

uint64_t method lookup function for PeopleSuggestions.PeopleSuggestion.Model(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggestions.PeopleSuggestion.Model);
}

uint64_t dispatch thunk of PeopleSuggestions.PeopleSuggestion.Model.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t method lookup function for AppSuggestions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSuggestions);
}

uint64_t dispatch thunk of AppSuggestions.__allocating_init(id:suggestions:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AppSuggestions.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t method lookup function for AppSuggestions.AppSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSuggestions.AppSuggestion);
}

uint64_t dispatch thunk of AppSuggestions.AppSuggestion.__allocating_init(transportBundleId:model:rank:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AppSuggestions.AppSuggestion.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t method lookup function for PeopleSuggesterFeedbackEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggesterFeedbackEvent);
}

uint64_t dispatch thunk of PeopleSuggesterFeedbackEvent.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.EngagementType()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.EngagementType;
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.Timeout()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.Timeout;
}

uint64_t method lookup function for TrialIdentifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TrialIdentifier);
}

uint64_t dispatch thunk of TrialIdentifier.__allocating_init(experiment:treatment:deployment:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TrialIdentifier.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

ValueMetadata *type metadata accessor for TrialIdentifier.CodingKeys()
{
  return &type metadata for TrialIdentifier.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterFeedbackEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggesterFeedbackEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3CBA48);
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

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.CodingKeys()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AppSuggestions.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AppSuggestions.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25B3CBB70);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B3CBB98()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppSuggestions.CodingKeys()
{
  return &type metadata for AppSuggestions.CodingKeys;
}

ValueMetadata *type metadata accessor for AppSuggestions.AppSuggestion.CodingKeys()
{
  return &type metadata for AppSuggestions.AppSuggestion.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggestions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3CBC8CLL);
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

ValueMetadata *type metadata accessor for PeopleSuggestions.CodingKeys()
{
  return &type metadata for PeopleSuggestions.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PeopleSuggestions.PeopleSuggestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PeopleSuggestions.PeopleSuggestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3CBE20);
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

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.CodingKeys()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys;
}

uint64_t _s15ReportingPlugin15TrialIdentifierC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15ReportingPlugin15TrialIdentifierC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3CBFB4);
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

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys;
}

unint64_t sub_25B3CBFF0()
{
  unint64_t result = qword_26A4FB980;
  if (!qword_26A4FB980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB980);
  }
  return result;
}

unint64_t sub_25B3CC048()
{
  unint64_t result = qword_26A4FB988;
  if (!qword_26A4FB988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB988);
  }
  return result;
}

unint64_t sub_25B3CC0A0()
{
  unint64_t result = qword_26A4FB990;
  if (!qword_26A4FB990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB990);
  }
  return result;
}

unint64_t sub_25B3CC0F8()
{
  unint64_t result = qword_26A4FB998;
  if (!qword_26A4FB998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB998);
  }
  return result;
}

unint64_t sub_25B3CC150()
{
  unint64_t result = qword_26A4FB9A0;
  if (!qword_26A4FB9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9A0);
  }
  return result;
}

unint64_t sub_25B3CC1A8()
{
  unint64_t result = qword_26A4FB9A8;
  if (!qword_26A4FB9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9A8);
  }
  return result;
}

unint64_t sub_25B3CC200()
{
  unint64_t result = qword_26A4FB9B0;
  if (!qword_26A4FB9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9B0);
  }
  return result;
}

unint64_t sub_25B3CC258()
{
  unint64_t result = qword_26A4FB9B8;
  if (!qword_26A4FB9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9B8);
  }
  return result;
}

unint64_t sub_25B3CC2B0()
{
  unint64_t result = qword_26A4FB9C0;
  if (!qword_26A4FB9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9C0);
  }
  return result;
}

unint64_t sub_25B3CC308()
{
  unint64_t result = qword_26A4FB9C8;
  if (!qword_26A4FB9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9C8);
  }
  return result;
}

unint64_t sub_25B3CC360()
{
  unint64_t result = qword_26A4FB9D0;
  if (!qword_26A4FB9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9D0);
  }
  return result;
}

unint64_t sub_25B3CC3B8()
{
  unint64_t result = qword_26A4FB9D8;
  if (!qword_26A4FB9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9D8);
  }
  return result;
}

unint64_t sub_25B3CC410()
{
  unint64_t result = qword_26A4FB9E0;
  if (!qword_26A4FB9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9E0);
  }
  return result;
}

unint64_t sub_25B3CC468()
{
  unint64_t result = qword_26A4FB9E8;
  if (!qword_26A4FB9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9E8);
  }
  return result;
}

unint64_t sub_25B3CC4C0()
{
  unint64_t result = qword_26A4FB9F0;
  if (!qword_26A4FB9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9F0);
  }
  return result;
}

unint64_t sub_25B3CC518()
{
  unint64_t result = qword_26A4FB9F8;
  if (!qword_26A4FB9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FB9F8);
  }
  return result;
}

unint64_t sub_25B3CC570()
{
  unint64_t result = qword_26A4FBA00;
  if (!qword_26A4FBA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA00);
  }
  return result;
}

unint64_t sub_25B3CC5C8()
{
  unint64_t result = qword_26A4FBA08;
  if (!qword_26A4FBA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA08);
  }
  return result;
}

unint64_t sub_25B3CC620()
{
  unint64_t result = qword_26A4FBA10;
  if (!qword_26A4FBA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA10);
  }
  return result;
}

unint64_t sub_25B3CC678()
{
  unint64_t result = qword_26A4FBA18;
  if (!qword_26A4FBA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA18);
  }
  return result;
}

unint64_t sub_25B3CC6D0()
{
  unint64_t result = qword_26A4FBA20;
  if (!qword_26A4FBA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA20);
  }
  return result;
}

uint64_t sub_25B3CC724(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025B3E1A40 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025B3E1A60 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000025B3E1A80 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000025B3E1AA0 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025B3E0800 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025B3E0820 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025B3E07E0 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7374756F656D6974 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_25B3CCAB0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D697265707865 && a2 == 0xEA0000000000746ELL;
  if (v3 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656D7461657274 && a2 == 0xE900000000000074 || (sub_25B3DD328() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D796F6C706564 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25B3DD328();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25B3CCC10(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B3CCC54()
{
  unint64_t result = qword_26A4FBA28;
  if (!qword_26A4FBA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA28);
  }
  return result;
}

unint64_t sub_25B3CCCA8()
{
  unint64_t result = qword_26A4FBA30;
  if (!qword_26A4FBA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA30);
  }
  return result;
}

unint64_t sub_25B3CCCFC()
{
  unint64_t result = qword_26A4FBA38;
  if (!qword_26A4FBA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA38);
  }
  return result;
}

unint64_t sub_25B3CCD50()
{
  unint64_t result = qword_26A4FBA40;
  if (!qword_26A4FBA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA40);
  }
  return result;
}

void sub_25B3CCDD0(uint64_t a1, void **a2, unint64_t *a3)
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
    sub_25B3D01B0(&v20, a2, a3);
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

void sub_25B3CCF74()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  char v12;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  void v24[2];

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (id v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    uint64_t v5 = v4;
    char v6 = *(void (**)(void *__return_ptr, void *))(v0 + 56);
    swift_retain();
    v6(v24, v5);
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v9 = v24[0];
    uint64_t v8 = v24[1];
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_25B3CD674(v9, v8, v7);
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      int64_t v11 = (uint64_t *)(v1 + 32);
      swift_beginAccess();
      if (!*(void *)(*(void *)(v1 + 32) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_25B3B2324(v9, v8),
            unint64_t v13 = v12,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v13 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v22 = *v11;
        *int64_t v11 = 0x8000000000000000;
        sub_25B3D8458(v3, v9, v8, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_25B3B6634, (void (*)(void))sub_25B3B2C78);
        *int64_t v11 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25B3DCD98();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B346958);
    swift_unknownObjectRetain_n();
    unint64_t v16 = sub_25B3DCD78();
    int64_t v17 = sub_25B3DCF68();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      int64_t v19 = swift_slowAlloc();
      v23[0] = v19;
      *(_DWORD *)id v18 = 136315138;
      swift_getObjectType();
      id v20 = sub_25B3DD458();
      sub_25B3B1CCC(v20, v21, v23);
      sub_25B3DD018();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25B39F000, v16, v17, "unexpected type %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v19, -1, -1);
      MEMORY[0x261163250](v18, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_25B3CD2E8()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t *v12;
  char v13;
  char v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  void v25[2];
  unsigned __int8 v26;

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (id v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    uint64_t v5 = v4;
    char v6 = *(void (**)(void *__return_ptr, void *))(v0 + 56);
    swift_retain();
    v6(v25, v5);
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v9 = v25[0];
    uint64_t v8 = v25[1];
    unint64_t v10 = v26;
    swift_bridgeObjectRetain();
    int64_t v11 = sub_25B3CD7AC(v9, v8, v10, v7);
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      int64_t v12 = (uint64_t *)(v1 + 32);
      swift_beginAccess();
      if (!*(void *)(*(void *)(v1 + 32) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_25B3B239C(v9, v8, v10),
            uint64_t v14 = v13,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v14 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v23 = *v12;
        *int64_t v12 = 0x8000000000000000;
        sub_25B3D85E4(v3, v9, v8, v10, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_25B3B7560, (void (*)(void))sub_25B3B553C);
        *int64_t v12 = v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    unint64_t v16 = sub_25B3DCD98();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B346958);
    swift_unknownObjectRetain_n();
    int64_t v17 = sub_25B3DCD78();
    id v18 = sub_25B3DCF68();
    if (os_log_type_enabled(v17, v18))
    {
      int64_t v19 = (uint8_t *)swift_slowAlloc();
      id v20 = swift_slowAlloc();
      v24[0] = v20;
      *(_DWORD *)int64_t v19 = 136315138;
      swift_getObjectType();
      id v21 = sub_25B3DD458();
      sub_25B3B1CCC(v21, v22, v24);
      sub_25B3DD018();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25B39F000, v17, v18, "unexpected type %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v20, -1, -1);
      MEMORY[0x261163250](v19, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_25B3CD674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25B3DD3C8();
    sub_25B3DCE18();
    uint64_t v6 = sub_25B3DD408();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      int64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25B3DD328() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25B3DD328() & 1) != 0) {
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

uint64_t sub_25B3CD7AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    sub_25B3DD3C8();
    swift_bridgeObjectRetain();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    sub_25B3DD3E8();
    uint64_t v8 = sub_25B3DD408();
    uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v10 = v8 & ~v9;
    uint64_t v11 = a4 + 56;
    if ((*(void *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
    {
      uint64_t v12 = ~v9;
      uint64_t v13 = *(void *)(a4 + 48);
      do
      {
        uint64_t v14 = v13 + 24 * v10;
        int v15 = *(unsigned __int8 *)(v14 + 16);
        if (*(void *)v14 == a1 && *(void *)(v14 + 8) == a2)
        {
          if (v15 == (a3 & 1)) {
            return 1;
          }
        }
        else if ((sub_25B3DD328() & 1) != 0 && ((v15 ^ a3) & 1) == 0)
        {
          return 1;
        }
        unint64_t v10 = (v10 + 1) & v12;
      }
      while (((*(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
  }
  return 0;
}

void sub_25B3CD8E8()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  char v12;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  void v24[2];

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (id v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void (**)(void *__return_ptr, void *))(v0 + 40);
    swift_retain();
    v6(v24, v5);
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v9 = v24[0];
    uint64_t v8 = v24[1];
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_25B3CD674(v9, v8, v7);
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (uint64_t *)(v1 + 24);
      swift_beginAccess();
      if (!*(void *)(*(void *)(v1 + 24) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_25B3B2324(v9, v8),
            uint64_t v13 = v12,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v13 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v22 = *v11;
        *uint64_t v11 = 0x8000000000000000;
        sub_25B3D8458(v3, v9, v8, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_25B3B6634, (void (*)(void))sub_25B3B2C78);
        *uint64_t v11 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    int v15 = sub_25B3DCD98();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B346958);
    swift_unknownObjectRetain_n();
    unint64_t v16 = sub_25B3DCD78();
    BOOL v17 = sub_25B3DCF68();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      int64_t v19 = swift_slowAlloc();
      v23[0] = v19;
      *(_DWORD *)id v18 = 136315138;
      swift_getObjectType();
      id v20 = sub_25B3DD458();
      sub_25B3B1CCC(v20, v21, v23);
      sub_25B3DD018();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25B39F000, v16, v17, "unexpected type %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v19, -1, -1);
      MEMORY[0x261163250](v18, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_25B3CDC5C()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t *v12;
  char v13;
  char v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  void v25[2];
  unsigned __int8 v26;

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (id v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void (**)(void *__return_ptr, void *))(v0 + 40);
    swift_retain();
    v6(v25, v5);
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v9 = v25[0];
    uint64_t v8 = v25[1];
    unint64_t v10 = v26;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25B3CD7AC(v9, v8, v10, v7);
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = (uint64_t *)(v1 + 24);
      swift_beginAccess();
      if (!*(void *)(*(void *)(v1 + 24) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_25B3B239C(v9, v8, v10),
            uint64_t v14 = v13,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v14 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v23 = *v12;
        *uint64_t v12 = 0x8000000000000000;
        sub_25B3D85E4(v3, v9, v8, v10, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_25B3B7560, (void (*)(void))sub_25B3B553C);
        *uint64_t v12 = v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_26B346880 != -1) {
      swift_once();
    }
    unint64_t v16 = sub_25B3DCD98();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B346958);
    swift_unknownObjectRetain_n();
    BOOL v17 = sub_25B3DCD78();
    id v18 = sub_25B3DCF68();
    if (os_log_type_enabled(v17, v18))
    {
      int64_t v19 = (uint8_t *)swift_slowAlloc();
      id v20 = swift_slowAlloc();
      v24[0] = v20;
      *(_DWORD *)int64_t v19 = 136315138;
      swift_getObjectType();
      id v21 = sub_25B3DD458();
      sub_25B3B1CCC(v21, v22, v24);
      sub_25B3DD018();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25B39F000, v17, v18, "unexpected type %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v20, -1, -1);
      MEMORY[0x261163250](v19, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

id sub_25B3CDFE8()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  id v12;
  void (*v13)(void *__return_ptr, void *);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void v21[3];
  uint64_t v22;
  void v23[2];

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2 || (v3 = v2, (id v4 = objc_msgSend(v2, sel_eventBody)) == 0))
  {
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void (**)(void *__return_ptr, void *))(v0 + 40);
  swift_retain();
  v6(v21, v5);
  swift_release();
  swift_beginAccess();
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v21[1];
  if (!*(void *)(v7 + 16))
  {

    swift_unknownObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = v21[0];
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_25B3B2324(v9, v8);
  if ((v11 & 1) == 0)
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v12 = *(id *)(*(void *)(v7 + 56) + 8 * v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void (**)(void *__return_ptr, void *))(v1 + 40);
  swift_retain();
  v13(v23, v5);
  swift_release();
  int v15 = v23[0];
  uint64_t v14 = v23[1];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_25B3D54BC(&v22, v15, v14);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  unint64_t v16 = (void *)sub_25B3D7894(v15, v14, (void (*)(void))sub_25B3B6634);
  swift_endAccess();

  swift_beginAccess();
  BOOL v17 = (void *)sub_25B3D7894(v15, v14, (void (*)(void))sub_25B3B6634);
  swift_endAccess();

  id v18 = objc_allocWithZone((Class)type metadata accessor for AppSuggestionsJointEvent(0));
  int64_t v19 = sub_25B3A5100(v3, v12);
  swift_bridgeObjectRelease();

  return v19;
}

id sub_25B3CE264()
{
  void (*v6)(void *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  void (*v14)(void *__return_ptr, void *);
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void v23[2];
  unsigned __int8 v24;
  unsigned char v25[8];
  void v26[2];
  unsigned __int8 v27;

  uint64_t v1 = v0;
  swift_unknownObjectRetain();
  self;
  int v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2 || (v3 = v2, (id v4 = objc_msgSend(v2, sel_eventBody)) == 0))
  {
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void (**)(void *__return_ptr, void *))(v0 + 40);
  swift_retain();
  v6(v23, v5);
  swift_release();
  swift_beginAccess();
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v23[1];
  if (!*(void *)(v7 + 16))
  {

    swift_unknownObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = v24;
  unint64_t v10 = v23[0];
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25B3B239C(v10, v8, v9);
  if ((v12 & 1) == 0)
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v13 = *(id *)(*(void *)(v7 + 56) + 8 * v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void (**)(void *__return_ptr, void *))(v1 + 40);
  swift_retain();
  v14(v26, v5);
  swift_release();
  unint64_t v16 = v26[0];
  int v15 = v26[1];
  BOOL v17 = v27;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_25B3D595C((uint64_t)v25, v16, v15, v17);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  id v18 = (void *)sub_25B3D7A68(v16, v15, v17, (void (*)(void))sub_25B3B7560);
  swift_endAccess();

  swift_beginAccess();
  int64_t v19 = (void *)sub_25B3D7A68(v16, v15, v17, (void (*)(void))sub_25B3B7560);
  swift_endAccess();

  id v20 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggestionsJointEvent(0));
  id v21 = sub_25B3D1064(v3, (uint64_t)v13);
  swift_bridgeObjectRelease();

  return v21;
}

uint64_t sub_25B3CE500(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v27 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_25B3DD0C8();
  }
  else {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v32 = MEMORY[0x263F8EE78];
    sub_25B3B7C00(0, v2 & ~(v2 >> 63), 0);
    if (v27)
    {
      uint64_t result = sub_25B3DD068();
      unsigned __int8 v6 = 1;
    }
    else
    {
      uint64_t result = sub_25B3C73FC(v1);
      unsigned __int8 v6 = v7 & 1;
    }
    uint64_t v29 = result;
    uint64_t v30 = v4;
    unsigned __int8 v31 = v6;
    if (v2 < 0)
    {
      __break(1u);
LABEL_23:
      __break(1u);
    }
    else
    {
      uint64_t v26 = v1;
      do
      {
        while (1)
        {
          uint64_t v14 = v29;
          uint64_t v13 = v30;
          uint64_t v15 = v31;
          sub_25B3C7160(v29, v30, v31, v1, v5);
          BOOL v17 = (void *)v16;
          uint64_t v18 = sub_25B3D2E9C(v16);
          uint64_t v20 = v19;

          uint64_t v21 = v32;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = sub_25B3B7C00(0, *(void *)(v21 + 16) + 1, 1);
            uint64_t v21 = v32;
          }
          unint64_t v23 = *(void *)(v21 + 16);
          unint64_t v22 = *(void *)(v21 + 24);
          if (v23 >= v22 >> 1)
          {
            uint64_t result = sub_25B3B7C00(v22 > 1, v23 + 1, 1);
            uint64_t v21 = v32;
          }
          *(void *)(v21 + 16) = v23 + 1;
          uint64_t v24 = v21 + 16 * v23;
          *(void *)(v24 + 32) = v18;
          *(void *)(v24 + 40) = v20;
          if (v27) {
            break;
          }
          uint64_t v1 = v26;
          uint64_t v8 = sub_25B3C7078(v14, v13, v15, v26);
          uint64_t v10 = v9;
          char v12 = v11;
          sub_25B3CB264(v14, v13, v15);
          uint64_t v29 = v8;
          uint64_t v30 = v10;
          unsigned __int8 v31 = v12 & 1;
          if (!--v2) {
            goto LABEL_20;
          }
        }
        uint64_t v1 = v26;
        if ((v15 & 1) == 0) {
          goto LABEL_23;
        }
        if (sub_25B3DD088()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB40);
        uint64_t v25 = (void (*)(unsigned char *, void))sub_25B3DCF38();
        sub_25B3DD118();
        v25(v28, 0);
        --v2;
      }
      while (v2);
LABEL_20:
      sub_25B3CB264(v29, v30, v31);
      return v32;
    }
  }
  return result;
}

void sub_25B3CE76C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1;
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_25B3B7C00(0, v1, 0);
    uint64_t v4 = sub_25B3D8BFC(v2);
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 64;
    uint64_t v23 = v2 + 80;
    int64_t v24 = v1;
    int v25 = v3;
    uint64_t v26 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(v2 + 32))
    {
      unint64_t v9 = (unint64_t)v4 >> 6;
      if ((*(void *)(v6 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_23;
      }
      if (*(_DWORD *)(v2 + 36) != v3) {
        goto LABEL_24;
      }
      uint64_t v27 = v5;
      id v10 = *(id *)(*(void *)(v2 + 48) + 8 * v4);
      uint64_t v11 = sub_25B3D2F30((uint64_t)v10);
      uint64_t v13 = v12;

      uint64_t v14 = v2;
      unint64_t v16 = *(void *)(v28 + 16);
      unint64_t v15 = *(void *)(v28 + 24);
      if (v16 >= v15 >> 1) {
        sub_25B3B7C00(v15 > 1, v16 + 1, 1);
      }
      *(void *)(v28 + 16) = v16 + 1;
      uint64_t v17 = v28 + 16 * v16;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v13;
      int64_t v7 = 1 << *(unsigned char *)(v14 + 32);
      if (v4 >= v7) {
        goto LABEL_25;
      }
      uint64_t v6 = v26;
      uint64_t v18 = *(void *)(v26 + 8 * v9);
      if ((v18 & (1 << v4)) == 0) {
        goto LABEL_26;
      }
      uint64_t v2 = v14;
      int v3 = v25;
      if (*(_DWORD *)(v14 + 36) != v25) {
        goto LABEL_27;
      }
      unint64_t v19 = v18 & (-2 << (v4 & 0x3F));
      if (v19)
      {
        int64_t v7 = __clz(__rbit64(v19)) | v4 & 0xFFFFFFFFFFFFFFC0;
        int64_t v8 = v24;
      }
      else
      {
        unint64_t v20 = v9 + 1;
        unint64_t v21 = (unint64_t)(v7 + 63) >> 6;
        int64_t v8 = v24;
        if (v9 + 1 < v21)
        {
          unint64_t v22 = *(void *)(v26 + 8 * v20);
          if (v22)
          {
LABEL_20:
            int64_t v7 = __clz(__rbit64(v22)) + (v20 << 6);
          }
          else
          {
            while (v21 - 2 != v9)
            {
              unint64_t v22 = *(void *)(v23 + 8 * v9++);
              if (v22)
              {
                unint64_t v20 = v9 + 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
      uint64_t v5 = v27 + 1;
      uint64_t v4 = v7;
      if (v27 + 1 == v8) {
        return;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
}

uint64_t collectPeopleSuggestionEvents()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBA50);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)&v42 - v8;
  MEMORY[0x270FA5388](v7);
  char v46 = (char *)&v42 - v10;
  id v11 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(v12, sel_Inference);
  swift_unknownObjectRelease();
  id v14 = objc_msgSend(v13, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  unint64_t v15 = v14;
  id v16 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v16, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v18 = objc_msgSend(v17, sel_Feedback);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB4A0);
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = MEMORY[0x263F8EE88];
  unint64_t v20 = MEMORY[0x263F8EE78];
  void v19[3] = sub_25B3A642C(MEMORY[0x263F8EE78]);
  v19[4] = sub_25B3A642C(v20);
  v19[5] = sub_25B3CFB0C;
  v19[6] = 0;
  v19[7] = sub_25B3CFED8;
  v19[8] = 0;
  uint64_t v49 = v19;
  sub_25B3A393C(v15, v18, &v49, (uint64_t)v9);
  unint64_t v21 = *(void (**)(void))(v3 + 32);
  id v44 = v18;
  unint64_t v22 = v46;
  v21();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v20;
  id v43 = (uint64_t *)(v23 + 16);
  uint64_t v24 = swift_allocObject();
  unint64_t v45 = a1;
  uint64_t v25 = v2;
  *(void *)(v24 + 16) = v20;
  uint64_t v26 = (void **)(v24 + 16);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v22, v25);
  sub_25B3D0154();
  id v42 = v15;
  swift_retain();
  swift_retain();

  swift_release();
  swift_release();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v6, v25);
  v48[0] = v20;
  swift_beginAccess();
  uint64_t v28 = swift_bridgeObjectRetain();
  sub_25B3CCDD0(v28, v26, v48);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v29 = swift_bridgeObjectRetain();
  unint64_t v30 = sub_25B3A82C8(v29);
  swift_bridgeObjectRelease();
  unint64_t v31 = sub_25B3D0590(v30);
  uint64_t v33 = v32;
  swift_release();
  unint64_t v47 = v31;
  swift_beginAccess();
  sub_25B3A4974(v33);
  swift_endAccess();
  sub_25B3D3878(v48);
  sub_25B3A6A7C((uint64_t *)&v47);

  uint64_t v34 = v25;
  uint64_t v35 = v45;
  v27(v46, v34);
  swift_release();
  unint64_t v36 = v43;
  swift_beginAccess();
  uint64_t v37 = *v36;
  unint64_t v38 = v48[0];
  uint64_t v39 = v47;
  id v40 = *v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t result = swift_release();
  *uint64_t v35 = v37;
  v35[1] = v38;
  v35[2] = v39;
  _OWORD v35[3] = v40;
  return result;
}

uint64_t sub_25B3CEEF0()
{
  uint64_t v1 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B3DCC98();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v36 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v31 - v9;
  unint64_t v11 = *v0;
  unint64_t v12 = v0[1];
  int64_t v13 = *(void *)(v12 + 16);
  uint64_t v14 = MEMORY[0x263F8EE78];
  unint64_t v35 = *v0;
  if (v13)
  {
    uint64_t v37 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25B3B7AD4(0, v13, 0);
    uint64_t v15 = *(unsigned __int8 *)(v2 + 80);
    v31[1] = v12;
    uint64_t v16 = v12 + ((v15 + 32) & ~v15);
    uint64_t v17 = *(void *)(v2 + 72);
    uint64_t v33 = v6 + 32;
    unint64_t v34 = v5;
    uint64_t v32 = v17;
    do
    {
      sub_25B3D911C(v16, (uint64_t)v4);
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v4, v5);
      sub_25B3D9180((uint64_t)v4);
      uint64_t v18 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25B3B7AD4(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v17 = v32;
        uint64_t v18 = v37;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      unint64_t v19 = *(void *)(v18 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_25B3B7AD4(v19 > 1, v20 + 1, 1);
        uint64_t v17 = v32;
        uint64_t v18 = v37;
      }
      *(void *)(v18 + 16) = v20 + 1;
      unint64_t v21 = v18
          + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
          + *(void *)(v6 + 72) * v20;
      uint64_t v5 = v34;
      (*(void (**)(unint64_t, char *, unint64_t))(v6 + 32))(v21, v10, v34);
      uint64_t v37 = v18;
      v16 += v17;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    unint64_t v11 = v35;
    uint64_t v14 = MEMORY[0x263F8EE78];
    if (!(v35 >> 62))
    {
LABEL_9:
      uint64_t v22 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22) {
        goto LABEL_10;
      }
LABEL_21:
      swift_bridgeObjectRelease();
      uint64_t v26 = MEMORY[0x263F8EE78];
LABEL_22:
      uint64_t v37 = v18;
      sub_25B3A4AD8(v26);
      return v37;
    }
  }
  else
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    if (!(v11 >> 62)) {
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_25B3DD248();
  if (!v22) {
    goto LABEL_21;
  }
LABEL_10:
  uint64_t v33 = v22;
  uint64_t v37 = v14;
  uint64_t result = sub_25B3B7AD4(0, v22 & ~(v22 >> 63), 0);
  uint64_t v24 = v33;
  if ((v33 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = 0;
    uint64_t v26 = v37;
    unint64_t v34 = v11 & 0xC000000000000001;
    uint64_t v27 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    do
    {
      if (v34)
      {
        uint64_t v28 = MEMORY[0x2611628B0](v25, v11);
        (*v27)(v36, v28 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp, v5);
        uint64_t v24 = v33;
        swift_unknownObjectRelease();
      }
      else
      {
        (*v27)(v36, *(void *)(v11 + 8 * v25 + 32) + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp, v5);
      }
      uint64_t v37 = v26;
      unint64_t v30 = *(void *)(v26 + 16);
      unint64_t v29 = *(void *)(v26 + 24);
      if (v30 >= v29 >> 1)
      {
        sub_25B3B7AD4(v29 > 1, v30 + 1, 1);
        uint64_t v24 = v33;
        uint64_t v26 = v37;
      }
      ++v25;
      *(void *)(v26 + 16) = v30 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v26+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v30, v36, v5);
      unint64_t v11 = v35;
    }
    while (v24 != v25);
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

id PeopleSuggestionInferenceEventTimestamped.event.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) + 20));
  return v1;
}

uint64_t sub_25B3CF380(uint64_t a1)
{
  unint64_t v2 = sub_25B3D4398();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3CF3BC(uint64_t a1)
{
  unint64_t v2 = sub_25B3D4398();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PeopleSuggestionInferenceEventTimestamped.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBA60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3D4398();
  sub_25B3DD428();
  char v12 = 0;
  sub_25B3DCC98();
  sub_25B3D43EC(&qword_26A4FB3F0, MEMORY[0x263F07490]);
  sub_25B3DD2E8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + *(int *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for PeopleSuggestions();
    sub_25B3D43EC(&qword_26A4FBA70, (void (*)(uint64_t))type metadata accessor for PeopleSuggestions);
    sub_25B3DD2E8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3CF5FC(void *a1)
{
  return PeopleSuggestionInferenceEventTimestamped.encode(to:)(a1);
}

id PeopleSuggesterFeedbackEventTimestamped.event.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0) + 20));
  return v1;
}

uint64_t sub_25B3CF650(uint64_t a1)
{
  unint64_t v2 = sub_25B3D4454();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B3CF68C(uint64_t a1)
{
  unint64_t v2 = sub_25B3D4454();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PeopleSuggesterFeedbackEventTimestamped.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBA78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B3D4454();
  sub_25B3DD428();
  char v12 = 0;
  sub_25B3DCC98();
  sub_25B3D43EC(&qword_26A4FB3F0, MEMORY[0x263F07490]);
  sub_25B3DD2E8();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + *(int *)(type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for PeopleSuggesterFeedbackEvent();
    sub_25B3D43EC(&qword_26A4FBA88, (void (*)(uint64_t))type metadata accessor for PeopleSuggesterFeedbackEvent);
    sub_25B3DD2E8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25B3CF8CC(void *a1)
{
  return PeopleSuggesterFeedbackEventTimestamped.encode(to:)(a1);
}

uint64_t PeopleSuggestionsJoiningResult.unmatchedInferenceEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggestionsJoiningResult.unmatchedFeedbackEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggestionsJoiningResult.errors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B3CF8FC(void *a1)
{
  uint64_t v2 = sub_25B3DCCC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_responseType) != 2) {
    objc_msgSend(a1, sel_responseType);
  }
  id v6 = objc_msgSend(a1, sel_identifier);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_25B3DCDE8();
  }
  else
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25B3DCD98();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B346958);
    uint64_t v10 = sub_25B3DCD78();
    os_log_type_t v11 = sub_25B3DCF78();
    if (os_log_type_enabled(v10, v11))
    {
      char v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v12 = 0;
      _os_log_impl(&dword_25B39F000, v10, v11, "missing ps identifier", v12, 2u);
      MEMORY[0x261163250](v12, -1, -1);
    }

    sub_25B3DCCB8();
    uint64_t v8 = sub_25B3DCCA8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v8;
}

uint64_t sub_25B3CFB0C@<X0>(uint64_t a1@<X8>)
{
  return sub_25B3CFEF0((uint64_t (*)(void))sub_25B3CF8FC, a1);
}

uint64_t sub_25B3CFB24(void *a1)
{
  uint64_t v2 = sub_25B3DCCC8();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v29 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(a1, sel_timeouts);
  sub_25B3BD648(0, &qword_26B346810);
  unint64_t v5 = sub_25B3DCE88();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25B3DD248();
    if (v6) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_15;
  }
LABEL_3:
  if (v6 < 1)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_once();
    goto LABEL_30;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x2611628B0](v7, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * v7 + 32);
    }
    uint64_t v10 = v9;
    unsigned int v11 = objc_msgSend(v9, sel_occurrence);

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_25B3B1BBC(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v13 = *((void *)v8 + 2);
    unint64_t v12 = *((void *)v8 + 3);
    if (v13 >= v12 >> 1) {
      uint64_t v8 = sub_25B3B1BBC((char *)(v12 > 1), v13 + 1, 1, v8);
    }
    ++v7;
    *((void *)v8 + 2) = v13 + 1;
    *(_DWORD *)&v8[4 * v13 + 32] = v11;
  }
  while (v6 != v7);
LABEL_16:
  swift_bridgeObjectRelease_n();
  uint64_t v14 = *((void *)v8 + 2);
  if (v14 && *((_DWORD *)v8 + 8) != 1 && v14 != 1)
  {
    uint64_t v15 = 9;
    while (1)
    {
      uint64_t v16 = v15 - 7;
      if (__OFADD__(v15 - 8, 1)) {
        break;
      }
      int v17 = *(_DWORD *)&v8[4 * v15++];
      if (v17 == 1 || v16 == v14) {
        goto LABEL_27;
      }
    }
    __break(1u);
    goto LABEL_35;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(a1, sel_identifier);
  if (v19)
  {
    unint64_t v20 = v19;
    uint64_t v21 = sub_25B3DCDE8();

    return v21;
  }
  if (qword_26B346880 != -1) {
    goto LABEL_36;
  }
LABEL_30:
  uint64_t v22 = sub_25B3DCD98();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B346958);
  uint64_t v23 = sub_25B3DCD78();
  os_log_type_t v24 = sub_25B3DCF78();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_25B39F000, v23, v24, "missing feedback identifier", v25, 2u);
    MEMORY[0x261163250](v25, -1, -1);
  }

  uint64_t v26 = v29;
  sub_25B3DCCB8();
  uint64_t v21 = sub_25B3DCCA8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v31);
  return v21;
}

uint64_t sub_25B3CFED8@<X0>(uint64_t a1@<X8>)
{
  return sub_25B3CFEF0((uint64_t (*)(void))sub_25B3CFB24, a1);
}

uint64_t sub_25B3CFEF0@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_25B3CFF24()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25B3CFF5C(void *a1, uint64_t a2)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    uint64_t v4 = (void **)(a2 + 16);
    id v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      uint64_t v6 = v5;
      swift_beginAccess();
      uint64_t v7 = *v4;
      id v8 = v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v7 = sub_25B3B1358(0, v7[2] + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        uint64_t v7 = sub_25B3B1358((void *)(v10 > 1), v11 + 1, 1, v7);
        *uint64_t v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();
    }
    else
    {
      sub_25B3A9794();
      uint64_t v12 = swift_allocError();
      *(void *)uint64_t v13 = 0xD00000000000003ELL;
      *(void *)(v13 + 8) = 0x800000025B3E2060;
      *(unsigned char *)(v13 + 16) = 1;
      swift_beginAccess();
      uint64_t v14 = *v4;
      char v15 = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v4 = v14;
      if ((v15 & 1) == 0)
      {
        uint64_t v14 = sub_25B3B1358(0, v14[2] + 1, 1, v14);
        *uint64_t v4 = v14;
      }
      unint64_t v17 = v14[2];
      unint64_t v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        uint64_t v14 = sub_25B3B1358((void *)(v16 > 1), v17 + 1, 1, v14);
        *uint64_t v4 = v14;
      }
      v14[2] = v17 + 1;
      v14[v17 + 4] = v12;
      swift_endAccess();
    }
  }
}

void sub_25B3D014C(void *a1)
{
  sub_25B3CFF5C(a1, v1);
}

unint64_t sub_25B3D0154()
{
  unint64_t result = qword_26A4FBA58;
  if (!qword_26A4FBA58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4FBA50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA58);
  }
  return result;
}

void sub_25B3D01B0(id *a1, void **a2, unint64_t *a3)
{
  uint64_t v7 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *a1;
  id v12 = objc_msgSend(*a1, sel_eventBody);
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = sub_25B3C98A0(v12);
    if (v3)
    {
      swift_beginAccess();
      char v15 = *a2;
      id v16 = v3;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        char v15 = sub_25B3B1358(0, v15[2] + 1, 1, v15);
        *a2 = v15;
      }
      unint64_t v19 = v15[2];
      unint64_t v18 = v15[3];
      if (v19 >= v18 >> 1)
      {
        char v15 = sub_25B3B1358((void *)(v18 > 1), v19 + 1, 1, v15);
        *a2 = v15;
      }
      v15[2] = v19 + 1;
      v15[v19 + 4] = v3;
      swift_endAccess();
    }
    else
    {
      uint64_t v28 = v14;
      objc_msgSend(v11, sel_timestamp);
      sub_25B3DCC28();
      *(void *)&v10[*(int *)(v7 + 20)] = v28;
      unint64_t v29 = *a3;
      id v30 = v28;
      char v31 = swift_isUniquelyReferenced_nonNull_native();
      *a3 = v29;
      if ((v31 & 1) == 0)
      {
        unint64_t v29 = sub_25B3B1928(0, *(void *)(v29 + 16) + 1, 1, v29);
        *a3 = v29;
      }
      unint64_t v33 = *(void *)(v29 + 16);
      unint64_t v32 = *(void *)(v29 + 24);
      if (v33 >= v32 >> 1)
      {
        unint64_t v29 = sub_25B3B1928(v32 > 1, v33 + 1, 1, v29);
        *a3 = v29;
      }
      *(void *)(v29 + 16) = v33 + 1;
      sub_25B3D91DC((uint64_t)v10, v29+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v33, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
    }
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    sub_25B3DD168();
    sub_25B3DCE28();
    swift_getObjectType();
    sub_25B3DD458();
    sub_25B3DCE28();
    swift_bridgeObjectRelease();
    sub_25B3DCE28();
    objc_msgSend(v11, sel_timestamp);
    sub_25B3DCEF8();
    uint64_t v20 = v35;
    unint64_t v21 = v36;
    sub_25B3A9794();
    uint64_t v22 = swift_allocError();
    *(void *)uint64_t v23 = v20;
    *(void *)(v23 + 8) = v21;
    *(unsigned char *)(v23 + 16) = 0;
    swift_beginAccess();
    os_log_type_t v24 = *a2;
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v24;
    if ((v25 & 1) == 0)
    {
      os_log_type_t v24 = sub_25B3B1358(0, v24[2] + 1, 1, v24);
      *a2 = v24;
    }
    unint64_t v27 = v24[2];
    unint64_t v26 = v24[3];
    if (v27 >= v26 >> 1)
    {
      os_log_type_t v24 = sub_25B3B1358((void *)(v26 > 1), v27 + 1, 1, v24);
      *a2 = v24;
    }
    v24[2] = v27 + 1;
    v24[v27 + 4] = v22;
    swift_endAccess();
  }
}

unint64_t sub_25B3D0590(unint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0);
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_25B3DD248())
  {
    uint64_t v6 = 0;
    unint64_t v31 = a1 & 0xC000000000000001;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    v26[1] = 0x800000025B3E0C60;
    unint64_t v8 = MEMORY[0x263F8EE78];
    unint64_t v30 = a1;
LABEL_4:
    unint64_t v27 = v7;
    uint64_t v9 = v6;
    while (1)
    {
      id v10 = v31 ? (id)MEMORY[0x2611628B0](v9, a1) : *(id *)(a1 + 8 * v9 + 32);
      id v11 = v10;
      uint64_t v6 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      id v12 = objc_msgSend(v10, sel_eventBody);
      if (!v12)
      {
        uint64_t v32 = 0;
        unint64_t v33 = 0xE000000000000000;
        sub_25B3DD168();
        sub_25B3DCE28();
        swift_getObjectType();
        sub_25B3DD458();
        sub_25B3DCE28();
        swift_bridgeObjectRelease();
        sub_25B3DCE28();
        objc_msgSend(v11, sel_timestamp);
        sub_25B3DCEF8();
        uint64_t v17 = v32;
        unint64_t v18 = v33;
        sub_25B3A9794();
        uint64_t v19 = swift_allocError();
        *(void *)uint64_t v20 = v17;
        *(void *)(v20 + 8) = v18;
        *(unsigned char *)(v20 + 16) = 0;
        unint64_t v21 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v21 = sub_25B3B1358(0, v21[2] + 1, 1, v21);
        }
        unint64_t v23 = v21[2];
        unint64_t v22 = v21[3];
        os_log_type_t v24 = v21;
        if (v23 >= v22 >> 1) {
          os_log_type_t v24 = sub_25B3B1358((void *)(v22 > 1), v23 + 1, 1, v21);
        }
        uint64_t v7 = v24;
        v24[2] = v23 + 1;
        v24[v23 + 4] = v19;

        a1 = v30;
        if (v6 == v5)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return v8;
        }
        goto LABEL_4;
      }
      uint64_t v13 = v12;
      id v14 = sub_25B3C808C(v12);
      objc_msgSend(v11, sel_timestamp);
      sub_25B3DCC28();
      *(void *)&v4[*(int *)(v29 + 20)] = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v8 = sub_25B3B1324(0, *(void *)(v8 + 16) + 1, 1, v8);
      }
      unint64_t v16 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 24);
      if (v16 >= v15 >> 1) {
        unint64_t v8 = sub_25B3B1324(v15 > 1, v16 + 1, 1, v8);
      }
      *(void *)(v8 + 16) = v16 + 1;
      sub_25B3D91DC((uint64_t)v4, v8+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v16, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);

      ++v9;
      a1 = v30;
      if (v6 == v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25B3D09FC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
  if (v2)
  {
    uint64_t v3 = *v1;
    BOOL v4 = *v1 == 0x6B6361626C6C6166 && v2 == 0xE800000000000000;
    if (v4
      || (sub_25B3DD328() & 1) != 0
      || (v3 == 0x646568636163 ? (BOOL v5 = v2 == 0xE600000000000000) : (BOOL v5 = 0), v5 || (sub_25B3DD328() & 1) != 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346850);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_25B3DFC70;
      if (qword_26A4FB1C0 != -1) {
        swift_once();
      }
      uint64_t v8 = qword_26A4FF4B0;
      uint64_t v7 = *(void *)algn_26A4FF4B8;
      uint64_t v9 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
      id v10 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      id v11 = objc_allocWithZone(v10);
      id v12 = (char *)objc_allocWithZone(v10);
      uint64_t v13 = &v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(void *)uint64_t v13 = 0;
      v13[8] = 1;
      id v14 = (uint64_t *)&v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *id v14 = v8;
      v14[1] = v7;
      *(void *)&v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v9;
      v38.receiver = v12;
      v38.super_class = v10;
      swift_bridgeObjectRetain();
      id v15 = v9;
      id v16 = objc_msgSendSuper2(&v38, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(void *)(v6 + 32) = v16;
      if (qword_26A4FB1C8 != -1) {
        swift_once();
      }
      uint64_t v18 = qword_26A4FF4C0;
      uint64_t v17 = *(void *)algn_26A4FF4C8;
      id v19 = objc_allocWithZone(v10);
      uint64_t v20 = (char *)objc_allocWithZone(v10);
      unint64_t v21 = &v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(void *)unint64_t v21 = 0;
      v21[8] = 1;
      unint64_t v22 = (uint64_t *)&v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *unint64_t v22 = v18;
      v22[1] = v17;
      *(void *)&v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v9;
      v37.receiver = v20;
      v37.super_class = v10;
      id v23 = v15;
      swift_bridgeObjectRetain();
      id v24 = objc_msgSendSuper2(&v37, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(void *)(v6 + 40) = v24;
LABEL_17:
      uint64_t v39 = v6;
      sub_25B3DCEA8();
      return v39;
    }
    BOOL v26 = v3 == 0x656C626D65736E65 && v2 == 0xE800000000000000;
    if (v26 || (sub_25B3DD328() & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346850);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_25B3DFC60;
      if (qword_26A4FB1C0 != -1) {
        swift_once();
      }
      uint64_t v28 = qword_26A4FF4B0;
      uint64_t v27 = *(void *)algn_26A4FF4B8;
      uint64_t v29 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
      unint64_t v30 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      id v31 = objc_allocWithZone(v30);
      uint64_t v32 = (char *)objc_allocWithZone(v30);
      unint64_t v33 = &v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(void *)unint64_t v33 = 0;
      v33[8] = 1;
      uint64_t v34 = (uint64_t *)&v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      uint64_t *v34 = v28;
      v34[1] = v27;
      *(void *)&v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v29;
      v40.receiver = v32;
      v40.super_class = v30;
      swift_bridgeObjectRetain();
      id v35 = v29;
      id v36 = objc_msgSendSuper2(&v40, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(void *)(v6 + 32) = v36;
      goto LABEL_17;
    }
  }
  return MEMORY[0x263F8EE78];
}

id PeopleSuggestionsJointEvent.__allocating_init(timestamp:engagement:inferenceModels:engagedModelRanks:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  id v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
  uint64_t v11 = sub_25B3DCC98();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a1, v11);
  *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = a2;
  *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = a3;
  *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = a4;
  v15.receiver = v9;
  v15.super_class = v4;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v13;
}

id PeopleSuggestionsJointEvent.init(timestamp:engagement:inferenceModels:engagedModelRanks:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = &v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
  uint64_t v10 = sub_25B3DCC98();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  *(void *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = a2;
  *(void *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = a3;
  *(void *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for PeopleSuggestionsJointEvent(0);
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v12;
}

id sub_25B3D1064(id a1, uint64_t a2)
{
  BOOL v5 = (void *)sub_25B3DCC98();
  uint64_t v6 = *(v5 - 1);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2;
  id v10 = objc_msgSend(a1, sel_eventBody);
  if (!v10)
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25B3DCD98();
    __swift_project_value_buffer(v23, (uint64_t)qword_26B346958);
    id v24 = a1;
    char v25 = sub_25B3DCD78();
    os_log_type_t v26 = sub_25B3DCF78();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134217984;
      objc_msgSend(v24, sel_timestamp);
      uint64_t v49 = v28;
      sub_25B3DD018();

      _os_log_impl(&dword_25B39F000, v25, v26, "no people suggestions inference at %f", v27, 0xCu);
      MEMORY[0x261163250](v27, -1, -1);
    }
    else
    {
    }
LABEL_17:

    goto LABEL_19;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend((id)a2, sel_eventBody);
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(a1, sel_timestamp);
    sub_25B3DCC28();
    uint64_t v14 = (uint64_t)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
    (*(void (**)(char *, char *, void *))(v6 + 32))(&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp], v8, v5);
    unsigned int v15 = objc_msgSend(v13, sel_engagementType);
    id v45 = a1;
    uint64_t v16 = 0;
    switch(v15)
    {
      case 0u:
        if (qword_26B346880 != -1) {
          goto LABEL_54;
        }
        goto LABEL_5;
      case 1u:
        goto LABEL_32;
      case 2u:
        uint64_t v16 = 1;
        goto LABEL_32;
      case 3u:
        uint64_t v16 = 2;
        goto LABEL_32;
      case 4u:
        uint64_t v16 = 4;
        goto LABEL_32;
      case 5u:
        uint64_t v16 = 3;
        goto LABEL_32;
      case 6u:
        uint64_t v16 = 5;
        goto LABEL_32;
      case 7u:
        uint64_t v16 = 6;
LABEL_32:
        *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = v16;
        if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25B3DD248()) {
          sub_25B3D8C84(MEMORY[0x263F8EE78]);
        }
        else {
          uint64_t v37 = MEMORY[0x263F8EE88];
        }
        uint64_t v49 = v37;
        uint64_t v48 = MEMORY[0x263F8EE80];
        char v38 = objc_msgSend(v11, sel_responseType) == 2
           || objc_msgSend(v11, sel_responseType) == 3;
        BOOL v5 = objc_msgSend(v11, sel_peopleSuggestions, a2);
        sub_25B3BD648(0, &qword_26B346848);
        uint64_t v14 = sub_25B3DCE88();

        if ((unint64_t)v14 >> 62)
        {
          if (v14 < 0) {
            BOOL v5 = (void *)v14;
          }
          else {
            BOOL v5 = (void *)(v14 & 0xFFFFFFFFFFFFFF8);
          }
          swift_bridgeObjectRetain();
          a2 = sub_25B3DD248();
          if (a2) {
            goto LABEL_39;
          }
        }
        else
        {
          a2 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (a2)
          {
LABEL_39:
            if (a2 >= 1)
            {
              uint64_t v39 = 0;
              do
              {
                if ((v14 & 0xC000000000000001) != 0) {
                  id v40 = (id)MEMORY[0x2611628B0](v39, v14);
                }
                else {
                  id v40 = *(id *)(v14 + 8 * v39 + 32);
                }
                uint64_t v41 = v40;
                ++v39;
                unint64_t v47 = v40;
                sub_25B3D185C(&v47, v13, v38, (uint64_t)&v49, &v48);
              }
              while (a2 != v39);
              goto LABEL_51;
            }
            __break(1u);
LABEL_54:
            swift_once();
LABEL_5:
            uint64_t v17 = sub_25B3DCD98();
            __swift_project_value_buffer(v17, (uint64_t)qword_26B346958);
            uint64_t v18 = sub_25B3DCD78();
            os_log_type_t v19 = sub_25B3DCF68();
            if (os_log_type_enabled(v18, v19))
            {
              uint64_t v20 = a2;
              unint64_t v21 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v21 = 0;
              unint64_t v22 = "unexpected unknown engagement type";
LABEL_24:
              _os_log_impl(&dword_25B39F000, v18, v19, v22, v21, 2u);
              MEMORY[0x261163250](v21, -1, -1);
              a2 = v20;
              a1 = v45;
            }
LABEL_25:

            (*(void (**)(uint64_t, void *))(v6 + 8))(v14, v5);
            goto LABEL_17;
          }
        }
LABEL_51:

        swift_bridgeObjectRelease_n();
        *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = v49;
        *(void *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = v48;

        id v42 = (objc_class *)type metadata accessor for PeopleSuggestionsJointEvent(0);
        v46.receiver = v9;
        v46.super_class = v42;
        id v35 = objc_msgSendSuper2(&v46, sel_init);

        return v35;
      default:
        if (qword_26B346880 != -1) {
          swift_once();
        }
        uint64_t v36 = sub_25B3DCD98();
        __swift_project_value_buffer(v36, (uint64_t)qword_26B346958);
        uint64_t v18 = sub_25B3DCD78();
        os_log_type_t v19 = sub_25B3DCF68();
        if (!os_log_type_enabled(v18, v19)) {
          goto LABEL_25;
        }
        uint64_t v20 = a2;
        unint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v21 = 0;
        unint64_t v22 = "unexpected engagement type";
        goto LABEL_24;
    }
  }
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_25B3DCD98();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B346958);
  id v30 = (id)a2;
  id v31 = sub_25B3DCD78();
  os_log_type_t v32 = sub_25B3DCF78();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v33 = 134217984;
    objc_msgSend(v30, sel_timestamp);
    uint64_t v49 = v34;
    sub_25B3DD018();

    _os_log_impl(&dword_25B39F000, v31, v32, "no feedback at %f", v33, 0xCu);
    MEMORY[0x261163250](v33, -1, -1);
  }
  else
  {
  }
LABEL_19:
  type metadata accessor for PeopleSuggestionsJointEvent(0);
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_25B3D185C(void **a1, id a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = *a1;
  id v8 = objc_msgSend(a2, sel_trialIdentifier);
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  id v10 = objc_msgSend(v8, sel_trialExperimentId);

  if (!v10)
  {
    uint64_t v9 = 0;
LABEL_5:
    unint64_t v12 = 0xE000000000000000;
    goto LABEL_6;
  }
  uint64_t v9 = (void *)sub_25B3DCDE8();
  unint64_t v12 = v11;

LABEL_6:
  id v13 = objc_msgSend(a2, sel_trialIdentifier);
  id v118 = v7;
  if (v13
    && (uint64_t v14 = v13,
        id v15 = objc_msgSend(v13, sel_trialTreatmentId),
        v14,
        v15))
  {
    uint64_t v16 = sub_25B3DCDE8();
    unint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v18 = 0xE000000000000000;
  }
  id v19 = objc_msgSend(a2, sel_trialIdentifier);
  if (v19
    && (uint64_t v20 = v19,
        id v21 = objc_msgSend(v19, sel_trialDeploymentId),
        v20,
        v21))
  {
    uint64_t v22 = sub_25B3DCDE8();
    unint64_t v24 = v23;
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v24 = 0xE000000000000000;
  }
  char v25 = (objc_class *)type metadata accessor for TrialIdentifier();
  os_log_type_t v26 = (char *)objc_allocWithZone(v25);
  uint64_t v27 = &v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(void *)uint64_t v27 = v9;
  *((void *)v27 + 1) = v12;
  uint64_t v28 = (uint64_t *)&v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  uint64_t *v28 = v16;
  v28[1] = v18;
  uint64_t v29 = (uint64_t *)&v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *uint64_t v29 = v22;
  v29[1] = v24;
  v123.receiver = v26;
  v123.super_class = v25;
  id v30 = objc_msgSendSuper2(&v123, sel_init);
  id v31 = v118;
  id v32 = objc_msgSend(v118, sel_identifier);
  if (v32)
  {
    unint64_t v33 = v32;
    uint64_t v34 = sub_25B3DCDE8();
    unint64_t v36 = v35;

    if ((a3 & 1) == 0)
    {
      id v51 = sub_25B3C926C(v118, v30);
      if (!v120)
      {
        id v62 = v51;
        uint64_t v116 = v34;
LABEL_59:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B346850);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25B3DFC60;
        *(void *)(inited + 32) = v62;
        uint64_t v124 = (void *)inited;
        sub_25B3DCEA8();
        unint64_t v92 = v124;
        id v93 = v62;
        unint64_t v94 = sub_25B3D09FC();
        uint64_t v124 = v92;
        sub_25B3A4F34(v94);
        unint64_t v95 = (unint64_t)v124;
        unint64_t v96 = swift_bridgeObjectRetain();
        sub_25B3D8FDC(v96);
        swift_bridgeObjectRelease();
        if (objc_msgSend(a2, sel_engagementType) == 1
          && (id v97 = objc_msgSend(a2, sel_engagementIdentifier)) != 0)
        {
          uint64_t v98 = v97;
          uint64_t v99 = v30;
          uint64_t v100 = sub_25B3DCDE8();
          uint64_t v102 = v101;

          if (v116 == v100 && v36 == v102)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_67;
          }
          char v103 = sub_25B3DD328();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v103)
          {
LABEL_67:
            if (!objc_msgSend(v31, sel_rank))
            {
              swift_bridgeObjectRelease();
              if (qword_26B346880 == -1) {
                goto LABEL_77;
              }
              goto LABEL_84;
            }
            if (v95 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v104 = sub_25B3DD248();
              if (v104) {
                goto LABEL_70;
              }
            }
            else
            {
              uint64_t v104 = *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (v104)
              {
LABEL_70:
                if (v104 >= 1)
                {
                  uint64_t v105 = 0;
                  do
                  {
                    if ((v95 & 0xC000000000000001) != 0) {
                      id v106 = (id)MEMORY[0x2611628B0](v105, v95);
                    }
                    else {
                      id v106 = *(id *)(v95 + 8 * v105 + 32);
                    }
                    uint64_t v107 = v106;
                    ++v105;
                    uint64_t v124 = v106;
                    sub_25B3D2908(&v124, a5, v31);
                  }
                  while (v104 != v105);
                  goto LABEL_82;
                }
                __break(1u);
LABEL_84:
                swift_once();
LABEL_77:
                uint64_t v108 = sub_25B3DCD98();
                __swift_project_value_buffer(v108, (uint64_t)qword_26B346958);
                id v109 = v31;
                uint64_t v110 = sub_25B3DCD78();
                os_log_type_t v111 = sub_25B3DCF68();
                if (os_log_type_enabled(v110, v111))
                {
                  uint64_t v112 = (uint8_t *)swift_slowAlloc();
                  unint64_t v113 = (void *)swift_slowAlloc();
                  uint64_t v124 = v113;
                  *(_DWORD *)uint64_t v112 = 136315138;
                  uint64_t v114 = sub_25B3D25E8();
                  uint64_t v122 = sub_25B3B1CCC(v114, v115, (uint64_t *)&v124);
                  sub_25B3DD018();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_25B39F000, v110, v111, "Missing or negative rank: %s", v112, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x261163250](v113, -1, -1);
                  MEMORY[0x261163250](v112, -1, -1);
                }
                else
                {
                }
                return;
              }
            }
LABEL_82:

            swift_bridgeObjectRelease_n();
            return;
          }
        }
        else
        {

          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        return;
      }
      id v119 = v30;
      if (qword_26B346880 != -1) {
        swift_once();
      }
      uint64_t v52 = sub_25B3DCD98();
      __swift_project_value_buffer(v52, (uint64_t)qword_26B346958);
      uint64_t v53 = v120;
      id v54 = v120;
      swift_bridgeObjectRetain();
      id v55 = v120;
      uint64_t v56 = sub_25B3DCD78();
      os_log_type_t v57 = sub_25B3DCF78();
      if (!os_log_type_enabled(v56, v57)) {
        goto LABEL_57;
      }
      goto LABEL_30;
    }
    uint64_t v116 = v34;
    id v37 = objc_msgSend(v118, sel_modelIdentifier);
    if (v37)
    {
      char v38 = v37;
      id v39 = objc_msgSend(v37, sel_otherModelTypeName);

      if (v39)
      {
        uint64_t v40 = sub_25B3DCDE8();
        uint64_t v42 = v41;

        if (v42)
        {
          if (v40 == 0x656C626D65736E65 && v42 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v63 = sub_25B3DD328();
            swift_bridgeObjectRelease();
            if ((v63 & 1) == 0) {
              goto LABEL_39;
            }
          }
          if (qword_26B346880 != -1) {
            swift_once();
          }
          uint64_t v64 = sub_25B3DCD98();
          __swift_project_value_buffer(v64, (uint64_t)qword_26B346958);
          char v65 = sub_25B3DCD78();
          os_log_type_t v66 = sub_25B3DCF68();
          if (os_log_type_enabled(v65, v66))
          {
            uint64_t v67 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v67 = 0;
            _os_log_impl(&dword_25B39F000, v65, v66, "Ensemble in timeout", v67, 2u);
            MEMORY[0x261163250](v67, -1, -1);
          }
        }
      }
    }
LABEL_39:
    id v68 = objc_msgSend(v118, sel_modelIdentifier);
    if (v68)
    {
      uint64_t v69 = v68;
      id v70 = objc_msgSend(v68, sel_otherModelTypeName);

      if (v70)
      {
        uint64_t v71 = sub_25B3DCDE8();
        uint64_t v73 = v72;

        if (v73)
        {
          if (v71 == 0x656C626D65736E65 && v73 == 0xE800000000000000) {
            goto LABEL_50;
          }
          char v74 = sub_25B3DD328();
          swift_bridgeObjectRelease();
          if (v74)
          {
LABEL_51:
            unsigned int v81 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            id v82 = objc_allocWithZone(v81);
            unsigned int v83 = (char *)objc_allocWithZone(v81);
            uint64_t v84 = &v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
            *(void *)uint64_t v84 = 0;
            v84[8] = 1;
            *(_OWORD *)&v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier] = xmmword_25B3DFC80;
            *(void *)&v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v30;
            v121.receiver = v83;
            v121.super_class = v81;
            id v85 = v30;
            id v62 = objc_msgSendSuper2(&v121, sel_init);
            swift_getObjectType();
            swift_deallocPartialClassInstance();
            id v31 = v118;
            goto LABEL_59;
          }
        }
      }
    }
    id v75 = objc_msgSend(v118, sel_modelIdentifier);
    if (v75)
    {
      unint64_t v76 = v75;
      id v77 = objc_msgSend(v75, sel_otherModelTypeName);

      if (v77)
      {
        uint64_t v78 = sub_25B3DCDE8();
        uint64_t v80 = v79;

        if (v80)
        {
          if (v78 == 0x6B6361626C6C6166 && v80 == 0xE800000000000000)
          {
LABEL_50:
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
          char v86 = sub_25B3DD328();
          swift_bridgeObjectRelease();
          if (v86) {
            goto LABEL_51;
          }
        }
      }
    }
    id v31 = v118;
    id v87 = sub_25B3C926C(v118, v30);
    if (!v120)
    {
      id v62 = v87;
      goto LABEL_59;
    }
    id v119 = v30;
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v88 = sub_25B3DCD98();
    __swift_project_value_buffer(v88, (uint64_t)qword_26B346958);
    uint64_t v53 = v120;
    id v89 = v120;
    id v90 = v120;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_25B3DCD78();
    os_log_type_t v57 = sub_25B3DCF78();
    if (!os_log_type_enabled(v56, v57))
    {
LABEL_57:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_30:
    uint64_t v58 = swift_slowAlloc();
    id v59 = (void *)swift_slowAlloc();
    uint64_t v60 = (void *)swift_slowAlloc();
    uint64_t v124 = v60;
    *(_DWORD *)uint64_t v58 = 136315394;
    swift_bridgeObjectRetain();
    sub_25B3B1CCC(v34, v36, (uint64_t *)&v124);
    sub_25B3DD018();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v58 + 12) = 2112;
    id v61 = v53;
    uint64_t v122 = _swift_stdlib_bridgeErrorToNSError();
    sub_25B3DD018();
    *id v59 = v122;

    _os_log_impl(&dword_25B39F000, v56, v57, "Model error for %s: %@", (uint8_t *)v58, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
    swift_arrayDestroy();
    MEMORY[0x261163250](v59, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261163250](v60, -1, -1);
    MEMORY[0x261163250](v58, -1, -1);

    return;
  }
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_25B3DCD98();
  __swift_project_value_buffer(v43, (uint64_t)qword_26B346958);
  id v44 = v118;
  id v45 = sub_25B3DCD78();
  os_log_type_t v46 = sub_25B3DCF68();
  if (os_log_type_enabled(v45, v46))
  {
    unint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = (void *)swift_slowAlloc();
    uint64_t v124 = v48;
    *(_DWORD *)unint64_t v47 = 136315138;
    uint64_t v49 = sub_25B3D25E8();
    uint64_t v122 = sub_25B3B1CCC(v49, v50, (uint64_t *)&v124);
    sub_25B3DD018();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25B39F000, v45, v46, "PeopleSuggestion missing required fields: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261163250](v48, -1, -1);
    MEMORY[0x261163250](v47, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25B3D25E8()
{
  uint64_t v1 = v0;
  sub_25B3DD168();
  sub_25B3DCE28();
  id v2 = objc_msgSend(v0, sel_identifier);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_25B3DCDE8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB478);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v7 = objc_msgSend(v1, sel_model, v4, v6);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_25B3DCDE8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v12 = objc_msgSend(v1, sel_modelIdentifier, v9, v11);
  if (v12)
  {
    id v13 = v12;
    sub_25B3D36B0();
  }
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v14 = objc_msgSend(v1, sel_transportBundleId);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = sub_25B3DCDE8();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v18 = 0;
  }
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  LODWORD(v20) = objc_msgSend(v1, sel_rank, v16, v18);
  sub_25B3DD318();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  objc_msgSend(v1, sel_score, v20);
  sub_25B3DCEF8();
  sub_25B3DCE28();
  return 0;
}

void sub_25B3D2908(void **a1, uint64_t *a2, id a3)
{
  uint64_t v5 = *a1;
  unsigned int v6 = objc_msgSend(a3, sel_rank);
  if (v6 >= 0x100)
  {
    sub_25B3DD228();
    __break(1u);
  }
  else
  {
    char v7 = v6;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *a2;
    *a2 = 0x8000000000000000;
    __int16 v9 = sub_25B3D897C(v7, v5, isUniquelyReferenced_nonNull_native);
    *a2 = v22;
    swift_bridgeObjectRelease();
    if ((v9 & 0x100) == 0)
    {
      if (qword_26B346880 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_25B3DCD98();
      __swift_project_value_buffer(v10, (uint64_t)qword_26B346958);
      id v11 = v5;
      id v12 = a3;
      id v13 = v11;
      id v14 = v12;
      id v15 = sub_25B3DCD78();
      os_log_type_t v16 = sub_25B3DCF78();
      if (os_log_type_enabled(v15, v16))
      {
        os_log_type_t type = v16;
        uint64_t v17 = swift_slowAlloc();
        log = v15;
        uint64_t v18 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 138412802;
        id v19 = v13;
        sub_25B3DD018();
        void *v18 = v13;

        *(_WORD *)(v17 + 12) = 256;
        sub_25B3DD018();
        *(_WORD *)(v17 + 15) = 1024;
        objc_msgSend(v14, sel_rank);

        sub_25B3DD018();
        _os_log_impl(&dword_25B39F000, log, type, "duplicate ranks for %@: %hhu, %u", (uint8_t *)v17, 0x15u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
        swift_arrayDestroy();
        MEMORY[0x261163250](v18, -1, -1);
        MEMORY[0x261163250](v17, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t sub_25B3D2C5C()
{
  sub_25B3DD168();
  sub_25B3DCE28();
  sub_25B3DCC98();
  sub_25B3D43EC(&qword_26A4FBA90, MEMORY[0x263F07490]);
  sub_25B3DD318();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  sub_25B3DD218();
  sub_25B3DCE28();
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25B3CE500(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = MEMORY[0x263F8D310];
  MEMORY[0x2611625B0](v1, MEMORY[0x263F8D310]);
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_25B3CE76C(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  MEMORY[0x2611625B0](v5, v2);
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return 0;
}

uint64_t sub_25B3D2E9C(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) & 1) == 0) {
    return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*(void *)(a1
  }
                                                                                     + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
  if (!*(void *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8)) {
    return 0x676E697373696D3CLL;
  }
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25B3D2F30(uint64_t a1)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8))
  {
    if (*(void *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8)) {
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*(void *)(a1
                                                                              + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
  }
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  sub_25B3DD318();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  return 0;
}

id PeopleSuggestionsJointEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PeopleSuggestionsJointEvent.init()()
{
}

id PeopleSuggestionsJointEvent.__deallocating_deinit()
{
  return sub_25B3D3464(type metadata accessor for PeopleSuggestionsJointEvent);
}

uint64_t sub_25B3D3170()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3D31E4()
{
  return sub_25B3DD3E8();
}

uint64_t sub_25B3D3240()
{
  return sub_25B3DD408();
}

uint64_t sub_25B3D32B0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_25B3DD328();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t sub_25B3D3340(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  id v8 = objc_msgSend(v7, sel_context);
  a4(a3);
  swift_unknownObjectRelease();

  return swift_release();
}

id sub_25B3D344C()
{
  return sub_25B3D3464((uint64_t (*)(void))type metadata accessor for PeopleSuggestionEventsHandler);
}

id sub_25B3D3464(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25B3D34A4()
{
  id v1 = v0;
  sub_25B3DD168();
  swift_bridgeObjectRelease();
  strcpy((char *)v15, "(experiment: ");
  HIWORD(v15[1]) = -4864;
  id v2 = objc_msgSend(v0, sel_task);
  if (v2)
  {
    objc_super v3 = v2;
    uint64_t v4 = sub_25B3DCDE8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB478);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v7 = objc_msgSend(v1, sel_treatment, v4, v6);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_25B3DCDE8();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v12 = objc_msgSend(v1, sel_deployment, v9, v11);
  if (v12)
  {
    id v13 = v12;
    sub_25B3DCDE8();
  }
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return v15[0];
}

uint64_t sub_25B3D36B0()
{
  id v1 = v0;
  sub_25B3DD168();
  sub_25B3DCE28();
  LODWORD(v10) = objc_msgSend(v0, sel_modelType);
  type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(0);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v2 = objc_msgSend(v0, sel_otherModelTypeName, v10);
  if (v2)
  {
    objc_super v3 = v2;
    uint64_t v4 = sub_25B3DCDE8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FB478);
  sub_25B3DCDF8();
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  id v7 = objc_msgSend(v1, sel_trialIdentifier, v4, v6);
  if (v7)
  {
    id v8 = v7;
    sub_25B3D34A4();
  }
  sub_25B3DCE28();
  swift_bridgeObjectRelease();
  sub_25B3DCE28();
  return 0;
}

uint64_t sub_25B3D3878(unint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_25B3D8940(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_25B3D3924(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_25B3D3924(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  uint64_t v143 = *(void *)(v4 - 8);
  uint64_t v144 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v140 = (uint64_t)&v134 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v150 = (uint64_t)&v134 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v147 = (uint64_t)&v134 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v146 = (uint64_t)&v134 - v11;
  uint64_t v12 = a1[1];
  uint64_t result = sub_25B3DD308();
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_142;
    }
    if (v12) {
      return sub_25B3D4D6C(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_150;
  }
  uint64_t v138 = result;
  if (v12 < 2)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    unint64_t v142 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v143 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80));
    if (v12 != 1)
    {
      unint64_t v21 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v20 = (char *)MEMORY[0x263F8EE78];
LABEL_107:
      uint64_t v137 = v18;
      if (v21 >= 2)
      {
        uint64_t v126 = *a1;
        do
        {
          unint64_t v127 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_137;
          }
          if (!v126) {
            goto LABEL_149;
          }
          uint64_t v128 = v20;
          uint64_t v129 = v20 + 32;
          uint64_t v130 = *(void *)&v20[16 * v127 + 32];
          uint64_t v131 = *(void *)&v20[16 * v21 + 24];
          sub_25B3D4FF8(v126 + *(void *)(v143 + 72) * v130, v126 + *(void *)(v143 + 72) * *(void *)&v129[16 * v21 - 16], v126 + *(void *)(v143 + 72) * v131, v142);
          if (v2) {
            break;
          }
          if (v131 < v130) {
            goto LABEL_138;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v128 = sub_25B3C6C04((uint64_t)v128);
          }
          if (v127 >= *((void *)v128 + 2)) {
            goto LABEL_139;
          }
          char v132 = &v128[16 * v127 + 32];
          *(void *)char v132 = v130;
          *((void *)v132 + 1) = v131;
          unint64_t v133 = *((void *)v128 + 2);
          if (v21 > v133) {
            goto LABEL_140;
          }
          uint64_t v20 = v128;
          memmove(&v128[16 * v21 + 16], &v128[16 * v21 + 32], 16 * (v133 - v21));
          *((void *)v128 + 2) = v133 - 1;
          unint64_t v21 = v133 - 1;
        }
        while (v133 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v137 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v137 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v15 = v14 >> 1;
    uint64_t v16 = sub_25B3DCEC8();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(unsigned __int8 *)(v143 + 80);
    uint64_t v137 = v16;
    unint64_t v142 = v16 + ((v17 + 32) & ~v17);
  }
  uint64_t v19 = 0;
  uint64_t v20 = (char *)MEMORY[0x263F8EE78];
  uint64_t v149 = a1;
  while (1)
  {
    uint64_t v22 = v19;
    uint64_t v23 = v19 + 1;
    uint64_t v141 = v19;
    if (v19 + 1 >= v12)
    {
      uint64_t v33 = v19 + 1;
    }
    else
    {
      uint64_t v145 = *a1;
      uint64_t v24 = v145;
      uint64_t v25 = *(void *)(v143 + 72);
      uint64_t v151 = v25;
      uint64_t v26 = v146;
      sub_25B3D911C(v145 + v25 * v23, v146);
      uint64_t v27 = v24 + v25 * v22;
      uint64_t v28 = v147;
      sub_25B3D911C(v27, v147);
      sub_25B3DCC68();
      double v30 = v29;
      sub_25B3DCC68();
      double v32 = v31;
      sub_25B3D9180(v28);
      sub_25B3D9180(v26);
      uint64_t v33 = v22 + 2;
      if (v22 + 2 >= v12)
      {
        uint64_t v44 = v151;
        if (v30 >= v32) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v136 = v2;
        uint64_t v148 = v151 * v23;
        uint64_t v34 = v145;
        uint64_t v35 = v151 * v33;
        while (1)
        {
          uint64_t v36 = v12;
          uint64_t v37 = v33;
          uint64_t v38 = v146;
          sub_25B3D911C(v34 + v35, v146);
          uint64_t v39 = v147;
          sub_25B3D911C(v34 + v148, v147);
          sub_25B3DCC68();
          double v41 = v40;
          sub_25B3DCC68();
          BOOL v43 = v41 >= v42;
          sub_25B3D9180(v39);
          sub_25B3D9180(v38);
          if (v30 < v32 == v43) {
            break;
          }
          uint64_t v33 = v37 + 1;
          uint64_t v44 = v151;
          v34 += v151;
          uint64_t v12 = v36;
          if (v36 == v37 + 1)
          {
            uint64_t v33 = v36;
            a1 = v149;
            uint64_t v2 = v136;
            uint64_t v22 = v141;
            if (v30 < v32) {
              goto LABEL_27;
            }
            goto LABEL_40;
          }
        }
        a1 = v149;
        uint64_t v33 = v37;
        uint64_t v2 = v136;
        uint64_t v22 = v141;
        uint64_t v12 = v36;
        uint64_t v44 = v151;
        if (v30 >= v32) {
          goto LABEL_40;
        }
      }
LABEL_27:
      if (v33 < v22) {
        goto LABEL_143;
      }
      if (v22 < v33)
      {
        uint64_t v139 = v12;
        uint64_t v135 = v20;
        uint64_t v45 = 0;
        uint64_t v46 = v44 * (v33 - 1);
        uint64_t v47 = v33 * v44;
        uint64_t v48 = v22 * v44;
        do
        {
          if (v22 != v33 + v45 - 1)
          {
            uint64_t v50 = v33;
            uint64_t v51 = v145;
            if (!v145) {
              goto LABEL_148;
            }
            unint64_t v52 = v145 + v48;
            uint64_t v148 = v145 + v46;
            sub_25B3D91DC(v145 + v48, v140, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
            if (v48 < v46 || v52 >= v51 + v47)
            {
              uint64_t v49 = v148;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v49 = v148;
              if (v48 != v46) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            sub_25B3D91DC(v140, v49, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
            a1 = v149;
            uint64_t v33 = v50;
            uint64_t v44 = v151;
          }
          ++v22;
          --v45;
          v46 -= v44;
          v47 -= v44;
          v48 += v44;
        }
        while (v22 < v33 + v45);
        uint64_t v20 = v135;
        uint64_t v22 = v141;
        uint64_t v12 = v139;
      }
    }
LABEL_40:
    if (v33 < v12)
    {
      if (__OFSUB__(v33, v22)) {
        goto LABEL_141;
      }
      if (v33 - v22 < v138) {
        break;
      }
    }
LABEL_58:
    if (v33 < v22) {
      goto LABEL_136;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v148 = v33;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v20 = sub_25B3C68D8(0, *((void *)v20 + 2) + 1, 1, v20);
    }
    unint64_t v75 = *((void *)v20 + 2);
    unint64_t v74 = *((void *)v20 + 3);
    unint64_t v21 = v75 + 1;
    if (v75 >= v74 >> 1) {
      uint64_t v20 = sub_25B3C68D8((char *)(v74 > 1), v75 + 1, 1, v20);
    }
    *((void *)v20 + 2) = v21;
    unint64_t v76 = v20 + 32;
    id v77 = &v20[16 * v75 + 32];
    uint64_t v78 = v148;
    *(void *)id v77 = v22;
    *((void *)v77 + 1) = v78;
    if (v75)
    {
      a1 = v149;
      while (1)
      {
        unint64_t v79 = v21 - 1;
        if (v21 >= 4)
        {
          uint64_t v84 = &v76[16 * v21];
          uint64_t v85 = *((void *)v84 - 8);
          uint64_t v86 = *((void *)v84 - 7);
          BOOL v90 = __OFSUB__(v86, v85);
          uint64_t v87 = v86 - v85;
          if (v90) {
            goto LABEL_125;
          }
          uint64_t v89 = *((void *)v84 - 6);
          uint64_t v88 = *((void *)v84 - 5);
          BOOL v90 = __OFSUB__(v88, v89);
          uint64_t v82 = v88 - v89;
          char v83 = v90;
          if (v90) {
            goto LABEL_126;
          }
          unint64_t v91 = v21 - 2;
          unint64_t v92 = &v76[16 * v21 - 32];
          uint64_t v94 = *(void *)v92;
          uint64_t v93 = *((void *)v92 + 1);
          BOOL v90 = __OFSUB__(v93, v94);
          uint64_t v95 = v93 - v94;
          if (v90) {
            goto LABEL_128;
          }
          BOOL v90 = __OFADD__(v82, v95);
          uint64_t v96 = v82 + v95;
          if (v90) {
            goto LABEL_131;
          }
          if (v96 >= v87)
          {
            uint64_t v114 = &v76[16 * v79];
            uint64_t v116 = *(void *)v114;
            uint64_t v115 = *((void *)v114 + 1);
            BOOL v90 = __OFSUB__(v115, v116);
            uint64_t v117 = v115 - v116;
            if (v90) {
              goto LABEL_135;
            }
            BOOL v107 = v82 < v117;
            goto LABEL_96;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v108 = *((void *)v20 + 4);
            uint64_t v109 = *((void *)v20 + 5);
            BOOL v90 = __OFSUB__(v109, v108);
            uint64_t v101 = v109 - v108;
            char v102 = v90;
            goto LABEL_90;
          }
          uint64_t v81 = *((void *)v20 + 4);
          uint64_t v80 = *((void *)v20 + 5);
          BOOL v90 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          char v83 = v90;
        }
        if (v83) {
          goto LABEL_127;
        }
        unint64_t v91 = v21 - 2;
        id v97 = &v76[16 * v21 - 32];
        uint64_t v99 = *(void *)v97;
        uint64_t v98 = *((void *)v97 + 1);
        BOOL v100 = __OFSUB__(v98, v99);
        uint64_t v101 = v98 - v99;
        char v102 = v100;
        if (v100) {
          goto LABEL_130;
        }
        char v103 = &v76[16 * v79];
        uint64_t v105 = *(void *)v103;
        uint64_t v104 = *((void *)v103 + 1);
        BOOL v90 = __OFSUB__(v104, v105);
        uint64_t v106 = v104 - v105;
        if (v90) {
          goto LABEL_133;
        }
        if (__OFADD__(v101, v106)) {
          goto LABEL_134;
        }
        if (v101 + v106 >= v82)
        {
          BOOL v107 = v82 < v106;
LABEL_96:
          if (v107) {
            unint64_t v79 = v91;
          }
          goto LABEL_98;
        }
LABEL_90:
        if (v102) {
          goto LABEL_129;
        }
        uint64_t v110 = &v76[16 * v79];
        uint64_t v112 = *(void *)v110;
        uint64_t v111 = *((void *)v110 + 1);
        BOOL v90 = __OFSUB__(v111, v112);
        uint64_t v113 = v111 - v112;
        if (v90) {
          goto LABEL_132;
        }
        if (v113 < v101) {
          goto LABEL_15;
        }
LABEL_98:
        unint64_t v118 = v79 - 1;
        if (v79 - 1 >= v21)
        {
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
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
          goto LABEL_145;
        }
        uint64_t v119 = *a1;
        if (!*a1) {
          goto LABEL_147;
        }
        id v120 = v20;
        objc_super v121 = &v76[16 * v118];
        uint64_t v122 = *(void *)v121;
        objc_super v123 = &v76[16 * v79];
        uint64_t v124 = *((void *)v123 + 1);
        sub_25B3D4FF8(v119 + *(void *)(v143 + 72) * *(void *)v121, v119 + *(void *)(v143 + 72) * *(void *)v123, v119 + *(void *)(v143 + 72) * v124, v142);
        if (v2) {
          goto LABEL_118;
        }
        if (v124 < v122) {
          goto LABEL_122;
        }
        if (v79 > *((void *)v120 + 2)) {
          goto LABEL_123;
        }
        *(void *)objc_super v121 = v122;
        *(void *)&v76[16 * v118 + 8] = v124;
        unint64_t v125 = *((void *)v120 + 2);
        if (v79 >= v125) {
          goto LABEL_124;
        }
        uint64_t v20 = v120;
        unint64_t v21 = v125 - 1;
        memmove(&v76[16 * v79], v123 + 16, 16 * (v125 - 1 - v79));
        *((void *)v120 + 2) = v125 - 1;
        a1 = v149;
        if (v125 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v21 = 1;
    a1 = v149;
LABEL_15:
    uint64_t v12 = a1[1];
    uint64_t v19 = v148;
    if (v148 >= v12)
    {
      uint64_t v18 = v137;
      goto LABEL_107;
    }
  }
  if (__OFADD__(v22, v138)) {
    goto LABEL_144;
  }
  if (v22 + v138 >= v12) {
    uint64_t v53 = v12;
  }
  else {
    uint64_t v53 = v22 + v138;
  }
  if (v53 >= v22)
  {
    if (v33 != v53)
    {
      uint64_t v135 = v20;
      uint64_t v136 = v2;
      uint64_t v54 = *(void *)(v143 + 72);
      uint64_t v55 = v54 * (v33 - 1);
      uint64_t v145 = v54;
      uint64_t v56 = v33 * v54;
      uint64_t v139 = v53;
      do
      {
        uint64_t v58 = 0;
        uint64_t v148 = v33;
        while (1)
        {
          uint64_t v151 = v22;
          uint64_t v59 = *a1;
          uint64_t v60 = v56;
          uint64_t v61 = v56 + v58 + *a1;
          id v62 = a1;
          uint64_t v63 = v146;
          sub_25B3D911C(v61, v146);
          uint64_t v64 = v55;
          uint64_t v65 = v55 + v58 + v59;
          uint64_t v66 = v147;
          sub_25B3D911C(v65, v147);
          sub_25B3DCC68();
          double v68 = v67;
          sub_25B3DCC68();
          double v70 = v69;
          sub_25B3D9180(v66);
          sub_25B3D9180(v63);
          if (v68 >= v70) {
            break;
          }
          uint64_t v71 = *v62;
          if (!*v62) {
            goto LABEL_146;
          }
          uint64_t v56 = v60;
          uint64_t v55 = v64;
          uint64_t v72 = v71 + v64 + v58;
          sub_25B3D91DC(v71 + v60 + v58, v150, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
          swift_arrayInitWithTakeFrontToBack();
          sub_25B3D91DC(v150, v72, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
          v58 -= v145;
          uint64_t v22 = v151 + 1;
          uint64_t v57 = v148;
          a1 = v149;
          if (v148 == v151 + 1) {
            goto LABEL_51;
          }
        }
        uint64_t v57 = v148;
        a1 = v62;
        uint64_t v55 = v64;
        uint64_t v56 = v60;
LABEL_51:
        uint64_t v33 = v57 + 1;
        v55 += v145;
        v56 += v145;
        uint64_t v22 = v141;
      }
      while (v33 != v139);
      uint64_t v33 = v139;
      uint64_t v20 = v135;
      uint64_t v2 = v136;
    }
    goto LABEL_58;
  }
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
  uint64_t result = sub_25B3DD228();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PeopleSuggestionInferenceEventTimestamped(uint64_t a1)
{
  return sub_25B3A7650(a1, (uint64_t *)&unk_26A4FBAB8);
}

unint64_t sub_25B3D4398()
{
  unint64_t result = qword_26A4FBA68;
  if (!qword_26A4FBA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA68);
  }
  return result;
}

uint64_t sub_25B3D43EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(uint64_t a1)
{
  return sub_25B3A7650(a1, (uint64_t *)&unk_26A4FBAC8);
}

unint64_t sub_25B3D4454()
{
  unint64_t result = qword_26A4FBA80;
  if (!qword_26A4FBA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBA80);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestionsJointEvent(uint64_t a1)
{
  return sub_25B3A7650(a1, (uint64_t *)&unk_26A4FBAD8);
}

uint64_t sub_25B3D44C8(uint64_t a1)
{
  uint64_t result = sub_25B3D43EC(&qword_26A4FBA98, (void (*)(uint64_t))type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25B3D4520()
{
  return sub_25B3D43EC(&qword_26A4FBAA0, (void (*)(uint64_t))type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_25B3D4568(uint64_t a1)
{
  uint64_t result = sub_25B3D43EC(&qword_26A4FBAA8, (void (*)(uint64_t))type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25B3D45C0()
{
  return sub_25B3D43EC(&qword_26A4FBAB0, (void (*)(uint64_t))type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
}

uint64_t getEnumTagSinglePayload for PeopleSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterFeedbackEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25B3D4668);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B3DCC98();
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

uint64_t storeEnumTagSinglePayload for PeopleSuggesterFeedbackEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25B3D4740);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25B3DCC98();
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

ValueMetadata *type metadata accessor for PeopleSuggestionsJoiningResult()
{
  return &type metadata for PeopleSuggestionsJoiningResult;
}

uint64_t sub_25B3D4810()
{
  return type metadata accessor for PeopleSuggestionsJointEvent(0);
}

uint64_t method lookup function for PeopleSuggestionsJointEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PeopleSuggestionsJointEvent);
}

uint64_t dispatch thunk of PeopleSuggestionsJointEvent.__allocating_init(timestamp:engagement:inferenceModels:engagedModelRanks:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for PeopleSuggestionEventsHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEventTimestamped.CodingKeys()
{
  return &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys;
}

unsigned char *_s15ReportingPlugin39PeopleSuggesterFeedbackEventTimestampedV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B3D494CLL);
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

ValueMetadata *type metadata accessor for PeopleSuggestionInferenceEventTimestamped.CodingKeys()
{
  return &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys;
}

uint64_t sub_25B3D4988(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PeopleSuggestionsEventKey(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PeopleSuggestionsEventKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggestionsEventKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggestionsEventKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestionsEventKey()
{
  return &type metadata for PeopleSuggestionsEventKey;
}

unint64_t sub_25B3D4B08()
{
  unint64_t result = qword_26A4FBAE8;
  if (!qword_26A4FBAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBAE8);
  }
  return result;
}

unint64_t sub_25B3D4B60()
{
  unint64_t result = qword_26A4FBAF0;
  if (!qword_26A4FBAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBAF0);
  }
  return result;
}

unint64_t sub_25B3D4BB8()
{
  unint64_t result = qword_26A4FBAF8;
  if (!qword_26A4FBAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBAF8);
  }
  return result;
}

unint64_t sub_25B3D4C10()
{
  unint64_t result = qword_26A4FBB00;
  if (!qword_26A4FBB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBB00);
  }
  return result;
}

unint64_t sub_25B3D4C68()
{
  unint64_t result = qword_26A4FBB08;
  if (!qword_26A4FBB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBB08);
  }
  return result;
}

unint64_t sub_25B3D4CC0()
{
  unint64_t result = qword_26A4FBB10;
  if (!qword_26A4FBB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBB10);
  }
  return result;
}

unint64_t sub_25B3D4D18()
{
  unint64_t result = qword_26A4FBB18;
  if (!qword_26A4FBB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBB18);
  }
  return result;
}

uint64_t sub_25B3D4D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v28 = a1;
  uint64_t v29 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  uint64_t v7 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v26 - v14;
  uint64_t v31 = a3;
  uint64_t v27 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v34 = v16 * (v31 - 1);
    uint64_t v30 = v16;
    uint64_t v33 = v16 * v31;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v28;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_25B3D911C(v33 + v17 + *a4, (uint64_t)v15);
      sub_25B3D911C(v34 + v17 + v19, (uint64_t)v11);
      sub_25B3DCC68();
      double v21 = v20;
      sub_25B3DCC68();
      double v23 = v22;
      sub_25B3D9180((uint64_t)v11);
      uint64_t result = sub_25B3D9180((uint64_t)v15);
      if (v21 >= v23)
      {
LABEL_4:
        v34 += v30;
        v33 += v30;
        if (++v31 == v27) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v24 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v25 = v24 + v34 + v17;
      sub_25B3D91DC(v24 + v33 + v17, v32, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_25B3D91DC(v32, v25, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
      v17 -= v30;
      if (v31 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25B3D4FF8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v42 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  uint64_t v8 = MEMORY[0x270FA5388](v42);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v45 = a1;
  unint64_t v44 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v29 = a4 + v19;
      unint64_t v43 = a4 + v19;
      unint64_t v45 = a2;
      unint64_t v41 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v31 = -v14;
        do
        {
          unint64_t v32 = a3 + v31;
          sub_25B3D911C(v29 + v31, (uint64_t)v12);
          unint64_t v33 = a2 + v31;
          sub_25B3D911C(a2 + v31, (uint64_t)v10);
          sub_25B3DCC68();
          double v35 = v34;
          sub_25B3DCC68();
          double v37 = v36;
          sub_25B3D9180((uint64_t)v10);
          sub_25B3D9180((uint64_t)v12);
          if (v35 >= v37)
          {
            unint64_t v38 = v43;
            v43 += v31;
            if (a3 < v38 || v32 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v38)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v33 = a2;
          }
          else
          {
            if (a3 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v45 += v31;
          }
          unint64_t v29 = v43;
          if (v43 <= a4) {
            break;
          }
          a2 = v33;
          a3 += v31;
        }
        while (v33 > v41);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v43 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_25B3D911C(a2, (uint64_t)v12);
        sub_25B3D911C(a4, (uint64_t)v10);
        sub_25B3DCC68();
        double v23 = v22;
        sub_25B3DCC68();
        double v25 = v24;
        sub_25B3D9180((uint64_t)v10);
        sub_25B3D9180((uint64_t)v12);
        unint64_t v26 = v45;
        if (v23 >= v25)
        {
          unint64_t v28 = v44 + v14;
          if (v45 < v44 || v45 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 != v44)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v44 = v28;
          unint64_t v27 = a2;
        }
        else
        {
          unint64_t v27 = a2 + v14;
          if (v45 < a2 || v45 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 == a2)
          {
            unint64_t v26 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v45 = v26 + v14;
        a4 = v44;
        if (v44 >= v20) {
          break;
        }
        a2 = v27;
      }
      while (v27 < a3);
    }
LABEL_59:
    sub_25B3C6A04(&v45, &v44, (uint64_t *)&v43);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_25B3DD288();
  __break(1u);
  return result;
}

uint64_t sub_25B3D5488(void *a1, void *a2)
{
  return sub_25B3D56A0(a1, a2, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion, (uint64_t *)&unk_26A4FBB50, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion);
}

uint64_t sub_25B3D54BC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25B3DD3C8();
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  uint64_t v8 = sub_25B3DD408();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25B3DD328() & 1) != 0)
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
      if (v19 || (sub_25B3DD328() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25B3D667C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25B3D566C(void *a1, void *a2)
{
  return sub_25B3D56A0(a1, a2, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion, &qword_26A4FBB48, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
}

uint64_t sub_25B3D56A0(void *a1, void *a2, void (*a3)(void), uint64_t *a4, void (*a5)(void))
{
  uint64_t v9 = v5;
  uint64_t v12 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v12 < 0) {
      uint64_t v13 = *v5;
    }
    else {
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v14 = a2;
    uint64_t v15 = sub_25B3DD0D8();

    if (v15)
    {
      swift_bridgeObjectRelease();

      a3(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v37;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25B3DD0C8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v27 = sub_25B3D5B48(v13, result + 1, a4, a5);
    uint64_t v38 = v27;
    unint64_t v28 = *(void *)(v27 + 16);
    if (*(void *)(v27 + 24) <= v28)
    {
      uint64_t v33 = v28 + 1;
      id v34 = v14;
      sub_25B3D635C(v33, a4);
      uint64_t v29 = v38;
    }
    else
    {
      uint64_t v29 = v27;
      id v30 = v14;
    }
    sub_25B3D65F8((uint64_t)v14, v29);
    *uint64_t v9 = v29;
    swift_bridgeObjectRelease();
    *a1 = v14;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25B3DCFD8();
    uint64_t v18 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
    {
      a3(0);
      id v20 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
      char v21 = sub_25B3DCFE8();

      if (v21)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        double v25 = *(void **)(*(void *)(*v5 + 48) + 8 * v19);
        *a1 = v25;
        id v26 = v25;
        return 0;
      }
      uint64_t v22 = ~v18;
      while (1)
      {
        unint64_t v19 = (v19 + 1) & v22;
        if (((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
          break;
        }
        id v23 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
        char v24 = sub_25B3DCFE8();

        if (v24) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    id v32 = a2;
    sub_25B3D6818((uint64_t)v32, v19, isUniquelyReferenced_nonNull_native, a4, a5);
    *uint64_t v5 = v39;
    swift_bridgeObjectRelease();
    *a1 = v32;
  }
  return 1;
}

uint64_t sub_25B3D595C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v9 = *v4;
  sub_25B3DD3C8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  sub_25B3DD3E8();
  uint64_t v10 = sub_25B3DD408();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v24 = a1;
  int v23 = a4 & 1;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    uint64_t v14 = *(void *)(v9 + 48);
    while (1)
    {
      uint64_t v15 = v14 + 24 * v12;
      int v16 = *(unsigned __int8 *)(v15 + 16);
      BOOL v17 = *(void *)v15 == a2 && *(void *)(v15 + 8) == a3;
      if (v17 || (sub_25B3DD328()) && ((v16 ^ a4) & 1) == 0) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
      if (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(*v4 + 48) + 24 * v12;
    uint64_t v22 = *(void *)v20;
    uint64_t v21 = *(void *)(v20 + 8);
    LOBYTE(v20) = *(unsigned char *)(v20 + 16);
    *(void *)uint64_t v24 = v22;
    *(void *)(v24 + 8) = v21;
    *(unsigned char *)(v24 + 16) = v20;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_25B3D69A4(a2, a3, v23, v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v25;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v24 = a2;
    *(void *)(v24 + 8) = a3;
    uint64_t result = 1;
    *(unsigned char *)(v24 + 16) = v23;
  }
  return result;
}

uint64_t sub_25B3D5B48(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_25B3DD148();
    uint64_t v19 = v6;
    sub_25B3DD078();
    if (sub_25B3DD0F8())
    {
      a4(0);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_25B3D635C(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_25B3DCFD8();
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_25B3DD0F8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

uint64_t sub_25B3D5D44()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB30);
  uint64_t v3 = sub_25B3DD138();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                  *id v30 = -1 << v29;
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
      sub_25B3DD3C8();
      sub_25B3DCE18();
      uint64_t result = sub_25B3DD408();
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

uint64_t sub_25B3D6024()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB28);
  uint64_t v3 = sub_25B3DD138();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v32 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v31 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = v32[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v16 = v32[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v16 = v32[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v31)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v32 = -1 << v30;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v32[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v32[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = *(void *)(v2 + 48) + 24 * v14;
      uint64_t v20 = *(void *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      char v22 = *(unsigned char *)(v19 + 16);
      sub_25B3DD3C8();
      swift_bridgeObjectRetain();
      sub_25B3DCE18();
      swift_bridgeObjectRelease();
      sub_25B3DD3E8();
      uint64_t result = sub_25B3DD408();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v8 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 24 * v11;
      *(void *)uint64_t v12 = v20;
      *(void *)(v12 + 8) = v21;
      *(unsigned char *)(v12 + 16) = v22;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25B3D6350(uint64_t a1)
{
  return sub_25B3D635C(a1, &qword_26A4FBB38);
}

uint64_t sub_25B3D635C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25B3DD138();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_25B3DCFD8();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_25B3D65F8(uint64_t a1, uint64_t a2)
{
  sub_25B3DCFD8();
  unint64_t result = sub_25B3DD058();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_25B3D667C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25B3D5D44();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_25B3D6B64();
      goto LABEL_22;
    }
    sub_25B3D707C();
  }
  uint64_t v11 = *v4;
  sub_25B3DD3C8();
  sub_25B3DCE18();
  unint64_t result = sub_25B3DD408();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_25B3DD328(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_25B3DD368();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_25B3DD328();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void sub_25B3D6818(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(void))
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_25B3D635C(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_25B3D6D18(a4);
      goto LABEL_14;
    }
    sub_25B3D732C(v11, a4);
  }
  uint64_t v12 = *v5;
  uint64_t v13 = sub_25B3DCFD8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    a5(0);
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_25B3DCFE8();

    if (v16)
    {
LABEL_13:
      sub_25B3DD368();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_25B3DCFE8();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

uint64_t sub_25B3D69A4(uint64_t result, uint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = result;
  unint64_t v11 = *(void *)(*v5 + 16);
  unint64_t v12 = *(void *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0) {
    goto LABEL_18;
  }
  if (a5)
  {
    sub_25B3D6024();
  }
  else
  {
    if (v12 > v11)
    {
      unint64_t result = (uint64_t)sub_25B3D6EBC();
      goto LABEL_18;
    }
    sub_25B3D75A4();
  }
  uint64_t v13 = *v5;
  sub_25B3DD3C8();
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  sub_25B3DD3E8();
  unint64_t result = sub_25B3DD408();
  uint64_t v14 = -1 << *(unsigned char *)(v13 + 32);
  a4 = result & ~v14;
  uint64_t v15 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
  {
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v13 + 48);
    do
    {
      uint64_t v18 = v17 + 24 * a4;
      unint64_t result = *(void *)v18;
      int v19 = *(unsigned __int8 *)(v18 + 16);
      BOOL v20 = *(void *)v18 == v10 && *(void *)(v18 + 8) == a2;
      if (v20 || (unint64_t result = sub_25B3DD328(), (result & 1) != 0))
      {
        if (((v19 ^ a3) & 1) == 0) {
          goto LABEL_21;
        }
      }
      a4 = (a4 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
  }
LABEL_18:
  uint64_t v21 = *v6;
  *(void *)(*v6 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v22 = *(void *)(v21 + 48) + 24 * a4;
  *(void *)uint64_t v22 = v10;
  *(void *)(v22 + 8) = a2;
  *(unsigned char *)(v22 + 16) = a3 & 1;
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (!v24)
  {
    *(void *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_21:
  unint64_t result = sub_25B3DD368();
  __break(1u);
  return result;
}

void *sub_25B3D6B64()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB30);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_25B3D6D18(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25B3DD128();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25B3D6EBC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25B3DD128();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    LOBYTE(v17) = *(unsigned char *)(v17 + 16);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v20 = v19;
    *(void *)(v20 + 8) = v18;
    *(unsigned char *)(v20 + 16) = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25B3D707C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB30);
  uint64_t v3 = sub_25B3DD138();
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
    sub_25B3DD3C8();
    swift_bridgeObjectRetain();
    sub_25B3DCE18();
    uint64_t result = sub_25B3DD408();
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

uint64_t sub_25B3D732C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25B3DD138();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  int64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_25B3DCFD8();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25B3D75A4()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB28);
  uint64_t v2 = sub_25B3DD138();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v28 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      int64_t v9 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v9);
      if (!v15)
      {
        int64_t v9 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v9);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(v1 + 48) + 24 * v13;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    sub_25B3DD3C8();
    swift_bridgeObjectRetain_n();
    sub_25B3DCE18();
    swift_bridgeObjectRelease();
    sub_25B3DD3E8();
    uint64_t result = sub_25B3DD408();
    uint64_t v21 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = *(void *)(v3 + 48) + 24 * v10;
    *(void *)uint64_t v11 = v18;
    *(void *)(v11 + 8) = v19;
    *(unsigned char *)(v11 + 16) = v20;
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v9 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v9);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25B3D7894(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25B3B2324(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_25B3D7B54(v8, v11);
  *uint64_t v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

double sub_25B3D7974@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25B3B2440(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25B3B6640();
      uint64_t v9 = v11;
    }
    sub_25B3A95E8((long long *)(*(void *)(v9 + 56) + 40 * v6), a2);
    sub_25B3D7D2C(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_25B3D7A68(uint64_t a1, uint64_t a2, int a3, void (*a4)(void))
{
  unint64_t v6 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_25B3B239C(a1, a2, a3);
  LOBYTE(a3) = v11;
  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v6;
  uint64_t v16 = *v6;
  *unint64_t v6 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a4();
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v10);
  sub_25B3D80E4(v10, v13);
  *unint64_t v6 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_25B3D7B54(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25B3DD048();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25B3DD3C8();
        swift_bridgeObjectRetain();
        sub_25B3DCE18();
        uint64_t v9 = sub_25B3DD408();
        double result = swift_bridgeObjectRelease();
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
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
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

unint64_t sub_25B3D7D2C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25B3DD048();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25B3DD3C8();
        PeopleSuggesterMetricsField.rawValue.getter();
        sub_25B3DCE18();
        swift_bridgeObjectRelease();
        double result = sub_25B3DD408();
        unint64_t v11 = result & v7;
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
          uint64_t v13 = (unsigned char *)(v12 + v3);
          uint64_t v14 = (unsigned char *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v15 + 40 * v3;
          uint64_t v17 = (long long *)(v15 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            long long v9 = *v17;
            long long v10 = v17[1];
            *(void *)(v16 + 32) = *((void *)v17 + 4);
            *(_OWORD *)unint64_t v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
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

unint64_t sub_25B3D7F14(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25B3DD048();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25B3DD3C8();
        sub_25B3DD3D8();
        double result = sub_25B3DD408();
        unint64_t v10 = result & v7;
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
          uint64_t v12 = (unsigned char *)(v11 + v3);
          uint64_t v13 = (unsigned char *)(v11 + v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = v14 + 24 * v3;
          unint64_t v16 = (long long *)(v14 + 24 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            long long v9 = *v16;
            *(void *)(v15 + 16) = *((void *)v16 + 2);
            *(_OWORD *)unint64_t v15 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

unint64_t sub_25B3D80E4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25B3DD048();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = 24 * v6;
        sub_25B3DD3C8();
        swift_bridgeObjectRetain();
        sub_25B3DCE18();
        sub_25B3DD3E8();
        uint64_t v10 = sub_25B3DD408();
        double result = swift_bridgeObjectRelease();
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
          unint64_t v13 = v12 + 24 * v3;
          uint64_t v14 = (long long *)(v12 + v9);
          if (24 * v3 < v9 || v13 >= (unint64_t)v14 + 24 || v3 != v6)
          {
            long long v15 = *v14;
            *(void *)(v13 + 16) = *((void *)v14 + 2);
            *(_OWORD *)unint64_t v13 = v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          uint64_t v17 = (void *)(v16 + 8 * v3);
          uint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            *uint64_t v17 = *v18;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25B3D82F4(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25B3B2324(a2, a3);
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
    uint64_t result = (uint64_t)sub_25B3B6488();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25B3B296C(result, a4 & 1);
  uint64_t result = sub_25B3B2324(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_25B3DD378();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1;
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

void sub_25B3D8458(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  uint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_25B3B2324(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    BOOL v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];

      *(void *)(v23 + 8 * v16) = a1;
      return;
    }
    goto LABEL_11;
  }
  a6();
  unint64_t v24 = sub_25B3B2324(a2, a3);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_25B3DD378();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  BOOL v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  BOOL v26 = (uint64_t *)(v22[6] + 16 * v16);
  *BOOL v26 = a2;
  v26[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v27 = v22[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v29;
  swift_bridgeObjectRetain();
}

void sub_25B3D85E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, void (*a6)(void), void (*a7)(void))
{
  uint64_t v10 = v7;
  char v12 = a4;
  uint64_t v15 = *v7;
  unint64_t v17 = sub_25B3B239C(a2, a3, a4);
  uint64_t v18 = *(void *)(v15 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v21 = v16;
  uint64_t v22 = *(void *)(v15 + 24);
  if (v22 >= v20 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v22 >= v20 && (a5 & 1) == 0)
  {
    a6();
LABEL_7:
    uint64_t v23 = (void *)*v10;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7];

      *(void *)(v24 + 8 * v17) = a1;
      return;
    }
    goto LABEL_11;
  }
  a7();
  unint64_t v25 = sub_25B3B239C(a2, a3, v12 & 1);
  if ((v21 & 1) != (v26 & 1))
  {
LABEL_17:
    sub_25B3DD378();
    __break(1u);
    return;
  }
  unint64_t v17 = v25;
  uint64_t v23 = (void *)*v10;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  v23[(v17 >> 6) + 8] |= 1 << v17;
  uint64_t v27 = v23[6] + 24 * v17;
  *(void *)uint64_t v27 = a2;
  *(void *)(v27 + 8) = a3;
  *(unsigned char *)(v27 + 16) = v12 & 1;
  *(void *)(v23[7] + 8 * v17) = a1;
  uint64_t v28 = v23[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v23[2] = v30;
  swift_bridgeObjectRetain();
}

unint64_t sub_25B3D879C(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

unint64_t sub_25B3D87E4(unint64_t result, char a2, uint64_t a3, uint64_t a4, void *a5, double a6)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a5[6] + result) = a2;
  uint64_t v6 = a5[7] + 24 * result;
  *(double *)uint64_t v6 = a6;
  *(void *)(v6 + 8) = a3;
  *(void *)(v6 + 16) = a4;
  uint64_t v7 = a5[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a5[2] = v9;
  }
  return result;
}

unint64_t sub_25B3D8834(unint64_t result, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = a5[7] + 16 * result;
  *(unsigned char *)uint64_t v5 = a3;
  *(void *)(v5 + 8) = a4;
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

unint64_t sub_25B3D8880(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = a6[7] + 16 * result;
  *(unsigned char *)uint64_t v7 = a4;
  *(void *)(v7 + 8) = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_25B3D88D4(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_25B3D8918(unint64_t a1)
{
  return sub_25B3B1324(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25B3D892C(unint64_t a1)
{
  return sub_25B3B1468(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25B3D8940(unint64_t a1)
{
  return sub_25B3B1928(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_25B3D8954(void *a1)
{
  return sub_25B3B1990(0, a1[2], 0, a1);
}

char *sub_25B3D8968(uint64_t a1)
{
  return sub_25B3B1AC0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25B3D897C(char a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25B3B24D8((uint64_t)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  char v12 = v9 ^ 1;
  uint64_t v13 = v11 + ((v9 ^ 1) & 1);
  if (__OFADD__(v11, (v9 ^ 1) & 1))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unsigned __int8 v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25B3B73BC();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      int v18 = *(unsigned __int8 *)(v17 + v10);
      *(unsigned char *)(v17 + v10) = a1;
      return v18 & 0xFFFFFEFF | ((v12 & 1) << 8);
    }
    goto LABEL_11;
  }
  sub_25B3B5274(v13, a3 & 1);
  unint64_t v19 = sub_25B3B24D8((uint64_t)a2);
  if ((v14 & 1) == (v20 & 1))
  {
    unint64_t v10 = v19;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    *(unsigned char *)(v16[7] + v10) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      id v24 = a2;
      int v18 = 0;
      return v18 & 0xFFFFFEFF | ((v12 & 1) << 8);
    }
    goto LABEL_15;
  }
LABEL_16:
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  uint64_t result = sub_25B3DD378();
  __break(1u);
  return result;
}

void (*sub_25B3D8AC0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25B3D8B70(v6, a2, a3);
  return sub_25B3D8B28;
}

void sub_25B3D8B28(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_25B3D8B70(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x2611628B0](a2, a3);
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
    *(void *)int64_t v3 = v4;
    return sub_25B3D8BF0;
  }
  __break(1u);
  return result;
}

void sub_25B3D8BF0(id *a1)
{
}

uint64_t sub_25B3D8BFC(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  unsigned __int8 v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void sub_25B3D8C84(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25B3DD248();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB20);
      uint64_t v3 = sub_25B3DD158();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25B3DD248();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x2611628B0](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_25B3DCFD8();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_25B3DCFE8();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25B3DCFE8();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_25B3DCFD8();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25B3DCFE8();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_25B3DCFE8();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_25B3D8FDC(unint64_t a1)
{
  if (a1 >> 62)
  {
    uint64_t v2 = sub_25B3DD248();
    if (!v2) {
      return;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v2) {
      return;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
  }
  else if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v4 = (void *)MEMORY[0x2611628B0](i, a1);
      sub_25B3D56A0(&v7, v4, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model, &qword_26A4FBB20, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);
    }
  }
  else
  {
    uint64_t v5 = (void **)(a1 + 32);
    do
    {
      uint64_t v6 = *v5++;
      sub_25B3D56A0(&v7, v6, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model, &qword_26A4FBB20, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);

      --v2;
    }
    while (v2);
  }
}

uint64_t sub_25B3D911C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25B3D9180(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25B3D91DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B3D927C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = 0x7463657078656E75;
  switch(a3)
  {
    case 1:
      unint64_t v4 = 0x65206D6F74737563;
      goto LABEL_5;
    case 2:
      unint64_t v4 = 0xD000000000000014;
      goto LABEL_5;
    case 3:
      return v3;
    default:
      unint64_t v4 = 0xD000000000000012;
LABEL_5:
      unint64_t v6 = v4;
      sub_25B3DCE28();
      return v6;
  }
}

uint64_t sub_25B3D9360()
{
  return sub_25B3D927C(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_25B3D9370(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ReportingError(uint64_t a1)
{
  return sub_25B3D9398(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25B3D9398(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s15ReportingPlugin14ReportingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25B3D9370(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ReportingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25B3D9370(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25B3D9398(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ReportingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25B3D9398(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ReportingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25B3D9528(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_25B3D9540(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ReportingError()
{
  return &type metadata for ReportingError;
}

uint64_t SignpostEvent.init(rawValue:)@<X0>(unint64_t a1@<X0>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_25B3DD008();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)v24 - v13;
  if ((a2 & 1) == 0)
  {
    if (a1) {
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v13 = HIDWORD(a1);
  if (HIDWORD(a1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a1 >> 11 == 27)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  LODWORD(v13) = WORD1(a1);
  if (WORD1(a1) > 0x10u)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    int v19 = (a1 & 0x3F) << 8;
    unsigned int v20 = (v19 | (a1 >> 6)) + 33217;
    unsigned int v21 = (v19 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v22 = (((v21 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v23 = (v21 | (a1 >> 12)) + 8487393;
    if (v13) {
      unsigned int v15 = v22;
    }
    else {
      unsigned int v15 = v23;
    }
    if (a1 < 0x800) {
      unsigned int v15 = v20;
    }
    goto LABEL_10;
  }
  if ((a1 & 0xFFFFFF80) != 0) {
    goto LABEL_18;
  }
  if (a1 > 0xFF)
  {
    __break(1u);
    goto LABEL_25;
  }
  unsigned int v15 = (a1 + 1);
LABEL_10:
  v24[1] = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v15) >> 3)) & 7)));
LABEL_11:
  uint64_t v16 = sub_25B3DCE08();
  (*(void (**)(uint64_t))(a4 + 16))(v16);
  uint64_t v17 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, a3))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    uint64_t v18 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a5, v14, a3);
    uint64_t v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a5, v18, 1, a3);
}

uint64_t withSignpost<A>(_:_:around:)(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25B3DCD48();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_25B3DCD98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned __int8 v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25B3DCD68();
  MEMORY[0x270FA5388](v9 - 8);
  if (qword_26A4FB1B8 != -1) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v10 = __swift_project_value_buffer(v5, (uint64_t)qword_26A4FB608);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v6 += 16;
    v11(v8, v10, v5);
    sub_25B3DCD58();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_25B3DCE48();
    unint64_t v12 = v24[1];
    char v13 = v25;
    sub_25B3DCD38();
    unint64_t v14 = sub_25B3DCD28();
    if ((v13 & 1) == 0)
    {
      if (v12) {
        goto LABEL_8;
      }
      __break(1u);
    }
    if (HIDWORD(v12)) {
      break;
    }
    if (v12 >> 11 == 27) {
      goto LABEL_27;
    }
    if (WORD1(v12) > 0x10u) {
      goto LABEL_24;
    }
LABEL_8:
    if ((v14 & 0x8000000000000000) != 0 || HIDWORD(v14)) {
      goto LABEL_28;
    }
    a1 = *(void **)(a2 + 16);
    uint64_t v5 = *(unsigned __int8 *)(a2 + 24);
    unsigned __int8 v8 = (char *)*(unsigned __int8 *)(a2 + 25);
    uint64_t v16 = *(void *)(a2 + 40);
    uint64_t v15 = *(void *)(a2 + 48);
    uint64_t v17 = (unsigned char *)swift_slowAlloc();
    if (v15)
    {
      if ((unint64_t)(v15 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_25;
      }
      uint64_t v15 = swift_slowAlloc();
    }
    if (v16)
    {
      if ((unint64_t)(v16 - 0x400000000000000) >> 59 != 31) {
        goto LABEL_26;
      }
      uint64_t v18 = swift_slowAlloc();
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v26 = a1;
    uint64_t v22 = v18;
    uint64_t v23 = v15;
    *uint64_t v17 = v5;
    v17[1] = (_BYTE)v8;
    v24[0] = v17 + 2;
    a2 = a1[2];
    if (a2)
    {
      swift_bridgeObjectRetain();
      int v19 = (void **)(a1 + 5);
      do
      {
        unsigned int v20 = (void (*)(void *, uint64_t *, uint64_t *))*(v19 - 1);
        a1 = *v19;
        swift_retain();
        v20(v24, &v23, &v22);
        swift_release();
        v19 += 2;
        --a2;
      }
      while (a2);
      sub_25B3D9B90((uint64_t)&v26);
    }
    __break(1u);
LABEL_22:
    swift_once();
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
  uint64_t result = sub_25B3DD228();
  __break(1u);
  return result;
}

uint64_t sub_25B3D9B90(uint64_t a1)
{
  return a1;
}

uint64_t dispatch thunk of SignpostEvent.init(rawValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_25B3D9BD0(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_25B3DD068();
    uint64_t v5 = v4;
    uint64_t v6 = sub_25B3DD108();
    char v8 = MEMORY[0x2611627B0](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_25B3CB264(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_25B3C7178(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_25B3CB264(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_25B3C73FC(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_25B3D9CE0()
{
  unint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    id v3 = sub_25B3D9D3C(v0);
    uint64_t v4 = *(void **)(v0 + 24);
    *(void *)(v0 + 24) = v3;
    id v2 = v3;

    unint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_25B3D9D3C(uint64_t a1)
{
  type metadata accessor for PersistentContainer();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = (void *)sub_25B3DCDD8();
  id v4 = objc_msgSend(v2, sel_initWithName_, v3);

  id v5 = *(void **)(a1 + 16);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B346850);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_25B3DFC60;
    *(void *)(v6 + 32) = v5;
    v12[0] = v6;
    sub_25B3DCEA8();
    sub_25B3DC2A4();
    id v7 = v5;
    id v8 = v4;
    uint64_t v9 = (void *)sub_25B3DCE78();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setPersistentStoreDescriptions_, v9, v12[0]);
  }
  v12[4] = sub_25B3D9EE4;
  v12[5] = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_25B3DA0DC;
  uint64_t v12[3] = &block_descriptor_0;
  uint64_t v10 = _Block_copy(v12);
  objc_msgSend(v4, sel_loadPersistentStoresWithCompletionHandler_, v10);
  _Block_release(v10);
  return v4;
}

void sub_25B3D9EE4(int a1, id a2)
{
  if (a2)
  {
    id v3 = a2;
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25B3DCD98();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B346958);
    id v5 = a2;
    id v6 = a2;
    oslog = sub_25B3DCD78();
    os_log_type_t v7 = sub_25B3DCF68();
    if (os_log_type_enabled(oslog, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)id v8 = 138412290;
      id v10 = a2;
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_25B3DD018();
      *uint64_t v9 = v12;

      _os_log_impl(&dword_25B39F000, oslog, v7, "Unable to load persistent stores: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B346870);
      swift_arrayDestroy();
      MEMORY[0x261163250](v9, -1, -1);
      MEMORY[0x261163250](v8, -1, -1);
    }
    else
    {
    }
  }
}

void sub_25B3DA0DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t StreamBookmarkManager.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t StreamBookmarkManager.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_25B3DA19C(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = 0;
  id v5 = sub_25B3D9CE0();
  id v6 = objc_msgSend(v5, sel_managedObjectModel);

  id v7 = "tion\"8@\"NSError\"16";
  id v8 = (void *)sub_25B3DCDD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B3DE300;
  strcpy((char *)(inited + 32), "STREAM_READER");
  *(_WORD *)(inited + 46) = -4864;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_25B3A6944(inited);
  id v10 = (void *)sub_25B3DCDA8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v6, sel_fetchRequestFromTemplateWithName_substitutionVariables_, v8, v10);

  if (v11)
  {
    id v12 = sub_25B3D9CE0();
    id v13 = objc_msgSend(v12, sel_viewContext);

    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = &v26;
    v14[3] = v2;
    v14[4] = v11;
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = sub_25B3DC324;
    *(void *)(v15 + 16) = sub_25B3DC324;
    *(void *)(v15 + 24) = v14;
    aBlock[4] = (uint64_t)sub_25B3DC340;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25B3DA704;
    aBlock[3] = (uint64_t)&block_descriptor_12;
    id v7 = (char *)_Block_copy(aBlock);
    swift_retain();
    id v17 = v11;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_performBlockAndWait_, v7);

    _Block_release(v7);
    LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v17 & 1) == 0) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25B3DCD98();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B346958);
  int v19 = sub_25B3DCD78();
  os_log_type_t v20 = sub_25B3DCF68();
  if (os_log_type_enabled(v19, v20))
  {
    unsigned int v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)unsigned int v21 = 136315138;
    aBlock[6] = sub_25B3B1CCC(0xD000000000000011, (unint64_t)v7 | 0x8000000000000000, aBlock);
    sub_25B3DD018();
    _os_log_impl(&dword_25B39F000, v19, v20, "No fetch template found for %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261163250](v22, -1, -1);
    MEMORY[0x261163250](v21, -1, -1);
  }

  uint64_t v16 = 0;
LABEL_9:
  uint64_t v23 = v26;
  sub_25B3BD440((uint64_t)v16);
  return v23;
}

uint64_t sub_25B3DA5A0(uint64_t *a1)
{
  id v2 = sub_25B3D9CE0();
  id v3 = objc_msgSend(v2, sel_viewContext);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB88);
  unint64_t v5 = sub_25B3DCF98();

  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_2;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25B3DD248();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_14;
  }
LABEL_8:
  if ((v5 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2611628B0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return MEMORY[0x270F9A758]();
    }
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  type metadata accessor for StreamReader();
  uint64_t v4 = swift_dynamicCastClass();
  if (!v4)
  {
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_25B3DA704(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_25B3DA72C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = (void *)sub_25B3DA19C(a1, a2);
  if (v4)
  {

LABEL_3:
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25B3DCD98();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B346958);
    swift_bridgeObjectRetain_n();
    id v11 = sub_25B3DCD78();
    os_log_type_t v12 = sub_25B3DCF58();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v42[0] = v14;
      *(_DWORD *)id v13 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v41[0] = sub_25B3B1CCC(a1, a2, v42);
      sub_25B3DD018();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25B39F000, v11, v12, "no stream reader %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v14, -1, -1);
      MEMORY[0x261163250](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  uint64_t v16 = v9;
  if (!v9) {
    goto LABEL_3;
  }
  id v17 = objc_msgSend(v9, sel_bookmarks);
  if (!v17) {
    goto LABEL_14;
  }
  uint64_t v18 = v17;
  type metadata accessor for Bookmark();
  sub_25B3DB6C0();
  uint64_t v19 = sub_25B3DCF18();

  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25B3DBD98(v19, a3, a4);
  swift_bridgeObjectRelease();
  unsigned int v21 = (void *)sub_25B3D9BD0(v20);
  swift_release();
  if (!v21)
  {
LABEL_14:
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_25B3DCD98();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B346958);
    swift_bridgeObjectRetain_n();
    unint64_t v29 = sub_25B3DCD78();
    os_log_type_t v30 = sub_25B3DCF58();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v42[0] = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v41[0] = sub_25B3B1CCC(a1, a2, v42);
      sub_25B3DD018();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25B39F000, v29, v30, "No bookmarks for stream reader %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261163250](v32, -1, -1);
      MEMORY[0x261163250](v31, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  id v22 = objc_msgSend(v21, sel_data);
  if (!v22)
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25B3DCD98();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B346958);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    char v34 = sub_25B3DCD78();
    os_log_type_t v35 = sub_25B3DCF68();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t type = v35;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v42[0] = v40;
      *(_DWORD *)uint64_t v36 = 136315394;
      swift_bridgeObjectRetain();
      sub_25B3B1CCC(a3, a4, v42);
      sub_25B3DD018();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&v41[0] = sub_25B3B1CCC(a1, a2, v42);
      sub_25B3DD018();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25B39F000, v34, type, "No data found for bookmark named %s with stream reader %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261163250](v40, -1, -1);
      MEMORY[0x261163250](v36, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_25B3DCC18();
  unint64_t v26 = v25;

  id v27 = objc_allocWithZone(MEMORY[0x263F08928]);
  sub_25B3DC0DC(v24, v26);
  id v37 = sub_25B3DC01C();
  sub_25B3DC134(v24, v26);
  id v38 = objc_msgSend(v37, sel_decodeObject);

  if (v38)
  {
    sub_25B3DD038();
    sub_25B3DC134(v24, v26);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_25B3DC134(v24, v26);

    memset(v41, 0, sizeof(v41));
  }
  sub_25B3A9DEC((uint64_t)v41, (uint64_t)v42);
  if (!v42[3])
  {
    sub_25B3CA59C((uint64_t)v42);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB70);
  if (swift_dynamicCast()) {
    return v42[5];
  }
  else {
    return 0;
  }
}

void sub_25B3DAE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_25B3DA19C(a2, a3);
  if (v3)
  {
  }
  else
  {
    uint64_t v14 = v4;
    if (v4) {
      goto LABEL_6;
    }
  }
  unint64_t v5 = self;
  uint64_t v6 = (void *)sub_25B3DCDD8();
  id v7 = sub_25B3D9CE0();
  id v8 = objc_msgSend(v7, sel_viewContext);

  id v9 = objc_msgSend(v5, sel_entityForName_inManagedObjectContext_, v6, v8);
  if (!v9)
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_25B3DCD98();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B346958);
    uint64_t v14 = sub_25B3DCD78();
    os_log_type_t v34 = sub_25B3DCF68();
    if (os_log_type_enabled(v14, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v35 = 0;
      _os_log_impl(&dword_25B39F000, v14, v34, "No entity description for StreamReader", v35, 2u);
      MEMORY[0x261163250](v35, -1, -1);
    }
    goto LABEL_17;
  }
  id v10 = v9;
  id v11 = sub_25B3D9CE0();
  id v12 = objc_msgSend(v11, sel_viewContext);

  id v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StreamReader()), sel_initWithEntity_insertIntoManagedObjectContext_, v10, v12);
  uint64_t v14 = v13;
  uint64_t v15 = (void *)sub_25B3DCDD8();
  [v14 setName:v15];

LABEL_6:
  uint64_t v16 = self;
  id v17 = (void *)sub_25B3DCDD8();
  id v18 = sub_25B3D9CE0();
  id v19 = objc_msgSend(v18, sel_viewContext);

  id v20 = objc_msgSend(v16, sel_entityForName_inManagedObjectContext_, v17, v19);
  if (v20)
  {
    id v21 = v20;
    id v22 = sub_25B3D9CE0();
    id v23 = objc_msgSend(v22, sel_viewContext);

    id v24 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Bookmark()), sel_initWithEntity_insertIntoManagedObjectContext_, v21, v23);
    unint64_t v25 = (void *)sub_25B3DCDD8();
    objc_msgSend(v24, sel_setStreamName_, v25);

    objc_msgSend(v24, sel_setStreamReader_, v14);
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
    objc_msgSend(v26, sel_encodeObject_, v24);
    id v27 = objc_msgSend(v26, sel_encodedData);
    uint64_t v28 = sub_25B3DCC18();
    unint64_t v30 = v29;

    uint64_t v31 = (void *)sub_25B3DCC08();
    sub_25B3DC134(v28, v30);
    objc_msgSend(v24, sel_setData_, v31);

    uint64_t v32 = sub_25B3D9CE0();
    sub_25B3DB3BC(0);

LABEL_16:
    goto LABEL_17;
  }
  if (qword_26B346880 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_25B3DCD98();
  __swift_project_value_buffer(v36, (uint64_t)qword_26B346958);
  uint64_t v32 = sub_25B3DCD78();
  os_log_type_t v37 = sub_25B3DCF68();
  if (!os_log_type_enabled(v32, v37)) {
    goto LABEL_16;
  }
  id v38 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v38 = 0;
  _os_log_impl(&dword_25B39F000, v32, v37, "No entity description for Bookmark", v38, 2u);
  MEMORY[0x261163250](v38, -1, -1);

  uint64_t v14 = v32;
LABEL_17:
}

uint64_t StreamBookmarkManager.deinit()
{
  return v0;
}

uint64_t StreamBookmarkManager.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

void sub_25B3DB3BC(void *a1)
{
  if (a1) {
    id v3 = a1;
  }
  else {
    id v3 = objc_msgSend(v1, sel_viewContext);
  }
  id v4 = a1;
  id v5 = objc_msgSend(v3, sel_hasChanges);
  if (v5)
  {
    MEMORY[0x270FA5388](v5);
    sub_25B3DCF88();
  }
  else
  {
    if (qword_26B346880 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25B3DCD98();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B346958);
    id v7 = sub_25B3DCD78();
    os_log_type_t v8 = sub_25B3DCF58();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_25B39F000, v7, v8, "no changes", v9, 2u);
      MEMORY[0x261163250](v9, -1, -1);
    }
  }
}

id sub_25B3DB554(void *a1)
{
  v3[1] = *(id *)MEMORY[0x263EF8340];
  v3[0] = 0;
  if (objc_msgSend(a1, sel_save_, v3)) {
    return v3[0];
  }
  id v2 = v3[0];
  sub_25B3DCBF8();

  return (id)swift_willThrow();
}

id sub_25B3DB68C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistentContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25B3DB6C0()
{
  unint64_t result = qword_26A4FBB60;
  if (!qword_26A4FBB60)
  {
    type metadata accessor for Bookmark();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4FBB60);
  }
  return result;
}

uint64_t sub_25B3DB718(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4FBB38);
  uint64_t result = sub_25B3DD158();
  uint64_t v9 = result;
  uint64_t v28 = a1;
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
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_25B3DCFD8();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
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
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_25B3DB978(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a2;
  uint64_t v30 = 0;
  int64_t v7 = 0;
  uint64_t v10 = *(void *)(a3 + 56);
  uint64_t v8 = a3 + 56;
  uint64_t v9 = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v8 - 24);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v9;
  uint64_t v31 = v8;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  while (v13)
  {
    unint64_t v14 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v15 = v14 | (v7 << 6);
LABEL_21:
    id v19 = *(id *)(*(void *)(a3 + 48) + 8 * v15);
    id v20 = objc_msgSend(v19, sel_streamName, v28);
    if (v20)
    {
      unint64_t v21 = v20;
      uint64_t v22 = sub_25B3DCDE8();
      uint64_t v24 = v23;

      if (v22 == a4 && v24 == a5)
      {

        swift_bridgeObjectRelease();
LABEL_29:
        *(unint64_t *)((char *)a1 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        if (__OFADD__(v30++, 1))
        {
          __break(1u);
LABEL_32:
          swift_retain();
          sub_25B3DB718(a1, v28, v30, a3);
          return;
        }
      }
      else
      {
        char v26 = sub_25B3DD328();

        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_29;
        }
      }
    }
    else
    {
    }
  }
  int64_t v16 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v16 >= v32) {
    goto LABEL_32;
  }
  unint64_t v17 = *(void *)(v31 + 8 * v16);
  ++v7;
  if (v17) {
    goto LABEL_20;
  }
  int64_t v7 = v16 + 1;
  if (v16 + 1 >= v32) {
    goto LABEL_32;
  }
  unint64_t v17 = *(void *)(v31 + 8 * v7);
  if (v17) {
    goto LABEL_20;
  }
  int64_t v7 = v16 + 2;
  if (v16 + 2 >= v32) {
    goto LABEL_32;
  }
  unint64_t v17 = *(void *)(v31 + 8 * v7);
  if (v17)
  {
LABEL_20:
    unint64_t v13 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v7 << 6);
    goto LABEL_21;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v32) {
    goto LABEL_32;
  }
  unint64_t v17 = *(void *)(v31 + 8 * v18);
  if (v17)
  {
    int64_t v7 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v7 >= v32) {
      goto LABEL_32;
    }
    unint64_t v17 = *(void *)(v31 + 8 * v7);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_25B3DBBC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    sub_25B3DB978((void *)((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a1, a2, a3);
    uint64_t v13 = v12;
    swift_release();
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, v10);
    swift_bridgeObjectRetain();
    sub_25B3DB978((unint64_t *)v14, v9, a1, a2, a3);
    uint64_t v13 = v15;
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x261163250](v14, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v13;
}

uint64_t sub_25B3DBD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_25B3DBBC0(a1, a2, a3);
  }
  uint64_t v5 = MEMORY[0x263F8EE88];
  uint64_t v26 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRetain();
  sub_25B3DD078();
  if (!sub_25B3DD0F8()) {
    goto LABEL_29;
  }
  type metadata accessor for Bookmark();
  do
  {
    swift_dynamicCast();
    id v6 = objc_msgSend(v25, sel_streamName);
    if (!v6)
    {
LABEL_4:

      continue;
    }
    char v7 = v6;
    uint64_t v8 = sub_25B3DCDE8();
    uint64_t v10 = v9;

    if (v8 == a2 && v10 == a3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v12 = sub_25B3DD328();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0) {
        goto LABEL_4;
      }
    }
    uint64_t v13 = v26;
    unint64_t v14 = *(void *)(v26 + 16);
    if (*(void *)(v26 + 24) <= v14)
    {
      sub_25B3D6350(v14 + 1);
      uint64_t v13 = v26;
    }
    uint64_t result = sub_25B3DCFD8();
    uint64_t v16 = v13 + 56;
    uint64_t v17 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v13 + 56 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v13 + 56 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v16 + 8 * v19);
      }
      while (v24 == -1);
      unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
    }
    *(void *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    *(void *)(*(void *)(v13 + 48) + 8 * v20) = v25;
    ++*(void *)(v13 + 16);
  }
  while (sub_25B3DD0F8());
  uint64_t v5 = v26;
LABEL_29:
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

id sub_25B3DC01C()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v1 = (void *)sub_25B3DCC08();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_25B3DCBF8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_25B3DC0DC(uint64_t a1, unint64_t a2)
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

uint64_t sub_25B3DC134(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for StreamBookmarkManager()
{
  return self;
}

uint64_t method lookup function for StreamBookmarkManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StreamBookmarkManager);
}

uint64_t dispatch thunk of StreamBookmarkManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of StreamBookmarkManager.getBookmark(readerName:streamName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of StreamBookmarkManager.store(bookmark:forReader:withName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t type metadata accessor for PersistentContainer()
{
  return self;
}

id sub_25B3DC270()
{
  return sub_25B3DB554(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_25B3DC2A4()
{
  unint64_t result = qword_26A4FBB78;
  if (!qword_26A4FBB78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4FBB78);
  }
  return result;
}

uint64_t sub_25B3DC2E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25B3DC324()
{
  return sub_25B3DA5A0(*(uint64_t **)(v0 + 16));
}

uint64_t sub_25B3DC330()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B3DC340()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id StreamReader.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StreamReader.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StreamReader();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StreamReader()
{
  return self;
}

id StreamReader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StreamReader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StreamReader.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v1 = (void *)sub_25B3DCDD8();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_25B3DC54C()
{
  return MEMORY[0x263F8D1F8];
}

void sub_25B3DC558(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_25B3DCDE8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_25B3DC5C0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_25B3DCDD8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);
}

void sub_25B3DC630(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_bookmarks);
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for Bookmark();
    sub_25B3DB6C0();
    uint64_t v5 = sub_25B3DCF18();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_25B3DC6AC(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    type metadata accessor for Bookmark();
    sub_25B3DB6C0();
    uint64_t v3 = sub_25B3DCF08();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setBookmarks_);
}

uint64_t sub_25B3DC738@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for StreamReader();
  uint64_t result = sub_25B3DD188();
  *a1 = result;
  return result;
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_bookmarks()
{
  return sel_bookmarks;
}

id Bookmark.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Bookmark.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for Bookmark();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for Bookmark()
{
  return self;
}

id Bookmark.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Bookmark();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static Bookmark.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v1 = (void *)sub_25B3DCDD8();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_25B3DC978(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_data);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_25B3DCC18();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_25B3DC9E0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8) >> 60 == 15) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_25B3DCC08();
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setData_);
}

void sub_25B3DCA58(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_streamName);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_25B3DCDE8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_25B3DCAC0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_25B3DCDD8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setStreamName_);
}

uint64_t sub_25B3DCB30@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for Bookmark();
  uint64_t result = sub_25B3DD188();
  *a1 = result;
  return result;
}

char *keypath_get_selector_data()
{
  return sel_data;
}

char *keypath_get_selector_streamName()
{
  return sel_streamName;
}

char *keypath_get_selector_streamReader()
{
  return sel_streamReader;
}

id sub_25B3DCBA8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_streamReader);
  *a2 = result;
  return result;
}

id sub_25B3DCBE4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStreamReader_, *a1);
}

uint64_t sub_25B3DCBF8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25B3DCC08()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25B3DCC18()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25B3DCC28()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25B3DCC38()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25B3DCC48()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25B3DCC58()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25B3DCC68()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25B3DCC78()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25B3DCC88()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25B3DCC98()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25B3DCCA8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25B3DCCB8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25B3DCCC8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25B3DCCD8()
{
  return MEMORY[0x270F10B08]();
}

uint64_t sub_25B3DCCE8()
{
  return MEMORY[0x270F10B28]();
}

uint64_t sub_25B3DCCF8()
{
  return MEMORY[0x270F10B48]();
}

uint64_t sub_25B3DCD08()
{
  return MEMORY[0x270F10B60]();
}

uint64_t sub_25B3DCD18()
{
  return MEMORY[0x270F10B70]();
}

uint64_t sub_25B3DCD28()
{
  return MEMORY[0x270FA2CA8]();
}

uint64_t sub_25B3DCD38()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25B3DCD48()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25B3DCD58()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25B3DCD68()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25B3DCD78()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B3DCD88()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B3DCD98()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B3DCDA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25B3DCDB8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25B3DCDC8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25B3DCDD8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B3DCDE8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B3DCDF8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B3DCE08()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25B3DCE18()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B3DCE28()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B3DCE38()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B3DCE48()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25B3DCE58()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25B3DCE68()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25B3DCE78()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B3DCE88()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25B3DCE98()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25B3DCEA8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25B3DCEB8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25B3DCEC8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25B3DCED8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25B3DCEE8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25B3DCEF8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25B3DCF08()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25B3DCF18()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25B3DCF28()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25B3DCF38()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_25B3DCF48()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25B3DCF58()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25B3DCF68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B3DCF78()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B3DCF88()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_25B3DCF98()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_25B3DCFA8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_25B3DCFB8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_25B3DCFC8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25B3DCFD8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25B3DCFE8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25B3DCFF8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25B3DD008()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B3DD018()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B3DD028()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B3DD038()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B3DD048()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25B3DD058()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25B3DD068()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_25B3DD078()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25B3DD088()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_25B3DD098()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_25B3DD0A8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_25B3DD0B8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_25B3DD0C8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25B3DD0D8()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25B3DD0E8()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_25B3DD0F8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25B3DD108()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_25B3DD118()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_25B3DD128()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25B3DD138()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25B3DD148()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25B3DD158()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25B3DD168()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B3DD178()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B3DD188()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25B3DD198()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25B3DD1A8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25B3DD1B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B3DD1C8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25B3DD1D8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25B3DD1E8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25B3DD1F8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25B3DD208()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25B3DD218()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25B3DD228()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B3DD238()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25B3DD248()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25B3DD258()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25B3DD268()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25B3DD278()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B3DD288()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B3DD298()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25B3DD2A8()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25B3DD2B8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25B3DD2C8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25B3DD2D8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25B3DD2E8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B3DD2F8()
{
  return MEMORY[0x270F9F480]();
}

uint64_t sub_25B3DD308()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25B3DD318()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B3DD328()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B3DD338()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25B3DD348()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25B3DD358()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25B3DD368()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25B3DD378()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25B3DD388()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B3DD398()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B3DD3A8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B3DD3B8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B3DD3C8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B3DD3D8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B3DD3E8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25B3DD3F8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_25B3DD408()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B3DD418()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_25B3DD428()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25B3DD458()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}