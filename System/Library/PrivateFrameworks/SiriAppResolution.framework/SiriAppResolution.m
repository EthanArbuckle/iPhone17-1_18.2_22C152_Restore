uint64_t sub_21E88CEC4()
{
  sub_21E8A4BC0();
  sub_21E8A4900();
  swift_bridgeObjectRetain();
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  swift_bridgeObjectRetain();
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  swift_bridgeObjectRetain();
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  return 0;
}

uint64_t sub_21E88D044()
{
  if (!*(void *)(v0 + 24)) {
    return sub_21E8A4D90();
  }
  sub_21E8A4D90();
  swift_bridgeObjectRetain();
  sub_21E8A48F0();
  return swift_bridgeObjectRelease();
}

uint64_t App.appIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.pluginIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.systemExtensionBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.systemUIExtensionBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

void *App.__allocating_init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  result[9] = a6;
  result[4] = a7;
  result[5] = a8;
  return result;
}

void *App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a1;
  v8[3] = a2;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[9] = a6;
  v8[4] = a7;
  v8[5] = a8;
  return v8;
}

double App.__allocating_init(appIdentifier:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for App();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  double result = 0.0;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  return result;
}

double App.__allocating_init(appIdentifier:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for App();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  double result = 0.0;
  *(_OWORD *)(v8 + 48) = 0u;
  *(_OWORD *)(v8 + 64) = 0u;
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = a4;
  return result;
}

uint64_t App.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t App.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_21E88D340()
{
  sub_21E8A4D70();
  if (*(void *)(v0 + 24))
  {
    sub_21E8A4D90();
    swift_bridgeObjectRetain();
    sub_21E8A48F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21E8A4D90();
  }
  return sub_21E8A4DA0();
}

uint64_t sub_21E88D3C8()
{
  return sub_21E88CEC4();
}

uint64_t sub_21E88D3EC(uint64_t *a1, uint64_t *a2)
{
  return _s17SiriAppResolution0B0C2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_21E88D3F8()
{
  uint64_t v1 = *v0;
  sub_21E8A4D70();
  if (*(void *)(v1 + 24))
  {
    sub_21E8A4D90();
    swift_bridgeObjectRetain();
    sub_21E8A48F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21E8A4D90();
  }
  return sub_21E8A4DA0();
}

uint64_t sub_21E88D484()
{
  if (!*(void *)(*(void *)v0 + 24)) {
    return sub_21E8A4D90();
  }
  sub_21E8A4D90();
  swift_bridgeObjectRetain();
  sub_21E8A48F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E88D510()
{
  sub_21E8A4D70();
  if (*(void *)(*(void *)v0 + 24))
  {
    sub_21E8A4D90();
    swift_bridgeObjectRetain();
    sub_21E8A48F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21E8A4D90();
  }
  return sub_21E8A4DA0();
}

uint64_t sub_21E88D598()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E88D5E0()
{
  return sub_21E8A4D80();
}

uint64_t sub_21E88D60C()
{
  return sub_21E8A4DA0();
}

BOOL sub_21E88D650(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_21E88D664@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21E88D674(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t _s17SiriAppResolution0B0C2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t result = (v4 | v5) == 0;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && v4 == v5) {
      return 1;
    }
    else {
      return sub_21E8A4CF0();
    }
  }
  return result;
}

uint64_t type metadata accessor for App()
{
  return self;
}

uint64_t sub_21E88D6F0(uint64_t a1, uint64_t a2)
{
  return sub_21E88D8B0(&qword_267D462F0, a2, (void (*)(uint64_t))type metadata accessor for App);
}

uint64_t method lookup function for App(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for App);
}

uint64_t dispatch thunk of App.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of App.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of App.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of App.__allocating_init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of App.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void type metadata accessor for DMFPolicy(uint64_t a1)
{
}

void type metadata accessor for INSiriAuthorizationStatus(uint64_t a1)
{
}

void sub_21E88D81C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_21E88D864()
{
  return sub_21E88D8B0(&qword_267D46308, 255, type metadata accessor for INSiriAuthorizationStatus);
}

uint64_t sub_21E88D8B0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AppDisplayInfo.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppDisplayInfo.isFirstParty.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

SiriAppResolution::AppDisplayInfo __swiftcall AppDisplayInfo.init(displayName:isFirstParty:)(Swift::String displayName, Swift::Bool isFirstParty)
{
  *(Swift::String *)uint64_t v2 = displayName;
  *(unsigned char *)(v2 + 16) = isFirstParty;
  result.displayName = displayName;
  result.isFirstParty = isFirstParty;
  return result;
}

uint64_t destroy for AppDisplayInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s17SiriAppResolution14AppDisplayInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppDisplayInfo(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppDisplayInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppDisplayInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppDisplayInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppDisplayInfo()
{
  return &type metadata for AppDisplayInfo;
}

uint64_t sub_21E88DACC()
{
  uint64_t v0 = sub_21E8A4A80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8A4A70();
  MEMORY[0x270FA5388]();
  sub_21E8A4820();
  MEMORY[0x270FA5388]();
  sub_21E891434();
  sub_21E8A4800();
  v5[1] = MEMORY[0x263F8EE78];
  sub_21E891474(&qword_267D46398, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D463A0);
  sub_21E8914BC(&qword_267D463A8, &qword_267D463A0);
  sub_21E8A4B10();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_21E8A4AB0();
  qword_267D46310 = result;
  return result;
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v69 = sub_21E8A47C0();
  uint64_t v67 = *(void *)(v69 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v65 = (uint64_t *)((char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v68 = sub_21E8A4840();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v63 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v64 = (char *)&v57 - v9;
  uint64_t v10 = sub_21E8A47F0();
  MEMORY[0x270FA5388](v10);
  uint64_t v62 = sub_21E8A4780();
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_267D47628;
  sub_21E8A4770();
  sub_21E8A4AD0();
  v60 = v12;
  sub_21E8A4760();
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21E8A47A0();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain_n();
  v16 = sub_21E8A4790();
  os_log_type_t v17 = sub_21E8A4A20();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v70 = v15;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v59 = v10;
    uint64_t v21 = a3;
    uint64_t v22 = v20;
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136315138;
    swift_bridgeObjectRetain();
    v72[0] = sub_21E88FA24(a1, a2, aBlock);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v16, v17, "[AppFinder] Searching for Apps Plugins supporting Intent '%s'", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v22;
    a3 = v21;
    MEMORY[0x223C33F60](v23, -1, -1);
    MEMORY[0x223C33F60](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0;
  v58 = (unint64_t *)(v24 + 16);
  v25 = (void *)swift_allocObject();
  v25[2] = v24;
  v25[3] = a1;
  v25[4] = a2;
  v76 = sub_21E89012C;
  v77 = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21E88E96C;
  v75 = &block_descriptor;
  _Block_copy(aBlock);
  v72[0] = MEMORY[0x263F8EE78];
  sub_21E891474(&qword_267D46318, MEMORY[0x263F8F030]);
  swift_bridgeObjectRetain();
  uint64_t v59 = v24;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46320);
  sub_21E8914BC(&qword_267D46328, &qword_267D46320);
  sub_21E8A4B10();
  sub_21E8A4870();
  swift_allocObject();
  sub_21E8A4860();
  swift_release();
  if (qword_267D462C0 != -1) {
    swift_once();
  }
  sub_21E8A4AA0();
  if (*(void *)(a3 + 16))
  {
    uint64_t v26 = swift_bridgeObjectRetain();
    v27 = sub_21E8902D8(v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0;
  }
  v28 = (void (*)(uint64_t@<X0>, uint64_t@<X1>, uint64_t *@<X8>))off_26B562CA0;
  swift_bridgeObjectRetain();
  v28(a1, a2, aBlock);
  v29 = __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v75);
  MEMORY[0x270FA5388](v29);
  *(&v57 - 4) = a1;
  *(&v57 - 3) = a2;
  *(&v57 - 2) = (uint64_t)v27;
  *(&v57 - 1) = 0;
  type metadata accessor for App();
  unint64_t v30 = sub_21E8A4920();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_21E890EA4(v30);
  swift_bridgeObjectRelease();
  uint64_t v73 = v31;
  v32 = v63;
  sub_21E8A4830();
  v33 = v65;
  void *v65 = 250;
  uint64_t v34 = v67;
  uint64_t v35 = v69;
  (*(void (**)(void *, void, uint64_t))(v67 + 104))(v33, *MEMORY[0x263F8F000], v69);
  v36 = v64;
  MEMORY[0x223C33600](v32, v33);
  (*(void (**)(void *, uint64_t))(v34 + 8))(v33, v35);
  v37 = *(void (**)(char *, uint64_t))(v66 + 8);
  uint64_t v38 = v68;
  v37(v32, v68);
  sub_21E8A4850();
  v37(v36, v38);
  if (sub_21E8A47D0())
  {
    v39 = sub_21E8A4790();
    os_log_type_t v40 = sub_21E8A4A40();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      v42 = "[AppFinder] Unexpected timeout waiting for prefetching of [App]";
LABEL_20:
      _os_log_impl(&dword_21E88B000, v39, v40, v42, v41, 2u);
      MEMORY[0x223C33F60](v41, -1, -1);
    }
  }
  else
  {
    v43 = v58;
    swift_beginAccess();
    unint64_t v44 = *v43;
    if (v44)
    {
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
    v39 = sub_21E8A4790();
    os_log_type_t v40 = sub_21E8A4A40();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      v42 = "[AppFinder] Unexpected nil for prefetched [App]";
      goto LABEL_20;
    }
  }

  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  unint64_t v44 = sub_21E89E4E4(a1, a2);
LABEL_22:
  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_21E8A4C90();
    uint64_t v45 = result;
    if (!result) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v45) {
      goto LABEL_31;
    }
  }
  if (v45 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v47 = 0;
  do
  {
    if ((v44 & 0xC000000000000001) != 0)
    {
      uint64_t v48 = MEMORY[0x223C33960](v47, v44);
    }
    else
    {
      uint64_t v48 = *(void *)(v44 + 8 * v47 + 32);
      swift_retain();
    }
    ++v47;
    v72[0] = v48;
    sub_21E88E9B0(v72, &v73, a1, a2);
    swift_release();
  }
  while (v45 != v47);
LABEL_31:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  v49 = sub_21E8A4790();
  os_log_type_t v50 = sub_21E8A4A20();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    v72[0] = v52;
    *(_DWORD *)uint64_t v51 = 134218242;
    swift_beginAccess();
    if ((v73 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_21E8A4B40();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v53 = *(void *)(v73 + 16);
    }
    uint64_t v71 = v53;
    sub_21E8A4AF0();
    *(_WORD *)(v51 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_21E88FA24(a1, a2, v72);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v49, v50, "Found %ld Apps supporting Intent '%s'", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v52, -1, -1);
    MEMORY[0x223C33F60](v51, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t v54 = swift_bridgeObjectRetain();
  uint64_t v55 = sub_21E8901DC(v54);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease_n();
  sub_21E8A4AC0();
  v56 = v60;
  sub_21E8A4760();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v62);
  return v55;
}

uint64_t sub_21E88E8E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  uint64_t v6 = sub_21E89E4E4(a2, a3);
  swift_beginAccess();
  *(void *)(a1 + 16) = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E88E96C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21E88E9B0(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  swift_bridgeObjectRetain();
  char v8 = sub_21E88EC18(v6, v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_21E8A47A0();
    __swift_project_value_buffer(v9, (uint64_t)qword_267D47610);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v10 = sub_21E8A4790();
    os_log_type_t v11 = sub_21E8A4A20();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_21E88FA24(a3, a4, &v16);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v14 = sub_21E88CEC4();
      sub_21E88FA24(v14, v15, &v16);
      sub_21E8A4AF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E88B000, v10, v11, "[AppFinder] Duplicate App supporting Intent '%s' : %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v13, -1, -1);
      MEMORY[0x223C33F60](v12, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_retain();
    sub_21E8A08D0(&v16, v6);
    swift_release();
  }
}

uint64_t sub_21E88EC18(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_retain();
    char v4 = sub_21E8A4B70();
    swift_release();
    return v4 & 1;
  }
  if (*(void *)(a2 + 16))
  {
    sub_21E8A4D70();
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = *(void *)(a1 + 24);
    sub_21E8A4D90();
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_21E8A48F0();
      swift_bridgeObjectRelease();
    }
    uint64_t v8 = sub_21E8A4DA0();
    uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v10 = v8 & ~v9;
    uint64_t v11 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
    {
      uint64_t v12 = ~v9;
      uint64_t v13 = *(void *)(a2 + 48);
      do
      {
        uint64_t v14 = *(void *)(v13 + 8 * v10);
        uint64_t v15 = *(void *)(v14 + 24);
        if (v15)
        {
          if (v7)
          {
            BOOL v16 = *(void *)(v14 + 16) == v6 && v15 == v7;
            if (v16 || (sub_21E8A4CF0() & 1) != 0) {
              return 1;
            }
          }
        }
        else if (!v7)
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

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E8A49F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a4;
  v14[5] = a5;
  v14[6] = a1;
  v14[7] = a2;
  v14[8] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E88F400((uint64_t)v12, (uint64_t)&unk_267D46340, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_21E88EEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  return MEMORY[0x270FA2498](sub_21E88EEE0, 0, 0);
}

uint64_t sub_21E88EEE0()
{
  uint64_t v1 = v0[10];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8902D8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v0[9];
  v0[2] = v0[8];
  v0[11] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_21E88EFE0;
  return sub_21E89C138(v0 + 2);
}

uint64_t sub_21E88EFE0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 104) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_21E88F124, 0, 0);
}

uint64_t sub_21E88F124()
{
  (*(void (**)(void))(v0 + 48))(*(void *)(v0 + 104));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return MEMORY[0x270FA2498](sub_21E88F1BC, 0, 0);
}

uint64_t sub_21E88F1BC()
{
  uint64_t v1 = v0[8];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8902D8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v0[7];
  v0[2] = v0[6];
  v0[9] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[10] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_21E88F2BC;
  return sub_21E89C138(v0 + 2);
}

uint64_t sub_21E88F2BC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_21E88F400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21E8A49F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21E8A49E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21E891238(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21E8A49B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:extensionPointIdentifierRestriction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  return MEMORY[0x270FA2498](sub_21E88F5C8, 0, 0);
}

uint64_t sub_21E88F5C8()
{
  uint64_t v1 = v0[8];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8902D8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  v0[10] = (uint64_t)v3;
  if (*(void *)(v0[9] + 16))
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v5 = sub_21E890424(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v0[7];
  v0[2] = v0[6];
  v0[11] = (uint64_t)v5;
  v0[3] = v6;
  v0[4] = (uint64_t)v3;
  v0[5] = (uint64_t)v5;
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v7;
  *uint64_t v7 = v0;
  v7[1] = sub_21E88F6F8;
  return sub_21E89C138(v0 + 2);
}

uint64_t sub_21E88F6F8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_21E88F850(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21E88F92C;
  return v6(a1);
}

uint64_t sub_21E88F92C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21E88FA24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21E88FAF8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21E8913D8((uint64_t)v12, *a3);
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
      sub_21E8913D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_21E88FAF8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21E8A4B00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21E88FCB4(a5, a6);
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
  uint64_t v8 = sub_21E8A4BF0();
  if (!v8)
  {
    sub_21E8A4C70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21E8A4CD0();
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

uint64_t sub_21E88FCB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21E88FD4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21E88FF2C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21E88FF2C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E88FD4C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21E88FEC4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21E8A4BD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21E8A4C70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21E8A4910();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21E8A4CD0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21E8A4C70();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21E88FEC4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46370);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21E88FF2C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D46370);
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
  uint64_t result = sub_21E8A4CD0();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21E8900B4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8900EC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E89012C()
{
  return sub_21E88E8E4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
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

uint64_t sub_21E8901DC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_21E8A4B40();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D46378);
    unint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21E8905F4((uint64_t)&v8, v3 + 4, v2, a1);
  uint64_t result = sub_21E89122C();
  if (v6 == v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void *sub_21E8902D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46388);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_21E890910(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21E89122C();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21E890404@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_21E89D990(a1, *(void *)(v2 + 32), *(void **)(v2 + 40), a2);
}

void *sub_21E890424(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46358);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_21E890AA4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21E89122C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_21E89050C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46358);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_21E890CA4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21E89122C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_21E8905F4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  int64_t v7 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_21E8A4B30();
    type metadata accessor for App();
    sub_21E891474((unint64_t *)&qword_267D46380, (void (*)(uint64_t))type metadata accessor for App);
    uint64_t result = sub_21E8A4A10();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = (void *)result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_21E8A4B60()) {
        goto LABEL_45;
      }
      type metadata accessor for App();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      uint64_t result = swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t v15 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = swift_retain();
    if (!v15) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void *sub_21E890910(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    void *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_21E890AA4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
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
  unint64_t v11 = a2;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_21E890CA4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
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
  unint64_t v11 = a2;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_21E890EA4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21E8A4C90();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for App();
  sub_21E891474((unint64_t *)&qword_267D46380, (void (*)(uint64_t))type metadata accessor for App);
  uint64_t result = sub_21E8A4A00();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E8A4C90();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = MEMORY[0x223C33960](i, a1);
        sub_21E8A08D0(&v9, v6);
        swift_release();
      }
    }
    else
    {
      uint64_t v7 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        swift_retain();
        sub_21E8A08D0(&v9, v8);
        swift_release();
        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E89101C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_21E89106C()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  long long v5 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_21E891128;
  *(_OWORD *)(v3 + 72) = v5;
  *(void *)(v3 + 64) = v2;
  *(_OWORD *)(v3 + 48) = v4;
  return MEMORY[0x270FA2498](sub_21E88EEE0, 0, 0);
}

uint64_t sub_21E891128()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

ValueMetadata *type metadata accessor for AppFinder()
{
  return &type metadata for AppFinder;
}

uint64_t sub_21E89122C()
{
  return swift_release();
}

uint64_t sub_21E891238(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E891298()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8912D0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_21E891128;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))&asc_267D46360[*(int *)asc_267D46360];
  return v6(a1, v4);
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

uint64_t sub_21E8913D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21E891434()
{
  unint64_t result = qword_267D46390;
  if (!qword_267D46390)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D46390);
  }
  return result;
}

uint64_t sub_21E891474(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21E8914BC(unint64_t *a1, uint64_t *a2)
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

void sub_21E89150C()
{
}

void AppFinding.findElgibleAppsFor(intentTypeName:completion:)()
{
}

uint64_t AppFinding.findEligibleApps(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of AppFinding.findElgibleAppsFor(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of AppFinding.findEligibleApps(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_21E891604()
{
  uint64_t v0 = sub_21E8A47A0();
  __swift_allocate_value_buffer(v0, qword_267D47610);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D47610);
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267D47628;
  return sub_21E8A47B0();
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

uint64_t sub_21E8916F4()
{
  sub_21E89175C();
  uint64_t result = sub_21E8A4AE0();
  qword_267D47628 = result;
  return result;
}

unint64_t sub_21E89175C()
{
  unint64_t result = qword_267D463B0;
  if (!qword_267D463B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D463B0);
  }
  return result;
}

void *sub_21E89179C()
{
  type metadata accessor for AppPolicyHandler();
  swift_allocObject();
  unint64_t result = sub_21E8917D8();
  qword_267D47630 = (uint64_t)result;
  return result;
}

void *sub_21E8917D8()
{
  id v1 = v0;
  uint64_t v2 = sub_21E8A4A80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E8A4A70();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_21E8A4820();
  MEMORY[0x270FA5388](v7 - 8);
  v1[2] = 0;
  sub_21E894988(0, (unint64_t *)&qword_267D46390);
  sub_21E8A4810();
  sub_21E8A4A60();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v2);
  uint64_t v8 = sub_21E8A4AB0();
  uint64_t v9 = MEMORY[0x263F8EE80];
  v1[3] = v8;
  v1[4] = v9;
  id v10 = objc_allocWithZone(MEMORY[0x263F39CF8]);
  aBlock[4] = sub_21E8949C4;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21E88E96C;
  uint64_t aBlock[3] = &block_descriptor_32;
  unint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v10, sel_initWithPolicyChangeHandler_, v11);
  _Block_release(v11);
  uint64_t v13 = (void *)v1[2];
  v1[2] = v12;

  return v1;
}

uint64_t sub_21E891A60()
{
  uint64_t v0 = sub_21E8A47F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
  sub_21E8A47E0();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = v5;
  unint64_t v11 = sub_21E8949CC;
  uint64_t v12 = v4;
  sub_21E8A4A90();
  uint64_t v6 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  swift_retain();
  v6(v3, v0);
  swift_release();
  swift_release();
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_21E893198(v7);
  swift_release();
  return swift_bridgeObjectRelease();
}

BOOL sub_21E891C28(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21E8A47A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain_n();
  unint64_t v11 = sub_21E8A4790();
  os_log_type_t v12 = sub_21E8A4A30();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v36 = v6;
    uint64_t v13 = swift_slowAlloc();
    v37 = v9;
    int64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    v35[1] = v3;
    uint64_t v16 = a1;
    uint64_t v17 = v15;
    uint64_t v39 = v15;
    *(_DWORD *)int64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_21E88FA24(v16, a2, &v39);
    uint64_t v6 = v36;
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v11, v12, "AppPolicyHandler isAllowedByScreenTime called for : %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v17;
    a1 = v16;
    MEMORY[0x223C33F60](v18, -1, -1);
    int64_t v19 = v14;
    uint64_t v9 = v37;
    MEMORY[0x223C33F60](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = sub_21E892AB0(a1, a2);
  if (v21)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v28 = sub_21E8A4790();
    os_log_type_t v29 = sub_21E8A4A30();
    if (os_log_type_enabled(v28, v29))
    {
      int64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v39 = v31;
      *(_DWORD *)int64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_21E88FA24(a1, a2, &v39);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E88B000, v28, v29, "AppPolicyHandler isAllowedByScreenTime, policy undefined for app. Default to enabled. %s", v30, 0xCu);
      uint64_t v32 = 1;
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v31, -1, -1);
      MEMORY[0x223C33F60](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return 1;
    }
  }
  else
  {
    uint64_t v22 = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_21E8A4790();
    os_log_type_t v24 = sub_21E8A4A30();
    if (os_log_type_enabled(v23, v24))
    {
      v37 = v9;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v39 = v36;
      *(_DWORD *)uint64_t v25 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_21E88FA24(a1, a2, &v39);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v26 = 0xD000000000000014;
      unint64_t v27 = 0x800000021E8A64D0;
      switch(v22)
      {
        case 0:
          unint64_t v27 = 0xEC0000004B4F2E79;
          goto LABEL_17;
        case 1:
          unint64_t v27 = 0xEE006E7261772E79;
          goto LABEL_17;
        case 2:
          unint64_t v27 = 0xED00006B73612E79;
LABEL_17:
          uint64_t v26 = 0x63696C6F50464D44;
          break;
        case 3:
          break;
        case 4:
          unint64_t v27 = 0x800000021E8A64B0;
          uint64_t v26 = 0xD000000000000011;
          break;
        default:
          unint64_t v27 = 0x800000021E8A6490;
          break;
      }
      uint64_t v38 = sub_21E88FA24(v26, v27, &v39);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E88B000, v23, v24, "AppPolicyHandler DMFPolicy : %s == %s", (uint8_t *)v25, 0x16u);
      uint64_t v33 = v36;
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v33, -1, -1);
      MEMORY[0x223C33F60](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v37, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return v22 == 0;
  }
  return v32;
}

