uint64_t sub_3A3C@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppActionProvider()
{
  return &type metadata for LaunchAppActionProvider;
}

unint64_t sub_3A78@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_3E08(a1, a1[3]);
  uint64_t v3 = sub_A310();
  sub_3D48(7368801, 0xE300000000000000, v3, &v19);
  swift_bridgeObjectRelease();
  if (v20)
  {
    sub_3EAC(qword_10348);
    if (swift_dynamicCast())
    {
      uint64_t v4 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    sub_3E4C((uint64_t)&v19);
  }
  uint64_t v4 = 0;
LABEL_6:
  sub_3EAC(&qword_10318);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_AB20;
  strcpy((char *)(inited + 32), "appIdentifier");
  *(_WORD *)(inited + 46) = -4864;
  uint64_t v6 = sub_3EAC(&qword_10320);
  *(void *)(inited + 72) = v6;
  uint64_t v7 = sub_3F38(&qword_10328);
  *(void *)(inited + 80) = v7;
  uint64_t v8 = sub_3F38(&qword_10330);
  *(void *)(inited + 88) = v8;
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_3DAC(0x6449707061, 0xE500000000000000, v4);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    *(void *)(inited + 48) = v9;
    *(void *)(inited + 56) = v11;
  }
  else
  {
    *(void *)(inited + 48) = 0;
    *(void *)(inited + 56) = 0;
  }
  *(void *)(inited + 96) = 0x656D614E707061;
  *(void *)(inited + 104) = 0xE700000000000000;
  *(void *)(inited + 136) = v6;
  *(void *)(inited + 144) = v7;
  *(void *)(inited + 152) = v8;
  if (v4)
  {
    uint64_t v12 = sub_3DAC(0x656D614E707061, 0xE700000000000000, v4);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)(inited + 112) = v12;
    *(void *)(inited + 120) = v14;
  }
  else
  {
    *(void *)(inited + 112) = 0;
    *(void *)(inited + 120) = 0;
  }
  sub_3EAC(&qword_10338);
  sub_A570();
  uint64_t v15 = sub_A390();
  swift_allocObject();
  uint64_t v16 = sub_A380();
  a2[3] = v15;
  unint64_t result = sub_3F9C();
  a2[4] = result;
  *a2 = v16;
  return result;
}

double sub_3D48@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_91A8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_3FEC(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_3DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_91A8(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

void *sub_3E08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_3E4C(uint64_t a1)
{
  uint64_t v2 = sub_3EAC(&qword_10310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3EAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3EF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3F38(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_3EF0(&qword_10320);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_3F9C()
{
  unint64_t result = qword_10340;
  if (!qword_10340)
  {
    sub_A390();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10340);
  }
  return result;
}

uint64_t sub_3FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for RelevantAppConfigurator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RelevantAppConfigurator()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RelevantAppConfigurator(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RelevantAppConfigurator(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for RelevantAppConfigurator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RelevantAppConfigurator(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RelevantAppConfigurator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RelevantAppConfigurator()
{
  return &type metadata for RelevantAppConfigurator;
}

uint64_t sub_4190(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_A3B0();
  v2[6] = v3;
  sub_49D4(v3);
  v2[7] = v4;
  v2[8] = swift_task_alloc();
  uint64_t v5 = sub_A550();
  v2[9] = v5;
  sub_49D4(v5);
  v2[10] = v6;
  v2[11] = swift_task_alloc();
  return _swift_task_switch(sub_4264, 0, 0);
}

uint64_t sub_4264()
{
  v32 = v0;
  if (qword_102D0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  uint64_t v8 = sub_4930(v3, (uint64_t)qword_10D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  uint64_t v9 = sub_A540();
  os_log_type_t v10 = sub_A620();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v15 = v0[8];
  uint64_t v14 = v0[9];
  uint64_t v16 = v0[7];
  if (v11)
  {
    uint64_t v30 = v0[11];
    uint64_t v28 = v0[6];
    os_log_type_t type = v10;
    v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)v17 = 136315138;
    v0[2] = sub_A3A0();
    sub_A4C0();
    sub_4968();
    uint64_t v18 = sub_A750();
    unint64_t v20 = v19;
    swift_release();
    v0[3] = sub_8984(v18, v20, &v31);
    sub_A650();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v28);
    _os_log_impl(&dword_0, v9, type, "Updating context with signal: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v30, v14);
  }
  else
  {
    (*(void (**)(void, void))(v16 + 8))(v0[8], v0[6]);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v21 = (void *)v0[4];
  v0[12] = *v21;
  v0[13] = v21[1];
  v0[14] = swift_getObjectType();
  sub_A3A0();
  uint64_t v22 = sub_A4A0();
  uint64_t v24 = v23;
  swift_release();
  v0[15] = v22;
  v0[16] = v24;
  uint64_t v26 = sub_A610();
  return _swift_task_switch(sub_457C, v26, v25);
}

uint64_t sub_457C()
{
  sub_49EC(v0[15], v0[16]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_460C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_463C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_46D8;
  return sub_4190(a1, a2);
}

uint64_t sub_46D8()
{
  sub_49BC();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_47A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_4858;
  return CandidateSuggestionConfigurator.isValid(signal:)(a1, a2, a3);
}

uint64_t sub_4858(uint64_t a1)
{
  sub_49BC();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_4930(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_4968()
{
  unint64_t result = qword_10368;
  if (!qword_10368)
  {
    sub_A4C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10368);
  }
  return result;
}

uint64_t sub_49D4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_49EC(uint64_t a1, uint64_t a2)
{
  if (qword_102D8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10DA8;
  v8[3] = sub_A290();
  v8[4] = &protocol witness table for DomainOwner;
  v8[0] = v4;
  uint64_t v5 = qword_10300;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  v7[3] = &type metadata for String;
  v7[0] = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  sub_A4E0();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v7);
  return _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v8);
}

uint64_t sub_4B10()
{
  if (qword_102D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10DA8;
  v3[3] = sub_A290();
  v3[4] = &protocol witness table for DomainOwner;
  v3[0] = v0;
  uint64_t v1 = qword_10300;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  sub_A4D0();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v3);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_3E4C((uint64_t)v4);
    return 0;
  }
}

uint64_t _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4C9C()
{
  id v1 = [self sharedPreferences];
  uint64_t v2 = sub_4D94(v1);
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    sub_3EAC(&qword_10370);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_AC10;
    *(void *)(v6 + 32) = v4;
    *(void *)(v6 + 40) = v5;
    Class isa = sub_A5D0().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v0 localizedNameWithPreferredLocalizations:isa];
  }
  else
  {
    id v8 = [v0 localizedName];
  }
  uint64_t v9 = sub_A5A0();

  return v9;
}

uint64_t sub_4D94(void *a1)
{
  id v2 = [a1 languageCode];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_A5A0();

  return v3;
}

void *sub_4E04(uint64_t a1)
{
  v1[2] = 0x746E657571657266;
  v1[3] = 0xEB00000000707041;
  v1[4] = a1;
  uint64_t v2 = *(void *)sub_A510();
  v1[8] = sub_A520();
  v1[9] = &protocol witness table for InstalledAppProvider;
  v1[5] = v2;
  swift_retain();
  return v1;
}

void *sub_4E70()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)ATXProactiveSuggestionClient) initWithConsumerSubType:45];
  id v3 = [v2 suggestionLayoutFromCache];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v3 allSuggestionsInLayout];

    sub_61F4(0, &qword_10440);
    uint64_t v6 = (void *)sub_A5E0();
  }
  else
  {
    uint64_t v6 = &_swiftEmptyArrayStorage;
  }
  sub_508C(5, (unint64_t)v6, (uint64_t (*)(id *))sub_5038, 0, (uint64_t *)v15);
  v18[0] = v15[0];
  v18[1] = v15[1];
  uint64_t v19 = v16;
  uint64_t v20 = v17;
  v21 = sub_57F4;
  uint64_t v22 = v1;
  uint64_t v23 = sub_5978;
  uint64_t v24 = 0;
  uint64_t v25 = sub_5988;
  uint64_t v26 = 0;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_retain();
  sub_5D4C(v18);
  uint64_t v8 = v7;
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_59D0();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v9 = sub_52B4(2, v8);
  uint64_t v13 = sub_5534(v9, v10, v11, v12);

  return v13;
}

BOOL sub_5038(id *a1)
{
  id v1 = [*a1 executableSpecification];
  id v2 = (char *)[v1 executableType];

  return v2 == (unsigned char *)&dword_0 + 1;
}

Swift::Int sub_508C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(id *)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = a4;
    uint64_t v6 = a3;
    unint64_t v8 = a2;
    uint64_t v9 = a1;
    uint64_t v7 = a5;
    unint64_t v10 = sub_6230(a2, a3);
    unint64_t v11 = v8 >> 62;
    if (!(v8 >> 62))
    {
      uint64_t v12 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_A720();
  swift_bridgeObjectRelease();
LABEL_4:
  unint64_t v13 = sub_634C(v10, v9, v12, v8, v6);
  if (v14) {
    Swift::Int v15 = v12;
  }
  else {
    Swift::Int v15 = v13;
  }
  Swift::Int result = sub_6230(v8, v6);
  if (v15 < result)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v17 = result;
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_A720();
    Swift::Int result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
  }
  if (v18 < v17) {
    goto LABEL_29;
  }
  if (v17 < 0)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_A720();
    Swift::Int result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
  }
  if (v19 < v15) {
    goto LABEL_31;
  }
  if ((v8 & 0xC000000000000001) != 0 && v17 != v15)
  {
    if (v17 < (unint64_t)v15)
    {
      sub_61F4(0, &qword_10440);
      Swift::Int result = v17;
      do
      {
        Swift::Int v20 = result + 1;
        sub_A690(result);
        Swift::Int result = v20;
      }
      while (v15 != v20);
      goto LABEL_22;
    }
LABEL_32:
    __break(1u);
    return result;
  }