unint64_t DMFPolicy.debugDescription.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      unint64_t result = 0x63696C6F50464D44;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21E892314(uint64_t a1, void (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result + 32;
    swift_beginAccess();
    a2(v4);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_21E8923B4(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = sub_21E8A47F0();
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21E8A47A0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_21E8A4790();
  os_log_type_t v8 = sub_21E8A4A30();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = v10;
    uint64_t v18 = v4;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_21E88FA24(a1, a2, &v22);
    uint64_t v4 = v18;
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v7, v8, "AppPolicyHandler register, %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v10, -1, -1);
    MEMORY[0x223C33F60](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = a1;
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  swift_bridgeObjectRetain();
  uint64_t v13 = v20;
  sub_21E8A47E0();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = swift_weakInit();
  MEMORY[0x270FA5388](v15);
  *(&v18 - 4) = v14;
  *(&v18 - 3) = (uint64_t)sub_21E894980;
  *(&v18 - 2) = v11;
  sub_21E8A4A90();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v19);
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46358);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_21E8A5590;
  *(void *)(v16 + 32) = v12;
  *(void *)(v16 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_21E893198(v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E892734(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_21E8A47A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(*(void *)a1 + 16))
  {
    swift_bridgeObjectRetain();
    sub_21E89A1D0(a2, a3);
    char v11 = v10;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_21E8A4790();
  os_log_type_t v14 = sub_21E8A4A30();
  if (!os_log_type_enabled(v13, v14))
  {

    swift_bridgeObjectRelease_n();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (v11) {
      return result;
    }
    goto LABEL_16;
  }
  uint64_t v15 = swift_slowAlloc();
  uint64_t v25 = v7;
  uint64_t v16 = v15;
  uint64_t v23 = swift_slowAlloc();
  uint64_t v28 = v23;
  *(_DWORD *)uint64_t v16 = 136315394;
  if (v11) {
    uint64_t v17 = 1702195828;
  }
  else {
    uint64_t v17 = 0x65736C6166;
  }
  uint64_t v24 = v6;
  if (v11) {
    unint64_t v18 = 0xE400000000000000;
  }
  else {
    unint64_t v18 = 0xE500000000000000;
  }
  uint64_t v19 = sub_21E88FA24(v17, v18, &v28);
  uint64_t v26 = a1;
  uint64_t v27 = v19;
  sub_21E8A4AF0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v16 + 12) = 2080;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_21E88FA24(a2, a3, &v28);
  a1 = v26;
  sub_21E8A4AF0();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_21E88B000, v13, v14, "AppPolicyHandler isRegistered, %s %s", (uint8_t *)v16, 0x16u);
  uint64_t v20 = v23;
  swift_arrayDestroy();
  MEMORY[0x223C33F60](v20, -1, -1);
  MEMORY[0x223C33F60](v16, -1, -1);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v9, v24);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *(void *)a1;
    *(void *)a1 = 0x8000000000000000;
    sub_21E8945D4(0, a2, a3, isUniquelyReferenced_nonNull_native);
    *(void *)a1 = v28;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21E892AB0(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = sub_21E8A47F0();
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8923B4(a1, a2);
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21E8A47A0();
  __swift_project_value_buffer(v7, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_21E8A4790();
  os_log_type_t v9 = sub_21E8A4A30();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v23[0] = v11;
    uint64_t v20 = v6;
    *(_DWORD *)char v10 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21E88FA24(a1, a2, v23);
    uint64_t v6 = v20;
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v8, v9, "AppPolicyHandler getDMFPolicy, %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v11, -1, -1);
    MEMORY[0x223C33F60](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(unsigned char *)(v12 + 24) = 1;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  swift_bridgeObjectRetain();
  sub_21E8A47E0();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = swift_weakInit();
  MEMORY[0x270FA5388](v15);
  *(&v19 - 4) = v14;
  *(&v19 - 3) = (uint64_t)sub_21E89493C;
  *(&v19 - 2) = (uint64_t)v13;
  sub_21E8A4A90();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  v16(v6, v21);
  swift_release();
  swift_release();
  swift_beginAccess();
  uint64_t v17 = *(void *)(v12 + 16);
  swift_release();
  return v17;
}

void sub_21E892E40(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  if (*(void *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_21E89A1D0(a3, a4);
    if (v9) {
      uint64_t v10 = *(void *)(*(void *)(v5 + 56) + 8 * v8);
    }
    else {
      uint64_t v10 = 0;
    }
    char v11 = v9 ^ 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
    char v11 = 1;
  }
  swift_beginAccess();
  *(void *)(a2 + 16) = v10;
  *(unsigned char *)(a2 + 24) = v11 & 1;
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_21E8A47A0();
  __swift_project_value_buffer(v12, (uint64_t)qword_267D47610);
  swift_retain_n();
  uint64_t v13 = sub_21E8A4790();
  os_log_type_t v14 = sub_21E8A4A30();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v23 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_beginAccess();
    char v17 = *(unsigned char *)(a2 + 24);
    uint64_t v24 = *(void *)(a2 + 16);
    char v25 = v17;
    __swift_instantiateConcreteTypeFromMangledName(qword_267D463C8);
    uint64_t v18 = sub_21E8A48E0();
    uint64_t v24 = sub_21E88FA24(v18, v19, &v23);
    sub_21E8A4AF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v13, v14, "AppPolicyHandler getDMFPolicy, %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v16, -1, -1);
    MEMORY[0x223C33F60](v15, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  if (*(unsigned char *)(a2 + 24) == 1)
  {
    uint64_t v20 = sub_21E8A4790();
    os_log_type_t v21 = sub_21E8A4A30();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_21E88B000, v20, v21, "AppPolicyHandler checkPolicy, app policy undefined", v22, 2u);
      MEMORY[0x223C33F60](v22, -1, -1);
    }
  }
}

uint64_t sub_21E893128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_21E89050C(v3);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(a2 + 16) = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E893198(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E8A4780();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v32 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v31 - v8;
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  id v10 = (id)qword_267D47628;
  sub_21E8A4770();
  sub_21E8A4AD0();
  sub_21E8A4760();
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21E8A47A0();
  __swift_project_value_buffer(v11, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_21E8A4790();
  os_log_type_t v13 = sub_21E8A4A30();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v5;
    uint64_t v15 = v4;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134217984;
    aBlock[0] = *(void *)(a1 + 16);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v12, v13, "AppPolicyHandler refreshApps : %ld", v16, 0xCu);
    char v17 = v16;
    uint64_t v4 = v15;
    uint64_t v5 = v14;
    uint64_t v2 = v1;
    MEMORY[0x223C33F60](v17, -1, -1);

    if (*(void *)(a1 + 16)) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v26 = sub_21E8A4790();
    os_log_type_t v27 = sub_21E8A4A30();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      os_log_type_t v29 = "AppPolicyHandler refreshApps, no apps registered";
LABEL_14:
      _os_log_impl(&dword_21E88B000, v26, v27, v29, v28, 2u);
      MEMORY[0x223C33F60](v28, -1, -1);
    }
LABEL_15:

    sub_21E8A4AC0();
    sub_21E8A4760();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }

  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v18 = *(void **)(v2 + 16);
  if (!v18)
  {
    uint64_t v26 = sub_21E8A4790();
    os_log_type_t v27 = sub_21E8A4A40();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      os_log_type_t v29 = "AppPolicyHandler appPolicyMonitor not initialized";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v19 = v18;
  uint64_t v20 = (void *)sub_21E8A4950();
  os_log_type_t v21 = v32;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v32, v9, v4);
  unint64_t v22 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v23 = (v6 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v24 + v22, v21, v4);
  *(void *)(v24 + v23) = v2;
  aBlock[4] = sub_21E894478;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21E8942AC;
  uint64_t aBlock[3] = &block_descriptor_0;
  char v25 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_requestPoliciesForBundleIdentifiers_completionHandler_, v20, v25);
  _Block_release(v25);

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

void sub_21E893658(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_21E8A47F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21E8A47A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_267D47610);
  char v9 = sub_21E8A4790();
  os_log_type_t v10 = sub_21E8A4A30();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v31[0] = a2;
    uint64_t v12 = v11;
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21E88B000, v9, v10, "AppPolicyHandler requestPolicies completion returned", v11, 2u);
    a2 = (void *)v31[0];
    MEMORY[0x223C33F60](v12, -1, -1);
  }

  if (a2)
  {
    id v13 = a2;
    id v14 = a2;
    id v15 = a2;
    uint64_t v16 = sub_21E8A4790();
    os_log_type_t v17 = sub_21E8A4A40();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v32 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_getErrorValue();
      uint64_t v20 = sub_21E8A4D20();
      v31[1] = sub_21E88FA24(v20, v21, &v32);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21E88B000, v16, v17, "AppPolicyHandler refreshApps appPolicyMonitor requestPolicies has an error : %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v19, -1, -1);
      MEMORY[0x223C33F60](v18, -1, -1);
    }
    else
    {
    }
    sub_21E8A4AC0();
    if (qword_267D462D0 != -1) {
      swift_once();
    }
    sub_21E8A4760();
  }
  else
  {
    if (a1)
    {
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = a1;
      swift_bridgeObjectRetain();
      sub_21E8A47E0();
      uint64_t v23 = swift_allocObject();
      uint64_t v24 = swift_weakInit();
      MEMORY[0x270FA5388](v24);
      v31[-4] = v23;
      v31[-3] = sub_21E894574;
      v31[-2] = v22;
      sub_21E8A4A90();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
      swift_release();
      char v25 = sub_21E8A4790();
      os_log_type_t v26 = sub_21E8A4A30();
      if (os_log_type_enabled(v25, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v27 = 0;
        _os_log_impl(&dword_21E88B000, v25, v26, "AppPolicyHandler refreshApps complete", v27, 2u);
        MEMORY[0x223C33F60](v27, -1, -1);
      }

      sub_21E8A4AC0();
      if (qword_267D462D0 != -1) {
        swift_once();
      }
    }
    else
    {
      uint64_t v28 = sub_21E8A4790();
      os_log_type_t v29 = sub_21E8A4A40();
      if (os_log_type_enabled(v28, v29))
      {
        int64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v30 = 0;
        _os_log_impl(&dword_21E88B000, v28, v29, "AppPolicyHandler refreshApps policies not set", v30, 2u);
        MEMORY[0x223C33F60](v30, -1, -1);
      }

      sub_21E8A4AC0();
      if (qword_267D462D0 != -1) {
        swift_once();
      }
    }
    sub_21E8A4760();
  }
}

uint64_t sub_21E893C98(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_21E8A47A0();
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v55 = a2 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  v58 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  int64_t v56 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v57 = (void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  *(void *)&long long v13 = 136315394;
  long long v53 = v13;
  os_log_type_t v50 = "SiriAppResolution";
  unint64_t v51 = (unint64_t)"DMFPolicy.blocked";
  uint64_t v52 = MEMORY[0x263F8EE58] + 8;
  v49 = "DMFPolicy.UNKNOWN";
  uint64_t v59 = v4;
  v60 = v7;
  uint64_t v54 = a2;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      int64_t v61 = v12;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_22;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_47;
    }
    if (v16 >= v56) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v55 + 8 * v16);
    int64_t v18 = v12 + 1;
    if (!v17)
    {
      int64_t v18 = v12 + 2;
      if (v12 + 2 >= v56) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v55 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v12 + 3;
        if (v12 + 3 >= v56) {
          return swift_release();
        }
        unint64_t v17 = *(void *)(v55 + 8 * v18);
        if (!v17)
        {
          uint64_t v19 = v12 + 4;
          if (v12 + 4 >= v56) {
            return swift_release();
          }
          unint64_t v17 = *(void *)(v55 + 8 * v19);
          if (!v17)
          {
            while (1)
            {
              int64_t v18 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_48;
              }
              if (v18 >= v56) {
                return swift_release();
              }
              unint64_t v17 = *(void *)(v55 + 8 * v18);
              ++v19;
              if (v17) {
                goto LABEL_21;
              }
            }
          }
          int64_t v18 = v12 + 4;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v17 - 1) & v17;
    int64_t v61 = v18;
    unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
LABEL_22:
    uint64_t v20 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    uint64_t v23 = *(void **)(*(void *)(a2 + 56) + 8 * v15);
    swift_bridgeObjectRetain_n();
    id v62 = v23;
    id v24 = sub_21E894738(v62);
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v4, (uint64_t)qword_267D47610);
    (*v58)(v7, v25, v4);
    swift_bridgeObjectRetain_n();
    os_log_type_t v26 = sub_21E8A4790();
    os_log_type_t v27 = sub_21E8A4A30();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v63 = (void *)v29;
      *(_DWORD *)uint64_t v28 = v53;
      swift_bridgeObjectRetain();
      *(void *)(v28 + 4) = sub_21E88FA24(v21, v22, (uint64_t *)&v63);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 12) = 2080;
      uint64_t v30 = 0xD000000000000014;
      unint64_t v31 = v51 | 0x8000000000000000;
      switch((unint64_t)v24)
      {
        case 0uLL:
          unint64_t v31 = 0xEC0000004B4F2E79;
          goto LABEL_31;
        case 1uLL:
          unint64_t v31 = 0xEE006E7261772E79;
          goto LABEL_31;
        case 2uLL:
          unint64_t v31 = 0xED00006B73612E79;
LABEL_31:
          uint64_t v30 = 0x63696C6F50464D44;
          goto LABEL_34;
        case 3uLL:
          goto LABEL_34;
        case 4uLL:
          uint64_t v32 = v49;
          goto LABEL_33;
        default:
          uint64_t v32 = v50;
LABEL_33:
          unint64_t v31 = (unint64_t)v32 | 0x8000000000000000;
          uint64_t v30 = 0xD000000000000011;
LABEL_34:
          *(void *)(v28 + 14) = sub_21E88FA24(v30, v31, (uint64_t *)&v63);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21E88B000, v26, v27, "AppPolicyHandler refreshApps, %s to %s", (uint8_t *)v28, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x223C33F60](v29, -1, -1);
          MEMORY[0x223C33F60](v28, -1, -1);

          (*v57)(v60, v59);
          a2 = v54;
          break;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*v57)(v7, v4);
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v63 = (void *)*a1;
    uint64_t v34 = (uint64_t)v63;
    *a1 = 0x8000000000000000;
    unint64_t v36 = sub_21E89A1D0(v21, v22);
    uint64_t v37 = *(void *)(v34 + 16);
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = v37 + v38;
    if (__OFADD__(v37, v38))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      sub_21E8A4D10();
      __break(1u);
      JUMPOUT(0x21E894298);
    }
    char v40 = v35;
    if (*(void *)(v34 + 24) >= v39)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_21E89AC50();
      }
    }
    else
    {
      sub_21E89A248(v39, isUniquelyReferenced_nonNull_native);
      unint64_t v41 = sub_21E89A1D0(v21, v22);
      if ((v40 & 1) != (v42 & 1)) {
        goto LABEL_49;
      }
      unint64_t v36 = v41;
    }
    uint64_t v7 = v60;
    v43 = v63;
    if (v40)
    {
      *(void *)(v63[7] + 8 * v36) = v24;
    }
    else
    {
      v63[(v36 >> 6) + 8] |= 1 << v36;
      unint64_t v44 = (uint64_t *)(v43[6] + 16 * v36);
      *unint64_t v44 = v21;
      v44[1] = v22;
      *(void *)(v43[7] + 8 * v36) = v24;
      uint64_t v45 = v43[2];
      BOOL v46 = __OFADD__(v45, 1);
      uint64_t v47 = v45 + 1;
      if (v46) {
        goto LABEL_46;
      }
      v43[2] = v47;
      swift_bridgeObjectRetain();
    }
    *a1 = (uint64_t)v43;

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v4 = v59;
    int64_t v12 = v61;
  }
}

uint64_t sub_21E8942AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_21E894988(0, &qword_267D463B8);
    uint64_t v4 = sub_21E8A48A0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21E894360()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

unint64_t sub_21E8943A8()
{
  return DMFPolicy.debugDescription.getter(*v0);
}

uint64_t type metadata accessor for AppPolicyHandler()
{
  return self;
}

uint64_t sub_21E8943D4()
{
  uint64_t v1 = sub_21E8A4780();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_21E894478(uint64_t a1, void *a2)
{
  sub_21E8A4780();
  sub_21E893658(a1, a2);
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

uint64_t sub_21E89453C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E894574(uint64_t *a1)
{
  return sub_21E893C98(a1, *(void *)(v1 + 16));
}

uint64_t sub_21E89457C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8945B4()
{
  return sub_21E892314(*(void *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24));
}

uint64_t sub_21E8945D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21E89A1D0(a2, a3);
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
    uint64_t result = (uint64_t)sub_21E89AC50();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_21E89A248(result, a4 & 1);
  uint64_t result = sub_21E89A1D0(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_21E8A4D10();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
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

id sub_21E894738(void *a1)
{
  id result = objc_msgSend(a1, sel_integerValue);
  if ((unint64_t)result >= 5)
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_21E8A47A0();
    __swift_project_value_buffer(v3, (uint64_t)qword_267D47610);
    id v4 = a1;
    uint64_t v5 = sub_21E8A4790();
    os_log_type_t v6 = sub_21E8A4A40();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      id v9 = v4;
      sub_21E8A4AF0();
      void *v8 = v4;

      _os_log_impl(&dword_21E88B000, v5, v6, "DMFPolicy parse unknown number %@, default to OK", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D463C0);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v8, -1, -1);
      MEMORY[0x223C33F60](v7, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return result;
}

uint64_t sub_21E8948EC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8948FC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21E89493C(uint64_t *a1)
{
  sub_21E892E40(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_21E894948()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E894980(uint64_t a1)
{
  return sub_21E892734(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_21E894988(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21E8949C4()
{
  return sub_21E891A60();
}

uint64_t sub_21E8949CC(uint64_t a1)
{
  return sub_21E893128(a1, v1);
}

uint64_t sub_21E8949E0()
{
  return sub_21E8945B4();
}

uint64_t sub_21E8949F8()
{
  type metadata accessor for AppResolutionEventSending();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  off_26AD3ED10 = (_UNKNOWN *)result;
  return result;
}

uint64_t static AppResolutionEventSending.onEventSent(_:)(uint64_t a1, uint64_t a2)
{
  if (qword_26AD3ED18 != -1) {
    swift_once();
  }
  id v4 = off_26AD3ED10;
  uint64_t v5 = *((void *)off_26AD3ED10 + 2);
  *((void *)off_26AD3ED10 + 2) = a1;
  v4[3] = a2;
  swift_retain();
  return sub_21E894AB4(v5);
}

uint64_t sub_21E894AB4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t AppResolutionEventSending.deinit()
{
  sub_21E894AB4(*(void *)(v0 + 16));
  return v0;
}

uint64_t AppResolutionEventSending.__deallocating_deinit()
{
  sub_21E894AB4(*(void *)(v0 + 16));
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AppResolutionEventSending()
{
  return self;
}

uint64_t method lookup function for AppResolutionEventSending(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppResolutionEventSending);
}

void sub_21E894B58(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v7 = *(void **)a3;
  char v8 = *(unsigned char *)(a3 + 8);
  int v9 = *(unsigned __int8 *)(a3 + 9);
  if (qword_26AD3ED18 != -1) {
    swift_once();
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t *, NSObject *))*((void *)off_26AD3ED10 + 2);
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = qword_267D462C8;
      swift_retain();
      if (v11 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_21E8A47A0();
      __swift_project_value_buffer(v12, (uint64_t)qword_267D47610);
      uint64_t v13 = sub_21E8A4790();
      os_log_type_t v14 = sub_21E8A4A30();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = a1;
        char v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v16 = 0;
        _os_log_impl(&dword_21E88B000, v13, v14, "AppSelectionService: failed to resolved app", v16, 2u);
        uint64_t v17 = v16;
        a1 = v15;
        MEMORY[0x223C33F60](v17, -1, -1);
      }

      uint64_t v32 = 0x8000000000000000;
      char v33 = 3;
      v10(a1, a2, &v32, a4);
      sub_21E894AB4((uint64_t)v10);
    }
    else
    {
      sub_21E894FEC(*((void *)off_26AD3ED10 + 2));
      sub_21E894FFC(v7, v8, 0);
      if (qword_267D462C8 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_21E8A47A0();
      __swift_project_value_buffer(v21, (uint64_t)qword_267D47610);
      sub_21E895008((uint64_t)v7, v8);
      sub_21E895008((uint64_t)v7, v8);
      BOOL v22 = sub_21E8A4790();
      os_log_type_t v23 = sub_21E8A4A30();
      if (os_log_type_enabled(v22, v23))
      {
        os_log_t osloga = a4;
        id v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v31 = v28;
        uint64_t v32 = (uint64_t)v7;
        *(_DWORD *)id v24 = 136315138;
        char v33 = v8;
        unint64_t v25 = AppResolutionResult.description.getter();
        uint64_t v32 = sub_21E88FA24(v25, v26, &v31);
        sub_21E8A4AF0();
        swift_bridgeObjectRelease();
        sub_21E89505C(v7, v8, 0);
        sub_21E89505C(v7, v8, 0);
        _os_log_impl(&dword_21E88B000, v22, v23, "AppSelectionService: resolved app with result=%s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C33F60](v28, -1, -1);
        os_log_type_t v27 = v24;
        a4 = osloga;
        MEMORY[0x223C33F60](v27, -1, -1);
      }
      else
      {
        sub_21E89505C(v7, v8, 0);
        sub_21E89505C(v7, v8, 0);
      }

      uint64_t v32 = (uint64_t)v7;
      char v33 = v8;
      v10(a1, a2, &v32, a4);
      sub_21E894AB4((uint64_t)v10);
      sub_21E89505C(v7, v8, 0);
    }
  }
  else
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_21E8A47A0();
    __swift_project_value_buffer(v18, (uint64_t)qword_267D47610);
    oslog = sub_21E8A4790();
    os_log_type_t v19 = sub_21E8A4A30();
    if (os_log_type_enabled(oslog, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21E88B000, oslog, v19, "The event handler for app resolution didn't get initialized or dropping the event.", v20, 2u);
      MEMORY[0x223C33F60](v20, -1, -1);
    }
  }
}

uint64_t sub_21E894FEC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

id sub_21E894FFC(id a1, char a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)sub_21E895008((uint64_t)a1, a2);
  }
}

uint64_t sub_21E895008(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 0:
    case 2:
    case 3:
      uint64_t result = swift_retain();
      break;
    case 1:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_21E89505C(id a1, char a2, char a3)
{
  if (a3) {

  }
  else {
    sub_21E895068((uint64_t)a1, a2);
  }
}

uint64_t sub_21E895068(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 0:
    case 2:
    case 3:
      uint64_t result = swift_release();
      break;
    case 1:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AppResolutionService.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AppResolutionService.init()();
  return v0;
}

void *AppResolutionService.init()()
{
  if (qword_267D462D8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_267D47630;
  v0[5] = type metadata accessor for AppPolicyHandler();
  v0[6] = &off_26CFDBFA0;
  v0[2] = v1;
  swift_retain();
  return v0;
}

uint64_t sub_21E89516C(uint64_t a1, void *a2, void (*a3)(uint64_t *))
{
  return sub_21E8952BC(a2, a3);
}

BOOL sub_21E89517C(uint64_t a1)
{
  sub_21E8956E0(v1 + 16, (uint64_t)v7);
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = *(void *)(a1 + 16);
    unint64_t v4 = *(void *)(a1 + 24);
  }
  else
  {
    unint64_t v4 = 0xEA00000000007070;
    uint64_t v3 = 0x416E776F6E6B6E75;
  }
  swift_bridgeObjectRetain();
  BOOL v5 = sub_21E891C28(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  return v5;
}

uint64_t AppResolutionService.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t AppResolutionService.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_21E895278()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112))();
}

uint64_t sub_21E8952BC(void *a1, void (*a2)(uint64_t *))
{
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  sub_21E8A4A20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46450);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21E8A5590;
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46458);
  sub_21E8A4C60();
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  unint64_t v5 = sub_21E895744();
  *(void *)(v3 + 64) = v5;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0xE000000000000000;
  sub_21E8A4750();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (v8
    || (uint64_t v9 = a1[3],
        uint64_t v10 = a1[4],
        __swift_project_boxed_opaque_existential_1(a1, v9),
        (uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10)) != 0))
  {
    uint64_t v11 = v8;
    sub_21E8A4A20();
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_21E8A5590;
    uint64_t v13 = sub_21E88CEC4();
    *(void *)(v12 + 56) = v4;
    *(void *)(v12 + 64) = v5;
    *(void *)(v12 + 32) = v13;
    *(void *)(v12 + 40) = v14;
    sub_21E8A4750();
    swift_bridgeObjectRelease();
    if (sub_21E89517C(v11))
    {
      uint64_t v20 = v11;
      LOWORD(v21) = 2;
    }
    else
    {
      sub_21E8A4A30();
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_21E8A5590;
      uint64_t v16 = sub_21E88CEC4();
      *(void *)(v15 + 56) = v4;
      *(void *)(v15 + 64) = v5;
      *(void *)(v15 + 32) = v16;
      *(void *)(v15 + 40) = v17;
      sub_21E8A4750();
      swift_bridgeObjectRelease();
      uint64_t v20 = v11 | 0x4000000000000000;
      LOWORD(v21) = 3;
    }
    swift_retain();
    a2(&v20);
    return swift_release_n();
  }
  else
  {
    sub_21E8A4A20();
    sub_21E8A4750();
    uint64_t v20 = 0x8000000000000000;
    LOWORD(v21) = 3;
    return ((uint64_t (*)(uint64_t *))a2)(&v20);
  }
}

uint64_t sub_21E895634()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AppResolutionService()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AppResolutionService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppResolutionService);
}

uint64_t dispatch thunk of AppResolutionService.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AppResolutionService.resolveApp(intent:appResolutionState:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t sub_21E8956E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21E895744()
{
  unint64_t result = qword_267D46460;
  if (!qword_267D46460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46460);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21E8957C8(char a1, char a2)
{
  if (*(void *)&aCancelleconfir[8 * a1] == *(void *)&aCancelleconfir[8 * a2]
    && *(void *)&aCancelleconfir[8 * a1 + 24] == *(void *)&aCancelleconfir[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_21E8A4CF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

SiriAppResolution::AppResolutionConfirmation_optional sub_21E895850()
{
  return AppResolutionStateProviding.getCorrectionResponse()();
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProviding.getCorrectionResponse()()
{
  *uint64_t v0 = 3;
  return result;
}

uint64_t sub_21E895874()
{
  return 0;
}

uint64_t AppResolutionStateProviding.aceAppSelectionState.getter()
{
  return 0;
}

uint64_t static AppResolutionConfirmation.from(appConfirmationState:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  if (!a2)
  {
    char v9 = 3;
    goto LABEL_16;
  }
  uint64_t v5 = result;
  if (sub_21E8A48D0() == result && v6 == a2)
  {
    char v9 = 0;
    goto LABEL_15;
  }
  char v8 = sub_21E8A4CF0();
  SiriAppResolution::AppResolutionConfirmation_optional result = swift_bridgeObjectRelease();
  char v9 = 0;
  if (v8) {
    goto LABEL_16;
  }
  if (sub_21E8A48D0() == v5 && v10 == a2)
  {
    char v9 = 1;
    goto LABEL_15;
  }
  char v12 = sub_21E8A4CF0();
  SiriAppResolution::AppResolutionConfirmation_optional result = swift_bridgeObjectRelease();
  if (v12)
  {
    char v9 = 1;
    goto LABEL_16;
  }
  char v9 = 2;
  if (sub_21E8A48D0() == v5 && v13 == a2)
  {
LABEL_15:
    SiriAppResolution::AppResolutionConfirmation_optional result = swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v15 = sub_21E8A4CF0();
  SiriAppResolution::AppResolutionConfirmation_optional result = swift_bridgeObjectRelease();
  if (v15) {
    char v9 = 2;
  }
  else {
    char v9 = 3;
  }
LABEL_16:
  *a3 = v9;
  return result;
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionConfirmation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21E8A4CE0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t AppResolutionConfirmation.rawValue.getter()
{
  return *(void *)&aCancelleconfir[8 * *v0];
}

uint64_t sub_21E895A44(char *a1, char *a2)
{
  return sub_21E8957C8(*a1, *a2);
}

uint64_t sub_21E895A50()
{
  return sub_21E895A58();
}

uint64_t sub_21E895A58()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E895AC4()
{
  return sub_21E895ACC();
}

uint64_t sub_21E895ACC()
{
  sub_21E8A48F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E895B20()
{
  return sub_21E895B28();
}

uint64_t sub_21E895B28()
{
  return sub_21E8A4DA0();
}

SiriAppResolution::AppResolutionConfirmation_optional sub_21E895B90(Swift::String *a1)
{
  return AppResolutionConfirmation.init(rawValue:)(*a1);
}

uint64_t sub_21E895B9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppResolutionConfirmation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AppResolutionStateProvider.debugDescription.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  sub_21E8A4BC0();
  sub_21E8A4900();
  if (v2) {
    sub_21E88CEC4();
  }
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  if (v1) {
    sub_21E88CEC4();
  }
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  sub_21E8A4900();
  swift_bridgeObjectRelease();
  sub_21E8A4900();
  return 0;
}

void *AppResolutionStateProvider.aceAppSelectionState.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void AppResolutionStateProvider.init(appSelectionState:)(id a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1)
  {
    uint64_t v5 = 0;
    id v10 = 0;
    goto LABEL_20;
  }
  id v4 = objc_msgSend(a1, sel_requestedApp);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, sel_bundleId);

    if (v6)
    {
      uint64_t v7 = sub_21E8A48D0();
      uint64_t v9 = v8;

      type metadata accessor for App();
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v7;
      *(void *)(v5 + 24) = v9;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  id v11 = objc_msgSend(a1, sel_eligibleApps);
  if (!v11) {
    goto LABEL_17;
  }
  char v12 = v11;
  sub_21E896488();
  unint64_t v13 = sub_21E8A4960();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21E8A4C90();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    id v10 = 0;
    goto LABEL_18;
  }
LABEL_10:
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x223C33960](0, v13);
  }
  else
  {
    if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v14 = *(id *)(v13 + 32);
  }
  char v15 = v14;
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v15, sel_bundleId);

  if (v10)
  {
    uint64_t v16 = sub_21E8A48D0();
    uint64_t v18 = v17;

    type metadata accessor for App();
    id v10 = (id)swift_allocObject();
    *((void *)v10 + 2) = v16;
    *((void *)v10 + 3) = v18;
    *((_OWORD *)v10 + 2) = 0u;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
  }
LABEL_18:
  id v20 = objc_msgSend(a1, sel_appConfirmationState);
  if (v20)
  {
    unint64_t v21 = v20;
    uint64_t v22 = sub_21E8A48D0();
    uint64_t v24 = v23;

    goto LABEL_21;
  }
LABEL_20:
  uint64_t v22 = 0;
  uint64_t v24 = 0;
LABEL_21:
  static AppResolutionConfirmation.from(appConfirmationState:)(v22, v24, &v33);
  swift_bridgeObjectRelease();
  char v25 = v33;
  if (a1 && (id v26 = objc_msgSend(a1, sel_appCorrectionState)) != 0)
  {
    os_log_type_t v27 = v26;
    uint64_t v28 = sub_21E8A48D0();
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v30 = 0;
  }
  static AppResolutionConfirmation.from(appConfirmationState:)(v28, v30, &v32);
  swift_bridgeObjectRelease();
  char v31 = v32;
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v25;
  *(unsigned char *)(a2 + 17) = v31;
  *(void *)(a2 + 24) = a1;
}

uint64_t AppResolutionStateProvider.getRequestedApp()()
{
  return swift_retain();
}

uint64_t AppResolutionStateProvider.getSuggestedApp()()
{
  return swift_retain();
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProvider.getConfirmationResponse()()
{
  *uint64_t v0 = *(unsigned char *)(v1 + 16);
  return result;
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProvider.getCorrectionResponse()()
{
  *uint64_t v0 = *(unsigned char *)(v1 + 17);
  return result;
}

uint64_t sub_21E89608C()
{
  return swift_retain();
}

uint64_t sub_21E896094()
{
  return swift_retain();
}

void sub_21E89609C(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

void sub_21E8960A8(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

void *sub_21E8960B4()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

unint64_t AppSelectionResponse.description.getter()
{
  unint64_t result = 0xD00000000000001CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static AppSelectionResponse.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppSelectionResponse.hash(into:)()
{
  return sub_21E8A4D80();
}

uint64_t AppSelectionResponse.hashValue.getter()
{
  return sub_21E8A4DA0();
}

BOOL sub_21E8961EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E896200()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E896248()
{
  return sub_21E8A4D80();
}

uint64_t sub_21E896274()
{
  return sub_21E8A4DA0();
}

void *AppResolutionStateProviding.previousSelectionResponse.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  unint64_t result = (*(void *(**)(char *__return_ptr))(a2 + 24))((char *)&v7 + 1);
  switch(BYTE1(v7))
  {
    case 1:
      *a3 = 2;
      break;
    case 2:
      *a3 = 1;
      break;
    default:
      unint64_t result = (*(void *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 32))(&v7, a1, a2);
      if (v7 == 1) {
        *a3 = 3;
      }
      else {
        *a3 = 0;
      }
      break;
  }
  return result;
}

uint64_t AppResolutionStateProviding.needsRunAppResolution(preResolvedApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  AppResolutionStateProviding.previousSelectionResponse.getter(a2, a3, &v14);
  if (v14 != 3 && a1 != 0)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v9 = *(void *)(v8 + 24);
    uint64_t v10 = *(void *)(a1 + 24);
    char v7 = v10 != 0;
    if (!v9)
    {
      swift_release();
      return v7 & 1;
    }
    if (v10)
    {
      if (*(void *)(v8 + 16) != *(void *)(a1 + 16) || v9 != v10)
      {
        char v12 = sub_21E8A4CF0();
        swift_release();
        char v7 = v12 ^ 1;
        return v7 & 1;
      }
      swift_release();
LABEL_18:
      char v7 = 0;
      return v7 & 1;
    }
    swift_release();
  }
  char v7 = 1;
  return v7 & 1;
}

unint64_t sub_21E896488()
{
  unint64_t result = qword_267D46468;
  if (!qword_267D46468)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D46468);
  }
  return result;
}

unint64_t sub_21E8964CC()
{
  unint64_t result = qword_267D46470;
  if (!qword_267D46470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46470);
  }
  return result;
}

unint64_t sub_21E896524()
{
  unint64_t result = qword_267D46478;
  if (!qword_267D46478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46478);
  }
  return result;
}

uint64_t dispatch thunk of AppResolutionStateProviding.getRequestedApp()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getSuggestedApp()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getConfirmationResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getCorrectionResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.aceAppSelectionState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppResolutionConfirmation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppResolutionConfirmation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x21E896748);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionConfirmation()
{
  return &type metadata for AppResolutionConfirmation;
}

uint64_t initializeBufferWithCopyOfBuffer for AppResolutionStateProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AppResolutionStateProvider(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  unsigned int v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  unsigned int v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

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

uint64_t assignWithTake for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  unsigned int v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionStateProvider(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for AppResolutionStateProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionStateProvider()
{
  return &type metadata for AppResolutionStateProvider;
}

uint64_t getEnumTagSinglePayload for AppSelectionResponse(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppSelectionResponse(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x21E896B54);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_21E896B7C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E896B84(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppSelectionResponse()
{
  return &type metadata for AppSelectionResponse;
}

uint64_t DefaultAppSelector.selectAppWithMetadata(intent:fromEligibleApps:_:)(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, unint64_t))
{
  swift_retain();
  sub_21E8A2EFC(a2, v3, a3);
  return swift_release();
}

uint64_t sub_21E896C04(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, unint64_t))
{
  uint64_t v6 = *v3;
  swift_retain();
  sub_21E8A2EFC(a2, v6, a3);
  return swift_release();
}

uint64_t sub_21E896C68()
{
  uint64_t DynamicType = swift_getDynamicType();
  return MEMORY[0x270FA0128](DynamicType, 0);
}

uint64_t sub_21E896CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46480);
  if (swift_dynamicCast())
  {
    sub_21E8970E4(v23, (uint64_t)v25);
    uint64_t v16 = v26;
    uint64_t v17 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(v17 + 8);
    swift_retain();
    v19(a1, a2, sub_21E8970FC, v18, v16, v17);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  }
  else
  {
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_21E896FFC((uint64_t)v23);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a3;
    *(void *)(v21 + 24) = a4;
    uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(a6 + 8);
    swift_retain();
    v22(a1, a2, sub_21E897094, v21, a5, a6);
    return swift_release();
  }
}

unint64_t AppResolutionResult.AppResolutionResultError.debugDescription.getter()
{
  unint64_t v1 = 0xD000000000000010;
  uint64_t v2 = *v0 >> 62;
  if (!v2)
  {
    swift_retain();
    sub_21E8A4BC0();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD00000000000001CLL;
    sub_21E88CEC4();
    sub_21E8A4900();
    swift_bridgeObjectRelease();
    swift_release();
    return v4;
  }
  if (v2 == 1)
  {
    swift_retain();
    sub_21E8A4BC0();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000023;
    sub_21E88CEC4();
    sub_21E8A4900();
    swift_release();
    swift_bridgeObjectRelease();
    return v4;
  }
  return v1;
}

uint64_t sub_21E896FFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E89705C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E897094(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *, void))(v1 + 16);
  char v3 = *((unsigned char *)a1 + 8);
  char v4 = *((unsigned char *)a1 + 9);
  uint64_t v6 = *a1;
  char v7 = v3;
  char v8 = v4;
  return v2(&v6, 0);
}

uint64_t sub_21E8970E4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21E8970FC(uint64_t *a1)
{
  long long v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *((unsigned char *)a1 + 8);
  char v4 = *((unsigned char *)a1 + 9);
  uint64_t v6 = *a1;
  char v7 = v3;
  char v8 = v4;
  return v2(&v6);
}