LABEL_22:
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_A730();
    uint64_t v22 = v24;
    uint64_t v17 = v25;
    uint64_t v23 = v26;
    Swift::Int result = swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v21 = v8 & 0xFFFFFFFFFFFFFF8;
    uint64_t v22 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
    uint64_t v23 = (2 * v15) | 1;
  }
  *uint64_t v7 = v21;
  v7[1] = v22;
  v7[2] = v17;
  v7[3] = v23;
  void v7[4] = (uint64_t)v6;
  v7[5] = v5;
  return result;
}

uint64_t sub_52B4(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  Swift::Int result = sub_5D00(0, result, v3);
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

void sub_5324(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = [*a1 executableSpecification];
  id v6 = [v5 executableObject];

  if (!v6) {
    goto LABEL_6;
  }
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
LABEL_6:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return;
  }
  uint64_t v8 = v7;
  uint64_t v9 = a2[9];
  sub_3E08(a2 + 5, a2[8]);
  uint64_t v10 = sub_A5A0();
  unint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))(v9 + 24))(v10);
  swift_bridgeObjectRelease();
  if (v11)
  {
    sub_3EAC(&qword_10458);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_AB20;
    *(void *)(inited + 32) = 0x656D614E707061;
    *(void *)(inited + 40) = 0xE700000000000000;
    *(void *)(inited + 48) = sub_4C9C();
    *(void *)(inited + 56) = v13;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 80) = 0x6449707061;
    *(void *)(inited + 88) = 0xE500000000000000;
    *(void *)(inited + 120) = sub_61F4(0, &qword_10460);
    *(void *)(inited + 96) = v8;
    swift_unknownObjectRetain();
    uint64_t v14 = sub_A570();
    *(void *)(a3 + 24) = sub_3EAC(&qword_10468);

    swift_unknownObjectRelease();
    *(void *)a3 = v14;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    swift_unknownObjectRelease();
  }
}