uint64_t AppResolutionResult.AppResolutionResultError.hash(into:)()
{
  uint64_t v1 = *v0;
  unint64_t v2 = (unint64_t)*v0 >> 62;
  if (v2)
  {
    if (v2 != 1) {
      return sub_21E8A4D80();
    }
    sub_21E8A4D80();
    if (*(void *)((v1 & 0x3FFFFFFFFFFFFFFFLL) + 0x18)) {
      goto LABEL_6;
    }
    return sub_21E8A4D90();
  }
  sub_21E8A4D80();
  if (!*(void *)(v1 + 24)) {
    return sub_21E8A4D90();
  }
LABEL_6:
  sub_21E8A4D90();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21E8A48F0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AppResolutionResult.AppResolutionResultError.hashValue.getter()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E8972AC()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E8972FC()
{
  return sub_21E8A4DA0();
}

uint64_t AppResolutionResult.hash(into:)(uint64_t a1)
{
  unint64_t v2 = *(void *)v1;
  uint64_t v3 = *(unsigned __int8 *)(v1 + 8);
  switch(v3)
  {
    case 1:
      sub_21E8A4D80();
      return sub_21E8978CC(a1, v2);
    case 2:
      sub_21E8A4D80();
      if (!*(void *)(v2 + 24)) {
        return sub_21E8A4D90();
      }
      sub_21E8A4D90();
      sub_21E895008(v2, 2);
      swift_bridgeObjectRetain();
      sub_21E8A48F0();
      swift_bridgeObjectRelease();
      uint64_t v5 = v2;
      char v6 = 2;
      goto LABEL_18;
    case 3:
      sub_21E8A4D80();
      if (!(v2 >> 62))
      {
        sub_21E8A4D80();
        if (*(void *)(v2 + 24))
        {
LABEL_14:
          sub_21E8A4D90();
          sub_21E895008(v2, 3);
          swift_bridgeObjectRetain();
          sub_21E8A48F0();
          swift_bridgeObjectRelease();
          goto LABEL_17;
        }
        return sub_21E8A4D90();
      }
      if (v2 >> 62 == 1)
      {
        sub_21E8A4D80();
        if (*(void *)((v2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18)) {
          goto LABEL_14;
        }
        return sub_21E8A4D90();
      }
      sub_21E8A4D80();
LABEL_17:
      uint64_t v5 = v2;
      char v6 = 3;
LABEL_18:
      return sub_21E895068(v5, v6);
    default:
      sub_21E8A4D80();
      if (!*(void *)(v2 + 24)) {
        return sub_21E8A4D90();
      }
      sub_21E8A4D90();
      sub_21E895008(v2, 0);
      swift_bridgeObjectRetain();
      sub_21E8A48F0();
      swift_bridgeObjectRelease();
      uint64_t v5 = v2;
      char v6 = 0;
      goto LABEL_18;
  }
}

unint64_t sub_21E897540(unint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = result >> 62;
  if (result >> 62) {
    goto LABEL_52;
  }
  uint64_t v5 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_21E8A4C90();
      __n128 result = swift_bridgeObjectRelease();
      if (v5 != v20) {
        return 0;
      }
    }
    else if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      return 0;
    }
    if (!v5) {
      return 1;
    }
    uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v3 < 0) {
      uint64_t v6 = v3;
    }
    if (!v4) {
      uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
    if (a2 < 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    if ((unint64_t)a2 >> 62) {
      uint64_t v8 = v9;
    }
    if (v6 == v8) {
      return 1;
    }
    if (v5 < 0) {
      goto LABEL_56;
    }
    if (((a2 | v3) & 0xC000000000000001) != 0) {
      break;
    }
    v3 += 32;
    a2 += 32;
    uint64_t v16 = *(void *)(v7 + 16);
    while (v16)
    {
      uint64_t v17 = *(void *)(*(void *)v3 + 24);
      uint64_t v18 = *(void *)(*(void *)a2 + 24);
      if (v17)
      {
        if (!v18) {
          return 0;
        }
        BOOL v19 = *(void *)(*(void *)v3 + 16) == *(void *)(*(void *)a2 + 16) && v17 == v18;
        if (!v19 && (sub_21E8A4CF0() & 1) == 0) {
          return 0;
        }
      }
      else if (v18)
      {
        return 0;
      }
      --v16;
      v3 += 8;
      a2 += 8;
      if (!--v5) {
        return 1;
      }
    }
LABEL_51:
    __break(1u);
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21E8A4C90();
    __n128 result = swift_bridgeObjectRelease();
  }
  unint64_t v10 = 0;
  unint64_t v11 = a2 & 0xC000000000000001;
  while (1)
  {
    if (v5 == v10)
    {
      __break(1u);
      __break(1u);
      goto LABEL_51;
    }
    if ((v3 & 0xC000000000000001) != 0)
    {
      __n128 result = MEMORY[0x223C33960](v10, v3);
      unint64_t v4 = result;
      if (v11) {
        goto LABEL_25;
      }
    }
    else
    {
      unint64_t v4 = *(void *)(v3 + 8 * v10 + 32);
      __n128 result = swift_retain();
      if (v11)
      {
LABEL_25:
        uint64_t v12 = MEMORY[0x223C33960](v10, a2);
        goto LABEL_29;
      }
    }
    if (v10 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    uint64_t v12 = *(void *)(a2 + 8 * v10 + 32);
    swift_retain();
LABEL_29:
    uint64_t v13 = *(void *)(v4 + 24);
    uint64_t v14 = *(void *)(v12 + 24);
    if (!v13)
    {
      if (v14) {
        goto LABEL_48;
      }
LABEL_20:
      swift_release();
      swift_release();
      goto LABEL_21;
    }
    if (!v14)
    {
LABEL_48:
      swift_release();
      swift_release();
      return 0;
    }
    if (*(void *)(v4 + 16) == *(void *)(v12 + 16) && v13 == v14) {
      goto LABEL_20;
    }
    char v15 = sub_21E8A4CF0();
    swift_release();
    swift_release();
    if ((v15 & 1) == 0) {
      return 0;
    }
LABEL_21:
    if (v5 == ++v10) {
      return 1;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
  return result;
}

uint64_t AppResolutionResult.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v4 = *v0;
  char v5 = v1;
  sub_21E8A4D70();
  AppResolutionResult.hash(into:)((uint64_t)v3);
  return sub_21E8A4DA0();
}

uint64_t sub_21E897820()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v4 = *v0;
  char v5 = v1;
  sub_21E8A4D70();
  AppResolutionResult.hash(into:)((uint64_t)v3);
  return sub_21E8A4DA0();
}

uint64_t sub_21E897878()
{
  char v1 = *((unsigned char *)v0 + 8);
  uint64_t v4 = *v0;
  char v5 = v1;
  sub_21E8A4D70();
  AppResolutionResult.hash(into:)((uint64_t)v3);
  return sub_21E8A4DA0();
}

uint64_t sub_21E8978CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21E8A4C90();
    swift_bridgeObjectRelease();
    sub_21E8A4D80();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E8A4C90();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return result;
    }
  }
  else
  {
    uint64_t result = sub_21E8A4D80();
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return result;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)(MEMORY[0x223C33960](i, a2) + 24))
      {
        sub_21E8A4D90();
        swift_bridgeObjectRetain();
        sub_21E8A48F0();
        swift_unknownObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        sub_21E8A4D90();
        uint64_t result = swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    unint64_t v6 = a2 + 32;
    do
    {
      if (*(void *)(*(void *)v6 + 24))
      {
        sub_21E8A4D90();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_21E8A48F0();
        swift_release();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t result = sub_21E8A4D90();
      }
      v6 += 8;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t _s17SiriAppResolution0bC6ResultO0bcD5ErrorO2eeoiySbAE_AEtFZ_0(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *a2;
  unint64_t v4 = (unint64_t)*a1 >> 62;
  if (v4)
  {
    if (v4 != 1)
    {
      if (v3 == 0x8000000000000000)
      {
        swift_release();
        return 1;
      }
      return 0;
    }
    if (v3 >> 62 != 1) {
      return 0;
    }
    v2 &= 0x3FFFFFFFFFFFFFFFuLL;
    v3 &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  else if (v3 >> 62)
  {
    return 0;
  }
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v3 + 24);
  if (!v5) {
    return !v6;
  }
  if (!v6) {
    return 0;
  }
  BOOL v7 = *(void *)(v2 + 16) == *(void *)(v3 + 16) && v5 == v6;
  return v7 || (sub_21E8A4CF0() & 1) != 0;
}

uint64_t _s17SiriAppResolution0bC6ResultO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = *(void *)a2;
  int v5 = *(unsigned __int8 *)(a2 + 8);
  switch(v3)
  {
    case 1:
      if (v5 != 1) {
        goto LABEL_24;
      }
      sub_21E895008(*(void *)a2, 1);
      sub_21E895008(v2, 1);
      char v10 = sub_21E897540(v2, v4);
      sub_21E895068(v2, 1);
      sub_21E895068(v4, 1);
      return v10 & 1;
    case 2:
      if (v5 != 2) {
        goto LABEL_24;
      }
      uint64_t v11 = *(void *)(v2 + 24);
      uint64_t v12 = *(void *)(v4 + 24);
      if (!v11)
      {
        sub_21E895008(v4, 2);
        sub_21E895008(v2, 2);
        sub_21E895068(v2, 2);
        sub_21E895068(v4, 2);
        if (v12) {
          goto LABEL_26;
        }
        goto LABEL_31;
      }
      if (!v12)
      {
        sub_21E895008(v4, 2);
        sub_21E895008(v2, 2);
        sub_21E895068(v2, 2);
        uint64_t v15 = v4;
        char v16 = 2;
        goto LABEL_25;
      }
      if (*(void *)(v2 + 16) == *(void *)(v4 + 16) && v11 == v12)
      {
        sub_21E895008(v4, 2);
        sub_21E895008(v2, 2);
        sub_21E895068(v2, 2);
        uint64_t v18 = v4;
        char v19 = 2;
        goto LABEL_36;
      }
      char v14 = sub_21E8A4CF0();
      sub_21E895008(v4, 2);
      sub_21E895008(v2, 2);
      sub_21E895068(v2, 2);
      sub_21E895068(v4, 2);
      if (v14) {
        goto LABEL_31;
      }
      goto LABEL_26;
    case 3:
      if (v5 != 3) {
        goto LABEL_24;
      }
      uint64_t v20 = *(void *)a2;
      uint64_t v21 = v2;
      sub_21E895008(v4, 3);
      sub_21E895008(v2, 3);
      sub_21E895008(v4, 3);
      sub_21E895008(v2, 3);
      char v10 = _s17SiriAppResolution0bC6ResultO0bcD5ErrorO2eeoiySbAE_AEtFZ_0(&v21, (unint64_t *)&v20);
      sub_21E895068(v2, 3);
      sub_21E895068(v4, 3);
      sub_21E895068(v4, 3);
      sub_21E895068(v2, 3);
      return v10 & 1;
    default:
      if (*(unsigned char *)(a2 + 8))
      {
LABEL_24:
        sub_21E895008(*(void *)a2, *(unsigned char *)(a2 + 8));
        sub_21E895008(v2, v3);
        sub_21E895068(v2, v3);
        uint64_t v15 = v4;
        char v16 = v5;
LABEL_25:
        sub_21E895068(v15, v16);
        goto LABEL_26;
      }
      uint64_t v6 = *(void *)(v2 + 24);
      uint64_t v7 = *(void *)(v4 + 24);
      if (!v6)
      {
        sub_21E895008(v4, 0);
        sub_21E895008(v2, 0);
        sub_21E895068(v2, 0);
        sub_21E895068(v4, 0);
        if (!v7)
        {
LABEL_31:
          char v10 = 1;
          return v10 & 1;
        }
LABEL_26:
        char v10 = 0;
        return v10 & 1;
      }
      if (!v7)
      {
        sub_21E895008(v4, 0);
        sub_21E895008(v2, 0);
        sub_21E895068(v2, 0);
        uint64_t v15 = v4;
        char v16 = 0;
        goto LABEL_25;
      }
      if (*(void *)(v2 + 16) != *(void *)(v4 + 16) || v6 != v7)
      {
        char v9 = sub_21E8A4CF0();
        sub_21E895008(v4, 0);
        sub_21E895008(v2, 0);
        sub_21E895068(v2, 0);
        sub_21E895068(v4, 0);
        if (v9) {
          goto LABEL_31;
        }
        goto LABEL_26;
      }
      sub_21E895008(v4, 0);
      sub_21E895008(v2, 0);
      sub_21E895068(v2, 0);
      uint64_t v18 = v4;
      char v19 = 0;
LABEL_36:
      sub_21E895068(v18, v19);
      char v10 = 1;
      return v10 & 1;
  }
}

unint64_t sub_21E897EA4()
{
  unint64_t result = qword_267D46490;
  if (!qword_267D46490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46490);
  }
  return result;
}

unint64_t sub_21E897EFC()
{
  unint64_t result = qword_267D46498;
  if (!qword_267D46498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46498);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_21E895008(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for AppResolutionResult(uint64_t a1)
{
  return sub_21E895068(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_21E895008(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_21E895068(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_21E895068(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppResolutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21E8980DC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_21E8980E4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionResult()
{
  return &type metadata for AppResolutionResult;
}

void *initializeBufferWithCopyOfBuffer for AppResolutionResult.AppResolutionResultError(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for AppResolutionResult.AppResolutionResultError()
{
  return swift_release();
}

void *assignWithCopy for AppResolutionResult.AppResolutionResultError(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *assignWithTake for AppResolutionResult.AppResolutionResultError(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionResult.AppResolutionResultError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AppResolutionResult.AppResolutionResultError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_21E898270(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_21E89828C(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_21E89829C(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  void *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionResult.AppResolutionResultError()
{
  return &type metadata for AppResolutionResult.AppResolutionResultError;
}

uint64_t dispatch thunk of AppResolving.resolveApp(intent:appResolutionState:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t static AppSelectionFailure.== infix(_:_:)()
{
  return 1;
}

uint64_t AppSelectionFailure.hash(into:)()
{
  return sub_21E8A4D80();
}

uint64_t AppSelectionFailure.hashValue.getter()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E898368()
{
  return 1;
}

uint64_t sub_21E898370()
{
  return sub_21E8A4DA0();
}

uint64_t sub_21E8983B4()
{
  return sub_21E8A4D80();
}

uint64_t sub_21E8983DC()
{
  return sub_21E8A4DA0();
}

unint64_t sub_21E898420()
{
  unint64_t result = qword_267D464A0[0];
  if (!qword_267D464A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267D464A0);
  }
  return result;
}

uint64_t dispatch thunk of AppSelecting.selectAppFor(intent:fromEligibleApps:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t getEnumTagSinglePayload for AppSelectionFailure(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AppSelectionFailure(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x21E898578);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21E8985A0()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppSelectionFailure()
{
  return &type metadata for AppSelectionFailure;
}

uint64_t dispatch thunk of InstrumentedAppSelecting.selectAppWithMetadata(intent:fromEligibleApps:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

unint64_t sub_21E8985CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465C0);
  uint64_t v2 = sub_21E8A4CC0();
  int v3 = (void *)v2;
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
    sub_21E89BC68(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21E89A1D0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21E89BB90(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void *AppSelectionService.__allocating_init(resolvers:)(uint64_t a1)
{
  return AppSelectionService.init(resolvers:)(a1);
}

void *AppSelectionService.init(resolvers:)(uint64_t a1)
{
  return sub_21E8987CC(a1, (uint64_t)sub_21E898774);
}

uint64_t type metadata accessor for AppSelectionService.EligibleAppFinder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E898764()
{
  return swift_allocObject();
}

void *AppSelectionService.__allocating_init(resolverArray:)(uint64_t a1)
{
  return AppSelectionService.init(resolverArray:)(a1);
}

void *AppSelectionService.init(resolverArray:)(uint64_t a1)
{
  return sub_21E8987CC(a1, (uint64_t)sub_21E898774);
}

void *sub_21E8987CC(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  uint64_t v4 = type metadata accessor for AppSelectionService.EligibleAppFinder();
  uint64_t v5 = swift_allocObject();
  v2[10] = v4;
  v2[11] = &off_26CFDC758;
  v2[7] = v5;
  v2[13] = a2;
  v2[14] = 0;
  return AppResolutionService.init()();
}

void *AppSelectionService.__allocating_init(resolvers:eligibleAppFinder:)(uint64_t a1, uint64_t a2)
{
  return AppSelectionService.init(resolvers:eligibleAppFinder:)(a1, a2);
}

void *AppSelectionService.init(resolvers:eligibleAppFinder:)(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  sub_21E8956E0(a2, (uint64_t)(v2 + 7));
  v2[13] = sub_21E898774;
  v2[14] = 0;
  uint64_t v4 = AppResolutionService.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v4;
}

void sub_21E8988EC(uint64_t a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  char v4 = *((unsigned char *)a3 + 8);
  char v5 = *((unsigned char *)a3 + 9);
  uint64_t v6 = *a3;
  char v7 = v4;
  char v8 = v5;
  sub_21E894B58(a1, a2, (uint64_t)&v6, a4);
}

uint64_t sub_21E898928(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a3;
  v9[5] = a4;
  swift_retain();
  id v10 = a1;
  swift_retain();
  sub_21E898F48(v10, a2, (void (*)(void **, unint64_t))sub_21E898B68, (uint64_t)v9);
  return swift_release();
}

void sub_21E8989D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void **))
{
  char v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  char v10 = *(unsigned char *)(a1 + 9);
  if (v10)
  {
    id v11 = v8;
  }
  else
  {
    uint64_t v20 = *(void **)a1;
    char v21 = v9;
    sub_21E894FFC(v8, v9, 0);
    sub_21E898B74((uint64_t)&v20, (uint64_t)&v18);
    sub_21E89505C(v8, v9, 0);
    char v8 = v18;
    char v9 = v19;
  }
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, void **, uint64_t))(a3 + 104);
  id v13 = objc_msgSend(a4, sel_typeName);
  uint64_t v14 = sub_21E8A48D0();
  uint64_t v16 = v15;

  uint64_t v20 = v8;
  char v21 = v9;
  char v22 = v10;
  v12(v14, v16, &v20, a2);
  swift_bridgeObjectRelease();
  uint64_t v20 = v8;
  char v21 = v9;
  char v22 = v10;
  a5(&v20);
  sub_21E89505C(v8, v9, v10);
}

uint64_t sub_21E898B20()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21E898B68(uint64_t a1, uint64_t a2)
{
  sub_21E8989D4(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void **))(v2 + 32));
}

void sub_21E898B74(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  int v4 = *(unsigned __int8 *)(a1 + 8);
  if (!*(unsigned char *)(a1 + 8))
  {
    uint64_t v15 = swift_retain();
    if (!sub_21E89517C(v15))
    {
      if (qword_267D462C8 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_21E8A47A0();
      __swift_project_value_buffer(v16, (uint64_t)qword_267D47610);
      sub_21E895008(v3, 0);
      swift_retain();
      char v7 = sub_21E8A4790();
      os_log_type_t v8 = sub_21E8A4A50();
      if (os_log_type_enabled(v7, v8))
      {
        char v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        uint64_t v22 = v10;
        *(_DWORD *)char v9 = 136315138;
        swift_retain();
        uint64_t v17 = sub_21E88CEC4();
        unint64_t v19 = v18;
        sub_21E895068(v3, 0);
        sub_21E88FA24(v17, v19, &v22);
        sub_21E8A4AF0();
        swift_bridgeObjectRelease();
        sub_21E895068(v3, 0);
        sub_21E895068(v3, 0);
        uint64_t v14 = "App(to be confirmed) restricted by screentime: %s";
        goto LABEL_17;
      }
      sub_21E895068(v3, 0);
      uint64_t v20 = v3;
      char v21 = 0;
LABEL_20:
      sub_21E895068(v20, v21);
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    uint64_t v5 = swift_retain();
    if (!sub_21E89517C(v5))
    {
      if (qword_267D462C8 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_21E8A47A0();
      __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
      sub_21E895008(v3, 2);
      swift_retain();
      char v7 = sub_21E8A4790();
      os_log_type_t v8 = sub_21E8A4A50();
      if (os_log_type_enabled(v7, v8))
      {
        char v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        uint64_t v22 = v10;
        *(_DWORD *)char v9 = 136315138;
        swift_retain();
        uint64_t v11 = sub_21E88CEC4();
        unint64_t v13 = v12;
        sub_21E895068(v3, 2);
        sub_21E88FA24(v11, v13, &v22);
        sub_21E8A4AF0();
        swift_bridgeObjectRelease();
        sub_21E895068(v3, 2);
        sub_21E895068(v3, 2);
        uint64_t v14 = "App(selected) restricted by screentime: %s";
LABEL_17:
        _os_log_impl(&dword_21E88B000, v7, v8, v14, v9, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C33F60](v10, -1, -1);
        MEMORY[0x223C33F60](v9, -1, -1);
LABEL_21:

        *(void *)a2 = v3 | 0x4000000000000000;
        *(unsigned char *)(a2 + 8) = 3;
        return;
      }
      sub_21E895068(v3, 2);
      uint64_t v20 = v3;
      char v21 = 2;
      goto LABEL_20;
    }
LABEL_9:
    sub_21E895068(v3, v4);
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v4;
  sub_21E895008(v3, v4);
}

void sub_21E898F48(void *a1, void *a2, void (*a3)(void **, unint64_t), uint64_t a4)
{
  sub_21E89936C(a2, (uint64_t *)&v30);
  unint64_t v9 = *((void *)&v30 + 1);
  if (*((void *)&v30 + 1) >> 2 == 0xFFFFFFFFLL)
  {
    uint64_t v10 = v4[10];
    uint64_t v11 = v4[11];
    __swift_project_boxed_opaque_existential_1(v4 + 7, v10);
    id v12 = objc_msgSend(a1, sel__className);
    uint64_t v13 = sub_21E8A48D0();
    uint64_t v15 = v14;

    sub_21E8956E0((uint64_t)a2, (uint64_t)&v30);
    uint64_t v16 = (void *)swift_allocObject();
    sub_21E8970E4(&v30, (uint64_t)(v16 + 2));
    v16[7] = a3;
    v16[8] = a4;
    v16[9] = v4;
    v16[10] = a1;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, void (*)(unint64_t), void *, uint64_t, uint64_t))(v11 + 16);
    swift_retain();
    swift_retain();
    id v18 = a1;
    v17(v13, v15, sub_21E89BD20, v16, v10, v11);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = a3;
    uint64_t v19 = v30;
    uint64_t v20 = v31;
    uint64_t v21 = v32;
    switch(*((void *)&v30 + 1) >> 61)
    {
      case 1:
      case 2:
      case 3:
        sub_21E89BE20(v30, *((unint64_t *)&v30 + 1));
        goto LABEL_7;
      case 4:
        sub_21E89BD30();
        uint64_t v22 = (void *)swift_allocError();
        sub_21E89BD84(v19, v9);
        char v23 = 0;
        char v24 = 1;
        break;
      default:
        sub_21E895008(v30, SBYTE8(v30));
LABEL_7:
        char v24 = 0;
        uint64_t v22 = (void *)v19;
        char v23 = v9;
        break;
    }
    uint64_t v27 = v22;
    char v28 = v23;
    char v29 = v24;
    *(void *)&long long v30 = v19;
    *((void *)&v30 + 1) = v9;
    uint64_t v31 = v20;
    uint64_t v32 = v21;
    unint64_t v25 = sub_21E8A3D50();
    v26(&v27, v25);
    swift_bridgeObjectRelease();
    sub_21E89BD84(v19, v9);
    sub_21E89505C(v22, v23, v24);
  }
}

void sub_21E8991B0(unint64_t a1, void *a2, void (*a3)(long long *, unint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v11 = 0x2000000000000002;
  unint64_t v12 = sub_21E8A27A0(a1);
  uint64_t v14 = (void *)v12;
  if (!v13) {
    goto LABEL_6;
  }
  if (v13 != 1)
  {
    unint64_t v11 = 0x2000000000000003;
    uint64_t v14 = (void *)0x8000000000000000;
LABEL_6:
    sub_21E895008((uint64_t)v14, v11);
    char v18 = v11;
    goto LABEL_7;
  }
  sub_21E89BEA8(v12, 1);
  uint64_t v15 = a2[3];
  uint64_t v16 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v15);
  AppResolutionStateProviding.previousSelectionResponse.getter(v15, v16, v20);
  if ((LOBYTE(v20[0]) | 2) != 3)
  {
    sub_21E8997A8(a6, a1, 0, a3, a4);
    return;
  }
  uint64_t v17 = swift_bridgeObjectRetain();
  char v18 = 1;
  sub_21E895008(v17, 1);
  unint64_t v11 = 0x6000000000000001;
  uint64_t v14 = (void *)a1;
LABEL_7:
  v20[3] = 0;
  uint64_t v21 = v14;
  char v22 = v18;
  char v23 = 0;
  v20[0] = v14;
  v20[1] = v11;
  v20[2] = 0;
  sub_21E89BEC4((uint64_t)v14, v11);
  unint64_t v19 = sub_21E8A3D50();
  a3((long long *)&v21, v19);
  swift_bridgeObjectRelease();
  sub_21E89BD98((uint64_t)v14, v11);
  sub_21E89BD84((uint64_t)v14, v11);
  sub_21E89505C(v14, v18, 0);
}

double sub_21E89936C@<D0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  AppResolutionStateProviding.previousSelectionResponse.getter(v4, v5, &v31);
  if (v31 == 3) {
    goto LABEL_2;
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if (v9)
  {
    uint64_t v10 = v9;
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_21E8A47A0();
    __swift_project_value_buffer(v11, (uint64_t)qword_267D47610);
    swift_retain_n();
    unint64_t v12 = sub_21E8A4790();
    os_log_type_t v13 = sub_21E8A4A50();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v31 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_retain();
      uint64_t v16 = sub_21E88CEC4();
      unint64_t v18 = v17;
      swift_release();
      sub_21E88FA24(v16, v18, &v31);
      sub_21E8A4AF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E88B000, v12, v13, "Selected requested app from appResolutionState: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v15, -1, -1);
      MEMORY[0x223C33F60](v14, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    *a2 = v10;
    a2[1] = 0x4000000000000002;
    goto LABEL_15;
  }
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
  if (!v21)
  {
LABEL_2:
    double result = 0.0;
    *(_OWORD *)a2 = xmmword_21E8A5C60;
LABEL_15:
    a2[2] = 0;
    a2[3] = 0;
    return result;
  }
  uint64_t v22 = v21;
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_21E8A47A0();
  __swift_project_value_buffer(v23, (uint64_t)qword_267D47610);
  swift_retain_n();
  char v24 = sub_21E8A4790();
  os_log_type_t v25 = sub_21E8A4A50();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v31 = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_retain();
    uint64_t v28 = sub_21E88CEC4();
    unint64_t v30 = v29;
    swift_release();
    sub_21E88FA24(v28, v30, &v31);
    sub_21E8A4AF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v24, v25, "Selected suggested app from appResolutionState: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v27, -1, -1);
    MEMORY[0x223C33F60](v26, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  *a2 = v22;
  *(void *)&double result = 2;
  *(_OWORD *)(a2 + 1) = xmmword_21E8A5C50;
  a2[3] = 0x800000021E8A6900;
  return result;
}

uint64_t sub_21E8997A8(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(long long *, unint64_t), uint64_t a5)
{
  uint64_t v9 = *(void *)(v5 + 96);
  if (*(void *)(v9 + 16) <= a3)
  {
    *(void *)&v17[0] = a2;
    WORD4(v17[0]) = 1;
    v18[0] = a2;
    v18[1] = 0x2000000000000001;
    v18[2] = 0;
    uint64_t v19 = 0;
    swift_bridgeObjectRetain_n();
    unint64_t v16 = sub_21E8A3D50();
    a4(v17, v16);
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  else if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = (void *)result;
    sub_21E8956E0(v9 + 40 * a3 + 32, (uint64_t)v18);
    uint64_t v12 = v19;
    uint64_t v13 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    sub_21E8956E0((uint64_t)v18, (uint64_t)v17);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a4;
    v14[3] = a5;
    sub_21E8970E4(v17, (uint64_t)(v14 + 4));
    v14[9] = v5;
    v14[10] = v11;
    v14[11] = a2;
    v14[12] = a3;
    swift_retain();
    swift_retain();
    id v15 = v11;
    swift_bridgeObjectRetain();
    sub_21E896CA0((uint64_t)v15, a2, (uint64_t)sub_21E89BB04, (uint64_t)v14, v12, v13);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }
  return result;
}

uint64_t sub_21E89993C(uint64_t result, uint64_t a2, void (*a3)(uint64_t *, uint64_t), uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(unsigned char *)(result + 9))
  {
    if (__OFADD__(a9, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v14 = (void *)swift_allocObject();
      v14[2] = a2;
      v14[3] = a3;
      v14[4] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_21E8997A8(a7, a8, a9 + 1, sub_21E89BB78, v14);
      return swift_release();
    }
  }
  else
  {
    uint64_t v15 = *(void *)result;
    uint64_t v16 = *(unsigned __int8 *)(result + 8);
    if (a2)
    {
      uint64_t v20 = *(void *)result;
      LOWORD(v21) = v16;
      sub_21E895008(v15, v16);
      a3(&v20, a2);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(a5, a5[3]);
      sub_21E895008(v15, v16);
      sub_21E895008(v15, v16);
      uint64_t v17 = sub_21E896C68();
      uint64_t v23 = v18;
      uint64_t v24 = v15;
      char v25 = v16;
      char v26 = 0;
      uint64_t v20 = v15;
      uint64_t v21 = v16;
      uint64_t v22 = v17;
      sub_21E895008(v15, v16);
      unint64_t v19 = sub_21E8A3D50();
      a3(&v24, v19);
      swift_bridgeObjectRelease();
      sub_21E895068(v15, v16);
      swift_bridgeObjectRelease();
      sub_21E89BB84(v15, v16, 0);
    }
    return sub_21E89BB84(v15, v16, 0);
  }
  return result;
}

uint64_t sub_21E899B2C(uint64_t *a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t *, uint64_t))
{
  uint64_t v6 = *a1;
  char v7 = *((unsigned char *)a1 + 8);
  char v8 = *((unsigned char *)a1 + 9);
  unint64_t v9 = sub_21E8985CC(MEMORY[0x263F8EE78]);
  if (a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = sub_21E8985CC(MEMORY[0x263F8EE78]);
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21E899C18(v10, v9);
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_21E899C18(v12, v11);
  uint64_t v15 = v6;
  char v16 = v7;
  char v17 = v8;
  a4(&v15, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E899C18(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_21E89B1F4(a1, (uint64_t)sub_21E89B1A0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_21E899CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  return MEMORY[0x270FA2498](sub_21E899CC8, 0, 0);
}

uint64_t sub_21E899CC8()
{
  uint64_t v1 = sub_21E89B728((uint64_t)&unk_26CFDBDC8);
  v0[10] = v1;
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8902D8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v0[7];
  v0[2] = v0[6];
  v0[11] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_21E899DD4;
  return sub_21E89C138(v0 + 2);
}

uint64_t sub_21E899DD4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 104) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_21E899F3C, 0, 0);
}

uint64_t sub_21E899F3C()
{
  (*(void (**)(void))(v0 + 64))(*(void *)(v0 + 104));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21E899FB0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_21E899FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21E8A49F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  uint64_t v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21E88F400((uint64_t)v10, (uint64_t)&unk_267D465B0, (uint64_t)v12);
  return swift_release();
}

void AppSelectionService.__allocating_init()()
{
}

void AppSelectionService.init()()
{
}

uint64_t sub_21E89A128()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t AppSelectionService.deinit()
{
  uint64_t v0 = AppResolutionService.deinit();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AppSelectionService.__deallocating_deinit()
{
  uint64_t v0 = AppSelectionService.deinit();
  return MEMORY[0x270FA0228](v0, 120, 7);
}

unint64_t sub_21E89A1D0(uint64_t a1, uint64_t a2)
{
  sub_21E8A4D70();
  sub_21E8A48F0();
  uint64_t v4 = sub_21E8A4DA0();
  return sub_21E89AB6C(a1, a2, v4);
}

uint64_t sub_21E89A248(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465E0);
  char v37 = a2;
  uint64_t v6 = sub_21E8A4CB0();
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
  uint64_t v34 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v34;
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_21E8A4D70();
    sub_21E8A48F0();
    uint64_t result = sub_21E8A4DA0();
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
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21E89A554(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465E8);
  char v36 = a2;
  uint64_t v6 = sub_21E8A4CB0();
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
    uint64_t v22 = (void *)(v5 + 64);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_21E8A4D70();
    sub_21E8A48F0();
    uint64_t result = sub_21E8A4DA0();
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
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21E89A86C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465C0);
  uint64_t v6 = sub_21E8A4CB0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
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
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_21E89BB90(v24, v35);
      }
      else
      {
        sub_21E8913D8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21E8A4D70();
      sub_21E8A48F0();
      uint64_t result = sub_21E8A4DA0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_21E89BB90(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_21E89AB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E8A4CF0() & 1) == 0)
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
      while (!v14 && (sub_21E8A4CF0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_21E89AC50()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E8A4CA0();
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
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_21E89AE00()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E8A4CA0();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21E89AFB8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D465C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E8A4CA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_21E8913D8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_21E89BB90(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21E89B1A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_21E8913D8((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E89B1F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v50 = a1;
  uint64_t v51 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v52 = v8;
  uint64_t v53 = 0;
  uint64_t v54 = v11 & v9;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21E89B54C(&v48);
  uint64_t v12 = *((void *)&v48 + 1);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v48;
  sub_21E89BB90(v49, v47);
  unint64_t v14 = *(void **)a5;
  unint64_t v16 = sub_21E89A1D0(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_21E89AFB8();
      if (v20) {
        goto LABEL_12;
      }
    }
LABEL_14:
    int64_t v24 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    int64_t v25 = (uint64_t *)(v24[6] + 16 * v16);
    uint64_t *v25 = v13;
    v25[1] = v12;
    sub_21E89BB90(v47, (_OWORD *)(v24[7] + 32 * v16));
    uint64_t v26 = v24[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_21E89B54C(&v48);
    for (uint64_t i = *((void *)&v48 + 1); *((void *)&v48 + 1); uint64_t i = *((void *)&v48 + 1))
    {
      uint64_t v31 = v48;
      sub_21E89BB90(v49, v47);
      uint64_t v32 = *(void **)a5;
      unint64_t v34 = sub_21E89A1D0(v31, i);
      uint64_t v35 = v32[2];
      BOOL v36 = (v33 & 1) == 0;
      uint64_t v37 = v35 + v36;
      if (__OFADD__(v35, v36)) {
        goto LABEL_28;
      }
      char v38 = v33;
      if (v32[3] < v37)
      {
        sub_21E89A86C(v37, 1);
        unint64_t v39 = sub_21E89A1D0(v31, i);
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_30;
        }
        unint64_t v34 = v39;
      }
      if (v38)
      {
        sub_21E8913D8((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
        swift_bridgeObjectRelease();
        BOOL v30 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
        sub_21E89BB90(v46, v30);
      }
      else
      {
        unint64_t v41 = *(void **)a5;
        *(void *)(*(void *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        char v42 = (uint64_t *)(v41[6] + 16 * v34);
        uint64_t *v42 = v31;
        v42[1] = i;
        sub_21E89BB90(v47, (_OWORD *)(v41[7] + 32 * v34));
        uint64_t v43 = v41[2];
        BOOL v27 = __OFADD__(v43, 1);
        uint64_t v44 = v43 + 1;
        if (v27) {
          goto LABEL_29;
        }
        v41[2] = v44;
      }
      sub_21E89B54C(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21E89122C();
    return swift_release();
  }
  sub_21E89A86C(v19, a4 & 1);
  unint64_t v21 = sub_21E89A1D0(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    sub_21E8913D8((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
    swift_bridgeObjectRelease();
    unint64_t v23 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
    sub_21E89BB90(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_21E8A4D10();
  __break(1u);
  return result;
}

uint64_t sub_21E89B54C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_21E8913D8(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_21E89BBA0((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_21E89BC08((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_21E89B728(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D465B8);
    uint64_t v3 = sub_21E8A4BB0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = *(void *)(v6 + 8 * v4);
      sub_21E8A4D70();
      sub_21E8A4D80();
      uint64_t result = sub_21E8A4DA0();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(void *)(v14 + 8 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(void *)(v14 + 8 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_21E89B86C()
{
}

uint64_t sub_21E89B89C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AppSelectionService()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AppSelectionService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSelectionService);
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolvers:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolverArray:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolvers:eligibleAppFinder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_21E89B968()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21E89B9A0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_21E89B9E8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_21E891128;
  *(void *)(v4 + 72) = v3;
  *(_OWORD *)(v4 + 56) = v5;
  *(void *)(v4 + 48) = v2;
  return MEMORY[0x270FA2498](sub_21E899CC8, 0, 0);
}

uint64_t sub_21E89BAAC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_21E89BB04(uint64_t a1, uint64_t a2)
{
  return sub_21E89993C(a1, a2, *(void (**)(uint64_t *, uint64_t))(v2 + 16), *(void *)(v2 + 24), (void *)(v2 + 32), *(void *)(v2 + 72), *(void *)(v2 + 80), *(void *)(v2 + 88), *(void *)(v2 + 96));
}

uint64_t sub_21E89BB38()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21E89BB78(uint64_t *a1, uint64_t a2)
{
  return sub_21E899B2C(a1, a2, *(void *)(v2 + 16), *(void (**)(uint64_t *, uint64_t))(v2 + 24));
}

uint64_t sub_21E89BB84(uint64_t a1, char a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_21E895068(a1, a2);
  }
  return a1;
}

_OWORD *sub_21E89BB90(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21E89BBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D465C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E89BC08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D465D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E89BC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D465D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E89BCD0()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

void sub_21E89BD20(unint64_t a1)
{
  sub_21E8991B0(a1, (void *)(v1 + 16), *(void (**)(long long *, unint64_t))(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80));
}

unint64_t sub_21E89BD30()
{
  unint64_t result = qword_267D465F0;
  if (!qword_267D465F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267D465F0);
  }
  return result;
}

uint64_t sub_21E89BD84(uint64_t result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF) {
    return sub_21E89BD98(result, a2);
  }
  return result;
}

uint64_t sub_21E89BD98(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 >> 61;
  if ((a2 >> 61) <= 3)
  {
    if (v2 > 3) {
      unint64_t v2 = 0;
    }
    return ((uint64_t (*)(uint64_t, char))((char *)&loc_21E89BDB8 + (int)funcs_21E89BDC0[v2]))(result, a2);
  }
  return result;
}

uint64_t sub_21E89BDC4(uint64_t a1, char a2)
{
  return sub_21E895068(a1, a2);
}

uint64_t sub_21E89BDD8(uint64_t a1, char a2)
{
  sub_21E895068(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E89BE20(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 >> 61;
  if ((a2 >> 61) <= 3)
  {
    if (v2 > 3) {
      unint64_t v2 = 0;
    }
    return ((uint64_t (*)(uint64_t, char))((char *)&loc_21E89BE40 + (int)funcs_21E89BE48[v2]))(result, a2);
  }
  return result;
}

uint64_t sub_21E89BE4C(uint64_t a1, char a2)
{
  return sub_21E895008(a1, a2);
}

uint64_t sub_21E89BE60(uint64_t a1, char a2)
{
  sub_21E895008(a1, a2);
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E89BEA8(uint64_t a1, char a2)
{
  if (a2 == 1) {
    return swift_bridgeObjectRelease();
  }
  if (!a2) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21E89BEC4(uint64_t result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF) {
    return sub_21E89BE20(result, a2);
  }
  return result;
}

uint64_t AppSupportQuery.init(intentID:allowedSiriAuthorizationStatus:allowedExtensionPointIdentifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, void *a5@<X8>)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *a4;
  *a5 = result;
  a5[1] = a2;
  a5[2] = v5;
  a5[3] = v6;
  return result;
}

uint64_t sub_21E89BEEC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21E89BF50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_21E8A4CF0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_21E8A4CF0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21E89C018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  a3[3] = &type metadata for AppSupportService.SystemAppRecordData;
  a3[4] = sub_21E8A2514();
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E89C074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = sub_21E8A20C0(a1, a2);
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46690);
  uint64_t result = sub_21E8A2478(&qword_267D46698, &qword_267D46690);
  a3[4] = result;
  *a3 = v4;
  return result;
}

uint64_t static AppSupportService.sharedInstance.getter()
{
  type metadata accessor for AppSupportService();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for AppSupportService()
{
  return self;
}

uint64_t sub_21E89C138(uint64_t *a1)
{
  *(void *)(v2 + 56) = v1;
  uint64_t v4 = sub_21E8A4780();
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 72) = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(void *)(v2 + 80) = v5;
  *(void *)(v2 + 88) = v6;
  *(void *)(v2 + 96) = v7;
  *(_OWORD *)(v2 + 104) = *((_OWORD *)a1 + 1);
  return MEMORY[0x270FA2498](sub_21E89C20C, 0, 0);
}

uint64_t sub_21E89C20C()
{
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267D47628;
  sub_21E8A4770();
  sub_21E8A4AD0();
  sub_21E8A4760();
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21E8A47A0();
  v0[15] = __swift_project_value_buffer(v2, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_21E8A4790();
  os_log_type_t v4 = sub_21E8A4A20();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = v0[12];
  if (v5)
  {
    uint64_t v17 = v0[11];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[6] = sub_21E88FA24(v17, v6, &v20);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v3, v4, "Searching for Apps Plugins supporting Intent '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v8, -1, -1);
    MEMORY[0x223C33F60](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = v0[14];
  long long v18 = *((_OWORD *)v0 + 6);
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[7];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46600);
  uint64_t v13 = swift_task_alloc();
  v0[16] = v13;
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v10;
  *(_OWORD *)(v13 + 32) = v18;
  *(void *)(v13 + 48) = v9;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46618);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[17] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_21E89C56C;
  return MEMORY[0x270FA2158](v0 + 2, v12, v14, 0, 0, &unk_267D46610, v13, v12);
}

uint64_t sub_21E89C56C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21E89C684, 0, 0);
}

uint64_t sub_21E89C684()
{
  uint64_t v20 = v0;
  unint64_t v1 = v0[2];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_21E8A4790();
  os_log_type_t v3 = sub_21E8A4A20();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v4 = 134218498;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_21E8A4C90();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v7 = v0[11];
    unint64_t v6 = v0[12];
    swift_bridgeObjectRelease();
    v0[3] = v5;
    sub_21E8A4AF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_21E88FA24(v7, v6, &v19);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 22) = 2080;
    uint64_t v8 = type metadata accessor for App();
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x223C336F0](v9, v8);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[5] = sub_21E88FA24(v10, v12, &v19);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E88B000, v2, v3, "Found %ld apps supporting %s: %s", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v18, -1, -1);
    MEMORY[0x223C33F60](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = v0[9];
  uint64_t v13 = v0[10];
  uint64_t v15 = v0[8];
  sub_21E8A4AC0();
  sub_21E8A4760();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(unint64_t))v0[1];
  return v16(v1);
}

uint64_t sub_21E89C9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  void v7[5] = a3;
  v7[3] = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46628);
  v7[10] = v8;
  v7[11] = *(void *)(v8 - 8);
  v7[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  v7[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21E89CAD8, 0, 0);
}

uint64_t sub_21E89CAD8()
{
  unint64_t v1 = v0;
  uint64_t v2 = v0[13];
  uint64_t v16 = v0 + 2;
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  uint64_t v8 = sub_21E8A49F0();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v15(v2, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v7;
  v9[5] = v5;
  v9[6] = v6;
  v9[7] = v4;
  v9[8] = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E89D240(v2, (uint64_t)&unk_267D46638, (uint64_t)v9);
  sub_21E891238(v2);
  v15(v2, 1, 1, v8);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v7;
  v10[5] = v5;
  v10[6] = v6;
  v10[7] = v4;
  v10[8] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21E89D240(v2, (uint64_t)&unk_267D46648, (uint64_t)v10);
  sub_21E891238(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46600);
  sub_21E8A49C0();
  v1[14] = MEMORY[0x263F8EE88];
  uint64_t v11 = sub_21E8A2478(&qword_267D46650, &qword_267D46628);
  unint64_t v12 = (void *)swift_task_alloc();
  v1[15] = v12;
  void *v12 = v1;
  v12[1] = sub_21E89CD5C;
  uint64_t v13 = v1[10];
  return MEMORY[0x270FA1E80](v16, v13, v11);
}

uint64_t sub_21E89CD5C()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[11] + 8))(v2[12], v2[10]);
    swift_bridgeObjectRelease();
    uint64_t v3 = nullsub_1;
  }
  else
  {
    uint64_t v3 = sub_21E89CE90;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21E89CE90()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[14];
  if (v1)
  {
    v0[14] = sub_21E89D710(v1, v0[14]);
    uint64_t v3 = sub_21E8A2478(&qword_267D46650, &qword_267D46628);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[15] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_21E89CD5C;
    uint64_t v5 = v0[10];
    return MEMORY[0x270FA1E80](v0 + 2, v5, v3);
  }
  else
  {
    uint64_t v6 = (uint64_t *)v0[3];
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_21E8901DC(v2);
    swift_bridgeObjectRelease();
    *uint64_t v6 = v7;
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_21E89D014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  uint64_t v7 = sub_21E8A4780();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21E89D0D8, 0, 0);
}

uint64_t sub_21E89D0D8()
{
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  unint64_t v3 = v0[5];
  uint64_t v11 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v5 = (uint64_t *)v0[2];
  id v6 = (id)qword_267D47628;
  sub_21E8A4770();
  sub_21E8A4AD0();
  sub_21E8A4760();
  unint64_t v7 = sub_21E89E4E4(v4, v3);
  uint64_t v8 = sub_21E890EA4(v7);
  swift_bridgeObjectRelease();
  sub_21E8A4AC0();
  sub_21E8A4760();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v11);
  *uint64_t v5 = v8;
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_21E89D240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E8A1F68(a1, (uint64_t)v10);
  uint64_t v11 = sub_21E8A49F0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21E891238((uint64_t)v10);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_21E8A49B0();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_21E8A49E0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46600);
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    _OWORD v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_21E89D440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[7] = a1;
  v8[8] = a4;
  uint64_t v9 = sub_21E8A4780();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21E89D508, 0, 0);
}

uint64_t sub_21E89D508()
{
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v14 = (uint64_t *)v0[7];
  uint64_t v15 = v0[13];
  id v6 = (id)qword_267D47628;
  sub_21E8A4770();
  sub_21E8A4AD0();
  sub_21E8A4760();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v5, v3);
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  unint64_t v7 = (void *)swift_task_alloc();
  v7[2] = v5;
  v7[3] = v3;
  v7[4] = v12;
  void v7[5] = v13;
  type metadata accessor for App();
  unint64_t v8 = sub_21E8A4920();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v9 = sub_21E890EA4(v8);
  swift_bridgeObjectRelease();
  sub_21E8A4AC0();
  sub_21E8A4760();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v15);
  *uint64_t v14 = v9;
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_21E89D710(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v19 = a2;
  if ((result & 0xC000000000000001) != 0)
  {
    sub_21E8A4B30();
    type metadata accessor for App();
    sub_21E8A1870();
    uint64_t result = sub_21E8A4A10();
    uint64_t v2 = v20;
    uint64_t v17 = v21;
    uint64_t v3 = v22;
    uint64_t v4 = v23;
    unint64_t v5 = v24;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(result + 32);
    uint64_t v17 = result + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(result + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v17 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v17 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v17 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = *(void *)(v17 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v15 = *(void *)(v17 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v9 != v16)
              {
                unint64_t v15 = *(void *)(v17 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_21E89122C();
              return v19;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    uint64_t v13 = *(void *)(*(void *)(v2 + 48) + 8 * v11);
    swift_retain();
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_21E8A08D0(&v18, v13);
      uint64_t result = swift_release();
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_21E8A4B60())
      {
        type metadata accessor for App();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v13 = v18;
        swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v13) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21E89D990@<X0>(void *a1@<X0>, uint64_t a2@<X3>, void *a3@<X4>, uint64_t *a4@<X8>)
{
  v86 = a4;
  v84 = a3;
  uint64_t v6 = sub_21E8A47A0();
  uint64_t v85 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  if (!v12)
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
    sub_21E8956E0((uint64_t)a1, (uint64_t)v89);
    uint64_t v26 = sub_21E8A4790();
    os_log_type_t v27 = sub_21E8A4A40();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v92 = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      sub_21E8956E0((uint64_t)v89, (uint64_t)&v87);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D46678);
      uint64_t v30 = sub_21E8A48E0();
      uint64_t v87 = sub_21E88FA24(v30, v31, &v92);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
      _os_log_impl(&dword_21E88B000, v26, v27, "Error enumerating plugins, no pluginIdentifier on proxy object: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v29, -1, -1);
      uint64_t v32 = (uint64_t)v28;
LABEL_45:
      MEMORY[0x223C33F60](v32, -1, -1);
LABEL_48:

      v60 = v86;
      uint64_t result = 0;
      goto LABEL_49;
    }
LABEL_47:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
    goto LABEL_48;
  }
  uint64_t v13 = v11;
  unint64_t v14 = v12;
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v15);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  uint64_t v81 = a2;
  uint64_t v82 = v17;
  unint64_t v19 = v18;
  if (!v18)
  {
    uint64_t v83 = v6;
    unint64_t v80 = 0;
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v83, (uint64_t)qword_267D47610);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_21E8A4790();
    os_log_type_t v21 = sub_21E8A4A20();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = v13;
      uint64_t v24 = swift_slowAlloc();
      v89[0] = v24;
      *(_DWORD *)uint64_t v22 = 136315138;
      v79[1] = v22 + 4;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_21E88FA24(v23, v14, v89);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E88B000, v20, v21, "Plugin %s has no containing bundle or bundleId.", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v24;
      uint64_t v13 = v23;
      MEMORY[0x223C33F60](v25, -1, -1);
      MEMORY[0x223C33F60](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v19 = v80;
    uint64_t v6 = v83;
  }
  uint64_t v33 = a1[3];
  uint64_t v34 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v33);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v34 + 40))(v33, v34) & 1) == 0)
  {
    uint64_t v44 = a1[3];
    uint64_t v45 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v44);
    uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 32))(v44, v45);
    if ((v47 & 1) == 0 && v81 && (sub_21E89BEEC(v46, v81) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_267D462C8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
      sub_21E8956E0((uint64_t)a1, (uint64_t)v89);
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_21E8A4790();
      os_log_type_t v61 = sub_21E8A4A30();
      if (os_log_type_enabled(v26, v61))
      {
        uint64_t v62 = swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        uint64_t v92 = v63;
        *(_DWORD *)uint64_t v62 = 136315394;
        uint64_t v87 = v82;
        unint64_t v88 = v19;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D46680);
        uint64_t v64 = sub_21E8A48E0();
        uint64_t v87 = sub_21E88FA24(v64, v65, &v92);
        sub_21E8A4AF0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v62 + 12) = 2080;
        uint64_t v66 = v90;
        uint64_t v67 = v91;
        __swift_project_boxed_opaque_existential_1(v89, v90);
        uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v67 + 32))(v66, v67);
        LOBYTE(v88) = v68 & 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D46688);
        uint64_t v69 = sub_21E8A48E0();
        uint64_t v87 = sub_21E88FA24(v69, v70, &v92);
        sub_21E8A4AF0();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
        uint64_t v71 = "Siri authorization status restriction is set and %s does not qualify due to status: %s";
LABEL_44:
        _os_log_impl(&dword_21E88B000, v26, v61, v71, (uint8_t *)v62, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x223C33F60](v63, -1, -1);
        uint64_t v32 = v62;
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    uint64_t v85 = v13;
    uint64_t v48 = v6;
    unint64_t v49 = v19;
    uint64_t v50 = a1[3];
    uint64_t v51 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v50);
    uint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t))(v51 + 24);
    uint64_t v53 = v84;
    swift_bridgeObjectRetain();
    uint64_t v54 = v52(v50, v51);
    if (v53)
    {
      unint64_t v56 = v49;
      if (!v55)
      {
        swift_bridgeObjectRelease();
        uint64_t v58 = v48;
        goto LABEL_40;
      }
      char v57 = sub_21E89BF50(v54, v55, v84);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v58 = v48;
      if ((v57 & 1) == 0)
      {
LABEL_40:
        swift_bridgeObjectRelease();
        if (qword_267D462C8 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v58, (uint64_t)qword_267D47610);
        sub_21E8956E0((uint64_t)a1, (uint64_t)v89);
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_21E8A4790();
        os_log_type_t v61 = sub_21E8A4A20();
        if (os_log_type_enabled(v26, v61))
        {
          uint64_t v62 = swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          uint64_t v92 = v63;
          *(_DWORD *)uint64_t v62 = 136315394;
          uint64_t v87 = v82;
          unint64_t v88 = v56;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267D46680);
          uint64_t v72 = sub_21E8A48E0();
          uint64_t v87 = sub_21E88FA24(v72, v73, &v92);
          sub_21E8A4AF0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v62 + 12) = 2080;
          uint64_t v74 = v90;
          uint64_t v75 = v91;
          __swift_project_boxed_opaque_existential_1(v89, v90);
          uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 24))(v74, v75);
          unint64_t v88 = v76;
          uint64_t v77 = sub_21E8A48E0();
          uint64_t v87 = sub_21E88FA24(v77, v78, &v92);
          sub_21E8A4AF0();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
          uint64_t v71 = "Extension point identifier restriction is set and %s does not qualify due to identifier %s";
          goto LABEL_44;
        }
LABEL_46:
        swift_bridgeObjectRelease_n();
        goto LABEL_47;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v56 = v49;
    }
    type metadata accessor for App();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v82;
    *(void *)(result + 24) = v56;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(void *)(result + 32) = v85;
    *(void *)(result + 40) = v14;
    v60 = v86;
    goto LABEL_49;
  }
  swift_bridgeObjectRelease();
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v35 = __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
  uint64_t v36 = v85;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v8, v35, v6);
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_21E8A4790();
  os_log_type_t v38 = sub_21E8A4A20();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = swift_slowAlloc();
    uint64_t v83 = v6;
    char v40 = (uint8_t *)v39;
    uint64_t v41 = swift_slowAlloc();
    v89[0] = v41;
    *(_DWORD *)char v40 = 136315138;
    if (v19) {
      uint64_t v42 = v82;
    }
    else {
      uint64_t v42 = 7104878;
    }
    if (v19) {
      unint64_t v43 = v19;
    }
    else {
      unint64_t v43 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_21E88FA24(v42, v43, v89);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v37, v38, "Omitting hidden app %s from results", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v41, -1, -1);
    MEMORY[0x223C33F60](v40, -1, -1);

    (*(void (**)(char *, uint64_t))(v85 + 8))(v8, v83);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v6);
  }
  uint64_t result = 0;
  v60 = v86;
LABEL_49:
  uint64_t *v60 = result;
  return result;
}

uint64_t sub_21E89E4E4(uint64_t a1, unint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(v2 + 16))(v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  uint64_t v5 = type metadata accessor for App();
  uint64_t v6 = sub_21E8A4920();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21E8A47A0();
  __swift_project_value_buffer(v7, (uint64_t)qword_267D47610);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_21E8A4790();
  os_log_type_t v9 = sub_21E8A4A20();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v17[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    sub_21E88FA24(a1, a2, v17);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v13 = MEMORY[0x223C336F0](v12, v5);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_21E88FA24(v13, v15, v17);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v8, v9, "searchApps(intentID: %s) returning %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v11, -1, -1);
    MEMORY[0x223C33F60](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v6;
}

uint64_t sub_21E89E780@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5))
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21E8A47A0();
    __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
    sub_21E8956E0((uint64_t)a1, (uint64_t)v30);
    uint64_t v7 = sub_21E8A4790();
    os_log_type_t v8 = sub_21E8A4A20();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v33 = v10;
      *(_DWORD *)os_log_type_t v9 = 136315138;
      uint64_t v11 = v31;
      uint64_t v12 = v32;
      __swift_project_boxed_opaque_existential_1(v30, v31);
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
      unint64_t v15 = v14;
      sub_21E8956E0((uint64_t)v30, (uint64_t)v29);
      if (!v15)
      {
        sub_21E8956E0((uint64_t)v29, (uint64_t)v28);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D46670);
        uint64_t v13 = sub_21E8A48E0();
        unint64_t v15 = v16;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
      v29[0] = sub_21E88FA24(v13, v15, &v33);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
      _os_log_impl(&dword_21E88B000, v7, v8, "Omitting hidden app  %s from results", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v10, -1, -1);
      MEMORY[0x223C33F60](v9, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
    }
LABEL_16:
    uint64_t result = 0;
    goto LABEL_17;
  }
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
  if (!v20)
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_21E8A47A0();
    __swift_project_value_buffer(v24, (uint64_t)qword_267D47610);
    uint64_t v25 = sub_21E8A4790();
    os_log_type_t v26 = sub_21E8A4A20();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v27 = 0;
      _os_log_impl(&dword_21E88B000, v25, v26, "AppRecord does not contain bundleIdentifier", v27, 2u);
      MEMORY[0x223C33F60](v27, -1, -1);
    }

    goto LABEL_16;
  }
  uint64_t v21 = v19;
  uint64_t v22 = v20;
  type metadata accessor for App();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v21;
  *(void *)(result + 24) = v22;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