void *sub_5534(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_A770();
  swift_unknownObjectRetain_n();
  uint64_t v10 = (void *)swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v11 = v10[2];
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
    sub_5B5C(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = &_swiftEmptyArrayStorage;
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_561C()
{
  swift_bridgeObjectRelease();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v0 + 40);
  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for FrequentAppResolver()
{
  return self;
}

uint64_t sub_5680()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_56B4()
{
  uint64_t v1 = sub_4E70();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_57E4(v2, v0, (uint64_t)v1);
}

uint64_t sub_573C()
{
  return sub_57A4((unint64_t *)&unk_10428);
}

uint64_t sub_5770()
{
  return sub_57A4(&qword_10438);
}

uint64_t sub_57A4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FrequentAppResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_57E4(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void sub_57F4(id *a1@<X0>, uint64_t a2@<X8>)
{
  sub_5324(a1, v2, a2);
}

char *sub_5800(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_A740();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_5894(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((v5 = a1, a3 + 32 * a2 > a1) ? (BOOL v6 = a1 + 32 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v7 = sub_A740();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return _swift_arrayInitWithCopy(v7, v5);
}

BOOL sub_5978(uint64_t a1)
{
  return *(void *)(a1 + 24) != 0;
}

_OWORD *sub_5988@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t result = (_OWORD *)sub_618C(a1, (uint64_t)&v4);
  if (v5) {
    return sub_60AC(&v4, a2);
  }
  __break(1u);
  return result;
}

void sub_59D0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *((void *)*v0 + 2);
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      *(void *)&v14[0] = 0;
      swift_stdlib_random();
      uint64_t v5 = (*(unint64_t *)&v14[0] * (unsigned __int128)v2) >> 64;
      if (v2 > *(void *)&v14[0] * v2)
      {
        unint64_t v6 = -(uint64_t)v2 % v2;
        if (v6 > *(void *)&v14[0] * v2)
        {
          do
          {
            *(void *)&v14[0] = 0;
            swift_stdlib_random();
          }
          while (v6 > *(void *)&v14[0] * v2);
          uint64_t v5 = (*(unint64_t *)&v14[0] * (unsigned __int128)v2) >> 64;
        }
      }
      unint64_t v7 = v4 + v5;
      if (__OFADD__(v4, v5)) {
        break;
      }
      if (v4 != v7)
      {
        unint64_t v8 = *((void *)v1 + 2);
        if (v4 >= v8) {
          goto LABEL_20;
        }
        sub_3FEC((uint64_t)&v1[32 * v4 + 32], (uint64_t)v14);
        if (v7 >= v8) {
          goto LABEL_21;
        }
        sub_3FEC((uint64_t)&v1[32 * v7 + 32], (uint64_t)v13);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        void *v0 = v1;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v1 = sub_6098((uint64_t)v1);
          void *v0 = v1;
        }
        if (v4 >= *((void *)v1 + 2)) {
          goto LABEL_22;
        }
        uint64_t v10 = &v1[32 * v4 + 32];
        _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v10);
        sub_60AC(v13, v10);
        if (v7 >= *((void *)*v0 + 2)) {
          goto LABEL_23;
        }
        uint64_t v11 = &(*v0)[32 * v7 + 32];
        _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v11);
        sub_60AC(v14, v11);
        uint64_t v1 = *v0;
      }
      --v2;
      if (v4++ == v3) {
        return;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
}

void sub_5B5C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
      unint64_t v8 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_3EAC(&qword_10448);
      unint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 32);
    }
    if (v4 != a3)
    {
      sub_5894(a2 + 32 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

char *sub_5C1C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3EAC(&qword_10448);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_5800(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5894((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_5D00(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_5D4C(void *a1)
{
  void (*v30)(void *__return_ptr, id *);
  void (*v31)(long long *__return_ptr, void *);
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void v37[4];
  unsigned char v38[24];
  uint64_t v39;
  void v40[4];
  long long v41;
  long long v42;
  _OWORD v43[2];

  uint64_t v1 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v2 = a1[3];
  unint64_t v4 = (uint64_t (*)(id *))a1[4];
  v29 = (uint64_t (*)(unsigned char *))a1[8];
  uint64_t v30 = (void (*)(void *__return_ptr, id *))a1[6];
  uint64_t v31 = (void (*)(long long *__return_ptr, void *))a1[10];
  sub_60BC((uint64_t)a1);
  v34 = 0;
  int64_t v5 = v2 >> 1;
  v32 = &_swiftEmptyArrayStorage;
  uint64_t v33 = (char *)&_swiftEmptyArrayStorage + 32;
  uint64_t v28 = (v2 >> 1) - 1;
  uint64_t v6 = v3;
  while (1)
  {
    if (v6 == v5)
    {
LABEL_3:
      memset(v40, 0, 24);
      uint64_t v6 = v5;
      v40[3] = 1;
    }
    else
    {
      while (1)
      {
        uint64_t v21 = v6;
        while (1)
        {
          if (v6 < v3 || v21 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          uint64_t v23 = v21 + 1;
          v36 = *(id *)(v1 + 8 * v21);
          id v24 = v36;
          if (v4(&v36)) {
            break;
          }

          ++v21;
          if (v5 == v23) {
            goto LABEL_3;
          }
        }
        v36 = v24;
        v30(v37, &v36);

        sub_6128((uint64_t)v37, (uint64_t)v38, &qword_10310);
        if (v29(v38)) {
          break;
        }
        sub_3E4C((uint64_t)v38);
        uint64_t v6 = v21 + 1;
        if (v28 == v21) {
          goto LABEL_3;
        }
      }
      sub_6128((uint64_t)v38, (uint64_t)v40, &qword_10310);
      uint64_t v6 = v21 + 1;
    }
    sub_6128((uint64_t)v40, (uint64_t)v38, &qword_10450);
    uint64_t v7 = v34;
    if (v39 == 1) {
      break;
    }
    sub_6128((uint64_t)v38, (uint64_t)v37, &qword_10310);
    v31(&v41, v37);
    sub_3E4C((uint64_t)v37);
    uint64_t v8 = v33;
    if (!*((void *)&v42 + 1)) {
      goto LABEL_36;
    }
    sub_60AC(&v41, v43);
    if (!v34)
    {
      unint64_t v9 = v32[3];
      if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_41;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if (v10 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      sub_3EAC(&qword_10448);
      uint64_t v12 = (void *)swift_allocObject();
      uint64_t v13 = (uint64_t)(j__malloc_size(v12) - 32) / 32;
      v12[2] = v11;
      v12[3] = 2 * v13;
      unint64_t v14 = (unint64_t)(v12 + 4);
      unint64_t v15 = v32[3];
      unint64_t v16 = v15 >> 1;
      if (v32[2])
      {
        if (v12 != v32 || v14 >= (unint64_t)&v32[4 * v16 + 4])
        {
          v35 = v13;
          unint64_t v18 = v32[3];
          memmove(v12 + 4, v32 + 4, 32 * v16);
          unint64_t v15 = v18;
          uint64_t v13 = v35;
        }
        v32[2] = 0;
      }
      uint64_t v8 = (_OWORD *)(v14 + 32 * v16);
      uint64_t v7 = (v13 & 0x7FFFFFFFFFFFFFFFLL) - (v15 >> 1);
      swift_release();
      v32 = v12;
    }
    BOOL v19 = __OFSUB__(v7, 1);
    uint64_t v20 = v7 - 1;
    if (v19)
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v34 = v20;
    sub_60AC(v43, v8);
    uint64_t v33 = (char *)(v8 + 2);
  }
  v41 = 0u;
  v42 = 0u;
LABEL_36:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_3E4C((uint64_t)&v41);
  unint64_t v25 = v32[3];
  if (v25 < 2) {
    return;
  }
  unint64_t v26 = v25 >> 1;
  BOOL v19 = __OFSUB__(v26, v34);
  unint64_t v27 = v26 - v34;
  if (!v19)
  {
    v32[2] = v27;
    return;
  }
LABEL_42:
  __break(1u);
}

char *sub_6098(uint64_t a1)
{
  return sub_5C1C(0, *(void *)(a1 + 16), 0, a1);
}

_OWORD *sub_60AC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_60BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_6128(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3EAC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_618C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3EAC(&qword_10310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_61F4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_6230(unint64_t a1, uint64_t (*a2)(id *))
{
  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_A720();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
        id v6 = (id)sub_A6A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v7 = *(void **)(a1 + 8 * v5 + 32);
        swift_retain();
        id v6 = v7;
      }
      id v11 = v6;
      char v8 = a2(&v11);

      swift_release();
      if (v8) {
        break;
      }
      uint64_t v9 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      ++v5;
      if (v9 == v4) {
        return v4;
      }
    }
  }
  return v5;
}

unint64_t sub_634C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(id *))
{
  unint64_t v7 = a2;
  uint64_t v9 = a2 > 0;
  uint64_t v10 = v9 | (a2 >> 63);
  uint64_t i = a4 >> 62;
  if (v10 < 0)
  {
    if (i) {
      goto LABEL_38;
    }
    uint64_t v12 = *(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFFF8));
    goto LABEL_7;
  }
  if (a2 < 0) {
    goto LABEL_8;
  }
  while (v7)
  {
LABEL_10:
    if (a1 == a3) {
      return 0;
    }
    int64_t v21 = v7;
    uint64_t v9 = a4 & 0xFFFFFFFFFFFFFF8;
    if (i)
    {
LABEL_40:
      uint64_t v23 = v9;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_A720();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = a4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v14 = *(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFFF8));
    }
    unint64_t v7 = a4 & 0xC000000000000001;
    for (uint64_t i = 1; ; ++i)
    {
      unint64_t v15 = a1 + v10;
      if (__OFADD__(a1, v10)) {
        break;
      }
      a1 = v14;
      if (v15 != v14)
      {
        a1 = v15;
        while (1)
        {
          if (v7)
          {
            swift_bridgeObjectRetain();
            swift_retain();
            id v16 = (id)sub_A6A0();
            swift_bridgeObjectRelease();
          }
          else
          {
            if ((a1 & 0x8000000000000000) != 0) {
              goto LABEL_33;
            }
            if (a1 >= *(void *)(v23 + 16)) {
              goto LABEL_34;
            }
            uint64_t v17 = *(void **)(a4 + 8 * a1 + 32);
            swift_retain();
            id v16 = v17;
          }
          id v24 = v16;
          char v18 = a5(&v24);

          swift_release();
          if (v18) {
            goto LABEL_27;
          }
          unint64_t v19 = a1 + v10;
          if (__OFADD__(a1, v10)) {
            break;
          }
          a1 += v10;
          if (v19 == v14)
          {
            a1 = v14;
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        break;
      }
LABEL_27:
      if (i == v21) {
        return a1;
      }
      if (i >= v21) {
        goto LABEL_36;
      }
      if (a1 == a3) {
        return 0;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
    while (1)
    {
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_A720();
      swift_bridgeObjectRelease();
LABEL_7:
      sub_5D00(v12, v10, 0);
      if ((v7 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_8:
      BOOL v13 = __OFSUB__(0, v7);
      unint64_t v7 = -(uint64_t)v7;
      if (v13)
      {
        __break(1u);
        goto LABEL_40;
      }
      if ((v7 & 0x8000000000000000) == 0) {
        goto LABEL_10;
      }
    }
  }
  return a1;
}

void *sub_657C(uint64_t a1)
{
  v1[2] = 0x746E6176656C6572;
  v1[3] = 0xEB00000000707041;
  v1[4] = a1;
  uint64_t v2 = *(void *)sub_A510();
  v1[8] = sub_A520();
  v1[9] = &protocol witness table for InstalledAppProvider;
  v1[5] = v2;
  swift_retain();
  return v1;
}

uint64_t sub_65E8(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 112) = a2;
  *(void *)(v3 + 120) = v2;
  return _swift_task_switch(sub_6608, 0, 0);
}

uint64_t sub_6608()
{
  sub_3E08(*(void **)(v0 + 112), *(void *)(*(void *)(v0 + 112) + 24));
  *(void *)(v0 + 128) = sub_A330();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = swift_getObjectType();
  uint64_t v3 = sub_A610();
  return _swift_task_switch(sub_66B8, v3, v2);
}

uint64_t sub_66B8()
{
  uint64_t v1 = sub_4B10();
  uint64_t v3 = v2;
  swift_unknownObjectRelease();
  *(void *)(v0 + 152) = v1;
  *(void *)(v0 + 160) = v3;
  return _swift_task_switch(sub_6740, 0, 0);
}

uint64_t sub_6740()
{
  uint64_t v1 = v0[20];
  if (v1)
  {
    uint64_t v2 = v0[19];
    uint64_t v3 = (void *)v0[15];
    uint64_t v4 = v3[8];
    uint64_t v5 = v3[9];
    sub_3E08(v3 + 5, v4);
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v5 + 24))(v2, v1, v3[4], v4, v5);
    if (v6)
    {
      unint64_t v7 = (void *)v6;
      uint64_t v8 = v0[19];
      sub_3EAC(&qword_10448);
      uint64_t v9 = (_OWORD *)swift_allocObject();
      v9[1] = xmmword_AC10;
      sub_3EAC(&qword_10540);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_AB20;
      *(void *)(inited + 32) = 0x656D614E707061;
      *(void *)(inited + 40) = 0xE700000000000000;
      *(void *)(inited + 48) = sub_4C9C();
      *(void *)(inited + 56) = v11;
      *(void *)(inited + 64) = 0x6449707061;
      *(void *)(inited + 72) = 0xE500000000000000;
      *(void *)(inited + 80) = v8;
      *(void *)(inited + 88) = v1;
      uint64_t v12 = sub_A570();
      *((void *)v9 + 7) = sub_3EAC(qword_10348);
      *((void *)v9 + 4) = v12;

      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = &_swiftEmptyArrayStorage;
LABEL_6:
  BOOL v13 = (uint64_t (*)(_OWORD *))v0[1];
  return v13(v9);
}

uint64_t type metadata accessor for RelevantAppResolver()
{
  return self;
}

uint64_t sub_6900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6998;
  return sub_65E8((uint64_t)v4, a2);
}

uint64_t sub_6998(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_6A94()
{
  return sub_6AFC((unint64_t *)&unk_10520);
}

uint64_t sub_6AC8()
{
  return sub_6AFC(&qword_10530);
}

uint64_t sub_6AFC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RelevantAppResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6B3C()
{
  uint64_t v0 = sub_A550();
  sub_6BC8(v0, qword_10D90);
  sub_4930(v0, (uint64_t)qword_10D90);
  if (qword_10308 != -1) {
    swift_once();
  }
  id v1 = (id)qword_10DF0;
  return sub_A560();
}

uint64_t *sub_6BC8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_6C2C()
{
  sub_A290();
  swift_allocObject();
  uint64_t result = sub_A2A0();
  qword_10DA8 = result;
  return result;
}

void sub_6C84()
{
  qword_10DB0 = 0x746E6176656C6572;
  *(void *)algn_10DB8 = 0xEB00000000707041;
}

uint64_t sub_6CB0()
{
  if (qword_102E0 != -1) {
    swift_once();
  }
  sub_3EAC(&qword_10658);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_AB20;
  sub_3EAC(&qword_10660);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_AC10;
  uint64_t v2 = (void *)sub_A530();
  *(void *)(v1 + 32) = *v2;
  sub_7A44();
  sub_3EAC(&qword_10670);
  sub_7A90();
  sub_A670();
  uint64_t v3 = type metadata accessor for RelevantAppResolver();
  swift_allocObject();
  uint64_t v4 = sub_657C(v9);
  *(void *)(v0 + 56) = v3;
  *(void *)(v0 + 64) = sub_9688(&qword_10680, (void (*)(uint64_t))type metadata accessor for RelevantAppResolver);
  *(void *)(v0 + 32) = v4;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_AC10;
  *(void *)(v5 + 32) = *v2;
  sub_A670();
  uint64_t v6 = type metadata accessor for FrequentAppResolver();
  swift_allocObject();
  unint64_t v7 = sub_4E04(v9);
  *(void *)(v0 + 96) = v6;
  *(void *)(v0 + 104) = sub_9688(&qword_10688, (void (*)(uint64_t))type metadata accessor for FrequentAppResolver);
  *(void *)(v0 + 72) = v7;
  sub_A4F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_6F28()
{
  sub_A350();
  if (qword_102E0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_A340();
  qword_10DC0 = result;
  return result;
}

uint64_t sub_6FB4(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return _swift_task_switch(sub_6FD8, 0, 0);
}

uint64_t sub_6FD8()
{
  if (qword_102D8 != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[17];
  uint64_t v2 = qword_10DA8;
  v0[10] = sub_A290();
  v0[11] = sub_9688(&qword_10618, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[7] = v2;
  uint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_7148;
  return v5(v0 + 7);
}

uint64_t sub_7148()
{
  sub_49BC();
  uint64_t v1 = v0 + 56;
  *(void *)(v0 + 168) = v2;
  swift_task_dealloc();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v1);
  return _swift_task_switch(sub_7230, 0, 0);
}

uint64_t sub_7230()
{
  uint64_t v1 = *(void *)(v0 + 152);
  *(void *)(v0 + 120) = &type metadata for AppLaunchConfigurationProvider;
  *(void *)(v0 + 128) = sub_77F4();
  sub_A430();
  swift_release();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v0 + 96);
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_A440();
  swift_release();
  swift_task_dealloc();
  sub_A450();
  swift_release();
  sub_3EAC(&qword_10628);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_AC10;
  sub_7848((long long *)(v0 + 16), v2 + 32);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_7398(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a1 + 32);
  sub_3E08((void *)a1, v1);
  sub_3EAC(&qword_10630);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_ADE0;
  sub_A4C0();
  *(void *)(v2 + 32) = sub_A480();
  v25[0] = v2;
  sub_A600();
  uint64_t v26 = v1;
  long long v27 = v8;
  sub_7860(v25);
  sub_A280();
  swift_bridgeObjectRelease();
  uint64_t v3 = v26;
  long long v9 = v27;
  sub_3E08(v25, v26);
  *(void *)&long long v21 = &type metadata for RelevantAppConfigurator;
  *((void *)&v21 + 1) = sub_78C4();
  v20[0] = 0xD00000000000002ELL;
  v20[1] = 0x800000000000B330;
  *(void *)id v24 = v3;
  *(_OWORD *)&v24[8] = v9;
  sub_7860(v23);
  sub_A270();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v20);
  uint64_t v4 = *(void *)&v24[16];
  long long v10 = *(_OWORD *)v24;
  sub_3E08(v23, *(uint64_t *)v24);
  long long v21 = v10;
  uint64_t v22 = v4;
  sub_7860(v20);
  sub_A400();
  uint64_t v5 = v22;
  long long v11 = v21;
  sub_3E08(v20, v21);
  if (qword_102E8 != -1) {
    swift_once();
  }
  sub_7910((uint64_t)&unk_10548, (uint64_t)v14);
  if (qword_102F0 != -1) {
    swift_once();
  }
  long long v18 = v11;
  uint64_t v19 = v5;
  sub_7860(v17);
  sub_A410();
  sub_914C((uint64_t)v14, &qword_10640);
  uint64_t v6 = v19;
  long long v12 = v18;
  sub_3E08(v17, v18);
  *(void *)&long long v15 = &type metadata for LaunchAppActionProvider;
  *((void *)&v15 + 1) = sub_7974();
  v13[3] = &type metadata for AppViewProvider;
  v13[4] = sub_79C0();
  v13[0] = swift_allocObject();
  sub_971C((uint64_t)v14, v13[0] + 16);
  long long v15 = v12;
  uint64_t v16 = v6;
  sub_7860(v14);
  sub_A3F0();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v13);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v14);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v17);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v20);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v23);
  return _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v25);
}

uint64_t sub_7714()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AppLaunchOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_7748()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t sub_7750(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_4858;
  return sub_6FB4(a1, a2);
}

unint64_t sub_77F4()
{
  unint64_t result = qword_10620;
  if (!qword_10620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10620);
  }
  return result;
}

uint64_t sub_7840(uint64_t a1)
{
  return sub_7398(a1);
}

uint64_t sub_7848(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_7860(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_78C4()
{
  unint64_t result = qword_10638;
  if (!qword_10638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10638);
  }
  return result;
}

uint64_t sub_7910(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_7974()
{
  unint64_t result = qword_10648;
  if (!qword_10648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10648);
  }
  return result;
}

unint64_t sub_79C0()
{
  unint64_t result = qword_10650;
  if (!qword_10650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10650);
  }
  return result;
}

uint64_t sub_7A0C()
{
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_7A44()
{
  unint64_t result = qword_10668;
  if (!qword_10668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10668);
  }
  return result;
}

unint64_t sub_7A90()
{
  unint64_t result = qword_10678;
  if (!qword_10678)
  {
    sub_3EF0(&qword_10670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10678);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchConfigurationProvider()
{
  return &type metadata for AppLaunchConfigurationProvider;
}

uint64_t sub_7AF4(unint64_t a1)
{
  uint64_t v2 = sub_A300();
  sub_96D0();
  uint64_t v57 = v3;
  ((void (*)(void))__chkstk_darwin)();
  sub_96EC();
  uint64_t v51 = v5 - v4;
  uint64_t v58 = sub_3EAC(&qword_10690);
  ((void (*)(void))__chkstk_darwin)();
  sub_96EC();
  uint64_t v8 = v7 - v6;
  sub_3EAC(&qword_10698);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  long long v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v49 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v49 - v15;
  uint64_t v17 = sub_A550();
  sub_96D0();
  uint64_t v19 = v18;
  __chkstk_darwin(v20);
  sub_96EC();
  uint64_t v23 = v22 - v21;
  if (qword_102D0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_4930(v17, (uint64_t)qword_10D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v23, v24, v17);
  swift_bridgeObjectRetain_n();
  unint64_t v25 = sub_A540();
  os_log_type_t v26 = sub_A630();
  LODWORD(v56) = v26;
  BOOL v27 = os_log_type_enabled(v25, v26);
  unint64_t v53 = a1;
  v59 = v11;
  if (v27)
  {
    v55 = (void (**)(char *, void, uint64_t))v17;
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v60[0] = v54;
    v52 = v28;
    *(_DWORD *)uint64_t v28 = 136315138;
    v50 = (void (**)(uint64_t, uint64_t, uint64_t))(v28 + 4);
    sub_A4C0();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_A5F0();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v32 = v29;
    a1 = v53;
    v61 = (void *)sub_8984(v32, v31, v60);
    long long v11 = v59;
    sub_A650();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v25, (os_log_type_t)v56, "Generating configurators for signals: %s", v52, 0xCu);
    id v56 = v25;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, void (**)(char *, void, uint64_t)))(v19 + 8))(v23, v55);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v17);
  }
  v61 = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_A720();
    if (v33) {
      goto LABEL_8;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    unint64_t v42 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_29;
  }
  uint64_t v33 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v33) {
    goto LABEL_28;
  }
LABEL_8:
  if (v33 < 1)
  {
    __break(1u);
    swift_release();
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  uint64_t v34 = 0;
  id v56 = (id)(a1 & 0xC000000000000001);
  v55 = (void (**)(char *, void, uint64_t))(v57 + 104);
  LODWORD(v54) = enum case for CoreSignalTypes.app(_:);
  v49 = v14;
  v50 = (void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32);
  v52 = (uint8_t *)(v57 + 8);
  uint64_t v57 = v33;
  do
  {
    if (v56) {
      sub_A6A0();
    }
    else {
      swift_retain();
    }
    sub_A490();
    sub_3EAC(&qword_106A0);
    int v35 = swift_dynamicCast();
    sub_87E0((uint64_t)v16, v35 ^ 1u, 1, v2);
    (*v55)(v14, v54, v2);
    sub_87E0((uint64_t)v14, 0, 1, v2);
    uint64_t v36 = v8 + *(int *)(v58 + 48);
    sub_8808((uint64_t)v16, v8);
    sub_8808((uint64_t)v14, v36);
    sub_96FC(v8);
    if (v37)
    {
      sub_96FC(v36);
      if (!v37) {
        goto LABEL_21;
      }
      sub_914C(v8, &qword_10698);
      sub_914C((uint64_t)v14, &qword_10698);
      sub_914C((uint64_t)v16, &qword_10698);
    }
    else
    {
      sub_8808(v8, (uint64_t)v11);
      sub_96FC(v36);
      if (v37)
      {
        (*(void (**)(char *, uint64_t))v52)(v11, v2);
LABEL_21:
        sub_914C(v8, &qword_10690);
        sub_914C((uint64_t)v14, &qword_10698);
        sub_914C((uint64_t)v16, &qword_10698);
LABEL_22:
        swift_release();
        goto LABEL_25;
      }
      uint64_t v38 = v51;
      (*v50)(v51, v36, v2);
      sub_9688(&qword_106B8, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
      char v39 = sub_A590();
      v40 = *(void (**)(uint64_t, uint64_t))v52;
      (*(void (**)(char *, uint64_t))v52)(v11, v2);
      uint64_t v41 = v38;
      uint64_t v14 = v49;
      v40(v41, v2);
      sub_914C(v8, &qword_10698);
      sub_914C((uint64_t)v14, &qword_10698);
      sub_914C((uint64_t)v16, &qword_10698);
      if ((v39 & 1) == 0) {
        goto LABEL_22;
      }
    }
    sub_A6C0();
    sub_A6E0();
    sub_A6F0();
    sub_A6D0();
LABEL_25:
    ++v34;
    long long v11 = v59;
  }
  while (v57 != v34);
  swift_bridgeObjectRelease();
  unint64_t v42 = (unint64_t)v61;
LABEL_29:
  sub_A4C0();
  sub_3EAC(&qword_106A8);
  sub_9688(&qword_106B0, (void (*)(uint64_t))&type metadata accessor for Signal);
  uint64_t v43 = sub_A570();
  v60[0] = v43;
  if ((v42 & 0x8000000000000000) != 0 || (v42 & 0x4000000000000000) != 0) {
    goto LABEL_40;
  }
  uint64_t v44 = *(void *)(v42 + 16);
  swift_retain();
  for (; v44; uint64_t v44 = sub_A720())
  {
    uint64_t v43 = 0;
    for (uint64_t i = 4; ; ++i)
    {
      if ((v42 & 0xC000000000000001) != 0)
      {
        v46 = (void *)sub_A6A0();
      }
      else
      {
        v46 = *(void **)(v42 + 8 * i);
        swift_retain();
      }
      uint64_t v47 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      v61 = v46;
      sub_8330((uint64_t)v60, (uint64_t *)&v61);
      swift_release();
      if (v47 == v44)
      {
        swift_release_n();
        return v60[0];
      }
    }
    __break(1u);
LABEL_40:
    swift_retain();
  }
  swift_release_n();
  return v43;
}

uint64_t sub_8330(uint64_t a1, uint64_t *a2)
{
  uint64_t v30 = a1;
  uint64_t v3 = sub_A550();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3EAC(&qword_106C8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_A2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a2;
  sub_A4B0();
  if (sub_8870((uint64_t)v8, 1, v9) == 1) {
    return sub_914C((uint64_t)v8, &qword_106C8);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if (sub_A2D0() & 1) == 0 && (sub_A2C0())
  {
    if (qword_102D0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_4930(v3, (uint64_t)qword_10D90);
    uint64_t v16 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
    swift_retain_n();
    uint64_t v17 = sub_A540();
    os_log_type_t v18 = sub_A630();
    int v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v20 = swift_slowAlloc();
      int v27 = v19;
      uint64_t v21 = (uint8_t *)v20;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v32 = v28;
      uint64_t v29 = v16;
      *(_DWORD *)uint64_t v21 = 136315138;
      v25[2] = v21 + 4;
      os_log_type_t v26 = v21;
      uint64_t v31 = v13;
      v25[1] = sub_A4C0();
      sub_9688((unint64_t *)&qword_10368, (void (*)(uint64_t))&type metadata accessor for Signal);
      uint64_t v22 = sub_A750();
      uint64_t v31 = sub_8984(v22, v23, &v32);
      sub_A650();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v17, (os_log_type_t)v27, "Adding LaunchApp configuration for signal: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v3);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v3);
    }
    sub_3EAC(&qword_106D0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_AC10;
    *(void *)(v24 + 56) = &type metadata for RelevantAppConfigurator;
    *(void *)(v24 + 64) = sub_78C4();
    *(void *)(v24 + 32) = 0xD00000000000002ELL;
    *(void *)(v24 + 40) = 0x800000000000B330;
    swift_retain();
    sub_94AC(v24, v13);
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_87E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_8808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3EAC(&qword_10698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_8898(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_88A8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_88E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_890C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_8984(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_A650();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_8984(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_8A58(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_3FEC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_3FEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_8A58(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_8BB0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_A660();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_8C88(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_A6B0();
    if (!v8)
    {
      uint64_t result = sub_A710();
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

void *sub_8BB0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A740();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_8C88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_8D20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_8EFC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_8EFC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_8D20(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_A5C0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_8E94(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_A680();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_A740();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_A710();
  __break(1u);
  return result;
}

void *sub_8E94(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_3EAC(&qword_106C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_8EFC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_3EAC(&qword_106C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_90AC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_8FD4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_8FD4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A740();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_90AC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_A740();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_913C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_914C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3EAC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_91A8(uint64_t a1, uint64_t a2)
{
  sub_A790();
  sub_A5B0();
  Swift::Int v4 = sub_A7A0();
  return sub_92CC(a1, a2, v4);
}

unint64_t sub_9220(uint64_t a1)
{
  sub_A4C0();
  sub_9688(&qword_106B0, (void (*)(uint64_t))&type metadata accessor for Signal);
  uint64_t v2 = sub_A580();
  return sub_93B0(a1, v2);
}

unint64_t sub_92CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_A760() & 1) == 0)
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
      while (!v14 && (sub_A760() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_93B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_A4C0();
    sub_9688(&qword_106E0, (void (*)(uint64_t))&type metadata accessor for Signal);
    do
    {
      if (sub_A590()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_94AC(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_952C(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_952C(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  int64_t v8 = (void *)*v3;
  unint64_t v9 = sub_9220(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_3EAC(&qword_106D8);
  if (!sub_A700(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_9220(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    sub_A4C0();
    uint64_t result = sub_A780();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  os_log_type_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    sub_9644(v14, a2, a1, v18);
    return swift_retain();
  }
  return result;
}

unint64_t sub_9644(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
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

uint64_t sub_9688(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_96FC(uint64_t a1)
{
  return sub_8870(a1, 1, v1);
}

uint64_t sub_971C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  sub_3EAC(&qword_106E8);
  __chkstk_darwin();
  BOOL v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_102F8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_A260();
  sub_4930(v6, (uint64_t)qword_10DC8);
  uint64_t v7 = sub_A460();
  sub_87E0((uint64_t)v5, 1, 1, v7);
  uint64_t v8 = sub_A370();
  swift_allocObject();
  uint64_t v9 = sub_A360();
  v11[3] = v8;
  v11[4] = &protocol witness table for StaticIconUrlProvider;
  v11[0] = v9;
  sub_A2F0();
  swift_bridgeObjectRelease();
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(a1);
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0((uint64_t)v11);
  return sub_7848(&v12, a2);
}

uint64_t sub_988C()
{
  return sub_A2B0();
}

uint64_t sub_98D0(uint64_t a1)
{
  return sub_9900(a1, (uint64_t (*)(uint64_t, uint64_t, void))&dispatch thunk of DialogCallbacksProvider.getSpokenDialogCallback(context:));
}

uint64_t sub_98E8(uint64_t a1)
{
  return sub_9900(a1, (uint64_t (*)(uint64_t, uint64_t, void))&dispatch thunk of DialogCallbacksProvider.getDisplayedDialogCallback(context:));
}

uint64_t sub_9900(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void))
{
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  sub_3E08(v2, v5);
  return a2(a1, v5, *(void *)(v6 + 16));
}

uint64_t sub_9964()
{
  return sub_A3D0();
}

uint64_t sub_99A8(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_3EAC(&qword_106E8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (uint64_t *)((char *)v18 - v7);
  sub_3E08(a2, a2[3]);
  uint64_t v9 = sub_A320();
  sub_3D48(7368801, 0xE300000000000000, v9, &v19);
  swift_bridgeObjectRelease();
  if (!v20)
  {
    sub_3E4C((uint64_t)&v19);
LABEL_6:
    strcpy(v6, "com.apple.siri");
    v6[15] = -18;
    uint64_t v15 = enum case for Image.appIcon(_:);
    uint64_t v16 = sub_A460();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v6, v15, v16);
    sub_87E0((uint64_t)v6, 0, 1, v16);
    return sub_A470();
  }
  sub_3EAC(qword_10348);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v10 = sub_3DAC(0x6449707061, 0xE500000000000000, v18[1]);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_6;
  }
  *uint64_t v8 = v10;
  v8[1] = v12;
  uint64_t v13 = enum case for Image.appIcon(_:);
  uint64_t v14 = sub_A460();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v8, v13, v14);
  sub_87E0((uint64_t)v8, 0, 1, v14);
  return sub_A470();
}

uint64_t sub_9C00(uint64_t a1)
{
  return sub_9900(a1, (uint64_t (*)(uint64_t, uint64_t, void))&dispatch thunk of DialogCallbacksProvider.getSpokenDialogCallback(context:));
}

uint64_t sub_9C2C(uint64_t a1)
{
  return sub_9900(a1, (uint64_t (*)(uint64_t, uint64_t, void))&dispatch thunk of DialogCallbacksProvider.getDisplayedDialogCallback(context:));
}

uint64_t sub_9C60(uint64_t a1, void *a2)
{
  return sub_99A8(a1, a2);
}

uint64_t initializeBufferWithCopyOfBuffer for AppViewProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for AppViewProvider(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AppViewProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_9D30(uint64_t *result, uint64_t *a2)
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
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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

__n128 initializeWithTake for AppViewProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppViewProvider(uint64_t a1, uint64_t a2)
{
  _s26AppLaunchSuggestionsPlugin15AppViewProviderVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppViewProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppViewProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppViewProvider()
{
  return &type metadata for AppViewProvider;
}

unint64_t sub_A04C()
{
  unint64_t result = qword_106F0;
  if (!qword_106F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_106F0);
  }
  return result;
}

unint64_t sub_A09C()
{
  unint64_t result = qword_106F8;
  if (!qword_106F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_106F8);
  }
  return result;
}

void *sub_A0E8()
{
  return sub_3E08(v0, v0[3]);
}

uint64_t sub_A114()
{
  uint64_t v0 = sub_A260();
  sub_6BC8(v0, qword_10DC8);
  sub_4930(v0, (uint64_t)qword_10DC8);
  return sub_A250();
}

void sub_A17C()
{
  qword_10DE0 = 0x746E6176656C6572;
  *(void *)algn_10DE8 = 0xEB00000000707041;
}

uint64_t sub_A1A8()
{
  sub_A210();
  uint64_t result = sub_A640();
  qword_10DF0 = result;
  return result;
}

unint64_t sub_A210()
{
  unint64_t result = qword_10700;
  if (!qword_10700)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10700);
  }
  return result;
}

uint64_t sub_A250()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_A260()
{
  return type metadata accessor for URL();
}

uint64_t sub_A270()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)();
}

uint64_t sub_A280()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_A290()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_A2A0()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_A2B0()
{
  return dispatch thunk of ViewProvider.getInvocationActionProvider(context:)();
}

uint64_t sub_A2C0()
{
  return SignalContext.explicitRequest.getter();
}

uint64_t sub_A2D0()
{
  return SignalContext.onScreen.getter();
}

uint64_t sub_A2E0()
{
  return type metadata accessor for SignalContext();
}

uint64_t sub_A2F0()
{
  return static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)();
}

uint64_t sub_A300()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_A310()
{
  return dispatch thunk of DialogProperties.getParameters()();
}

uint64_t sub_A320()
{
  return dispatch thunk of CandidateSuggestion.params.getter();
}

uint64_t sub_A330()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t sub_A340()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t sub_A350()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_A360()
{
  return StaticIconUrlProvider.init(icon:)();
}

uint64_t sub_A370()
{
  return type metadata accessor for StaticIconUrlProvider();
}

uint64_t sub_A380()
{
  return DirectInvocationAction.init(siriKitIdentifier:payload:suggestionId:)();
}

uint64_t sub_A390()
{
  return type metadata accessor for DirectInvocationAction();
}

uint64_t sub_A3A0()
{
  return EnvironmentAwareSignal.activeSignal.getter();
}

uint64_t sub_A3B0()
{
  return type metadata accessor for EnvironmentAwareSignal();
}

uint64_t sub_A3D0()
{
  return dispatch thunk of DialogCallbacksProvider.getDescriptionCallback(context:)();
}

uint64_t sub_A3E0()
{
  return DialogCallbacksProvider.getPreambleOverrideCallback(context:deliveryVehicle:)();
}

uint64_t sub_A3F0()
{
  return dispatch thunk of SuggestionDetailsBuilder.viewProvider(_:)();
}

uint64_t sub_A400()
{
  return dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
}

uint64_t sub_A410()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_A430()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConfiguratorProvider(_:)();
}

uint64_t sub_A440()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_A450()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_A460()
{
  return type metadata accessor for Image();
}

uint64_t sub_A470()
{
  return Assets.init(icon:)();
}

uint64_t sub_A480()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_A490()
{
  return Signal.signalType.getter();
}

uint64_t sub_A4A0()
{
  return Signal.signalValue.getter();
}

uint64_t sub_A4B0()
{
  return Signal.context.getter();
}

uint64_t sub_A4C0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_A4D0()
{
  return Context.getParam(for:key:)();
}

uint64_t sub_A4E0()
{
  return Context.setParam(for:key:value:)();
}

uint64_t sub_A4F0()
{
  return static Resolvers.cascadeResolvers(type:resolvers:)();
}

uint64_t sub_A500()
{
  return Wrappable.getRoot()();
}

uint64_t sub_A510()
{
  return InstalledAppProvider.shared.unsafeMutableAddressor();
}

uint64_t sub_A520()
{
  return type metadata accessor for InstalledAppProvider();
}

uint64_t sub_A530()
{
  return Actions.launchable.unsafeMutableAddressor();
}

uint64_t sub_A540()
{
  return Logger.logObject.getter();
}

uint64_t sub_A550()
{
  return type metadata accessor for Logger();
}

uint64_t sub_A560()
{
  return Logger.init(_:)();
}

uint64_t sub_A570()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_A580()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_A590()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_A5A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A5B0()
{
  return String.hash(into:)();
}

Swift::Int sub_A5C0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_A5D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_A5E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A5F0()
{
  return Array.description.getter();
}

uint64_t sub_A600()
{
  return specialized Array._endMutation()();
}

uint64_t sub_A610()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_A620()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_A630()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_A640()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_A650()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A660()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_A670()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_A680()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_A690(Swift::Int a1)
{
}

uint64_t sub_A6A0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_A6B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_A6C0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_A6D0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_A6E0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_A6F0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_A700(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_A710()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A720()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_A730()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_A740()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_A750()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_A760()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A770()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_A780()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_A790()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_A7A0()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}