LABEL_17:
  *a2 = result;
  return result;
}

uint64_t sub_21E89EB00(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(a1, sel_supportedIntents);
  uint64_t v6 = (void *)sub_21E8A4960();

  LOBYTE(a3) = sub_21E89BF50(a2, a3, v6);
  swift_bridgeObjectRelease();
  return a3 & 1;
}

uint64_t sub_21E89EB78(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

double sub_21E89EBD0@<D0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_nextObject);
  if (v3)
  {
    id v4 = v3;
    *(void *)(a1 + 24) = sub_21E894988(0, &qword_267D466C8);
    *(void *)(a1 + 32) = &off_26CFDC810;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_21E89EC48@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  id v5 = objc_msgSend(self, sel_enumeratorWithOptions_, 0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v3;
  v9[4] = sub_21E8A2794;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_21E89EB78;
  v9[3] = &block_descriptor_43;
  uint64_t v7 = _Block_copy(v9);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_setFilter_, v7);
  _Block_release(v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v5;
  return result;
}

uint64_t sub_21E89ED64()
{
  return 2;
}

uint64_t sub_21E89ED6C()
{
  sub_21E8A1A8C(*v0, v0[1]);
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_21E89EDA4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21E89EDAC(a1, a2, a3, *v3, v3[1]);
}

uint64_t sub_21E89EDAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_msgSend(self, sel_enumeratorWithOptions_, 0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  uint64_t v24 = sub_21E8A2740;
  uint64_t v25 = v11;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v22 = sub_21E89EB78;
  uint64_t v23 = &block_descriptor_29;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v10, sel_setFilter_, v12);
  _Block_release(v12);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v14 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v10;
    return v14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    id v15 = objc_msgSend(v10, sel_nextObject);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = sub_21E894988(0, &qword_267D466C8);
      uint64_t v14 = 0;
      while (1)
      {
        uint64_t v19 = v17;
        uint64_t v20 = &off_26CFDC810;
        *(void *)&long long v18 = v16;
        sub_21E8970E4(&v18, (uint64_t)&aBlock);
        sub_21E8970E4(&aBlock, a2);
        if (a3 - 1 == v14) {
          break;
        }
        a2 += 40;
        id v16 = objc_msgSend(v10, sel_nextObject);
        ++v14;
        if (!v16) {
          goto LABEL_11;
        }
      }
      uint64_t v14 = a3;
    }
    else
    {
      uint64_t v14 = 0;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E89EFA4()
{
  return sub_21E8A4930();
}

uint64_t sub_21E89EFC8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21E8A47A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_beginAccess();
    id v10 = a1;
    MEMORY[0x223C336C0]();
    if (*(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_21E8A4990();
    sub_21E8A49A0();
    sub_21E8A4980();
    return swift_endAccess();
  }
  else
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_267D47610);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
    id v13 = a2;
    id v14 = a2;
    id v15 = sub_21E8A4790();
    os_log_type_t v16 = sub_21E8A4A40();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      if (a2)
      {
        swift_getErrorValue();
        uint64_t v19 = sub_21E8A4D20();
        unint64_t v21 = v20;
      }
      else
      {
        unint64_t v21 = 0xEA00000000003E72;
        uint64_t v19 = 0x6F727265206F6E3CLL;
      }
      v22[7] = sub_21E88FA24(v19, v21, v22);
      sub_21E8A4AF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21E88B000, v15, v16, "Error enumerating plugins: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v18, -1, -1);
      MEMORY[0x223C33F60](v17, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_21E89F2D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_21E89F360(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21E8A4C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t result = sub_21E8A18C8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x223C33960](v5, a1);
        uint64_t v17 = v3;
        unint64_t v8 = *(void *)(v3 + 16);
        unint64_t v7 = *(void *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_21E8A18C8(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v17;
        }
        ++v5;
        uint64_t v15 = sub_21E894988(0, &qword_267D466A8);
        os_log_type_t v16 = &off_26CFDC830;
        *(void *)&long long v14 = v6;
        *(void *)(v3 + 16) = v8 + 1;
        sub_21E8970E4(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      os_log_type_t v9 = (void **)(a1 + 32);
      do
      {
        id v10 = *v9;
        uint64_t v17 = v3;
        unint64_t v12 = *(void *)(v3 + 16);
        unint64_t v11 = *(void *)(v3 + 24);
        id v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_21E8A18C8(v11 > 1, v12 + 1, 1);
          uint64_t v3 = v17;
        }
        uint64_t v15 = sub_21E894988(0, &qword_267D466A8);
        os_log_type_t v16 = &off_26CFDC830;
        *(void *)&long long v14 = v13;
        *(void *)(v3 + 16) = v12 + 1;
        sub_21E8970E4(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t AppSupportService.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t AppSupportService.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t AppSupportQuery.intentID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSupportQuery.intentID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppSupportQuery.intentID.modify())()
{
  return nullsub_1;
}

uint64_t AppSupportQuery.allowedSiriAuthorizationStatus.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t AppSupportQuery.allowedSiriAuthorizationStatus.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  return result;
}

uint64_t (*AppSupportQuery.allowedSiriAuthorizationStatus.modify())()
{
  return nullsub_1;
}

uint64_t AppSupportQuery.allowedExtensionPointIdentifiers.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t AppSupportQuery.allowedExtensionPointIdentifiers.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  return result;
}

uint64_t (*AppSupportQuery.allowedExtensionPointIdentifiers.modify())()
{
  return nullsub_1;
}

id sub_21E89F70C()
{
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_applicationWithBundleIdentifier_, v1);

    id v4 = objc_msgSend(v3, sel_isHidden);
  }
  else
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_21E8A47A0();
    __swift_project_value_buffer(v5, (uint64_t)qword_267D47610);
    id v6 = v0;
    unint64_t v7 = sub_21E8A4790();
    os_log_type_t v8 = sub_21E8A4A20();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      id v10 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 138412290;
      id v11 = v6;
      sub_21E8A4AF0();
      *id v10 = v6;

      _os_log_impl(&dword_21E88B000, v7, v8, "No app bundle id found for %@. Hidden app check is not applicable.", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D463C0);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v10, -1, -1);
      MEMORY[0x223C33F60](v9, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v4;
}

uint64_t sub_21E89F918()
{
  id v1 = objc_msgSend(*v0, sel_bundleIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_21E8A48D0();

  return v3;
}

unint64_t sub_21E89F980()
{
  return (unint64_t)sub_21E89F70C() & 1;
}

id sub_21E89F9A8()
{
  id v1 = objc_msgSend(v0, sel_containingBundle);
  if (v1
    && (uint64_t v2 = v1, v3 = objc_msgSend(v1, sel_bundleIdentifier), v2, v3))
  {
    sub_21E8A48D0();

    id v4 = self;
    uint64_t v5 = (void *)sub_21E8A48C0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v4, sel_applicationWithBundleIdentifier_, v5);

    id v7 = objc_msgSend(v6, sel_isHidden);
  }
  else
  {
    if (qword_267D462C8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_21E8A47A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_267D47610);
    id v9 = v0;
    id v10 = sub_21E8A4790();
    os_log_type_t v11 = sub_21E8A4A20();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      id v13 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v12 = 138412290;
      id v14 = v9;
      sub_21E8A4AF0();
      *id v13 = v9;

      _os_log_impl(&dword_21E88B000, v10, v11, "No container app bundle id found for plugin proxy %@. Hidden app check is not applicable.", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D463C0);
      swift_arrayDestroy();
      MEMORY[0x223C33F60](v13, -1, -1);
      MEMORY[0x223C33F60](v12, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v7;
}

id sub_21E89FC08()
{
  id v1 = objc_msgSend(v0, sel_containingBundle);
  id v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_bundleIdentifier);

    if (v3)
    {
      sub_21E8A48D0();

      id v4 = self;
      uint64_t v5 = (void *)sub_21E8A48C0();
      swift_bridgeObjectRelease();
      id v2 = objc_msgSend(v4, sel__siriAuthorizationStatusForAppID_, v5);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_21E89FCDC()
{
  id v1 = objc_msgSend(*v0, sel_pluginIdentifier);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_21E8A48D0();

  return v3;
}

uint64_t sub_21E89FD44(uint64_t a1, uint64_t a2)
{
  return sub_21E89FD6C(a1, a2, (SEL *)&selRef_containingBundle, (SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_21E89FD58(uint64_t a1, uint64_t a2)
{
  return sub_21E89FD6C(a1, a2, (SEL *)&selRef_extensionPoint, (SEL *)&selRef_identifier);
}

uint64_t sub_21E89FD6C(uint64_t a1, uint64_t a2, SEL *a3, SEL *a4)
{
  id v6 = [*v4 *a3];
  id v7 = v6;
  if (!v6) {
    return 0;
  }
  id v8 = [v6 *a4];

  if (!v8) {
    return 0;
  }
  uint64_t v9 = sub_21E8A48D0();

  return v9;
}

id sub_21E89FE00()
{
  return sub_21E89FC08();
}

unint64_t sub_21E89FE28()
{
  return (unint64_t)sub_21E89F9A8() & 1;
}

uint64_t sub_21E89FE50(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  os_log_type_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *os_log_type_t v11 = v3;
  v11[1] = sub_21E8A2798;
  return sub_21E89C9D8(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t method lookup function for AppSupportService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppSupportService);
}

uint64_t dispatch thunk of AppSupportService.findApps(matching:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 96) + **(int **)(*(void *)v1 + 96));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_21E8A0044;
  return v6(a1);
}

uint64_t sub_21E8A0044(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t destroy for AppSupportQuery()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppSupportQuery(void *a1, void *a2)
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
  return a1;
}

void *assignWithCopy for AppSupportQuery(void *a1, void *a2)
{
  *a1 = *a2;
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

uint64_t assignWithTake for AppSupportQuery(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportQuery(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSupportQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AppSupportQuery()
{
  return &type metadata for AppSupportQuery;
}

void *initializeBufferWithCopyOfBuffer for AppSupportQuery.AllowedSiriAuthorizationStatuses(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppSupportQuery.AllowedSiriAuthorizationStatuses()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppSupportQuery.AllowedSiriAuthorizationStatuses(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AppSupportQuery.AllowedSiriAuthorizationStatuses(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21E8A03F4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_21E8A040C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  void *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AppSupportQuery.AllowedSiriAuthorizationStatuses()
{
  return &type metadata for AppSupportQuery.AllowedSiriAuthorizationStatuses;
}

uint64_t _s17SiriAppResolution15AppSupportQueryV32AllowedSiriAuthorizationStatusesOwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t _s17SiriAppResolution15AppSupportQueryV32AllowedSiriAuthorizationStatusesOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSupportQuery.AllowedExtensionPointIdentifiers()
{
  return &type metadata for AppSupportQuery.AllowedExtensionPointIdentifiers;
}

uint64_t destroy for AppSupportService.DataSource()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AppSupportService.DataSource(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AppSupportService.DataSource(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for AppSupportService.DataSource(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportService.DataSource(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSupportService.DataSource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSupportService.DataSource()
{
  return &type metadata for AppSupportService.DataSource;
}

uint64_t sub_21E8A06BC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_21E8A2798;
  return sub_21E89D014(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_21E8A07F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_21E891128;
  return sub_21E89D440(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21E8A08D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
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
    uint64_t v8 = sub_21E8A4B50();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for App();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v24;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_21E8A4B40();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v10 = sub_21E8A0BA8(v7, result + 1);
    uint64_t v25 = v10;
    if (*(void *)(v10 + 24) <= *(void *)(v10 + 16))
    {
      swift_retain();
      sub_21E8A0DE8();
      uint64_t v11 = v25;
    }
    else
    {
      uint64_t v11 = v10;
      swift_retain();
    }
    sub_21E8A1110(a2, v11);
    *uint64_t v3 = v11;
  }
  else
  {
    sub_21E8A4D70();
    if (*(void *)(a2 + 24))
    {
      sub_21E8A4D90();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21E8A48F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21E8A4D90();
      swift_bridgeObjectRetain();
    }
    uint64_t v12 = sub_21E8A4DA0();
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      uint64_t v15 = ~v13;
      uint64_t v16 = *(void *)(v6 + 48);
      uint64_t v17 = *(void *)(a2 + 16);
      uint64_t v18 = *(void *)(a2 + 24);
      do
      {
        uint64_t v19 = *(void *)(v16 + 8 * v14);
        uint64_t v20 = *(void *)(v19 + 24);
        if (v20)
        {
          if (v18)
          {
            BOOL v21 = *(void *)(v19 + 16) == v17 && v20 == v18;
            if (v21 || (sub_21E8A4CF0() & 1) != 0)
            {
LABEL_24:
              swift_release();
              swift_bridgeObjectRelease();
              *a1 = *(void *)(*(void *)(*v3 + 48) + 8 * v14);
              swift_retain();
              return 0;
            }
          }
        }
        else if (!v18)
        {
          goto LABEL_24;
        }
        unint64_t v14 = (v14 + 1) & v15;
      }
      while (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    uint64_t v23 = swift_retain();
    sub_21E8A11F8(v23, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v26;
  }
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

uint64_t sub_21E8A0BA8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D46658);
    uint64_t v2 = sub_21E8A4BA0();
    uint64_t v14 = v2;
    sub_21E8A4B30();
    if (sub_21E8A4B60())
    {
      type metadata accessor for App();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_21E8A0DE8();
          uint64_t v2 = v14;
        }
        sub_21E8A4D70();
        if (*(void *)(v13 + 24))
        {
          sub_21E8A4D90();
          swift_bridgeObjectRetain();
          sub_21E8A48F0();
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_21E8A4D90();
        }
        uint64_t result = sub_21E8A4DA0();
        uint64_t v5 = v2 + 56;
        uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v7 = result & ~v6;
        unint64_t v8 = v7 >> 6;
        if (((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
        {
          unint64_t v3 = __clz(__rbit64((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v6) >> 6;
          do
          {
            if (++v8 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v8 == v10;
            if (v8 == v10) {
              unint64_t v8 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v5 + 8 * v8);
          }
          while (v12 == -1);
          unint64_t v3 = __clz(__rbit64(~v12)) + (v8 << 6);
        }
        *(void *)(v5 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v3;
        *(void *)(*(void *)(v2 + 48) + 8 * v3) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_21E8A4B60());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_21E8A0DE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46658);
  uint64_t v3 = sub_21E8A4B90();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    os_log_type_t v27 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v26 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v14 >= v26) {
          goto LABEL_36;
        }
        unint64_t v15 = v27[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v26) {
            goto LABEL_36;
          }
          unint64_t v15 = v27[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v26) {
              goto LABEL_36;
            }
            unint64_t v15 = v27[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v26)
              {
LABEL_36:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v25 = 1 << *(unsigned char *)(v2 + 32);
                if (v25 > 63) {
                  bzero(v27, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v27 = -1 << v25;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v27[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_42;
                  }
                  if (v10 >= v26) {
                    goto LABEL_36;
                  }
                  unint64_t v15 = v27[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_21E8A4D70();
      if (*(void *)(v17 + 24))
      {
        sub_21E8A4D90();
        swift_bridgeObjectRetain();
        sub_21E8A48F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_21E8A4D90();
      }
      uint64_t result = sub_21E8A4DA0();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v21 = 0;
        unint64_t v22 = (unint64_t)(63 - v18) >> 6;
        do
        {
          if (++v20 == v22 && (v21 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v23 = v20 == v22;
          if (v20 == v22) {
            unint64_t v20 = 0;
          }
          v21 |= v23;
          uint64_t v24 = *(void *)(v8 + 8 * v20);
        }
        while (v24 == -1);
        unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_21E8A1110(uint64_t a1, uint64_t a2)
{
  sub_21E8A4D70();
  if (*(void *)(a1 + 24))
  {
    sub_21E8A4D90();
    swift_bridgeObjectRetain();
    sub_21E8A48F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21E8A4D90();
  }
  sub_21E8A4DA0();
  unint64_t result = sub_21E8A4B20();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_21E8A11F8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_23;
  }
  if (a3)
  {
    sub_21E8A0DE8();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_21E8A13C4();
      goto LABEL_23;
    }
    sub_21E8A1570();
  }
  uint64_t v8 = *v3;
  sub_21E8A4D70();
  if (*(void *)(v5 + 24))
  {
    sub_21E8A4D90();
    swift_bridgeObjectRetain();
    sub_21E8A48F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21E8A4D90();
  }
  unint64_t result = sub_21E8A4DA0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  uint64_t v10 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v9;
    unint64_t result = type metadata accessor for App();
    uint64_t v12 = *(void *)(v8 + 48);
    uint64_t v13 = *(void *)(v5 + 16);
    uint64_t v14 = *(void *)(v5 + 24);
    do
    {
      uint64_t v15 = *(void *)(v12 + 8 * a2);
      uint64_t v16 = *(void *)(v15 + 24);
      if (v16)
      {
        if (v14)
        {
          BOOL v17 = *(void *)(v15 + 16) == v13 && v16 == v14;
          if (v17 || (unint64_t result = sub_21E8A4CF0(), (result & 1) != 0))
          {
LABEL_22:
            unint64_t result = sub_21E8A4D00();
            __break(1u);
            break;
          }
        }
      }
      else if (!v14)
      {
        goto LABEL_22;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v10 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_23:
  uint64_t v18 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v18 + 48) + 8 * a2) = v5;
  uint64_t v19 = *(void *)(v18 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20) {
    __break(1u);
  }
  else {
    *(void *)(v18 + 16) = v21;
  }
  return result;
}

void *sub_21E8A13C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E8A4B80();
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
    unint64_t result = (void *)swift_retain();
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

uint64_t sub_21E8A1570()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D46658);
  uint64_t v3 = sub_21E8A4B90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v25 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v26 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v14 >= v26) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v26) {
        goto LABEL_36;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v26) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
    sub_21E8A4D70();
    if (*(void *)(v17 + 24))
    {
      sub_21E8A4D90();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_21E8A48F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21E8A4D90();
      swift_retain();
    }
    uint64_t result = sub_21E8A4DA0();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_38;
  }
  unint64_t v15 = *(void *)(v25 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v26) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_21E8A1870()
{
  unint64_t result = qword_267D46380;
  if (!qword_267D46380)
  {
    type metadata accessor for App();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D46380);
  }
  return result;
}

uint64_t sub_21E8A18C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E8A18E8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_21E8A18E8(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D466B0);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D46678);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21E8A4CD0();
  __break(1u);
  return result;
}

void sub_21E8A1A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = self;
  swift_bridgeObjectRetain();
  id v5 = objc_msgSend(v4, sel_enumeratorWithOptions_, 0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v32 = sub_21E8A2794;
  uint64_t v33 = v6;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v30 = sub_21E89EB78;
  uint64_t v31 = &block_descriptor_36;
  int64_t v7 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_setFilter_, v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_nextObject);
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = sub_21E894988(0, &qword_267D466C8);
    uint64_t v12 = 0;
    uint64_t v13 = (uint64_t)(v9 + 4);
    while (1)
    {
      uint64_t v27 = v11;
      uint64_t v28 = &off_26CFDC810;
      *(void *)&long long v26 = v10;
      sub_21E8970E4(&v26, (uint64_t)&aBlock);
      if (!v12)
      {
        unint64_t v14 = v9[3];
        if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
        if (v15 <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v15;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D466D0);
        uint64_t v17 = (void *)swift_allocObject();
        uint64_t v18 = (uint64_t)(_swift_stdlib_malloc_size(v17) - 32) / 40;
        long long v17[2] = v16;
        v17[3] = 2 * v18;
        unint64_t v19 = (unint64_t)(v17 + 4);
        uint64_t v20 = v9[3] >> 1;
        if (v9[2])
        {
          if (v17 != v9 || v19 >= (unint64_t)&v9[5 * v20 + 4]) {
            memmove(v17 + 4, v9 + 4, 40 * v20);
          }
          v9[2] = 0;
        }
        uint64_t v13 = v19 + 40 * v20;
        uint64_t v12 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
        swift_release();
        uint64_t v9 = v17;
      }
      BOOL v22 = __OFSUB__(v12--, 1);
      if (v22) {
        break;
      }
      sub_21E8970E4(&aBlock, v13);
      v13 += 40;
      id v10 = objc_msgSend(v5, sel_nextObject);
      if (!v10) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v12 = 0;
LABEL_21:

  unint64_t v23 = v9[3];
  if (v23 >= 2)
  {
    unint64_t v24 = v23 >> 1;
    BOOL v22 = __OFSUB__(v24, v12);
    uint64_t v25 = v24 - v12;
    if (v22)
    {
LABEL_27:
      __break(1u);
      return;
    }
    v9[2] = v25;
  }
}

uint64_t sub_21E8A1D58(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  id v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_21E8A1E38;
  return v5(v2 + 16);
}

uint64_t sub_21E8A1E38()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_21E8A1F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E8A1FD0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8A2008(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_21E891128;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267D46660 + dword_267D46660);
  return v6(a1, v4);
}

uint64_t sub_21E8A20C0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E8A5590;
  *(void *)(inited + 32) = sub_21E8A48D0();
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  aBlock[19] = sub_21E8985CC(inited);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  if (qword_267D462C8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21E8A47A0();
  __swift_project_value_buffer(v7, (uint64_t)qword_267D47610);
  uint64_t v8 = sub_21E8A4790();
  os_log_type_t v9 = sub_21E8A4A20();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)id v10 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_21E8A48B0();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    void aBlock[6] = sub_21E88FA24(v12, v14, aBlock);
    sub_21E8A4AF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E88B000, v8, v9, "Enumerating plugins matching query: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C33F60](v11, -1, -1);
    MEMORY[0x223C33F60](v10, -1, -1);
  }

  id v15 = objc_msgSend(self, sel_defaultWorkspace);
  if (v15)
  {
    uint64_t v16 = v15;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v17 = (void *)sub_21E8A4890();
    swift_bridgeObjectRelease();
    aBlock[4] = (uint64_t)sub_21E8A24F4;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21E89F2D4;
    uint64_t aBlock[3] = (uint64_t)&block_descriptor_1;
    uint64_t v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_enumeratePluginsMatchingQuery_withBlock_, v17, v18);
    _Block_release(v18);
  }
  swift_beginAccess();
  unint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v20 = sub_21E89F360(v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_21E8A2478(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21E8A24BC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21E8A24F4(void *a1, void *a2)
{
  return sub_21E89EFC8(a1, a2, v2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21E8A2514()
{
  unint64_t result = qword_267D466B8;
  if (!qword_267D466B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D466B8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AppSupportService.SystemAppRecordData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppSupportService.SystemAppRecordData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

void *assignWithTake for AppSupportService.SystemAppRecordData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportService.SystemAppRecordData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSupportService.SystemAppRecordData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppSupportService.SystemAppRecordData()
{
  return &type metadata for AppSupportService.SystemAppRecordData;
}

unint64_t sub_21E8A26B4()
{
  unint64_t result = qword_267D466C0;
  if (!qword_267D466C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D466C0);
  }
  return result;
}

uint64_t sub_21E8A2708()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8A2740(void *a1)
{
  return sub_21E89EB00(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

ValueMetadata *type metadata accessor for AppSupportService.SystemAppRecordData.Iterator()
{
  return &type metadata for AppSupportService.SystemAppRecordData.Iterator;
}

unint64_t sub_21E8A27A0(unint64_t result)
{
  unint64_t v1 = result;
  if (!(result >> 62))
  {
    uint64_t v2 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v2) {
      return v2;
    }
    if (v2 == 1) {
      goto LABEL_4;
    }
LABEL_10:
    swift_bridgeObjectRetain();
    return v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_21E8A4C90();
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_21E8A4C90();
  unint64_t result = swift_bridgeObjectRelease();
  if (v4 != 1) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = MEMORY[0x223C33960](0, v1);
    swift_bridgeObjectRelease();
    return v2;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v2 = *(void *)(v1 + 32);
    swift_retain();
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t DefaultAppSelector.__allocating_init(defaultAppBundles:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DefaultAppSelector.init(defaultAppBundles:)(a1);
  return v2;
}

uint64_t DefaultAppSelector.init(defaultAppBundles:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    unint64_t v12 = MEMORY[0x263F8EE78];
    sub_21E8A4C30();
    type metadata accessor for App();
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v7;
      *(void *)(v8 + 24) = v6;
      *(_OWORD *)(v8 + 32) = 0u;
      *(_OWORD *)(v8 + 48) = 0u;
      *(_OWORD *)(v8 + 64) = 0u;
      swift_bridgeObjectRetain();
      sub_21E8A4C10();
      sub_21E8A4C40();
      sub_21E8A4C50();
      sub_21E8A4C20();
      v5 += 2;
      --v4;
    }
    while (v4);
    unint64_t v9 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v9 = MEMORY[0x263F8EE78];
  }
  *(void *)(v2 + 16) = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_21E8A4C90();
    swift_bridgeObjectRelease();
    if (v11) {
      return v2;
    }
  }
  else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v2;
  }
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  sub_21E8A4A40();
  sub_21E8A4750();
  return v2;
}

uint64_t DefaultAppSelector.__allocating_init(defaultApps:)(unint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E8A4C90();
    swift_bridgeObjectRelease();
    if (v4) {
      return v2;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v2;
  }
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  sub_21E8A4A40();
  sub_21E8A4750();
  return v2;
}

uint64_t DefaultAppSelector.init(defaultApps:)(unint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8A4C90();
    swift_bridgeObjectRelease();
    if (v3) {
      return v1;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return v1;
  }
  if (qword_267D462D0 != -1) {
    swift_once();
  }
  sub_21E8A4A40();
  sub_21E8A4750();
  return v1;
}

uint64_t sub_21E8A2C78(uint64_t a1, unint64_t a2, void (*a3)(void **))
{
  return sub_21E8A3394(a2, a3);
}

uint64_t DefaultAppSelector.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DefaultAppSelector.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21E8A2CE0(uint64_t a1, unint64_t a2, void (*a3)(void **))
{
  return sub_21E8A3394(a2, a3);
}

uint64_t sub_21E8A2D10(unint64_t a1, uint64_t a2)
{
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E8A4C90();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v6 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = (void *)MEMORY[0x223C33960](i - 4, a1);
          uint64_t v8 = i - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v7 = *(void **)(a1 + 8 * i);
          swift_retain();
          uint64_t v8 = i - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        if (v7[7]) {
          goto LABEL_12;
        }
        uint64_t v9 = v7[3];
        if (v9 && *(void *)(a2 + 16))
        {
          uint64_t v10 = v7[2];
          swift_bridgeObjectRetain();
          sub_21E89A1D0(v10, v9);
          if (v11)
          {
            swift_retain();
            swift_release();
            swift_bridgeObjectRelease();
LABEL_12:
            MEMORY[0x223C336C0]();
            if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_21E8A4990();
            }
            sub_21E8A49A0();
            sub_21E8A4980();
            goto LABEL_5;
          }
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
        }
LABEL_5:
        if (v8 == v4)
        {
          swift_bridgeObjectRelease();
          return v13;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_21E8A2EFC(unint64_t a1, uint64_t a2, void (*a3)(unint64_t *, unint64_t))
{
  uint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21E8A4C90();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      unint64_t v40 = v3 & 0xC000000000000001;
      uint64_t v5 = (void *)MEMORY[0x263F8EE80];
      uint64_t v6 = 4;
      uint64_t v39 = v3;
      while (1)
      {
        uint64_t v7 = v6 - 4;
        if (v40)
        {
          uint64_t v8 = MEMORY[0x223C33960](v6 - 4, v3);
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v8 = *(void *)(v3 + 8 * v6);
          swift_retain();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        uint64_t v10 = *(void *)(v8 + 24);
        if (v10) {
          break;
        }
        swift_release();
LABEL_5:
        ++v6;
        if (v9 == v4) {
          goto LABEL_29;
        }
      }
      uint64_t v3 = v4;
      uint64_t v11 = *(void *)(v8 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v41 = v5;
      unint64_t v14 = sub_21E89A1D0(v11, v10);
      uint64_t v15 = v5[2];
      BOOL v16 = (v13 & 1) == 0;
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16)) {
        goto LABEL_25;
      }
      char v18 = v13;
      if (v5[3] < v17)
      {
        sub_21E89A554(v17, isUniquelyReferenced_nonNull_native);
        unint64_t v19 = sub_21E89A1D0(v11, v10);
        if ((v18 & 1) != (v20 & 1))
        {
          swift_release();
          uint64_t result = sub_21E8A4D10();
          __break(1u);
          return result;
        }
        unint64_t v14 = v19;
        uint64_t v5 = v41;
        if ((v18 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_19:
        uint64_t v21 = v5[7];
        swift_release();
        *(void *)(v21 + 8 * v14) = v8;
LABEL_23:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v4 = v3;
        uint64_t v3 = v39;
        goto LABEL_5;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v5 = v41;
        if (v13) {
          goto LABEL_19;
        }
      }
      else
      {
        sub_21E89AE00();
        uint64_t v5 = v41;
        if (v18) {
          goto LABEL_19;
        }
      }
LABEL_21:
      v5[(v14 >> 6) + 8] |= 1 << v14;
      BOOL v22 = (uint64_t *)(v5[6] + 16 * v14);
      *BOOL v22 = v11;
      v22[1] = v10;
      *(void *)(v5[7] + 8 * v14) = v8;
      uint64_t v23 = v5[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_26;
      }
      void v5[2] = v25;
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
  }
  uint64_t v5 = (void *)MEMORY[0x263F8EE80];
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  unint64_t v27 = swift_bridgeObjectRetain();
  unint64_t v28 = sub_21E8A2D10(v27, (uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  unint64_t v29 = sub_21E8A27A0(v28);
  char v31 = v30;
  swift_bridgeObjectRelease();
  if (v31)
  {
    if (v31 == 1)
    {
      uint64_t v44 = 0;
      unint64_t v45 = v29;
      __int16 v46 = 1;
      uint64_t v41 = (void *)v29;
      uint64_t v42 = 0x2000000000000001;
      uint64_t v43 = 0;
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_21E8A3D50();
      a3(&v45, v32);
      sub_21E89BEA8(v29, 1);
      swift_bridgeObjectRelease();
      return sub_21E89BEA8(v29, 1);
    }
    else
    {
      if (qword_267D462D0 != -1) {
        swift_once();
      }
      sub_21E8A4A40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D46450);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_21E8A5590;
      *(void *)(v35 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46618);
      *(void *)(v35 + 64) = sub_21E8A3828();
      *(void *)(v35 + 32) = v26;
      swift_bridgeObjectRetain();
      sub_21E8A4750();
      swift_bridgeObjectRelease();
      uint64_t v41 = 0;
      LOWORD(v42) = 256;
      unint64_t v36 = sub_21E8985CC(MEMORY[0x263F8EE78]);
      a3((unint64_t *)&v41, v36);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v44 = 0;
    unint64_t v45 = v29;
    __int16 v46 = 2;
    uint64_t v41 = (void *)v29;
    uint64_t v42 = 0x2000000000000002;
    uint64_t v43 = 0;
    swift_retain();
    unint64_t v34 = sub_21E8A3D50();
    a3(&v45, v34);
    swift_bridgeObjectRelease();
    sub_21E89BEA8(v29, 0);
    return sub_21E89BEA8(v29, 0);
  }
}

uint64_t sub_21E8A3394(unint64_t a1, void (*a2)(void **))
{
  uint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21E8A4C90();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v36 = v2 & 0xC000000000000001;
      uint64_t v4 = (void *)MEMORY[0x263F8EE80];
      uint64_t v5 = 4;
      uint64_t v35 = v2;
      while (1)
      {
        uint64_t v6 = v5 - 4;
        if (v36)
        {
          uint64_t v7 = MEMORY[0x223C33960](v5 - 4, v2);
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v7 = *(void *)(v2 + 8 * v5);
          swift_retain();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        uint64_t v9 = *(void *)(v7 + 24);
        if (v9) {
          break;
        }
        swift_release();
LABEL_5:
        ++v5;
        if (v8 == v3) {
          goto LABEL_29;
        }
      }
      uint64_t v2 = v3;
      uint64_t v10 = *(void *)(v7 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v37 = v4;
      unint64_t v13 = sub_21E89A1D0(v10, v9);
      uint64_t v14 = v4[2];
      BOOL v15 = (v12 & 1) == 0;
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_25;
      }
      char v17 = v12;
      if (v4[3] < v16)
      {
        sub_21E89A554(v16, isUniquelyReferenced_nonNull_native);
        unint64_t v18 = sub_21E89A1D0(v10, v9);
        if ((v17 & 1) != (v19 & 1))
        {
          uint64_t result = sub_21E8A4D10();
          __break(1u);
          return result;
        }
        unint64_t v13 = v18;
        uint64_t v4 = v37;
        if ((v17 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_19:
        uint64_t v20 = v4[7];
        swift_release();
        *(void *)(v20 + 8 * v13) = v7;
LABEL_23:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v3 = v2;
        uint64_t v2 = v35;
        goto LABEL_5;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v4 = v37;
        if (v12) {
          goto LABEL_19;
        }
      }
      else
      {
        sub_21E89AE00();
        uint64_t v4 = v37;
        if (v17) {
          goto LABEL_19;
        }
      }
LABEL_21:
      v4[(v13 >> 6) + 8] |= 1 << v13;
      uint64_t v21 = (uint64_t *)(v4[6] + 16 * v13);
      *uint64_t v21 = v10;
      v21[1] = v9;
      *(void *)(v4[7] + 8 * v13) = v7;
      uint64_t v22 = v4[2];
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_26;
      }
      v4[2] = v24;
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
  }
  uint64_t v4 = (void *)MEMORY[0x263F8EE80];
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(v33 + 16);
  swift_bridgeObjectRetain();
  unint64_t v26 = swift_bridgeObjectRetain();
  unint64_t v27 = sub_21E8A2D10(v26, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  unint64_t v28 = sub_21E8A27A0(v27);
  char v30 = v29;
  swift_bridgeObjectRelease();
  if (v30)
  {
    if (v30 == 1)
    {
      uint64_t v37 = (void *)v28;
      __int16 v38 = 1;
      a2(&v37);
      return sub_21E89BEA8(v28, 1);
    }
    else
    {
      if (qword_267D462D0 != -1) {
        swift_once();
      }
      sub_21E8A4A40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D46450);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_21E8A5590;
      *(void *)(v32 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_267D46618);
      *(void *)(v32 + 64) = sub_21E8A3828();
      *(void *)(v32 + 32) = v25;
      swift_bridgeObjectRetain();
      sub_21E8A4750();
      swift_bridgeObjectRelease();
      uint64_t v37 = 0;
      __int16 v38 = 256;
      return ((uint64_t (*)(void **))a2)(&v37);
    }
  }
  else
  {
    uint64_t v37 = (void *)v28;
    __int16 v38 = 2;
    swift_retain();
    a2(&v37);
    sub_21E89BEA8(v28, 0);
    return sub_21E89BEA8(v28, 0);
  }
}

uint64_t type metadata accessor for DefaultAppSelector()
{
  return self;
}

uint64_t method lookup function for DefaultAppSelector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultAppSelector);
}

uint64_t dispatch thunk of DefaultAppSelector.__allocating_init(defaultAppBundles:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DefaultAppSelector.__allocating_init(defaultApps:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DefaultAppSelector.selectAppFor(intent:fromEligibleApps:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

unint64_t sub_21E8A3828()
{
  unint64_t result = qword_267D466D8[0];
  if (!qword_267D466D8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267D46618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267D466D8);
  }
  return result;
}

void *InstrumentedAppResolutionService.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 56) = sub_21E8988EC;
  *(void *)(v0 + 64) = 0;
  return AppResolutionService.init()();
}

void *InstrumentedAppResolutionService.init()()
{
  *(void *)(v0 + 56) = sub_21E8988EC;
  *(void *)(v0 + 64) = 0;
  return AppResolutionService.init()();
}

uint64_t InstrumentedAppResolutionService.resolveApp(intent:appResolutionState:_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a3;
  v9[5] = a4;
  uint64_t v10 = *(void (**)(id, uint64_t, uint64_t (*)(uint64_t *, uint64_t), void *))(*(void *)v4 + 152);
  swift_retain();
  id v11 = a1;
  swift_retain();
  v10(v11, a2, sub_21E8A3AD8, v9);
  return swift_release();
}

uint64_t sub_21E8A39B8(uint64_t *a1, uint64_t a2, uint64_t a3, id a4, uint64_t (*a5)(uint64_t *))
{
  uint64_t v6 = *a1;
  char v7 = *((unsigned char *)a1 + 8);
  char v8 = *((unsigned char *)a1 + 9);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t))(a3 + 56);
  id v10 = objc_msgSend(a4, sel_typeName);
  uint64_t v11 = sub_21E8A48D0();
  uint64_t v13 = v12;

  uint64_t v16 = v6;
  char v17 = v7;
  char v18 = v8;
  v9(v11, v13, &v16, a2);
  swift_bridgeObjectRelease();
  uint64_t v16 = v6;
  char v17 = v7;
  char v18 = v8;
  return a5(&v16);
}

uint64_t sub_21E8A3A90()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E8A3AD8(uint64_t *a1, uint64_t a2)
{
  return sub_21E8A39B8(a1, a2, *(void *)(v2 + 16), *(id *)(v2 + 24), *(uint64_t (**)(uint64_t *))(v2 + 32));
}

uint64_t sub_21E8A3AE4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  swift_retain();
  sub_21E8952BC(a2, (void (*)(uint64_t *))sub_21E8A3C2C);
  return swift_release();
}

uint64_t sub_21E8A3B74(uint64_t *a1, void (*a2)(uint64_t *, unint64_t))
{
  char v3 = *((unsigned char *)a1 + 8);
  char v4 = *((unsigned char *)a1 + 9);
  uint64_t v7 = *a1;
  char v8 = v3;
  char v9 = v4;
  unint64_t v5 = sub_21E8985CC(MEMORY[0x263F8EE78]);
  a2(&v7, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E8A3BF4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21E8A3C2C(uint64_t *a1)
{
  return sub_21E8A3B74(a1, *(void (**)(uint64_t *, unint64_t))(v1 + 16));
}

uint64_t sub_21E8A3C34()
{
  return swift_release();
}

uint64_t InstrumentedAppResolutionService.deinit()
{
  uint64_t v0 = AppResolutionService.deinit();
  swift_release();
  return v0;
}

uint64_t InstrumentedAppResolutionService.__deallocating_deinit()
{
  uint64_t v0 = AppResolutionService.deinit();
  swift_release();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t sub_21E8A3CB4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InstrumentedAppResolutionService()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for InstrumentedAppResolutionService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InstrumentedAppResolutionService);
}

uint64_t dispatch thunk of InstrumentedAppResolutionService.resolveApp(forIntent:withConversionState:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

unint64_t sub_21E8A3D50()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  switch(v1 >> 61)
  {
    case 1uLL:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21E8A6020;
      sub_21E895008(v2, v1);
      if (qword_267D462E0 != -1) {
        swift_once();
      }
      uint64_t v15 = *(void *)algn_267D46768;
      *(void *)(inited + 32) = qword_267D46760;
      *(void *)(inited + 40) = v15;
      unint64_t v16 = sub_21E8A4428();
      uint64_t v17 = MEMORY[0x263F8D310];
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v16;
      *(void *)(inited + 56) = v18;
      uint64_t v19 = qword_267D462E8;
      swift_bridgeObjectRetain();
      if (v19 != -1) {
        swift_once();
      }
      uint64_t v20 = *(void *)algn_267D46778;
      *(void *)(inited + 80) = qword_267D46770;
      *(void *)(inited + 88) = v20;
      *(void *)(inited + 96) = 0x6465727265666E49;
      *(void *)(inited + 104) = 0xE800000000000000;
      *(void *)(inited + 120) = v17;
      *(void *)(inited + 128) = 0xD000000000000011;
      *(void *)(inited + 168) = v17;
      *(void *)(inited + 136) = 0x800000021E8A6B90;
      *(void *)(inited + 144) = 0xD000000000000012;
      uint64_t v21 = "DefaultAppSelector";
      goto LABEL_23;
    case 2uLL:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21E8A6020;
      sub_21E895008(v2, v1);
      if (qword_267D462E0 != -1) {
        swift_once();
      }
      uint64_t v22 = *(void *)algn_267D46768;
      *(void *)(inited + 32) = qword_267D46760;
      *(void *)(inited + 40) = v22;
      unint64_t v23 = sub_21E8A4428();
      uint64_t v24 = MEMORY[0x263F8D310];
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v23;
      *(void *)(inited + 56) = v25;
      uint64_t v26 = qword_267D462E8;
      swift_bridgeObjectRetain();
      if (v26 != -1) {
        swift_once();
      }
      uint64_t v27 = *(void *)algn_267D46778;
      *(void *)(inited + 80) = qword_267D46770;
      *(void *)(inited + 88) = v27;
      uint64_t v28 = 0x7571655272657355;
      unint64_t v29 = 0xED00006465747365;
      goto LABEL_22;
    case 3uLL:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21E8A6020;
      sub_21E895008(v2, v1);
      if (qword_267D462E0 != -1) {
        swift_once();
      }
      uint64_t v30 = *(void *)algn_267D46768;
      *(void *)(inited + 32) = qword_267D46760;
      *(void *)(inited + 40) = v30;
      unint64_t v31 = sub_21E8A4428();
      uint64_t v24 = MEMORY[0x263F8D310];
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v31;
      *(void *)(inited + 56) = v32;
      uint64_t v33 = qword_267D462E8;
      swift_bridgeObjectRetain();
      if (v33 != -1) {
        swift_once();
      }
      uint64_t v34 = *(void *)algn_267D46778;
      *(void *)(inited + 80) = qword_267D46770;
      *(void *)(inited + 88) = v34;
      uint64_t v28 = 0x6E61684372657355;
      unint64_t v29 = 0xEB00000000646567;
LABEL_22:
      *(void *)(inited + 96) = v28;
      *(void *)(inited + 104) = v29;
      *(void *)(inited + 120) = v24;
      *(void *)(inited + 128) = 0xD000000000000011;
      *(void *)(inited + 168) = v24;
      *(void *)(inited + 136) = 0x800000021E8A6B90;
      *(void *)(inited + 144) = 0xD000000000000014;
      uint64_t v21 = "RequestedAppResolver";
LABEL_23:
      *(void *)(inited + 152) = (unint64_t)(v21 - 32) | 0x8000000000000000;
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_21E8985CC(inited);
      sub_21E89BD98(v2, v1);
      break;
    case 4uLL:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
      uint64_t v35 = swift_initStackObject();
      *(_OWORD *)(v35 + 16) = xmmword_21E8A6020;
      if (qword_267D462E0 != -1) {
        swift_once();
      }
      uint64_t v36 = *(void *)algn_267D46768;
      *(void *)(v35 + 32) = qword_267D46760;
      *(void *)(v35 + 40) = v36;
      uint64_t v37 = MEMORY[0x263F8D310];
      *(void *)(v35 + 72) = MEMORY[0x263F8D310];
      *(void *)(v35 + 48) = 0xD000000000000015;
      *(void *)(v35 + 56) = 0x800000021E8A6B70;
      uint64_t v38 = qword_267D462E8;
      swift_bridgeObjectRetain();
      if (v38 != -1) {
        swift_once();
      }
      uint64_t v39 = *(void *)algn_267D46778;
      *(void *)(v35 + 80) = qword_267D46770;
      *(void *)(v35 + 88) = v39;
      *(void *)(v35 + 96) = 0x64656C696146;
      *(void *)(v35 + 104) = 0xE600000000000000;
      *(void *)(v35 + 120) = v37;
      *(void *)(v35 + 128) = 0xD000000000000011;
      *(void *)(v35 + 168) = v37;
      *(void *)(v35 + 136) = 0x800000021E8A6B90;
      strcpy((char *)(v35 + 144), "NotApplicable");
      *(_WORD *)(v35 + 158) = -4864;
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_21E8985CC(v35);
      break;
    default:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D466A0);
      uint64_t v5 = swift_initStackObject();
      *(_OWORD *)(v5 + 16) = xmmword_21E8A6020;
      sub_21E895008(v2, v1);
      uint64_t v6 = qword_267D462E0;
      swift_bridgeObjectRetain();
      if (v6 != -1) {
        swift_once();
      }
      uint64_t v7 = *(void *)algn_267D46768;
      *(void *)(v5 + 32) = qword_267D46760;
      *(void *)(v5 + 40) = v7;
      unint64_t v8 = sub_21E8A4428();
      uint64_t v9 = MEMORY[0x263F8D310];
      *(void *)(v5 + 72) = MEMORY[0x263F8D310];
      *(void *)(v5 + 48) = v8;
      *(void *)(v5 + 56) = v10;
      uint64_t v11 = qword_267D462E8;
      swift_bridgeObjectRetain();
      if (v11 != -1) {
        swift_once();
      }
      uint64_t v12 = *(void *)algn_267D46778;
      *(void *)(v5 + 80) = qword_267D46770;
      *(void *)(v5 + 88) = v12;
      *(void *)(v5 + 96) = 0x6465727265666E49;
      *(void *)(v5 + 104) = 0xE800000000000000;
      *(void *)(v5 + 120) = v9;
      *(void *)(v5 + 128) = 0xD000000000000011;
      *(void *)(v5 + 168) = v9;
      *(void *)(v5 + 136) = 0x800000021E8A6B90;
      *(void *)(v5 + 144) = v4;
      *(void *)(v5 + 152) = v3;
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_21E8985CC(v5);
      sub_21E895068(v2, v1);
      break;
  }
  return v13;
}

void sub_21E8A43CC()
{
  qword_267D46760 = 0x6C646E7542707061;
  *(void *)algn_267D46768 = 0xEB00000000644965;
}

void sub_21E8A43F8()
{
  algn_267D46778[7] = -18;
}

unint64_t sub_21E8A4428()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *((unsigned __int8 *)v0 + 8);
  unint64_t v3 = 0xD000000000000015;
  switch(v2)
  {
    case 1:
      return v3;
    case 3:
      unint64_t v3 = 0xD000000000000015;
      break;
    default:
      if (*(void *)(v1 + 24))
      {
        unint64_t v3 = *(void *)(v1 + 16);
        swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v3 = 0xD000000000000012;
      }
      break;
  }
  return v3;
}

unint64_t AppResolutionResult.description.getter()
{
  uint64_t v1 = *(void *)v0;
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      sub_21E8A4BC0();
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD00000000000001CLL;
      uint64_t v4 = type metadata accessor for App();
      MEMORY[0x223C336F0](v1, v4);
      sub_21E8A4900();
      swift_bridgeObjectRelease();
      sub_21E8A4900();
      return v6;
    case 2:
      swift_retain();
      sub_21E8A4BC0();
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD000000000000010;
      sub_21E88CEC4();
      sub_21E8A4900();
      swift_bridgeObjectRelease();
      sub_21E8A4900();
      uint64_t v2 = v1;
      char v3 = 2;
      goto LABEL_5;
    case 3:
      unint64_t v6 = 0;
      swift_retain();
      sub_21E8A4BC0();
      sub_21E8A4900();
      sub_21E8A4C60();
      sub_21E8A4900();
      uint64_t v2 = v1;
      char v3 = 3;
      goto LABEL_5;
    default:
      swift_retain();
      sub_21E8A4BC0();
      swift_bridgeObjectRelease();
      unint64_t v6 = 0xD000000000000019;
      sub_21E88CEC4();
      sub_21E8A4900();
      swift_bridgeObjectRelease();
      sub_21E8A4900();
      uint64_t v2 = v1;
      char v3 = 0;
LABEL_5:
      sub_21E895068(v2, v3);
      return v6;
  }
}

uint64_t sub_21E8A4750()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_21E8A4760()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_21E8A4770()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_21E8A4780()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_21E8A4790()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E8A47A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E8A47B0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_21E8A47C0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21E8A47D0()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_21E8A47E0()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_21E8A47F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21E8A4800()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_21E8A4810()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_21E8A4820()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21E8A4830()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21E8A4840()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21E8A4850()
{
  return MEMORY[0x270FA0B48]();
}

uint64_t sub_21E8A4860()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_21E8A4870()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_21E8A4880()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21E8A4890()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E8A48A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21E8A48B0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_21E8A48C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E8A48D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E8A48E0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21E8A48F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E8A4900()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21E8A4910()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21E8A4920()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_21E8A4930()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_21E8A4940()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21E8A4950()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E8A4960()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E8A4970()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21E8A4980()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21E8A4990()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21E8A49A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21E8A49B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21E8A49C0()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_21E8A49E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21E8A49F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21E8A4A00()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21E8A4A10()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_21E8A4A20()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21E8A4A30()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21E8A4A40()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21E8A4A50()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21E8A4A60()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_21E8A4A70()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21E8A4A80()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21E8A4A90()
{
  return MEMORY[0x270FA0D78]();
}

uint64_t sub_21E8A4AA0()
{
  return MEMORY[0x270FA0DB0]();
}

uint64_t sub_21E8A4AB0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21E8A4AC0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_21E8A4AD0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_21E8A4AE0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_21E8A4AF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21E8A4B00()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21E8A4B10()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21E8A4B20()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_21E8A4B30()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_21E8A4B40()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_21E8A4B50()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_21E8A4B60()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_21E8A4B70()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_21E8A4B80()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21E8A4B90()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21E8A4BA0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_21E8A4BB0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21E8A4BC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21E8A4BD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21E8A4BE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E8A4BF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21E8A4C10()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21E8A4C20()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21E8A4C30()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21E8A4C40()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21E8A4C50()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21E8A4C60()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21E8A4C70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21E8A4C80()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21E8A4C90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E8A4CA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21E8A4CB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E8A4CC0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21E8A4CD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E8A4CE0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21E8A4CF0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E8A4D00()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21E8A4D10()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E8A4D20()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21E8A4D30()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21E8A4D40()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21E8A4D50()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21E8A4D60()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21E8A4D70()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E8A4D80()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E8A4D90()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_21E8A4DA0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}