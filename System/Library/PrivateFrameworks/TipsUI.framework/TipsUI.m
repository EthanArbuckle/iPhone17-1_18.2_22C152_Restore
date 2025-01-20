id static TPSUIAppController.shared.getter()
{
  void *v0;
  uint64_t vars8;

  if (qword_26ACF7068 != -1) {
    swift_once();
  }
  v0 = (void *)qword_26ACF7060;

  return v0;
}

uint64_t getEnumTagSinglePayload for VideoPlayerView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_217986828(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for RemoteImageView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ContentLoadState()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for RemoteVideoView()
{
  return &type metadata for RemoteVideoView;
}

uint64_t getEnumTagSinglePayload for RemoteVideoView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 113)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2179868C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21798F1C4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t type metadata accessor for TipsContentModel()
{
  uint64_t result = qword_26ACF6BF8;
  if (!qword_26ACF6BF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata accessor for TimeControlStatus(uint64_t a1)
{
}

void sub_217986930(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

ValueMetadata *type metadata accessor for VideoPlayerViewRepresentable()
{
  return &type metadata for VideoPlayerViewRepresentable;
}

uint64_t sub_217986988(uint64_t a1)
{
  return sub_21798CDFC(a1);
}

uint64_t type metadata accessor for RemoteImageLoader()
{
  uint64_t result = qword_26ACF6F00;
  if (!qword_26ACF6F00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for RemoteFileLoader()
{
  uint64_t result = qword_26ACF6DA0;
  if (!qword_26ACF6DA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for VideoPlayerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoPlayerView()
{
  return &type metadata for VideoPlayerView;
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t sub_217986ACC()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_26ACF7510);
}

uint64_t sub_217986AE0@<X0>(unsigned char *a1@<X8>)
{
  return sub_217989C34(a1);
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t sub_217986B20()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_26ACF7540);
}

uint64_t sub_217986B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_217986B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t storeEnumTagSinglePayload for RemoteVideoView(uint64_t result, int a2, int a3)
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
    *(unsigned char *)(result + 112) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 113) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 113) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_217986BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_217986C0C()
{
  if (!qword_26ACF6BD0)
  {
    sub_2179E1810();
    unint64_t v0 = sub_2179E2C00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACF6BD0);
    }
  }
}

id sub_217986C64()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSUIAppController()), sel_init);
  qword_26ACF7060 = (uint64_t)result;
  return result;
}

uint64_t sub_217986C94(uint64_t a1, unint64_t *a2)
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

void *sub_217986CD0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v5 = *v6;
  v5[1] = v6[1];
  v7 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_217986DA4@<X0>(unsigned char *a1@<X8>)
{
  sub_217986DF4();
  uint64_t result = sub_2179E1E20();
  *a1 = v3;
  return result;
}

unint64_t sub_217986DF4()
{
  unint64_t result = qword_26ACF7070;
  if (!qword_26ACF7070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7070);
  }
  return result;
}

unint64_t sub_217986E98()
{
  unint64_t result = qword_26ACF6B80;
  if (!qword_26ACF6B80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF6B80);
  }
  return result;
}

uint64_t sub_217986ED8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_217986F90(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2179E1E10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2179E2AC0();
  uint64_t v9 = sub_2179E2000();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_2179C5094(0x4D746E65746E6F43, 0xEB0000000065646FLL, &v13);
    _os_log_impl(&dword_217984000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4527D0](v11, -1, -1);
    MEMORY[0x21D4527D0](v10, -1, -1);
  }

  sub_2179E1E00();
  swift_getAtKeyPath();
  sub_217986828(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

unint64_t sub_217987178()
{
  unint64_t result = qword_26ACF75E0;
  if (!qword_26ACF75E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF75E0);
  }
  return result;
}

unint64_t sub_2179871B8()
{
  unint64_t result = qword_26ACF6B88;
  if (!qword_26ACF6B88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF6B88);
  }
  return result;
}

uint64_t sub_2179871F8()
{
  return sub_2179E1EB0();
}

unint64_t sub_21798722C()
{
  unint64_t result = qword_26ACF75D0;
  if (!qword_26ACF75D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF75D0);
  }
  return result;
}

uint64_t sub_21798726C(unint64_t *a1, void (*a2)(uint64_t))
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

id static TPSUIAppController.sharedInstance()()
{
  if (qword_26ACF7068 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)swift_dynamicCastClassUnconditional();

  return v0;
}

void sub_2179873AC()
{
  sub_217987524(319, (unint64_t *)&qword_26ACF74F8, &qword_26ACF6D88);
  if (v0 <= 0x3F)
  {
    sub_217987524(319, &qword_26ACF7548, &qword_26ACF75E8);
    if (v1 <= 0x3F)
    {
      sub_217991494();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_217987524(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2179E1B00();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_217987574()
{
  sub_217987524(319, &qword_26ACF7538, &qword_26ACF75D8);
  if (v0 <= 0x3F)
  {
    sub_217987524(319, &qword_26ACF7518, &qword_26ACF75B8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_217987718(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 40))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B68);
    sub_2179E23C0();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2179877AC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_217987840()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_2179E1AF0();
}

unint64_t sub_2179878AC()
{
  unint64_t result = qword_26ACF6AE8;
  if (!qword_26ACF6AE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6AF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B60);
    sub_21798E504();
    swift_getOpaqueTypeConformance2();
    sub_21799AE28(&qword_26ACF6B48, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6AE8);
  }
  return result;
}

uint64_t sub_217987A2C()
{
  return sub_2179E23C0();
}

uint64_t sub_217987A84()
{
  id v1 = sub_2179918E4();
  uint64_t v2 = MEMORY[0x263F8EE80];
  if (*v0)
  {
    char v3 = v0;
    swift_bridgeObjectRelease();
    *char v3 = v2;
  }
  ((void (*)(unsigned char *, void))v1)(v8, 0);
  uint64_t v5 = sub_217991880();
  if (*v4)
  {
    uint64_t v6 = v4;
    swift_bridgeObjectRelease();
    void *v6 = v2;
  }
  return ((uint64_t (*)(unsigned char *, void))v5)(v8, 0);
}

uint64_t sub_217987B38(unint64_t *a1, uint64_t *a2)
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

uint64_t View.assetContentMode(_:)()
{
  return swift_release();
}

uint64_t sub_217987BFC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_217987CA8()
{
  return sub_2179E1AF0();
}

uint64_t sub_217987D18()
{
  uint64_t result = sub_2179E1BE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2179E1970();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_217987E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74F0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader__state;
  v16[1] = 0;
  char v17 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D88);
  sub_2179E1AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  *(void *)(v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem) = 0;
  v12 = (void *)(v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier);
  void *v12 = 0;
  v12[1] = 0;
  uint64_t v13 = v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  uint64_t v14 = sub_2179E1810();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  void *v12 = a1;
  v12[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_217986BA4(a3, v13);
  swift_endAccess();
  return v3;
}

UIImage_optional __swiftcall UIImage.init(systemImageName:)(Swift::String systemImageName)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  unint64_t v2 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  uint64_t v3 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel__systemImageNamed_, v2);

  uint64_t v5 = v3;
  result.value.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t sub_217988074()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    swift_retain();
    sub_217989CB0();
    swift_release();
    swift_retain();
    sub_2179898F8();
    swift_release();
    *(unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    return swift_release();
  }
  return result;
}

void sub_217988114()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  objc_msgSend(v0, sel_play);
}

id sub_21798819C@<X0>(void *a1@<X8>)
{
  id v2 = objc_allocWithZone(MEMORY[0x263EFA7F0]);
  uint64_t v3 = (void *)sub_2179E17C0();
  id v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  uint64_t v5 = *MEMORY[0x263F010E0];
  int v6 = *(_DWORD *)(MEMORY[0x263F010E0] + 8);
  int v7 = *(_DWORD *)(MEMORY[0x263F010E0] + 12);
  uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v17 = v5;
  int v18 = v6;
  int v19 = v7;
  uint64_t v20 = v16;
  uint64_t v12 = v16;
  uint64_t v13 = v5;
  int v14 = v6;
  int v15 = v7;
  uint64_t v9 = v5;
  int v10 = v6;
  int v11 = v7;
  objc_msgSend(v4, sel_seekToTime_toleranceBefore_toleranceAfter_, &v17, &v13, &v9);
  id result = objc_msgSend(v4, sel_setMuted_, 1);
  *a1 = v4;
  return result;
}

uint64_t sub_2179882B0(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_217988318(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  v22 = *(void (**)(uint64_t, uint64_t, long long *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v12 = sub_2179E2930();
    uint64_t v14 = v13;
    if (a3)
    {
LABEL_3:
      *((void *)&v24 + 1) = swift_getObjectType();
      *(void *)&long long v23 = a3;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
LABEL_6:
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    unint64_t v17 = 0xF000000000000000;
    if (a6) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  id v15 = a4;
  a4 = (void *)sub_2179E1820();
  unint64_t v17 = v16;

  if (!a6) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v18 = sub_2179E2930();
  a6 = v19;
LABEL_11:
  id v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_217991D64((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_21798B28C((uint64_t)&v23, &qword_26ACF75F8);
}

id *sub_21798847C(id *__dst, id *__src, uint64_t a3)
{
  if (__dst == __src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  if (v7 > 3) {
    goto LABEL_6;
  }
  unsigned int v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    unsigned int v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      unsigned int v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    unsigned int v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  unsigned int v10 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *(unsigned __int8 *)__dst;
        if (v7 < 4) {
          goto LABEL_23;
        }
        goto LABEL_24;
      case 2:
        int v12 = *(unsigned __int16 *)__dst;
        if (v7 >= 4) {
          goto LABEL_24;
        }
        goto LABEL_23;
      case 3:
        int v12 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
        if (v7 >= 4) {
          goto LABEL_24;
        }
        goto LABEL_23;
      case 4:
        int v12 = *(_DWORD *)__dst;
        if (v7 < 4) {
LABEL_23:
        }
          v12 |= v10 << (8 * v7);
LABEL_24:
        unsigned int v8 = v12 + 2;
        break;
      default:
        break;
    }
  }
  if (v8 == 1)
  {

    if (v7 > 3) {
      goto LABEL_33;
    }
  }
  else
  {
    if (!v8) {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    if (v7 > 3) {
      goto LABEL_33;
    }
  }
  unsigned int v13 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v13 <= 0xFFFD)
  {
    if (v13 > 0xFD)
    {
      unsigned int v14 = *(unsigned __int16 *)((char *)__src + v7);
      unsigned int v15 = v14 - 2;
      if (v14 < 2) {
        goto LABEL_48;
      }
      goto LABEL_38;
    }
LABEL_33:
    unsigned int v14 = *((unsigned __int8 *)__src + v7);
    unsigned int v15 = v14 - 2;
    if (v14 < 2) {
      goto LABEL_48;
    }
LABEL_38:
    if (v7 <= 3) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *(unsigned __int8 *)__src;
        if (v7 >= 4) {
          goto LABEL_61;
        }
        goto LABEL_47;
      case 2:
        int v17 = *(unsigned __int16 *)__src;
        if (v7 >= 4) {
          goto LABEL_61;
        }
        goto LABEL_47;
      case 3:
        int v17 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
        if (v7 < 4) {
          goto LABEL_47;
        }
        goto LABEL_61;
      case 4:
        int v17 = *(_DWORD *)__src;
        if (v7 < 4)
        {
LABEL_47:
          unsigned int v14 = (v17 | (v15 << (8 * v7))) + 2;
          goto LABEL_48;
        }
LABEL_61:
        unsigned int v14 = v17 + 2;
        if (v14 == 1) {
          goto LABEL_62;
        }
        goto LABEL_49;
      default:
        goto LABEL_48;
    }
  }
  unsigned int v14 = *(_DWORD *)((char *)__src + v7);
  unsigned int v15 = v14 - 2;
  if (v14 >= 2) {
    goto LABEL_38;
  }
LABEL_48:
  if (v14 == 1)
  {
LABEL_62:
    id v21 = *__src;
    id v22 = v21;
    *__dst = v21;
    if (v7 > 3) {
      goto LABEL_63;
    }
    unsigned int v23 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v23 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v23 <= 0xFD) {
LABEL_63:
    }
      *((unsigned char *)__dst + v7) = 1;
    else {
      *(_WORD *)((char *)__dst + v7) = 1;
    }
  }
  else
  {
LABEL_49:
    if (v14)
    {
      if (v7 > 3) {
        goto LABEL_58;
      }
      unsigned int v19 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      uint64_t v20 = 2;
      if (v19 > 0xFFFD) {
        uint64_t v20 = 4;
      }
      if (v19 <= 0xFD) {
LABEL_58:
      }
        uint64_t v20 = 1;
      memcpy(__dst, __src, v20 + v7);
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(__dst, __src, v5);
      if (v7 <= 3)
      {
        unsigned int v18 = ((1 << (8 * v7)) + 1) >> (8 * v7);
        if (v18 > 0xFFFD)
        {
          *(_DWORD *)((char *)__dst + v7) = 0;
          return __dst;
        }
        if (v18 > 0xFD)
        {
          *(_WORD *)((char *)__dst + v7) = 0;
          return __dst;
        }
      }
      *((unsigned char *)__dst + v7) = 0;
    }
  }
  return __dst;
}

uint64_t sub_217988814(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v22 = *(void (**)(uint64_t, uint64_t, long long *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v12 = sub_2179E2930();
  uint64_t v14 = v13;
  if (a3)
  {
    *((void *)&v24 + 1) = swift_getObjectType();
    *(void *)&long long v23 = a3;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    unint64_t v17 = 0xF000000000000000;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v18 = 0;
    goto LABEL_9;
  }
  id v15 = a4;
  a4 = (void *)sub_2179E1820();
  unint64_t v17 = v16;

  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v18 = sub_2179E2930();
  a6 = v19;
LABEL_9:
  id v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_217991D64((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_21798B28C((uint64_t)&v23, &qword_26ACF75F8);
}

uint64_t sub_217988968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7500);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - v13;
  uint64_t v15 = v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader__state;
  swift_storeEnumTagMultiPayload();
  sub_21798B2E8((uint64_t)v14, (uint64_t)v12, &qword_26ACF6D90);
  sub_2179E1AA0();
  sub_21798B28C((uint64_t)v14, &qword_26ACF6D90);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v15, v8, v5);
  *(void *)(v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem) = 0;
  unint64_t v16 = (void *)(v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  *unint64_t v16 = 0;
  v16[1] = 0;
  uint64_t v17 = v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
  uint64_t v18 = sub_2179E1810();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = v22;
  *unint64_t v16 = a1;
  v16[1] = v19;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_217986BA4(v23, v17);
  swift_endAccess();
  return v3;
}

uint64_t sub_217988BAC()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  uint64_t v2 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer;
  if (!*(void *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer))
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document);
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = self;
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v1;
      *(void *)(v7 + 24) = v5;
      v13[4] = sub_2179A5990;
      v13[5] = v7;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 1107296256;
      v13[2] = sub_2179A4958;
      v13[3] = &block_descriptor;
      unsigned int v8 = _Block_copy(v13);
      id v9 = v3;
      swift_retain();
      swift_release();
      id v10 = objc_msgSend(v6, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v8, 0.75);
      _Block_release(v8);
      uint64_t v11 = *(void **)(v1 + v2);
      *(void *)(v1 + v2) = v10;
    }
  }
  swift_retain();
  sub_217989CB0();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v13[0]) = 1;
  swift_retain();
  return sub_2179E1AF0();
}

uint64_t sub_217988D7C(uint64_t result)
{
  long long v6 = *(_OWORD *)(result + 56);
  if (*(void *)(*(void *)(*((void *)&v6 + 1) + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    uint64_t v1 = self;
    sub_217991414((uint64_t)&v6);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(v1, sel_dataCacheForIdentifier_, v2);

    if (v3)
    {

      swift_getKeyPath();
      swift_getKeyPath();
      sub_2179E1AE0();
      swift_release();
      swift_release();
      if (v5)
      {
        sub_2179906C8(v4, v5);
      }
      else
      {
        sub_2179906C8(v4, 0);
        sub_217989DCC();
      }
    }
    swift_release();
    return sub_217990764((uint64_t)&v6);
  }
  return result;
}

void sub_217988EB8(char *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = OBJC_IVAR____TtC6TipsUI11_PlayerView_player;
  char v5 = *(void **)&a1[OBJC_IVAR____TtC6TipsUI11_PlayerView_player];
  *(void *)&a1[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = a3;
  id v6 = a3;

  id v10 = objc_msgSend(a1, sel_layer);
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  objc_msgSend(v7, sel_setPlayer_, *(void *)&a1[v4]);
  unint64_t v8 = (unint64_t)objc_msgSend(a1, sel_contentMode);
  if (v8 > 2) {
    id v9 = (void *)MEMORY[0x263EF9C70];
  }
  else {
    id v9 = (void *)qword_2642B23C0[v8];
  }
  objc_msgSend(v7, sel_setVideoGravity_, *v9);
}

uint64_t sub_217988FB8(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    sub_2179E1AF0();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

id sub_2179890F8()
{
  uint64_t v1 = sub_2179E24A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E24D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (objc_class *)type metadata accessor for TPSUIAppController();
  v19.receiver = v0;
  v19.super_class = v9;
  id result = objc_msgSendSuper2(&v19, sel_contentWillUpdate);
  uint64_t v11 = *(void **)&v0[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v0;
    aBlock[4] = sub_2179918DC;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179911FC;
    aBlock[3] = &block_descriptor_6;
    uint64_t v13 = _Block_copy(aBlock);
    v17[0] = v5;
    uint64_t v14 = v13;
    id v15 = v11;
    unint64_t v16 = v0;
    sub_2179E24C0();
    v17[1] = MEMORY[0x263F8EE78];
    sub_21798726C((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
    sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
    sub_2179E2C20();
    MEMORY[0x21D451C00](0, v8, v4, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, void))(v6 + 8))(v8, v17[0]);
    return (id)swift_release();
  }
  return result;
}

void sub_2179893CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v12 = sub_2179E2570();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  id v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = Strong;
    uint64_t v18 = *(void *)(Strong + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier + 8);
    if (v18)
    {
      BOOL v19 = *(void *)(Strong + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier) == a1 && v18 == a2;
      if (v19 || (sub_2179E2D50() & 1) != 0)
      {
        if (a9)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          v27 = a9;
          LOBYTE(v28) = 1;
          id v20 = a9;
          swift_retain();
        }
        else
        {
          sub_21798B2E8(a3, (uint64_t)&v27, &qword_26ACF75F8);
          if (v29)
          {
            sub_217987178();
            if (swift_dynamicCast())
            {
              id v21 = v30;
              uint64_t v22 = _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0();
              swift_getKeyPath();
              swift_getKeyPath();
              v27 = (void *)v22;
              LOBYTE(v28) = 0;
              swift_retain();
              sub_2179E1AF0();

LABEL_20:
              v25 = *(void **)(v17 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem);
              *(void *)(v17 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem) = 0;
              swift_release();

              return;
            }
          }
          else
          {
            sub_21798B28C((uint64_t)&v27, &qword_26ACF75F8);
          }
          sub_2179A8AE4();
          uint64_t v23 = swift_allocError();
          *long long v24 = 2;
          swift_getKeyPath();
          swift_getKeyPath();
          v27 = (void *)v23;
          LOBYTE(v28) = 1;
          swift_retain();
        }
        sub_2179E1AF0();
        goto LABEL_20;
      }
    }
    swift_release();
  }
  sub_2179E2540();
  v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_2179E2C50();
  id v30 = v27;
  unint64_t v31 = v28;
  sub_2179E2980();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    swift_release();
  }
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2980();
  sub_2179E2980();
  sub_2179E2830();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

char *sub_21798979C(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7 = a2;
  a4 &= 1u;
  sub_21798CC74(a3, a4);
  sub_217986F90(a3, a4);
  sub_217986828(a3, a4);
  if (sub_2179E1BF0()) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = (objc_class *)type metadata accessor for _PlayerView();
  id v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = 0;
  v19.receiver = v10;
  v19.super_class = v9;
  uint64_t v11 = (char *)objc_msgSendSuper2(&v19, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = *(void **)&v11[OBJC_IVAR____TtC6TipsUI11_PlayerView_player];
  *(void *)&v11[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = a2;
  id v13 = v7;
  uint64_t v14 = v11;

  objc_msgSend(v14, sel_setContentMode_, v8);
  id v15 = self;
  unint64_t v16 = v14;
  id v17 = objc_msgSend(v15, sel_clearColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  return v16;
}

uint64_t sub_2179898F8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)&v14 - v6;
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v14 - v8;
  id v10 = objc_msgSend(self, sel_defaultManager);
  uint64_t v11 = OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem;
  objc_msgSend(v10, sel_cancelSessionItem_, *(void *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem));

  uint64_t v12 = *(void **)(v0 + v11);
  *(void *)(v0 + v11) = 0;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  LODWORD(v10) = swift_getEnumCaseMultiPayload();
  uint64_t result = sub_21798B28C((uint64_t)v9, &qword_26ACF6D90);
  if (v10)
  {
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21798B2E8((uint64_t)v7, (uint64_t)v4, &qword_26ACF6D90);
    swift_retain();
    sub_2179E1AF0();
    return sub_21798B28C((uint64_t)v7, &qword_26ACF6D90);
  }
  return result;
}

uint64_t sub_217989C34@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

void sub_217989CB0()
{
  id v1 = objc_msgSend(self, sel_defaultManager);
  uint64_t v2 = OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem;
  objc_msgSend(v1, sel_cancelSessionItem_, *(void *)(v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem));

  char v3 = *(void **)(v0 + v2);
  *(void *)(v0 + v2) = 0;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v5)
  {
    sub_2179906C8(v4, v5);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2179E1AF0();
  }
  else
  {
    sub_2179906C8(v4, 0);
  }
}

void sub_217989DCC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388]();
  char v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2179E1810();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  swift_beginAccess();
  sub_21798B2E8(v8, (uint64_t)v3, &qword_26ACF6BC8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_21798B28C((uint64_t)v3, &qword_26ACF6BC8);
LABEL_7:
    sub_2179A8AE4();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t aBlock = v10;
    LOBYTE(v28) = 1;
    swift_retain();
    sub_2179E1AF0();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  if (!*(void *)(v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier + 8))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_7;
  }
  uint64_t v9 = OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem;
  if (*(void *)(v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem))
  {
LABEL_5:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  uint64_t v12 = (void *)aBlock;
  if (!(_BYTE)v28)
  {
    swift_bridgeObjectRelease();
    sub_2179906C8(v12, 0);
    goto LABEL_5;
  }
  sub_2179906C8((void *)aBlock, v28);
  id v13 = self;
  uint64_t v14 = (void *)sub_2179E2900();
  id v15 = objc_msgSend(v13, sel_imageFromMemoryCacheForIdentifier_, v14);

  if (v15)
  {
    swift_bridgeObjectRelease();
    id v16 = v15;
    uint64_t v17 = _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t aBlock = v17;
    LOBYTE(v28) = 0;
    swift_retain();
    sub_2179E1AF0();

    goto LABEL_5;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t aBlock = 1;
  LOBYTE(v28) = 2;
  swift_retain();
  sub_2179E1AF0();
  sub_2179E17B0();
  uint64_t v18 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  objc_super v19 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  int v20 = *MEMORY[0x263F085C0];
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  unint64_t v31 = sub_217991A68;
  uint64_t v32 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  uint64_t v29 = sub_217988814;
  id v30 = &block_descriptor_2;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_release();
  LODWORD(v23) = v20;
  id v24 = objc_msgSend(v13, sel_formattedDataForPath_identifier_priority_completionHandler_, v18, v19, v22, v23);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v25 = *(void **)(v1 + v9);
  *(void *)(v1 + v9) = v24;
}

char *TPSUIAppController.init()()
{
  uint64_t v1 = sub_2179E2AF0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E2AD0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_2179E24D0();
  MEMORY[0x270FA5388](v6 - 8);
  v0[OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed] = 0;
  *(void *)&v0[OBJC_IVAR___TPSUIAppController_syncQueue] = 0;
  *(void *)&v0[OBJC_IVAR___TPSUIAppController_attributedStringCache] = 0;
  *(void *)&v0[OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache] = 0;
  id v7 = (objc_class *)type metadata accessor for TPSUIAppController();
  v29.receiver = v0;
  v29.super_class = v7;
  id v8 = objc_msgSendSuper2(&v29, sel_init);
  uint64_t v9 = self;
  uint64_t v10 = (char *)v8;
  id v11 = objc_msgSend(v9, sel_sharedInstance);
  id v12 = v10;
  if (v11)
  {
    id v13 = v11;
    unsigned int v14 = objc_msgSend(v11, sel_tipsAccessAllowed);

    id v12 = v10;
    if (v14)
    {
      v27[1] = sub_21798722C();
      sub_2179E24C0();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_21798726C(&qword_26ACF75C8, MEMORY[0x263F8F0F8]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75A8);
      sub_217987B38(&qword_26ACF75B0, &qword_26ACF75A8);
      sub_2179E2C20();
      (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
      uint64_t v15 = sub_2179E2B20();
      id v16 = *(void **)&v10[OBJC_IVAR___TPSUIAppController_syncQueue];
      *(void *)&v10[OBJC_IVAR___TPSUIAppController_syncQueue] = v15;

      uint64_t v17 = MEMORY[0x263F8EE78];
      unint64_t v18 = sub_21798AA2C(MEMORY[0x263F8EE78]);
      objc_super v19 = (unint64_t *)&v10[OBJC_IVAR___TPSUIAppController_attributedStringCache];
      swift_beginAccess();
      *objc_super v19 = v18;
      swift_bridgeObjectRelease();
      unint64_t v20 = sub_21798AA2C(v17);
      uint64_t v21 = (unint64_t *)&v10[OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache];
      swift_beginAccess();
      *uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(self, sel_defaultCenter);
      uint64_t v22 = *MEMORY[0x263F83428];
      uint64_t v23 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_2179A93F8;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2179A9400;
      aBlock[3] = &block_descriptor_1;
      id v24 = _Block_copy(aBlock);
      swift_release();
      id v25 = objc_msgSend(v12, sel_addObserverForName_object_queue_usingBlock_, v22, 0, 0, v24);

      _Block_release(v24);
      swift_unknownObjectRelease();
    }
  }

  return v10;
}

unint64_t sub_21798A914(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2179E2D10();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    id v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_2179B2CDC(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_21798AA2C(uint64_t a1)
{
  return sub_21798A914(a1, &qword_26ACF77E8);
}

id TipNavigationViewModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7530);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = &v0[OBJC_IVAR___TipNavigationViewModel__currentTip];
  uint64_t v16 = 0;
  uint64_t v10 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75D8);
  sub_2179E1AA0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  char v11 = &v10[OBJC_IVAR___TipNavigationViewModel__tips];
  uint64_t v16 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75B8);
  sub_2179E1AA0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v11, v4, v1);

  id v12 = (objc_class *)type metadata accessor for TipNavigationViewModel();
  v15.receiver = v10;
  v15.super_class = v12;
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t type metadata accessor for TipNavigationViewModel()
{
  uint64_t result = qword_26ACF7490;
  if (!qword_26ACF7490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21798ACA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v57 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BA8);
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  MEMORY[0x270FA5388](v3);
  v54 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E2B50();
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  MEMORY[0x270FA5388](v5);
  v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BA0);
  uint64_t v7 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  id v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B20);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B18);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = (uint64_t)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B30) - 8;
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = *v1;
  uint64_t KeyPath = swift_getKeyPath();
  id v46 = v18;
  uint64_t v44 = sub_2179E2250();
  char v19 = sub_2179E2010();
  swift_getKeyPath();
  sub_2179E17A0();
  swift_release();
  uint64_t v20 = swift_allocObject();
  long long v21 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(v2 + 32);
  *(unsigned char *)(v20 + 64) = *(unsigned char *)(v2 + 48);
  uint64_t v22 = v47;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&v13[*(int *)(v11 + 60)], v9, v47);
  uint64_t v23 = KeyPath;
  *(void *)uint64_t v13 = v18;
  *((void *)v13 + 1) = v23;
  v13[16] = 0;
  *((void *)v13 + 3) = v44;
  v13[32] = v19;
  id v24 = (float *(**)(float *))&v13[*(int *)(v11 + 64)];
  *id v24 = sub_217991BA0;
  v24[1] = (float *(*)(float *))v20;
  sub_217990970(v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  id v25 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v26 = (void *)sub_2179E2900();
  id v27 = objc_msgSend(v46, sel_currentItem);
  uint64_t v28 = v49;
  sub_2179E2B60();

  uint64_t v29 = swift_allocObject();
  long long v30 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v29 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v29 + 32) = v30;
  *(_OWORD *)(v29 + 48) = *(_OWORD *)(v2 + 32);
  *(unsigned char *)(v29 + 64) = *(unsigned char *)(v2 + 48);
  uint64_t v31 = v48;
  sub_21798B2E8((uint64_t)v13, v48, &qword_26ACF6B20);
  uint64_t v33 = v52;
  uint64_t v32 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v52 + 16))(v31 + *(int *)(v15 + 60), v28, v53);
  v34 = (uint64_t (**)(uint64_t))(v31 + *(int *)(v15 + 64));
  *v34 = sub_2179A5C70;
  v34[1] = (uint64_t (*)(uint64_t))v29;
  sub_217990970(v2);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v32);
  sub_21798B28C((uint64_t)v13, &qword_26ACF6B20);
  swift_getKeyPath();
  v35 = v54;
  sub_2179E17A0();
  swift_release();
  uint64_t v36 = swift_allocObject();
  long long v37 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v36 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v36 + 32) = v37;
  *(_OWORD *)(v36 + 48) = *(_OWORD *)(v2 + 32);
  *(unsigned char *)(v36 + 64) = *(unsigned char *)(v2 + 48);
  uint64_t v38 = v50;
  sub_21798B2E8(v31, v50, &qword_26ACF6B18);
  uint64_t v39 = v51;
  uint64_t v41 = v55;
  uint64_t v40 = v56;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v38 + *(int *)(v51 + 60), v35, v56);
  v42 = (uint64_t (**)(uint64_t))(v38 + *(int *)(v39 + 64));
  *v42 = sub_217991B98;
  v42[1] = (uint64_t (*)(uint64_t))v36;
  sub_217990970(v2);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v40);
  sub_21798B28C(v31, &qword_26ACF6B18);
  return sub_2179A5CB0(v38, v57);
}

uint64_t sub_21798B28C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21798B2E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t assignWithCopy for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = (_OWORD *)(a1 + 8);
  uint64_t v8 = (_OWORD *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v9)
    {
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_retain();
      swift_release();
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_retain();
      swift_release();
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    }
    else
    {
      sub_21798B28C(a1 + 8, &qword_26ACF6B68);
      char v10 = *(unsigned char *)(a2 + 24);
      _OWORD *v7 = *v8;
      *(unsigned char *)(a1 + 24) = v10;
    }
  }
  else if (v9)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v11 = *v8;
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    _OWORD *v7 = v11;
  }
  uint64_t v12 = (_OWORD *)(a1 + 32);
  uint64_t v13 = (_OWORD *)(a2 + 32);
  uint64_t v14 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v14)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_retain();
      swift_release();
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_retain();
      swift_release();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    }
    else
    {
      sub_21798B28C(a1 + 32, &qword_26ACF6B68);
      char v15 = *(unsigned char *)(a2 + 48);
      _OWORD *v12 = *v13;
      *(unsigned char *)(a1 + 48) = v15;
    }
  }
  else if (v14)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    swift_retain();
    swift_retain();
  }
  else
  {
    long long v16 = *v13;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    _OWORD *v12 = v16;
  }
  return a1;
}

uint64_t type metadata accessor for _PlayerView()
{
  return self;
}

uint64_t assignWithCopy for RemoteVideoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21798CC74(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_217986828(v6, v7);
  uint64_t v8 = *(void *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 24);
  sub_21798CC74(v8, v9);
  uint64_t v10 = *(void *)(a1 + 16);
  char v11 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  sub_217986828(v10, v11);
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  char v14 = *(unsigned char *)(a2 + 49);
  unsigned __int8 v15 = *(unsigned char *)(a2 + 48);
  sub_21799AC58(v12, v13, v15, v14);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 49);
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v13;
  uint64_t v19 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v15;
  *(unsigned char *)(a1 + 49) = v14;
  sub_21799AC18(v16, v17, v19, v18);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

char *sub_21798B700()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme];
  uint64_t v2 = *MEMORY[0x263F18508];
  uint64_t v3 = sub_2179E1BE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections] = MEMORY[0x263F8EE78];
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip] = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID];
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList] = 0;
  uint64_t v5 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager;
  id v6 = objc_allocWithZone((Class)TPSTipsAssetPrefetchingManager);
  char v7 = v0;
  *(void *)&v0[v5] = objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController;
  *(void *)&v7[v8] = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v7[OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController] = 0;
  uint64_t v9 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_contentDidUpdate;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
  swift_allocObject();
  *(void *)&v7[v9] = sub_2179E1A50();
  uint64_t v10 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_savedTipsContentDidUpdate;
  swift_allocObject();
  *(void *)&v7[v10] = sub_2179E1A50();
  uint64_t v11 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_networkDidChangeToReachable;
  swift_allocObject();
  *(void *)&v7[v11] = sub_2179E1A50();
  sub_2179E1960();

  v24.receiver = v7;
  v24.super_class = (Class)type metadata accessor for TipsContentModel();
  id v12 = objc_msgSendSuper2(&v24, sel_init);
  uint64_t v13 = self;
  char v14 = (char *)v12;
  id v15 = objc_msgSend(v13, sel_sharedInstance);
  uint64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_defaultManager);
  objc_msgSend(v17, sel_setDelegate_, v15);

  id v18 = objc_msgSend(v16, sel_defaultManager);
  objc_msgSend(v18, sel_setDefaultSessionDelegate_, v15);

  if (objc_msgSend(self, sel_isInternalDevice))
  {
    id v19 = objc_msgSend(self, sel_defaultContext);
    id v20 = objc_msgSend(v16, sel_defaultManager);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7F628]), sel_initWithAuthenticationContext_, v19);
    objc_msgSend(v20, sel_setAuthenticationHandler_, v21);
  }
  id v22 = *(id *)&v14[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
  objc_msgSend(v22, sel_addDelegate_, v14);

  return v14;
}

uint64_t destroy for VideoPlayerViewRepresentable(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);

  return sub_217986828(v2, v3);
}

void sub_21798BED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v48 = a3;
  uint64_t v52 = a1;
  uint64_t v10 = sub_2179E2570();
  uint64_t v50 = *(void *)(v10 - 8);
  uint64_t v51 = v10;
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2179E1810();
  uint64_t v46 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v45 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v47 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v49 = (uint64_t *)((char *)&v44 - v22);
  MEMORY[0x270FA5388](v21);
  objc_super v24 = (char *)&v44 - v23;
  *(uint64_t *)((char *)&v44 - v23) = (uint64_t)a9;
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v26 = Strong;
    uint64_t v27 = *(void *)(Strong + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8);
    if (v27
      && a2
      && (*(void *)(Strong + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier) == v52 && v27 == a2
       || (sub_2179E2D50() & 1) != 0))
    {
      sub_21798B2E8(v48, (uint64_t)&v53, &qword_26ACF75F8);
      uint64_t v28 = v55;
      id v29 = a9;
      if (v28)
      {
        int v30 = swift_dynamicCast();
        uint64_t v31 = v46;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v15, v30 ^ 1u, 1, v16);
        int v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v15, 1, v16);
        uint64_t v33 = (uint64_t)v47;
        if (v32 != 1)
        {
          sub_21798B28C((uint64_t)v24, &qword_26ACF6D90);
          v34 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
          v35 = v45;
          v34(v45, v15, v16);
          v34(v24, v35, v16);
          swift_storeEnumTagMultiPayload();
          uint64_t v36 = (uint64_t)v49;
LABEL_17:
          sub_21798B2E8((uint64_t)v24, v36, &qword_26ACF6D90);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_21798B2E8(v36, v33, &qword_26ACF6D90);
          swift_retain();
          sub_2179E1AF0();
          sub_21798B28C(v36, &qword_26ACF6D90);
          sub_21798B28C((uint64_t)v24, &qword_26ACF6D90);
          v43 = *(void **)(v26 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem);
          *(void *)(v26 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem) = 0;
          swift_release();

          return;
        }
      }
      else
      {
        sub_21798B28C((uint64_t)&v53, &qword_26ACF75F8);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v15, 1, 1, v16);
        uint64_t v33 = (uint64_t)v47;
      }
      sub_21798B28C((uint64_t)v15, &qword_26ACF6BC8);
      sub_2179A8AE4();
      uint64_t v41 = swift_allocError();
      unsigned char *v42 = 2;
      sub_21798B28C((uint64_t)v24, &qword_26ACF6D90);
      uint64_t v36 = (uint64_t)v49;
      uint64_t *v49 = v41;
      swift_storeEnumTagMultiPayload();
      sub_2179A8B70(v36, (uint64_t)v24);
      goto LABEL_17;
    }
    id v37 = a9;
    swift_release();
  }
  else
  {
    id v38 = a9;
  }
  uint64_t v40 = v50;
  uint64_t v39 = v51;
  sub_2179E2540();
  uint64_t v53 = 0;
  unint64_t v54 = 0xE000000000000000;
  sub_2179E2C50();
  uint64_t v56 = v53;
  unint64_t v57 = v54;
  sub_2179E2980();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    swift_release();
  }
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2980();
  swift_bridgeObjectRetain();
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2830();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v39);
  sub_21798B28C((uint64_t)v24, &qword_26ACF6D90);
}

void sub_21798C50C()
{
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v1 = MEMORY[0x270FA5388](v39);
  char v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  id v6 = (uint64_t *)((char *)&v35 - v5);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2179E1810();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
  swift_beginAccess();
  uint64_t v17 = v16;
  uint64_t v18 = v13;
  sub_21798B2E8(v17, (uint64_t)v11, &qword_26ACF6BC8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_21798B28C((uint64_t)v11, &qword_26ACF6BC8);
LABEL_7:
    sub_2179A8AE4();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = 1;
    uint64_t *v6 = v20;
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21798B2E8((uint64_t)v6, (uint64_t)v3, &qword_26ACF6D90);
    swift_retain();
    sub_2179E1AF0();
    uint64_t v22 = (uint64_t)v6;
LABEL_8:
    sub_21798B28C(v22, &qword_26ACF6D90);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  if (!*(void *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8))
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_7;
  }
  uint64_t v19 = OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem;
  if (*(void *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem))
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v12);
    return;
  }
  uint64_t v37 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  id v38 = v15;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (!swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v38, v12);
    swift_bridgeObjectRelease();
    uint64_t v22 = (uint64_t)v8;
    goto LABEL_8;
  }
  uint64_t v36 = v19;
  sub_21798B28C((uint64_t)v8, &qword_26ACF6D90);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21798B2E8((uint64_t)v6, (uint64_t)v3, &qword_26ACF6D90);
  swift_retain();
  sub_2179E1AF0();
  sub_21798B28C((uint64_t)v6, &qword_26ACF6D90);
  sub_2179871B8();
  id v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  uint64_t v24 = v0;
  if (v23)
  {
    id v25 = v23;
    uint64_t v26 = v38;
    sub_2179E17B0();
    uint64_t v27 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    int v29 = *MEMORY[0x263F085C0];
    uint64_t v30 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_217991B70;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_217988318;
    aBlock[3] = &block_descriptor_0;
    uint64_t v31 = _Block_copy(aBlock);
    swift_release();
    LODWORD(v32) = v29;
    id v33 = objc_msgSend(v25, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v27, v28, 0, v31, v32);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v26, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v38, v12);
    swift_bridgeObjectRelease();
    id v33 = 0;
  }
  v34 = *(void **)(v24 + v36);
  *(void *)(v24 + v36) = v33;
}

void sub_21798CAF0(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  if (v2 > 3) {
    goto LABEL_4;
  }
  unsigned int v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    unsigned int v3 = *(_DWORD *)&a1[v2];
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      unsigned int v3 = a1[v2];
      goto LABEL_9;
    }
    unsigned int v3 = *(unsigned __int16 *)&a1[v2];
  }
LABEL_9:
  unsigned int v5 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v6 = v2;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_18;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_18;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_18;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_18:
        int v8 = (v7 | (v5 << (8 * v2))) + 2;
        unsigned int v3 = v7 + 2;
        if (v2 < 4) {
          unsigned int v3 = v8;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1)
  {
  }
  else if (!v3)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

uint64_t _s6TipsUI28VideoPlayerViewRepresentableVwCP_0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 16);
  id v6 = v3;
  sub_21798CC74(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_21798CC74(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21798CC80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21798CF98(a1, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_21798B28C((uint64_t)v6, &qword_26ACF6D90);
    uint64_t v7 = sub_2179E1810();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 1, 1, v7);
  }
  else
  {
    uint64_t v9 = sub_2179E1810();
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v6, v9);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
}

uint64_t sub_21798CDFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (id *)((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21798CF98(a1, (uint64_t)v4);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:

      swift_beginAccess();
      uint64_t result = swift_weakLoadStrong();
      if (result)
      {
        uint64_t v6 = result;
        swift_retain();
        sub_2179898F8();
        swift_release();
        *(unsigned char *)(v6 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
        goto LABEL_9;
      }
      break;
    case 2:
      return result;
    case 3:
      swift_beginAccess();
      uint64_t result = swift_weakLoadStrong();
      if (result)
      {
        *(unsigned char *)(result + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 1;
LABEL_9:
        uint64_t result = swift_release();
      }
      break;
    default:
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_217988BAC();
        swift_release();
      }
      uint64_t result = sub_21798B28C((uint64_t)v4, &qword_26ACF6D90);
      break;
  }
  return result;
}

uint64_t sub_21798CF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_21798D000(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_5;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFD)
  {
    unsigned int v5 = *(_DWORD *)&a2[v4];
  }
  else
  {
    if (v6 <= 0xFD)
    {
LABEL_5:
      unsigned int v5 = a2[v4];
      goto LABEL_10;
    }
    unsigned int v5 = *(unsigned __int16 *)&a2[v4];
  }
LABEL_10:
  unsigned int v7 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_19;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_19;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_19;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_19:
        int v10 = (v9 | (v7 << (8 * v4))) + 2;
        unsigned int v5 = v9 + 2;
        if (v4 < 4) {
          unsigned int v5 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    uint64_t v12 = *(void *)a2;
    id v13 = *(id *)a2;
    *(void *)__dst = v12;
    if (v4 > 3) {
      goto LABEL_28;
    }
    unsigned int v16 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v16 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v4] = 1;
      return __dst;
    }
    if (v16 <= 0xFD) {
LABEL_28:
    }
      __dst[v4] = 1;
    else {
      *(_WORD *)&__dst[v4] = 1;
    }
  }
  else if (v5)
  {
    if (v4 > 3) {
      goto LABEL_33;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v15 = 2;
    if (v14 > 0xFFFD) {
      uint64_t v15 = 4;
    }
    if (v14 <= 0xFD) {
LABEL_33:
    }
      uint64_t v15 = 1;
    memcpy(__dst, a2, v15 + v4);
  }
  else
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(__dst);
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v4] = 0;
        return __dst;
      }
      if (v11 > 0xFD)
      {
        *(_WORD *)&__dst[v4] = 0;
        return __dst;
      }
    }
    __dst[v4] = 0;
  }
  return __dst;
}

uint64_t destroy for VideoPlayerView(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    swift_release();
    swift_release();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_21798D2B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74E8);
  uint64_t v19 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A78);
  uint64_t v20 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A48);
  uint64_t v21 = *(void *)(v8 - 8);
  uint64_t v22 = v8;
  MEMORY[0x270FA5388](v8);
  int v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A58);
  uint64_t v23 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    id v14 = v24;

    if (!v14)
    {
      v18[1] = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
      swift_beginAccess();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7500);
      sub_2179E1AB0();
      swift_endAccess();
      swift_release();
      swift_allocObject();
      swift_weakInit();
      swift_allocObject();
      v18[0] = v11;
      swift_weakInit();
      sub_21798D884(&qword_26ACF74E0, &qword_26ACF74E8);
      swift_retain();
      sub_2179E1B30();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
      swift_release();
      sub_2179E1810();
      sub_21798D884(&qword_26ACF6A70, &qword_26ACF6A78);
      sub_2179E1B20();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
      sub_217986C94(0, &qword_26ACF6B98);
      uint64_t v15 = v22;
      sub_2179E1A20();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v15);
      swift_allocObject();
      swift_weakInit();
      sub_21798D884(&qword_26ACF6A50, &qword_26ACF6A58);
      uint64_t v16 = v18[0];
      uint64_t v17 = sub_2179E1B80();
      swift_release();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v16);
      *(void *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = v17;
      swift_release();
      swift_retain();
      sub_217989DCC();
      swift_release();
      swift_retain();
      sub_21798C50C();
      swift_release();
    }
  }
}

uint64_t sub_21798D884(unint64_t *a1, uint64_t *a2)
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

uint64_t initializeWithCopy for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = *(void *)(a2 + 16);
  id v7 = v4;
  if (!v6)
  {
    *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 8);
    *(unsigned char *)(v5 + 16) = *(unsigned char *)(a2 + 24);
    uint64_t v8 = *(void *)(a2 + 40);
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    return a1;
  }
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_retain();
  swift_retain();
  uint64_t v8 = *(void *)(a2 + 40);
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21798D988(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (v3 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

_OWORD *sub_21798DA08(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  unint64_t v6 = (void *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  id v7 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v11 = ((unint64_t)v6 + v10 + 8) & ~v10;
  uint64_t v12 = ((unint64_t)v7 + v10 + 8) & ~v10;
  swift_bridgeObjectRetain();
  v9(v11, v12, v8);
  return a1;
}

uint64_t RemoteVideoView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v2 = sub_2179E1E70();
  uint64_t v45 = *(void *)(v2 - 8);
  uint64_t v46 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_2179E1FF0();
  uint64_t v5 = *(void *)(v42 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B50);
  uint64_t v8 = *(void *)(v44 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AF0);
  uint64_t v11 = MEMORY[0x270FA5388](v41);
  id v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v43 = (char *)&v41 - v15;
  MEMORY[0x270FA5388](v14);
  v49 = (char *)&v41 - v16;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B00);
  MEMORY[0x270FA5388](v47);
  uint64_t v48 = (uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = v1[5];
  long long v67 = v1[4];
  long long v68 = v18;
  long long v69 = v1[6];
  char v70 = *((unsigned char *)v1 + 112);
  long long v19 = v1[1];
  long long v63 = *v1;
  long long v64 = v19;
  long long v20 = v1[3];
  long long v65 = v1[2];
  long long v66 = v20;
  uint64_t v21 = sub_2179E2420();
  uint64_t v23 = v22;
  sub_21798E630((uint64_t)&v63, (uint64_t)&v52);
  *(void *)&long long v51 = v21;
  *((void *)&v51 + 1) = v23;
  sub_2179E1FE0();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B60);
  unint64_t v25 = sub_21798E504();
  sub_2179E21D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v42);
  v71[8] = v59;
  v71[9] = v60;
  v71[10] = v61;
  v71[11] = v62;
  v71[4] = v55;
  v71[5] = v56;
  v71[6] = v57;
  v71[7] = v58;
  v71[0] = v51;
  v71[1] = v52;
  v71[2] = v53;
  v71[3] = v54;
  sub_21799AB5C((uint64_t)v71);
  sub_2179E1E60();
  *(void *)&long long v51 = v24;
  *((void *)&v51 + 1) = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v44;
  sub_2179E21E0();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v4, v46);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
  uint64_t v27 = (uint64_t)v43;
  long long v55 = v67;
  long long v56 = v68;
  long long v57 = v69;
  LOBYTE(v58) = v70;
  long long v51 = v63;
  long long v52 = v64;
  long long v53 = v65;
  long long v54 = v66;
  id v28 = sub_21798E0FC();
  if (v29) {
    id v30 = v28;
  }
  else {
    id v30 = 0;
  }
  if (v29) {
    unint64_t v31 = v29;
  }
  else {
    unint64_t v31 = 0xE000000000000000;
  }
  *(void *)&long long v51 = v30;
  *((void *)&v51 + 1) = v31;
  sub_21798E4B0();
  sub_2179E1D00();
  swift_bridgeObjectRelease();
  sub_21798E01C((uint64_t)v13);
  long long v55 = v67;
  long long v56 = v68;
  long long v57 = v69;
  LOBYTE(v58) = v70;
  long long v51 = v63;
  long long v52 = v64;
  long long v53 = v65;
  long long v54 = v66;
  sub_21798E0FC();
  if (v32) {
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = (uint64_t)v49;
  sub_2179E1D10();
  sub_21798E01C(v27);
  uint64_t v34 = swift_allocObject();
  long long v35 = v68;
  *(_OWORD *)(v34 + 80) = v67;
  *(_OWORD *)(v34 + 96) = v35;
  *(_OWORD *)(v34 + 112) = v69;
  *(unsigned char *)(v34 + 128) = v70;
  long long v36 = v64;
  *(_OWORD *)(v34 + 16) = v63;
  *(_OWORD *)(v34 + 32) = v36;
  long long v37 = v66;
  *(_OWORD *)(v34 + 48) = v65;
  *(_OWORD *)(v34 + 64) = v37;
  uint64_t v38 = v48;
  sub_21798E5C8(v33, v48);
  uint64_t v39 = (uint64_t (**)())(v38 + *(int *)(v47 + 36));
  *uint64_t v39 = sub_217991CE0;
  v39[1] = (uint64_t (*)())v34;
  v39[2] = 0;
  v39[3] = 0;
  sub_21798EA90((uint64_t)&v63);
  sub_21798E01C(v33);
  return sub_21798E560(v38, v50);
}

uint64_t sub_21798E01C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21798E07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result = swift_release();
  if ((a8 & 1) == 0)
  {
    sub_21798E45C(a4);
    return sub_21798E45C(a6);
  }
  return result;
}

id sub_21798E0FC()
{
  uint64_t v1 = *(void *)(v0 + 64);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  uint64_t v3 = *(void **)(v1 + 16);
  if (v2)
  {
    swift_getKeyPath();
    sub_21799AE28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
    uint64_t v4 = v3;
    sub_2179E1930();
    swift_release();
    uint64_t v5 = (id *)&v4[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip];
    swift_beginAccess();
    id v6 = *v5;
    id v7 = *v5;

    if (v6)
    {
      id v8 = objc_msgSend(v7, sel_fullContent);

      if (v8)
      {
        id v9 = objc_msgSend(v8, sel_assets);

        if (!v9) {
          return v9;
        }
        goto LABEL_9;
      }
    }
    return 0;
  }
  swift_getKeyPath();
  sub_21799AE28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  uint64_t v10 = v3;
  sub_2179E1930();
  swift_release();
  uint64_t v11 = (id *)&v10[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection];
  swift_beginAccess();
  id v12 = *v11;
  id v13 = *v11;

  if (!v12) {
    return 0;
  }
  id v14 = objc_msgSend(v13, sel_featuredContent);

  if (!v14) {
    return 0;
  }
  id v9 = objc_msgSend(v14, sel_assets);

  if (!v9) {
    return v9;
  }
LABEL_9:
  id v15 = objc_msgSend(v9, sel_alt);

  if (!v15) {
    return 0;
  }
  id v9 = (id)sub_2179E2930();

  return v9;
}

void sub_21798E3B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a3)
  {

    sub_21798E46C(a4, a5);
    sub_21798E46C(a7, a8);
    sub_21798E45C(a10);
    sub_21798E45C(a12);
  }
}

uint64_t sub_21798E45C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21798E46C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_21798E4B0()
{
  unint64_t result = qword_26ACF6B70;
  if (!qword_26ACF6B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6B70);
  }
  return result;
}

unint64_t sub_21798E504()
{
  unint64_t result = qword_26ACF6B58;
  if (!qword_26ACF6B58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6B58);
  }
  return result;
}

uint64_t sub_21798E560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21798E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21798E630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_217990334(a1, (uint64_t)&v38);
  uint64_t v33 = v40;
  uint64_t v34 = (uint64_t)v38;
  uint64_t v31 = v42;
  uint64_t v32 = v41;
  uint64_t v30 = v43;
  uint64_t v28 = v39;
  uint64_t v29 = v44;
  char v26 = v45;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_release();
  id v4 = v38;

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    char v6 = *(unsigned char *)(a1 + 24);
    sub_21798EA90(a1);
    sub_21798CC74(v5, v6);
    double v7 = sub_217990790(v5, v6);
    sub_217986828(v5, v6);
    sub_217990164(a1);
  }
  else
  {
    double v7 = 1.0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_release();
  id v8 = v38;
  if (v38)
  {
    uint64_t v9 = sub_2179E2420();
    uint64_t v24 = v10;
    uint64_t v25 = v9;
    sub_21798EA90(a1);
    type metadata accessor for DocumentAssetViewModel();
    sub_21799AE28((unint64_t *)&qword_26ACF6A18, (void (*)(uint64_t))type metadata accessor for DocumentAssetViewModel);
    id v22 = v8;
    sub_2179E1CD0();
    sub_217990164(a1);
    swift_getKeyPath();
    sub_2179E1CE0();
    swift_release();
    swift_release();
    uint64_t v11 = v39;
    uint64_t v27 = (uint64_t)v38;
    uint64_t v12 = v40;
    sub_21798EA90(a1);
    sub_2179E1CD0();
    sub_217990164(a1);
    swift_getKeyPath();
    sub_2179E1CE0();
    swift_release();
    swift_release();
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    uint64_t v23 = v37;
    objc_msgSend(v22, sel_setMuted_, 1);
    uint64_t v15 = swift_allocObject();
    long long v16 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v15 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v15 + 96) = v16;
    *(_OWORD *)(v15 + 112) = *(_OWORD *)(a1 + 96);
    *(unsigned char *)(v15 + 128) = *(unsigned char *)(a1 + 112);
    long long v17 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v15 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v15 + 32) = v17;
    long long v18 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v15 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v15 + 64) = v18;
    sub_21798EA90(a1);

    long long v19 = sub_217991CE8;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v23 = 0;
    long long v19 = 0;
    uint64_t v15 = 0;
  }
  LOBYTE(v38) = v26;
  *(void *)a2 = v34;
  *(void *)(a2 + 8) = v28;
  *(void *)(a2 + 16) = v33;
  *(void *)(a2 + 24) = v32;
  *(void *)(a2 + 32) = v31;
  *(void *)(a2 + 40) = v30;
  *(void *)(a2 + 48) = v29;
  *(unsigned char *)(a2 + 56) = v26;
  *(double *)(a2 + 64) = v7;
  *(void *)(a2 + 72) = v25;
  *(void *)(a2 + 80) = v24;
  *(void *)(a2 + 88) = v8;
  *(void *)(a2 + 96) = v27;
  *(void *)(a2 + 104) = v11;
  *(void *)(a2 + 112) = v12;
  *(void *)(a2 + 120) = v13;
  *(void *)(a2 + 128) = v14;
  *(void *)(a2 + 136) = v23;
  *(void *)(a2 + 144) = v19;
  *(void *)(a2 + 160) = 0;
  *(void *)(a2 + 168) = 0;
  *(void *)(a2 + 152) = v15;
  uint64_t v20 = (uint64_t)v19;
  sub_2179902B4(v34, v28, v33, v32, v31, v30, v29, v26);
  sub_2179909E4(v25, v24, v8, v27, v11, v12, v13, v14, v23, v20, v15, 0);
  sub_21798E3B0(v25, v24, v8, v27, v11, v12, v13, v14, v23, v20, v15, 0);
  return sub_21798E07C(v34, v28, v33, v32, v31, v30, v29, v26);
}

uint64_t sub_21798EA90(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 49);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  sub_21798CC74(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_21798CC74(v2, v3);
  sub_21799AC58(v4, v5, v7, v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t initializeWithCopy for RemoteVideoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21798CC74(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  sub_21798CC74(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 49);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 48);
  sub_21799AC58(v8, v9, v11, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 49) = v10;
  uint64_t v12 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v12;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v13;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v14 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v14;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void sub_21798EC3C(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v12 = MEMORY[0x263F8EE78];
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_stops);
  sub_21798F184();
  unint64_t v3 = sub_2179E29D0();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2179E2CD0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_17;
  }
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x21D451D80](i, v3);
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      char v7 = v6;
      id v8 = objc_msgSend(v6, sel_colorString);
      if (v8)
      {
        uint64_t v9 = v8;
        sub_2179E2930();

        id v10 = _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
        swift_bridgeObjectRelease();
        MEMORY[0x21D4513B0](v10);
        uint64_t v11 = swift_retain();
        MEMORY[0x21D451AA0](v11);
        if (*(void *)(v12 + 16) >= *(void *)(v12 + 24) >> 1) {
          sub_2179E29F0();
        }
        sub_2179E2A00();
        sub_2179E29E0();

        swift_release();
      }
      else
      {
      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for TPSUIAppController()
{
  return self;
}

id _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0()
{
  if (sub_2179E29A0())
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2179E2980();
  }
  switch(sub_21798F138())
  {
    case 1u:
      id v0 = objc_msgSend(self, sel_systemBlueColor);
      goto LABEL_22;
    case 2u:
      id v0 = objc_msgSend(self, sel_systemBrownColor);
      goto LABEL_22;
    case 3u:
      id v0 = objc_msgSend(self, sel_systemCyanColor);
      goto LABEL_22;
    case 4u:
      id v0 = objc_msgSend(self, sel_systemGrayColor);
      goto LABEL_22;
    case 5u:
      id v0 = objc_msgSend(self, sel_systemGreenColor);
      goto LABEL_22;
    case 6u:
      id v0 = objc_msgSend(self, sel_systemIndigoColor);
      goto LABEL_22;
    case 7u:
      id v0 = objc_msgSend(self, sel_systemMintColor);
      goto LABEL_22;
    case 8u:
      id v0 = objc_msgSend(self, sel_systemOrangeColor);
      goto LABEL_22;
    case 9u:
      id v0 = objc_msgSend(self, sel_systemPinkColor);
      goto LABEL_22;
    case 0xAu:
      id v0 = objc_msgSend(self, sel_systemPurpleColor);
      goto LABEL_22;
    case 0xBu:
      id v0 = objc_msgSend(self, sel_systemRedColor);
      goto LABEL_22;
    case 0xCu:
      id v0 = objc_msgSend(self, sel_systemTealColor);
      goto LABEL_22;
    case 0xDu:
      id v0 = objc_msgSend(self, sel_systemYellowColor);
      goto LABEL_22;
    case 0xEu:
      id v0 = objc_msgSend(self, sel_linkColor);
      goto LABEL_22;
    case 0xFu:
      sub_2179A5A28();
      sub_2179E2220();
      return (id)sub_2179E2BA0();
    case 0x10u:
      id v0 = objc_msgSend(self, sel_labelColor);
      goto LABEL_22;
    default:
      id v0 = objc_msgSend(self, sel_secondaryLabelColor);
LABEL_22:
      return v0;
  }
}

uint64_t sub_21798F138()
{
  unint64_t v0 = sub_2179E2D30();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10) {
    return 16;
  }
  else {
    return v0;
  }
}

unint64_t sub_21798F184()
{
  unint64_t result = qword_26ACF75C0;
  if (!qword_26ACF75C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF75C0);
  }
  return result;
}

uint64_t sub_21798F1C4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v34 = a1;
  uint64_t v41 = a3;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7588) - 8;
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (uint64_t)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_2179E2440();
  uint64_t v4 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  id v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7578);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7560);
  MEMORY[0x270FA5388](v31);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_2179E1C20();
  uint64_t v13 = sub_2179E1D20();
  uint64_t v40 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v36 = (uint64_t)&v31 - v16;
  uint64_t v17 = swift_bridgeObjectRetain();
  MEMORY[0x21D4514F0](v17);
  sub_2179E1CB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75F0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2179E5C80;
  sub_2179E2260();
  uint64_t v19 = sub_2179E2280();
  swift_release();
  *(void *)(v18 + 32) = v19;
  sub_2179E2260();
  uint64_t v20 = sub_2179E2280();
  swift_release();
  *(void *)(v18 + 40) = v20;
  *(void *)&long long v46 = v18;
  sub_2179E29E0();
  MEMORY[0x21D4514F0](v46);
  sub_2179E1CB0();
  uint64_t v21 = v32;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B968], v32);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v10[*(int *)(v8 + 44)], v6, v21);
  long long v22 = v47;
  *(_OWORD *)id v10 = v46;
  *((_OWORD *)v10 + 1) = v22;
  *((void *)v10 + 4) = v48;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v21);
  LOBYTE(v6) = sub_2179E2010();
  uint64_t v23 = v38;
  sub_21798B2E8((uint64_t)v10, v38, &qword_26ACF7578);
  *(unsigned char *)(v23 + *(int *)(v39 + 44)) = (_BYTE)v6;
  sub_21798B2E8(v23, (uint64_t)&v12[*(int *)(v31 + 36)], &qword_26ACF7588);
  long long v24 = v44[1];
  *(_OWORD *)uint64_t v12 = v44[0];
  *((_OWORD *)v12 + 1) = v24;
  *((void *)v12 + 4) = v45;
  swift_bridgeObjectRetain();
  sub_21798B28C(v23, &qword_26ACF7588);
  sub_21798B28C((uint64_t)v10, &qword_26ACF7578);
  sub_21798FB64((uint64_t)v44);
  type metadata accessor for TipGradientView();
  unint64_t v25 = sub_21798F814();
  uint64_t v26 = (uint64_t)v33;
  sub_2179E21F0();
  sub_21798B28C((uint64_t)v12, &qword_26ACF7560);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v42 = v25;
  uint64_t v43 = WitnessTable;
  swift_getWitnessTable();
  uint64_t v28 = v36;
  sub_21798F890(v26, v13, v36);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v29(v26, v13);
  sub_21798F890(v28, v13, v41);
  return ((uint64_t (*)(uint64_t, uint64_t))v29)(v28, v13);
}

void TipGradientView.init(_:startPoint:endPoint:gradientView:)(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  sub_21798EC3C(a1);
  *(void *)(a3 + 32) = v13;
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(double *)(a3 + 24) = a7;
  type metadata accessor for TipGradientView();
  a2();
}

uint64_t type metadata accessor for TipGradientView()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_21798F814()
{
  unint64_t result = qword_26ACF7558;
  if (!qword_26ACF7558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7560);
    sub_217991440();
    sub_21799129C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7558);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  sub_217986828(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  sub_217986828(*(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  sub_21799AC18(*(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned __int8 *)(v0 + 64), *(unsigned char *)(v0 + 65));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 129, 7);
}

uint64_t objectdestroyTm_0()
{
  if (*(void *)(v0 + 32))
  {
    swift_release();
    swift_release();
  }
  if (*(void *)(v0 + 56))
  {
    swift_release();
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_2179E1810();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

uint64_t sub_21798FB64(uint64_t a1)
{
  return a1;
}

uint64_t TipGradientView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7560);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v34 = a1;
  uint64_t v38 = v4;
  sub_2179E1C20();
  uint64_t v6 = sub_2179E1D20();
  unint64_t v42 = sub_21798F814();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v36 = v6;
  uint64_t v7 = sub_2179E23B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t v20 = sub_2179E1F70();
  uint64_t v37 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  long long v24 = (char *)&v32 - v23;
  if (*(void *)(*(void *)(v2 + 32) + 16))
  {
    MEMORY[0x270FA5388](v21);
    uint64_t v25 = v8;
    uint64_t v26 = v38;
    *(&v32 - 4) = v5;
    *(&v32 - 3) = v26;
    *(&v32 - 2) = v27;
    sub_2179E2420();
    sub_2179E23A0();
    swift_getWitnessTable();
    sub_21798F890((uint64_t)v11, v7, (uint64_t)v14);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
    v28(v11, v7);
    sub_21798F890((uint64_t)v14, v7, (uint64_t)v11);
    sub_21799006C((uint64_t)v11, v5, v7);
    v28(v11, v7);
    v28(v14, v7);
  }
  else
  {
    uint64_t v26 = v38;
    sub_21798F890(v22 + *(int *)(v34 + 44), v5, (uint64_t)v19);
    sub_21798F890((uint64_t)v19, v5, (uint64_t)v17);
    swift_getWitnessTable();
    sub_2179AAA3C((uint64_t)v17, v5);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v33 + 8);
    v29(v17, v5);
    v29(v19, v5);
  }
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v40 = v26;
  uint64_t v41 = v30;
  swift_getWitnessTable();
  sub_21798F890((uint64_t)v24, v20, v39);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v24, v20);
}

uint64_t sub_217990034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_21799006C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2179E1F50();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_2179E1F60();
}

uint64_t sub_217990164(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 49);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  sub_217986828(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_217986828(v2, v3);
  sub_21799AC18(v4, v5, v7, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t destroy for RemoteVideoView(uint64_t a1)
{
  sub_217986828(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_217986828(*(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  sub_21799AC18(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned char *)(a1 + 49));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_2179902A4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2179902B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result = swift_retain();
  if ((a8 & 1) == 0)
  {
    sub_2179902A4(a4);
    return sub_2179902A4(a6);
  }
  return result;
}

double sub_217990334@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2179E22F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v32 = *(_OWORD *)(a1 + 56);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  sub_217990764((uint64_t)&v32);
  uint64_t v8 = (void *)v27;
  if (BYTE8(v27))
  {
    sub_2179906C8((void *)v27, SBYTE8(v27));
    uint64_t v22 = sub_2179E2250();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    char v26 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B10);
    sub_2179906E4((unint64_t *)&qword_26ACF6B08, &qword_26ACF6B10, (void (*)(void))sub_2179913A0);
    sub_2179E1F60();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
    swift_retain();
    uint64_t v9 = sub_2179E2320();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v10 = *(void *)a1;
    char v11 = *(unsigned char *)(a1 + 8);
    sub_21798EA90(a1);
    sub_21798CC74(v10, v11);
    char v12 = sub_217986F90(v10, v11);
    sub_217986828(v10, v11);
    sub_217990164(a1);
    uint64_t v13 = swift_allocObject();
    long long v14 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v13 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v13 + 96) = v14;
    *(_OWORD *)(v13 + 112) = *(_OWORD *)(a1 + 96);
    *(unsigned char *)(v13 + 128) = *(unsigned char *)(a1 + 112);
    long long v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v13 + 32) = v15;
    long long v16 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v13 + 64) = v16;
    uint64_t v22 = v9;
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = ((unint64_t)(v12 & 1) << 8) | 1;
    *(void *)&long long v24 = sub_217991CE8;
    *((void *)&v24 + 1) = v13;
    long long v25 = 0uLL;
    char v26 = 0;
    swift_retain();
    swift_retain();
    sub_21798EA90(a1);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B10);
    sub_2179906E4((unint64_t *)&qword_26ACF6B08, &qword_26ACF6B10, (void (*)(void))sub_2179913A0);
    sub_2179E1F60();
    sub_2179906C8(v8, 0);
    sub_2179906C8(v8, 0);
    swift_release_n();
    swift_release_n();
  }
  double result = *(double *)&v27;
  long long v18 = v28;
  long long v19 = v29;
  uint64_t v20 = v30;
  char v21 = v31;
  *(_OWORD *)a2 = v27;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v19;
  *(void *)(a2 + 48) = v20;
  *(unsigned char *)(a2 + 56) = v21;
  return result;
}

void sub_2179906C8(void *a1, char a2)
{
  if (a2 == 1)
  {
  }
  else if (!a2)
  {
    swift_release();
  }
}

uint64_t sub_2179906E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_217990764(uint64_t a1)
{
  return a1;
}

double sub_217990790(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2179E1E10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2179E2AC0();
  uint64_t v9 = sub_2179E2000();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v14 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_2179C5094(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_217984000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4527D0](v11, -1, -1);
    MEMORY[0x21D4527D0](v10, -1, -1);
  }

  sub_2179E1E00();
  swift_getAtKeyPath();
  sub_217986828(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_217990970(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)a1;
  sub_217990A90(v2, v3);
  sub_217990A90(v4, v5);
  return a1;
}

void sub_2179909E4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a3)
  {
    id v16 = a3;
    sub_217990A90(a4, a5);
    sub_217990A90(a7, a8);
    sub_2179902A4(a10);
    sub_2179902A4(a12);
  }
}

uint64_t sub_217990A90(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t RemoteVideoView.init(viewModel:showReplayButtonAtVideoEnd:isImageLoaded:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X5>, char a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v12 = swift_getKeyPath();
  uint64_t v13 = swift_getKeyPath();
  type metadata accessor for DocumentAssetViewModel();
  sub_21799AE28((unint64_t *)&qword_26ACF6A18, (void (*)(uint64_t))type metadata accessor for DocumentAssetViewModel);
  swift_retain();
  uint64_t v14 = sub_2179E1CC0();
  uint64_t v16 = v15;
  if (a5)
  {
    uint64_t result = swift_release();
    char v18 = a6 & 1;
  }
  else
  {
    sub_2179E23D0();
    uint64_t result = swift_release();
    a4 = v22;
    a5 = v23;
    char v18 = v24;
  }
  *(void *)a7 = KeyPath;
  *(unsigned char *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = v12;
  *(unsigned char *)(a7 + 24) = 0;
  *(void *)(a7 + 32) = v13;
  *(void *)(a7 + 40) = 0;
  *(_WORD *)(a7 + 48) = 0;
  *(void *)(a7 + 56) = v14;
  *(void *)(a7 + 64) = v16;
  *(void *)(a7 + 72) = a4;
  *(void *)(a7 + 80) = a5;
  *(unsigned char *)(a7 + 88) = v18;
  *(void *)(a7 + 96) = a1;
  *(void *)(a7 + 104) = a2;
  *(unsigned char *)(a7 + 112) = a3 & 1;
  return result;
}

uint64_t sub_217990C38@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DocumentAssetViewModel();
  uint64_t result = sub_2179E1A40();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for DocumentAssetViewModel()
{
  uint64_t result = qword_26ACF70D8;
  if (!qword_26ACF70D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_217990CC4()
{
  unint64_t result = qword_26ACF6A18;
  if (!qword_26ACF6A18)
  {
    type metadata accessor for DocumentAssetViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6A18);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

char *keypath_get_selector_timeControlStatus()
{
  return sel_timeControlStatus;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

char *keypath_get_selector_rate()
{
  return sel_rate;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_2179911FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

unint64_t sub_217991240()
{
  unint64_t result = qword_26ACF6B38;
  if (!qword_26ACF6B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6B38);
  }
  return result;
}

unint64_t sub_21799129C()
{
  unint64_t result = qword_26ACF7580;
  if (!qword_26ACF7580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7580);
  }
  return result;
}

uint64_t sub_2179912F8()
{
  return sub_2179E1E30();
}

unint64_t sub_217991344()
{
  unint64_t result = qword_26ACF6B28;
  if (!qword_26ACF6B28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6B28);
  }
  return result;
}

unint64_t sub_2179913A0()
{
  unint64_t result = qword_26ACF7568;
  if (!qword_26ACF7568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7568);
  }
  return result;
}

uint64_t sub_217991414(uint64_t a1)
{
  return a1;
}

unint64_t sub_217991440()
{
  unint64_t result = qword_26ACF7550;
  if (!qword_26ACF7550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7550);
  }
  return result;
}

void sub_217991494()
{
  if (!qword_26ACF7528)
  {
    unint64_t v0 = sub_2179E1B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACF7528);
    }
  }
}

void sub_2179914EC()
{
  if (!qword_26ACF7508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6D90);
    unint64_t v0 = sub_2179E1B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACF7508);
    }
  }
}

void sub_217991548()
{
  if (!qword_26ACF74F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6D88);
    unint64_t v0 = sub_2179E1B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACF74F8);
    }
  }
}

unint64_t sub_2179915A4()
{
  unint64_t result = qword_26ACF6A30;
  if (!qword_26ACF6A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6A30);
  }
  return result;
}

unint64_t sub_2179915F8()
{
  unint64_t result = qword_26ACF6A28;
  if (!qword_26ACF6A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6A28);
  }
  return result;
}

uint64_t sub_21799164C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2179915F8();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_2179916B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2179915F8();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

void sub_217991718(char *a1, uint64_t a2)
{
  sub_217988EB8(a1, a2, *v2);
}

char *sub_217991720(uint64_t a1)
{
  return sub_21798979C(a1, *(void **)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

unint64_t sub_217991734()
{
  unint64_t result = qword_26ACF6A20;
  if (!qword_26ACF6A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6A20);
  }
  return result;
}

void sub_217991788(void *a1@<X8>)
{
  *a1 = 0x3FF0000000000000;
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.playVideo()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816))();
}

uint64_t sub_2179917F4()
{
  return sub_217987CA8();
}

uint64_t sub_217991808()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_217991814()
{
  return sub_217988074();
}

uint64_t sub_21799181C(void **a1)
{
  return sub_217988FB8(a1);
}

uint64_t dispatch thunk of DocumentAssetViewModel.load()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

void sub_217991850(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t (*sub_217991880())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179918DC()
{
  return sub_217987A84();
}

uint64_t (*sub_2179918E4())()
{
  return j__swift_endAccess;
}

void sub_217991988()
{
  sub_217991548();
  if (v0 <= 0x3F)
  {
    sub_217986C0C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_217991A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_217991A90()
{
  sub_2179914EC();
  if (v0 <= 0x3F)
  {
    sub_217986C0C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_217991B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t sub_217991B98(uint64_t a1)
{
  return sub_217987718(a1, v1 + 16);
}

float *sub_217991BA0(float *a1)
{
  return sub_217991BA8(a1, v1 + 16);
}

float *sub_217991BA8(float *result, uint64_t a2)
{
  if (*result > 0.0)
  {
    if (*(void *)(a2 + 16))
    {
      swift_retain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B68);
      sub_2179E23C0();
      swift_release();
      return (float *)swift_release();
    }
  }
  return result;
}

uint64_t sub_217991C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_21798ACA4(a1);
}

uint64_t sub_217991C80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217991C9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217991CE0()
{
  return sub_217988D7C(v0 + 16);
}

uint64_t sub_217991CF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217991D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_217991D64(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2179AB8FC(a1, a2);
  }
  return a1;
}

void sub_217992384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217992630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_217993BC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v3 - 160), 8);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_217994FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217995CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217996E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_21799817C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_217998A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217998D64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void static Array.colorsFromGradient(_:)(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v12 = MEMORY[0x263F8EE78];
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_stops);
  sub_21798F184();
  unint64_t v3 = sub_2179E29D0();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2179E2CD0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_17;
  }
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x21D451D80](i, v3);
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_colorString);
      if (v8)
      {
        uint64_t v9 = v8;
        sub_2179E2930();

        id v10 = _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
        swift_bridgeObjectRelease();
        MEMORY[0x21D4513B0](v10);
        uint64_t v11 = swift_retain();
        MEMORY[0x21D451AA0](v11);
        if (*(void *)(v12 + 16) >= *(void *)(v12 + 24) >> 1) {
          sub_2179E29F0();
        }
        sub_2179E2A00();
        sub_2179E29E0();

        swift_release();
      }
      else
      {
      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21799975C(uint64_t a1, uint64_t a2)
{
  return sub_217999FD8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_217999788()
{
  return MEMORY[0x270EF17B0](*v0);
}

uint64_t sub_217999790(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x21D450A80](a1, &v6);
  char v4 = v7;
  uint64_t v5 = v6;
  if (v7) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_2179997E4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x21D450A90](a1, &v7);
  char v4 = v8;
  uint64_t v5 = v7;
  if (v8) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_21799983C(double *a1@<X8>)
{
  *a1 = MEMORY[0x21D450AA0]();
}

uint64_t sub_217999864()
{
  return sub_2179E19E0();
}

uint64_t sub_2179998B0()
{
  return sub_2179E19D0();
}

uint64_t sub_217999908()
{
  return sub_2179E2E30();
}

void sub_217999970(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21799997C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2179E2910();
  *a2 = 0;
  return result;
}

uint64_t sub_2179999F4(uint64_t a1, id *a2)
{
  char v3 = sub_2179E2920();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_217999A74@<X0>(uint64_t *a1@<X8>)
{
  sub_2179E2930();
  uint64_t v2 = sub_2179E2900();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217999AC0()
{
  sub_21799A320((unint64_t *)&qword_267BA61D0, type metadata accessor for AttributeName);
  sub_21799A320(&qword_267BA61D8, type metadata accessor for AttributeName);

  return sub_2179E2D20();
}

uint64_t sub_217999B7C()
{
  swift_getWitnessTable();

  return sub_2179E19C0();
}

uint64_t sub_217999BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2179E2930();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_217999C14()
{
  sub_21799A320(&qword_267BA6210, type metadata accessor for TextStyle);
  sub_21799A320(&qword_267BA6218, type metadata accessor for TextStyle);

  return sub_2179E2D20();
}

void *sub_217999CD0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

double sub_217999CE0@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_217999CEC()
{
  return sub_2179E2D20();
}

uint64_t sub_217999DB4()
{
  sub_21799A320(&qword_267BA61A8, type metadata accessor for TPSAnimationSource);
  sub_21799A320(&qword_267BA61B0, type metadata accessor for TPSAnimationSource);

  return sub_2179E2D20();
}

uint64_t sub_217999E70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2179E2900();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_217999EB8()
{
  sub_21799A320(&qword_26ACF7798, type metadata accessor for Key);
  sub_21799A320(&qword_267BA6220, type metadata accessor for Key);

  return sub_2179E2D20();
}

uint64_t sub_217999F74(uint64_t a1, uint64_t a2)
{
  return sub_217999FD8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_217999F8C()
{
  return MEMORY[0x270F9DDC0](*v0);
}

uint64_t sub_217999F94()
{
  return sub_2179E2E20();
}

uint64_t sub_217999FC8(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return MEMORY[0x270F9FC40](a1, v2);
}

uint64_t sub_217999FD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2179E2930();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21799A01C()
{
  sub_2179E2930();
  sub_2179E2960();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21799A070()
{
  sub_2179E2930();
  sub_2179E2E00();
  sub_2179E2960();
  uint64_t v0 = sub_2179E2E30();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_21799A0E4(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21799A0F8()
{
  uint64_t v0 = sub_2179E2930();
  uint64_t v2 = v1;
  if (v0 == sub_2179E2930() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2179E2D50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for SymbolScale(uint64_t a1)
{
}

void type metadata accessor for NSLineBreakMode(uint64_t a1)
{
}

void type metadata accessor for NSTextAlignment(uint64_t a1)
{
}

void type metadata accessor for TPSAnimationSource(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_21799A1F8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21799A218(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

uint64_t sub_21799A290()
{
  return sub_21799A320(&qword_267BA6150, type metadata accessor for AttributeName);
}

uint64_t sub_21799A2D8()
{
  return sub_21799A320(&qword_267BA6158, type metadata accessor for AttributeName);
}

uint64_t sub_21799A320(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21799A368()
{
  return sub_21799A320(&qword_267BA6160, type metadata accessor for CFString);
}

uint64_t sub_21799A3B0()
{
  return sub_21799A320(&qword_267BA6168, type metadata accessor for CFString);
}

uint64_t sub_21799A3F8()
{
  return sub_21799A320(&qword_267BA6170, type metadata accessor for Weight);
}

uint64_t sub_21799A440()
{
  return sub_21799A320(&qword_267BA6178, type metadata accessor for Weight);
}

uint64_t sub_21799A488()
{
  return sub_21799A320(&qword_267BA6180, type metadata accessor for Weight);
}

uint64_t sub_21799A4D0()
{
  return sub_21799A320(&qword_267BA6188, type metadata accessor for TPSAnimationSource);
}

uint64_t sub_21799A518()
{
  return sub_21799A320(&qword_267BA6190, type metadata accessor for TPSAnimationSource);
}

uint64_t sub_21799A560()
{
  return sub_21799A320(&qword_267BA6198, type metadata accessor for TPSAnimationSource);
}

uint64_t sub_21799A5A8()
{
  return sub_21799A320(&qword_267BA61A0, type metadata accessor for AttributeName);
}

unint64_t sub_21799A5F0()
{
  unint64_t result = qword_267BA61C8;
  if (!qword_267BA61C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA61C8);
  }
  return result;
}

void type metadata accessor for TextStyle(uint64_t a1)
{
}

void type metadata accessor for TPSConstellationContentParserPersonalizedTextProviderType(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_21799A680()
{
  return sub_21799A320(&qword_267BA61E8, type metadata accessor for Key);
}

uint64_t sub_21799A6C8()
{
  return sub_21799A320(&qword_267BA61F0, type metadata accessor for Key);
}

uint64_t sub_21799A710()
{
  return sub_21799A320(&qword_267BA61F8, type metadata accessor for TextStyle);
}

uint64_t sub_21799A758()
{
  return sub_21799A320(&qword_267BA6200, type metadata accessor for TextStyle);
}

uint64_t sub_21799A7A0()
{
  return sub_21799A320(&qword_267BA6208, type metadata accessor for TextStyle);
}

uint64_t sub_21799A7E8()
{
  return sub_21799A320(&qword_26ACF77A0, type metadata accessor for Key);
}

uint64_t sub_21799A848()
{
  return sub_2179E2190();
}

uint64_t sub_21799A864@<X0>(unsigned char *a1@<X8>)
{
  sub_217986DF4();
  uint64_t result = sub_2179E1E20();
  *a1 = v3;
  return result;
}

uint64_t sub_21799A8B4()
{
  return sub_2179E1E30();
}

uint64_t sub_21799A900@<X0>(uint64_t a1@<X8>)
{
  sub_21799AEDC();
  uint64_t result = sub_2179E1E20();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_21799A958()
{
  return sub_2179E1E30();
}

double sub_21799A9C8@<D0>(double *a1@<X8>)
{
  sub_217991734();
  sub_2179E1E20();
  double result = v3;
  *a1 = v3;
  return result;
}

double sub_21799AA18@<D0>(double *a1@<X8>)
{
  sub_217991734();
  sub_2179E1E20();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_21799AA68()
{
  return sub_2179E1E30();
}

uint64_t sub_21799AAB4()
{
  return sub_2179E1E30();
}

uint64_t sub_21799AB00@<X0>(uint64_t a1@<X8>)
{
  sub_21799AEDC();
  uint64_t result = sub_2179E1E20();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_21799AB5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void **)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v7 = *(void *)(a1 + 128);
  uint64_t v8 = *(void *)(a1 + 136);
  uint64_t v9 = *(void *)(a1 + 144);
  long long v11 = *(_OWORD *)(a1 + 168);
  long long v12 = *(_OWORD *)(a1 + 152);
  sub_21798E07C(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72));
  sub_21798E3B0(v2, v3, v4, v5, v6, v7, v8, v9, v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1));
  return a1;
}

uint64_t sub_21799AC18(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_21799AC58(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    swift_retain();
  }

  return swift_retain();
}

uint64_t initializeBufferWithCopyOfBuffer for RemoteVideoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy113_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for RemoteVideoView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_217986828(v6, v7);
  char v8 = *((unsigned char *)a2 + 24);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = v8;
  sub_217986828(v9, v10);
  char v11 = *((unsigned char *)a2 + 48);
  char v12 = *((unsigned char *)a2 + 49);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(unsigned char *)(a1 + 49);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  uint64_t v16 = *(unsigned __int8 *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 49) = v12;
  sub_21799AC18(v13, v14, v16, v15);
  *(void *)(a1 + 56) = a2[7];
  swift_release();
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
  swift_release();
  *(void *)(a1 + 80) = a2[10];
  swift_release();
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
  swift_release();
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  return a1;
}

uint64_t sub_21799ADDC()
{
  return sub_2179906E4(&qword_26ACF6AF8, &qword_26ACF6B00, (void (*)(void))sub_2179878AC);
}

uint64_t sub_21799AE28(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_21799AE80@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*result + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
  return result;
}

uint64_t sub_21799AE9C(unsigned __int8 *a1)
{
  return sub_2179A22C4(*a1);
}

unint64_t sub_21799AEDC()
{
  unint64_t result = qword_267BA6228;
  if (!qword_267BA6228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6228);
  }
  return result;
}

id static TPSAnalyticsEventContentViewed.analyticsViewMode(forTraitCollection:)(void *a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_analyticsViewModeForInterfaceStyle_, objc_msgSend(a1, sel_userInterfaceStyle));

  return v1;
}

id sub_21799AF94(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, sel_analyticsViewModeForInterfaceStyle_, objc_msgSend(v4, sel_userInterfaceStyle));

  return v5;
}

id static TPSAnalyticsEventContentViewed.analyticsViewMode(forInterfaceStyle:)(uint64_t a1)
{
  id v1 = (id *)MEMORY[0x263F7F670];
  long long v2 = (id *)MEMORY[0x263F7F668];
  if (a1 != 2) {
    long long v2 = (id *)MEMORY[0x263F7F678];
  }
  if (a1 != 1) {
    id v1 = v2;
  }
  return *v1;
}

id sub_21799B030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v3 = (id *)MEMORY[0x263F7F670];
  id v4 = (id *)MEMORY[0x263F7F668];
  if (a3 != 2) {
    id v4 = (id *)MEMORY[0x263F7F678];
  }
  if (a3 != 1) {
    long long v3 = v4;
  }
  return *v3;
}

uint64_t TPSAppSearchQuery.Origin.description.getter(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t result = sub_2179E2D80();
    __break(1u);
  }
  else
  {
    return sub_2179E2930();
  }
  return result;
}

unint64_t TPSAppSearchQuery.Origin.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

BOOL sub_21799B0DC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21799B0F0()
{
  return sub_2179E2E30();
}

uint64_t sub_21799B138()
{
  return sub_2179E2E10();
}

uint64_t sub_21799B164()
{
  return sub_2179E2E30();
}

uint64_t *sub_21799B1A8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

uint64_t sub_21799B1C4()
{
  if (*v0 >= 3uLL)
  {
    uint64_t result = sub_2179E2D80();
    __break(1u);
  }
  else
  {
    return sub_2179E2930();
  }
  return result;
}

uint64_t TPSAppSearchQuery.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSAppSearchQuery_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21799B410()
{
  uint64_t v1 = sub_2179E2820();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = sub_2179E2800();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_21799B5B0()
{
  return swift_endAccess();
}

uint64_t sub_21799B618@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2179E2820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_2179E2800();
  uint64_t v11 = v10;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_21799B738()
{
  return swift_endAccess();
}

void (*sub_21799B7AC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  swift_beginAccess();
  v2[7] = sub_2179E27F0();
  return sub_21799B828;
}

void sub_21799B828(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  swift_endAccess();

  free(v1);
}

uint64_t sub_21799B8C8()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSAppSearchQuery_origin;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21799B95C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___TPSAppSearchQuery_origin);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21799B9A8())()
{
  return j__swift_endAccess;
}

id TPSAppSearchQuery.__allocating_init(searchTerm:origin:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return TPSAppSearchQuery.init(searchTerm:origin:identifier:)(a1, a2, a3, a4, a5);
}

id TPSAppSearchQuery.init(searchTerm:origin:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = a4;
  uint64_t v26 = a3;
  uint64_t v7 = sub_2179E1890();
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2179E2820();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v5[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  char v15 = v5;
  sub_2179E27E0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  uint64_t v16 = &v15[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(void *)&v15[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_2179E27E0();
  swift_endAccess();
  swift_beginAccess();
  *(void *)uint64_t v16 = v26;
  if (a5)
  {
    uint64_t v17 = v25;
  }
  else
  {
    sub_2179E1880();
    uint64_t v17 = sub_2179E1870();
    a5 = v18;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  }
  long long v19 = (uint64_t *)&v15[OBJC_IVAR___TPSAppSearchQuery_identifier];
  *long long v19 = v17;
  v19[1] = a5;

  uint64_t v20 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  v27.receiver = v15;
  v27.super_class = v20;
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t type metadata accessor for TPSAppSearchQuery()
{
  uint64_t result = qword_26ACF69D8;
  if (!qword_26ACF69D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21799BDE4()
{
  v1[187] = v0;
  uint64_t v2 = sub_2179E2820();
  v1[193] = v2;
  v1[199] = *(void *)(v2 - 8);
  v1[205] = swift_task_alloc();
  uint64_t v3 = sub_2179E1890();
  v1[211] = v3;
  v1[212] = *(void *)(v3 - 8);
  v1[213] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21799BF00, 0, 0);
}

uint64_t sub_21799BF00()
{
  uint64_t v1 = v0[213];
  uint64_t v2 = v0[212];
  uint64_t v3 = v0[211];
  uint64_t v4 = v0[205];
  uint64_t v5 = v0[199];
  uint64_t v6 = v0[193];
  uint64_t v7 = (char *)v0[187];
  uint64_t v25 = v3;
  sub_2179E1880();
  sub_2179E1870();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v24(v1, v3);
  uint64_t v8 = &v7[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  swift_beginAccess();
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 16);
  uint64_t v21 = v6;
  v23(v4, v8, v6);
  sub_2179E2800();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v22(v4, v6);
  uint64_t v9 = (objc_class *)sub_2179E25C0();
  id v10 = objc_allocWithZone(v9);
  uint64_t v11 = (void *)sub_2179E2590();
  v0[214] = v11;
  sub_2179E1880();
  sub_2179E1870();
  v24(v1, v25);
  v23(v4, v8, v21);
  sub_2179E2800();
  v22(v4, v21);
  id v12 = objc_allocWithZone(v9);
  uint64_t v13 = (void *)sub_2179E2590();
  v0[215] = v13;
  uint64_t v14 = swift_allocObject();
  v0[216] = v14;
  *(void *)(v14 + 16) = v7;
  *(void *)(v14 + 24) = v11;
  char v15 = v7;
  id v16 = v11;
  swift_retain();
  sub_2179E2670();
  swift_asyncLet_begin();
  uint64_t v17 = swift_allocObject();
  v0[217] = v17;
  *(void *)(v17 + 16) = v15;
  *(void *)(v17 + 24) = v13;
  uint64_t v18 = v15;
  id v19 = v13;
  swift_retain();
  swift_asyncLet_begin();
  return MEMORY[0x270FA23E8](v0 + 82, v0 + 175, sub_21799C21C, v0 + 182);
}

uint64_t sub_21799C21C()
{
  v1[218] = v0;
  if (v0)
  {
    return MEMORY[0x270FA23D8](v1 + 2, v1 + 181, sub_21799C520, v1 + 176);
  }
  else
  {
    uint64_t v2 = (void *)v1[175];
    v1[219] = v2;
    id v3 = v2;
    return MEMORY[0x270FA23E8](v1 + 2, v1 + 181, sub_21799C2E8, v1 + 170);
  }
}

uint64_t sub_21799C2E8()
{
  v1[220] = v0;
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_21799C688, 0, 0);
  }
  else
  {
    uint64_t v2 = (void *)v1[181];
    v1[221] = v2;
    id v3 = v2;
    return MEMORY[0x270FA23D8](v1 + 2, v1 + 181, sub_21799C3B0, v1 + 188);
  }
}

uint64_t sub_21799C3B0()
{
  return MEMORY[0x270FA2498](sub_21799C3CC, 0, 0);
}

uint64_t sub_21799C3CC()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 1400, sub_21799C44C, v0 + 1296);
}

uint64_t sub_21799C44C()
{
  return MEMORY[0x270FA2498](sub_21799C468, 0, 0);
}

uint64_t sub_21799C468()
{
  uint64_t v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 1768);
  uint64_t v4 = *(void *)(v0 + 1752);
  return v2(v4, v3);
}

uint64_t sub_21799C520()
{
  return MEMORY[0x270FA2498](sub_21799C53C, 0, 0);
}

uint64_t sub_21799C53C()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 1400, sub_21799C5BC, v0 + 1552);
}

uint64_t sub_21799C5BC()
{
  return MEMORY[0x270FA2498](sub_21799C5D8, 0, 0);
}

uint64_t sub_21799C5D8()
{
  uint64_t v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21799C688()
{
  return MEMORY[0x270FA23D8](v0 + 16, v0 + 1448, sub_21799C708, v0 + 1648);
}

uint64_t sub_21799C708()
{
  return MEMORY[0x270FA2498](sub_21799C724, 0, 0);
}

uint64_t sub_21799C724()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 656, v0 + 1400, sub_21799C7A4, v0 + 1600);
}

uint64_t sub_21799C7A4()
{
  return MEMORY[0x270FA2498](sub_21799C7C0, 0, 0);
}

uint64_t sub_21799C7C0()
{
  uint64_t v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21799C870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  void *v5 = v3;
  v5[1] = sub_21799C908;
  return sub_21799E4B0(a3);
}

uint64_t sub_21799C908(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_21799ED74, 0, 0);
  }
}

uint64_t sub_21799CA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  void *v5 = v3;
  v5[1] = sub_21799CAEC;
  return sub_21799E4B0(a3);
}

uint64_t sub_21799CAEC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_21799CC38, 0, 0);
  }
}

uint64_t sub_21799CC38()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21799CDC4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21799CE6C;
  return sub_21799BDE4();
}

uint64_t sub_21799CE6C(void *a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v8 = *(void **)(*v3 + 16);
  uint64_t v9 = *v3;
  swift_task_dealloc();

  id v10 = (void (**)(void, void, void, void))(v7 + 16);
  uint64_t v11 = *(const void **)(v9 + 24);
  if (v4)
  {
    id v12 = (void *)sub_2179E1790();

    (*v10)(v11, 0, 0, v12);
    _Block_release(v11);
  }
  else
  {
    (*v10)(v11, a1, a2, 0);
    _Block_release(v11);
  }
  uint64_t v13 = *(uint64_t (**)(void))(v9 + 8);
  return v13();
}

id TPSAppSearchQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TPSAppSearchQuery.init()()
{
}

id TPSAppSearchQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAppSearchQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21799D168(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_21799ED6C;
  return v6();
}

uint64_t sub_21799D234(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_21799ED6C;
  return v7();
}

uint64_t sub_21799D300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2179E2A80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2179E2A70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21799E360(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2179E2A10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21799D4A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21799D580;
  return v6(a1);
}

uint64_t sub_21799D580()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id _s6TipsUI17TPSAppSearchQueryC04makeE04with6originACXDSS_AC6OriginOtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[1] = a1;
  uint64_t v22 = a3;
  uint64_t v3 = sub_2179E1890();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E2820();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  id v12 = (char *)objc_allocWithZone(v11);
  uint64_t v13 = &v12[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  swift_bridgeObjectRetain();
  uint64_t v14 = v12;
  sub_2179E27E0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v10, v7);
  uint64_t v15 = &v14[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(void *)&v14[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  sub_2179E27E0();
  swift_endAccess();
  swift_beginAccess();
  *(void *)uint64_t v15 = v22;
  sub_2179E1880();
  uint64_t v16 = sub_2179E1870();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v19 = (uint64_t *)&v14[OBJC_IVAR___TPSAppSearchQuery_identifier];
  *id v19 = v16;
  v19[1] = v18;

  v23.receiver = v14;
  v23.super_class = v11;
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t sub_21799D8DC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21799D91C(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_21799ED6C;
  return sub_21799C870(a1, v5, v4);
}

uint64_t sub_21799D9C8(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_21799DA74;
  return sub_21799CA54(a1, v5, v4);
}

uint64_t sub_21799DA74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_21799DB6C()
{
  unint64_t result = qword_267BA6260;
  if (!qword_267BA6260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6260);
  }
  return result;
}

uint64_t sub_21799DBC8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR___TPSAppSearchQuery_origin);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21799DC1C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR___TPSAppSearchQuery_origin);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_21799DC6C()
{
  return type metadata accessor for TPSAppSearchQuery();
}

uint64_t sub_21799DC74()
{
  uint64_t result = sub_2179E2820();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TPSAppSearchQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TPSAppSearchQuery);
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.__allocating_init(searchTerm:origin:identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.execute()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xA0);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21799DF84;
  return v5();
}

uint64_t sub_21799DF84(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

ValueMetadata *type metadata accessor for TPSAppSearchQuery.Origin()
{
  return &type metadata for TPSAppSearchQuery.Origin;
}

uint64_t sub_21799E0A0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21799E0E0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_21799DA74;
  uint64_t v5 = (uint64_t (*)(const void *, void *))&aLk0[*(int *)aLk0];
  return v5(v2, v3);
}

uint64_t sub_21799E190()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_21799ED6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267BA6288 + dword_267BA6288);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_25Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21799E294(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_21799ED6C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267BA6298 + dword_267BA6298);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_21799E360(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21799E3C0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21799E3F8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21799ED6C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BA62A8 + dword_267BA62A8);
  return v6(a1, v4);
}

uint64_t sub_21799E4B0(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = sub_2179E2A40();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21799E580, 0, 0);
}

uint64_t sub_21799E580()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7F600]), sel_init);
  v0[9] = v1;
  sub_2179E2AA0();
  uint64_t v2 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[10] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[11] = v4;
  uint64_t v5 = sub_2179E2670();
  *uint64_t v4 = v0;
  v4[1] = sub_21799E82C;
  return MEMORY[0x270FA2360](v0 + 3, 0, 0, 0xD000000000000010, 0x80000002179E78F0, sub_21799ED64, v3, v5);
}

uint64_t sub_21799E82C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21799EB60;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_21799E948;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21799E948()
{
  uint64_t v1 = *(void **)(v0 + 96);
  uint64_t v2 = *(void **)(v0 + 24);
  sub_2179E2AA0();
  if (v1)
  {
    uint64_t v3 = v1;

    *(void *)(v0 + 16) = v1;
    id v4 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62C0);
    char v5 = swift_dynamicCast();
    uint64_t v6 = *(void **)(v0 + 72);
    if (v5)
    {
      uint64_t v8 = *(void *)(v0 + 56);
      uint64_t v7 = *(void *)(v0 + 64);
      uint64_t v9 = *(void *)(v0 + 40);
      uint64_t v10 = *(void *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v7, v9);
      sub_2179E25A0();
      uint64_t v11 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_cancelQueryWithIdentifier_, v11);

      sub_21799ED0C();
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v8, v9);
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void *))(v0 + 8);
    return v13(v2);
  }
}

uint64_t sub_21799EB60()
{
  swift_task_dealloc();
  uint64_t v1 = *(void **)(v0 + 96);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62C0);
  int v3 = swift_dynamicCast();
  id v4 = *(void **)(v0 + 72);
  if (v3)
  {
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v8 = *(void *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v5, v7);
    sub_2179E25A0();
    uint64_t v9 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_cancelQueryWithIdentifier_, v9);

    sub_21799ED0C();
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

unint64_t sub_21799ED0C()
{
  unint64_t result = qword_267BA62C8;
  if (!qword_267BA62C8)
  {
    sub_2179E2A40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA62C8);
  }
  return result;
}

void sub_21799ED64(uint64_t a1)
{
  sub_2179ABC14(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

double static UIFont.defaultHyphenationFactor.getter()
{
  return 0.2;
}

double static UIFont.widgetTitleScaleFactor.getter()
{
  return 0.65;
}

double static UIFont.widgetBodyScaleFactor.getter()
{
  return 0.7;
}

uint64_t static TipsWorkspace.execute(_:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  int v3 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v42 - v4;
  uint64_t v6 = sub_2179E1810();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v42 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t result = (uint64_t)objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v17 = (void *)result;
    uint64_t v45 = v7;
    id v18 = objc_allocWithZone(MEMORY[0x263F7F618]);
    id v19 = (void *)sub_2179E17C0();
    id v20 = objc_msgSend(v18, sel_initWithURL_, v19);

    if (v20)
    {
      switch((unint64_t)objc_msgSend(v20, sel_actionType))
      {
        case 1uLL:
          id v27 = objc_msgSend(v20, sel_bundleID);
          if (v27)
          {
            long long v28 = v27;
            objc_msgSend(v17, sel_openApplicationWithBundleID_, v27);

            goto LABEL_10;
          }

          goto LABEL_16;
        case 2uLL:
        case 4uLL:
          id v21 = objc_msgSend(v20, sel_URL);
          if (v21)
          {
            uint64_t v22 = v21;
            sub_2179E17D0();

            uint64_t v23 = v45;
            uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
            v24(v5, v13, v6);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v5, 0, 1, v6);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v6) != 1)
            {
              v24(v15, v5, v6);
              uint64_t v25 = (void *)sub_2179E17C0();
              sub_21799F3F0(MEMORY[0x263F8EE78]);
              uint64_t v26 = (void *)sub_2179E28B0();
              swift_bridgeObjectRelease();
              objc_msgSend(v17, sel_openSensitiveURL_withOptions_, v25, v26);

              (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v6);
              goto LABEL_26;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v5, 1, 1, v6);
          }

          uint64_t v34 = (uint64_t)v5;
          goto LABEL_24;
        case 9uLL:
          id v31 = objc_msgSend(v20, sel_bundleID);
          if (v31)
          {
            long long v32 = v31;
            uint64_t v43 = sub_2179E2930();
            uint64_t v44 = v33;
          }
          else
          {
            uint64_t v43 = 0;
            uint64_t v44 = 0;
          }
          id v35 = objc_msgSend(v20, sel_identifier);
          if (v35)
          {
            uint64_t v36 = v35;
            sub_2179E2930();
          }
          id v37 = objc_msgSend(self, sel_mainBundleIdentifier);
          if (v37)
          {
            uint64_t v38 = v37;
            sub_2179E2930();
          }
          sub_2179E28A0();
          sub_2179E2870();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v39 = v45;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v3, 1, v6) == 1)
          {

            uint64_t v34 = (uint64_t)v3;
LABEL_24:
            sub_21799F528(v34);
            uint64_t result = 0;
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v10, v3, v6);
            uint64_t v40 = (void *)sub_2179E17C0();
            sub_21799F3F0(MEMORY[0x263F8EE78]);
            uint64_t v41 = (void *)sub_2179E28B0();
            swift_bridgeObjectRelease();
            objc_msgSend(v17, sel_openSensitiveURL_withOptions_, v40, v41);

            (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v6);
LABEL_26:
            uint64_t result = 1;
          }
          break;
        default:
          long long v29 = (void *)sub_2179E17C0();
          sub_21799F3F0(MEMORY[0x263F8EE78]);
          uint64_t v30 = (void *)sub_2179E28B0();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_openURL_withOptions_, v29, v30);

LABEL_10:
          goto LABEL_26;
      }
    }
    else
    {
LABEL_16:

      return 0;
    }
  }
  return result;
}

unint64_t sub_21799F3F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA68E0);
  uint64_t v2 = sub_2179E2D10();
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
    sub_21798B2E8(v6, (uint64_t)&v15, &qword_267BA62E8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2179B2CDC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21799FA78(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_21799F528(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21799F588(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62E0);
  uint64_t v2 = (void *)sub_2179E2D10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_2179B2DE8((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_21799F694(uint64_t a1)
{
  return sub_21798A914(a1, &qword_267BA62D8);
}

unint64_t sub_21799F6A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62D0);
  uint64_t v2 = (void *)sub_2179E2D10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2179B2CDC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_21799F7B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF77F0);
  uint64_t v2 = sub_2179E2D10();
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
    sub_21798B2E8(v6, (uint64_t)&v13, &qword_26ACF77B0);
    uint64_t v7 = v13;
    unint64_t result = sub_2179B2D54(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_21799FA78(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

void static TipsWorkspace.openApplication(withBundleID:)()
{
  id v0 = objc_msgSend(self, sel_defaultWorkspace);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = (id)sub_2179E2900();
    objc_msgSend(v1, sel_openApplicationWithBundleID_, v2);
  }
}

void static TipsWorkspace.openSensitive(_:)()
{
  id v0 = objc_msgSend(self, sel_defaultWorkspace);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
    objc_msgSend(v2, sel_setSensitive_, 1);
    id v3 = (id)sub_2179E17C0();
    objc_msgSend(v1, sel_openURL_configuration_completionHandler_, v3, v2, 0);
  }
}

ValueMetadata *type metadata accessor for TipsWorkspace()
{
  return &type metadata for TipsWorkspace;
}

_OWORD *sub_21799FA78(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_21799FA88(void *__dst, unsigned __int8 *a2, uint64_t a3)
{
  id v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v5 > 3)
  {
    unint64_t v6 = v5 + 1;
    int v7 = *(_DWORD *)(v4 + 80);
    int v8 = v7 & 0x1000F8;
    goto LABEL_6;
  }
  unsigned int v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  int v7 = *(_DWORD *)(v4 + 80);
  if (v12 > 0xFFFD)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0) {
      goto LABEL_27;
    }
    unsigned int v10 = *(_DWORD *)&a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 < 2) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
  int v8 = v7 & 0x1000F8;
  if (v12 > 0xFD)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0) {
      goto LABEL_27;
    }
    unsigned int v10 = *(unsigned __int16 *)&a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 < 2) {
      goto LABEL_39;
    }
LABEL_29:
    if (v5 <= 3) {
      uint64_t v16 = v5;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_37;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_37;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_37;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_37:
        int v18 = (v17 | (v11 << (8 * v5))) + 2;
        unsigned int v10 = v17 + 2;
        if (v5 < 4) {
          unsigned int v10 = v18;
        }
        break;
      default:
        goto LABEL_39;
    }
    goto LABEL_39;
  }
  unint64_t v6 = v5 + 1;
LABEL_6:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    uint64_t v15 = *(void *)a2;
    *id v3 = *(void *)a2;
    id v3 = (void *)(v15 + (((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)));
    swift_retain();
    return v3;
  }
  unsigned int v10 = a2[v5];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2) {
    goto LABEL_29;
  }
LABEL_39:
  if (v10 == 1)
  {
    uint64_t v20 = *(void *)a2;
    id v21 = *(id *)a2;
    *id v3 = v20;
    if (v5 > 3) {
      goto LABEL_46;
    }
    unsigned int v24 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v24 > 0xFFFD)
    {
      *(_DWORD *)((char *)v3 + v5) = 1;
      return v3;
    }
    if (v24 <= 0xFD) {
LABEL_46:
    }
      *((unsigned char *)v3 + v5) = 1;
    else {
      *(_WORD *)((char *)v3 + v5) = 1;
    }
  }
  else if (v10)
  {
    if (v5 > 3) {
      goto LABEL_51;
    }
    unsigned int v22 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    uint64_t v23 = 2;
    if (v22 > 0xFFFD) {
      uint64_t v23 = 4;
    }
    if (v22 <= 0xFD) {
LABEL_51:
    }
      uint64_t v23 = 1;
    memcpy(__dst, a2, v23 + v5);
  }
  else
  {
    (*(void (**)(void *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      unsigned int v19 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v19 > 0xFFFD)
      {
        *(_DWORD *)((char *)v3 + v5) = 0;
        return v3;
      }
      if (v19 > 0xFD)
      {
        *(_WORD *)((char *)v3 + v5) = 0;
        return v3;
      }
    }
    *((unsigned char *)v3 + v5) = 0;
  }
  return v3;
}

char *sub_21799FDB8(char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (v4 > 3) {
    goto LABEL_5;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFD)
  {
    unsigned int v5 = *(_DWORD *)&a2[v4];
  }
  else
  {
    if (v6 <= 0xFD)
    {
LABEL_5:
      unsigned int v5 = a2[v4];
      goto LABEL_10;
    }
    unsigned int v5 = *(unsigned __int16 *)&a2[v4];
  }
LABEL_10:
  unsigned int v7 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_19;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_19;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_19;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_19:
        int v10 = (v9 | (v7 << (8 * v4))) + 2;
        unsigned int v5 = v9 + 2;
        if (v4 < 4) {
          unsigned int v5 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *(void *)__dst = *(void *)a2;
    if (v4 > 3) {
      goto LABEL_28;
    }
    unsigned int v14 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    if (v14 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v4] = 1;
      return __dst;
    }
    if (v14 <= 0xFD) {
LABEL_28:
    }
      __dst[v4] = 1;
    else {
      *(_WORD *)&__dst[v4] = 1;
    }
  }
  else if (v5)
  {
    if (v4 > 3) {
      goto LABEL_33;
    }
    unsigned int v12 = ((1 << (8 * v4)) + 1) >> (8 * v4);
    uint64_t v13 = 2;
    if (v12 > 0xFFFD) {
      uint64_t v13 = 4;
    }
    if (v12 <= 0xFD) {
LABEL_33:
    }
      uint64_t v13 = 1;
    memcpy(__dst, a2, v13 + v4);
  }
  else
  {
    (*(void (**)(char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(__dst);
    if (v4 <= 3)
    {
      unsigned int v11 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v11 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v4] = 0;
        return __dst;
      }
      if (v11 > 0xFD)
      {
        *(_WORD *)&__dst[v4] = 0;
        return __dst;
      }
    }
    __dst[v4] = 0;
  }
  return __dst;
}

id *sub_2179A0000(id *__dst, id *__src, uint64_t a3)
{
  if (__dst == __src) {
    return __dst;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  if (v7 > 3) {
    goto LABEL_6;
  }
  unsigned int v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    unsigned int v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      unsigned int v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    unsigned int v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  unsigned int v10 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *(unsigned __int8 *)__dst;
        goto LABEL_20;
      case 2:
        int v12 = *(unsigned __int16 *)__dst;
        goto LABEL_20;
      case 3:
        int v12 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
        goto LABEL_20;
      case 4:
        int v12 = *(_DWORD *)__dst;
LABEL_20:
        int v13 = (v12 | (v10 << (8 * v7))) + 2;
        unsigned int v8 = v12 + 2;
        if (v7 < 4) {
          unsigned int v8 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v8 == 1)
  {

    if (v7 > 3) {
      goto LABEL_30;
    }
  }
  else
  {
    if (!v8) {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    if (v7 > 3)
    {
LABEL_30:
      unsigned int v15 = *((unsigned __int8 *)__src + v7);
      unsigned int v16 = v15 - 2;
      if (v15 < 2) {
        goto LABEL_45;
      }
      goto LABEL_35;
    }
  }
  unsigned int v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v14 > 0xFFFD)
  {
    unsigned int v15 = *(_DWORD *)((char *)__src + v7);
    unsigned int v16 = v15 - 2;
    if (v15 < 2) {
      goto LABEL_45;
    }
    goto LABEL_35;
  }
  if (v14 <= 0xFD) {
    goto LABEL_30;
  }
  unsigned int v15 = *(unsigned __int16 *)((char *)__src + v7);
  unsigned int v16 = v15 - 2;
  if (v15 < 2) {
    goto LABEL_45;
  }
LABEL_35:
  if (v7 <= 3) {
    uint64_t v17 = v7;
  }
  else {
    uint64_t v17 = 4;
  }
  switch(v17)
  {
    case 1:
      int v18 = *(unsigned __int8 *)__src;
      goto LABEL_43;
    case 2:
      int v18 = *(unsigned __int16 *)__src;
      goto LABEL_43;
    case 3:
      int v18 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
      goto LABEL_43;
    case 4:
      int v18 = *(_DWORD *)__src;
LABEL_43:
      int v19 = (v18 | (v16 << (8 * v7))) + 2;
      unsigned int v15 = v18 + 2;
      if (v7 < 4) {
        unsigned int v15 = v19;
      }
      break;
    default:
      break;
  }
LABEL_45:
  if (v15 == 1)
  {
    *__dst = *__src;
    if (v7 > 3) {
      goto LABEL_52;
    }
    unsigned int v23 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v23 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v23 <= 0xFD) {
LABEL_52:
    }
      *((unsigned char *)__dst + v7) = 1;
    else {
      *(_WORD *)((char *)__dst + v7) = 1;
    }
  }
  else if (v15)
  {
    if (v7 > 3) {
      goto LABEL_57;
    }
    unsigned int v21 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    uint64_t v22 = 2;
    if (v21 > 0xFFFD) {
      uint64_t v22 = 4;
    }
    if (v21 <= 0xFD) {
LABEL_57:
    }
      uint64_t v22 = 1;
    memcpy(__dst, __src, v22 + v7);
  }
  else
  {
    (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 <= 3)
    {
      unsigned int v20 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v20 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v20 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((unsigned char *)__dst + v7) = 0;
  }
  return __dst;
}

uint64_t sub_2179A0388(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (v3 <= 8) {
    unint64_t v3 = 8;
  }
  if (v3 > 3)
  {
    int v4 = 3;
LABEL_7:
    char v6 = 8;
    goto LABEL_8;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD) {
    goto LABEL_11;
  }
  int v4 = v5 + 2;
  if (v5 <= 0xFD) {
    goto LABEL_7;
  }
  char v6 = 16;
LABEL_8:
  unsigned int v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3) {
      goto LABEL_15;
    }
LABEL_12:
    unsigned int v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    uint64_t v9 = 2;
    if (v8 > 0xFFFD) {
      uint64_t v9 = 4;
    }
    if (v8 > 0xFD) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_11:
  unsigned int v7 = 0x7FFFFFFF;
  if (v3 <= 3) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v9 = 1;
LABEL_16:
  if (!a2) {
    return 0;
  }
  if (a2 <= v7) {
    goto LABEL_35;
  }
  unint64_t v10 = v9 + v3;
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_35;
      }
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_35:
      if (v7)
      {
        if (v3 <= 3)
        {
          unsigned int v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFD)
          {
            unsigned int v16 = *(_DWORD *)((char *)a1 + v3);
            unsigned int v17 = ~v16;
LABEL_45:
            unsigned int v24 = 0x7FFFFFFF;
LABEL_46:
            if (v24 > v17) {
              return -v16;
            }
            else {
              return 0;
            }
          }
          int v19 = v21 + 2;
          if (v21 > 0xFD)
          {
            int v23 = *(unsigned __int16 *)((char *)a1 + v3);
            unsigned int v16 = v23 | 0xFFFF0000;
            unsigned int v17 = v23 ^ 0xFFFF;
            char v18 = 16;
          }
          else
          {
            int v22 = *((unsigned __int8 *)a1 + v3);
            unsigned int v16 = v22 | 0xFFFFFF00;
            unsigned int v17 = v22 ^ 0xFF;
            char v18 = 8;
          }
        }
        else
        {
          int v15 = *((unsigned __int8 *)a1 + v3);
          unsigned int v16 = v15 | 0xFFFFFF00;
          unsigned int v17 = v15 ^ 0xFF;
          char v18 = 8;
          int v19 = 3;
        }
        unsigned int v24 = (1 << v18) - v19;
        if ((v24 & 0x80000000) == 0) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      return 0;
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_35;
  }
LABEL_27:
  int v14 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v14 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v10 | v14) + 1;
}

void sub_2179A05EC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  char v6 = 8 * v5;
  if (v5 > 3)
  {
    int v7 = 3;
LABEL_5:
    char v8 = 8;
    goto LABEL_6;
  }
  unsigned int v10 = ((1 << v6) + 1) >> v6;
  if (v10 > 0xFFFD) {
    goto LABEL_12;
  }
  int v7 = v10 + 2;
  if (v10 <= 0xFD) {
    goto LABEL_5;
  }
  char v8 = 16;
LABEL_6:
  unsigned int v9 = (1 << v8) - v7;
  if ((v9 & 0x80000000) == 0)
  {
    if (v5 > 3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_12:
  unsigned int v9 = 0x7FFFFFFF;
  if (v5 > 3)
  {
LABEL_16:
    uint64_t v12 = 1;
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v11 = ((1 << v6) + 1) >> v6;
  uint64_t v12 = 2;
  if (v11 > 0xFFFD) {
    uint64_t v12 = 4;
  }
  if (v11 <= 0xFD) {
    goto LABEL_16;
  }
LABEL_17:
  size_t v13 = v12 + v5;
  if (a3 <= v9)
  {
    int v14 = 0;
  }
  else if (v13 <= 3)
  {
    unsigned int v17 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v17))
    {
      int v14 = 4;
    }
    else if (v17 >= 0x100)
    {
      int v14 = 2;
    }
    else
    {
      int v14 = v17 > 1;
    }
  }
  else
  {
    int v14 = 1;
  }
  if (v9 < a2)
  {
    unsigned int v15 = ~v9 + a2;
    if (v13 < 4)
    {
      int v16 = (v15 >> (8 * v13)) + 1;
      if (v13)
      {
        int v18 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v13 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v13] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v16;
        return;
      case 3:
        goto LABEL_53;
      case 4:
        *(_DWORD *)&a1[v13] = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_53:
      __break(1u);
      JUMPOUT(0x2179A088CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (!a2) {
        return;
      }
LABEL_37:
      int v19 = -a2;
      if (v5 > 3) {
        goto LABEL_38;
      }
      unsigned int v20 = ((1 << v6) + 1) >> v6;
      if (v20 > 0xFFFD)
      {
        *(_DWORD *)&a1[v5] = v19;
      }
      else if (v20 <= 0xFD)
      {
LABEL_38:
        a1[v5] = v19;
      }
      else
      {
        *(_WORD *)&a1[v5] = v19;
      }
      return;
  }
}

uint64_t sub_2179A08B4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  if (v3 > 3) {
    goto LABEL_4;
  }
  unsigned int v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
  {
    uint64_t v4 = *(unsigned int *)&a1[v3];
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_4:
      uint64_t v4 = a1[v3];
      goto LABEL_9;
    }
    uint64_t v4 = *(unsigned __int16 *)&a1[v3];
  }
LABEL_9:
  int v6 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_18;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_18;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_18;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_18:
        unsigned int v9 = (v8 | (v6 << (8 * v3))) + 2;
        LODWORD(v4) = v8 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v9;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_2179A09B0(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v5 = 8;
  }
  else {
    size_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v6 = a2 - 2;
    if (v5 < 4)
    {
      int v8 = (v6 >> (8 * v5)) + 2;
      v6 &= ~(-1 << (8 * v5));
      unsigned int v9 = (int *)&a1[v5];
      unsigned int v10 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v10 > 0xFFFD)
      {
        *unsigned int v9 = v8;
      }
      else if (v10 > 0xFD)
      {
        *(_WORD *)unsigned int v9 = v8;
      }
      else
      {
        *(unsigned char *)unsigned int v9 = v8;
      }
    }
    else
    {
      a1[v5] = 2;
    }
    if (v5 <= 3) {
      int v11 = v5;
    }
    else {
      int v11 = 4;
    }
    bzero(a1, v5);
    switch(v11)
    {
      case 2:
        *(_WORD *)a1 = v6;
        break;
      case 3:
        *(_WORD *)a1 = v6;
        a1[2] = BYTE2(v6);
        break;
      case 4:
        *(_DWORD *)a1 = v6;
        break;
      default:
        *a1 = v6;
        break;
    }
  }
  else
  {
    if (v5 > 3)
    {
LABEL_6:
      a1[v5] = a2;
      return;
    }
    unsigned int v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v7 > 0xFFFD)
    {
      *(_DWORD *)&a1[v5] = a2;
    }
    else
    {
      if (v7 <= 0xFD) {
        goto LABEL_6;
      }
      *(_WORD *)&a1[v5] = a2;
    }
  }
}

BOOL sub_2179A0B2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2179A0B40()
{
  return sub_2179E2E30();
}

uint64_t sub_2179A0B88()
{
  return sub_2179E2E10();
}

uint64_t sub_2179A0BB4()
{
  return sub_2179E2E30();
}

uint64_t sub_2179A0C08()
{
  unint64_t v1 = 0xD00000000000001BLL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000025;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6620776F6E6B6E55;
  }
}

uint64_t getEnumTagSinglePayload for ContentLoadError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContentLoadError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2179A0DD0);
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

uint64_t sub_2179A0DF8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2179A0E00(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContentLoadError()
{
  return &type metadata for ContentLoadError;
}

unint64_t sub_2179A0E1C()
{
  unint64_t result = qword_267BA62F0;
  if (!qword_267BA62F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA62F0);
  }
  return result;
}

id sub_2179A0E74(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v10 = sub_2179B2CDC(v8, v9), (v11 & 1) == 0))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v30);
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1))
  {
LABEL_11:
    sub_2179A11CC((uint64_t)&v30);
    return 0;
  }
  if (swift_dynamicCast())
  {
    uint64_t v12 = self;
    size_t v13 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v12, sel__systemImageNamed_, v13);

    if (v14)
    {
      if (a4)
      {
        uint64_t v15 = sub_2179E2930();
        if (*(void *)(a1 + 16) && (unint64_t v17 = sub_2179B2CDC(v15, v16), (v18 & 1) != 0))
        {
          sub_2179A122C(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v30);
        }
        else
        {
          long long v30 = 0u;
          long long v31 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v31 + 1))
        {
          if (swift_dynamicCast())
          {
            if (sub_2179E2930() == v28 && v21 == v29)
            {
              swift_bridgeObjectRelease_n();
              a3 = 1;
            }
            else
            {
              char v23 = sub_2179E2D50();
              swift_bridgeObjectRelease();
              if (v23)
              {
                swift_bridgeObjectRelease();
                a3 = 1;
              }
              else if (sub_2179E2930() == v28 && v24 == v29)
              {
                swift_bridgeObjectRelease_n();
                a3 = 3;
              }
              else
              {
                char v25 = sub_2179E2D50();
                swift_bridgeObjectRelease();
                if (v25)
                {
                  swift_bridgeObjectRelease();
                  a3 = 3;
                }
                else if (sub_2179E2930() == v28 && v26 == v29)
                {
                  swift_bridgeObjectRelease_n();
                  a3 = -1;
                }
                else
                {
                  uint64_t v27 = sub_2179E2D50();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a3 = v27 << 63 >> 63;
                }
              }
            }
            goto LABEL_22;
          }
        }
        else
        {
          sub_2179A11CC((uint64_t)&v30);
        }
        a3 = 2;
      }
LABEL_22:
      id v22 = objc_msgSend(self, sel_configurationWithTextStyle_scale_, a2, a3);
      id v19 = objc_msgSend(v14, sel_imageByApplyingSymbolConfiguration_, v22);

      return v19;
    }
  }
  return 0;
}

uint64_t sub_2179A11CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2179A122C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2179A1288()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179A1300@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2179A1380(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_2179E1AF0();
}

uint64_t sub_2179A13F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179A1474()
{
  return sub_2179E1AF0();
}

uint64_t (*sub_2179A14E4(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

uint64_t sub_2179A1574(uint64_t a1)
{
  return sub_2179A1F04(a1, &qword_267BA62F8, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_26ACF7540);
}

uint64_t (*sub_2179A1590(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62F8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7540);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179A16A4@<X0>(unsigned char *a1@<X8>)
{
  return sub_217989C34(a1);
}

uint64_t sub_2179A16B8()
{
  return sub_217987CA8();
}

uint64_t sub_2179A16CC()
{
  return sub_2179A1B00();
}

uint64_t sub_2179A16E8()
{
  return sub_2179A1B88();
}

uint64_t (*sub_2179A16FC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

uint64_t sub_2179A1788()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A179C(uint64_t a1)
{
  return sub_2179A1F04(a1, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_26ACF7520);
}

uint64_t (*sub_2179A17B8(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6300);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7520);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179A18C8()
{
  return sub_2179A1B00();
}

uint64_t sub_2179A18E4()
{
  return sub_2179A1B88();
}

uint64_t (*sub_2179A18F8(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

uint64_t sub_2179A1984()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_26ACF7520);
}

uint64_t sub_2179A1998(uint64_t a1)
{
  return sub_2179A1F04(a1, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_26ACF7520);
}

uint64_t (*sub_2179A19B4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6300);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  BOOL v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7520);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179A1AC4@<X0>(unsigned char *a1@<X8>)
{
  return sub_217989C34(a1);
}

uint64_t sub_2179A1AD8()
{
  return sub_217987CA8();
}

uint64_t sub_2179A1AEC()
{
  return sub_2179A1B00();
}

uint64_t sub_2179A1B00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179A1B74()
{
  return sub_2179A1B88();
}

uint64_t sub_2179A1B88()
{
  return sub_2179E1AF0();
}

uint64_t (*sub_2179A1BF4(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

void sub_2179A1C80(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_2179A1CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_2179A1D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  size_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2179A1ED4()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A1EE8(uint64_t a1)
{
  return sub_2179A1F04(a1, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A1F04(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2179A2034(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6300);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7520);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

void sub_2179A2144(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2179E1AC0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_2179E1AC0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_2179A22B4()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
}

uint64_t sub_2179A22C4(uint64_t result)
{
  char v2 = result;
  char v3 = result & 1;
  uint64_t v4 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime) != (result & 1))
  {
    type metadata accessor for DocumentAssetViewModel();
    sub_217990CC4();
    sub_2179E1A40();
    sub_2179E1A80();
    uint64_t result = swift_release();
  }
  *(unsigned char *)(v1 + v4) = v3;
  if (v2)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
    sub_21798D884((unint64_t *)&qword_267BA6860, &qword_26ACF74C8);
    sub_2179E1A90();
    return swift_release();
  }
  return result;
}

uint64_t DocumentAssetViewModel.__allocating_init(document:assetsInfo:contentModel:)(void *a1, void *a2, char *a3)
{
  uint64_t v6 = swift_allocObject();
  DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(a1, a2, a3);
  return v6;
}

uint64_t DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(void *a1, void *a2, char *a3)
{
  uint64_t v4 = v3;
  v80 = a3;
  id v93 = a2;
  id v72 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74E8);
  uint64_t v88 = *(void *)(v5 - 8);
  uint64_t v89 = v5;
  MEMORY[0x270FA5388](v5);
  v87 = (char *)v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74B8);
  uint64_t v91 = *(void *)(v7 - 8);
  uint64_t v92 = v7;
  MEMORY[0x270FA5388](v7);
  v90 = (char *)v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74A8);
  uint64_t v85 = *(void *)(v9 - 8);
  uint64_t v86 = v9;
  MEMORY[0x270FA5388](v9);
  v84 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74D8);
  uint64_t v75 = *(void *)(v81 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v81);
  v76 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v77 = (char *)v69 - v14;
  MEMORY[0x270FA5388](v13);
  v79 = (char *)v69 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v16 - 8);
  char v70 = (char *)v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7520);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7540);
  uint64_t v22 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v24 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74F0);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__imageState;
  uint64_t v94 = 0;
  char v95 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D88);
  sub_2179E1AA0();
  long long v30 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 32);
  uint64_t v73 = v29;
  uint64_t v74 = v25;
  v30(v29, v28, v25);
  uint64_t v31 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  uint64_t v94 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75E8);
  sub_2179E1AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v31, v24, v83);
  uint64_t v32 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  LOBYTE(v94) = 0;
  sub_2179E1AA0();
  uint64_t v33 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 32);
  v33(v32, v21, v18);
  uint64_t v34 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying;
  LOBYTE(v94) = 0;
  sub_2179E1AA0();
  v33(v34, v21, v18);
  uint64_t v35 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded;
  LOBYTE(v94) = 0;
  sub_2179E1AA0();
  v33(v35, v21, v18);
  uint64_t v36 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_playerDidFinishSubject;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
  swift_allocObject();
  *(void *)(v4 + v36) = sub_2179E1A50();
  uint64_t v83 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_networkIsReachableCancellable;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_networkIsReachableCancellable) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = 0;
  uint64_t v78 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_cancellables;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_cancellables) = MEMORY[0x263F8EE88];
  *(unsigned char *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer) = 0;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime) = 0;
  id v37 = v72;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document) = v72;
  uint64_t v38 = v80;
  *(void *)(v4 + 16) = v80;
  id v39 = v37;
  v80 = v38;
  uint64_t v40 = sub_2179E26A0();
  uint64_t v42 = v41;
  uint64_t v43 = (uint64_t)v70;
  sub_2179E26C0();
  type metadata accessor for RemoteFileLoader();
  swift_allocObject();
  uint64_t v44 = sub_217988968(v40, v42, v43);
  uint64_t v71 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader) = v44;
  uint64_t v45 = sub_2179E2680();
  uint64_t v47 = v46;
  sub_2179E26B0();
  type metadata accessor for RemoteImageLoader();
  swift_allocObject();
  uint64_t v48 = sub_217987E48(v45, v47, v43);
  uint64_t v49 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader;
  *(void *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader) = v48;
  uint64_t v50 = self;
  if (objc_msgSend(v50, sel_isVisionUI))
  {
    id v51 = objc_msgSend(v39, sel_identifier);
    if (!v51)
    {
      sub_2179E2930();
      id v51 = (id)sub_2179E2900();
      swift_bridgeObjectRelease();
    }
    unsigned int v52 = objc_msgSend(v50, sel_isSavedTipsCollectionIdentifier_, v51);

    if (v52) {
      sub_2179A3FBC();
    }
  }
  swift_beginAccess();
  swift_retain();
  long long v53 = v79;
  sub_2179E1AB0();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  long long v54 = v77;
  sub_2179E1AB0();
  swift_endAccess();
  char v70 = (char *)MEMORY[0x263EFDE50];
  v69[1] = sub_21798D884(&qword_26ACF74D0, &qword_26ACF74D8);
  id v72 = v39;
  uint64_t v55 = v81;
  sub_2179E1B90();
  uint64_t v56 = v75;
  v69[0] = v49;
  long long v57 = *(void (**)(char *, uint64_t))(v75 + 8);
  v57(v53, v55);
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v76, v54, v55);
  swift_beginAccess();
  sub_2179E1AC0();
  swift_endAccess();
  v57(v54, v55);
  swift_beginAccess();
  swift_retain();
  sub_2179E1AB0();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  long long v58 = v84;
  sub_2179E1B20();
  swift_release();
  v57(v53, v55);
  swift_allocObject();
  swift_weakInit();
  sub_21798D884(&qword_26ACF74A0, &qword_26ACF74A8);
  uint64_t v59 = v86;
  sub_2179E1B80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v58, v59);
  swift_beginAccess();
  sub_2179E1A30();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7500);
  long long v60 = v87;
  sub_2179E1AB0();
  swift_endAccess();
  swift_release();
  sub_21798D884(&qword_26ACF74E0, &qword_26ACF74E8);
  uint64_t v61 = v89;
  long long v62 = v90;
  sub_2179E1B20();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v60, v61);
  swift_allocObject();
  swift_weakInit();
  sub_21798D884(&qword_26ACF74B0, &qword_26ACF74B8);
  uint64_t v63 = v92;
  sub_2179E1B80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v62, v63);
  swift_beginAccess();
  sub_2179E1A30();
  swift_endAccess();
  swift_release();
  long long v64 = v80;
  uint64_t v94 = *(void *)&v80[OBJC_IVAR____TtC6TipsUI16TipsContentModel_networkDidChangeToReachable];
  uint64_t v65 = swift_allocObject();
  swift_weakInit();
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = sub_2179A4DF0;
  *(void *)(v66 + 24) = v65;
  sub_21798D884(&qword_26ACF74C0, &qword_26ACF74C8);
  swift_retain();
  uint64_t v67 = sub_2179E1B80();
  swift_release();

  swift_release();
  *(void *)(v4 + v83) = v67;
  swift_release();
  return v4;
}

uint64_t sub_2179A3150@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(a1 + 8) < 2u) {
    goto LABEL_2;
  }
  if (*(void *)a1) {
    goto LABEL_4;
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    goto LABEL_4;
  }
  swift_retain();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_release();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = sub_21798B28C((uint64_t)v7, &qword_26ACF6D90);
  if (EnumCaseMultiPayload) {
LABEL_4:
  }
    char v8 = 0;
  else {
LABEL_2:
  }
    char v8 = 1;
  *a2 = v8;
  return result;
}

uint64_t sub_2179A32BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21798CF98(a1, (uint64_t)v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    *a2 = 1;
  }
  else
  {
    if (result) {
      *a2 = 0;
    }
    else {
      *a2 = 1;
    }
    return sub_21798B28C((uint64_t)v6, &qword_26ACF6D90);
  }
  return result;
}

uint64_t sub_2179A338C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_2179E1AF0();
  }
  return result;
}

uint64_t sub_2179A3418()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(unsigned char *)(Strong + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_21798D2B4();
    return swift_release();
  }
  return result;
}

uint64_t DocumentAssetViewModel.deinit()
{
  uint64_t v1 = v0;
  swift_retain();
  sub_217989CB0();
  swift_release();
  swift_retain();
  sub_2179898F8();
  swift_release();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;

  uint64_t v2 = v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__imageState;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7520);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, v7);
  v8(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t DocumentAssetViewModel.__deallocating_deinit()
{
  DocumentAssetViewModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2179A370C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BB0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6308);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E2BF0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6310);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v19 = v11;
  uint64_t v20 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_playerDidFinishSubject);
  swift_retain();
  sub_2179E2BE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  id v21 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v15 = sub_2179E2BC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
  sub_217986C94(0, &qword_26ACF6BC0);
  sub_21798D884(&qword_26ACF74C0, &qword_26ACF74C8);
  sub_2179A4E58();
  sub_2179E1B60();
  sub_21798B28C((uint64_t)v3, &qword_26ACF6BB0);

  sub_21798B28C((uint64_t)v6, &qword_267BA6308);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  sub_21798D884(&qword_267BA6318, &qword_267BA6310);
  uint64_t v16 = v19;
  uint64_t v17 = sub_2179E1B10();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v16);
  return v17;
}

void sub_2179A3AB4()
{
  if (*(void *)(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    uint64_t v1 = self;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(v1, sel_dataCacheForIdentifier_, v2);

    if (v3)
    {

      swift_getKeyPath();
      swift_getKeyPath();
      sub_2179E1AE0();
      swift_release();
      swift_release();
      if (v5)
      {
        sub_2179906C8(v4, v5);
      }
      else
      {
        sub_2179906C8(v4, 0);
        sub_217989DCC();
      }
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
    swift_release();
  }
}

id sub_2179A3BFC()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document), sel_assetFileInfoManager);

  return v1;
}

void sub_2179A3C4C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int v28 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v27[-v11];
  uint64_t v13 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
  uint64_t v14 = (uint64_t *)(*(void *)(v2 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader)
                  + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_2179E26A0();
  if (!v15)
  {
    if (!v18) {
      goto LABEL_13;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!v18) {
    goto LABEL_10;
  }
  if (v16 != v17 || v15 != v18)
  {
    char v20 = sub_2179E2D50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_13;
    }
LABEL_11:
    swift_retain();
    sub_2179898F8();
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21798CF98((uint64_t)v12, (uint64_t)v10);
    swift_retain();
    sub_2179E1AF0();
    sub_21798B28C((uint64_t)v12, &qword_26ACF6D90);
    swift_release();
    uint64_t v21 = *(void *)(v2 + v13);
    swift_retain();
    uint64_t v22 = sub_2179E26A0();
    uint64_t v23 = (uint64_t *)(v21 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
    *uint64_t v23 = v22;
    v23[1] = v24;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void *)(v2 + v13);
    swift_retain();
    sub_2179E26C0();
    uint64_t v26 = v25 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
    swift_beginAccess();
    sub_217986BA4((uint64_t)v6, v26);
    swift_endAccess();
    swift_release();
    sub_2179A45A8();
    *(unsigned char *)(v3 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v29 = 0;
    swift_retain();
    sub_2179E1AF0();
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  if (!*(void *)(*(void *)(v2 + v13) + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8)
    && *(void *)(*(void *)(v2 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    sub_2179A45A8();
  }
LABEL_16:
  if (v28) {
    sub_21798D2B4();
  }
}

uint64_t sub_2179A3FBC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v40 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v39 - v3;
  uint64_t v5 = sub_2179E1810();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v42 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v39 = (char *)&v39 - v9;
  uint64_t v10 = sub_2179E18F0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2179E1910();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6320);
  MEMORY[0x270FA5388](v18 - 8);
  char v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179E18C0();
  sub_2179E1900();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_2179E18E0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v21 = sub_2179E18B0();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_21798B28C((uint64_t)v20, &qword_267BA6320);
  }
  else
  {
    sub_2179E18A0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
  }
  uint64_t v23 = self;
  uint64_t v24 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v23, sel_characterDirectionForLanguage_, v24);

  if (v25 == (id)1) {
    uint64_t v26 = 0xD00000000000001CLL;
  }
  else {
    uint64_t v26 = 0xD00000000000001FLL;
  }
  if (v25 == (id)1) {
    uint64_t v27 = 0x80000002179E7AE0;
  }
  else {
    uint64_t v27 = 0x80000002179E7AC0;
  }
  id v28 = objc_msgSend(self, sel_mainBundle);
  uint64_t v29 = (void *)sub_2179E2900();
  long long v30 = (void *)sub_2179E2900();
  id v31 = objc_msgSend(v28, sel_URLForResource_withExtension_, v29, v30);

  if (v31)
  {
    uint64_t v32 = v42;
    sub_2179E17D0();

    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v33(v4, v32, v5);
    uint64_t v34 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    v34(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      uint64_t v35 = v39;
      v33(v39, v4, v5);
      uint64_t v36 = (uint64_t)v40;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v40, v35, v5);
      v34((char *)v36, 0, 1, v5);
      type metadata accessor for RemoteFileLoader();
      swift_allocObject();
      uint64_t v37 = sub_217988968(v26, v27, v36);
      *(void *)(v41 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader) = v37;
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v35, v5);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  swift_bridgeObjectRelease();
  return sub_21798B28C((uint64_t)v4, &qword_26ACF6BC8);
}

uint64_t sub_2179A45A8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader;
  swift_retain();
  sub_217989CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[1] = 0;
  char v13 = 2;
  sub_2179E1AF0();
  uint64_t v5 = *(void *)(v0 + v4);
  swift_retain();
  uint64_t v6 = sub_2179E2680();
  uint64_t v7 = (uint64_t *)(v5 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier);
  uint64_t *v7 = v6;
  v7[1] = v8;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v0 + v4);
  swift_retain();
  sub_2179E26B0();
  uint64_t v10 = v9 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  swift_beginAccess();
  sub_217986BA4((uint64_t)v3, v10);
  swift_endAccess();
  return swift_release();
}

void sub_2179A4714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2179E1BE0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v21[-v10];
  uint64_t v12 = *(char **)(a2 + 16);
  char v13 = &v12[OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList];
  swift_beginAccess();
  if (*(void *)v13)
  {
    uint64_t v14 = &v12[OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme];
    swift_beginAccess();
    (*(void (**)(unsigned char *, char *, uint64_t))(v6 + 16))(v11, v14, v5);
    (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F18508], v5);
    uint64_t v15 = v12;
    swift_bridgeObjectRetain();
    char v16 = sub_2179E1BD0();
    uint64_t v17 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
    v17(v9, v5);
    v17(v11, v5);
    uint64_t v18 = *(void **)&v15[OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager];
    sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
    id v19 = v18;
    char v20 = (void *)sub_2179E29C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_prefetchAssetsFromTip_tips_assetUserInterfaceStyle_, a3, v20, (v16 & 1) == 0);
  }
}

void sub_2179A4958(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2179A49C0()
{
  swift_retain();
  sub_217989CB0();
  swift_release();
  swift_retain();
  sub_2179898F8();
  uint64_t result = swift_release();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  return result;
}

void sub_2179A4A2C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v1 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    objc_msgSend(v0, sel_pause);
  }
}

uint64_t sub_2179A4B04()
{
  int v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
  if ((v1 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    objc_msgSend(v3, sel_play);
  }
  return v1 ^ 1u;
}

void sub_2179A4BA0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  objc_msgSend(v12, sel_pause);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  id v0 = v12;
  if (v12)
  {
    int v1 = (void *)*MEMORY[0x263F010E0];
    int v2 = *(_DWORD *)(MEMORY[0x263F010E0] + 8);
    int v3 = *(_DWORD *)(MEMORY[0x263F010E0] + 12);
    uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v12 = v1;
    int v13 = v2;
    int v14 = v3;
    uint64_t v15 = v11;
    uint64_t v7 = v11;
    uint64_t v8 = v1;
    int v9 = v2;
    int v10 = v3;
    id v4 = v1;
    int v5 = v2;
    int v6 = v3;
    objc_msgSend(v0, sel_seekToTime_toleranceBefore_toleranceAfter_, &v12, &v8, &v4);
  }
}

void sub_2179A4CCC()
{
  sub_2179A4BA0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  objc_msgSend(v0, sel_play);
}

uint64_t sub_2179A4D58()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2179A4D90@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_2179A3150(a1, a2);
}

uint64_t sub_2179A4D98()
{
  return sub_2179A338C();
}

uint64_t sub_2179A4DC4()
{
  return sub_2179A338C();
}

uint64_t sub_2179A4DF0()
{
  return sub_2179A3418();
}

uint64_t sub_2179A4DF8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179A4E30()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_2179A4E58()
{
  unint64_t result = qword_26ACF6BB8;
  if (!qword_26ACF6BB8)
  {
    sub_217986C94(255, &qword_26ACF6BC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6BB8);
  }
  return result;
}

uint64_t sub_2179A4EC0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_2179A4F48(uint64_t a1)
{
  return sub_2179A5180(a1);
}

uint64_t sub_2179A4F5C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();

  return swift_release();
}

uint64_t sub_2179A4FD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  int v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_21798CF98(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21798CF98((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_2179E1AF0();
  return sub_21798B28C((uint64_t)v7, &qword_26ACF6D90);
}

uint64_t sub_2179A50E0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_2179A516C(uint64_t a1)
{
  return sub_2179A5180(a1);
}

uint64_t sub_2179A5180(uint64_t a1)
{
  int v1 = *(void **)a1;
  char v2 = *(unsigned char *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179A59C4(v1, v2);
  swift_retain();
  return sub_2179E1AF0();
}

uint64_t sub_2179A520C(uint64_t a1)
{
  return sub_2179A5180(a1);
}

uint64_t sub_2179A523C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_26ACF7540);
}

uint64_t sub_2179A5264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179A1D58(a1, a2, a3, a4, &qword_267BA62F8, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_26ACF7540);
}

uint64_t sub_2179A5294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A52BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179A1D58(a1, a2, a3, a4, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A52EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_26ACF7520);
}

uint64_t sub_2179A5314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179A1D58(a1, a2, a3, a4, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_26ACF7520);
}

uint64_t sub_2179A5344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A536C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179A1D58(a1, a2, a3, a4, &qword_267BA6300, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_26ACF7520);
}

uint64_t sub_2179A539C()
{
  return type metadata accessor for DocumentAssetViewModel();
}

uint64_t method lookup function for DocumentAssetViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DocumentAssetViewModel);
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.__allocating_init(document:assetsInfo:contentModel:)()
{
  return (*(uint64_t (**)(void))(v0 + 712))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.playerDidFinishPublisher(withDelay:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 720))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.loadImageCacheIfAvailable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 728))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.assetFileInfoManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 736))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.updateWithTipAssetInfo(_:shouldReload:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 752))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.pauseVideoIfPlaying()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 824))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.resumeVideoIfPaused()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 832))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.resetVideo()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 840))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.replayVideo()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 848))();
}

uint64_t sub_2179A5950()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2179A5990(uint64_t a1)
{
  sub_2179A4714(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2179A599C(uint64_t a1)
{
  return sub_2179A5180(a1);
}

id sub_2179A59C4(id result, char a2)
{
  if (a2 == 1) {
    return result;
  }
  if (!a2) {
    return (id)swift_retain();
  }
  return result;
}

unint64_t sub_2179A5A28()
{
  unint64_t result = qword_26ACF77E0;
  if (!qword_26ACF77E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF77E0);
  }
  return result;
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

uint64_t assignWithTake for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  if (*(void *)(a1 + 16))
  {
    uint64_t v5 = *(void *)(a2 + 16);
    if (v5)
    {
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_release();
      *(void *)(a1 + 16) = v5;
      swift_release();
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      goto LABEL_6;
    }
    sub_21798B28C(a1 + 8, &qword_26ACF6B68);
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
LABEL_6:
  if (!*(void *)(a1 + 40))
  {
LABEL_10:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    return a1;
  }
  uint64_t v6 = *(void *)(a2 + 40);
  if (!v6)
  {
    sub_21798B28C(a1 + 32, &qword_26ACF6B68);
    goto LABEL_10;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = v6;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t sub_2179A5B8C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B68);
    sub_2179E23C0();
    swift_release();
    return swift_release();
  }
  return result;
}

id sub_2179A5C20@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_rate);
  *a2 = v4;
  return result;
}

id sub_2179A5C54(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setRate_, a3);
}

uint64_t sub_2179A5C70(uint64_t a1)
{
  return sub_2179A5B8C(a1, v1 + 16);
}

id sub_2179A5C78@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_timeControlStatus);
  *a2 = result;
  return result;
}

uint64_t sub_2179A5CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static UIFont.fontWithStyle(_:size:)(uint64_t a1, double a2)
{
  id v3 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, a1);
  id v4 = objc_msgSend(self, sel_fontWithDescriptor_size_, v3, a2);

  return v4;
}

id static UIFont.fontWithStyle(_:weight:)(uint64_t a1, double a2)
{
  id v3 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, a1);
  id v4 = objc_msgSend(v3, sel_fontAttributes);
  type metadata accessor for AttributeName(0);
  sub_2179A5FF8();
  sub_2179E28C0();

  sub_2179E2930();
  uint64_t v5 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6328);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2179E58F0;
  uint64_t v7 = (void *)*MEMORY[0x263F03C00];
  *(void *)(inited + 32) = *MEMORY[0x263F03C00];
  *(double *)(inited + 40) = a2;
  id v8 = v7;
  unint64_t v9 = sub_21799F588(inited);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6330);
  *(void *)&long long v17 = v9;
  sub_21799FA78(&v17, v16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_2179A6194(v16, v5, isUniquelyReferenced_nonNull_native, (uint64_t (*)(void *))sub_2179B2D54, (void (*)(void))sub_2179B3EFC, (void (*)(void))sub_2179B3254, type metadata accessor for AttributeName);

  swift_bridgeObjectRelease();
  id v11 = objc_allocWithZone(MEMORY[0x263F81720]);
  id v12 = (void *)sub_2179E28B0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithFontAttributes_, v12);

  id v14 = objc_msgSend(self, sel_fontWithDescriptor_size_, v13, 0.0);
  return v14;
}

unint64_t sub_2179A5FF8()
{
  unint64_t result = qword_267BA61D0;
  if (!qword_267BA61D0)
  {
    type metadata accessor for AttributeName(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA61D0);
  }
  return result;
}

uint64_t static UIFont.defaultFont.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v0 - 8);
  char v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for ConstellationContentAttributes(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_2179A6534((uint64_t)v2);
  sub_2179A666C((uint64_t)v2);
  return sub_2179E20C0();
}

void sub_2179A6114(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

_OWORD *sub_2179A6140(_OWORD *a1, void *a2, char a3)
{
  return sub_2179A6194(a1, a2, a3, (uint64_t (*)(void *))sub_2179B2D54, (void (*)(void))sub_2179B4BF0, (void (*)(void))sub_2179B38A8, type metadata accessor for Key);
}

_OWORD *sub_2179A6194(_OWORD *a1, void *a2, char a3, uint64_t (*a4)(void *), void (*a5)(void), void (*a6)(void), void (*a7)(void))
{
  id v12 = (void **)v7;
  uint64_t v15 = (void *)*v7;
  unint64_t v17 = a4(a2);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 < v20 || (a3 & 1) == 0)
  {
    if (v22 >= v20 && (a3 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    a6();
    uint64_t v26 = a4(a2);
    if ((v21 & 1) == (v27 & 1))
    {
      unint64_t v17 = v26;
      uint64_t v23 = *v12;
      if (v21) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    a7(0);
    unint64_t result = (_OWORD *)sub_2179E2D90();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v23 = *v12;
  if (v21)
  {
LABEL_8:
    uint64_t v24 = (_OWORD *)(v23[7] + 32 * v17);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
    return sub_21799FA78(a1, v24);
  }
LABEL_13:
  sub_2179A64CC(v17, (uint64_t)a2, a1, v23);

  return a2;
}

void sub_2179A6314(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2179A6340(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  unint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_2179B2CDC(a2, a3);
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
    uint64_t v22 = (void *)*v9;
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
  unint64_t v24 = sub_2179B2CDC(a2, a3);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_2179E2D90();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  uint64_t v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v26 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v26 = a2;
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

_OWORD *sub_2179A64CC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  unint64_t result = sub_21799FA78(a3, (_OWORD *)(a4[7] + 32 * a1));
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

id sub_2179A6534(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (id *)((char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2179A671C(a1, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for ConstellationContentAttributes(0);
  if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1)
  {
    sub_2179A666C((uint64_t)v4);
  }
  else
  {
    id v6 = *v4;
    id v7 = *v4;
    sub_2179A6784((uint64_t)v4);
    if (v6) {
      return v7;
    }
  }
  id v9 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83570]);

  return v9;
}

uint64_t sub_2179A666C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_2179A671C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2179A6784(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConstellationContentAttributes(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2179A67E0()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_21798CC74(v1, v2);
  uint64_t v3 = sub_217986F90(v1, v2) & 1;
  sub_217986828(v1, v2);
  return v3;
}

uint64_t sub_2179A6838()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v4 = type metadata accessor for RemoteImageLoader();
  unint64_t v5 = sub_2179A8750();

  return MEMORY[0x270EFF108](v1, v2, v3, v4, v5);
}

uint64_t sub_2179A6898()
{
  return sub_2179E23C0();
}

uint64_t RemoteImageView.init(identifier:url:isLoaded:placeholder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, void (*a7)(uint64_t)@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v36 = a8;
  uint64_t v37 = a7;
  int v34 = a6;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v15 = *(void *)(a10 - 8);
  uint64_t v35 = a11;
  MEMORY[0x270FA5388](a1);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a9 = swift_getKeyPath();
  *(unsigned char *)(a9 + 8) = 0;
  *(void *)(a9 + 64) = 0;
  uint64_t v38 = a3;
  sub_2179A791C(a3, (uint64_t)v21);
  unint64_t v22 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v33;
  *(void *)(v23 + 16) = v32;
  *(void *)(v23 + 24) = v24;
  sub_2179A7988((uint64_t)v21, v23 + v22);
  *(void *)(a9 + 16) = sub_2179A79F0;
  *(void *)(a9 + 24) = v23;
  *(unsigned char *)(a9 + 32) = 0;
  if (a5)
  {
    char v25 = v34 & 1;
    uint64_t v26 = a5;
    uint64_t v27 = a4;
  }
  else
  {
    char v39 = 0;
    sub_2179E23D0();
    uint64_t v27 = v40;
    uint64_t v26 = v41;
    char v25 = v42;
  }
  *(void *)(a9 + 40) = v27;
  *(void *)(a9 + 48) = v26;
  *(unsigned char *)(a9 + 56) = v25;
  uint64_t v28 = sub_217990A90(a4, a5);
  v37(v28);
  sub_21798E46C(a4, a5);
  sub_21799F528(v38);
  uint64_t v29 = type metadata accessor for RemoteImageView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a9 + *(int *)(v29 + 48), v17, a10);
}

uint64_t sub_2179A6B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179A791C(a3, (uint64_t)v8);
  type metadata accessor for RemoteImageLoader();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_217987E48(a1, a2, (uint64_t)v8);
}

uint64_t RemoteImageView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  long long v57 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v48 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B10);
  uint64_t v6 = *(void *)(a1 + 16);
  sub_2179E1F70();
  unint64_t v7 = sub_2179A79F4();
  uint64_t v8 = *(void *)(a1 + 24);
  unint64_t v66 = v7;
  uint64_t v67 = v8;
  uint64_t v9 = v8;
  swift_getWitnessTable();
  uint64_t v49 = sub_2179E2390();
  uint64_t v51 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  char v42 = (char *)&v41 - v10;
  uint64_t v52 = sub_2179E1D20();
  uint64_t v56 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  long long v58 = (char *)&v41 - v11;
  uint64_t v12 = sub_2179E1D20();
  uint64_t v54 = *(void *)(v12 - 8);
  uint64_t v55 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v50 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v53 = (char *)&v41 - v15;
  uint64_t v59 = v6;
  uint64_t v60 = v9;
  uint64_t v44 = v6;
  uint64_t v45 = v9;
  uint64_t v47 = v2;
  uint64_t v61 = v2;
  sub_2179E1E40();
  sub_2179E2380();
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v16 = v48;
  uint64_t v17 = v2;
  uint64_t v18 = a1;
  uint64_t v41 = a1;
  v46(v48, v17, a1);
  uint64_t v19 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v43 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v6;
  *(void *)(v21 + 24) = v9;
  unint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v23 = v16;
  v22(v21 + v20, v16, v18);
  uint64_t v24 = v49;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v42;
  sub_2179E2200();
  swift_release();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v24);
  uint64_t v27 = v41;
  v46(v23, v47, v41);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v45;
  *(void *)(v28 + 16) = v44;
  *(void *)(v28 + 24) = v29;
  v22(v28 + v20, v23, v27);
  uint64_t v30 = MEMORY[0x263F1A240];
  uint64_t v64 = WitnessTable;
  uint64_t v65 = MEMORY[0x263F1A240];
  uint64_t v31 = v52;
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = v50;
  int v34 = v58;
  sub_2179E2180();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v34, v31);
  uint64_t v62 = v32;
  uint64_t v63 = v30;
  uint64_t v35 = v55;
  swift_getWitnessTable();
  uint64_t v37 = v53;
  uint64_t v36 = v54;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v38(v53, v33, v35);
  char v39 = *(void (**)(char *, uint64_t))(v36 + 8);
  v39(v33, v35);
  v38(v57, v37, v35);
  return ((uint64_t (*)(char *, uint64_t))v39)(v37, v35);
}

uint64_t sub_2179A71C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v45 = v11;
  uint64_t v12 = type metadata accessor for RemoteImageView();
  uint64_t v40 = *(void *)(v12 - 8);
  uint64_t v38 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v12);
  char v39 = (char *)&v35 - v13;
  uint64_t v14 = sub_2179E22F0();
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v37 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B10);
  uint64_t v17 = sub_2179E1F70();
  uint64_t v43 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  MEMORY[0x270FA5388](v17);
  char v42 = (char *)&v35 - v18;
  sub_2179A6838();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = v47;
  if ((_BYTE)v48)
  {
    sub_2179906C8(v47, v48);
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v20(v10, a1 + *(int *)(v12 + 48), a2);
    v20(v8, (uint64_t)v10, a2);
    sub_2179A79F4();
    uint64_t v21 = v42;
    uint64_t v22 = v45;
    sub_21799006C((uint64_t)v8, v41, a2);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23(v8, a2);
    v23(v10, a2);
  }
  else
  {
    uint64_t v25 = v36;
    uint64_t v24 = v37;
    (*(void (**)(char *, void, uint64_t))(v36 + 104))(v16, *MEMORY[0x263F1B4B8], v37);
    swift_retain();
    uint64_t v26 = (void *)sub_2179E2320();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v24);
    char v27 = sub_2179A67E0();
    uint64_t v29 = v39;
    uint64_t v28 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, a1, v12);
    unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v31 = swift_allocObject();
    uint64_t v22 = v45;
    *(void *)(v31 + 16) = a2;
    *(void *)(v31 + 24) = v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v31 + v30, v29, v12);
    uint64_t v47 = v26;
    uint64_t v48 = 0;
    char v49 = 1;
    char v50 = v27;
    uint64_t v51 = sub_2179A88CC;
    uint64_t v52 = v31;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    sub_2179A79F4();
    swift_retain();
    swift_retain();
    uint64_t v21 = v42;
    sub_2179AAA3C((uint64_t)&v47, v41);
    sub_2179906C8(v19, 0);
    sub_2179906C8(v19, 0);
    swift_release_n();
    swift_release_n();
  }
  unint64_t v55 = sub_2179A79F4();
  uint64_t v56 = v22;
  uint64_t v32 = v44;
  swift_getWitnessTable();
  uint64_t v33 = v43;
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 16))(v46, v21, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v21, v32);
}

uint64_t sub_2179A76F4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  type metadata accessor for RemoteImageView();
  sub_2179A6838();
  a4();

  return swift_release();
}

uint64_t RemoteImageView<>.init(identifier:url:isLoaded:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v26 = a6;
  uint64_t v27 = a4;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v16 = &v25[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v25[-v17];
  sub_2179A791C(a3, (uint64_t)&v25[-v17]);
  uint64_t KeyPath = swift_getKeyPath();
  sub_2179A791C((uint64_t)v18, (uint64_t)v16);
  unint64_t v19 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  sub_2179A7988((uint64_t)v16, v20 + v19);
  if (a5)
  {
    char v21 = v26 & 1;
    uint64_t v22 = v27;
  }
  else
  {
    char v29 = 0;
    sub_2179E23D0();
    uint64_t v22 = v30;
    a5 = v31;
    char v21 = v32;
  }
  uint64_t v23 = sub_2179E2250();
  sub_21799F528((uint64_t)v18);
  uint64_t result = sub_21799F528(a3);
  *(void *)a7 = KeyPath;
  *(unsigned char *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = sub_2179A79F0;
  *(void *)(a7 + 24) = v20;
  *(unsigned char *)(a7 + 32) = 0;
  *(void *)(a7 + 40) = v22;
  *(void *)(a7 + 48) = a5;
  *(unsigned char *)(a7 + 56) = v21;
  *(void *)(a7 + 64) = 0;
  *(void *)(a7 + 72) = v23;
  return result;
}

uint64_t sub_2179A791C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2179A7988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2179A79F4()
{
  unint64_t result = qword_26ACF6B08;
  if (!qword_26ACF6B08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF6B10);
    sub_2179913A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6B08);
  }
  return result;
}

uint64_t sub_2179A7A70@<X0>(uint64_t a1@<X8>)
{
  return sub_2179A71C4(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_2179A7A80()
{
  return swift_release();
}

uint64_t sub_2179A7A88()
{
  return sub_2179A7ABC(sub_217989DCC);
}

uint64_t sub_2179A7AA4()
{
  return sub_2179A7ABC(sub_217989CB0);
}

uint64_t sub_2179A7ABC(void (*a1)(void))
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(type metadata accessor for RemoteImageView() - 8);
  return sub_2179A76F4(v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), v3, v4, a1);
}

uint64_t sub_2179A7B40()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_2179A6B60(v2, v3, v4);
}

uint64_t sub_2179A7BA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2179A7BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 72) & (unint64_t)~v7) + *(void *)(v6 + 64) > 0x18)
  {
    uint64_t v10 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v11 = *(void *)a2;
    char v12 = *(unsigned char *)(a2 + 8);
    sub_21798CC74(*(void *)a2, v12);
    *(void *)a1 = v11;
    *(unsigned char *)(a1 + 8) = v12;
    unint64_t v13 = a1 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v14 = a2 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
    uint64_t v16 = *(void *)(v14 + 24);
    char v17 = *(unsigned char *)(v14 + 32);
    sub_2179A7D78();
    *(void *)(v13 + 16) = v15;
    *(void *)(v13 + 24) = v16;
    *(unsigned char *)(v13 + 32) = v17;
    *(void *)(v13 + 40) = *(void *)(v14 + 40);
    *(void *)(v13 + 48) = *(void *)(v14 + 48);
    *(unsigned char *)(v13 + 56) = *(unsigned char *)(v14 + 56);
    *(void *)(v13 + 64) = *(void *)(v14 + 64);
    uint64_t v18 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v18(((a1 & 0xFFFFFFFFFFFFFFF8) + v7 + 72) & ~v7, (v14 + v7 + 72) & ~v7, v5);
  }
  return a1;
}

uint64_t sub_2179A7D78()
{
  return swift_retain();
}

uint64_t sub_2179A7D80(uint64_t a1, uint64_t a2)
{
  sub_217986828(*(void *)a1, *(unsigned char *)(a1 + 8));
  sub_2179A7A80();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = ((a1 & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

uint64_t sub_2179A7E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_21798CC74(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  unint64_t v8 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v11 = *(void *)(v9 + 24);
  char v12 = *(unsigned char *)(v9 + 32);
  sub_2179A7D78();
  *(void *)(v8 + 16) = v10;
  *(void *)(v8 + 24) = v11;
  *(unsigned char *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = *(void *)(v9 + 40);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);
  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  unint64_t v17 = (v16 + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~v16;
  uint64_t v18 = (v16 + 72 + v9) & ~v16;
  swift_retain();
  swift_retain();
  swift_retain();
  v15(v17, v18, v13);
  return a1;
}

uint64_t sub_2179A7F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_21798CC74(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_217986828(v8, v9);
  unint64_t v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = a2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v13 = *(void *)(v11 + 24);
  char v14 = *(unsigned char *)(v11 + 32);
  sub_2179A7D78();
  *(void *)(v10 + 16) = v12;
  *(void *)(v10 + 24) = v13;
  *(unsigned char *)(v10 + 32) = v14;
  sub_2179A7A80();
  *(void *)(v10 + 40) = *(void *)(v11 + 40);
  swift_retain();
  swift_release();
  *(void *)(v10 + 48) = *(void *)(v11 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(v10 + 56) = *(unsigned char *)(v11 + 56);
  *(void *)(v10 + 64) = *(void *)(v11 + 64);
  swift_retain();
  swift_release();
  uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 24))((*(unsigned __int8 *)(v15 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (*(unsigned __int8 *)(v15 + 80) + 72 + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2179A8068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF8;
  long long v5 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(unsigned char *)(v4 + 32) = *(unsigned char *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_OWORD *)(v4 + 16) = v5;
  long long v6 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(unsigned char *)(v4 + 56) = *(unsigned char *)((a2 & 0xFFFFFFFFFFFFFFF8) + 56);
  *(_OWORD *)(v4 + 40) = v6;
  *(void *)(v4 + 64) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 64);
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(unsigned __int8 *)(v7 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 72 + (a2 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_2179A8110(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a2;
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_217986828(v8, v9);
  unint64_t v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (uint64_t *)((unint64_t)v4 & 0xFFFFFFFFFFFFFFF8);
  char v11 = *((unsigned char *)v4 + 32);
  *(_OWORD *)(v10 + 16) = *((_OWORD *)v4 + 1);
  *(unsigned char *)(v10 + 32) = v11;
  sub_2179A7A80();
  *(void *)(v10 + 40) = v4[5];
  swift_release();
  *(void *)(v10 + 48) = v4[6];
  swift_release();
  *(unsigned char *)(v10 + 56) = *((unsigned char *)v4 + 56);
  *(void *)(v10 + 64) = v4[8];
  swift_release();
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))((*(unsigned __int8 *)(v12 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), ((unint64_t)v4 + *(unsigned __int8 *)(v12 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_2179A8200(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 72) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)(a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((v15 + v6 + 72) & ~v6);
      }
      unint64_t v16 = *(void *)(v15 + 48);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(unsigned char *)(a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v9) = *(unsigned __int16 *)a1 | (*(unsigned __int8 *)(a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_2179A83A4(unint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 72) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero((void *)a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          *(unsigned char *)(a1 + 2) = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *(unsigned char *)a1 = v17;
        }
      }
    }
    else
    {
      bzero((void *)a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        *(unsigned char *)(a1 + v10) = v15;
        return;
      case 2:
        *(_WORD *)(a1 + v10) = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)(a1 + v10) = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      *(unsigned char *)(a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)(a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x2179A860CLL);
    case 4:
      *(_DWORD *)(a1 + v10) = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        unint64_t v18 = a1 & 0xFFFFFFFFFFFFFFF8;
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19((v18 + v9 + 72) & ~v9);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(unsigned char *)(v18 + 56) = 0;
          *(void *)(v18 + 40) = a2 ^ 0x80000000;
          *(void *)(v18 + 48) = 0;
        }
        else
        {
          *(void *)(v18 + 48) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t sub_2179A8634()
{
  return swift_getWitnessTable();
}

unint64_t sub_2179A8750()
{
  unint64_t result = qword_26ACF7670;
  if (!qword_26ACF7670)
  {
    type metadata accessor for RemoteImageLoader();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7670);
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for RemoteImageView() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  sub_217986828(*(void *)(v0 + v4), *(unsigned char *)(v0 + v4 + 8));
  sub_2179A7A80();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[14], v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2179A88CC()
{
  return sub_2179A6898();
}

uint64_t sub_2179A8938()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();

  return swift_release();
}

uint64_t sub_2179A89B0()
{
  sub_2179898F8();
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_21798B28C(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url, &qword_26ACF6BC8);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2179A8A94()
{
  return type metadata accessor for RemoteFileLoader();
}

uint64_t sub_2179A8A9C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RemoteFileLoader();
  uint64_t result = sub_2179E1A40();
  *a1 = result;
  return result;
}

unint64_t sub_2179A8AE4()
{
  unint64_t result = qword_26ACF69C8;
  if (!qword_26ACF69C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF69C8);
  }
  return result;
}

uint64_t sub_2179A8B38()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2179A8B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2179A8BE4()
{
}

id _PlayerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void _PlayerView.init(frame:)()
{
}

id _PlayerView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PlayerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t static _PlayerView.layerClass.getter()
{
  return sub_217986E98();
}

Swift::Void __swiftcall _PlayerView.layoutSubviews()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PlayerView();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  id v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setBounds_);
}

uint64_t method lookup function for _PlayerView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _PlayerView);
}

uint64_t assignWithCopy for VideoPlayerViewRepresentable(uint64_t a1, void **a2)
{
  objc_super v2 = a2;
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  id v6 = v5;

  uint64_t v7 = (uint64_t)v2[1];
  LOBYTE(v2) = *((unsigned char *)v2 + 16);
  sub_21798CC74(v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = (_BYTE)v2;
  sub_217986828(v8, v9);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VideoPlayerViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v5;
  sub_217986828(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoPlayerViewRepresentable(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for VideoPlayerViewRepresentable(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t sub_2179A8F90()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2179A8F9C()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2179A8FE4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2179A9030())()
{
  return j_j__swift_endAccess;
}

id TPSUIAppController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t sub_2179A90C0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2179A90F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2179E24A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E24D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  size_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  BOOL v11 = (char *)MEMORY[0x21D452890](a2 + 16);
  if (v11)
  {
    unsigned int v12 = v11;
    int v13 = *(void **)&v11[OBJC_IVAR___TPSUIAppController_syncQueue];
    if (v13)
    {
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v12;
      aBlock[4] = sub_2179AAA30;
      aBlock[5] = v14;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2179911FC;
      aBlock[3] = &block_descriptor_59;
      int v15 = _Block_copy(aBlock);
      uint64_t v19 = v7;
      unsigned int v16 = v15;
      id v17 = v13;
      id v18 = v12;
      sub_2179E24C0();
      uint64_t v20 = MEMORY[0x263F8EE78];
      sub_21798726C((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
      sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
      sub_2179E2C20();
      MEMORY[0x21D451C00](0, v10, v6, v16);
      _Block_release(v16);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);

      swift_release();
    }
    else
    {
    }
  }
}

void sub_2179A93F8(uint64_t a1)
{
  sub_2179A90F8(a1, v1);
}

uint64_t sub_2179A9400(uint64_t a1)
{
  uint64_t v2 = sub_2179E1770();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_2179E1760();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_2179A94F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2179AA550(a1, a2, a3, a5, a6);
}

uint64_t sub_2179A95C4(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = 0;
  uint64_t v3 = *(void **)&v2[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (!v3)
  {
    uint64_t v14 = 0;
    int v13 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = &v16;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2179AA600;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_2179A4E30;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2179A97A0;
  aBlock[3] = &block_descriptor_15;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = v3;
  size_t v10 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v8);

  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    int v13 = sub_2179AA600;
    uint64_t v14 = v16;
LABEL_5:
    sub_21798E45C((uint64_t)v13);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_2179A9778(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2179A97A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2179A97E0(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = 0;
  uint64_t v3 = *(void **)&v2[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (!v3)
  {
    uint64_t v14 = 0;
    int v13 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = &v16;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2179AA67C;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_2179AA9FC;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2179A97A0;
  aBlock[3] = &block_descriptor_25;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = v3;
  size_t v10 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v8);

  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    int v13 = sub_2179AA67C;
    uint64_t v14 = v16;
LABEL_5:
    sub_21798E45C((uint64_t)v13);
    return v14;
  }
  __break(1u);
  return result;
}

void sub_2179A9994(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (uint64_t *)(a2 + *a5);
  swift_beginAccess();
  uint64_t v9 = *v8;
  if (v9 && *(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_2179B2CDC(a3, a4);
    if (v11)
    {
      unsigned int v12 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
      id v13 = v12;
    }
    else
    {
      unsigned int v12 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned int v12 = 0;
  }
  uint64_t v14 = *a1;
  *a1 = v12;
}

id sub_2179A9A68(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_2179E2930();
  uint64_t v8 = v7;
  id v9 = a1;
  unint64_t v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();

  return v10;
}

uint64_t sub_2179A9AE0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A9B48(a1, a2, a3, (uint64_t)&unk_26C7F29F0, (uint64_t)sub_2179AA6B8, (uint64_t)&block_descriptor_31);
}

uint64_t sub_2179A9B20(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A9B48(a1, a2, a3, (uint64_t)&unk_26C7F2A40, (uint64_t)sub_2179AA738, (uint64_t)&block_descriptor_37);
}

uint64_t sub_2179A9B48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v10 = sub_2179E24A0();
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unsigned int v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2179E24D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t result = MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = *(void **)&v6[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v18)
  {
    uint64_t v25 = result;
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v6;
    v19[3] = a2;
    v19[4] = a3;
    v19[5] = a1;
    aBlock[4] = v26;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179911FC;
    aBlock[3] = v27;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = a1;
    id v22 = v18;
    uint64_t v23 = v6;
    swift_bridgeObjectRetain();
    sub_2179E24C0();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_21798726C((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
    sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
    sub_2179E2C20();
    MEMORY[0x21D451C00](0, v17, v12, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v10);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v25);
    return swift_release();
  }
  return result;
}

uint64_t sub_2179A9E14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(unsigned char *))
{
  id v9 = (uint64_t (*)(unsigned char *, void))a5(v16);
  if (*v8)
  {
    uint64_t v10 = v8;
    swift_bridgeObjectRetain();
    if (a4)
    {
      id v11 = a4;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = *v10;
      *uint64_t v10 = 0x8000000000000000;
      sub_2179A6114((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
      *uint64_t v10 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = (void *)sub_2179BD138(a2, a3);
      swift_bridgeObjectRelease();
    }
  }
  return v9(v16, 0);
}

uint64_t sub_2179A9F50(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void *, uint64_t, uint64_t))
{
  uint64_t v8 = sub_2179E2930();
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = a1;
  a5(a3, v8, v10);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2179A9FDC()
{
  uint64_t v1 = sub_2179E24A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E24D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v0[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v10)
  {
    v15[0] = result;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v0;
    aBlock[4] = sub_2179AAA30;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179911FC;
    aBlock[3] = &block_descriptor_44;
    id v12 = _Block_copy(aBlock);
    id v13 = v10;
    uint64_t v14 = v0;
    sub_2179E24C0();
    v15[1] = MEMORY[0x263F8EE78];
    sub_21798726C((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
    sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
    sub_2179E2C20();
    MEMORY[0x21D451C00](0, v9, v4, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, void))(v6 + 8))(v9, v15[0]);
    return swift_release();
  }
  return result;
}

uint64_t sub_2179AA294()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id TPSUIAppController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSUIAppController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void TPSUIAppController.overrideWidget(with:)(uint64_t a1)
{
  type metadata accessor for TipsContentModel();
  id v4 = static TipsContentModel.shared()();
  if (objc_msgSend(self, sel_isInternalBuild))
  {
    id v2 = sub_2179D17A4();
    objc_msgSend(v2, sel_attemptWidgetUpdateWith_, a1);

    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = v4;
  }
}

id sub_2179AA550(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = 0;
  if (a1 && a3)
  {
    id v9 = a1;
    uint64_t v10 = (void *)sub_2179E2900();
    id v6 = objc_msgSend(v5, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v9, v10, a4 != 1, a5);
  }
  return v6;
}

void sub_2179AA600()
{
  sub_2179A9994(*(void ***)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), &OBJC_IVAR___TPSUIAppController_attributedStringCache);
}

uint64_t sub_2179AA628()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t objectdestroy_8Tm()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2179AA67C()
{
  sub_2179A9994(*(void ***)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), &OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache);
}

uint64_t sub_2179AA6A4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179AA6B8()
{
  return sub_2179A9E14(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), (uint64_t (*)(unsigned char *))sub_2179918E4);
}

uint64_t objectdestroy_27Tm()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2179AA738()
{
  return sub_2179A9E14(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), (uint64_t (*)(unsigned char *))sub_217991880);
}

uint64_t sub_2179AA76C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2179AA7C0(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t method lookup function for TPSUIAppController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TPSUIAppController);
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPSUIAppController.assetConfiguration(assets:language:sizeClass:style:assetFileInfoManager:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TPSUIAppController.attributedStringForIdentifier(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TPSUIAppController.footNoteAttributedStringForIdentifier(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPSUIAppController.updateAttributedString(_:forIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TPSUIAppController.updateFootnoteAttributedString(_:forIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSUIAppController.resetAttributedStringCache()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t sub_2179AAA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2179E1F50();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_2179E1F60();
}

uint64_t *sub_2179AAB34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 40) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v10 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    id v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    id v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    void *v12 = *v13;
    uint64_t v14 = ((unint64_t)v12 + v6 + 8) & ~v6;
    uint64_t v15 = ((unint64_t)v13 + v6 + 8) & ~v6;
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
  }
  return v3;
}

_OWORD *sub_2179AAC68(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = (void *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))(((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

_OWORD *sub_2179AAD00(_OWORD *a1, long long *a2, uint64_t a3)
{
  long long v6 = *a2;
  unint64_t v5 = (unint64_t)a2 + 23;
  *a1 = v6;
  uint64_t v7 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *(void *)(v5 & 0xFFFFFFFFFFFFFFF8);
  v7[1] = *(void *)((v5 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v8 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (void *)(((v5 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v8 = *v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 40))(((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v9 + *(unsigned __int8 *)(v10 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

uint64_t sub_2179AADB8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 40) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      uint64_t v15 = (unint64_t *)(((((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v15 + v6 + 8) & ~v6);
      }
      unint64_t v16 = *v15;
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_2179AAF68(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 40) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x2179AB1D4);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        id v18 = (void *)((((unint64_t)(a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
        if ((v7 & 0x80000000) != 0)
        {
          uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(((unint64_t)v18 + v9 + 8) & ~v9);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v19 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v19 = a2 - 1;
          }
          *id v18 = v19;
        }
      }
      return;
  }
}

uint64_t sub_2179AB1FC()
{
  return swift_getWitnessTable();
}

uint64_t View.modify<A>(_:)(uint64_t (*a1)(uint64_t))
{
  return a1(v1);
}

uint64_t View.when<A>(_:_:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v36 = a7;
  uint64_t v37 = a6;
  uint64_t v30 = a3;
  uint64_t v31 = a2;
  int v32 = a1;
  uint64_t v35 = a8;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  int v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  unsigned int v16 = (char *)&v30 - v15;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v14);
  id v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v30 - v22;
  uint64_t v24 = sub_2179E1F70();
  uint64_t v34 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v30 - v25;
  if (v32)
  {
    v31(v33);
    sub_21798F890((uint64_t)v21, a5, (uint64_t)v23);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v18 + 8);
    v27(v21, a5);
    sub_21798F890((uint64_t)v23, a5, (uint64_t)v21);
    sub_2179AAA3C((uint64_t)v21, a5);
    v27(v21, a5);
    v27(v23, a5);
  }
  else
  {
    sub_21798F890(v33, a4, (uint64_t)v16);
    sub_21798F890((uint64_t)v16, a4, (uint64_t)v13);
    sub_21799006C((uint64_t)v13, a5, a4);
    uint64_t v28 = *(void (**)(char *, uint64_t))(v10 + 8);
    v28(v13, a4);
    v28(v16, a4);
  }
  uint64_t v38 = v36;
  uint64_t v39 = v37;
  swift_getWitnessTable();
  sub_21798F890((uint64_t)v26, v24, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v26, v24);
}

uint64_t sub_2179AB6B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2179AB718()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179AB790()
{
  sub_217989CB0();
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_21798B28C(v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url, &qword_26ACF6BC8);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2179AB874()
{
  return type metadata accessor for RemoteImageLoader();
}

uint64_t sub_2179AB87C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RemoteImageLoader();
  uint64_t result = sub_2179E1A40();
  *a1 = result;
  return result;
}

uint64_t sub_2179AB8C4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2179AB8FC(uint64_t a1, unint64_t a2)
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

uint64_t TPSSearchQueryClient.performQuery(_:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2179AB974, 0, 0);
}

uint64_t sub_2179AB974()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = sub_2179E2670();
  *uint64_t v2 = v0;
  v2[1] = sub_2179ABA78;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000010, 0x80000002179E78F0, sub_21799ED64, v1, v3);
}

uint64_t sub_2179ABA78()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2179ABBB0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2179ABB94;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2179ABB94()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2179ABBB0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2179ABC14(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6368);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_2179ABF48;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2179ABFCC;
  aBlock[3] = &block_descriptor_3;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_performQuery_completion_, a3, v11);
  _Block_release(v11);
}

uint64_t sub_2179ABDC4(void *a1, id a2)
{
  if (a1)
  {
    id v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6368);
    return sub_2179E2A30();
  }
  else
  {
    if (!a2)
    {
      uint64_t v5 = sub_2179E2580();
      sub_2179AC058();
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v5 - 8) + 104))(v6, *MEMORY[0x263F7F4F8], v5);
    }
    id v7 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6368);
    return sub_2179E2A20();
  }
}

uint64_t sub_2179ABEB4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6368);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2179ABF48(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6368);

  return sub_2179ABDC4(a1, a2);
}

void sub_2179ABFCC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_2179AC058()
{
  unint64_t result = qword_267BA6370;
  if (!qword_267BA6370)
  {
    sub_2179E2580();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6370);
  }
  return result;
}

char *sub_2179AC0B0(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    a1[24] = *((unsigned char *)a2 + 24);
    uint64_t v8 = *(int *)(a3 + 28);
    unint64_t v9 = (void **)&a1[v8];
    uint64_t v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = (int *)type metadata accessor for ConstellationContentAttributes(0);
    uint64_t v12 = *((void *)v11 - 1);
    int v13 = *(unsigned int (**)(void **, uint64_t, int *))(v12 + 48);
    uint64_t v14 = v4;
    if (v13(v10, 1, v11))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v33 = *v10;
      uint64_t v34 = v10[1];
      *unint64_t v9 = *v10;
      v9[1] = v34;
      __src = v10[3];
      v9[2] = v10[2];
      v9[3] = __src;
      long long v16 = *((_OWORD *)v10 + 3);
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
      *((_OWORD *)v9 + 3) = v16;
      *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
      *((unsigned char *)v9 + 80) = *((unsigned char *)v10 + 80);
      *((unsigned char *)v9 + 81) = *((unsigned char *)v10 + 81);
      *((unsigned char *)v9 + 82) = *((unsigned char *)v10 + 82);
      *(_OWORD *)(v9 + 11) = *(_OWORD *)(v10 + 11);
      uint64_t v17 = v11[15];
      __dst = (char *)v9 + v17;
      uint64_t v18 = (char *)v10 + v17;
      uint64_t v19 = sub_2179E18F0();
      uint64_t v30 = *(void *)(v19 - 8);
      int v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
      id v20 = v33;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (v32(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
        memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(__dst, v18, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(__dst, 0, 1, v19);
      }
      uint64_t v22 = v11[16];
      uint64_t v23 = (char *)v9 + v22;
      uint64_t v24 = (char *)v10 + v22;
      *(void *)uint64_t v23 = *(void *)v24;
      v23[8] = v24[8];
      *((unsigned char *)v9 + v11[17]) = *((unsigned char *)v10 + v11[17]);
      (*(void (**)(void **, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v25 = *(int *)(a3 + 32);
    uint64_t v26 = &v7[v25];
    uint64_t v27 = (char **)((char *)a2 + v25);
    if (*v27)
    {
      uint64_t v28 = v27[1];
      *(void *)uint64_t v26 = *v27;
      *((void *)v26 + 1) = v28;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    }
  }
  return v7;
}

uint64_t sub_2179AC3CC(id *a1, uint64_t a2)
{
  uint64_t v4 = (id *)((char *)a1 + *(int *)(a2 + 28));
  uint64_t v5 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    id v7 = (char *)v4 + *(int *)(v5 + 60);
    uint64_t v8 = sub_2179E18F0();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    if (!result) {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  if (*(id *)((char *)a1 + *(int *)(a2 + 32)))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_2179AC528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  id v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void **)(a1 + v7);
  uint64_t v9 = (void **)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(unsigned int (**)(void **, uint64_t, int *))(v11 + 48);
  id v13 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v35 = v3;
    uint64_t v31 = *v9;
    int v32 = v9[1];
    void *v8 = *v9;
    v8[1] = v32;
    uint64_t v33 = v9[3];
    v8[2] = v9[2];
    v8[3] = v33;
    long long v15 = *((_OWORD *)v9 + 3);
    *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
    *((_OWORD *)v8 + 3) = v15;
    *((_OWORD *)v8 + 4) = *((_OWORD *)v9 + 4);
    *((unsigned char *)v8 + 80) = *((unsigned char *)v9 + 80);
    *((unsigned char *)v8 + 81) = *((unsigned char *)v9 + 81);
    *((unsigned char *)v8 + 82) = *((unsigned char *)v9 + 82);
    *(_OWORD *)(v8 + 11) = *(_OWORD *)(v9 + 11);
    uint64_t v16 = v10[15];
    __dst = (char *)v8 + v16;
    uint64_t v17 = (char *)v9 + v16;
    uint64_t v18 = sub_2179E18F0();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    id v20 = v31;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v30(v17, 1, v18))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
      memcpy(__dst, v17, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(__dst, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
    }
    uint64_t v22 = v10[16];
    uint64_t v23 = (char *)v8 + v22;
    uint64_t v24 = (char *)v9 + v22;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    *((unsigned char *)v8 + v10[17]) = *((unsigned char *)v9 + v10[17]);
    (*(void (**)(void **, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
    uint64_t v3 = v35;
  }
  uint64_t v25 = *(int *)(v3 + 32);
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  if (*v27)
  {
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  }
  return a1;
}

uint64_t sub_2179AC7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v13 = *((void *)v12 - 1);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_2179A6784(v10);
      goto LABEL_7;
    }
    uint64_t v57 = a3;
    uint64_t v24 = *(void **)v10;
    uint64_t v25 = *(void **)v11;
    *(void *)uint64_t v10 = *(void *)v11;
    id v26 = v25;

    *(void *)(v10 + 8) = *(void *)(v11 + 8);
    swift_retain();
    swift_release();
    *(void *)(v10 + 16) = *(void *)(v11 + 16);
    swift_retain();
    swift_release();
    *(void *)(v10 + 24) = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v10 + 32) = *(void *)(v11 + 32);
    *(void *)(v10 + 40) = *(void *)(v11 + 40);
    *(void *)(v10 + 48) = *(void *)(v11 + 48);
    *(void *)(v10 + 56) = *(void *)(v11 + 56);
    *(void *)(v10 + 64) = *(void *)(v11 + 64);
    *(void *)(v10 + 72) = *(void *)(v11 + 72);
    *(unsigned char *)(v10 + 80) = *(unsigned char *)(v11 + 80);
    *(unsigned char *)(v10 + 81) = *(unsigned char *)(v11 + 81);
    *(unsigned char *)(v10 + 82) = *(unsigned char *)(v11 + 82);
    *(void *)(v10 + 88) = *(void *)(v11 + 88);
    *(void *)(v10 + 96) = *(void *)(v11 + 96);
    uint64_t v27 = v12[15];
    uint64_t v28 = (void *)(v10 + v27);
    uint64_t v29 = (void *)(v11 + v27);
    uint64_t v30 = sub_2179E18F0();
    uint64_t v53 = *(void *)(v30 - 8);
    uint64_t v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v53 + 48);
    unint64_t v55 = v28;
    LODWORD(v28) = v31(v28, 1, v30);
    int v32 = v31(v29, 1, v30);
    if (v28)
    {
      if (!v32)
      {
        (*(void (**)(void *, void *, uint64_t))(v53 + 16))(v55, v29, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(v55, 0, 1, v30);
        goto LABEL_18;
      }
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658) - 8) + 64);
      uint64_t v34 = v55;
    }
    else
    {
      if (!v32)
      {
        (*(void (**)(void *, void *, uint64_t))(v53 + 24))(v55, v29, v30);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v53 + 8))(v55, v30);
      size_t v33 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658) - 8) + 64);
      uint64_t v34 = v55;
    }
    memcpy(v34, v29, v33);
LABEL_18:
    a3 = v57;
    uint64_t v39 = v12[16];
    uint64_t v40 = v10 + v39;
    uint64_t v41 = (uint64_t *)(v11 + v39);
    uint64_t v42 = *v41;
    *(unsigned char *)(v40 + 8) = *((unsigned char *)v41 + 8);
    *(void *)uint64_t v40 = v42;
    *(unsigned char *)(v10 + v12[17]) = *(unsigned char *)(v11 + v12[17]);
    goto LABEL_19;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    memcpy((void *)v10, (const void *)v11, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  uint64_t v56 = a3;
  uint64_t v52 = *(void **)v11;
  *(void *)uint64_t v10 = *(void *)v11;
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  *(void *)(v10 + 16) = *(void *)(v11 + 16);
  *(void *)(v10 + 24) = *(void *)(v11 + 24);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v11 + 48);
  *(void *)(v10 + 64) = *(void *)(v11 + 64);
  *(void *)(v10 + 72) = *(void *)(v11 + 72);
  *(unsigned char *)(v10 + 80) = *(unsigned char *)(v11 + 80);
  *(unsigned char *)(v10 + 81) = *(unsigned char *)(v11 + 81);
  *(unsigned char *)(v10 + 82) = *(unsigned char *)(v11 + 82);
  *(void *)(v10 + 88) = *(void *)(v11 + 88);
  *(void *)(v10 + 96) = *(void *)(v11 + 96);
  uint64_t v17 = v12[15];
  uint64_t v54 = (void *)(v10 + v17);
  uint64_t v18 = (const void *)(v11 + v17);
  uint64_t v19 = sub_2179E18F0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v51 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  id v21 = v52;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v51(v18, 1, v19))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(v54, v18, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v54, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v54, 0, 1, v19);
  }
  a3 = v56;
  uint64_t v35 = v12[16];
  uint64_t v36 = v10 + v35;
  uint64_t v37 = (uint64_t *)(v11 + v35);
  uint64_t v38 = *v37;
  *(unsigned char *)(v36 + 8) = *((unsigned char *)v37 + 8);
  *(void *)uint64_t v36 = v38;
  *(unsigned char *)(v10 + v12[17]) = *(unsigned char *)(v11 + v12[17]);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
LABEL_19:
  uint64_t v43 = *(int *)(a3 + 32);
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (uint64_t *)(a2 + v43);
  uint64_t v46 = *(void *)(a1 + v43);
  uint64_t v47 = *v45;
  if (!v46)
  {
    if (v47)
    {
      uint64_t v49 = v45[1];
      *uint64_t v44 = v47;
      v44[1] = v49;
      swift_retain();
      return a1;
    }
LABEL_25:
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
    return a1;
  }
  if (!v47)
  {
    swift_release();
    goto LABEL_25;
  }
  uint64_t v48 = v45[1];
  *uint64_t v44 = v47;
  v44[1] = v48;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2179ACDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (_OWORD *)(a1 + v6);
  id v8 = (_OWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    _OWORD *v7 = *v8;
    *((void *)v7 + 2) = *((void *)v8 + 2);
    *(_OWORD *)((char *)v7 + 24) = *(_OWORD *)((char *)v8 + 24);
    *(_OWORD *)((char *)v7 + 40) = *(_OWORD *)((char *)v8 + 40);
    *((void *)v7 + 7) = *((void *)v8 + 7);
    v7[4] = v8[4];
    *((unsigned char *)v7 + 80) = *((unsigned char *)v8 + 80);
    *(_WORD *)((char *)v7 + 81) = *(_WORD *)((char *)v8 + 81);
    *(_OWORD *)((char *)v7 + 88) = *(_OWORD *)((char *)v8 + 88);
    uint64_t v12 = v9[15];
    __dst = (char *)v7 + v12;
    uint64_t v13 = (char *)v8 + v12;
    uint64_t v14 = sub_2179E18F0();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
      memcpy(__dst, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(__dst, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    uint64_t v17 = v9[16];
    uint64_t v18 = (char *)v7 + v17;
    uint64_t v19 = (char *)v8 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    *((unsigned char *)v7 + v9[17]) = *((unsigned char *)v8 + v9[17]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v20 = *(int *)(a3 + 32);
  id v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = *v22;
  if (*v22)
  {
    uint64_t v24 = v22[1];
    *id v21 = v23;
    v21[1] = v24;
  }
  else
  {
    *(_OWORD *)id v21 = *(_OWORD *)v22;
  }
  return a1;
}

uint64_t sub_2179AD058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_2179A6784(v8);
      goto LABEL_7;
    }
    uint64_t v46 = a3;
    id v21 = *(void **)v8;
    *(void *)uint64_t v8 = *(void *)v9;

    *(void *)(v8 + 8) = *(void *)(v9 + 8);
    swift_release();
    *(void *)(v8 + 16) = *(void *)(v9 + 16);
    swift_release();
    *(void *)(v8 + 24) = *(void *)(v9 + 24);
    swift_bridgeObjectRelease();
    long long v22 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v22;
    *(void *)(v8 + 64) = *(void *)(v9 + 64);
    *(void *)(v8 + 72) = *(void *)(v9 + 72);
    *(unsigned char *)(v8 + 80) = *(unsigned char *)(v9 + 80);
    *(unsigned char *)(v8 + 81) = *(unsigned char *)(v9 + 81);
    *(unsigned char *)(v8 + 82) = *(unsigned char *)(v9 + 82);
    *(_OWORD *)(v8 + 88) = *(_OWORD *)(v9 + 88);
    uint64_t v23 = v10[15];
    uint64_t v24 = (void *)(v8 + v23);
    uint64_t v25 = (void *)(v9 + v23);
    uint64_t v26 = sub_2179E18F0();
    uint64_t v45 = *(void *)(v26 - 8);
    uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v45 + 48);
    __dsta = v24;
    LODWORD(v24) = v27(v24, 1, v26);
    int v28 = v27(v25, 1, v26);
    if (v24)
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v45 + 32))(__dsta, v25, v26);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v45 + 56))(__dsta, 0, 1, v26);
        goto LABEL_18;
      }
      size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658) - 8) + 64);
      uint64_t v30 = __dsta;
    }
    else
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v45 + 40))(__dsta, v25, v26);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v45 + 8))(__dsta, v26);
      size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658) - 8) + 64);
      uint64_t v30 = __dsta;
    }
    memcpy(v30, v25, v29);
LABEL_18:
    a3 = v46;
    uint64_t v34 = v10[16];
    uint64_t v35 = v8 + v34;
    uint64_t v36 = v9 + v34;
    *(void *)uint64_t v35 = *(void *)v36;
    *(unsigned char *)(v35 + 8) = *(unsigned char *)(v36 + 8);
    *(unsigned char *)(v8 + v10[17]) = *(unsigned char *)(v9 + v10[17]);
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    memcpy((void *)v8, (const void *)v9, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
  *(unsigned char *)(v8 + 80) = *(unsigned char *)(v9 + 80);
  *(_WORD *)(v8 + 81) = *(_WORD *)(v9 + 81);
  *(_OWORD *)(v8 + 88) = *(_OWORD *)(v9 + 88);
  uint64_t v15 = v10[15];
  __dst = (void *)(v8 + v15);
  uint64_t v16 = (const void *)(v9 + v15);
  uint64_t v17 = sub_2179E18F0();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(__dst, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(__dst, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  uint64_t v31 = v10[16];
  uint64_t v32 = v8 + v31;
  uint64_t v33 = v9 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  *(unsigned char *)(v8 + v10[17]) = *(unsigned char *)(v9 + v10[17]);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_19:
  uint64_t v37 = *(int *)(a3 + 32);
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (uint64_t *)(a2 + v37);
  uint64_t v40 = *(void *)(a1 + v37);
  uint64_t v41 = *v39;
  if (!v40)
  {
    if (v41)
    {
      uint64_t v43 = v39[1];
      *uint64_t v38 = v41;
      v38[1] = v43;
      return a1;
    }
LABEL_25:
    *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
    return a1;
  }
  if (!v41)
  {
    swift_release();
    goto LABEL_25;
  }
  uint64_t v42 = v39[1];
  *uint64_t v38 = v41;
  v38[1] = v42;
  swift_release();
  return a1;
}

uint64_t sub_2179AD568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2179AD57C);
}

uint64_t sub_2179AD57C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2179AD630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2179AD644);
}

void *sub_2179AD644(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AttributedTextView()
{
  uint64_t result = qword_26ACF7690;
  if (!qword_26ACF7690) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2179AD73C()
{
  sub_2179AD7F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2179AD7F4()
{
  if (!qword_26ACF7700)
  {
    type metadata accessor for ConstellationContentAttributes(255);
    unint64_t v0 = sub_2179E2C00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACF7700);
    }
  }
}

uint64_t sub_2179AD84C()
{
  return sub_2179AE43C(&qword_26ACF7680, (void (*)(uint64_t))type metadata accessor for AttributedTextView);
}

id sub_2179AD894()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v19 - v5;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v8);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v7, sel_setContentHuggingPriority_forAxis_, 1, v9);
  uint64_t v10 = self;
  id v11 = v7;
  id v12 = objc_msgSend(v10, sel_clearColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  objc_msgSend(v11, sel_setClipsToBounds_, 0);
  uint64_t v13 = v0 + *(int *)(type metadata accessor for AttributedTextView() + 28);
  sub_21798B2E8(v13, (uint64_t)v6, &qword_26ACF76F8);
  uint64_t v14 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  if (v15(v6, 1, v14) == 1)
  {
    sub_21798B28C((uint64_t)v6, &qword_26ACF76F8);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = *((void *)v6 + 11);
    sub_2179A6784((uint64_t)v6);
  }
  sub_21798B2E8(v13, (uint64_t)v4, &qword_26ACF76F8);
  if (v15(v4, 1, v14) == 1)
  {
    sub_21798B28C((uint64_t)v4, &qword_26ACF76F8);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = *((void *)v4 + 12);
    sub_2179A6784((uint64_t)v4);
  }
  objc_msgSend(v11, sel_setNumberOfLines_, v16);
  objc_msgSend(v11, sel_setLineBreakMode_, v17);
  return v11;
}

id sub_2179ADB10(void *a1)
{
  uint64_t v57 = sub_2179E1A10();
  MEMORY[0x270FA5388](v57);
  uint64_t v56 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7668);
  MEMORY[0x270FA5388](v58);
  uint64_t v59 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  id v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v55 = (uint64_t)&v48 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v48 - v18;
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v48 - v20;
  uint64_t v22 = sub_2179E18F0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v54 = (char *)&v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v60 = (char *)&v48 - v26;
  objc_msgSend(a1, sel_frame);
  if (CGRectGetWidth(v62) == 0.0)
  {
    double Width = *(double *)(v1 + 8);
  }
  else
  {
    objc_msgSend(a1, sel_frame);
    double Width = CGRectGetWidth(v63);
  }
  id v61 = a1;
  uint64_t v28 = type metadata accessor for AttributedTextView();
  sub_21798B2E8(v1 + *(int *)(v28 + 28), (uint64_t)v7, &qword_26ACF76F8);
  uint64_t v29 = type metadata accessor for ConstellationContentAttributes(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v7, 1, v29) != 1)
  {
    sub_21798B2E8((uint64_t)&v7[*(int *)(v29 + 60)], (uint64_t)v21, &qword_26ACF7658);
    sub_2179A6784((uint64_t)v7);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    if (v30(v21, 1, v22) == 1) {
      goto LABEL_7;
    }
    uint64_t v53 = v11;
    uint64_t v33 = v60;
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v48(v60, v21, v22);
    id v34 = objc_msgSend(v61, sel_traitCollection);
    MEMORY[0x21D451C30]();

    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
    uint64_t v51 = v23 + 16;
    uint64_t v49 = v35;
    v35(v16, v33, v22);
    uint64_t v36 = *(uint64_t (**)(char *, void, uint64_t, uint64_t))(v23 + 56);
    uint64_t v52 = v23 + 56;
    char v50 = v36;
    v36(v16, 0, 1, v22);
    uint64_t v37 = v59;
    uint64_t v38 = v59 + *(int *)(v58 + 48);
    sub_21798B2E8((uint64_t)v19, v59, &qword_26ACF7658);
    sub_21798B2E8((uint64_t)v16, v38, &qword_26ACF7658);
    if (v30((char *)v37, 1, v22) == 1)
    {
      sub_21798B28C((uint64_t)v16, &qword_26ACF7658);
      uint64_t v37 = v59;
      sub_21798B28C((uint64_t)v19, &qword_26ACF7658);
      unsigned int v39 = v30((char *)v38, 1, v22);
      uint64_t v40 = v53;
      if (v39 == 1)
      {
        sub_21798B28C(v37, &qword_26ACF7658);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v60, v22);
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v41 = v55;
      sub_21798B2E8(v37, v55, &qword_26ACF7658);
      if (v30((char *)v38, 1, v22) != 1)
      {
        uint64_t v42 = v54;
        v48(v54, (char *)v38, v22);
        sub_2179AE43C(&qword_267BA6378, MEMORY[0x263F07648]);
        char v43 = sub_2179E28D0();
        uint64_t v44 = *(void (**)(char *, uint64_t))(v23 + 8);
        v44(v42, v22);
        sub_21798B28C((uint64_t)v16, &qword_26ACF7658);
        sub_21798B28C((uint64_t)v19, &qword_26ACF7658);
        v44((char *)v41, v22);
        sub_21798B28C(v59, &qword_26ACF7658);
        uint64_t v40 = v53;
        if (v43)
        {
          v44(v60, v22);
          goto LABEL_8;
        }
LABEL_18:
        uint64_t v45 = v60;
        v49(v40, v60, v22);
        uint64_t v46 = v50(v40, 0, 1, v22);
        uint64_t v47 = v56;
        id v31 = v61;
        MEMORY[0x21D451C70](v46);
        sub_2179E1A00();
        MEMORY[0x21D451C80](v47);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v45, v22);
        return objc_msgSend(v31, sel_setPreferredMaxLayoutWidth_, Width);
      }
      sub_21798B28C((uint64_t)v16, &qword_26ACF7658);
      sub_21798B28C((uint64_t)v19, &qword_26ACF7658);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v41, v22);
      uint64_t v40 = v53;
    }
    sub_21798B28C(v37, &qword_26ACF7668);
    goto LABEL_18;
  }
  sub_21798B28C((uint64_t)v7, &qword_26ACF76F8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
LABEL_7:
  sub_21798B28C((uint64_t)v21, &qword_26ACF7658);
LABEL_8:
  id v31 = v61;
  return objc_msgSend(v31, sel_setPreferredMaxLayoutWidth_, Width);
}

id sub_2179AE278(void *a1)
{
  objc_msgSend(a1, sel_setAttributedText_, *v1);

  return sub_2179ADB10(a1);
}

uint64_t sub_2179AE2BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2179AE43C(&qword_26ACF7688, (void (*)(uint64_t))type metadata accessor for AttributedTextView);

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_2179AE350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2179AE43C(&qword_26ACF7688, (void (*)(uint64_t))type metadata accessor for AttributedTextView);

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_2179AE3E4()
{
}

uint64_t sub_2179AE43C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ContentMessageView.init(with:maxWidth:additionalContext:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v10 = sub_2179E1910();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_2179E28F0();
  MEMORY[0x270FA5388](v11 - 8);
  int v12 = *a1;
  if (qword_267BA60E8 != -1) {
    swift_once();
  }
  id v13 = (id)qword_267BA6570;
  sub_2179E28E0();
  id v14 = v13;
  sub_2179E18C0();
  uint64_t v15 = sub_2179E2940();
  uint64_t v17 = v16;
  sub_2179E28E0();
  sub_2179E18C0();
  uint64_t result = sub_2179E2940();
  if (v12 == 2)
  {
    unint64_t v20 = 0xD000000000000014;
    id v21 = "bolt.horizontal.fill";
  }
  else
  {
    unint64_t v20 = 0xD00000000000002BLL;
    id v21 = "exclamationmark.arrow.triangle.2.circlepath";
  }
  *(unsigned char *)a4 = v12;
  *(void *)(a4 + 8) = v15;
  *(void *)(a4 + 16) = v17;
  *(void *)(a4 + 24) = result;
  *(void *)(a4 + 32) = v19;
  *(void *)(a4 + 40) = a2;
  *(void *)(a4 + 48) = a3;
  *(void *)(a4 + 56) = v20;
  *(void *)(a4 + 64) = (unint64_t)(v21 - 32) | 0x8000000000000000;
  *(double *)(a4 + 72) = a5;
  *(void *)(a4 + 80) = v13;
  return result;
}

uint64_t ContentMessageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6380);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = *(_OWORD *)(v1 + 48);
  void v18[2] = *(_OWORD *)(v1 + 32);
  v18[3] = v7;
  long long v19 = *(_OWORD *)(v1 + 64);
  uint64_t v20 = *(void *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 16);
  v18[0] = *(_OWORD *)v1;
  v18[1] = v8;
  uint64_t v17 = v18;
  uint64_t v16 = v18;
  uint64_t v15 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6388);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6390);
  sub_21798D884(&qword_267BA6398, &qword_267BA6388);
  sub_2179AF274();
  sub_2179E1F90();
  double v9 = *((double *)&v19 + 1);
  uint64_t v10 = sub_2179E2420();
  __n128 v12 = sub_2179AEE18(0.0, 1, 0.0, 1, v9, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v10, v11, &qword_267BA6380, &qword_267BA63B0);
  return (*(uint64_t (**)(unsigned char *, uint64_t, __n128))(v4 + 8))(v6, v3, v12);
}

uint64_t sub_2179AE98C()
{
  return sub_2179E2330();
}

uint64_t sub_2179AEA20@<X0>(uint64_t a1@<X8>)
{
  sub_21798E4B0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2179E2130();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_2179E2040();
  uint64_t v7 = sub_2179E2120();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_2179AF6A4(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_2179AEB00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63E8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_2179E2310();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179AF764(a1);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_2179E22E0();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B530], v8);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v5 + 36), v11, v8);
  uint64_t *v7 = KeyPath;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63D0);
  sub_2179AF8BC((uint64_t)v7, (uint64_t)a2 + *(int *)(v14 + 36));
  *a2 = v12;
  swift_retain();
  sub_2179AF924((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  return sub_2179AF984(a1);
}

uint64_t sub_2179AECE8@<X0>(uint64_t a1@<X8>)
{
  sub_21798E4B0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2179E2130();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  uint64_t v7 = sub_2179E2120();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_2179AF6A4(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

double sub_2179AEDBC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_2179AEE18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267BA63C0, &qword_267BA63C8).n128_u64[0];
  return result;
}

__n128 sub_2179AEE18@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  long long v19 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2179E2AC0();
    uint64_t v28 = (void *)sub_2179E2000();
    sub_2179E19F0();

    long long v19 = a16;
  }
  sub_2179E1D50();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  uint64_t v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *uint64_t v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_2179AF014@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6380);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = *(_OWORD *)(v1 + 48);
  void v18[2] = *(_OWORD *)(v1 + 32);
  v18[3] = v7;
  long long v19 = *(_OWORD *)(v1 + 64);
  uint64_t v20 = *(void *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 16);
  v18[0] = *(_OWORD *)v1;
  v18[1] = v8;
  uint64_t v17 = v18;
  uint64_t v16 = v18;
  uint64_t v15 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6388);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6390);
  sub_21798D884(&qword_267BA6398, &qword_267BA6388);
  sub_2179AF274();
  sub_2179E1F90();
  double v9 = *((double *)&v19 + 1);
  uint64_t v10 = sub_2179E2420();
  __n128 v12 = sub_2179AEE18(0.0, 1, 0.0, 1, v9, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v10, v11, &qword_267BA6380, &qword_267BA63B0);
  return (*(uint64_t (**)(unsigned char *, uint64_t, __n128))(v4 + 8))(v6, v3, v12);
}

uint64_t sub_2179AF24C()
{
  return sub_2179AE98C();
}

uint64_t sub_2179AF254@<X0>(uint64_t a1@<X8>)
{
  return sub_2179AECE8(a1);
}

void sub_2179AF25C(BOOL *a1@<X8>)
{
  *a1 = **(unsigned char **)(v1 + 16) != 2;
}

unint64_t sub_2179AF274()
{
  unint64_t result = qword_267BA63A0;
  if (!qword_267BA63A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA63A0);
  }
  return result;
}

uint64_t sub_2179AF2E0()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for ContentMessageView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 80);
}

uint64_t initializeWithCopy for ContentMessageView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  long long v7 = *(void **)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for ContentMessageView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  uint64_t v4 = *(void **)(a2 + 80);
  uint64_t v5 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ContentMessageView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  id v8 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);

  return a1;
}

uint64_t getEnumTagSinglePayload for ContentMessageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentMessageView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentMessageView()
{
  return &type metadata for ContentMessageView;
}

unint64_t sub_2179AF604()
{
  unint64_t result = qword_267BA63A8;
  if (!qword_267BA63A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA63B0);
    sub_21798D884(&qword_267BA63B8, &qword_267BA6380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA63A8);
  }
  return result;
}

uint64_t sub_2179AF6A4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2179AF6B4@<X0>(uint64_t a1@<X8>)
{
  return sub_2179AEA20(a1);
}

uint64_t sub_2179AF6BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_2179AEB00(*(void *)(v1 + 16), a1);
}

unint64_t sub_2179AF6C4()
{
  unint64_t result = qword_267BA63D8;
  if (!qword_267BA63D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA63D0);
    sub_21798D884(&qword_267BA63E0, &qword_267BA63E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA63D8);
  }
  return result;
}

uint64_t sub_2179AF764(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2179AF7CC()
{
  return sub_2179E1D80();
}

uint64_t sub_2179AF7F0(uint64_t a1)
{
  uint64_t v2 = sub_2179E2310();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2179E1D90();
}

uint64_t sub_2179AF8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2179AF924(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2179AF984(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

BOOL static ContentMessageType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ContentMessageType.hash(into:)()
{
  return sub_2179E2E10();
}

uint64_t ContentMessageType.hashValue.getter()
{
  return sub_2179E2E30();
}

unint64_t sub_2179AFA88()
{
  unint64_t result = qword_267BA63F0;
  if (!qword_267BA63F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA63F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContentMessageType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContentMessageType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x2179AFC38);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentMessageType()
{
  return &type metadata for ContentMessageType;
}

uint64_t ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t *a9@<X8>, double a10@<D0>, double a11@<D1>, unsigned __int8 a12, uint64_t a13, uint64_t a14)
{
  int v44 = a8;
  uint64_t v39 = a6;
  uint64_t v45 = a9;
  uint64_t v42 = a14;
  uint64_t v43 = a7;
  int v41 = a12;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v39 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConstellationContentParser(0);
  swift_allocObject();
  sub_2179BCA38();
  sub_2179B04A8(&qword_26ACF76D0, (void (*)(uint64_t))type metadata accessor for ConstellationContentParser);
  uint64_t v40 = sub_2179E1CC0();
  uint64_t v28 = v27;
  uint64_t v29 = (void *)(v27 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language);
  *uint64_t v29 = a2;
  v29[1] = a3;
  swift_retain();
  swift_bridgeObjectRelease();
  sub_21798B2E8(a4, (uint64_t)v26, &qword_26ACF6BC8);
  uint64_t v30 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL;
  swift_beginAccess();
  swift_retain();
  sub_2179B00F4((uint64_t)v26, v30, &qword_26ACF6BC8);
  swift_endAccess();
  swift_release();
  id v31 = *(void **)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager);
  *(void *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager) = a5;
  id v32 = a5;

  uint64_t v33 = v39;
  sub_21798B2E8(v39, (uint64_t)v23, &qword_26ACF76F8);
  uint64_t v34 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  swift_retain();
  sub_2179B00F4((uint64_t)v23, v34, &qword_26ACF76F8);
  swift_endAccess();
  swift_release();
  __n128 v35 = (double *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  double *v35 = a10;
  v35[1] = a11;
  uint64_t v36 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_maxWidth;
  *(void *)uint64_t v36 = v43;
  *(unsigned char *)(v36 + 8) = v44 & 1;
  *(unsigned char *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable) = v41;
  *(void *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate + 8) = v42;
  swift_unknownObjectWeakAssign();
  *(void *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_rawContent) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2179B74F4();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release_n();
  sub_21798B28C(v33, &qword_26ACF76F8);
  uint64_t result = sub_21798B28C(a4, &qword_26ACF6BC8);
  long long v38 = v45;
  uint64_t *v45 = v40;
  v38[1] = v28;
  return result;
}

uint64_t ConstellationContentView.body.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AE0();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_2179B006C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AE0();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_2179B00F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2179B0158()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();

  return swift_release();
}

uint64_t sub_2179B01D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributedTextView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v9 - v6;
  sub_2179B04F0(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179B04F0((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_2179E1AF0();
  return sub_2179B0554((uint64_t)v7);
}

uint64_t sub_2179B02D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of ConstellationContentDelegate.constellationContentPersonalizedStringForID(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConstellationContentDelegate.constellationContentLinkActivated(url:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void *initializeBufferWithCopyOfBuffer for ConstellationContentView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ConstellationContentView()
{
  return swift_release();
}

void *assignWithCopy for ConstellationContentView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for ConstellationContentView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstellationContentView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConstellationContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ConstellationContentView()
{
  return &type metadata for ConstellationContentView;
}

uint64_t sub_2179B0460()
{
  return sub_2179B04A8(&qword_26ACF7680, (void (*)(uint64_t))type metadata accessor for AttributedTextView);
}

uint64_t sub_2179B04A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2179B04F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttributedTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2179B0554(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributedTextView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2179B05B4()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  uint64_t v2 = sub_2179E2930();
  uint64_t v4 = v3;

  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
  swift_getKeyPath();
  sub_2179B5134(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v6 = (id *)(v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
  swift_beginAccess();
  if (*v6)
  {
    id v7 = objc_msgSend(*v6, sel_identifier);
    uint64_t v8 = sub_2179E2930();
    uint64_t v10 = v9;

    if (v2 == v8 && v4 == v10) {
      char v12 = 1;
    }
    else {
      char v12 = sub_2179E2D50();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = 0;
  }
  swift_bridgeObjectRelease();
  return v12 & 1;
}

void sub_2179B0734(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  id v5 = v2;
}

id sub_2179B078C()
{
  swift_beginAccess();
  id v1 = *(void **)(v0 + 16);

  return v1;
}

void sub_2179B07D0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;
}

uint64_t (*sub_2179B0818())()
{
  return j_j__swift_endAccess;
}

id TipViewModel.collection.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_2179B0874@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2179B08FC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2179E1BE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_2179B0A18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2179B0A9C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_2179B0B28())()
{
  return j__swift_endAccess;
}

id TipViewModel.contentModel.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
}

uint64_t sub_2179B0B94()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2179B0BDC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2179B0C28())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179B0C84()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2179B0CCC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2179B0D18())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179B0D74()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2179B0DBC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2179B0E08())()
{
  return j_j__swift_endAccess;
}

id TipViewModel.tip.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
}

uint64_t TipViewModel.__allocating_init(collection:tip:assetsInfo:contentModel:onNextHandler:)(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = (void *)*MEMORY[0x263F7F680];
  *(void *)(v7 + 16) = *MEMORY[0x263F7F680];
  uint64_t v14 = v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  uint64_t v15 = *MEMORY[0x263F18508];
  uint64_t v16 = sub_2179E1BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  *(unsigned char *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible) = 0;
  *(unsigned char *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded) = 0;
  *(unsigned char *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished) = 1;
  *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) = MEMORY[0x263F8EE80];
  uint64_t v17 = OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo;
  *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo) = 0;
  *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = 0;
  id v18 = v13;
  sub_2179E1960();
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) = a2;
  long long v19 = *(void **)(v7 + v17);
  *(void *)(v7 + v17) = a3;
  id v20 = a1;
  id v21 = a2;
  id v22 = a3;

  uint64_t v23 = (uint64_t *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler);
  *uint64_t v23 = a5;
  v23[1] = a6;
  *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel) = a4;
  uint64_t v51 = a5;
  sub_2179902A4(a5);
  id v24 = a4;
  id v25 = objc_msgSend(v20, sel_tipIdentifiers);
  uint64_t v26 = sub_2179E29D0();

  uint64_t v27 = (void *)sub_21799F6A0(MEMORY[0x263F8EE78]);
  uint64_t v28 = *(void *)(v26 + 16);
  if (!v28)
  {
LABEL_17:
    sub_21798E45C(v51);
    swift_bridgeObjectRelease();

    *(void *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) = v27;
    swift_bridgeObjectRelease();
    return v7;
  }
  id v47 = v24;
  id v48 = v22;
  id v49 = v21;
  id v50 = v20;
  swift_bridgeObjectRetain();
  uint64_t v29 = (uint64_t *)(v26 + 40);
  while (1)
  {
    uint64_t v30 = *(v29 - 1);
    uint64_t v31 = *v29;
    uint64_t v32 = v27[2];
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v35 = sub_2179B2CDC(v30, v31);
    uint64_t v36 = v27[2];
    BOOL v37 = (v34 & 1) == 0;
    uint64_t v38 = v36 + v37;
    if (__OFADD__(v36, v37)) {
      break;
    }
    char v39 = v34;
    if (v27[3] >= v38)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v34) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_2179B3F14();
        if (v39) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_2179B359C(v38, isUniquelyReferenced_nonNull_native);
      unint64_t v40 = sub_2179B2CDC(v30, v31);
      if ((v39 & 1) != (v41 & 1)) {
        goto LABEL_20;
      }
      unint64_t v35 = v40;
      if (v39)
      {
LABEL_3:
        *(void *)(v27[7] + 8 * v35) = v32;
        goto LABEL_4;
      }
    }
    v27[(v35 >> 6) + 8] |= 1 << v35;
    uint64_t v42 = (uint64_t *)(v27[6] + 16 * v35);
    uint64_t *v42 = v30;
    v42[1] = v31;
    *(void *)(v27[7] + 8 * v35) = v32;
    uint64_t v43 = v27[2];
    BOOL v44 = __OFADD__(v43, 1);
    uint64_t v45 = v43 + 1;
    if (v44) {
      goto LABEL_19;
    }
    void v27[2] = v45;
    swift_bridgeObjectRetain();
LABEL_4:
    v29 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v28)
    {
      swift_bridgeObjectRelease();
      id v21 = v49;
      id v20 = v50;
      id v24 = v47;
      id v22 = v48;
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_2179E2D90();
  __break(1u);
  return result;
}

uint64_t sub_2179B1284()
{
  uint64_t v1 = OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel;
  if (*(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel);
  }
  else
  {
    uint64_t v3 = v0;
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo);
    id v6 = v4;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = (void *)sub_2179B14DC();
    }
    uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
    type metadata accessor for DocumentAssetViewModel();
    swift_allocObject();
    id v9 = v5;
    uint64_t v2 = DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(v4, v7, (char *)v8);
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_2179B1370(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = a1;
  return swift_release();
}

uint64_t (*sub_2179B1388(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_2179B1284();
  return sub_2179B13D0;
}

uint64_t sub_2179B13D0(void *a1)
{
  *(void *)(a1[1] + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = *a1;
  return swift_release();
}

id sub_2179B13E8()
{
  uint64_t v0 = (void *)sub_2179B14DC();
  sub_2179E2680();
  if (!v1)
  {
    sub_2179E26A0();
    uint64_t v3 = v2;
    if (!v2) {
      goto LABEL_6;
    }
  }
  sub_217986C94(0, (unint64_t *)&qword_26ACF6B88);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (result)
  {
    uint64_t v5 = result;
    id v6 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_dataCacheForIdentifier_, v6);

    if (!v7) {
      return 0;
    }
    uint64_t v3 = 1;
    uint64_t v0 = v7;
LABEL_6:

    return (id)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2179B14DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA6850);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  id v5 = objc_msgSend(v4, sel_fullContentAssets);
  uint64_t v6 = sub_2179E1BE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
  id v7 = objc_msgSend(v4, sel_language);
  uint64_t v8 = sub_2179E2930();
  uint64_t v10 = v9;

  id v11 = objc_msgSend(v4, sel_assetFileInfoManager);
  id v12 = sub_2179D2438((uint64_t)v5, (uint64_t)v3, v8, v10, (uint64_t)v11);
  swift_bridgeObjectRelease();

  sub_2179B50B8((uint64_t)v3);
  uint64_t v13 = sub_2179D4090(v12, 0);

  return v13;
}

void sub_2179B1668(uint64_t a1, int a2)
{
  int v16 = a2;
  uint64_t v4 = sub_2179E1BE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v9(v7, a1, v4);
  uint64_t v10 = v8 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  uint64_t v15 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 40);
  v15(v10, v7, v4);
  swift_endAccess();
  uint64_t v11 = v2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  v9(v7, v11, v4);
  char v12 = sub_2179E1BD0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v13 = v16;
  if (v12 & 1) == 0 || (v16)
  {
    v9(v7, a1, v4);
    swift_beginAccess();
    v15(v11, v7, v4);
    swift_endAccess();
    sub_2179B1284();
    uint64_t v14 = (void *)sub_2179B14DC();
    sub_2179A3C4C((uint64_t)v14, v13 & 1);
    swift_release();
  }
}

uint64_t sub_2179B188C()
{
  return sub_2179B2368((SEL *)&selRef_identifier);
}

uint64_t sub_2179B1898()
{
  return sub_2179B1D74((SEL *)&selRef_title);
}

id sub_2179B18A4()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_isIntro);
}

id sub_2179B18D0()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_isOutro);
}

uint64_t sub_2179B18FC()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  uint64_t v2 = sub_2179E2930();
  uint64_t v4 = v3;

  uint64_t v5 = (id *)(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel)
            + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  if (*v5)
  {
    id v6 = objc_msgSend(*v5, sel_identifier);
    uint64_t v7 = sub_2179E2930();
    uint64_t v9 = v8;

    if (v2 == v7 && v4 == v9) {
      char v11 = 1;
    }
    else {
      char v11 = sub_2179E2D50();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_2179B1A14()
{
  id v1 = objc_msgSend(*(id *)(v0 + 24), sel_identifier);
  uint64_t v2 = sub_2179E2930();

  return v2;
}

uint64_t sub_2179B1A6C()
{
  return sub_2179B1A84((SEL *)&selRef_correlationID);
}

uint64_t sub_2179B1A78()
{
  return sub_2179B1A84((SEL *)&selRef_clientConditionID);
}

uint64_t sub_2179B1A84(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) *a1];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_2179E2930();

  return v4;
}

id sub_2179B1AF4()
{
  id result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContent);
  if (result)
  {
    id v2 = result;
    id v3 = objc_msgSend(result, sel_labelStyle);

    return v3;
  }
  return result;
}

uint64_t sub_2179B1B50()
{
  uint64_t v1 = sub_2179E1910();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_2179E28F0();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  id v4 = objc_msgSend(v3, sel_eyebrowText);
  if (v4)
  {

    goto LABEL_7;
  }
  if (!objc_msgSend(v3, sel_isSiriSuggestion))
  {
LABEL_7:
    id v7 = objc_msgSend(v3, sel_eyebrowText);
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    uint64_t v6 = sub_2179E2930();

    return v6;
  }
  sub_2179E28E0();
  if (qword_267BA60E8 != -1) {
    swift_once();
  }
  id v5 = (id)qword_267BA6570;
  sub_2179E18C0();
  return sub_2179E2940();
}

id sub_2179B1D28()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_assetFileInfoManager);

  return v1;
}

uint64_t sub_2179B1D68()
{
  return sub_2179B1D74((SEL *)&selRef_bodyText);
}

uint64_t sub_2179B1D74(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) *a1];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_2179E2930();

  return v4;
}

uint64_t sub_2179B1DE4()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_bodyContent);
  if (!v1
    || (id v2 = v1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6420),
        uint64_t v3 = sub_2179E29D0(),
        v2,
        uint64_t v4 = sub_2179B1EA4(v3),
        swift_bridgeObjectRelease(),
        !v4))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7800);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_2179E58F0;
    *(void *)(v4 + 32) = sub_21799F3F0(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_2179B1EA4(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_2179B4F74(0, v2, 0);
  uint64_t v3 = v9;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6420);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2179B4F74(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v9;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2179B4F74((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v9;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_2179B1FF4()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  id v2 = objc_msgSend(v1, sel_bodyContent);
  if (v2)
  {

    return sub_2179B1DE4();
  }
  else
  {
    id v4 = objc_msgSend(v1, sel_bodyText);
    if (v4)
    {
      unint64_t v5 = v4;
      sub_2179E2930();
    }
    unint64_t v6 = self;
    id v7 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v6, sel_textContentWithText_, v7);

    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6428);
    uint64_t v9 = sub_2179E29D0();

    uint64_t v10 = sub_2179B2138(v9, &qword_267BA6428);
    swift_bridgeObjectRelease();
    return v10;
  }
}

uint64_t sub_2179B212C(uint64_t a1)
{
  return sub_2179B2138(a1, &qword_267BA6448);
}

uint64_t sub_2179B2138(uint64_t a1, uint64_t *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_2179B4F74(0, v2, 0);
    uint64_t v6 = a1 + 32;
    uint64_t v3 = v11;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2179B4F74(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v11;
      }
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_2179B4F74((void *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v11;
      }
      *(void *)(v3 + 16) = v8 + 1;
      *(void *)(v3 + 8 * v8 + 32) = v10;
      v6 += 8;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_2179B227C()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContent);
  if (!v1) {
    goto LABEL_4;
  }
  int64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_footnoteContent);

  if (!v3
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_267BA6420),
        uint64_t v4 = sub_2179E29D0(),
        v3,
        uint64_t v5 = sub_2179B1EA4(v4),
        swift_bridgeObjectRelease(),
        !v5))
  {
LABEL_4:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7800);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2179E58F0;
    *(void *)(v5 + 32) = sub_21799F3F0(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_2179B235C()
{
  return sub_2179B2368((SEL *)&selRef_language);
}

uint64_t sub_2179B2368(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) *a1];
  uint64_t v3 = sub_2179E2930();

  return v3;
}

uint64_t sub_2179B23C8@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContentAssets);
  id v4 = objc_msgSend(v3, sel_baseURL);

  if (v4)
  {
    sub_2179E17D0();

    uint64_t v5 = sub_2179E1810();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_2179E1810();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_2179B24C4()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_actions);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  id v2 = v1;
  sub_217986C94(0, &qword_267BA6430);
  uint64_t v3 = sub_2179E29D0();

  return v3;
}

uint64_t sub_2179B2544()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  uint64_t v2 = sub_2179E2930();
  uint64_t v4 = v3;

  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap);
  if (*(void *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_2179B2CDC(v2, v4);
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = 0;
LABEL_7:
  uint64_t result = v8 + 1;
  if (__OFADD__(v8, 1)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2179B260C()
{
  return *(void *)(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) + 16);
}

BOOL sub_2179B2620()
{
  return sub_2179B2638((SEL *)&selRef_bodyContent);
}

BOOL sub_2179B262C()
{
  return sub_2179B2638((SEL *)&selRef_footnoteContent);
}

BOOL sub_2179B2638(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) *a1];
  id v3 = v2;
  if (v2) {

  }
  return v3 != 0;
}

BOOL sub_2179B2688()
{
  return sub_2179B2544() < *(void *)(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap)
                                     + 16);
}

void sub_2179B26B8()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
    uint64_t v3 = sub_2179E2930();
    uint64_t v5 = v4;

    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap);
    if (*(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_2179B2CDC(v3, v5);
      if (v8)
      {
        uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
LABEL_8:
    if (__OFADD__(v9, 1)) {
      __break(1u);
    }
    else {
      v1(v9 + 1);
    }
  }
}

uint64_t TipViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  uint64_t v2 = sub_2179E1BE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler));
  swift_bridgeObjectRelease();

  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel___observationRegistrar;
  uint64_t v4 = sub_2179E1970();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t TipViewModel.__deallocating_deinit()
{
  TipViewModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_2179B2920(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*(id *)(*v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  uint64_t v4 = sub_2179E2930();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::String_optional __swiftcall TipViewModel.constellationContentPersonalizedStringForID(_:)(Swift::Int a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

void TipViewModel.constellationContentLinkActivated(url:)()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  id v2 = objc_msgSend(v1, sel_identifier);
  if (!v2)
  {
    sub_2179E2930();
    id v2 = (id)sub_2179E2900();
    swift_bridgeObjectRelease();
  }
  id v3 = self;
  id v4 = objc_msgSend(*(id *)(v0 + 24), sel_identifier);
  sub_2179E2930();

  uint64_t v5 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v1, sel_correlationID);
  id v7 = objc_msgSend(v1, sel_clientConditionID);
  char v8 = (void *)sub_2179E17C0();
  id v9 = objc_msgSend(v3, sel_eventWithContentID_collectionID_correlationID_clientConditionID_url_, v2, v5, v6, v7, v8);

  [v9 log];
}

uint64_t sub_2179B2B10()
{
  return 0;
}

id sub_2179B2B20@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179B5134(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  id v4 = (void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *a2 = *v4;

  return v5;
}

void sub_2179B2BF8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179B5134(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

unint64_t sub_2179B2CDC(uint64_t a1, uint64_t a2)
{
  sub_2179E2E00();
  sub_2179E2960();
  uint64_t v4 = sub_2179E2E30();

  return sub_2179B2E9C(a1, a2, v4);
}

unint64_t sub_2179B2D54(uint64_t a1)
{
  sub_2179E2930();
  sub_2179E2E00();
  sub_2179E2960();
  uint64_t v2 = sub_2179E2E30();
  swift_bridgeObjectRelease();

  return sub_2179B2F80(a1, v2);
}

unint64_t sub_2179B2DE8(uint64_t a1)
{
  sub_2179E2E00();
  type metadata accessor for CFString(0);
  sub_2179B5134(&qword_267BA6460, type metadata accessor for CFString);
  sub_2179E19D0();
  uint64_t v2 = sub_2179E2E30();

  return sub_2179B30F8(a1, v2);
}

unint64_t sub_2179B2E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2179E2D50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2179E2D50() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2179B2F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2179E2930();
    uint64_t v8 = v7;
    if (v6 == sub_2179E2930() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2179E2D50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2179E2930();
          uint64_t v15 = v14;
          if (v13 == sub_2179E2930() && v15 == v16) {
            break;
          }
          char v18 = sub_2179E2D50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_2179B30F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_2179B5134(&qword_267BA6460, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_2179E19C0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_2179E19C0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_2179B3254(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6458);
  char v35 = a2;
  uint64_t v6 = sub_2179E2D00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
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
    if (v17 >= v33) {
      break;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    id v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    id v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_21799FA78(v22, v36);
    }
    else
    {
      sub_2179A122C((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_2179E2930();
    sub_2179E2E00();
    sub_2179E2960();
    uint64_t v24 = sub_2179E2E30();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_21799FA78(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2179B3590(uint64_t a1, char a2)
{
  return sub_2179B3BF0(a1, a2, &qword_26ACF77E8);
}

uint64_t sub_2179B359C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62D0);
  char v37 = a2;
  uint64_t v6 = sub_2179E2D00();
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
    id v22 = (void *)(v5 + 64);
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
    sub_2179E2E00();
    sub_2179E2960();
    uint64_t result = sub_2179E2E30();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  id v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2179B38A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF77F0);
  char v35 = a2;
  uint64_t v6 = sub_2179E2D00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
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
    if (v17 >= v33) {
      break;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    int64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    id v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_21799FA78(v22, v36);
    }
    else
    {
      sub_2179A122C((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_2179E2930();
    sub_2179E2E00();
    sub_2179E2960();
    uint64_t v24 = sub_2179E2E30();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_21799FA78(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2179B3BE4(uint64_t a1, char a2)
{
  return sub_2179B3BF0(a1, a2, &qword_267BA62D8);
}

uint64_t sub_2179B3BF0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_2179E2D00();
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
    id v23 = (void *)(v6 + 64);
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
    BOOL v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    int64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_2179E2E00();
    sub_2179E2960();
    uint64_t result = sub_2179E2E30();
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
  id v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

id sub_2179B3EFC()
{
  return sub_2179B4BFC(&qword_267BA6458);
}

id sub_2179B3F08()
{
  return sub_2179B4DC8(&qword_26ACF77E8);
}

void *sub_2179B3F14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2179E2CF0();
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
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
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

uint64_t sub_2179B40C4()
{
  return MEMORY[0x263F8D320];
}

id sub_2179B40D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 16);
  *a2 = v4;

  return v4;
}

uint64_t sub_2179B4134@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible, a2);
}

uint64_t sub_2179B4140(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
}

uint64_t sub_2179B414C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded, a2);
}

uint64_t sub_2179B4158(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
}

uint64_t sub_2179B4164@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished, a2);
}

uint64_t keypath_get_7Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_2179B41C0(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
}

uint64_t keypath_set_8Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

uint64_t sub_2179B4218@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2179B1284();
  *a1 = result;
  return result;
}

uint64_t sub_2179B4244(void *a1, void *a2)
{
  *(void *)(*a2 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = *a1;
  swift_retain();

  return swift_release();
}

uint64_t sub_2179B4290()
{
  return type metadata accessor for TipViewModel();
}

uint64_t type metadata accessor for TipViewModel()
{
  uint64_t result = qword_267BA6438;
  if (!qword_267BA6438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2179B42E4()
{
  uint64_t result = sub_2179E1BE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2179E1970();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for TipViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipViewModel);
}

uint64_t dispatch thunk of TipViewModel.isCurrentTip.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of TipViewModel.__allocating_init(collection:tip:assetsInfo:contentModel:onNextHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of TipViewModel.assetCacheAvailable()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of TipViewModel.colorSchemeUpdated(_:shouldReload:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of TipViewModel.id.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of TipViewModel.title.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of TipViewModel.isIntro.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of TipViewModel.isOutro.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of TipViewModel.isShowingSharedVariant.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of TipViewModel.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of TipViewModel.collectionIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of TipViewModel.correlationID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of TipViewModel.clientConditionID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of TipViewModel.labelStyle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of TipViewModel.eyebrowText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of TipViewModel.assetFileInfoManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of TipViewModel.bodyText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of TipViewModel.bodyContent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of TipViewModel.bodyContentOrText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of TipViewModel.plainBodyContentOrText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of TipViewModel.footnoteContent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of TipViewModel.language.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of TipViewModel.assetsBaseURL.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of TipViewModel.actions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of TipViewModel.currentPage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of TipViewModel.totalPageCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of TipViewModel.hasBodyContent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of TipViewModel.hasFootnoteContent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of TipViewModel.hasMoreTips.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of TipViewModel.selectNextTip()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

id sub_2179B4BF0()
{
  return sub_2179B4BFC(&qword_26ACF77F0);
}

id sub_2179B4BFC(uint64_t *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2179E2CF0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v2 = v5;
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
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v14) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v7 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + 8 * v16);
    uint64_t v19 = 32 * v16;
    sub_2179A122C(*(void *)(v3 + 56) + 32 * v16, (uint64_t)v23);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    sub_21799FA78(v23, (_OWORD *)(*(void *)(v5 + 56) + v19));
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v7 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2179B4DBC()
{
  return sub_2179B4DC8(&qword_267BA62D8);
}

id sub_2179B4DC8(uint64_t *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2179E2CF0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v2 = v5;
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

void *sub_2179B4F74(void *a1, int64_t a2, char a3)
{
  id result = sub_2179B4F94(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2179B4F94(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7800);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_2179B50B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA6850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2179B5118()
{
  sub_2179D03F4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2179B5134(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_2179B517C()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6558);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E62A0;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 0.8, 0.0, 1.0);
  *(void *)(v4 + 32) = sub_2179E23E0();
  *(void *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 0.8, 0.0, 1.0);
  *(void *)(v4 + 48) = sub_2179E23E0();
  *(void *)(v4 + 56) = v8;
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 0.658823529, 0.0, 1.0);
  *(void *)(v4 + 64) = sub_2179E23E0();
  *(void *)(v4 + 72) = v9;
  MEMORY[0x21D4514E0](v4);
  sub_2179E2470();
  sub_2179E2460();
  sub_2179E1CB0();
  double result = *(double *)&v12;
  xmmword_267BA6468 = v12;
  unk_267BA6478 = v13;
  qword_267BA6488 = v14;
  return result;
}

uint64_t static AppGradient.tipHeroGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60B8 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA6468;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA6468 + 8);
  *(_OWORD *)(a1 + 24) = unk_267BA6480;

  return swift_bridgeObjectRetain();
}

double sub_2179B5410()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E5C80;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(void *)(v4 + 32) = MEMORY[0x21D451390](v3, 1.0, 1.0, 0.22745098, 1.0);
  v6(v3, v5, v0);
  *(void *)(v4 + 40) = MEMORY[0x21D451390](v3, 1.0, 1.0, 0.776470588, 1.0);
  *(void *)&long long v9 = v4;
  sub_2179E29E0();
  MEMORY[0x21D4514F0](v9);
  sub_2179E2450();
  sub_2179E2480();
  sub_2179E1CB0();
  double result = *(double *)&v9;
  xmmword_267BA6490 = v9;
  unk_267BA64A0 = v10;
  qword_267BA64B0 = v11;
  return result;
}

uint64_t static AppGradient.tipCountGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60C0 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA6490;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA6490 + 8);
  *(_OWORD *)(a1 + 24) = unk_267BA64A8;

  return swift_bridgeObjectRetain();
}

double sub_2179B564C()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6558);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E62A0;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 0.670588235, 0.392156863, 0.0, 1.0);
  *(void *)(v4 + 32) = sub_2179E23E0();
  *(void *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 0.670588235, 0.392156863, 0.0, 1.0);
  *(void *)(v4 + 48) = sub_2179E23E0();
  *(void *)(v4 + 56) = v8;
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 0.8, 0.0, 1.0);
  *(void *)(v4 + 64) = sub_2179E23E0();
  *(void *)(v4 + 72) = v9;
  MEMORY[0x21D4514E0](v4);
  sub_2179E2470();
  sub_2179E2460();
  sub_2179E1CB0();
  double result = *(double *)&v12;
  xmmword_267BA64B8 = v12;
  unk_267BA64C8 = v13;
  qword_267BA64D8 = v14;
  return result;
}

uint64_t static AppGradient.tipHeroIncreaseContrastGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60C8 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA64B8;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA64B8 + 8);
  *(_OWORD *)(a1 + 24) = unk_267BA64D0;

  return swift_bridgeObjectRetain();
}

double sub_2179B58E8()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6558);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E5C80;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 1.0, 1.0, 1.0);
  *(void *)(v4 + 32) = sub_2179E23E0();
  *(void *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x21D451390](v3, 1.0, 1.0, 1.0, 0.1);
  *(void *)(v4 + 48) = sub_2179E23E0();
  *(void *)(v4 + 56) = v8;
  MEMORY[0x21D4514E0](v4);
  sub_2179E2470();
  sub_2179E2460();
  sub_2179E1CB0();
  double result = *(double *)&v11;
  xmmword_267BA64E0 = v11;
  *(_OWORD *)algn_267BA64F0 = v12;
  qword_267BA6500 = v13;
  return result;
}

uint64_t static AppGradient.translucentBlendingGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60D0 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA64E0;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA64E0 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)&algn_267BA64F0[8];

  return swift_bridgeObjectRetain();
}

double sub_2179B5B2C()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E5C80;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(void *)(v4 + 32) = MEMORY[0x21D451390](v3, 0.0, 0.478431373, 1.0, 1.0);
  v6(v3, v5, v0);
  *(void *)(v4 + 40) = MEMORY[0x21D451390](v3, 1.0, 0.176470588, 0.333333333, 1.0);
  *(void *)&long long v9 = v4;
  sub_2179E29E0();
  MEMORY[0x21D4514F0](v9);
  sub_2179E2470();
  sub_2179E2460();
  sub_2179E1CB0();
  double result = *(double *)&v9;
  xmmword_267BA6508 = v9;
  unk_267BA6518 = v10;
  qword_267BA6528 = v11;
  return result;
}

uint64_t static AppGradient.eyebrowGradientLayer1.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60D8 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA6508;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA6508 + 8);
  *(_OWORD *)(a1 + 24) = unk_267BA6520;

  return swift_bridgeObjectRetain();
}

double sub_2179B5D70()
{
  uint64_t v0 = sub_2179E2230();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2179E5C80;
  uint64_t v5 = *MEMORY[0x263F1B388];
  unint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(void *)(v4 + 32) = sub_2179E22B0();
  v6(v3, v5, v0);
  *(void *)(v4 + 40) = sub_2179E22B0();
  *(void *)&long long v9 = v4;
  sub_2179E29E0();
  MEMORY[0x21D4514F0](v9);
  sub_2179E2450();
  sub_2179E2490();
  sub_2179E1CB0();
  double result = *(double *)&v9;
  xmmword_267BA6530 = v9;
  unk_267BA6540 = v10;
  qword_267BA6550 = v11;
  return result;
}

uint64_t static AppGradient.eyebrowGradientLayer2.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BA60E0 != -1) {
    swift_once();
  }
  *(void *)a1 = xmmword_267BA6530;
  *(_OWORD *)(a1 + 8) = *(long long *)((char *)&xmmword_267BA6530 + 8);
  *(_OWORD *)(a1 + 24) = unk_267BA6548;

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AppGradient()
{
  return &type metadata for AppGradient;
}

double defaultParagraphSpacing.getter()
{
  return 10.0;
}

BOOL static ConstellationContentParagraphStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConstellationContentParagraphStyle.hash(into:)()
{
  return sub_2179E2E10();
}

uint64_t ConstellationContentParagraphStyle.hashValue.getter()
{
  return sub_2179E2E30();
}

BOOL sub_2179B6040(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConstellationContentAttributes.init(font:foregroundColor:accentColor:titleGradientStyle:textAlignment:paragraphSpacing:paragraphStyle:numberOfLines:lineBreakMode:symbolScale:useForegroundColorForSymbol:displayLinkStyle:typeSettingLanguage:supportsLinks:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, char a12, char a13, char a14, uint64_t a15, char a16)
{
  char v21 = *a6;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  sub_2179BD67C(a4, a9 + 24, &qword_26ACF7738);
  *(void *)(a9 + 64) = a5;
  *(double *)(a9 + 72) = a10;
  *(unsigned char *)(a9 + 80) = v21;
  *(void *)(a9 + 88) = a7;
  *(void *)(a9 + 96) = a8;
  int64_t v22 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t result = sub_2179BD67C(a15, a9 + v22[15], &qword_26ACF7658);
  uint64_t v24 = a9 + v22[16];
  *(void *)uint64_t v24 = a11;
  *(unsigned char *)(v24 + 8) = a12 & 1;
  *(unsigned char *)(a9 + v22[17]) = a13;
  *(unsigned char *)(a9 + 81) = a14;
  *(unsigned char *)(a9 + 82) = a16;
  return result;
}

uint64_t type metadata accessor for ConstellationContentAttributes(uint64_t a1)
{
  return sub_2179B72C0(a1, (uint64_t *)&unk_26ACF76E8);
}

unint64_t sub_2179B6174()
{
  unint64_t result = qword_267BA6560;
  if (!qword_267BA6560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6560);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConstellationContentParagraphStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConstellationContentParagraphStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2179B6324);
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

unsigned char *sub_2179B634C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConstellationContentParagraphStyle()
{
  return &type metadata for ConstellationContentParagraphStyle;
}

char *initializeBufferWithCopyOfBuffer for ConstellationContentAttributes(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  unsigned int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    int v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    *((void *)a1 + 3) = a2[3];
    long long v9 = *((_OWORD *)a2 + 3);
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 3) = v9;
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    a1[80] = *((unsigned char *)a2 + 80);
    *(_WORD *)(a1 + 81) = *(_WORD *)((char *)a2 + 81);
    uint64_t v10 = a3[15];
    __dst = &a1[v10];
    uint64_t v11 = (char *)a2 + v10;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    uint64_t v12 = sub_2179E18F0();
    uint64_t v13 = *(void *)(v12 - 8);
    char v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v14 = v4;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v21(v11, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
      memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v16 = a3[16];
    uint64_t v17 = a3[17];
    uint64_t v18 = &v7[v16];
    uint64_t v19 = (uint64_t)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = *(unsigned char *)(v19 + 8);
    v7[v17] = *((unsigned char *)a2 + v17);
  }
  return v7;
}

uint64_t destroy for ConstellationContentAttributes(id *a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  unsigned int v4 = (char *)a1 + *(int *)(a2 + 60);
  uint64_t v5 = sub_2179E18F0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    BOOL v7 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  uint64_t v9 = a3[15];
  __dst = (void *)(a1 + v9);
  uint64_t v10 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v11 = sub_2179E18F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  id v14 = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(__dst, v10, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  uint64_t v16 = a3[16];
  uint64_t v17 = a3[17];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  return a1;
}

uint64_t assignWithCopy for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v9 = a3[15];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_2179E18F0();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = a3[16];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v21 = *v20;
  *(unsigned char *)(v19 + 8) = *((unsigned char *)v20 + 8);
  *(void *)uint64_t v19 = v21;
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  return a1;
}

uint64_t initializeWithTake for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_WORD *)(a1 + 81) = *(_WORD *)(a2 + 81);
  uint64_t v6 = a3[15];
  uint64_t v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v9 = sub_2179E18F0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[16];
  uint64_t v13 = a3[17];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  uint64_t v8 = a3[15];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v11 = sub_2179E18F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[16];
  uint64_t v18 = a3[17];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstellationContentAttributes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2179B6E28);
}

uint64_t sub_2179B6E28(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 60);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for ConstellationContentAttributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2179B6EFC);
}

void *sub_2179B6EFC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7658);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 60);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2179B6FA8()
{
  sub_2179BC0BC(319, &qword_26ACF7660, MEMORY[0x263F07648], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2179B70B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();

  return swift_release();
}

uint64_t sub_2179B712C()
{
  sub_2179B7768();
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser__bodyText;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  sub_21798B28C(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL, &qword_26ACF6BC8);
  sub_21798B28C(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes, &qword_26ACF76F8);

  swift_bridgeObjectRelease();
  sub_2179BD5BC(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_2179B7240()
{
  sub_2179B712C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2179B7298()
{
  return type metadata accessor for ConstellationContentParser(0);
}

uint64_t type metadata accessor for ConstellationContentParser(uint64_t a1)
{
  return sub_2179B72C0(a1, (uint64_t *)&unk_26ACF76D8);
}

uint64_t sub_2179B72C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2179B72F8()
{
  sub_2179BC0BC(319, &qword_26ACF7710, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_2179BC0BC(319, (unint64_t *)&qword_26ACF6BD0, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F)
    {
      sub_2179BC0BC(319, (unint64_t *)&qword_26ACF7700, type metadata accessor for ConstellationContentAttributes, MEMORY[0x263F8D8F0]);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2179B74F4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AttributedTextView();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_2179B7948(v10);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize + 8);
  char v14 = *(unsigned char *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable);
  uint64_t v15 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_21798B2E8(v15, (uint64_t)v3, &qword_26ACF76F8);
  uint64_t v16 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate;
  uint64_t v17 = (uint64_t (*)(uint64_t))MEMORY[0x21D452890](v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate);
  if (v17)
  {
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v17;
    *(void *)(v19 + 24) = v18;
    uint64_t v17 = sub_2179BD624;
  }
  else
  {
    uint64_t v19 = 0;
  }
  *(void *)uint64_t v9 = v11;
  *((void *)v9 + 1) = v12;
  *((void *)v9 + 2) = v13;
  v9[24] = v14;
  sub_2179BD67C((uint64_t)v3, (uint64_t)&v9[*(int *)(v4 + 28)], &qword_26ACF76F8);
  uint64_t v20 = (uint64_t (**)(uint64_t))&v9[*(int *)(v4 + 32)];
  *uint64_t v20 = v17;
  v20[1] = (uint64_t (*)(uint64_t))v19;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179BD6E0((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for AttributedTextView);
  id v21 = v11;
  swift_retain();
  sub_2179E1AF0();
  sub_2179BD748((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for AttributedTextView);
}

void sub_2179B7768()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
  swift_beginAccess();
  uint64_t v2 = *v1;
  *uint64_t v1 = MEMORY[0x263F8EE80];
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
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
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v7) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v8;
    if (!v14)
    {
      int64_t v8 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_25;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v8);
      if (!v14)
      {
        int64_t v8 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_25;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v8);
        if (!v14)
        {
          int64_t v8 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_25;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v8);
          if (!v14)
          {
            int64_t v8 = v13 + 4;
            if (v13 + 4 >= v7) {
              goto LABEL_25;
            }
            unint64_t v14 = *(void *)(v3 + 8 * v8);
            if (!v14) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = *(void *)(*(void *)(v2 + 56) + 8 * v10);
    id v12 = objc_msgSend(self, sel_defaultManager);
    objc_msgSend(v12, sel_cancelSessionItem_, v11);
  }
  int64_t v15 = v13 + 5;
  if (v15 >= v7)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v15);
  if (v14)
  {
    int64_t v8 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v8 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v8 >= v7) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v8);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
}

void *sub_2179B7948(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v37 = (uint64_t)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v33 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v33 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v35 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags) = 0;
  id v36 = sub_2179B7E18(a1);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  uint64_t v19 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  uint64_t v20 = v3;
  sub_21798B2E8(v19, (uint64_t)v17, &qword_26ACF76F8);
  id v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  if (v21(v17, 1, v20))
  {
    sub_21798B28C((uint64_t)v17, &qword_26ACF76F8);
    uint64_t v22 = 4;
  }
  else
  {
    int64_t v33 = v12;
    uint64_t v34 = v20;
    sub_2179BD6E0((uint64_t)v17, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    sub_21798B28C((uint64_t)v17, &qword_26ACF76F8);
    uint64_t v22 = *((void *)v6 + 8);
    id v12 = v33;
    uint64_t v20 = v34;
    sub_2179BD748((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
  }
  objc_msgSend(v18, sel_setAlignment_, v22);
  LODWORD(v23) = 1045220557;
  objc_msgSend(v18, sel_setHyphenationFactor_, v23);
  sub_21798B2E8(v19, (uint64_t)v15, &qword_26ACF76F8);
  if (v21(v15, 1, v20))
  {
    sub_21798B28C((uint64_t)v15, &qword_26ACF76F8);
  }
  else
  {
    sub_2179BD6E0((uint64_t)v15, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    sub_21798B28C((uint64_t)v15, &qword_26ACF76F8);
    uint64_t v24 = *((void *)v6 + 12);
    sub_2179BD748((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    objc_msgSend(v18, sel_setLineBreakMode_, v24);
  }
  int64_t v25 = v36;
  if (*(void *)(v1 + v35))
  {
    sub_21798B2E8(v19, (uint64_t)v12, &qword_26ACF76F8);
    if (v21(v12, 1, v20))
    {
      sub_21798B28C((uint64_t)v12, &qword_26ACF76F8);
    }
    else
    {
      sub_2179BD6E0((uint64_t)v12, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      sub_21798B28C((uint64_t)v12, &qword_26ACF76F8);
      char v26 = v6[80];
      sub_2179BD748((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      if (v26) {
        goto LABEL_15;
      }
    }
    uint64_t v27 = v37;
    sub_21798B2E8(v19, v37, &qword_26ACF76F8);
    if (v21((char *)v27, 1, v20))
    {
      sub_21798B28C(v37, &qword_26ACF76F8);
      double v28 = 10.0;
    }
    else
    {
      uint64_t v29 = v37;
      sub_2179BD6E0(v37, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      sub_21798B28C(v29, &qword_26ACF76F8);
      double v28 = *((double *)v6 + 9);
      sub_2179BD748((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    }
    objc_msgSend(v18, sel_setParagraphSpacing_, v28);
  }
LABEL_15:
  uint64_t v30 = *MEMORY[0x263F81540];
  id v31 = v18;
  objc_msgSend(v25, sel_addAttribute_value_range_, v30, v31, 0, objc_msgSend(v25, sel_length));

  return v25;
}

id sub_2179B7E18(uint64_t a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x263F089B8]);
  uint64_t v3 = (void *)sub_2179E2900();
  id v4 = objc_msgSend(v2, sel_initWithString_attributes_, v3, 0);

  objc_msgSend(v4, sel_beginEditing);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    unint64_t v6 = self;
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    uint64_t v8 = v5 - 1;
    while (2)
    {
      uint64_t v9 = *(void *)(a1 + 8 * v7 + 32);
      uint64_t v10 = swift_bridgeObjectRetain();
      sub_2179B803C(v10);
      uint64_t v11 = (void *)sub_2179E28B0();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v6, sel_contentTypeForContentDictionary_, v11);

      switch((unint64_t)v12)
      {
        case 0uLL:
          sub_2179B8834(v9);
          id v14 = v13;
          if (v13) {
            goto LABEL_11;
          }
          goto LABEL_14;
        case 1uLL:
          sub_2179B83C0(v9);
          id v14 = v15;
          if (!v15) {
            goto LABEL_14;
          }
          goto LABEL_11;
        case 2uLL:
          id v14 = sub_2179B9178(v9);
          if (!v14) {
            goto LABEL_14;
          }
          goto LABEL_11;
        case 3uLL:
          sub_2179B9B9C(v9);
          id v14 = v16;
          if (v16) {
            goto LABEL_11;
          }
          goto LABEL_14;
        case 4uLL:
          id v14 = sub_2179BA6C8(v9);
          if (!v14) {
            goto LABEL_14;
          }
LABEL_11:
          objc_msgSend(v4, sel_appendAttributedString_, v14);
          swift_bridgeObjectRelease();

          if (v8 == v7) {
            goto LABEL_18;
          }
          goto LABEL_15;
        default:
LABEL_14:
          swift_bridgeObjectRelease();
          if (v8 == v7) {
            goto LABEL_18;
          }
LABEL_15:
          if (!__OFADD__(++v7, 1)) {
            continue;
          }
          __break(1u);
LABEL_18:
          swift_bridgeObjectRelease();
          break;
      }
      break;
    }
  }
  objc_msgSend(v4, sel_endEditing);
  return v4;
}

uint64_t sub_2179B803C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF77F8);
    uint64_t v2 = sub_2179E2D10();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_26;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      int64_t v8 = v13 + 1;
      if (v13 + 1 >= v27) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v8);
      if (!v14)
      {
        int64_t v8 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v8);
        if (!v14) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_2179A122C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v17;
    _OWORD v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(void *)&v36[0] = v18;
    *((void *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21799FA78(v37, v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_21799FA78(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_21799FA78(v35, v36);
    sub_21799FA78(v36, &v32);
    uint64_t result = sub_2179E2C40();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_21799FA78(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v15);
  if (v14)
  {
    int64_t v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v8 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v8);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_2179B83C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v13 = sub_2179B2CDC(v11, v12), (v14 & 1) == 0))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v37);
  swift_bridgeObjectRelease();
  if (!*((void *)&v38 + 1))
  {
LABEL_9:
    sub_21798B28C((uint64_t)&v37, &qword_26ACF75F8);
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7770);
  if (swift_dynamicCast())
  {
    uint64_t v15 = v36;
    uint64_t v16 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags;
    uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags);
    if (v17)
    {
      uint64_t v18 = v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
      swift_beginAccess();
      sub_21798B2E8(v18, (uint64_t)v10, &qword_26ACF76F8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
      {
        sub_21798B28C((uint64_t)v10, &qword_26ACF76F8);
      }
      else
      {
        sub_2179BD6E0((uint64_t)v10, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
        sub_21798B28C((uint64_t)v10, &qword_26ACF76F8);
        sub_2179BD748((uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
      }
      id v20 = sub_2179B8EC8();
      __swift_instantiateConcreteTypeFromMangledName(qword_26ACF7808);
      uint64_t inited = swift_initStackObject();
      char v22 = (void **)MEMORY[0x263F814F0];
      *(_OWORD *)(inited + 16) = xmmword_2179E58F0;
      unint64_t v23 = *v22;
      *(void *)(inited + 32) = *v22;
      BOOL v24 = self;
      id v25 = v23;
      id v26 = objc_msgSend(v24, sel_preferredFontForTextStyle_, v20);
      *(void *)(inited + 64) = sub_217986C94(0, &qword_26ACF77C8);
      *(void *)(inited + 40) = v26;
      sub_21799F7B4(inited);
      id v27 = objc_allocWithZone(MEMORY[0x263F086A0]);
      long long v28 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_2179BD7A8(&qword_26ACF7798, type metadata accessor for Key);
      long long v29 = (void *)sub_2179E28B0();
      swift_bridgeObjectRelease();
      id v30 = objc_msgSend(v27, sel_initWithString_attributes_, v28, v29);

      id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089B8]), sel_initWithAttributedString_, v30);
      uint64_t v17 = *(void *)(v2 + v16);
    }
    else
    {
      id v19 = 0;
    }
    BOOL v31 = __OFADD__(v17, 1);
    uint64_t v32 = v17 + 1;
    if (v31)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v2 + v16) = v32;
      long long v33 = (void *)sub_2179B7E18(v15);
      swift_bridgeObjectRelease();
      if (objc_msgSend(v33, sel_length))
      {
        if (v19)
        {
          id v34 = v19;
          objc_msgSend(v34, sel_appendAttributedString_, v33);
        }
      }
      else
      {
      }
    }
  }
}

void sub_2179B8834(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v47 - v12;
  char v14 = self;
  sub_2179B803C(a1);
  uint64_t v15 = (void *)sub_2179E28B0();
  swift_bridgeObjectRelease();
  id v51 = v14;
  id v16 = objc_msgSend(v14, sel_textForContentNode_, v15);

  if (!v16) {
    return;
  }
  uint64_t v49 = sub_2179E2930();
  uint64_t v50 = v17;

  uint64_t v18 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v20 = sub_2179B2CDC(v18, v19), (v21 & 1) == 0))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v53);
  swift_bridgeObjectRelease();
  if (!*((void *)&v54 + 1))
  {
LABEL_9:
    sub_21798B28C((uint64_t)&v53, &qword_26ACF75F8);
    uint64_t v22 = 0;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7770);
  if (swift_dynamicCast()) {
    uint64_t v22 = v52;
  }
  else {
    uint64_t v22 = 0;
  }
LABEL_10:
  unint64_t v23 = sub_2179BAD10(v22);
  uint64_t v48 = v2;
  uint64_t v24 = v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_21798B2E8(v24, (uint64_t)v13, &qword_26ACF76F8);
  id v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v25(v13, 1, v4))
  {
    id v26 = &qword_26ACF76F8;
    id v27 = (long long *)v13;
LABEL_12:
    sub_21798B28C((uint64_t)v27, v26);
    goto LABEL_14;
  }
  sub_2179BD6E0((uint64_t)v13, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
  sub_21798B28C((uint64_t)v13, &qword_26ACF76F8);
  char v28 = v7[82];
  sub_2179BD748((uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
  if ((v28 & 1) == 0)
  {
    if (*(void *)(v23 + 16))
    {
      id v37 = (id)*MEMORY[0x263F81520];
      unint64_t v38 = sub_2179B2D54((uint64_t)v37);
      if (v39)
      {
        sub_2179A122C(*(void *)(v23 + 56) + 32 * v38, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }

      if (*((void *)&v54 + 1))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21798B28C((uint64_t)&v53, &qword_26ACF75F8);
        return;
      }
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
    }
    id v26 = &qword_26ACF75F8;
    id v27 = &v53;
    goto LABEL_12;
  }
LABEL_14:
  sub_21798B2E8(v24, (uint64_t)v11, &qword_26ACF76F8);
  if (v25(v11, 1, v4))
  {
    sub_21798B28C((uint64_t)v11, &qword_26ACF76F8);
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    id v29 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v30 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_2179BD7A8(&qword_26ACF7798, type metadata accessor for Key);
    BOOL v31 = (void *)sub_2179E28B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

    return;
  }
  sub_2179BD6E0((uint64_t)v11, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
  sub_21798B28C((uint64_t)v11, &qword_26ACF76F8);
  uint64_t v32 = *((void *)v7 + 3);
  swift_bridgeObjectRetain();
  sub_2179BD748((uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
  if (!v32) {
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_33;
  }
  uint64_t v33 = *(void *)(v22 + 16);
  if (!v33)
  {
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    unint64_t v40 = (uint64_t *)(v48 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_gradientTitle);
    uint64_t v41 = v50;
    *unint64_t v40 = v49;
    v40[1] = v41;
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = swift_bridgeObjectRetain();
  sub_2179B803C(v34);
  swift_bridgeObjectRelease();
  uint64_t v35 = (void *)sub_2179E28B0();
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(v51, sel_markTypeForMarkDictionary_, v35);

  if (v36 == (id)3)
  {
LABEL_22:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  if (v33 == 1)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_34;
  }
  uint64_t v42 = 5;
  while (1)
  {
    uint64_t v43 = v42 - 3;
    if (__OFADD__(v42 - 4, 1)) {
      break;
    }
    uint64_t v44 = swift_bridgeObjectRetain();
    sub_2179B803C(v44);
    swift_bridgeObjectRelease();
    uint64_t v45 = (void *)sub_2179E28B0();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(v51, sel_markTypeForMarkDictionary_, v45);

    if (v46 == (id)3) {
      goto LABEL_22;
    }
    ++v42;
    if (v43 == v33) {
      goto LABEL_41;
    }
  }
  __break(1u);
}

id sub_2179B8EC8()
{
  uint64_t v1 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (id *)((char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)*MEMORY[0x263F83570];
  uint64_t v9 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_21798B2E8(v9, (uint64_t)v7, &qword_26ACF76F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    id v10 = v8;
    sub_21798B28C((uint64_t)v7, &qword_26ACF76F8);
LABEL_3:
    long long v18 = 0u;
    long long v19 = 0u;
LABEL_4:
    sub_21798B28C((uint64_t)&v18, &qword_26ACF75F8);
    return v8;
  }
  sub_2179BD6E0((uint64_t)v7, (uint64_t)v4, type metadata accessor for ConstellationContentAttributes);
  id v12 = v8;
  sub_21798B28C((uint64_t)v7, &qword_26ACF76F8);
  id v13 = *v4;
  id v14 = *v4;
  sub_2179BD748((uint64_t)v4, type metadata accessor for ConstellationContentAttributes);
  if (!v13) {
    goto LABEL_3;
  }
  id v15 = objc_msgSend(v14, sel_fontDescriptor);

  id v16 = objc_msgSend(v15, sel_objectForKey_, *MEMORY[0x263F81798]);
  if (v16)
  {
    sub_2179E2C10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_2179BD67C((uint64_t)v17, (uint64_t)&v18, &qword_26ACF75F8);
  if (!*((void *)&v19 + 1)) {
    goto LABEL_4;
  }
  type metadata accessor for TextStyle(0);
  if ((swift_dynamicCast() & 1) == 0) {
    return v12;
  }

  return *(id *)&v17[0];
}

id sub_2179B9178(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v79 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v79 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v79 - v16;
  uint64_t v18 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v20 = sub_2179B2CDC(v18, v19), (v21 & 1) == 0))
  {
    long long v87 = 0u;
    long long v88 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v87);
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1))
  {
LABEL_8:
    sub_21798B28C((uint64_t)&v87, &qword_26ACF75F8);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
  if (swift_dynamicCast())
  {
    uint64_t v83 = *(void **)&v86[0];
    uint64_t v22 = v84;
    id v23 = sub_2179B8EC8();
    uint64_t v24 = v22 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
    swift_beginAccess();
    uint64_t v82 = v24;
    sub_21798B2E8(v24, (uint64_t)v17, &qword_26ACF76F8);
    id v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    id v80 = (id)(v3 + 48);
    uint64_t v81 = v25;
    unsigned int v26 = v25(v17, 1, v2);
    id v79 = v23;
    if (v26)
    {
      sub_21798B28C((uint64_t)v17, &qword_26ACF76F8);
      uint64_t v27 = 0;
      char v28 = 1;
      id v29 = v23;
    }
    else
    {
      sub_2179BD6E0((uint64_t)v17, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
      sub_21798B28C((uint64_t)v17, &qword_26ACF76F8);
      uint64_t v32 = &v5[*(int *)(v2 + 64)];
      uint64_t v27 = *(void *)v32;
      char v28 = v32[8];
      id v29 = v79;
      sub_2179BD748((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
    }
    id v33 = sub_2179A0E74((uint64_t)v83, (uint64_t)v29, v27, v28);
    if (v33)
    {
      uint64_t v34 = v33;
      sub_21798B2E8(v82, (uint64_t)v15, &qword_26ACF76F8);
      if (v81(v15, 1, v2))
      {
        id v35 = v34;
        sub_21798B28C((uint64_t)v15, &qword_26ACF76F8);
      }
      else
      {
        sub_2179BD6E0((uint64_t)v15, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        id v36 = v34;
        sub_21798B28C((uint64_t)v15, &qword_26ACF76F8);
        char v37 = v5[*(int *)(v2 + 68)];
        sub_2179BD748((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        if (v37) {
          goto LABEL_27;
        }
      }
      uint64_t v38 = sub_2179E2930();
      uint64_t v40 = (uint64_t)v83;
      if (v83[2] && (unint64_t v41 = sub_2179B2CDC(v38, v39), (v42 & 1) != 0))
      {
        sub_2179A122C(*(void *)(v40 + 56) + 32 * v41, (uint64_t)&v87);
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v88 + 1))
      {
        if (swift_dynamicCast())
        {
          long long v43 = v86[0];
          if ((void)v43 == sub_2179E2930() && *((void *)&v43 + 1) == v44)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v65 = sub_2179E2D50();
            swift_bridgeObjectRelease();
            if ((v65 & 1) == 0)
            {
              uint64_t v47 = _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
              swift_bridgeObjectRelease();
              goto LABEL_33;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      else
      {
        sub_21798B28C((uint64_t)&v87, &qword_26ACF75F8);
      }
LABEL_27:
      sub_21798B2E8(v82, (uint64_t)v12, &qword_26ACF76F8);
      if (v81(v12, 1, v2))
      {
        sub_21798B28C((uint64_t)v12, &qword_26ACF76F8);
      }
      else
      {
        sub_2179BD6E0((uint64_t)v12, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        sub_21798B28C((uint64_t)v12, &qword_26ACF76F8);
        uint64_t v46 = *((void *)v5 + 1);
        swift_retain();
        sub_2179BD748((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        if (v46)
        {
          sub_217986C94(0, (unint64_t *)&qword_26ACF77E0);
          uint64_t v45 = (void *)sub_2179E2BA0();
          goto LABEL_32;
        }
      }
      uint64_t v45 = objc_msgSend(self, sel_labelColor);
LABEL_32:
      uint64_t v47 = v45;
LABEL_33:
      id v80 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81678]), sel_init);
      uint64_t v48 = sub_2179BD4D8((uint64_t)v83);
      uint64_t v50 = v49;
      swift_bridgeObjectRelease();
      if (v48 == 32 && v50 == 0xE100000000000000) {
        char v51 = 1;
      }
      else {
        char v51 = sub_2179E2D50();
      }
      uint64_t v83 = v47;
      id v52 = objc_msgSend(v34, sel_imageWithTintColor_renderingMode_, v47, 1, v79);

      id v53 = v52;
      long long v54 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v55 = v80;
      objc_msgSend(v80, sel_setAccessibilityLabel_, v54);

      objc_msgSend(v55, sel_setAccessibilityElementsHidden_, v51 & 1);
      objc_msgSend(v55, sel_setImage_, v53);

      unint64_t v56 = sub_21799F7B4(MEMORY[0x263F8EE78]);
      uint64_t v57 = sub_2179E2930();
      if (*(void *)(a1 + 16) && (unint64_t v59 = sub_2179B2CDC(v57, v58), (v60 & 1) != 0))
      {
        sub_2179A122C(*(void *)(a1 + 56) + 32 * v59, (uint64_t)&v87);
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }
      id v61 = v83;
      swift_bridgeObjectRelease();
      if (*((void *)&v88 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7770);
        if (swift_dynamicCast())
        {
          unint64_t v62 = sub_2179BAD10(*(uint64_t *)&v86[0]);
          swift_bridgeObjectRelease();
          sub_21798B2E8(v82, (uint64_t)v9, &qword_26ACF76F8);
          unsigned int v63 = v81(v9, 1, v2);
          uint64_t v64 = v79;
          if (v63)
          {
            sub_21798B28C((uint64_t)v9, &qword_26ACF76F8);
          }
          else
          {
            sub_2179BD6E0((uint64_t)v9, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
            sub_21798B28C((uint64_t)v9, &qword_26ACF76F8);
            char v66 = v5[82];
            sub_2179BD748((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
            if (v66) {
              goto LABEL_58;
            }
          }
          if (*(void *)(v62 + 16))
          {
            id v67 = (id)*MEMORY[0x263F81520];
            unint64_t v68 = sub_2179B2D54((uint64_t)v67);
            if (v69)
            {
              sub_2179A122C(*(void *)(v62 + 56) + 32 * v68, (uint64_t)&v87);
            }
            else
            {
              long long v87 = 0u;
              long long v88 = 0u;
            }

            if (*((void *)&v88 + 1))
            {
              sub_21798B28C((uint64_t)&v87, &qword_26ACF75F8);
              swift_bridgeObjectRelease();
              unint64_t v62 = v56;
              goto LABEL_59;
            }
          }
          else
          {
            long long v87 = 0u;
            long long v88 = 0u;
          }
          sub_21798B28C((uint64_t)&v87, &qword_26ACF75F8);
LABEL_58:
          swift_bridgeObjectRelease();
          goto LABEL_59;
        }
        unint64_t v62 = v56;
        uint64_t v64 = v79;
      }
      else
      {
        sub_21798B28C((uint64_t)&v87, &qword_26ACF75F8);
        unint64_t v62 = v56;
        uint64_t v64 = v79;
      }
LABEL_59:
      char v70 = (void *)*MEMORY[0x263F814F0];
      uint64_t v71 = self;
      id v72 = v70;
      id v73 = objc_msgSend(v71, sel_preferredFontForTextStyle_, v64);
      *((void *)&v88 + 1) = sub_217986C94(0, &qword_26ACF77C8);
      *(void *)&long long v87 = v73;
      sub_21799FA78(&v87, v86);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v85 = v62;
      sub_2179A6140(v86, v72, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      id v75 = objc_allocWithZone(MEMORY[0x263F086A0]);
      type metadata accessor for Key(0);
      sub_2179BD7A8(&qword_26ACF7798, type metadata accessor for Key);
      v76 = (void *)sub_2179E28B0();
      swift_bridgeObjectRelease();
      v77 = v75;
      id v78 = v80;
      id v30 = objc_msgSend(v77, sel_initWithAttachment_attributes_, v80, v76);

      return v30;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

void sub_2179B9B9C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2179E2570();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_2179E1810();
  uint64_t v14 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v16 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v19 = sub_2179B2CDC(v17, v18), (v20 & 1) == 0))
  {
    long long v107 = 0u;
    long long v108 = 0u;
    goto LABEL_9;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v107);
  swift_bridgeObjectRelease();
  if (!*((void *)&v108 + 1))
  {
LABEL_10:
    unsigned int v26 = &qword_26ACF75F8;
    uint64_t v27 = (char *)&v107;
LABEL_11:
    sub_21798B28C((uint64_t)v27, v26);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_2179E2540();
    sub_2179E2840();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  uint64_t v103 = v14;
  uint64_t v21 = v105;
  uint64_t v22 = sub_2179E2930();
  if (*(void *)(v21 + 16) && (unint64_t v24 = sub_2179B2CDC(v22, v23), (v25 & 1) != 0))
  {
    sub_2179A122C(*(void *)(v21 + 56) + 32 * v24, (uint64_t)&v107);
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v108 + 1))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v101 = v2;
  uint64_t v102 = v21;
  uint64_t v28 = v106;
  uint64_t v100 = v105;
  uint64_t v29 = (uint64_t)&v2[OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL];
  swift_beginAccess();
  sub_21798B2E8(v29, (uint64_t)v13, &qword_26ACF6BC8);
  uint64_t v30 = v103;
  uint64_t v31 = v104;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v13, 1, v104) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned int v26 = &qword_26ACF6BC8;
    uint64_t v27 = v13;
    goto LABEL_11;
  }
  uint64_t v99 = v28;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v16, v13, v31);
  uint64_t v32 = v101;
  uint64_t v33 = *(void *)&v101[OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language + 8];
  if (!v33)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v34 = *(void *)&v101[OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language];
  id v35 = self;
  swift_bridgeObjectRetain();
  objc_msgSend(v35, sel_displayScale);
  char v37 = *(void **)&v32[OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager];
  if (!v37)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = v103;
LABEL_34:
    uint64_t v54 = v104;
    sub_2179E2540();
    sub_2179E2840();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v54);
    return;
  }
  double v38 = v36;
  uint64_t v96 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager;
  uint64_t v97 = v34;
  v101 = v37;
  uint64_t v39 = (void *)sub_2179E2900();
  id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F83E60]), sel_init);
  id v41 = objc_msgSend(v40, sel_userInterfaceStyle);

  BOOL v42 = v41 != (id)1;
  if ((~*(void *)&v38 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_62;
  }
  uint64_t v43 = v103;
  if (v38 <= -9.22337204e18)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  uint64_t v98 = v33;
  if (v38 >= 9.22337204e18)
  {
LABEL_63:
    __break(1u);
    return;
  }
  id v44 = v101;
  id v45 = objc_msgSend(v101, sel_fileInfoWithMainIdentifier_userInterfaceStyle_scale_, v39, v42, (uint64_t)v38);

  if (!v45)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  id v46 = objc_msgSend(v45, sel_size);
  if (!v46)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  uint64_t v47 = v46;
  id v48 = objc_msgSend(v46, sel_width);
  objc_msgSend(v48, sel_doubleValue);
  double v50 = v49;

  id v51 = objc_msgSend(v47, sel_height);
  objc_msgSend(v51, sel_doubleValue);
  double v53 = v52;

  if (__CGSizeEqualToSize(v50, v53))
  {
    (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v104);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = (uint64_t)&v2[OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes];
    swift_beginAccess();
    sub_21798B2E8(v55, (uint64_t)v10, &qword_26ACF76F8);
    id v56 = sub_2179A6534((uint64_t)v10);
    sub_21798B28C((uint64_t)v10, &qword_26ACF76F8);
    objc_msgSend(v56, sel_pointSize);
    double v58 = v57;

    double v59 = v58 / 17.0;
    id v95 = v45;
    if (v50 <= 200.0) {
      double v60 = v50 * v59;
    }
    else {
      double v60 = v59 * 200.0;
    }
    if (v53 > 40.0) {
      double v53 = 40.0;
    }
    id v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7F5A8]), sel_init);
    unint64_t v62 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    objc_msgSend(v61, sel_setImageId_, v62);

    unsigned int v63 = (void *)sub_2179E17C0();
    objc_msgSend(v61, sel_setBaseURL_, v63);

    id v64 = objc_allocWithZone(MEMORY[0x263F83E60]);
    id v65 = v61;
    id v66 = objc_msgSend(v64, sel_init);
    id v67 = objc_msgSend(v66, sel_userInterfaceStyle);

    BOOL v68 = v67 != (id)1;
    char v69 = *(void **)&v2[v96];
    id v70 = objc_allocWithZone(MEMORY[0x263F7F5B0]);
    id v71 = v69;
    id v72 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v73 = objc_msgSend(v70, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v65, v72, v68, v71);

    id v74 = objc_msgSend(v73, sel_cacheIdentifierForType_, 0);
    if (v74)
    {
      id v75 = v74;
      uint64_t v76 = sub_2179E2930();
      uint64_t v78 = v77;
      id v79 = objc_msgSend(self, sel_getImageForIdentifier_, v75);

      if (v79)
      {
        id v80 = v47;
        double v81 = v59 * v53;
        swift_bridgeObjectRelease();
        id v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81678]), sel_init);
        uint64_t v83 = sub_2179BD4D8(v102);
        uint64_t v85 = v84;
        swift_bridgeObjectRelease();
        if (v83 == 32 && v85 == 0xE100000000000000) {
          char v86 = 1;
        }
        else {
          char v86 = sub_2179E2D50();
        }
        long long v88 = (void *)sub_2179E2900();
        swift_bridgeObjectRelease();
        objc_msgSend(v82, sel_setAccessibilityLabel_, v88);

        objc_msgSend(v82, sel_setAccessibilityElementsHidden_, v86 & 1);
        objc_msgSend(v79, sel_size);
        if (v89 == 0.0) {
          double v89 = 19.0;
        }
        if (v60 == 0.0) {
          double v91 = v89;
        }
        else {
          double v91 = v60;
        }
        if (v90 == 0.0) {
          double v92 = 19.0;
        }
        else {
          double v92 = v90;
        }
        if (v81 == 0.0) {
          double v93 = v92;
        }
        else {
          double v93 = v81;
        }
        objc_msgSend(v82, sel_setBounds_, 0.0, -2.0, v91, v93);
        objc_msgSend(v82, sel_setImage_, v79);
        objc_msgSend(self, sel_attributedStringWithAttachment_, v82);
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_2179BBA58(v73, v76, v78);
        swift_bridgeObjectRelease();
        id v87 = objc_allocWithZone(MEMORY[0x263F086A0]);
        id v82 = (id)sub_2179E2900();
        objc_msgSend(v87, sel_initWithString_, v82);
      }
      (*(void (**)(char *, uint64_t))(v103 + 8))(v16, v104);
    }
    else
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v103 + 8))(v16, v104);
    }
  }
}

id sub_2179BA6C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2179E2570();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v10 = sub_2179B2CDC(v8, v9), (v11 & 1) == 0))
  {
    long long v45 = 0u;
    long long v46 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v45);
  swift_bridgeObjectRelease();
  if (!*((void *)&v46 + 1))
  {
LABEL_9:
    sub_21798B28C((uint64_t)&v45, &qword_26ACF75F8);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6450);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = v43;
  uint64_t v13 = sub_2179E2930();
  if (*(void *)(a1 + 16) && (unint64_t v15 = sub_2179B2CDC(v13, v14), (v16 & 1) != 0))
  {
    sub_2179A122C(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v45);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v46 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7770);
    if (swift_dynamicCast()) {
      uint64_t v19 = v43;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    sub_21798B28C((uint64_t)&v45, &qword_26ACF75F8);
    uint64_t v19 = 0;
  }
  sub_2179BAD10(v19);
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_2179E2930();
  if (*(void *)(v12 + 16) && (unint64_t v22 = sub_2179B2CDC(v20, v21), (v23 & 1) != 0))
  {
    sub_2179A122C(*(void *)(v12 + 56) + 32 * v22, (uint64_t)&v45);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v46 + 1)) {
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_37;
  }
  uint64_t v24 = v43;
  uint64_t v25 = sub_2179E2930();
  if (*(void *)(v12 + 16) && (unint64_t v27 = sub_2179B2CDC(v25, v26), (v28 & 1) != 0))
  {
    sub_2179A122C(*(void *)(v12 + 56) + 32 * v27, (uint64_t)&v45);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v46 + 1))
  {
    if (swift_dynamicCast())
    {
      if (v24 == 1)
      {
        sub_2179E2540();
        *(void *)&long long v45 = 0;
        *((void *)&v45 + 1) = 0xE000000000000000;
        sub_2179E2C50();
        swift_bridgeObjectRelease();
        *(void *)&long long v45 = 0xD000000000000012;
        *((void *)&v45 + 1) = 0x80000002179E83D0;
        uint64_t v43 = 1;
        LOBYTE(v44) = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6568);
        sub_2179E2950();
      }
      else
      {
        if (!v24)
        {
          uint64_t v29 = v43;
          uint64_t v30 = v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate;
          if (MEMORY[0x21D452890](v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate))
          {
            uint64_t v31 = *(void *)(v30 + 8);
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 8))(v29, ObjectType, v31);
            uint64_t v34 = v33;
            swift_unknownObjectRelease();
            if (v34)
            {
              swift_bridgeObjectRetain();
              uint64_t v35 = sub_2179E2970();
              swift_bridgeObjectRelease();
              if (v35) {
                goto LABEL_43;
              }
            }
          }
          goto LABEL_37;
        }
        sub_2179E2540();
        *(void *)&long long v45 = 0;
        *((void *)&v45 + 1) = 0xE000000000000000;
        sub_2179E2C50();
        swift_bridgeObjectRelease();
        *(void *)&long long v45 = 0xD000000000000027;
        *((void *)&v45 + 1) = 0x80000002179E83A0;
        uint64_t v43 = v24;
        sub_2179E2D40();
      }
      sub_2179E2980();
      swift_bridgeObjectRelease();
      sub_2179E2840();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
LABEL_36:
    sub_21798B28C((uint64_t)&v45, &qword_26ACF75F8);
  }
LABEL_37:
  uint64_t v36 = sub_2179E2930();
  if (*(void *)(v12 + 16) && (unint64_t v38 = sub_2179B2CDC(v36, v37), (v39 & 1) != 0))
  {
    sub_2179A122C(*(void *)(v12 + 56) + 32 * v38, (uint64_t)&v45);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v46 + 1))
  {
    if (swift_dynamicCast())
    {
LABEL_43:
      swift_bridgeObjectRelease();
      id v40 = objc_allocWithZone(MEMORY[0x263F086A0]);
      swift_bridgeObjectRetain();
      id v41 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_2179BD7A8(&qword_26ACF7798, type metadata accessor for Key);
      BOOL v42 = (void *)sub_2179E28B0();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v40, sel_initWithString_attributes_, v41, v42);
      swift_bridgeObjectRelease();

      return v17;
    }
  }
  else
  {
    sub_21798B28C((uint64_t)&v45, &qword_26ACF75F8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_2179BAD10(uint64_t a1)
{
  uint64_t v103 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v97 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_2179E1810();
  unint64_t v112 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  double v93 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v102 = (uint64_t)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v101 = (uint64_t)&v85 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v85 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v85 - v17;
  uint64_t v19 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_21798B2E8(v19, (uint64_t)v18, &qword_26ACF76F8);
  id v20 = sub_2179A6534((uint64_t)v18);
  sub_21798B28C((uint64_t)v18, &qword_26ACF76F8);
  __swift_instantiateConcreteTypeFromMangledName(qword_26ACF7808);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2179E58F0;
  unint64_t v22 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  uint64_t v23 = sub_217986C94(0, &qword_26ACF77C8);
  *(void *)(inited + 64) = v23;
  *(void *)(inited + 40) = v20;
  id v95 = v22;
  id v24 = v20;
  unint64_t v25 = sub_21799F7B4(inited);
  uint64_t v26 = (void *)*MEMORY[0x263F81500];
  uint64_t v106 = v19;
  sub_21798B2E8(v19, (uint64_t)v16, &qword_26ACF76F8);
  unint64_t v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  uint64_t v108 = v5;
  uint64_t v107 = v6 + 48;
  uint64_t v105 = v27;
  unsigned int v28 = v27((uint64_t)v16, 1, v5);
  uint64_t v98 = v8;
  uint64_t v104 = v26;
  if (v28)
  {
    id v29 = v26;
    sub_21798B28C((uint64_t)v16, &qword_26ACF76F8);
LABEL_3:
    id v30 = objc_msgSend(self, sel_labelColor);
    goto LABEL_6;
  }
  sub_2179BD6E0((uint64_t)v16, (uint64_t)v8, type metadata accessor for ConstellationContentAttributes);
  id v31 = v26;
  sub_21798B28C((uint64_t)v16, &qword_26ACF76F8);
  uint64_t v32 = *((void *)v8 + 1);
  swift_retain();
  sub_2179BD748((uint64_t)v8, type metadata accessor for ConstellationContentAttributes);
  if (!v32) {
    goto LABEL_3;
  }
  sub_217986C94(0, (unint64_t *)&qword_26ACF77E0);
  id v30 = (id)sub_2179E2BA0();
LABEL_6:
  id v33 = v30;
  uint64_t v34 = v103;
  uint64_t v100 = sub_217986C94(0, (unint64_t *)&qword_26ACF77E0);
  uint64_t v116 = v100;
  *(void *)&long long v115 = v33;
  sub_21799FA78(&v115, v114);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v113 = v25;
  uint64_t v36 = v104;
  sub_2179A6140(v114, v104, isUniquelyReferenced_nonNull_native);
  unint64_t v37 = v113;

  swift_bridgeObjectRelease();
  if (!v34 || (unint64_t v38 = *(void *)(v34 + 16)) == 0)
  {

    return v37;
  }
  unint64_t v109 = v37;
  uint64_t v90 = v23;
  id v91 = v24;
  char v39 = self;
  uint64_t v111 = v34 + 32;
  double v92 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112 + 48);
  double v89 = (void (**)(char *, uint64_t, uint64_t))(v112 + 32);
  id v88 = (id)*MEMORY[0x263F81520];
  id v87 = (void (**)(uint64_t *, char *, uint64_t))(v112 + 16);
  char v86 = (void (**)(char *, uint64_t))(v112 + 8);
  swift_bridgeObjectRetain();
  unint64_t v40 = 0;
  int v99 = 0;
  int v94 = 0;
  unint64_t v112 = v38 - 1;
  uint64_t v41 = v34 + 40;
  uint64_t v110 = MEMORY[0x263F8EE58] + 8;
  unint64_t v42 = v38;
  while (1)
  {
    uint64_t v43 = *(void *)(v111 + 8 * v40);
    unint64_t v44 = v40 + 1;
    uint64_t v45 = swift_bridgeObjectRetain();
    sub_2179B803C(v45);
    long long v46 = (void *)sub_2179E28B0();
    swift_bridgeObjectRelease();
    id v47 = objc_msgSend(v39, sel_markTypeForMarkDictionary_, v46);

    switch((unint64_t)v47)
    {
      case 0uLL:
        goto LABEL_18;
      case 1uLL:
        goto LABEL_29;
      case 2uLL:
        swift_bridgeObjectRelease();
        if (v44 == v38) {
          goto LABEL_43;
        }
        break;
      case 3uLL:
        goto LABEL_38;
      default:
        goto LABEL_11;
    }
    while (1)
    {
      if (v42 - 1 == v40) {
        goto LABEL_57;
      }
      uint64_t v43 = *(void *)(v41 + 8 * v40);
      uint64_t v49 = swift_bridgeObjectRetain();
      sub_2179B803C(v49);
      double v50 = (void *)sub_2179E28B0();
      swift_bridgeObjectRelease();
      id v51 = objc_msgSend(v39, sel_markTypeForMarkDictionary_, v50);

      if (v51 != (id)2) {
        break;
      }
      swift_bridgeObjectRelease();
      if (v112 == ++v40)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        id v72 = v91;
        id v73 = v95;
        uint64_t v74 = v90;
        if (v99)
        {
LABEL_50:
          id v75 = objc_msgSend(v72, sel_fontDescriptor);
          id v76 = objc_msgSend(v75, sel_fontDescriptorWithSymbolicTraits_, 3);
          goto LABEL_52;
        }
LABEL_47:
        id v75 = objc_msgSend(v72, sel_fontDescriptor);
        id v76 = objc_msgSend(v75, sel_fontDescriptorWithSymbolicTraits_, 1);
        goto LABEL_52;
      }
    }
    unint64_t v44 = v40 + 2;
    if (!v51) {
      break;
    }
    if (v51 == (id)3)
    {
      int v94 = 1;
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v63 = v101;
      sub_21798B2E8(v106, v101, &qword_26ACF76F8);
      if (v105(v63, 1, v108))
      {
        sub_21798B28C(v63, &qword_26ACF76F8);
        id v64 = v104;
        goto LABEL_40;
      }
      uint64_t v65 = (uint64_t)v98;
      sub_2179BD6E0(v63, (uint64_t)v98, type metadata accessor for ConstellationContentAttributes);
      sub_21798B28C(v63, &qword_26ACF76F8);
      uint64_t v66 = *(void *)(v65 + 16);
      swift_retain();
      sub_2179BD748(v65, type metadata accessor for ConstellationContentAttributes);
      id v64 = v104;
      if (!v66) {
LABEL_40:
      }
        sub_2179E2220();
      id v67 = v64;
      swift_retain();
      uint64_t v68 = v100;
      uint64_t v69 = sub_2179E2BA0();
      uint64_t v116 = v68;
      *(void *)&long long v115 = v69;
      sub_21799FA78(&v115, v114);
      unint64_t v70 = v109;
      char v71 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v113 = v70;
      sub_2179A6140(v114, v67, v71);
      unint64_t v109 = v113;
      swift_release();

      goto LABEL_11;
    }
    if (v51 != (id)1)
    {
      int v94 = 1;
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    int v94 = 1;
LABEL_29:
    swift_bridgeObjectRelease();
    if (v44 == v38)
    {
      swift_bridgeObjectRelease();
      goto LABEL_49;
    }
    int v99 = 1;
LABEL_13:
    unint64_t v40 = v44;
    if (v44 <= v38) {
      unint64_t v42 = v38;
    }
    else {
      unint64_t v42 = v44;
    }
    if (v44 >= v38)
    {
LABEL_57:
      __break(1u);
      JUMPOUT(0x2179BBA48);
    }
  }
  int v94 = 1;
LABEL_18:
  uint64_t v48 = v102;
  sub_21798B2E8(v106, v102, &qword_26ACF76F8);
  if (v105(v48, 1, v108))
  {
    sub_21798B28C(v48, &qword_26ACF76F8);
  }
  else
  {
    uint64_t v52 = (uint64_t)v98;
    sub_2179BD6E0(v48, (uint64_t)v98, type metadata accessor for ConstellationContentAttributes);
    sub_21798B28C(v48, &qword_26ACF76F8);
    int v53 = *(unsigned __int8 *)(v52 + 81);
    sub_2179BD748(v52, type metadata accessor for ConstellationContentAttributes);
    if (v53 != 1) {
      goto LABEL_11;
    }
  }
  sub_2179B803C(v43);
  swift_bridgeObjectRelease();
  uint64_t v54 = (void *)sub_2179E28B0();
  swift_bridgeObjectRelease();
  id v55 = objc_msgSend(v39, sel_hrefForLinkMark_, v54);

  if (v55)
  {
    sub_2179E2930();

    uint64_t v56 = (uint64_t)v97;
    sub_2179E17E0();
    swift_bridgeObjectRelease();
    uint64_t v57 = v96;
    if ((*v92)(v56, 1, v96) == 1)
    {
      sub_21798B28C(v56, &qword_26ACF6BC8);
    }
    else
    {
      double v58 = v93;
      (*v89)(v93, v56, v57);
      uint64_t v116 = v57;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v115);
      (*v87)(boxed_opaque_existential_0, v58, v57);
      sub_21799FA78(&v115, v114);
      id v60 = v88;
      unint64_t v61 = v109;
      char v62 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v113 = v61;
      sub_2179A6140(v114, v60, v62);
      unint64_t v109 = v113;

      swift_bridgeObjectRelease();
      (*v86)(v58, v57);
    }
  }
LABEL_12:
  if (v44 != v38) {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  if ((v99 & 1) == 0)
  {
    id v72 = v91;
    id v73 = v95;
    uint64_t v74 = v90;
    if ((v94 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_47;
  }
LABEL_49:
  id v72 = v91;
  id v73 = v95;
  uint64_t v74 = v90;
  if (v94) {
    goto LABEL_50;
  }
  id v75 = objc_msgSend(v91, sel_fontDescriptor);
  id v76 = objc_msgSend(v75, sel_fontDescriptorWithSymbolicTraits_, 2);
LABEL_52:
  id v77 = v76;

  if (v77)
  {
    objc_msgSend(v72, sel_pointSize);
    id v79 = objc_msgSend(self, sel_fontWithDescriptor_size_, v77, v78);

    if (v79)
    {
      uint64_t v116 = v74;
      *(void *)&long long v115 = v79;
      sub_21799FA78(&v115, v114);
      id v80 = v79;
      id v81 = v73;
      unint64_t v82 = v109;
      char v83 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v113 = v82;
      sub_2179A6140(v114, v81, v83);
      unint64_t v37 = v113;

      swift_bridgeObjectRelease();
      return v37;
    }
  }
LABEL_55:

  return v109;
}

void sub_2179BBA58(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2179E24A0();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v43 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_2179E24D0();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v41 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v40 = (char *)OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue;
  uint64_t v11 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a2;
  v13[4] = a3;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_2179BD040;
  *(void *)(v14 + 24) = v13;
  uint64_t v52 = sub_2179BD05C;
  int v53 = (void *)v14;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v49 = 1107296256;
  double v50 = sub_2179A97A0;
  id v51 = &block_descriptor_4;
  uint64_t v15 = _Block_copy(&aBlock);
  char v16 = v11;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v16, v15);

  _Block_release(v15);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v15)
  {
    __break(1u);
  }
  else
  {
    id v17 = objc_msgSend(self, sel_assetPathFromAssetConfiguration_type_, a1, 0);
    if (!v17)
    {
LABEL_7:
      swift_release();
      return;
    }
    uint64_t v18 = v17;
    sub_217986C94(0, (unint64_t *)&qword_26ACF6B88);
    id v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    if (!v19)
    {
      swift_release();

      return;
    }
    id v20 = v19;
    uint64_t v21 = (void *)sub_2179E2900();
    int v22 = *MEMORY[0x263F085C0];
    uint64_t v23 = swift_allocObject();
    swift_weakInit();
    id v24 = (void *)swift_allocObject();
    v24[2] = a1;
    v24[3] = v23;
    v24[4] = a2;
    v24[5] = a3;
    uint64_t v52 = sub_2179BD0AC;
    int v53 = v24;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v49 = 1107296256;
    double v50 = sub_217988318;
    id v51 = &block_descriptor_72;
    unint64_t v25 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    id v26 = a1;
    swift_release();
    LODWORD(v27) = v22;
    id v28 = objc_msgSend(v20, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v18, v21, 0, v25, v27);
    _Block_release(v25);

    if (!v28)
    {
      swift_release();

      return;
    }
    id v29 = objc_msgSend(v28, sel_sessionTask);
    if (v29)
    {
      id v31 = v29;
      LODWORD(v30) = v22;
      objc_msgSend(v29, sel_setPriority_, v30);

      uint64_t v32 = *(void **)&v40[v4];
      uint64_t v33 = swift_allocObject();
      swift_weakInit();
      uint64_t v34 = (void *)swift_allocObject();
      v34[2] = v33;
      v34[3] = a2;
      v34[4] = a3;
      v34[5] = v28;
      uint64_t v52 = sub_2179BD12C;
      int v53 = v34;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v49 = 1107296256;
      double v50 = sub_2179911FC;
      id v51 = &block_descriptor_79;
      uint64_t v35 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      id v36 = v32;
      swift_retain();
      unint64_t v40 = (char *)v28;
      unint64_t v37 = v41;
      sub_2179E24C0();
      uint64_t v47 = MEMORY[0x263F8EE78];
      sub_2179BD7A8((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
      sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
      unint64_t v38 = v43;
      uint64_t v39 = v46;
      sub_2179E2C20();
      MEMORY[0x21D451C00](0, v37, v38, v35);
      _Block_release(v35);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v38, v39);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v44);
      swift_release();
      swift_release();
      goto LABEL_7;
    }
  }
  __break(1u);
}

void sub_2179BC0BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_2179BC120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
    swift_beginAccess();
    uint64_t v7 = *v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_2179B2CDC(a2, a3), (v9 & 1) != 0)) {
      id v10 = *(id *)(*(void *)(v7 + 56) + 8 * v8);
    }
    else {
      id v10 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_2179BC1FC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13 = sub_2179E24A0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2179E24D0();
  uint64_t v36 = *(void *)(v17 - 8);
  uint64_t v37 = v17;
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2179E2570();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a9)
  {
    uint64_t v35 = v22;
    id v25 = a9;
    sub_2179E2540();
    unint64_t aBlock = 0;
    unint64_t v40 = 0xE000000000000000;
    sub_2179E2C50();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD000000000000020;
    unint64_t v40 = 0x80000002179E8370;
    swift_getErrorValue();
    sub_2179E2DA0();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E2840();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v35);
    goto LABEL_6;
  }
  id v26 = objc_msgSend(a10, sel_cacheIdentifierForType_, 0);
  if (v26)
  {
    double v27 = v26;
    id v28 = objc_msgSend(self, sel_getImageForIdentifier_, v26);

    if (v28)
    {
      sub_217986C94(0, (unint64_t *)&qword_26ACF75D0);
      id v29 = (void *)sub_2179E2B00();
      uint64_t v43 = sub_2179BD408;
      uint64_t v44 = a11;
      unint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v40 = 1107296256;
      uint64_t v41 = sub_2179911FC;
      uint64_t v42 = &block_descriptor_82;
      double v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      sub_2179E24C0();
      unint64_t aBlock = MEMORY[0x263F8EE78];
      sub_2179BD7A8((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
      sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
      sub_2179E2C20();
      MEMORY[0x21D451C00](0, v19, v16, v30);
      _Block_release(v30);

      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
LABEL_6:
      swift_beginAccess();
      uint64_t Strong = swift_weakLoadStrong();
      if (Strong)
      {
        id v32 = *(id *)(Strong + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue);
        swift_release();
        uint64_t v33 = (void *)swift_allocObject();
        v33[2] = a11;
        v33[3] = a12;
        v33[4] = a13;
        uint64_t v43 = sub_2179BD454;
        uint64_t v44 = (uint64_t)v33;
        unint64_t aBlock = MEMORY[0x263EF8330];
        unint64_t v40 = 1107296256;
        uint64_t v41 = sub_2179911FC;
        uint64_t v42 = &block_descriptor_88;
        uint64_t v34 = _Block_copy(&aBlock);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_2179E24C0();
        uint64_t v38 = MEMORY[0x263F8EE78];
        sub_2179BD7A8((unint64_t *)&qword_26ACF7590, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
        sub_217987B38((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
        sub_2179E2C20();
        MEMORY[0x21D451C00](0, v19, v16, v34);
        _Block_release(v34);

        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
        swift_release();
      }
    }
  }
}

uint64_t sub_2179BC834()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2179B74F4();
    return swift_release();
  }
  return result;
}

void sub_2179BC88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    uint64_t v5 = (void *)sub_2179BD150(a2, a3, (void (*)(void))sub_2179B4DBC);
    swift_endAccess();
    swift_release();
  }
}

uint64_t sub_2179BC944(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    unint64_t v8 = (uint64_t *)(result + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v9 = a4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v8;
    uint64_t *v8 = 0x8000000000000000;
    sub_2179A6314((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v8 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_2179BCA38()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2179E2AF0();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_2179E2AD0();
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E24D0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v36 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7708);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AttributedTextView();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v33 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser__bodyText;
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086A0]), sel_init);
  uint64_t v17 = &v15[*(int *)(v10 + 28)];
  uint64_t v18 = type metadata accessor for ConstellationContentAttributes(0);
  id v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)uint64_t v15 = v16;
  v15[24] = 1;
  uint64_t v20 = &v15[*(int *)(v10 + 32)];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  sub_2179BD6E0((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for AttributedTextView);
  sub_2179E1AA0();
  sub_2179BD748((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AttributedTextView);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v33, v9, v35);
  uint64_t v21 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language);
  *uint64_t v21 = 0;
  v21[1] = 0;
  uint64_t v22 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL;
  uint64_t v23 = sub_2179E1810();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v19((char *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes), 1, 1, v18);
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager) = 0;
  id v24 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  *id v24 = 0;
  v24[1] = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable) = 1;
  uint64_t v25 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_maxWidth;
  *(void *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 8) = 1;
  id v26 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_gradientTitle);
  *id v26 = 0;
  v26[1] = 0;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v27 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_rawContent;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7800);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_2179E58F0;
  uint64_t v29 = MEMORY[0x263F8EE78];
  *(void *)(v28 + 32) = sub_21799F3F0(MEMORY[0x263F8EE78]);
  *(void *)(v1 + v27) = v28;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags) = 0;
  uint64_t v30 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap;
  *(void *)(v1 + v30) = sub_21799F694(v29);
  uint64_t v31 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue;
  sub_217986C94(0, (unint64_t *)&qword_26ACF75D0);
  sub_2179E24C0();
  uint64_t v42 = v29;
  sub_2179BD7A8(&qword_26ACF75C8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75A8);
  sub_217987B38(&qword_26ACF75B0, &qword_26ACF75A8);
  sub_2179E2C20();
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, *MEMORY[0x263F8F130], v41);
  *(void *)(v1 + v31) = sub_2179E2B20();
  return v1;
}

uint64_t sub_2179BCFC4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ConstellationContentParser(0);
  uint64_t result = sub_2179E1A40();
  *a1 = result;
  return result;
}

uint64_t sub_2179BD004()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2179BD040()
{
  sub_2179BC120(v0[2], v0[3], v0[4]);
}

uint64_t sub_2179BD04C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179BD05C()
{
  return sub_2179A9778(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2179BD064()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2179BD0AC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  sub_2179BC1FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(id *)(v9 + 16), *(void *)(v9 + 24), *(void *)(v9 + 32), *(void *)(v9 + 40));
}

uint64_t sub_2179BD0E4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2179BD12C()
{
  return sub_2179BC944(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_2179BD138(uint64_t a1, uint64_t a2)
{
  return sub_2179BD150(a1, a2, (void (*)(void))sub_2179B3F08);
}

uint64_t sub_2179BD150(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2179B2CDC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  uint64_t *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_2179BD230(v8, v11);
  uint64_t *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_2179BD230(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2179E2C30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2179E2E00();
        swift_bridgeObjectRetain();
        sub_2179E2960();
        uint64_t v9 = sub_2179E2E30();
        uint64_t result = swift_bridgeObjectRelease();
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
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          id v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
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

uint64_t sub_2179BD408()
{
  return sub_2179BC834();
}

uint64_t objectdestroy_61Tm()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2179BD454()
{
  sub_2179BC88C(v0[2], v0[3], v0[4]);
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

BOOL __CGSizeEqualToSize(double a1, double a2)
{
  return a2 == 0.0 && a1 == 0.0;
}

uint64_t sub_2179BD4D8(uint64_t a1)
{
  uint64_t v2 = sub_2179E2930();
  if (!*(void *)(a1 + 16) || (unint64_t v4 = sub_2179B2CDC(v2, v3), (v5 & 1) == 0))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_2179A122C(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (!*((void *)&v11 + 1))
  {
LABEL_10:
    sub_21798B28C((uint64_t)&v10, &qword_26ACF75F8);
    return 32;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 32;
  }
  uint64_t result = v8;
  uint64_t v7 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 32;
  }
  return result;
}

uint64_t sub_2179BD5BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2179BD5EC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179BD624(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_2179BD67C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2179BD6E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2179BD748(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2179BD7A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static AssetContentModeKey.defaultValue.getter()
{
  return 0;
}

uint64_t sub_2179BD818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2179BDA34();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.assetContentMode.getter()
{
  sub_217986DF4();
  sub_2179E1E20();
  return v1;
}

uint64_t EnvironmentValues.assetContentMode.setter()
{
  return sub_2179E1E30();
}

uint64_t (*EnvironmentValues.assetContentMode.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_217986DF4();
  sub_2179E1E20();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_2179BD96C;
}

uint64_t sub_2179BD96C(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_2179E1E30();
}

ValueMetadata *type metadata accessor for AssetContentModeKey()
{
  return &type metadata for AssetContentModeKey;
}

uint64_t sub_2179BD9C4()
{
  return swift_getWitnessTable();
}

unint64_t sub_2179BDA34()
{
  unint64_t result = qword_26ACF6AE0;
  if (!qword_26ACF6AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF6AE0);
  }
  return result;
}

uint64_t sub_2179BDA88()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_2179BDA98()
{
  _s17TipsUIBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267BA6570 = (uint64_t)result;
  return result;
}

id static NSBundle.tipsUIFrameworkBundle.getter()
{
  if (qword_267BA60E8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267BA6570;

  return v0;
}

uint64_t _s17TipsUIBundleClassCMa()
{
  return self;
}

uint64_t TipSpotlightView.assetConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TipSpotlightView() + 48);
  uint64_t v4 = sub_2179E27A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for TipSpotlightView()
{
  uint64_t result = qword_26ACF7CB8;
  if (!qword_26ACF7CB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TipSpotlightView.assetConfiguration.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TipSpotlightView() + 48);
  uint64_t v4 = sub_2179E27A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*TipSpotlightView.assetConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightView.bodyContent.getter()
{
  type metadata accessor for TipSpotlightView();

  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightView.bodyContent.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for TipSpotlightView() + 52);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TipSpotlightView.bodyContent.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightView.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = swift_getKeyPath();
  *(unsigned char *)(a1 + 8) = 0;
  uint64_t v2 = (int *)type metadata accessor for TipSpotlightView();
  uint64_t v3 = (uint64_t *)(a1 + v2[5]);
  *uint64_t v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t *)(a1 + v2[6]);
  *uint64_t v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = v2[7];
  sub_2179E2340();
  *(_OWORD *)(a1 + v5) = v10;
  uint64_t v6 = v2[8];
  sub_2179E2340();
  *(_OWORD *)(a1 + v6) = v10;
  uint64_t v7 = a1 + v2[9];
  type metadata accessor for CGSize(0);
  sub_2179E2340();
  *(_OWORD *)uint64_t v7 = v10;
  *(void *)(v7 + 16) = v11;
  uint64_t v8 = a1 + v2[10];
  sub_2179E2340();
  *(_OWORD *)uint64_t v8 = v10;
  *(void *)(v8 + 16) = v11;
  sub_2179E20F0();
  *(void *)(a1 + v2[13]) = 0;
  return sub_2179E2780();
}

uint64_t TipSpotlightView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179BE064((uint64_t)v5);
  uint64_t v6 = (long long *)(v1 + *(int *)(type metadata accessor for TipSpotlightView() + 40));
  uint64_t v7 = *((void *)v6 + 2);
  long long v17 = *v6;
  uint64_t v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
  sub_2179E2370();
  uint64_t v8 = v19;
  uint64_t v9 = v20;
  uint64_t v10 = v21;
  uint64_t v11 = v22;
  uint64_t v12 = sub_2179E2410();
  uint64_t v14 = v13;
  sub_21798B2E8((uint64_t)v5, a1, &qword_267BA65B0);
  uint64_t v15 = (void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BA65C0) + 36));
  *uint64_t v15 = v8;
  v15[1] = v9;
  void v15[2] = v10;
  v15[3] = v11;
  v15[4] = v12;
  v15[5] = v14;
  return sub_21798B28C((uint64_t)v5, &qword_267BA65B0);
}

uint64_t sub_2179BE064@<X0>(uint64_t a1@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63C8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6630);
  uint64_t v4 = MEMORY[0x270FA5388](v53);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v49 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6620);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6610);
  uint64_t v12 = MEMORY[0x270FA5388](v50);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v49 = (uint64_t)&v49 - v15;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66C0);
  MEMORY[0x270FA5388](v51);
  long long v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66C8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6600);
  MEMORY[0x270FA5388](v52);
  uint64_t v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v23 = sub_2179BE6A0();
  if (v23)
  {
    if (v23 == 1)
    {
      *(void *)uint64_t v11 = sub_2179E1E40();
      *((void *)v11 + 1) = 0x4028000000000000;
      v11[16] = 0;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66D0);
      sub_2179BEBA8((uint64_t)&v11[*(int *)(v24 + 44)]);
      char v25 = sub_2179E2010();
      sub_2179E1BB0();
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      sub_21798B2E8((uint64_t)v11, (uint64_t)v14, &qword_267BA6620);
      uint64_t v34 = &v14[*(int *)(v50 + 36)];
      char *v34 = v25;
      *((void *)v34 + 1) = v27;
      *((void *)v34 + 2) = v29;
      *((void *)v34 + 3) = v31;
      *((void *)v34 + 4) = v33;
      v34[40] = 0;
      sub_21798B28C((uint64_t)v11, &qword_267BA6620);
      uint64_t v35 = &qword_267BA6610;
      uint64_t v36 = v49;
      sub_2179BD67C((uint64_t)v14, v49, &qword_267BA6610);
      sub_21798B2E8(v36, (uint64_t)v20, &qword_267BA6610);
      swift_storeEnumTagMultiPayload();
      sub_2179C5FB4(&qword_267BA6608, &qword_267BA6610, &qword_267BA6618, &qword_267BA6620);
      sub_2179E1F60();
      sub_21798B2E8((uint64_t)v22, (uint64_t)v17, &qword_267BA6600);
      swift_storeEnumTagMultiPayload();
      sub_2179C46F0();
      sub_2179C4928(&qword_267BA6628, &qword_267BA6630, (void (*)(void))sub_2179C478C);
      sub_2179E1F60();
      sub_21798B28C((uint64_t)v22, &qword_267BA6600);
      uint64_t v37 = v36;
    }
    else
    {
      sub_2179BF5BC((uint64_t)v3);
      char v38 = sub_2179E2010();
      sub_2179E1BB0();
      uint64_t v40 = v39;
      uint64_t v42 = v41;
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      sub_21798B2E8((uint64_t)v3, (uint64_t)v6, &qword_267BA63C8);
      uint64_t v47 = &v6[*(int *)(v53 + 36)];
      *uint64_t v47 = v38;
      *((void *)v47 + 1) = v40;
      *((void *)v47 + 2) = v42;
      *((void *)v47 + 3) = v44;
      *((void *)v47 + 4) = v46;
      v47[40] = 0;
      sub_21798B28C((uint64_t)v3, &qword_267BA63C8);
      uint64_t v35 = &qword_267BA6630;
      sub_2179BD67C((uint64_t)v6, (uint64_t)v8, &qword_267BA6630);
      sub_21798B2E8((uint64_t)v8, (uint64_t)v17, &qword_267BA6630);
      swift_storeEnumTagMultiPayload();
      sub_2179C46F0();
      sub_2179C4928(&qword_267BA6628, &qword_267BA6630, (void (*)(void))sub_2179C478C);
      sub_2179E1F60();
      uint64_t v37 = (uint64_t)v8;
    }
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_2179C5FB4(&qword_267BA6608, &qword_267BA6610, &qword_267BA6618, &qword_267BA6620);
    sub_2179E1F60();
    uint64_t v35 = &qword_267BA6600;
    sub_21798B2E8((uint64_t)v22, (uint64_t)v17, &qword_267BA6600);
    swift_storeEnumTagMultiPayload();
    sub_2179C46F0();
    sub_2179C4928(&qword_267BA6628, &qword_267BA6630, (void (*)(void))sub_2179C478C);
    sub_2179E1F60();
    uint64_t v37 = (uint64_t)v22;
  }
  return sub_21798B28C(v37, v35);
}

uint64_t sub_2179BE6A0()
{
  uint64_t v1 = *(void **)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_2179C3244(v1, v2);
  id v3 = sub_2179C27BC(v1, v2);
  sub_2179C3438(v1, v2);
  uint64_t v4 = (uint64_t)objc_msgSend(v3, sel_contentType);

  if (v4)
  {
    uint64_t v5 = sub_2179E2930();
    uint64_t v7 = v6;

    sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
    if (v5 == sub_2179E2B70() && v7 == v8)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    else
    {
      char v10 = sub_2179E2D50();
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
      else
      {
        sub_2179E2760();
        if (v5 == sub_2179E2720() && v7 == v11)
        {
          uint64_t v4 = 2;
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v12 = sub_2179E2D50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
            return 2;
          }
          else {
            return 0;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_2179BE820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 48);
  uint64_t v5 = sub_2179E27A0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_2179BE890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 48);
  uint64_t v5 = sub_2179E27A0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_2179BE900())()
{
  return nullsub_1;
}

uint64_t sub_2179BE924()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179BE930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 52);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_2179BE968())()
{
  return nullsub_1;
}

uint64_t sub_2179BE98C()
{
  return sub_2179E27B0();
}

uint64_t sub_2179BEA0C()
{
  return sub_2179E27C0();
}

uint64_t sub_2179BEA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179BE064((uint64_t)v7);
  uint64_t v8 = (long long *)(v2 + *(int *)(a1 + 40));
  uint64_t v9 = *((void *)v8 + 2);
  long long v19 = *v8;
  uint64_t v20 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
  sub_2179E2370();
  uint64_t v10 = v21;
  uint64_t v11 = v22;
  uint64_t v12 = v23;
  uint64_t v13 = v24;
  uint64_t v14 = sub_2179E2410();
  uint64_t v16 = v15;
  sub_21798B2E8((uint64_t)v7, a2, &qword_267BA65B0);
  long long v17 = (void *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BA65C0) + 36));
  *long long v17 = v10;
  v17[1] = v11;
  _OWORD v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  v17[5] = v16;
  return sub_21798B28C((uint64_t)v7, &qword_267BA65B0);
}

uint64_t sub_2179BEBA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63C8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66D8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v16 - v12;
  sub_2179BED50((uint64_t)&v16 - v12);
  sub_2179BF5BC((uint64_t)v7);
  sub_21798B2E8((uint64_t)v13, (uint64_t)v11, &qword_267BA66D8);
  sub_21798B2E8((uint64_t)v7, (uint64_t)v5, &qword_267BA63C8);
  sub_21798B2E8((uint64_t)v11, a1, &qword_267BA66D8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66E0);
  sub_21798B2E8((uint64_t)v5, a1 + *(int *)(v14 + 48), &qword_267BA63C8);
  sub_21798B28C((uint64_t)v7, &qword_267BA63C8);
  sub_21798B28C((uint64_t)v13, &qword_267BA66D8);
  sub_21798B28C((uint64_t)v5, &qword_267BA63C8);
  return sub_21798B28C((uint64_t)v11, &qword_267BA66D8);
}

uint64_t sub_2179BED50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v79 = a1;
  uint64_t v74 = sub_2179E1D30();
  MEMORY[0x270FA5388](v74);
  id v75 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v68 = (uint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66F0);
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA66F8);
  MEMORY[0x270FA5388](v64);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6700);
  MEMORY[0x270FA5388](v65);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6708);
  MEMORY[0x270FA5388](v69);
  uint64_t v72 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6710);
  MEMORY[0x270FA5388](v70);
  id v73 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6718);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v77 = v14;
  uint64_t v78 = v15;
  MEMORY[0x270FA5388](v14);
  char v71 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v63 - v22;
  MEMORY[0x270FA5388](v21);
  char v25 = (char *)&v63 - v24;
  uint64_t v26 = sub_2179E1810();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = v1;
  sub_2179C0620((uint64_t)v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_21798B28C((uint64_t)v25, &qword_26ACF6BC8);
    uint64_t v30 = 1;
    uint64_t v31 = v79;
    uint64_t v32 = v77;
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    uint64_t v63 = v29;
    v33(v29, v25, v26);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v23, v29, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v23, 0, 1, v26);
    sub_21798B2E8((uint64_t)v23, (uint64_t)v20, &qword_26ACF6BC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6720);
    sub_2179C566C();
    sub_2179E1BA0();
    sub_21798B28C((uint64_t)v23, &qword_26ACF6BC8);
    uint64_t v35 = v66;
    uint64_t v34 = v67;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v9, v7, v67);
    uint64_t v36 = &v9[*(int *)(v64 + 36)];
    *(void *)uint64_t v36 = 0;
    *((_WORD *)v36 + 4) = 257;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v34);
    uint64_t v37 = v68;
    sub_2179C16F8(v68);
    uint64_t v38 = sub_2179E2420();
    uint64_t v40 = v39;
    uint64_t v41 = (uint64_t)&v11[*(int *)(v65 + 36)];
    sub_21798B2E8(v37, v41, &qword_267BA66E8);
    uint64_t v42 = (uint64_t *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BA6740) + 36));
    uint64_t *v42 = v38;
    v42[1] = v40;
    sub_21798B2E8((uint64_t)v9, (uint64_t)v11, &qword_267BA66F8);
    sub_21798B28C(v37, &qword_267BA66E8);
    sub_21798B28C((uint64_t)v9, &qword_267BA66F8);
    type metadata accessor for TipSpotlightView();
    sub_2179E2770();
    sub_2179E2420();
    sub_2179E1C40();
    uint64_t v43 = v72;
    sub_21798B2E8((uint64_t)v11, v72, &qword_267BA6700);
    uint64_t v44 = (_OWORD *)(v43 + *(int *)(v69 + 36));
    long long v45 = v81;
    *uint64_t v44 = v80;
    v44[1] = v45;
    _OWORD v44[2] = v82;
    sub_21798B28C((uint64_t)v11, &qword_267BA6700);
    uint64_t v46 = v75;
    uint64_t v47 = &v75[*(int *)(v74 + 20)];
    uint64_t v48 = *MEMORY[0x263F19860];
    uint64_t v49 = sub_2179E1E50();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v47, v48, v49);
    __asm { FMOV            V0.2D, #10.0 }
    *uint64_t v46 = _Q0;
    uint64_t v55 = (uint64_t)v73;
    uint64_t v56 = (uint64_t)&v73[*(int *)(v70 + 36)];
    uint64_t v57 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_2179C5E4C((uint64_t)v46, v56, MEMORY[0x263F19048]);
    *(_WORD *)(v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BA6748) + 36)) = 256;
    sub_21798B2E8(v43, v55, &qword_267BA6708);
    sub_2179C5EB4((uint64_t)v46, v57);
    sub_21798B28C(v43, &qword_267BA6708);
    uint64_t v58 = v77;
    uint64_t v59 = (uint64_t)v71;
    sub_2179C29DC(&qword_26ACF7D50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)&v71[*(int *)(v77 + 52)]);
    sub_2179BD67C(v55, v59, &qword_267BA6710);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v63, v26);
    uint64_t v60 = v59;
    uint64_t v61 = v79;
    sub_2179BD67C(v60, v79, &qword_267BA6718);
    uint64_t v30 = 0;
    uint64_t v31 = v61;
    uint64_t v32 = v58;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v31, v30, 1, v32);
}

uint64_t sub_2179BF5BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v118 = a1;
  uint64_t v2 = sub_2179E18F0();
  uint64_t v116 = *(void *)(v2 - 8);
  uint64_t v117 = v2;
  MEMORY[0x270FA5388](v2);
  long long v115 = (char *)&v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2179E1BC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v113 = v4;
  uint64_t v114 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v112 = (uint64_t)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6678) - 8;
  MEMORY[0x270FA5388](v103);
  uint64_t v101 = (uint64_t)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TipSpotlightView();
  uint64_t v119 = *(void *)(v8 - 8);
  uint64_t v99 = *(void *)(v119 + 64);
  uint64_t v121 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v124 = (uint64_t)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2179E1D40();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v96 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2179E1BE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v92 - v17;
  uint64_t v19 = sub_2179E2440();
  uint64_t v94 = *(void *)(v19 - 8);
  uint64_t v95 = v19;
  MEMORY[0x270FA5388](v19);
  double v93 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6688);
  uint64_t v22 = v21 - 8;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (_OWORD *)((char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6668) - 8;
  MEMORY[0x270FA5388](v98);
  uint64_t v97 = (uint64_t)&v92 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6650);
  MEMORY[0x270FA5388](v123);
  uint64_t v122 = (uint64_t)&v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6648);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v106 = v27;
  uint64_t v107 = v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v100 = (char *)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6640);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v108 = v30;
  uint64_t v109 = v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v102 = (char *)&v92 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63C0);
  uint64_t v110 = *(void *)(v33 - 8);
  uint64_t v111 = v33;
  MEMORY[0x270FA5388](v33);
  uint64_t v104 = (char *)&v92 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA63C8);
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v105 = (uint64_t)&v92 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_2179E1E80();
  uint64_t v120 = v1;
  sub_2179C1C60(v1, (uint64_t)v133);
  sub_2179C29DC(&qword_26ACF7D50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v18);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x263F184F8], v12);
  char v37 = sub_2179E1BD0();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v13 + 8);
  v38(v16, v12);
  v38(v18, v12);
  uint64_t v40 = v93;
  uint64_t v39 = v94;
  uint64_t v41 = (unsigned int *)MEMORY[0x263F1B968];
  if ((v37 & 1) == 0) {
    uint64_t v41 = (unsigned int *)MEMORY[0x263F1B950];
  }
  uint64_t v42 = v95;
  (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, *v41, v95);
  *(_OWORD *)((char *)&v129[10] + 7) = v133[10];
  *(_OWORD *)((char *)&v129[11] + 7) = v133[11];
  *(_OWORD *)((char *)&v129[12] + 7) = v133[12];
  *(void *)((char *)&v129[13] + 7) = v134;
  *(_OWORD *)((char *)&v129[6] + 7) = v133[6];
  *(_OWORD *)((char *)&v129[7] + 7) = v133[7];
  *(_OWORD *)((char *)&v129[8] + 7) = v133[8];
  *(_OWORD *)((char *)&v129[9] + 7) = v133[9];
  *(_OWORD *)((char *)&v129[2] + 7) = v133[2];
  *(_OWORD *)((char *)&v129[3] + 7) = v133[3];
  *(_OWORD *)((char *)&v129[4] + 7) = v133[4];
  *(_OWORD *)((char *)&v129[5] + 7) = v133[5];
  *(_OWORD *)((char *)v129 + 7) = v133[0];
  *(_OWORD *)((char *)&v129[1] + 7) = v133[1];
  *(_OWORD *)((char *)&v132[10] + 1) = v129[10];
  *(_OWORD *)((char *)&v132[11] + 1) = v129[11];
  *(_OWORD *)((char *)&v132[12] + 1) = v129[12];
  v132[13] = *(_OWORD *)((char *)&v129[12] + 15);
  *(_OWORD *)((char *)&v132[6] + 1) = v129[6];
  *(_OWORD *)((char *)&v132[7] + 1) = v129[7];
  *(_OWORD *)((char *)&v132[8] + 1) = v129[8];
  *(_OWORD *)((char *)&v132[9] + 1) = v129[9];
  *(_OWORD *)((char *)&v132[2] + 1) = v129[2];
  *(_OWORD *)((char *)&v132[3] + 1) = v129[3];
  *(_OWORD *)((char *)&v132[4] + 1) = v129[4];
  *(_OWORD *)((char *)&v132[5] + 1) = v129[5];
  *(_OWORD *)((char *)v132 + 1) = v129[0];
  char v130 = 0;
  *(void *)&long long v131 = v92;
  *((void *)&v131 + 1) = 0x4008000000000000;
  LOBYTE(v132[0]) = 0;
  *(_OWORD *)((char *)&v132[1] + 1) = v129[1];
  uint64_t v43 = v39;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  uint64_t v45 = (uint64_t)v96;
  uint64_t v46 = v42;
  v44(v96, v40, v42);
  uint64_t v47 = (uint64_t (*)(void))MEMORY[0x263F190D8];
  sub_2179C5E4C(v45, (uint64_t)v24 + *(int *)(v22 + 44), MEMORY[0x263F190D8]);
  long long v48 = v132[12];
  v24[12] = v132[11];
  v24[13] = v48;
  v24[14] = v132[13];
  long long v49 = v132[8];
  v24[8] = v132[7];
  v24[9] = v49;
  long long v50 = v132[10];
  v24[10] = v132[9];
  v24[11] = v50;
  long long v51 = v132[4];
  v24[4] = v132[3];
  v24[5] = v51;
  long long v52 = v132[6];
  v24[6] = v132[5];
  v24[7] = v52;
  long long v53 = v132[0];
  *uint64_t v24 = v131;
  v24[1] = v53;
  long long v54 = v132[2];
  v24[2] = v132[1];
  v24[3] = v54;
  sub_2179C5780((uint64_t)&v131);
  sub_2179C5EB4(v45, v47);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v46);
  sub_2179C58E8((uint64_t)v133);
  uint64_t v55 = v120;
  uint64_t v56 = v124;
  sub_2179C5E4C(v120, v124, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
  uint64_t v57 = *(unsigned __int8 *)(v119 + 80);
  uint64_t v58 = (v57 + 16) & ~v57;
  uint64_t v119 = v58;
  uint64_t v99 = v57 | 7;
  uint64_t v59 = swift_allocObject();
  sub_2179C5A44(v56, v59 + v58);
  uint64_t v60 = sub_2179E2420();
  char v62 = v61;
  uint64_t v63 = v101;
  sub_21798B2E8((uint64_t)v24, v101, &qword_267BA6688);
  uint64_t v64 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v63 + *(int *)(v103 + 44));
  *uint64_t v64 = sub_2179CC544;
  v64[1] = 0;
  v64[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v60;
  v64[3] = v62;
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = sub_2179C5AA8;
  *(void *)(v65 + 24) = v59;
  uint64_t v66 = v97;
  sub_21798B2E8(v63, v97, &qword_267BA6678);
  uint64_t v67 = (void *)(v66 + *(int *)(v98 + 44));
  *uint64_t v67 = sub_2179C6058;
  v67[1] = v65;
  sub_21798B28C(v63, &qword_267BA6678);
  sub_21798B28C((uint64_t)v24, &qword_267BA6688);
  uint64_t v68 = v124;
  sub_2179C5E4C(v55, v124, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
  uint64_t v69 = swift_allocObject();
  sub_2179C5A44(v68, v69 + v119);
  uint64_t v70 = v122;
  sub_21798B2E8(v66, v122, &qword_267BA6668);
  char v71 = (void *)(v70 + *(int *)(v123 + 36));
  *char v71 = sub_2179C5B24;
  v71[1] = v69;
  v71[2] = 0;
  v71[3] = 0;
  sub_21798B28C(v66, &qword_267BA6668);
  uint64_t v72 = v112;
  sub_2179C29DC(&qword_26ACF7D40, MEMORY[0x263F18460], 0x616850656E656353, 0xEA00000000006573, v112);
  sub_2179C5E4C(v55, v68, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
  uint64_t v73 = swift_allocObject();
  sub_2179C5A44(v68, v73 + v119);
  uint64_t v74 = sub_2179C4928(&qword_267BA6658, &qword_267BA6650, (void (*)(void))sub_2179C49A4);
  uint64_t v75 = sub_2179C5624(&qword_267BA66A0, MEMORY[0x263F18460]);
  uint64_t v76 = v100;
  uint64_t v77 = v72;
  uint64_t v78 = v122;
  uint64_t v79 = v123;
  uint64_t v80 = v113;
  sub_2179E2210();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v77, v80);
  sub_21798B28C(v78, &qword_267BA6650);
  uint64_t v125 = v79;
  uint64_t v126 = v80;
  uint64_t v127 = v74;
  uint64_t v128 = v75;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  long long v82 = v102;
  uint64_t v83 = v106;
  sub_2179E21A0();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v76, v83);
  sub_2179E2790();
  uint64_t v84 = v115;
  sub_2179E18D0();
  uint64_t v125 = v83;
  uint64_t v126 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v85 = v104;
  uint64_t v86 = v108;
  sub_2179E21C0();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v84, v117);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v82, v86);
  uint64_t v87 = sub_2179E2430();
  uint64_t v88 = v105;
  double v90 = sub_2179AEDBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v105, 0.0, 1, INFINITY, 0, v87, v89);
  (*(void (**)(char *, uint64_t, double))(v110 + 8))(v85, v111, v90);
  return sub_2179BD67C(v88, v118, &qword_267BA63C8);
}

uint64_t sub_2179C03A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = sub_2179E2300();
  uint64_t v11 = sub_2179E2080();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = sub_2179E2270();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  swift_retain();
  swift_retain();
  uint64_t v15 = sub_2179E2420();
  uint64_t v17 = v16;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_2179C5588;
  *(void *)(result + 24) = v14;
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  *(void *)(a3 + 16) = v10;
  *(void *)(a3 + 24) = KeyPath;
  *(void *)(a3 + 32) = v11;
  *(void *)(a3 + 40) = v13;
  *(void *)(a3 + 48) = sub_2179CC544;
  *(void *)(a3 + 56) = 0;
  *(void *)(a3 + 64) = v15;
  *(void *)(a3 + 72) = v17;
  *(void *)(a3 + 80) = sub_2179C561C;
  *(void *)(a3 + 88) = result;
  return result;
}

uint64_t sub_2179C04D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  double v5 = *((double *)v1 + 2);
  double v6 = *((double *)v1 + 3);
  uint64_t v7 = sub_2179E1E40();
  sub_2179C03A4(v3, v4, (uint64_t)&v31, v5, v6);
  uint64_t v8 = v31;
  LOBYTE(v4) = v32;
  uint64_t v9 = v34;
  uint64_t v10 = v37;
  long long v27 = v33;
  long long v28 = v35;
  long long v29 = v38;
  long long v30 = v36;
  LOBYTE(v3) = sub_2179E2020();
  sub_2179E1BB0();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v41 = 1;
  char v40 = v4;
  char v39 = 0;
  LOBYTE(v4) = sub_2179E2030();
  uint64_t result = sub_2179E1BB0();
  char v20 = v41;
  char v21 = v40;
  char v22 = v39;
  LOBYTE(v31) = 0;
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = v20;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v21;
  *(_OWORD *)(a1 + 40) = v27;
  *(void *)(a1 + 56) = v9;
  *(_OWORD *)(a1 + 64) = v28;
  *(_OWORD *)(a1 + 80) = v30;
  *(void *)(a1 + 96) = v10;
  *(_OWORD *)(a1 + 104) = v29;
  *(unsigned char *)(a1 + 120) = v3;
  *(void *)(a1 + 128) = v12;
  *(void *)(a1 + 136) = v14;
  *(void *)(a1 + 144) = v16;
  *(void *)(a1 + 152) = v18;
  *(unsigned char *)(a1 + 160) = v22;
  *(unsigned char *)(a1 + 168) = v4;
  *(void *)(a1 + 176) = v23;
  *(void *)(a1 + 184) = v24;
  *(void *)(a1 + 192) = v25;
  *(void *)(a1 + 200) = v26;
  *(unsigned char *)(a1 + 208) = v31;
  return result;
}

uint64_t sub_2179C0620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  double v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_2179E1BE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v28 - v14;
  type metadata accessor for TipSpotlightView();
  sub_2179C29DC(&qword_26ACF7D50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v15);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x263F18508], v9);
  char v16 = sub_2179E1BD0();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
  id v18 = *(id *)v1;
  char v19 = *(unsigned char *)(v1 + 8);
  sub_2179C3244(*(id *)v1, v19);
  id v20 = sub_2179C27BC(v18, v19);
  sub_2179C3438(v18, v19);
  if (v16)
  {
    id v21 = objc_msgSend(v20, sel_thumbnailURL);

    if (v21)
    {
      sub_2179E17D0();

      uint64_t v22 = sub_2179E1810();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 0, 1, v22);
    }
    else
    {
      uint64_t v25 = sub_2179E1810();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v8, 1, 1, v25);
    }
  }
  else
  {
    id v23 = objc_msgSend(v20, sel_darkThumbnailURL);

    if (v23)
    {
      sub_2179E17D0();

      uint64_t v24 = sub_2179E1810();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 0, 1, v24);
    }
    else
    {
      uint64_t v26 = sub_2179E1810();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
    }
    uint64_t v8 = v6;
  }
  return sub_2179BD67C((uint64_t)v8, a1, &qword_26ACF6BC8);
}

uint64_t sub_2179C09BC(uint64_t a1)
{
  uint64_t v27 = *(void *)(a1 + 16);
  if (v27)
  {
    uint64_t v1 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    uint64_t v26 = v1;
LABEL_4:
    uint64_t v3 = *(void *)(v1 + 8 * v2);
    uint64_t v28 = v2 + 1;
    uint64_t v29 = v3 + 64;
    uint64_t v4 = 1 << *(unsigned char *)(v3 + 32);
    if (v4 < 64) {
      uint64_t v5 = ~(-1 << v4);
    }
    else {
      uint64_t v5 = -1;
    }
    unint64_t v6 = v5 & *(void *)(v3 + 64);
    int64_t v30 = (unint64_t)(v4 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v8 = 0;
    while (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
LABEL_11:
      uint64_t v11 = *(void *)(v3 + 56);
      uint64_t v12 = (void *)(*(void *)(v3 + 48) + 16 * v10);
      uint64_t v13 = v12[1];
      *(void *)&long long v34 = *v12;
      *((void *)&v34 + 1) = v13;
      sub_2179A122C(v11 + 32 * v10, (uint64_t)v35);
      swift_bridgeObjectRetain();
LABEL_30:
      sub_2179BD67C((uint64_t)&v34, (uint64_t)&v36, &qword_267BA67A0);
      uint64_t v17 = v37;
      if (!v37)
      {
        swift_release();
        uint64_t v2 = v28;
        uint64_t v1 = v26;
        if (v28 != v27) {
          goto LABEL_4;
        }
        swift_bridgeObjectRelease();
        return 1;
      }
      uint64_t v18 = v36;
      sub_21799FA78(&v38, &v34);
      if (sub_2179E2930() == v18 && v19 == v17)
      {
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      char v20 = sub_2179E2D50();
      swift_bridgeObjectRelease();
      if (v20)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        sub_2179A122C((uint64_t)&v34, (uint64_t)v33);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA67A8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA67B0);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_8;
        }
        char v21 = ((uint64_t (*)())sub_2179C09BC)();
        swift_bridgeObjectRelease();
        uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
        if ((v21 & 1) == 0) {
          goto LABEL_48;
        }
      }
      else
      {
        if (sub_2179E2930() == v18 && v22 == v17)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v23 = sub_2179E2D50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v23 & 1) == 0) {
            goto LABEL_8;
          }
        }
        sub_2179A122C((uint64_t)&v34, (uint64_t)v33);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA67A8);
        if (swift_dynamicCast())
        {
          if (v31 == sub_2179E2930() && v32 == v24)
          {
            swift_bridgeObjectRelease_n();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
LABEL_48:
            swift_bridgeObjectRelease();
            swift_release();
            return 0;
          }
          char v25 = sub_2179E2D50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
          if (v25) {
            goto LABEL_48;
          }
        }
        else
        {
LABEL_8:
          uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
        }
      }
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      return result;
    }
    if (v14 >= v30)
    {
LABEL_29:
      unint64_t v6 = 0;
      memset(v35, 0, sizeof(v35));
      long long v34 = 0u;
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    if (!v15)
    {
      int64_t v16 = v8 + 2;
      ++v8;
      if (v14 + 1 >= v30) {
        goto LABEL_29;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v8 = v14 + 1;
        if (v14 + 2 >= v30) {
          goto LABEL_29;
        }
        unint64_t v15 = *(void *)(v29 + 8 * (v14 + 2));
        if (v15)
        {
          v14 += 2;
          goto LABEL_15;
        }
        int64_t v16 = v14 + 3;
        int64_t v8 = v14 + 2;
        if (v14 + 3 >= v30) {
          goto LABEL_29;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          while (1)
          {
            int64_t v14 = v16 + 1;
            if (__OFADD__(v16, 1)) {
              goto LABEL_53;
            }
            if (v14 >= v30)
            {
              int64_t v8 = v30 - 1;
              goto LABEL_29;
            }
            unint64_t v15 = *(void *)(v29 + 8 * v14);
            ++v16;
            if (v15) {
              goto LABEL_15;
            }
          }
        }
      }
      int64_t v14 = v16;
    }
LABEL_15:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v14 << 6);
    int64_t v8 = v14;
    goto LABEL_11;
  }
  return 1;
}

uint64_t sub_2179C0E2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v70 = a1;
  uint64_t v3 = (int *)type metadata accessor for TipSpotlightView();
  MEMORY[0x270FA5388](v3);
  uint64_t v69 = (uint64_t)v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF76F8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  uint64_t v12 = *((void *)v11 - 1);
  MEMORY[0x270FA5388](v11);
  int64_t v14 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v3[13];
  uint64_t v16 = *(void *)(v1 + v15);
  if (v16 && (sub_2179C09BC(*(void *)(v1 + v15)) & 1) != 0)
  {
    id v68 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835F0]);
    uint64_t v67 = sub_2179E2290();
    long long v75 = *(_OWORD *)(v1 + v3[8]);
    v65[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6788);
    sub_2179E2350();
    uint64_t v66 = v71;
    uint64_t v17 = &v14[v11[15]];
    sub_2179E2790();
    sub_2179E18D0();
    uint64_t v18 = sub_2179E18F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
    uint64_t v19 = v67;
    *(void *)int64_t v14 = v68;
    *((void *)v14 + 1) = v19;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((void *)v14 + 8) = 4;
    *((void *)v14 + 9) = 0x4024000000000000;
    v14[80] = 1;
    *((void *)v14 + 11) = v66;
    *((void *)v14 + 12) = 4;
    char v20 = &v14[v11[16]];
    *(void *)char v20 = 1;
    v20[8] = 0;
    v14[v11[17]] = 1;
    *(_WORD *)(v14 + 81) = 257;
    id v68 = (id)sub_2179B212C(v16);
    uint64_t v21 = sub_2179E2790();
    uint64_t v67 = v22;
    uint64_t v23 = sub_2179E1810();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
    sub_2179C5E4C((uint64_t)v14, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v7, 0, 1, v11);
    uint64_t v24 = (void *)(v1 + v3[9]);
    uint64_t v26 = v24[1];
    uint64_t v27 = v24[2];
    *(void *)&long long v75 = *v24;
    uint64_t v25 = v75;
    *((void *)&v75 + 1) = v26;
    *(void *)&long long v76 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
    sub_2179E2350();
    long long v28 = v71;
    *(void *)&long long v75 = v25;
    *((void *)&v75 + 1) = v26;
    *(void *)&long long v76 = v27;
    sub_2179E2350();
    ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)((uint64_t)v68, v21, v67, (uint64_t)v10, 0, (uint64_t)v7, v71, 0, (uint64_t *)&v75, *(double *)&v28, *((double *)&v28 + 1), 1u, 0, 0);
    long long v29 = v75;
    int64_t v30 = *(void **)v1;
    char v31 = *(unsigned char *)(v1 + 8);
    sub_2179C3244(*(id *)v2, *(unsigned char *)(v2 + 8));
    id v32 = sub_2179C27BC(v30, v31);
    sub_2179C3438(v30, v31);
    id v33 = objc_msgSend(v32, sel_uniqueIdentifier);

    if (v33)
    {
      uint64_t v34 = sub_2179E2930();
      uint64_t v36 = v35;

      uint64_t v37 = v2;
      uint64_t v38 = v69;
      sub_2179C5E4C(v37, v69, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
      uint64_t v39 = v70;
      if (v36)
      {
LABEL_14:
        sub_2179C5EB4(v38, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
        long long v71 = v29;
        uint64_t v72 = v34;
        uint64_t v73 = v36;
        char v74 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6790);
        sub_21798D884(&qword_267BA6798, &qword_267BA6790);
        sub_2179E1F60();
        uint64_t result = sub_2179C5EB4((uint64_t)v14, type metadata accessor for ConstellationContentAttributes);
        long long v60 = v75;
        long long v61 = v76;
        char v62 = v77;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v63 = v2;
      uint64_t v38 = v69;
      sub_2179C5E4C(v63, v69, (uint64_t (*)(void))type metadata accessor for TipSpotlightView);
      uint64_t v39 = v70;
    }
    long long v71 = *(_OWORD *)(v38 + v3[8]);
    sub_2179E2350();
    uint64_t v34 = sub_2179E2D40();
    uint64_t v36 = v64;
    goto LABEL_14;
  }
  char v40 = *(void **)v1;
  char v41 = *(unsigned char *)(v1 + 8);
  sub_2179C3244(*(id *)v2, *(unsigned char *)(v2 + 8));
  id v42 = sub_2179C27BC(v40, v41);
  sub_2179C3438(v40, v41);
  id v43 = objc_msgSend(v42, sel_contentDescription);

  if (v43)
  {
    uint64_t v44 = sub_2179E2930();
    unint64_t v46 = v45;
  }
  else
  {
    uint64_t v44 = 0;
    unint64_t v46 = 0xE000000000000000;
  }
  *(void *)&long long v75 = v44;
  *((void *)&v75 + 1) = v46;
  sub_21798E4B0();
  uint64_t v47 = sub_2179E2130();
  uint64_t v49 = v48;
  char v51 = v50;
  if (qword_267BA60F8 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_2179E2120();
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57 & 1;
  sub_2179AF6A4(v47, v49, v51 & 1);
  swift_bridgeObjectRelease();
  *(void *)&long long v71 = v52;
  *((void *)&v71 + 1) = v54;
  uint64_t v72 = v58;
  uint64_t v73 = v56;
  char v74 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6790);
  sub_21798D884(&qword_267BA6798, &qword_267BA6790);
  uint64_t result = sub_2179E1F60();
  long long v60 = v75;
  long long v61 = v76;
  char v62 = v77;
  uint64_t v39 = v70;
LABEL_15:
  *(_OWORD *)uint64_t v39 = v60;
  *(_OWORD *)(v39 + 16) = v61;
  *(unsigned char *)(v39 + 32) = v62;
  return result;
}

uint64_t sub_2179C15A0(SEL *a1, void *a2)
{
  uint64_t v5 = *(void **)v2;
  char v6 = *(unsigned char *)(v2 + 8);
  sub_2179C3244(v5, v6);
  id v7 = sub_2179C27BC(v5, v6);
  sub_2179C3438(v5, v6);
  id v8 = [v7 *a1];

  if (v8)
  {
    sub_2179E2930();
  }
  sub_21798E4B0();
  uint64_t v9 = sub_2179E2130();
  uint64_t v11 = v10;
  char v13 = v12;
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2179E2120();
  sub_2179AF6A4(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2179C16F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6758);
  MEMORY[0x270FA5388](v31);
  uint64_t v32 = (uint64_t)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2179E1D40();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_2179E2440();
  uint64_t v5 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  id v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6760);
  uint64_t v8 = MEMORY[0x270FA5388](v30);
  uint64_t v10 = (uint64_t *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v29 = (uint64_t)&v28 - v11;
  uint64_t v12 = sub_2179E1BE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v28 - v17;
  type metadata accessor for TipSpotlightView();
  sub_2179C29DC(&qword_26ACF7D50, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v18);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x263F18508], v12);
  char v19 = sub_2179E1BD0();
  char v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v16, v12);
  v20(v18, v12);
  uint64_t v21 = (void (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v22 = (void (**)(char *, uint64_t))(v5 + 8);
  if (v19)
  {
    sub_2179E2240();
    uint64_t v23 = sub_2179E2280();
    swift_release();
    uint64_t v24 = v28;
    (*v21)(v7, *MEMORY[0x263F1B950], v28);
  }
  else
  {
    sub_2179E2260();
    uint64_t v23 = sub_2179E2280();
    swift_release();
    uint64_t v24 = v28;
    (*v21)(v7, *MEMORY[0x263F1B968], v28);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v4, v7, v24);
  uint64_t v25 = (uint64_t (*)(void))MEMORY[0x263F190D8];
  sub_2179C5E4C((uint64_t)v4, (uint64_t)v10 + *(int *)(v30 + 36), MEMORY[0x263F190D8]);
  *uint64_t v10 = v23;
  swift_retain();
  sub_2179C5EB4((uint64_t)v4, v25);
  (*v22)(v7, v24);
  swift_release();
  uint64_t v26 = v29;
  sub_2179BD67C((uint64_t)v10, v29, &qword_267BA6760);
  sub_21798B2E8(v26, v32, &qword_267BA6760);
  swift_storeEnumTagMultiPayload();
  sub_2179C570C();
  sub_2179E1F60();
  return sub_21798B28C(v26, &qword_267BA6760);
}

uint64_t sub_2179C1C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2179C15A0((SEL *)&selRef_displayName, &qword_267BA60F0);
  uint64_t v58 = v5;
  char v49 = v6;
  uint64_t v8 = v7;
  char v53 = sub_2179E2030();
  uint64_t v9 = (int *)type metadata accessor for TipSpotlightView();
  uint64_t v10 = (long long *)(a1 + v9[10]);
  uint64_t v11 = *((void *)v10 + 2);
  long long v60 = *v10;
  uint64_t v61 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
  sub_2179E2350();
  sub_2179E1BB0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  long long v60 = *(_OWORD *)(a1 + v9[7]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6788);
  sub_2179E2350();
  uint64_t v48 = v64;
  uint64_t KeyPath = swift_getKeyPath();
  int v47 = sub_2179E1FA0();
  sub_2179C0E2C((uint64_t)&v60);
  uint64_t v51 = *((void *)&v60 + 1);
  uint64_t v52 = v60;
  uint64_t v50 = v61;
  uint64_t v45 = v62;
  char v20 = v63;
  long long v64 = *(_OWORD *)(a1 + v9[8]);
  sub_2179E2350();
  uint64_t v56 = swift_getKeyPath();
  int v46 = sub_2179E1FC0();
  char v21 = sub_2179BE6A0();
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v54 = v4;
  uint64_t v55 = v8;
  if (v21 == 2)
  {
    uint64_t v26 = sub_2179C15A0((SEL *)&selRef_kind, &qword_267BA6100);
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    LODWORD(v60) = sub_2179E1FB0();
    uint64_t v31 = sub_2179E2110();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36 & 1;
    uint64_t v38 = v28;
    uint64_t v8 = v55;
    sub_2179AF6A4(v26, v38, v30);
    swift_bridgeObjectRelease();
    uint64_t v24 = v37;
    uint64_t v25 = v35;
    uint64_t v23 = v33;
    uint64_t v22 = v31;
  }
  LOBYTE(v60) = v49 & 1;
  LOBYTE(v64) = 0;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v58;
  *(unsigned char *)(a2 + 16) = v49 & 1;
  *(void *)(a2 + 24) = v8;
  *(unsigned char *)(a2 + 32) = v53;
  *(void *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v19;
  *(unsigned char *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = KeyPath;
  *(void *)(a2 + 88) = v48;
  *(unsigned char *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 100) = v47;
  *(_WORD *)(a2 + 104) = 256;
  *(void *)(a2 + 112) = v52;
  *(void *)(a2 + 120) = v51;
  *(void *)(a2 + 128) = v50;
  *(void *)(a2 + 136) = v45;
  *(unsigned char *)(a2 + 144) = v20;
  *(void *)(a2 + 152) = v56;
  *(void *)(a2 + 160) = v59;
  *(unsigned char *)(a2 + 168) = 0;
  *(_DWORD *)(a2 + 172) = v46;
  *(_WORD *)(a2 + 176) = 256;
  *(void *)(a2 + 184) = v22;
  *(void *)(a2 + 192) = v23;
  *(void *)(a2 + 200) = v24;
  *(void *)(a2 + 208) = v25;
  uint64_t v39 = v4;
  uint64_t v40 = v23;
  char v41 = v24;
  uint64_t v42 = v22;
  uint64_t v43 = v25;
  sub_2179C5848(v39, v58, v49 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2179C5858(v52, v51, v50, v45, v20);
  swift_retain();
  sub_2179C58A4(v42, v40, v41, v43);
  sub_2179C59FC(v42, v40, v41, v43);
  sub_2179C59B0(v52, v51, v50, v45, v20);
  swift_release();
  sub_2179AF6A4(v54, v58, v49 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C204C(double a1, double a2)
{
  return sub_2179C20FC(a1, a2);
}

uint64_t sub_2179C20FC(double a1, double a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6780);
  uint64_t result = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 != 0.0 || a2 != 0.0)
  {
    uint64_t v9 = type metadata accessor for TipSpotlightView();
    uint64_t v31 = v2 + *(int *)(v9 + 44);
    if (qword_267BA6108 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2179E20D0();
    uint64_t v11 = *(void *)(v10 - 8);
    char v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    uint64_t v30 = v11 + 56;
    v29(v8, 1, 1, v10);
    sub_2179E20E0();
    double v13 = v12;
    sub_21798B28C((uint64_t)v8, &qword_267BA6780);
    uint64_t v14 = sub_2179C15A0((SEL *)&selRef_displayName, &qword_267BA60F0);
    uint64_t v16 = v15;
    uint64_t v27 = v2;
    uint64_t v28 = v9;
    uint64_t v17 = (long long *)(v2 + *(int *)(v9 + 40));
    uint64_t v18 = *((void *)v17 + 2);
    char v20 = v19 & 1;
    long long v32 = *v17;
    uint64_t v33 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
    sub_2179E2350();
    v29(v8, 1, 1, v10);
    sub_2179E20E0();
    double v22 = v21;
    sub_2179AF6A4(v14, v16, v20);
    swift_bridgeObjectRelease();
    uint64_t result = sub_21798B28C((uint64_t)v8, &qword_267BA6780);
    double v23 = round(v22 / v13);
    if ((~*(void *)&v23 & 0x7FF0000000000000) != 0)
    {
      if (v23 > -9.22337204e18)
      {
        if (v23 < 9.22337204e18)
        {
          uint64_t v24 = (uint64_t)v23;
          if ((uint64_t)v23 >= 4)
          {
            uint64_t v26 = v27;
            uint64_t v25 = v28;
            long long v32 = *(_OWORD *)(v27 + *(int *)(v28 + 32));
            uint64_t v34 = 1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6788);
            sub_2179E2360();
            uint64_t v24 = 4;
            goto LABEL_12;
          }
          uint64_t v26 = v27;
          uint64_t v25 = v28;
          if (!__OFSUB__(4, v24))
          {
            long long v32 = *(_OWORD *)(v27 + *(int *)(v28 + 32));
            uint64_t v34 = 4 - v24;
            __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6788);
            sub_2179E2360();
LABEL_12:
            long long v32 = *(_OWORD *)(v26 + *(int *)(v25 + 28));
            uint64_t v34 = v24;
            __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6788);
            return sub_2179E2360();
          }
LABEL_17:
          __break(1u);
          return result;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_2179C2478()
{
  type metadata accessor for TipSpotlightView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65B8);
  sub_2179E2350();
  return sub_2179C20FC(v1, v2);
}

uint64_t sub_2179C24E4()
{
  uint64_t v0 = sub_2179E2090();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179E2060();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F1A680], v0);
  sub_2179E20A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v4 = sub_2179E2070();
  uint64_t result = swift_release();
  qword_267BA6578 = v4;
  return result;
}

uint64_t sub_2179C2608()
{
  uint64_t result = sub_2179E2050();
  qword_267BA6580 = result;
  return result;
}

uint64_t sub_2179C2628()
{
  uint64_t v0 = sub_2179E2090();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179E20B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F1A680], v0);
  uint64_t v4 = sub_2179E20A0();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_267BA6588 = v4;
  return result;
}

uint64_t sub_2179C2738()
{
  if (qword_267BA60F0 != -1) {
    swift_once();
  }
  uint64_t result = sub_2179E2120();
  qword_267BA6590 = result;
  *(void *)algn_267BA6598 = v1;
  byte_267BA65A0 = v2 & 1;
  qword_267BA65A8 = v3;
  return result;
}

id sub_2179C27BC(void *a1, char a2)
{
  id v16 = a1;
  uint64_t v3 = sub_2179E1E10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = v16;
    return v15;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = sub_2179E2AC0();
    uint64_t v8 = sub_2179E2000();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_217986C94(0, &qword_267BA6778);
      uint64_t v12 = sub_2179E2E40();
      *(void *)(v10 + 4) = sub_2179C5094(v12, v13, &v17);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217984000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4527D0](v11, -1, -1);
      MEMORY[0x21D4527D0](v10, -1, -1);
    }

    sub_2179E1E00();
    swift_getAtKeyPath();
    sub_2179C3438(v16, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v17;
  }
}

uint64_t sub_2179C29DC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_2179E1E10();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21798B2E8(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_2179E2AC0();
    double v21 = sub_2179E2000();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_2179C5094(a3, v24, &v25);
      _os_log_impl(&dword_217984000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4527D0](v23, -1, -1);
      MEMORY[0x21D4527D0](v22, -1, -1);
    }

    sub_2179E1E00();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_2179C2C64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2179E1D60();
  *a1 = result;
  return result;
}

uint64_t sub_2179C2C90(id *a1)
{
  id v1 = *a1;
  return sub_2179E1D70();
}

uint64_t sub_2179C2CBC()
{
  return sub_2179E1DB0();
}

uint64_t sub_2179C2CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179C2D44(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_2179C2D20()
{
  return sub_2179E1DA0();
}

uint64_t sub_2179C2D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_2179C2E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179C2D44(a1, a2, a3, a4, MEMORY[0x263F18460], MEMORY[0x263F19208]);
}

uint64_t sub_2179C2E54()
{
  return sub_2179C5624(&qword_26ACF7D38, (void (*)(uint64_t))type metadata accessor for TipSpotlightView);
}

uint64_t sub_2179C2E9C()
{
  return sub_2179C5624(&qword_26ACF7D30, (void (*)(uint64_t))type metadata accessor for TipSpotlightView);
}

uint64_t sub_2179C2EE4()
{
  return sub_2179C5624(&qword_26ACF7D20, (void (*)(uint64_t))type metadata accessor for TipSpotlightView);
}

uint64_t sub_2179C2F2C()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for TipSpotlightView(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = &v13[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    os_log_type_t v7 = *a2;
    char v8 = *((unsigned char *)a2 + 8);
    sub_2179C3244(*a2, v8);
    *(void *)a1 = v7;
    a1[8] = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char **)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2179E1BE0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *(void *)uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (char **)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2179E1BC0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *(void *)uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    os_log_type_t v20 = &a1[v18];
    double v21 = (char **)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *(void *)os_log_type_t v20 = *v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = &a1[v19];
    unint64_t v24 = (char **)((char *)a2 + v19);
    uint64_t v25 = v24[1];
    *(void *)uint64_t v23 = *v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = a3[9];
    uint64_t v27 = a3[10];
    uint64_t v28 = &a1[v26];
    uint64_t v29 = (uint64_t)a2 + v26;
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
    *((void *)v28 + 2) = *(void *)(v29 + 16);
    uint64_t v30 = &a1[v27];
    uint64_t v31 = (uint64_t)a2 + v27;
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    *((void *)v30 + 2) = *(void *)(v31 + 16);
    uint64_t v32 = a3[11];
    uint64_t v40 = (uint64_t)a2 + v32;
    char v41 = &a1[v32];
    uint64_t v33 = sub_2179E2100();
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v34(v41, v40, v33);
    uint64_t v35 = a3[12];
    char v36 = &a1[v35];
    uint64_t v37 = (uint64_t)a2 + v35;
    uint64_t v38 = sub_2179E27A0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    *(void *)&a1[a3[13]] = *(char **)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

id sub_2179C3244(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t destroy for TipSpotlightView(uint64_t a1, int *a2)
{
  sub_2179C3438(*(id *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2179E1BE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2179E1BC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = a1 + a2[11];
  uint64_t v9 = sub_2179E2100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[12];
  uint64_t v11 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  return swift_bridgeObjectRelease();
}

void sub_2179C3438(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t initializeWithCopy for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_2179C3244(*(id *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_2179E1BE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2179E1BC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  double v21 = (void *)(a1 + v17);
  uint64_t v22 = (void *)(a2 + v17);
  uint64_t v23 = v22[1];
  *double v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[9];
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v24;
  uint64_t v27 = a2 + v24;
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(void *)(v26 + 16) = *(void *)(v27 + 16);
  uint64_t v28 = a1 + v25;
  uint64_t v29 = a2 + v25;
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  *(void *)(v28 + 16) = *(void *)(v29 + 16);
  uint64_t v30 = a3[11];
  uint64_t v38 = a2 + v30;
  uint64_t v39 = a1 + v30;
  uint64_t v31 = sub_2179E2100();
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v32(v39, v38, v31);
  uint64_t v33 = a3[12];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_2179C3244(*(id *)a2, v7);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_2179C3438(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_21798B28C(a1 + v10, &qword_26ACF7D50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_2179E1BE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (void *)(a2 + v14);
    sub_21798B28C(a1 + v14, &qword_26ACF7D40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2179E1BC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_retain();
  swift_release();
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_retain();
  swift_release();
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  void *v25 = *v26;
  v25[1] = v26[1];
  v25[2] = v26[2];
  swift_retain();
  swift_release();
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  v28[2] = v29[2];
  swift_retain();
  swift_release();
  uint64_t v30 = a3[11];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = sub_2179E2100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
  uint64_t v34 = a3[12];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2179E1BE0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2179E1BC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (long long *)(a2 + v17);
  long long v21 = *v20;
  *(void *)(v19 + 16) = *((void *)v20 + 2);
  *(_OWORD *)uint64_t v19 = v21;
  uint64_t v22 = a1 + v18;
  uint64_t v23 = a2 + v18;
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_2179E2100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  uint64_t v28 = a3[12];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for TipSpotlightView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_2179C3438(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_21798B28C(a1 + v10, &qword_26ACF7D50);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_2179E1BE0();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    sub_21798B28C(a1 + v15, &qword_26ACF7D40);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_2179E1BC0();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[7];
  long long v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *long long v21 = v24;
  v21[1] = v23;
  swift_release();
  uint64_t v25 = a3[8];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_release();
  uint64_t v30 = a3[9];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = (uint64_t)a2 + v30;
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *(void *)(v31 + 16) = *(void *)(v32 + 16);
  swift_release();
  uint64_t v33 = a3[10];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = (uint64_t)a2 + v33;
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  *(void *)(v34 + 16) = *(void *)(v35 + 16);
  swift_release();
  uint64_t v36 = a3[11];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (uint64_t)a2 + v36;
  uint64_t v39 = sub_2179E2100();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 40))(v37, v38, v39);
  uint64_t v40 = a3[12];
  uint64_t v41 = a1 + v40;
  uint64_t v42 = (uint64_t)a2 + v40;
  uint64_t v43 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 40))(v41, v42, v43);
  *(void *)(a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2179C3F70);
}

uint64_t sub_2179C3F70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65C8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_13:
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v15(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65D0);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_13;
  }
  if (a2 == 2147483646)
  {
    unint64_t v11 = *(void *)(a1 + a3[7] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v14 = sub_2179E2100();
    if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
    {
      uint64_t v7 = v14;
      uint64_t v8 = *(void *)(v14 - 8);
      uint64_t v9 = a3[11];
      goto LABEL_13;
    }
    uint64_t v16 = sub_2179E27A0();
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[12];
    return v17(v19, a2, v18);
  }
}

uint64_t storeEnumTagSinglePayload for TipSpotlightView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2179C4164);
}

uint64_t sub_2179C4164(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65C8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(a1 + v11, a2, a2, v9);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA65D0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[6];
    goto LABEL_9;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[7] + 8) = a2;
    return result;
  }
  uint64_t v13 = sub_2179E2100();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[11];
    goto LABEL_9;
  }
  uint64_t v15 = sub_2179E27A0();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[12];

  return v16(v18, a2, a2, v17);
}

void sub_2179C4338()
{
  sub_2179C44DC(319, &qword_26ACF7D58, MEMORY[0x263F18520]);
  if (v0 <= 0x3F)
  {
    sub_2179C44DC(319, &qword_26ACF7D48, MEMORY[0x263F18460]);
    if (v1 <= 0x3F)
    {
      sub_2179E2100();
      if (v2 <= 0x3F)
      {
        sub_2179E27A0();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_2179C44DC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2179E1C00();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2179C4534()
{
  unint64_t result = qword_267BA65D8;
  if (!qword_267BA65D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA65C0);
    sub_2179C45D4();
    sub_21798D884(&qword_267BA66A8, &qword_267BA66B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA65D8);
  }
  return result;
}

unint64_t sub_2179C45D4()
{
  unint64_t result = qword_267BA65E0;
  if (!qword_267BA65E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA65B0);
    sub_2179C4648();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA65E0);
  }
  return result;
}

unint64_t sub_2179C4648()
{
  unint64_t result = qword_267BA65E8;
  if (!qword_267BA65E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA65F0);
    sub_2179C46F0();
    sub_2179C4928(&qword_267BA6628, &qword_267BA6630, (void (*)(void))sub_2179C478C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA65E8);
  }
  return result;
}

unint64_t sub_2179C46F0()
{
  unint64_t result = qword_267BA65F8;
  if (!qword_267BA65F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6600);
    sub_2179C5FB4(&qword_267BA6608, &qword_267BA6610, &qword_267BA6618, &qword_267BA6620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA65F8);
  }
  return result;
}

unint64_t sub_2179C478C()
{
  unint64_t result = qword_267BA6638;
  if (!qword_267BA6638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA63C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6640);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6648);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6650);
    sub_2179E1BC0();
    sub_2179C4928(&qword_267BA6658, &qword_267BA6650, (void (*)(void))sub_2179C49A4);
    sub_2179C5624(&qword_267BA66A0, MEMORY[0x263F18460]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6638);
  }
  return result;
}

uint64_t sub_2179C4928(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2179C49A4()
{
  unint64_t result = qword_267BA6660;
  if (!qword_267BA6660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6668);
    sub_2179C4A44();
    sub_21798D884(&qword_26ACF7760, &qword_26ACF7768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6660);
  }
  return result;
}

unint64_t sub_2179C4A44()
{
  unint64_t result = qword_267BA6670;
  if (!qword_267BA6670)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6678);
    sub_2179C4AE4();
    sub_21798D884(&qword_26ACF7750, &qword_26ACF7758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6670);
  }
  return result;
}

unint64_t sub_2179C4AE4()
{
  unint64_t result = qword_267BA6680;
  if (!qword_267BA6680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6688);
    sub_21798D884(&qword_267BA6690, &qword_267BA6698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6680);
  }
  return result;
}

uint64_t destroy for TipSpotlightView.AttributionView()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for TipSpotlightView.AttributionView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TipSpotlightView.AttributionView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
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

_OWORD *assignWithTake for TipSpotlightView.AttributionView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightView.AttributionView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TipSpotlightView.AttributionView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipSpotlightView.AttributionView()
{
  return &type metadata for TipSpotlightView.AttributionView;
}

uint64_t sub_2179C4D5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2179C4D78()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6738);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6770);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_2179E22F0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2179E1CF0())
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B4B8], v7);
    uint64_t v11 = sub_2179E2320();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t *v6 = v11;
    swift_storeEnumTagMultiPayload();
    sub_21798D884(&qword_267BA6730, &qword_267BA6738);
    swift_retain_n();
    sub_2179E1F60();
    swift_release_n();
    return swift_release();
  }
  else
  {
    sub_2179E1C30();
    (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 16))(v6, v3, v0);
    swift_storeEnumTagMultiPayload();
    sub_21798D884(&qword_267BA6730, &qword_267BA6738);
    sub_2179E1F60();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

unint64_t sub_2179C5094(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_2179C5168(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2179A122C((uint64_t)v12, *a3);
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
      sub_2179A122C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2179C5168(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_2179C5268(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_2179E2CB0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2179C5268(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2179C5300(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2179C5404(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2179C5404((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2179C5300(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_2179C539C(v2, 0);
      uint64_t result = sub_2179E2C60();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_2179E2990();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2179C539C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6750);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2179C5404(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6750);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2179C54F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2179E1DC0();
  *a1 = result;
  return result;
}

uint64_t sub_2179C551C()
{
  return sub_2179E1DD0();
}

uint64_t sub_2179C5548()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2179C5588()
{
  return sub_2179E23C0();
}

uint64_t sub_2179C55E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179C561C(double *a1)
{
  return sub_2179CC584(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

uint64_t sub_2179C5624(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2179C566C()
{
  unint64_t result = qword_267BA6728;
  if (!qword_267BA6728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6720);
    sub_21798D884(&qword_267BA6730, &qword_267BA6738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6728);
  }
  return result;
}

unint64_t sub_2179C570C()
{
  unint64_t result = qword_267BA6768;
  if (!qword_267BA6768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6768);
  }
  return result;
}

uint64_t sub_2179C5780(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v3 = *(void *)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v5 = *(void *)(a1 + 160);
  char v6 = *(unsigned char *)(a1 + 168);
  uint64_t v7 = *(void *)(a1 + 208);
  uint64_t v10 = *(void *)(a1 + 224);
  uint64_t v11 = *(void *)(a1 + 216);
  uint64_t v9 = *(void *)(a1 + 232);
  sub_2179C5848(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2179C5858(v2, v3, v4, v5, v6);
  swift_retain();
  sub_2179C58A4(v7, v11, v10, v9);
  return a1;
}

uint64_t sub_2179C5848(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2179C5858(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5) {
    sub_2179C5848(a1, a2, a3 & 1);
  }
  else {
    swift_retain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_2179C58A4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2179C5848(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2179C58E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  uint64_t v3 = *(void *)(a1 + 120);
  uint64_t v4 = *(void *)(a1 + 128);
  uint64_t v5 = *(void *)(a1 + 136);
  char v6 = *(unsigned char *)(a1 + 144);
  uint64_t v7 = *(void *)(a1 + 184);
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 192);
  uint64_t v9 = *(void *)(a1 + 208);
  sub_2179AF6A4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  sub_2179C59B0(v2, v3, v4, v5, v6);
  swift_release();
  sub_2179C59FC(v7, v11, v10, v9);
  return a1;
}

uint64_t sub_2179C59B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5) {
    sub_2179AF6A4(a1, a2, a3 & 1);
  }
  else {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C59FC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2179AF6A4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2179C5A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipSpotlightView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2179C5AA8(double a1, double a2)
{
  type metadata accessor for TipSpotlightView();

  return sub_2179C204C(a1, a2);
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v1 = (int *)type metadata accessor for TipSpotlightView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_2179C3438(*(id *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2179E1BE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_2179E1BC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v2 | 7;
  uint64_t v11 = v3 + v4;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v12 = v5 + v1[11];
  uint64_t v13 = sub_2179E2100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v5 + v1[12];
  uint64_t v15 = sub_2179E27A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_2179C5D94()
{
  return sub_2179C2478();
}

uint64_t sub_2179C5DE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2179E1DE0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2179C5E1C()
{
  return sub_2179E1DF0();
}

uint64_t sub_2179C5E4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2179C5EB4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2179C5F18()
{
  unint64_t result = qword_267BA67B8;
  if (!qword_267BA67B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA67C0);
    sub_2179C5FB4(&qword_267BA67C8, &qword_267BA67D0, &qword_267BA67D8, &qword_267BA67E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA67B8);
  }
  return result;
}

uint64_t sub_2179C5FB4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_21798D884(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2179C605C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2179E23D0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_2179C60B0()
{
  sub_21799AEDC();
  sub_2179E1E20();
  return v1;
}

uint64_t View.replayButtonVisibility(_:)()
{
  return swift_release();
}

uint64_t sub_2179C6180()
{
  return swift_getWitnessTable();
}

unint64_t sub_2179C61F0()
{
  unint64_t result = qword_267BA67F0;
  if (!qword_267BA67F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA67E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA67F0);
  }
  return result;
}

ValueMetadata *_s28__Key_replayButtonVisibilityVMa()
{
  return &_s28__Key_replayButtonVisibilityVN;
}

uint64_t static CollectionsViewModel.userGuideIdentifier.getter()
{
  return 0x6469754772657355;
}

uint64_t static CollectionsViewModel.searchIdentifier.getter()
{
  return 0x686372616553;
}

uint64_t (*sub_2179C628C())()
{
  return j__swift_endAccess;
}

id sub_2179C62E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 16);
  *a2 = v4;

  return v4;
}

void sub_2179C63AC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

id sub_2179C6488()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);

  return v1;
}

uint64_t type metadata accessor for CollectionsViewModel()
{
  uint64_t result = qword_267BA6810;
  if (!qword_267BA6810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2179C65A0(void *a1)
{
}

void sub_2179C6670(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  id v5 = a2;
}

void sub_2179C66D0()
{
  sub_2179C6670(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void (*sub_2179C66EC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C628C();
  return sub_2179C6808;
}

void sub_2179C6808(void *a1)
{
}

uint64_t sub_2179C6814()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  id v2 = v1;
  sub_2179E1930();
  swift_release();
  uint64_t v3 = &v2[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections];
  swift_beginAccess();
  uint64_t v4 = *(void *)v3;
  swift_bridgeObjectRetain();

  return v4;
}

uint64_t (*sub_2179C6974())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179C69C8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179C6A88()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C6B6C()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179C6C30()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C6D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2179C6D78(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C6974();
  return sub_2179C6E94;
}

void sub_2179C6E94(void *a1)
{
}

uint64_t (*sub_2179C6EA0())()
{
  return j_j__swift_endAccess;
}

id sub_2179C6EF4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 40);
  *a2 = v4;

  return v4;
}

void sub_2179C6FC0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

void *sub_2179C709C()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  return v1;
}

void sub_2179C7158(void *a1)
{
}

void sub_2179C7228(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = a2;
  id v5 = a2;
}

void (*sub_2179C7288(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C6EA0();
  return sub_2179C73A4;
}

void sub_2179C73A4(void *a1)
{
}

uint64_t (*sub_2179C73B0())()
{
  return j_j__swift_endAccess;
}

id sub_2179C7404@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 48);
  *a2 = v4;

  return v4;
}

void sub_2179C74D0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

void *sub_2179C75AC()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

void sub_2179C7668(void *a1)
{
}

void sub_2179C7738(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = a2;
  id v5 = a2;
}

void (*sub_2179C7798(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C73B0();
  return sub_2179C78B4;
}

void sub_2179C78B4(void *a1)
{
}

uint64_t sub_2179C78C0()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_2179C7960@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 56);
  return result;
}

uint64_t sub_2179C7A08()
{
  return swift_release();
}

uint64_t sub_2179C7AD8()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  id v1 = *(id *)(v0 + 16);
  sub_2179D1A90();
  uint64_t v3 = v2;

  return v3;
}

uint64_t sub_2179C7BA4()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  uint64_t v3 = v2;
  sub_2179E1930();
  swift_release();
  uint64_t v4 = &v3[OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading];
  swift_beginAccess();
  LOBYTE(v4) = *v4;

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    swift_getKeyPath();
    sub_2179E1930();
    swift_release();
    uint64_t v6 = *(void **)(v1 + 16);
    swift_getKeyPath();
    uint64_t v7 = v6;
    sub_2179E1930();
    swift_release();
    uint64_t v8 = &v7[OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded];
    swift_beginAccess();
    LOBYTE(v8) = *v8;

    char v5 = v8 ^ 1;
  }
  return v5 & 1;
}

BOOL sub_2179C7DBC()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  uint64_t v2 = v1;
  sub_2179E1930();
  swift_release();
  uint64_t v3 = &v2[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections];
  swift_beginAccess();
  unint64_t v4 = *(void *)v3;
  swift_bridgeObjectRetain();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 == 0;
}

uint64_t (*sub_2179C7F64())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179C7FB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 72);
  *a2 = *(void *)(v3 + 64);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179C8078()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C815C()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179C8220()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C82FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2179C8368(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C7F64();
  return sub_2179C8484;
}

void sub_2179C8484(void *a1)
{
}

uint64_t (*sub_2179C8490())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179C84E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 88);
  *a2 = *(void *)(v3 + 80);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179C85A4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C8688()
{
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179C874C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179C8828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 80) = a2;
  *(void *)(a1 + 88) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2179C8894(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179C8490();
  return sub_2179C89B0;
}

void sub_2179C89B0(void *a1)
{
}

void sub_2179C89BC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_2179E1940();
  swift_release();

  free(v1);
}

uint64_t CollectionsViewModel.__allocating_init(contentModel:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(unsigned char *)(v2 + 56) = 0;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  sub_2179E1960();
  *(void *)(v2 + 16) = a1;
  return v2;
}

uint64_t CollectionsViewModel.init(contentModel:)(uint64_t a1)
{
  *(unsigned char *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  sub_2179E1960();
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_2179C8AF4(uint64_t a1)
{
  uint64_t v110 = a1;
  uint64_t v1 = sub_2179E17F0();
  uint64_t v108 = *(uint64_t (***)(void, uint64_t))(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v93 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2179E2570();
  uint64_t v111 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v93 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v93 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v106 = (char *)&v93 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2179E1810();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  long long v21 = (char *)&v93 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179A791C(v110, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1) {
    return sub_21799F528((uint64_t)v17);
  }
  uint64_t v100 = v1;
  uint64_t v101 = v3;
  uint64_t v96 = (uint64_t)v13;
  uint64_t v95 = v7;
  uint64_t v99 = v10;
  uint64_t v103 = v19;
  uint64_t v104 = v4;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  uint64_t v23 = v106;
  sub_2179E2560();
  uint64_t v117 = 0;
  unint64_t v118 = 0xE000000000000000;
  sub_2179E2C50();
  uint64_t v114 = v117;
  unint64_t v115 = v118;
  sub_2179E2980();
  sub_2179CB618(&qword_267BA6808, MEMORY[0x263F06EA8]);
  uint64_t v105 = v21;
  sub_2179E2D40();
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2980();
  swift_getKeyPath();
  uint64_t v24 = v107;
  uint64_t v25 = v107 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  uint64_t v117 = v107;
  uint64_t v26 = sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  uint64_t v109 = v25;
  uint64_t v110 = v26;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v27 = *(void **)(v24 + 40);
  uint64_t v102 = v18;
  if (v27)
  {
    id v28 = objc_msgSend(v27, sel_identifier);
    sub_2179E2930();
  }
  uint64_t v29 = v104;
  uint64_t v30 = v111;
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2980();
  swift_getKeyPath();
  uint64_t v116 = v24;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v31 = *(void **)(v24 + 48);
  if (v31)
  {
    id v32 = objc_msgSend(v31, sel_identifier);
    sub_2179E2930();
  }
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2830();
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  uint64_t v33 = v30 + 8;
  uint64_t v34 = v35;
  v35((uint64_t)v23, v29);
  uint64_t v36 = sub_2179E2930();
  uint64_t v38 = v37;
  uint64_t v39 = v101;
  uint64_t v40 = v105;
  sub_2179E1800();
  uint64_t v41 = v108;
  uint64_t v42 = v100;
  int v43 = ((uint64_t (**)(char *, uint64_t))v108)[11](v39, v100);
  if (v43 == *MEMORY[0x263F7F4E8])
  {
    uint64_t v106 = (char *)v36;
    uint64_t v97 = v38;
    uint64_t v98 = v34;
    uint64_t v111 = v33;
    ((uint64_t (**)(char *, uint64_t))v41)[12](v39, v42);
    uint64_t v44 = *(void **)v39;
    uint64_t v45 = (void *)*((void *)v39 + 1);
    int v46 = (void *)*((void *)v39 + 2);
    int v47 = (void *)*((void *)v39 + 3);
    uint64_t v48 = *((void *)v39 + 5);
    uint64_t v94 = (char *)*((void *)v39 + 4);
    uint64_t v95 = (char *)v48;
    sub_2179CB7A0((uint64_t)v94, v48);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    *(&v93 - 4) = (id)v24;
    *(&v93 - 3) = v44;
    uint64_t v100 = (uint64_t)v44;
    *(&v93 - 2) = v45;
    uint64_t v114 = v24;
    swift_bridgeObjectRetain();
    uint64_t v50 = 0;
    sub_2179E1920();
    swift_release();
    uint64_t v108 = (uint64_t (**)(void, uint64_t))v45;
    swift_bridgeObjectRelease();
    uint64_t v51 = swift_getKeyPath();
    MEMORY[0x270FA5388](v51);
    *(&v93 - 4) = (id)v24;
    *(&v93 - 3) = v46;
    *(&v93 - 2) = v47;
    uint64_t v114 = v24;
    swift_bridgeObjectRetain();
    sub_2179E1920();
    swift_release();
    swift_bridgeObjectRelease();
    id v93 = v46;
    if (v47)
    {
      uint64_t v52 = self;
      swift_bridgeObjectRetain();
      id v53 = objc_msgSend(v52, sel_sharedInstance);
      uint64_t v54 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v55 = objc_msgSend(v53, sel_tipForCorrelationIdentifier_, v54);

      if (v55)
      {
        uint64_t v56 = v96;
        sub_2179E2560();
        uint64_t v114 = 0;
        unint64_t v115 = 0xE000000000000000;
        sub_2179E2C50();
        uint64_t v101 = 0;
        sub_2179E2980();
        id v57 = objc_msgSend(v55, sel_identifier);
        sub_2179E2930();

        sub_2179E2980();
        swift_bridgeObjectRelease();
        sub_2179E2980();
        sub_2179E2830();
        swift_bridgeObjectRelease();
        v98(v56, v104);
        id v58 = objc_msgSend(v55, sel_identifier);
        uint64_t v59 = (void *)sub_2179E2930();
        uint64_t v61 = v60;

        uint64_t v62 = swift_getKeyPath();
        MEMORY[0x270FA5388](v62);
        *(&v93 - 4) = (id)v24;
        *(&v93 - 3) = v59;
        *(&v93 - 2) = v61;
        uint64_t v114 = v24;
        uint64_t v50 = v101;
        sub_2179E1920();

        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v69 = v95;
    swift_getKeyPath();
    uint64_t v114 = v24;
    sub_2179E1930();
    swift_release();
    swift_beginAccess();
    if (*(void *)(v24 + 88))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    if (sub_2179CA2D4())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      uint64_t v112 = v24;
      sub_2179E1930();
      swift_release();
      uint64_t v70 = *(void **)(v24 + 40);
      if (v70)
      {
        id v71 = objc_msgSend(v70, sel_identifier);
        uint64_t v100 = sub_2179E2930();
        uint64_t v108 = v72;
      }
      else
      {
        uint64_t v100 = 0;
        uint64_t v108 = 0;
      }
      swift_getKeyPath();
      uint64_t v112 = v24;
      sub_2179E1930();
      swift_release();
      uint64_t v80 = *(void **)(v24 + 48);
      if (v80)
      {
        id v81 = objc_msgSend(v80, sel_identifier);
        sub_2179E2930();
      }
      swift_getKeyPath();
      uint64_t v112 = v24;
      sub_2179E1930();
      swift_release();
      long long v82 = *(void **)(v24 + 48);
      if (v82 && (id v83 = objc_msgSend(v82, sel_correlationID)) != 0)
      {
        uint64_t v84 = v83;
        uint64_t v96 = sub_2179E2930();
      }
      else
      {
        uint64_t v96 = 0;
      }
    }
    else
    {
      uint64_t v96 = 0;
    }
    uint64_t v101 = v50;
    if (v69)
    {
      swift_bridgeObjectRelease();
      uint64_t v106 = v94;
    }
    uint64_t v85 = v99;
    sub_2179E2560();
    uint64_t v112 = 0;
    unint64_t v113 = 0xE000000000000000;
    sub_2179E2C50();
    sub_2179E2980();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E2980();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E2980();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E2980();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E27D0();
    swift_bridgeObjectRelease();
    v98((uint64_t)v85, v104);
    uint64_t v40 = v105;
    goto LABEL_37;
  }
  if (v43 != *MEMORY[0x263F7F4F0])
  {
    swift_bridgeObjectRelease();
    ((uint64_t (**)(char *, uint64_t))v41)[1](v39, v42);
LABEL_37:
    uint64_t v86 = swift_getKeyPath();
    MEMORY[0x270FA5388](v86);
    *(&v93 - 2) = (id)v24;
    *((unsigned char *)&v93 - 8) = 1;
    uint64_t v112 = v24;
    sub_2179E1920();
    swift_release();
    sub_2179C9DD4();
    return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v40, v102);
  }
  uint64_t v106 = (char *)v36;
  ((uint64_t (**)(char *, uint64_t))v41)[12](v39, v42);
  uint64_t v63 = *((void *)v39 + 1);
  uint64_t v108 = *(uint64_t (***)(void, uint64_t))v39;
  uint64_t v64 = *((void *)v39 + 3);
  uint64_t v100 = *((void *)v39 + 2);
  uint64_t v65 = *((void *)v39 + 5);
  uint64_t v99 = (char *)*((void *)v39 + 4);
  uint64_t v66 = *((void *)v39 + 6);
  uint64_t v67 = *((void *)v39 + 7);
  sub_2179CB7A0(v66, v67);
  uint64_t v68 = v103;
  if (!(v63 | v64))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v105, v102);
  }
  uint64_t v94 = (char *)v64;
  uint64_t v96 = v65;
  swift_getKeyPath();
  uint64_t v114 = v24;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  id v73 = *(id *)(v24 + 16);
  sub_2179D1A90();
  long long v75 = v74;

  uint64_t v111 = v33;
  uint64_t v98 = v34;
  id v93 = v75;
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = sub_2179E2860();
    uint64_t v79 = v78;

    if (!v63)
    {
      if (!v79) {
        goto LABEL_44;
      }
LABEL_51:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v68 = v103;
      goto LABEL_52;
    }
    if (v79)
    {
      if (v108 == (uint64_t (**)(void, uint64_t))v77 && v63 == v79)
      {
        swift_bridgeObjectRelease();
LABEL_44:
        swift_bridgeObjectRetain();
        id v88 = v76;
        sub_2179E2880();

LABEL_45:
        uint64_t v89 = swift_getKeyPath();
        MEMORY[0x270FA5388](v89);
        *(&v93 - 4) = (id)v24;
        *(_OWORD *)(&v93 - 3) = xmmword_2179E69A0;
        uint64_t v112 = v24;
        sub_2179E1920();
        swift_release();
        if (v96 && v93)
        {
          id v90 = v93;
          swift_bridgeObjectRetain();
          sub_2179E2890();
        }
        uint64_t v101 = 0;
        if (v67) {
          swift_bridgeObjectRelease();
        }
        id v91 = v95;
        sub_2179E2550();
        uint64_t v112 = 0;
        unint64_t v113 = 0xE000000000000000;
        sub_2179E2C50();
        sub_2179E2980();
        sub_2179E2980();
        swift_bridgeObjectRelease();
        sub_2179E2980();
        sub_2179E2980();
        swift_bridgeObjectRelease();
        sub_2179E2980();
        sub_2179E2980();
        swift_bridgeObjectRelease();
        sub_2179E2980();
        sub_2179E2980();
        swift_bridgeObjectRelease();
        sub_2179E27D0();
        swift_bridgeObjectRelease();

        v98((uint64_t)v91, v104);
        uint64_t v40 = v105;
        goto LABEL_37;
      }
      char v87 = sub_2179E2D50();
      swift_bridgeObjectRelease();
      if (v87) {
        goto LABEL_44;
      }
      goto LABEL_51;
    }
  }
  else
  {
    if (!v63) {
      goto LABEL_45;
    }
    id v76 = 0;
    uint64_t v68 = v103;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_52:
  uint64_t v92 = v105;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v92, v102);
}

uint64_t sub_2179C9DD4()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  uint64_t v3 = v2;
  sub_2179E1930();
  swift_release();
  uint64_t v4 = &v3[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections];
  swift_beginAccess();
  unint64_t v5 = *(void *)v4;
  swift_bridgeObjectRetain();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v6)
  {
    swift_getKeyPath();
    sub_2179E1930();
    uint64_t result = swift_release();
    if (*(unsigned char *)(v1 + 56) == 1)
    {
      swift_getKeyPath();
      sub_2179E1930();
      swift_release();
      swift_beginAccess();
      uint64_t v8 = *(void **)(v1 + 48);
      if (v8)
      {
        id v9 = objc_msgSend(v8, sel_identifier);
        sub_2179E2930();

        uint64_t v10 = (void *)sub_2179E2900();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = 0;
      }
      swift_getKeyPath();
      sub_2179E1930();
      swift_release();
      swift_beginAccess();
      uint64_t v11 = *(void **)(v1 + 40);
      if (v11)
      {
        id v12 = objc_msgSend(v11, sel_identifier);
        sub_2179E2930();

        uint64_t v13 = (void *)sub_2179E2900();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v13 = 0;
      }
      swift_getKeyPath();
      sub_2179E1930();
      swift_release();
      uint64_t v14 = *(void **)(v1 + 48);
      if (v14)
      {
        id v15 = objc_msgSend(v14, sel_correlationID);
        if (v15)
        {
          sub_2179E2930();

          id v15 = (id)sub_2179E2900();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        id v15 = 0;
      }
      uint64_t v16 = self;
      if (qword_267BA6118 != -1) {
        swift_once();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v16, sel_eventWithContentID_collectionID_correlationID_launchType_, v10, v13, v15, v17);

      [v18 log];
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      sub_2179E1920();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2179CA2D4()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  uint64_t v63 = v0;
  sub_2179CB618(&qword_267BA6800, (void (*)(uint64_t))type metadata accessor for CollectionsViewModel);
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v3 = *(void **)(v0 + 64);
  uint64_t v2 = *(void **)(v0 + 72);
  swift_getKeyPath();
  uint64_t v62 = v0;
  swift_bridgeObjectRetain();
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  if (!v2)
  {
    if (!v4)
    {
      uint64_t v32 = 0;
      goto LABEL_20;
    }
    swift_getKeyPath();
    uint64_t v61 = v0;
    swift_bridgeObjectRetain();
    sub_2179E1930();
    swift_release();
    swift_beginAccess();
    id v18 = *(id *)(v0 + 16);
    unint64_t v19 = sub_2179D2EB8();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2179CBA74(v19, v5, v4);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v57 = v5;
    MEMORY[0x270FA5388](KeyPath);
    id v53 = (void *)v1;
    id v54 = v20;
    uint64_t v60 = v1;
    id v22 = v20;
    uint64_t v55 = MEMORY[0x263F8EE60] + 8;
    sub_2179E1920();
    swift_release();
    id v56 = v22;

    if (v20)
    {
      swift_getKeyPath();
      uint64_t v60 = v1;
      sub_2179E1930();
      swift_release();
      uint64_t v23 = *(char **)(v1 + 16);
      uint64_t v24 = *(void **)&v23[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
      uint64_t v25 = v23;
      uint64_t v26 = (void *)sub_2179E2900();
      id v17 = objc_msgSend(v24, sel_tipForIdentifier_, v26, v55, v56, v57);
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v33 = swift_getKeyPath();
    MEMORY[0x270FA5388](v33);
    id v53 = (void *)v1;
    id v54 = v17;
    uint64_t v60 = v1;
    sub_2179E1920();
    swift_bridgeObjectRelease();

    goto LABEL_14;
  }
  swift_getKeyPath();
  if (v4)
  {
    uint64_t v57 = v5;
    uint64_t v61 = v0;
    swift_bridgeObjectRetain();
    sub_2179E1930();
    swift_release();
    swift_beginAccess();
    id v6 = *(id *)(v0 + 16);
    unint64_t v7 = sub_2179D2EB8();
    MEMORY[0x270FA5388](v7);
    id v53 = v3;
    id v54 = v2;
    uint64_t v8 = sub_2179CB678(sub_2179CC274, (uint64_t)v52, v7);
    id v56 = v3;
    id v9 = v8;

    swift_bridgeObjectRelease();
    uint64_t v10 = swift_getKeyPath();
    MEMORY[0x270FA5388](v10);
    id v53 = (void *)v1;
    id v54 = v9;
    uint64_t v60 = v1;
    sub_2179E1920();
    swift_release();

    swift_getKeyPath();
    uint64_t v60 = v1;
    sub_2179E1930();
    swift_release();
    uint64_t v11 = *(char **)(v1 + 16);
    id v12 = *(void **)&v11[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    uint64_t v13 = v11;
    uint64_t v14 = (void *)sub_2179E2900();
    id v15 = objc_msgSend(v12, sel_tipsForCollectionIdentifier_, v14);

    if (v15)
    {
      sub_2179CBC9C();
      unint64_t v16 = sub_2179E29D0();

      swift_bridgeObjectRetain();
      id v17 = sub_2179CB8D0(v16, v57, v4);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      id v17 = 0;
    }
    uint64_t v31 = swift_getKeyPath();
    MEMORY[0x270FA5388](v31);
    id v53 = (void *)v1;
    id v54 = v17;
    uint64_t v60 = v1;
    sub_2179E1920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    swift_release();

    goto LABEL_15;
  }
  uint64_t v61 = v0;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  id v27 = *(id *)(v0 + 16);
  unint64_t v28 = sub_2179D2EB8();
  MEMORY[0x270FA5388](v28);
  id v53 = v3;
  id v54 = v2;
  uint64_t v29 = sub_2179CB678(sub_2179CBC7C, (uint64_t)v52, v28);

  swift_bridgeObjectRelease();
  uint64_t v30 = swift_getKeyPath();
  MEMORY[0x270FA5388](v30);
  id v53 = (void *)v1;
  id v54 = v29;
  uint64_t v60 = v1;
  sub_2179E1920();
  swift_bridgeObjectRelease();
  swift_release();

LABEL_15:
  swift_getKeyPath();
  uint64_t v60 = v1;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v34 = *(void **)(v1 + 40);
  if (v34)
  {
    swift_getKeyPath();
    uint64_t v59 = v1;
    id v35 = v34;
    sub_2179E1930();
    swift_release();
    swift_beginAccess();
    uint64_t v36 = (char *)*(id *)(v1 + 16);
    id v37 = objc_msgSend(v35, sel_identifier);
    sub_2179E2930();

    uint64_t v38 = *(void **)&v36[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    uint64_t v39 = (void *)sub_2179E2900();
    objc_msgSend(v38, sel_removeNotificationForIdentifier_, v39);

    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v35, sel_identifier);
    uint64_t v41 = sub_2179E2930();
    int v43 = v42;

    uint64_t v44 = swift_getKeyPath();
    MEMORY[0x270FA5388](v44);
    v52[0] = v1;
    v52[1] = v41;
    id v53 = v43;
    uint64_t v59 = v1;
    sub_2179E1920();

    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  uint64_t v59 = v1;
  sub_2179E1930();
  swift_release();
  swift_beginAccess();
  uint64_t v45 = *(void **)(v1 + 48);
  if (v45)
  {
    swift_getKeyPath();
    uint64_t v58 = v1;
    id v46 = v45;
    sub_2179E1930();
    swift_release();
    swift_beginAccess();
    int v47 = (char *)*(id *)(v1 + 16);
    id v48 = objc_msgSend(v46, sel_identifier);
    sub_2179E2930();

    char v49 = *(void **)&v47[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    uint64_t v50 = (void *)sub_2179E2900();
    objc_msgSend(v49, sel_removeNotificationForIdentifier_, v50);

    swift_bridgeObjectRelease();
  }
  uint64_t v32 = 1;
LABEL_20:
  sub_2179C9DD4();
  return v32;
}

uint64_t sub_2179CAD38()
{
  return swift_release();
}

id *CollectionsViewModel.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  uint64_t v2 = sub_2179E1970();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t CollectionsViewModel.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  uint64_t v2 = sub_2179E1970();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2179CB0B8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179CB1B0(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading, a2);
}

uint64_t sub_2179CB0CC()
{
  return swift_release();
}

uint64_t sub_2179CB19C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179CB1B0(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded, a2);
}

uint64_t sub_2179CB1B0@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  id v6 = (unsigned char *)(v5 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_2179CB27C()
{
  return swift_release();
}

uint64_t sub_2179CB34C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179CB618(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179CB418()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CB508()
{
  return sub_2179C6D0C(v0[2], v0[3], v0[4]);
}

void sub_2179CB530()
{
  sub_2179C7228(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_2179CB554()
{
  sub_2179C7738(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2179CB570@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179CB1B0(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading, a2);
}

uint64_t sub_2179CB59C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179CB1B0(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded, a2);
}

uint64_t sub_2179CB5D0()
{
  return sub_2179C82FC(v0[2], v0[3], v0[4]);
}

uint64_t sub_2179CB5F8()
{
  return sub_2179C8828(v0[2], v0[3], v0[4]);
}

uint64_t sub_2179CB618(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2179CB668()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 56) = *(unsigned char *)(v0 + 24);
}

void *sub_2179CB678(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_2179E2CD0())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x21D451D80](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      id v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2179CB7A0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    a1 = sub_2179E2930();
  }
  uint64_t v3 = a2;
  uint64_t v4 = qword_267BA6118;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = off_267BA6830;
  swift_beginAccess();
  v5[7] = a1;
  v5[8] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v5[9] = a1;
  v5[10] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAppReferrer_, v7);
}

void *sub_2179CB8D0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_2179E2CD0())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x21D451D80](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      id v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_identifier);
      uint64_t v11 = sub_2179E2930();
      uint64_t v13 = v12;

      if (a3)
      {
        if (v11 == a2 && v13 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v15 = sub_2179E2D50();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_19;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      ++v6;
      if (v9 == v5) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
LABEL_22:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_2179CBA74(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_2179E2CD0())
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 & 0xC000000000000001;
    uint64_t v21 = v5 + 32;
    uint64_t v9 = &selRef_setBaseURL_;
    unint64_t v22 = v5 & 0xC000000000000001;
    uint64_t v23 = v5;
    while (1)
    {
      id v10 = v8 ? (id)MEMORY[0x21D451D80](v7, v5) : *(id *)(v21 + 8 * v7);
      uint64_t v11 = v10;
      if (__OFADD__(v7++, 1)) {
        break;
      }
      id v13 = [v10 v9[267]];
      uint64_t v14 = (void *)sub_2179E29D0();

      uint64_t v15 = v14[2];
      if (v15)
      {
        BOOL v16 = v14[4] == a2 && v14[5] == a3;
        if (v16 || (sub_2179E2D50() & 1) != 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
        if (v15 != 1)
        {
          id v17 = v14 + 7;
          uint64_t v18 = 1;
          while (1)
          {
            uint64_t v5 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              break;
            }
            BOOL v19 = *(v17 - 1) == a2 && *v17 == a3;
            if (v19 || (sub_2179E2D50() & 1) != 0) {
              goto LABEL_27;
            }
            v17 += 2;
            ++v18;
            if (v5 == v15) {
              goto LABEL_4;
            }
          }
          __break(1u);
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
        unint64_t v8 = v22;
        uint64_t v5 = v23;
        uint64_t v9 = &selRef_setBaseURL_;
        if (v7 == v6) {
          goto LABEL_31;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
        if (v7 == v6) {
          goto LABEL_31;
        }
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2179CBC7C(id *a1)
{
  return sub_2179D2B28(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

unint64_t sub_2179CBC9C()
{
  unint64_t result = qword_26ACF77C0;
  if (!qword_26ACF77C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACF77C0);
  }
  return result;
}

uint64_t sub_2179CBCDC()
{
  return type metadata accessor for CollectionsViewModel();
}

uint64_t sub_2179CBCE4()
{
  uint64_t result = sub_2179E1970();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CollectionsViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CollectionsViewModel);
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CollectionsViewModel.collections.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of CollectionsViewModel.mainUserGuide.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of CollectionsViewModel.isLoading.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of CollectionsViewModel.isCollectionEmpty.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of CollectionsViewModel.__allocating_init(contentModel:)()
{
  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of CollectionsViewModel.parseDeepLink(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of CollectionsViewModel.loadPreferredContent()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of CollectionsViewModel.resetSelection()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t sub_2179CC1E8()
{
  return sub_2179CF4BC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2179CC208()
{
  return sub_2179CF17C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2179CC228()
{
  return sub_2179CF850(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2179CC244()
{
}

void sub_2179CC25C()
{
}

uint64_t sub_2179CC274(id *a1)
{
  return sub_2179CBC7C(a1) & 1;
}

void sub_2179CC290()
{
}

void sub_2179CC2A8()
{
}

uint64_t sub_2179CC2C0()
{
  return sub_2179CB508();
}

uint64_t sub_2179CC2D8()
{
  return sub_2179CB5D0();
}

uint64_t sub_2179CC2F0()
{
  return sub_2179CB5F8();
}

uint64_t View.readSize(onChange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7758);
  uint64_t v5 = sub_2179E1D20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v13 - v7;
  BOOL v19 = sub_2179CC544;
  uint64_t v20 = 0;
  sub_2179E2420();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7730);
  sub_21798D884(&qword_26ACF7728, &qword_26ACF7730);
  sub_2179E2160();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v15;
  *(void *)(v9 + 16) = v14;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = sub_21798D884(&qword_26ACF7750, &qword_26ACF7758);
  uint64_t v17 = a3;
  uint64_t v18 = v11;
  swift_retain();
  swift_getWitnessTable();
  sub_2179CC614();
  sub_2179CC668();
  sub_2179E21B0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2179CC544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2179E2250();
  uint64_t result = sub_2179E1C50();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_2179CC584(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_2179CC5B0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179CC5E8(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_2179CC614()
{
  unint64_t result = qword_26ACF7678;
  if (!qword_26ACF7678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7678);
  }
  return result;
}

unint64_t sub_2179CC668()
{
  unint64_t result = qword_26ACF77B8;
  if (!qword_26ACF77B8)
  {
    type metadata accessor for CGSize(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF77B8);
  }
  return result;
}

uint64_t sub_2179CC6C0()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

void sub_2179CC7D8()
{
  xmmword_267BA6820 = 0uLL;
}

double sub_2179CC7E8@<D0>(_OWORD *a1@<X8>)
{
  if (qword_267BA6110 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_267BA6820;
  *a1 = xmmword_267BA6820;
  return result;
}

double sub_2179CC850()
{
  type metadata accessor for TipsAnalyticsHelper();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = sub_2179E2930();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0xE000000000000000;
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(void *)(v0 + 120) = 0;
  off_267BA6830 = (_UNKNOWN *)v0;
  return result;
}

uint64_t static TipsAnalyticsHelper.shared.getter()
{
  if (qword_267BA6118 != -1) {
    swift_once();
  }

  return swift_retain();
}

id sub_2179CC91C()
{
  type metadata accessor for TipsContentModel();
  id result = static TipsContentModel.shared()();
  qword_267BA6838 = (uint64_t)result;
  return result;
}

id static TipsAnalyticsHelper.contentModel.getter()
{
  if (qword_267BA6120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_267BA6838;

  return v0;
}

void static TipsAnalyticsHelper.contentModel.setter(uint64_t a1)
{
  if (qword_267BA6120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_267BA6838;
  qword_267BA6838 = a1;
}

uint64_t (*static TipsAnalyticsHelper.contentModel.modify())()
{
  if (qword_267BA6120 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2179CCADC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CCB3C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179CCB88(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CCBDC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 56) = v3;
  *(void *)(v4 + 64) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CCC3C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179CCC88(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2179CCCDC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179CCD30(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 72) = v3;
  *(void *)(v4 + 80) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CCD90()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179CCDDC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2179CCE30())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179CCE84(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 88) = v3;
  *(void *)(v4 + 96) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CCEE4()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2179CCF30(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2179CCF84())()
{
  return j_j__swift_endAccess;
}

uint64_t TipsAnalyticsHelper.deinit()
{
  if (*(void *)(v0 + 16))
  {
    swift_retain();
    sub_2179E2510();
    swift_release();
  }
  *(void *)(v0 + 16) = 0;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t TipsAnalyticsHelper.__deallocating_deinit()
{
  TipsAnalyticsHelper.deinit();

  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t sub_2179CD0A0(void *a1)
{
  uint64_t v2 = v1;
  if (*(void *)(v1 + 16))
  {
    swift_retain();
    sub_2179E2510();
    swift_release();
  }
  *(void *)(v1 + 16) = 0;
  swift_release();
  if (a1)
  {
    id v4 = objc_msgSend(a1, sel_identifier);
    uint64_t v5 = sub_2179E2930();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = sub_2179E2930();
    uint64_t v7 = v8;
  }
  *(void *)(v2 + 24) = v5;
  *(void *)(v2 + 32) = v7;

  return swift_bridgeObjectRelease();
}

void sub_2179CD160(void *a1)
{
  uint64_t v2 = v1;
  if (v1[2])
  {
    swift_retain();
    sub_2179E2510();
    swift_release();
  }
  v1[2] = 0;
  swift_release();
  if (!a1)
  {
    swift_beginAccess();
    v1[5] = 0;
    v1[6] = 0;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  id v4 = objc_msgSend(a1, sel_identifier);
  uint64_t v5 = sub_2179E2930();
  uint64_t v7 = v6;

  swift_beginAccess();
  v2[5] = v5;
  v2[6] = v7;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a1, sel_correlationID);
  if (!v8)
  {
LABEL_7:
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_2179E2930();
  uint64_t v12 = v11;

LABEL_8:
  swift_beginAccess();
  v2[11] = v10;
  v2[12] = v12;
  swift_bridgeObjectRelease();
  if (a1 && (id v13 = objc_msgSend(a1, sel_clientConditionID)) != 0)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_2179E2930();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  v2[13] = v15;
  v2[14] = v17;
  swift_bridgeObjectRelease();
  sub_2179CE0E4(a1);
}

void sub_2179CD2F0()
{
  swift_beginAccess();
  if (v0[6])
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    if (v0[4])
    {
LABEL_3:
      swift_bridgeObjectRetain();
      uint64_t v2 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v1 = 0;
    if (v0[4]) {
      goto LABEL_3;
    }
  }
  uint64_t v2 = 0;
LABEL_6:
  swift_beginAccess();
  if (v0[12])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = self;
  uint64_t v5 = (void *)sub_2179E2900();
  id v6 = objc_msgSend(v4, sel_eventWithContentID_collectionID_correlationID_launchType_, v1, v2, v3, v5);

  [v6 log];
}

void sub_2179CD474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v39 = a1;
  uint64_t v5 = sub_2179E24F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v33 - v10;
  uint64_t v12 = sub_2179E24A0();
  MEMORY[0x270FA5388](v12);
  swift_beginAccess();
  if (v3[6] && v3[4])
  {
    uint64_t v37 = a2;
    uint64_t v33 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_2179E2900();
    swift_bridgeObjectRelease();
    id v13 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (v3[12])
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v3[14];
    uint64_t v35 = v5;
    uint64_t v34 = v6;
    uint64_t v38 = v11;
    if (v15)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = self;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v18 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    BOOL v19 = (void *)sub_2179E2900();
    uint64_t v20 = (void *)v17;
    uint64_t v21 = (void *)v36;
    id v22 = objc_msgSend(v20, sel_eventWithContentID_collectionID_correlationID_clientConditionID_viewMethod_viewMode_, v36, v13, v14, v16, v18, v19);

    if (v3[2])
    {
      swift_retain();
      sub_2179E2510();
      swift_release();
    }
    uint64_t v23 = v38;
    v3[2] = 0;
    swift_release();
    uint64_t v24 = swift_allocObject();
    swift_weakInit();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v24;
    *(void *)(v25 + 24) = v22;
    aBlock[4] = sub_2179CE4D4;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179911FC;
    aBlock[3] = &block_descriptor_5;
    _Block_copy(aBlock);
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_2179CE4DC();
    swift_retain();
    id v26 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
    sub_2179CE534();
    sub_2179E2C20();
    sub_2179E2520();
    swift_allocObject();
    uint64_t v27 = sub_2179E2500();
    swift_release();
    swift_release();
    v3[2] = v27;
    swift_release();
    if (v3[2])
    {
      sub_21798722C();
      swift_retain();
      unint64_t v28 = (void *)sub_2179E2B00();
      uint64_t v29 = v33;
      sub_2179E24E0();
      MEMORY[0x21D451620](v29, *MEMORY[0x263F7F718]);
      uint64_t v30 = *(void (**)(char *, uint64_t))(v34 + 8);
      uint64_t v31 = v29;
      uint64_t v32 = v35;
      v30(v31, v35);
      sub_2179E2AE0();

      swift_release();
      v30(v23, v32);
    }
    else
    {
    }
  }
}

uint64_t sub_2179CD974(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2179CDF6C(a2);
    return swift_release();
  }
  return result;
}

void sub_2179CD9D4(uint64_t a1, char a2)
{
  swift_beginAccess();
  if (v2[6] && v2[4])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (v2[12])
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = objc_msgSend(self, sel_eventWithTipID_animationFinished_animationSource_collectionID_correlationID_, v5, a2 & 1, a1, v6, v7);

    [v8 log];
  }
}

void sub_2179CDB28()
{
  swift_beginAccess();
  if (v0[6] && v0[4])
  {
    swift_beginAccess();
    if (v0[12])
    {
      uint64_t v1 = self;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v2 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      uint64_t v3 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v4 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v5 = objc_msgSend(v1, sel_eventWithTipID_collectionID_correlationID_, v2, v3, v4);

      [v5 log];
    }
  }
}

void sub_2179CDC6C(char a1)
{
  swift_beginAccess();
  if (v1[6] && v1[4])
  {
    swift_beginAccess();
    if (v1[12])
    {
      uint64_t v3 = self;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v4 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v5 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      uint64_t v6 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      id v7 = objc_msgSend(v3, sel_eventWithTipID_saved_correlationID_collectionID_, v4, a1 & 1, v5, v6);

      [v7 log];
    }
  }
}

void sub_2179CDDB8()
{
  id v0 = objc_msgSend(self, sel_event);
  [v0 log];
}

void sub_2179CDE18()
{
  id v6 = self;
  id v0 = (void *)sub_2179E2900();
  uint64_t v1 = (void *)sub_2179E2900();
  uint64_t v2 = (void *)sub_2179E2900();
  uint64_t v3 = (void *)sub_2179E2900();
  id v4 = (void *)sub_2179E2900();
  id v5 = (void *)sub_2179E2900();
  id v7 = objc_msgSend(v6, sel_eventWithTopicID_topicTitle_source_interfaceStyle_fromTopicID_externalURLString_, v0, v1, v2, v3, v4, v5);

  [v7 log];
}

void sub_2179CDF6C(void *a1)
{
  swift_beginAccess();
  unint64_t v3 = v1[6];
  if (v3 && v1[4])
  {
    uint64_t v4 = v1[5];
    swift_bridgeObjectRetain();
    [a1 log];
    uint64_t v5 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v5) {
      objc_msgSend(self, sel_incrementTipsViewedCount);
    }
    if (qword_267BA6120 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v6 = (void *)qword_267BA6838;
    uint64_t v7 = v1[4];
    id v8 = *(void **)(qword_267BA6838 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
    swift_bridgeObjectRetain();
    id v9 = v6;
    uint64_t v10 = (void *)sub_2179E2900();
    if (v7) {
      uint64_t v11 = (void *)sub_2179E2900();
    }
    else {
      uint64_t v11 = 0;
    }
    objc_msgSend(v8, sel_tipViewed_collectionIdentifier_, v10, v11);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_2179CE0E4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6840);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E1860();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v29 - v12;
  uint64_t v14 = *(void **)(v2 + 120);
  if (!v14)
  {
LABEL_5:
    if (!a1) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  id v15 = v14;
  id v16 = objc_msgSend(v15, sel_date);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_2179E1840();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v11, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v18(v13, v6, v7);
      sub_2179E1850();
      sub_2179E1830();
      double v20 = v19;
      uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
      v21(v11, v7);
      objc_msgSend(v15, sel_setTimeSpent_, v20);
      [v15 log];

      v21(v13, v7);
      goto LABEL_5;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }

  sub_2179CEC24((uint64_t)v6);
  if (!a1)
  {
LABEL_13:
    unint64_t v28 = *(void **)(v2 + 120);
    *(void *)(v2 + 120) = 0;
    goto LABEL_14;
  }
LABEL_9:
  if (!*(void *)(v2 + 32)) {
    goto LABEL_13;
  }
  id v22 = a1;
  swift_bridgeObjectRetain();
  id v23 = objc_msgSend(v22, sel_identifier);
  if (!v23)
  {
    sub_2179E2930();
    id v23 = (id)sub_2179E2900();
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = self;
  uint64_t v25 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v22, sel_correlationID);
  id v27 = objc_msgSend(v24, sel_eventWithTipID_collectionID_correlationID_, v23, v25, v26);

  unint64_t v28 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = v27;

LABEL_14:
}

uint64_t sub_2179CE45C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2179CE494()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179CE4D4()
{
  return sub_2179CD974(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_2179CE4DC()
{
  unint64_t result = qword_26ACF7590;
  if (!qword_26ACF7590)
  {
    sub_2179E24A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF7590);
  }
  return result;
}

unint64_t sub_2179CE534()
{
  unint64_t result = qword_26ACF75A0;
  if (!qword_26ACF75A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7598);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF75A0);
  }
  return result;
}

void sub_2179CE590()
{
}

void sub_2179CE598()
{
  swift_beginAccess();
  unint64_t v1 = v0[6];
  if (v1)
  {
    uint64_t v2 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0) {
      uint64_t v2 = v0[5] & 0xFFFFFFFFFFFFLL;
    }
    if (v2)
    {
      id v3 = objc_allocWithZone(MEMORY[0x263F7F608]);
      swift_bridgeObjectRetain();
      id v4 = objc_msgSend(v3, sel_init);
      uint64_t v5 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setIdentifier_, v5);

      swift_beginAccess();
      if (v0[12])
      {
        id v6 = v4;
        swift_bridgeObjectRetain();
        uint64_t v7 = (void *)sub_2179E2900();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v8 = v4;
        uint64_t v7 = 0;
      }
      objc_msgSend(v4, sel_setCorrelationID_, v7);

      id v9 = v4;
      sub_2179CE0E4(v4);
    }
  }
}

uint64_t sub_2179CE6E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  *a2 = *(void *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179CE734@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 64);
  *a2 = *(void *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179CE784@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 80);
  *a2 = *(void *)(v3 + 72);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179CE7D4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 96);
  *a2 = *(void *)(v3 + 88);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TipsAnalyticsHelper()
{
  return self;
}

uint64_t method lookup function for TipsAnalyticsHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipsAnalyticsHelper);
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.setCurrentCollection(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.setCurrentTip(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logAppLaunched(source:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logContentViewed(viewMode:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logAnimationFinished(source:animationFinished:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logReplayButtonTapped()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logTipSaved(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logUserGuideSearchUsed()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logUserGuideContentViewed(topicID:topicTitle:source:interfaceStyle:fromTopicID:externURLString:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.pauseTipsTimeTracking()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.resumeTipsTimeTracking()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t sub_2179CEC24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id static TipsContentModel.shared()()
{
  unint64_t v1 = (void *)qword_26ACF69B0;
  if ((qword_26ACF69B0
     || (id v2 = objc_msgSend(objc_allocWithZone(v0), sel_init),
         uint64_t v3 = (void *)qword_26ACF69B0,
         qword_26ACF69B0 = (uint64_t)v2,
         v3,
         (unint64_t v1 = (void *)qword_26ACF69B0) != 0))
    && (uint64_t v4 = swift_dynamicCastClass()) != 0)
  {
    uint64_t v5 = v4;
    id v6 = v1;
    return (id)v5;
  }
  else
  {
    id v8 = objc_allocWithZone(v0);
    return objc_msgSend(v8, sel_init);
  }
}

uint64_t sub_2179CED2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_2179CEDB4(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2179E1BE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_2179CEED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2179CEF54(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_2179E1BE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_2179CEFE0())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_2179CF03C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179CF098()
{
  return sub_2179CF334((uint64_t)&unk_2179E6CE0, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

uint64_t sub_2179CF0AC()
{
  return swift_release();
}

uint64_t sub_2179CF17C(uint64_t a1, char a2)
{
  return sub_2179CF4DC(a1, a2, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

void (*sub_2179CF19C(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179CF03C();
  return sub_2179CF2B8;
}

void sub_2179CF2B8(void *a1)
{
}

uint64_t (*sub_2179CF2C4())()
{
  return j__swift_endAccess;
}

uint64_t sub_2179CF320()
{
  return sub_2179CF334((uint64_t)&unk_2179E6D08, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_2179CF334(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v4 = (unsigned __int8 *)(v2 + *a2);
  swift_beginAccess();
  return *v4;
}

uint64_t sub_2179CF3EC()
{
  return swift_release();
}

uint64_t sub_2179CF4BC(uint64_t a1, char a2)
{
  return sub_2179CF4DC(a1, a2, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_2179CF4DC(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = (unsigned char *)(a1 + *a3);
  uint64_t result = swift_beginAccess();
  *uint64_t v4 = a2;
  return result;
}

void (*sub_2179CF534(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179CF2C4();
  return sub_2179CF650;
}

void sub_2179CF650(void *a1)
{
}

uint64_t (*sub_2179CF65C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179CF6B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179CF77C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179CF850(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
  swift_beginAccess();
  *uint64_t v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2179CF8C0(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179CF65C();
  return sub_2179CF9DC;
}

void sub_2179CF9DC(void *a1)
{
}

uint64_t (*sub_2179CF9E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179CFA44@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v4 = (unsigned char *)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  uint64_t result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_2179CFB0C()
{
  return swift_release();
}

uint64_t sub_2179CFBDC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_2179CFCA4()
{
  return swift_release();
}

void (*sub_2179CFD74(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179CF9E8();
  return sub_2179CFE90;
}

void sub_2179CFE90(void *a1)
{
}

uint64_t (*sub_2179CFE9C())()
{
  return j_j__swift_endAccess;
}

id sub_2179CFEF8@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  return sub_2179D05AC(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection, a2);
}

void sub_2179CFF0C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

void *sub_2179CFFE8()
{
  return sub_2179D0264((uint64_t)&unk_2179E6D80, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
}

void sub_2179CFFFC(void *a1)
{
}

void (*sub_2179D00CC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179CFE9C();
  return sub_2179D01E8;
}

void sub_2179D01E8(void *a1)
{
}

uint64_t (*sub_2179D01F4())()
{
  return j_j__swift_endAccess;
}

void *sub_2179D0250()
{
  return sub_2179D0264((uint64_t)&unk_2179E6DA8, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
}

void *sub_2179D0264(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = v5;
  return v5;
}

void sub_2179D0324(void *a1)
{
}

void sub_2179D03F4(uint64_t a1, void *a2)
{
}

void (*sub_2179D0414(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179D01F4();
  return sub_2179D0530;
}

void sub_2179D0530(void *a1)
{
}

uint64_t (*sub_2179D053C())()
{
  return j_j__swift_endAccess;
}

id sub_2179D0598@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  return sub_2179D05AC(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection, a2);
}

id sub_2179D05AC@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void **a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  id v6 = (void **)(v5 + *a2);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *a3 = *v6;

  return v7;
}

void sub_2179D0688(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  id v2 = v1;
  sub_2179E1920();
  swift_release();
}

void *sub_2179D0764()
{
  return sub_2179D0264((uint64_t)&unk_2179E6DD0, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
}

void sub_2179D0778(void *a1)
{
}

void sub_2179D0848(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void **)(a1 + *a3);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a2;
  id v6 = a2;
}

void (*sub_2179D08AC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179D053C();
  return sub_2179D09C8;
}

void sub_2179D09C8(void *a1)
{
}

uint64_t (*sub_2179D09D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D0A30@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179D0D90(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant, a2);
}

uint64_t sub_2179D0A44()
{
  return swift_release();
}

uint64_t sub_2179D0B14()
{
  return sub_2179CF334((uint64_t)&unk_2179E6DF8, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant);
}

uint64_t sub_2179D0B28()
{
  return swift_release();
}

void (*sub_2179D0BF8(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179D09D4();
  return sub_2179D0D14;
}

void sub_2179D0D14(void *a1)
{
}

uint64_t (*sub_2179D0D20())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D0D7C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2179D0D90(a1, OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant, a2);
}

uint64_t sub_2179D0D90@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  id v6 = (unsigned char *)(v5 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_2179D0E5C()
{
  return swift_release();
}

uint64_t sub_2179D0F2C()
{
  return sub_2179CF334((uint64_t)&unk_2179E6E20, OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant);
}

uint64_t sub_2179D0F40()
{
  return swift_release();
}

void (*sub_2179D1010(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_2179E1950();
  swift_release();
  v3[7] = sub_2179D0D20();
  return sub_2179D112C;
}

void sub_2179D112C(void *a1)
{
}

void sub_2179D1138(void **a1, void *a2)
{
  id v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;

  sub_2179D11AC();
}

uint64_t sub_2179D11AC()
{
  return swift_release();
}

void *sub_2179D135C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_2179D13AC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_2179D11AC();
}

uint64_t (*sub_2179D1418(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2179D1478;
}

uint64_t sub_2179D1478(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_2179D11AC();
  }
  return result;
}

uint64_t sub_2179D14AC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179D1518()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2179D1570(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2179D15D0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D162C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2179D1698()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179D16E4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2179D1738())()
{
  return j_j__swift_endAccess;
}

id TipsContentModel.appController.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
}

id sub_2179D17A4()
{
  uint64_t v1 = OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7F640]), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_2179D1820()
{
  return sub_2179D55EC(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

uint64_t sub_2179D1848()
{
  return sub_2179D55EC(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_2179D1878()
{
  return sub_2179D5648();
}

void sub_2179D1898()
{
  sub_2179D0848(*(void *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
}

void sub_2179D18C4()
{
  sub_2179D0848(*(void *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
}

void sub_2179D18F0()
{
  sub_2179D0848(*(void *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
}

uint64_t sub_2179D191C()
{
  return sub_2179D55EC(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant);
}

uint64_t sub_2179D1944()
{
  return sub_2179D55EC(OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant);
}

uint64_t sub_2179D1964(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_2179D1978(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_2179D17A4();
  return sub_2179D19C0;
}

void sub_2179D19C0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = v2;
}

uint64_t TipsContentModel.contentDidUpdate.getter()
{
  return swift_retain();
}

uint64_t TipsContentModel.savedTipsContentDidUpdate.getter()
{
  return swift_retain();
}

uint64_t TipsContentModel.networkDidChangeToReachable.getter()
{
  return swift_retain();
}

void static TipsContentModel.appActive()()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_fullTipContentManager);

  objc_msgSend(v1, sel_tipsAppActive);
}

void sub_2179D1A90()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_userGuides));
  if (v1)
  {
    sub_2179E28A0();
    unint64_t v2 = sub_2179E29D0();

    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2179E2CD0();
      swift_bridgeObjectRelease();
      if (v4)
      {
LABEL_4:
        if ((v2 & 0xC000000000000001) != 0)
        {
          MEMORY[0x21D451D80](0, v2);
        }
        else
        {
          if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v3 = *(id *)(v2 + 32);
        }
      }
    }
    else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
  }
}

id sub_2179D1B74()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_savedTipsCollection);

  return v1;
}

id sub_2179D1BB4()
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  id v1 = (id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
  swift_beginAccess();
  if (*v1)
  {
    id v2 = objc_msgSend(*v1, sel_identifier);
    sub_2179E2930();

    id v3 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(self, sel_isSavedTipsCollectionIdentifier_, v3);

  return v4;
}

id sub_2179D1CE8()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_assetSizes);

  return v1;
}

id sub_2179D1D28(char a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  objc_msgSend(v2, sel_setAlwaysShowIntro_, a1 & 1);

  return objc_msgSend(v2, sel_updateContent);
}

id sub_2179D1D80()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_updateSavedTipsContent);
}

void sub_2179D1D98(void *a1, uint64_t a2, void (*a3)(void, id), uint64_t a4)
{
  uint64_t v9 = sub_2179E1750();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  id v14 = objc_msgSend(a1, sel_fullContentAssets);
  id v15 = objc_msgSend(a1, sel_language);
  if (!v15)
  {
    sub_2179E2930();
    uint64_t v21 = v12;
    id v15 = (id)sub_2179E2900();
    uint64_t v12 = v21;
    swift_bridgeObjectRelease();
  }
  id v16 = objc_msgSend(a1, sel_assetFileInfoManager);
  id v17 = objc_msgSend(v13, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v14, v15, a2, v16);

  if (v17)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    aBlock[4] = sub_2179D3EA8;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179ABFCC;
    aBlock[3] = &block_descriptor_6;
    double v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_fetchAssetsWithAssetsConfiguration_completionHandler_, v17, v19);
    _Block_release(v19);
  }
  else
  {
    LODWORD(aBlock[0]) = 22;
    sub_2179D3CF0(MEMORY[0x263F8EE78]);
    sub_2179D3E28(&qword_267BA6848, MEMORY[0x263F06080]);
    sub_2179E1780();
    id v17 = (id)sub_2179E1740();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a3(0, v17);
  }
}

void sub_2179D20AC(uint64_t a1)
{
  uint64_t v3 = sub_2179E1BE0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v16[-v8];
  uint64_t v10 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  if (*v10)
  {
    uint64_t v11 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
    swift_beginAccess();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v9, v11, v3);
    (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F18508], v3);
    swift_bridgeObjectRetain();
    LOBYTE(v11) = sub_2179E1BD0();
    uint64_t v12 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
    v12(v7, v3);
    v12(v9, v3);
    id v13 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager);
    sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
    id v14 = v13;
    id v15 = (void *)sub_2179E29C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_prefetchAssetsFromTip_tips_assetUserInterfaceStyle_, a1, v15, (v11 & 1) == 0);
  }
}

id sub_2179D22D4()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager), sel_cancel);
}

id sub_2179D22EC(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA6850);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E1BE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  id v8 = objc_msgSend(a1, sel_language);
  uint64_t v9 = sub_2179E2930();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(a1, sel_assetFileInfoManager);
  id v13 = sub_2179D2438(a2, (uint64_t)v6, v9, v11, (uint64_t)v12);
  swift_bridgeObjectRelease();

  sub_21798B28C((uint64_t)v6, (uint64_t *)&unk_267BA6850);
  return v13;
}

id sub_2179D2438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a1;
  uint64_t v29 = a5;
  uint64_t v27 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA6850);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2179E1BE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  id v17 = (char *)&v27 - v16;
  MEMORY[0x270FA5388](v15);
  double v19 = (char *)&v27 - v18;
  sub_21798B2E8(a2, (uint64_t)v9, (uint64_t *)&unk_267BA6850);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_21798B28C((uint64_t)v9, (uint64_t *)&unk_267BA6850);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v10);
    uint64_t v20 = v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v20, v17, v10);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
  }
  uint64_t v21 = v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v17, v21, v10);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x263F18508], v10);
  LOBYTE(v21) = sub_2179E1BD0();
  id v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v14, v10);
  v22(v17, v10);
  id v23 = *(void **)(v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  uint64_t v24 = (void *)sub_2179E2900();
  id v25 = objc_msgSend(v23, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v28, v24, (v21 & 1) == 0, v29, v27);

  return v25;
}

uint64_t sub_2179D2774@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    uint64_t v6 = self;
    id v7 = a1;
    id v8 = objc_msgSend(v6, sel_assetPathFromAssetConfiguration_type_, v7, a2);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_2179E2930();

      sub_2179E17E0();
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v11 = sub_2179E1810();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);

  return v12(a3, 1, 1, v11);
}

id sub_2179D288C(uint64_t a1, uint64_t a2)
{
  return sub_2179D2C64(a1, a2, (SEL *)&selRef_tipForIdentifier_);
}

void *sub_2179D2898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  id v7 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  id v8 = (void *)sub_2179E2900();
  id v9 = objc_msgSend(v7, sel_tipsForCollectionIdentifier_, v8);

  if (!v9) {
    return 0;
  }
  sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
  unint64_t v10 = sub_2179E29D0();

  swift_bridgeObjectRetain();
  uint64_t v11 = sub_2179CB8D0(v10, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2179D2984(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  uint64_t v4 = (void *)sub_2179E2900();
  id v5 = objc_msgSend(v3, sel_tipsForCollectionIdentifier_, v4);

  if (!v5) {
    return 0;
  }
  sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
  uint64_t v6 = sub_2179E29D0();

  return v6;
}

void sub_2179D2A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (a2)
  {
    id v7 = (void *)sub_2179E2900();
    if (a4)
    {
LABEL_3:
      uint64_t v8 = sub_2179E2900();
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  id v9 = (id)v8;
  objc_msgSend(v6, sel_tipViewed_collectionIdentifier_, v7);
}

void *sub_2179D2AB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2179D2EB8();
  swift_bridgeObjectRetain();
  id v5 = sub_2179CB8D0(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2179D2B28(id *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(*a1, sel_identifier);
  uint64_t v6 = sub_2179E2930();
  uint64_t v8 = v7;

  if (a3)
  {
    if (v6 == a2 && v8 == a3) {
      LOBYTE(a3) = 1;
    }
    else {
      LOBYTE(a3) = sub_2179E2D50();
    }
  }
  swift_bridgeObjectRelease();
  return a3 & 1;
}

void *sub_2179D2BD0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v4 = sub_2179D2EB8();
  swift_bridgeObjectRetain();
  id v5 = sub_2179CBA74(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_2179D2C4C(uint64_t a1, uint64_t a2)
{
}

id sub_2179D2C58(uint64_t a1, uint64_t a2)
{
  return sub_2179D2C64(a1, a2, (SEL *)&selRef_userGuideWithIdentifier_);
}

id sub_2179D2C64(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v5 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (a2) {
    uint64_t v6 = (void *)sub_2179E2900();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v5, *a3, v6);

  return v7;
}

void sub_2179D2CD0(uint64_t a1, uint64_t a2)
{
}

void sub_2179D2CDC(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v5 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (a2) {
    uint64_t v6 = sub_2179E2900();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [v5 *a3];
}

uint64_t sub_2179D2D48(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA6850);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2179E1BE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  id v10 = objc_msgSend(a1, sel_language);
  uint64_t v11 = sub_2179E2930();
  uint64_t v13 = v12;

  id v14 = objc_msgSend(a1, sel_assetFileInfoManager);
  id v15 = sub_2179D2438(a2, (uint64_t)v8, v11, v13, (uint64_t)v14);
  swift_bridgeObjectRelease();

  sub_21798B28C((uint64_t)v8, (uint64_t *)&unk_267BA6850);
  uint64_t v16 = sub_2179D4090(v15, a3);

  return v16;
}

uint64_t sub_2179D2EB8()
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (*v1)
  {
    swift_getKeyPath();
    id v3 = v2;
    sub_2179E1930();
    swift_release();
    unint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
    swift_beginAccess();
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain_n();
    id v5 = v3;
    MEMORY[0x21D451AA0]();
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2179E29F0();
    }
    sub_2179E2A00();
    sub_2179E29E0();
    uint64_t v6 = v9;

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    sub_2179E1930();
    swift_release();
    uint64_t v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
    swift_beginAccess();
    uint64_t v6 = *v7;
    swift_bridgeObjectRetain();
  }
  return v6;
}

id sub_2179D30B8()
{
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1920();
  swift_release();
  swift_getKeyPath();
  sub_2179E1920();
  swift_release();
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_removeAllContent);
}

id TipsContentModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsContentModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall TipsContentModel.appControllerContentUpdated(_:)(TPSAppController *a1)
{
  objc_super v2 = [(TPSAppController *)a1 collections];
  if (v2)
  {
    id v3 = v2;
    sub_217986C94(0, (unint64_t *)&unk_267BA6868);
    sub_2179E29D0();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1920();
  swift_release();
  swift_bridgeObjectRelease();
  id v5 = [(TPSAppController *)a1 featuredCollection];
  uint64_t v6 = swift_getKeyPath();
  MEMORY[0x270FA5388](v6);
  sub_2179E1920();
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
  sub_2179D4444();
  sub_2179E1A90();
}

Swift::Void __swiftcall TipsContentModel.appController(_:loadingContent:)(TPSAppController *_, Swift::Bool loadingContent)
{
  if (loadingContent)
  {
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
    sub_2179E1920();
LABEL_7:
    swift_release();
    goto LABEL_8;
  }
  id v5 = [(TPSAppController *)_ lastFetchError];
  if (v5)
  {
    uint64_t v6 = v5;
    sub_2179E2700();
    if ((sub_2179E26E0() & 1) == 0) {
      sub_2179E26F0();
    }
    uint64_t v7 = swift_getKeyPath();
    MEMORY[0x270FA5388](v7);
    sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
    sub_2179E1920();

    goto LABEL_7;
  }
LABEL_8:
  swift_getKeyPath();
  sub_2179D3E28(&qword_26ACF69C0, (void (*)(uint64_t))type metadata accessor for TipsContentModel);
  sub_2179E1930();
  swift_release();
  uint64_t v8 = (unsigned char *)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
  swift_beginAccess();
  if (*v8 == 1 && !loadingContent)
  {
    uint64_t v9 = swift_getKeyPath();
    MEMORY[0x270FA5388](v9);
    sub_2179E1920();
    swift_release();
  }
  uint64_t v10 = swift_getKeyPath();
  MEMORY[0x270FA5388](v10);
  sub_2179E1920();
  swift_release();
}

Swift::Void __swiftcall TipsContentModel.appControllerNetworkStateDidChange(toReachable:)(TPSAppController *toReachable)
{
}

Swift::Void __swiftcall TipsContentModel.appControllerUserUpdatedSavedTips(_:)(TPSAppController *a1)
{
}

uint64_t sub_2179D3B9C()
{
  return sub_2179E1A90();
}

void sub_2179D3BEC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF74C8);
  sub_2179D4444();
  sub_2179E1A90();
}

void _s6TipsUI0A12ContentModelC14overrideWidget4withySo6TPSTipC_tF_0(uint64_t a1)
{
  if (objc_msgSend(self, sel_isInternalBuild))
  {
    id v2 = sub_2179D17A4();
    objc_msgSend(v2, sel_attemptWidgetUpdateWith_, a1);
  }
}

unint64_t sub_2179D3CF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA68E0);
  uint64_t v2 = sub_2179E2D10();
  id v3 = (void *)v2;
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
    sub_21798B2E8(v6, (uint64_t)&v15, &qword_267BA62E8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2179D3ED0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21799FA78(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2179D3E28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2179D3E70()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179D3EA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_2179D3ED0(uint64_t a1, uint64_t a2)
{
  sub_2179E2E00();
  sub_2179E2960();
  uint64_t v4 = sub_2179E2E30();

  return sub_2179D3F48(a1, a2, v4);
}

unint64_t sub_2179D3F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_2179E2D50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_2179E2D50() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_2179E2D50()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_2179D4090(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BC8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  char v10 = (char *)&v36 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  BOOL v13 = (char *)&v36 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v39 = v7;
  if (a1)
  {
    id v16 = objc_msgSend(a1, sel_cacheIdentifierForType_, 1);
    if (v16)
    {
      long long v17 = v16;
      uint64_t v37 = sub_2179E2930();
      uint64_t v38 = v18;
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
    }
    uint64_t v20 = self;
    id v21 = a1;
    id v22 = objc_msgSend(v20, sel_assetPathFromAssetConfiguration_type_, v21, 1);
    if (v22)
    {
      id v23 = v22;
      sub_2179E2930();

      sub_2179E17E0();
      swift_bridgeObjectRelease();
      uint64_t v24 = 2 * (a2 == 2);
      goto LABEL_11;
    }

    uint64_t v19 = v38;
    uint64_t v7 = v39;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v37 = 0;
  }
  uint64_t v25 = sub_2179E1810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
  if (!a1)
  {
LABEL_16:
    uint64_t v32 = sub_2179E1810();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v13, 1, 1, v32);
    goto LABEL_17;
  }
  uint64_t v38 = v19;
  uint64_t v24 = 2 * (a2 == 2);
  id v21 = a1;
LABEL_11:
  id v26 = objc_msgSend(v21, sel_cacheIdentifierForType_, v24);
  if (v26)
  {
    uint64_t v27 = v26;
    sub_2179E2930();
  }
  uint64_t v28 = self;
  id v29 = v21;
  id v30 = objc_msgSend(v28, (SEL)&selRef_removeObject_ + 1, v29, v24);
  if (!v30)
  {

    uint64_t v7 = v39;
    goto LABEL_16;
  }
  uint64_t v31 = v30;
  sub_2179E2930();

  sub_2179E17E0();
  swift_bridgeObjectRelease();
  uint64_t v7 = v39;
LABEL_17:
  sub_21798B2E8((uint64_t)v15, (uint64_t)v10, &qword_26ACF6BC8);
  sub_21798B2E8((uint64_t)v13, (uint64_t)v7, &qword_26ACF6BC8);
  id v33 = objc_allocWithZone((Class)sub_2179E26D0());
  uint64_t v34 = sub_2179E2690();
  sub_21798B28C((uint64_t)v13, &qword_26ACF6BC8);
  sub_21798B28C((uint64_t)v15, &qword_26ACF6BC8);
  return v34;
}

unint64_t sub_2179D4444()
{
  unint64_t result = qword_267BA6860;
  if (!qword_267BA6860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF74C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6860);
  }
  return result;
}

id sub_2179D44C8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t sub_2179D4530@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2179D458C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_2179D45E8@<X0>(void *a1@<X8>)
{
  id result = sub_2179D17A4();
  *a1 = result;
  return result;
}

void sub_2179D4614(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v4 = *(id *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  *(void *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = *a1;
  id v3 = v2;
}

uint64_t sub_2179D4664()
{
  return type metadata accessor for TipsContentModel();
}

uint64_t method lookup function for TipsContentModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipsContentModel);
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TipsContentModel.loading.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TipsContentModel.loading.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TipsContentModel.loading.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of TipsContentModel.collections.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of TipsContentModel.collections.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of TipsContentModel.collections.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of TipsContentModel.mainUserGuide.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of TipsContentModel.savedTipsCollection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of TipsContentModel.isCurrentCollectionSavedTips.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x340))();
}

uint64_t dispatch thunk of TipsContentModel.assetSizes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of TipsContentModel.updateContent(alwaysShowIntro:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of TipsContentModel.updateSavedTipsContent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of TipsContentModel.fetchTipAssetsInfo(for:userInterfaceStyle:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of TipsContentModel.startTipsPrefetchFrom(tip:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x368))();
}

uint64_t dispatch thunk of TipsContentModel.cancelTipsPrefetch()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x370))();
}

uint64_t dispatch thunk of TipsContentModel.assetConfiguration(for:assets:updatedColorScheme:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of TipsContentModel.assetConfiguration(assets:updatedColorScheme:language:assetFileInfoManager:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of TipsContentModel.assetURL(for:type:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of TipsContentModel.tip(forIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of TipsContentModel.tip(forIdentifier:inCollectionIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of TipsContentModel.tips(forCollectionIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of TipsContentModel.tipViewed(_:collectionIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of TipsContentModel.collection(forCollectionIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of TipsContentModel.collection(forTipIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of TipsContentModel.collectionIdentifierViewed(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of TipsContentModel.userGuide(forBookIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of TipsContentModel.removeNotificationForIdentifier(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of TipsContentModel.assetsInfo(for:assets:imageType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of TipsContentModel.assetsInfo(for:imageType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of TipsContentModel.removeAllContent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F0))();
}

uint64_t sub_2179D55EC(void *a1)
{
  char v2 = *(unsigned char *)(v1 + 24);
  id v3 = (unsigned char *)(*(void *)(v1 + 16) + *a1);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_2179D5648()
{
  char v1 = *(unsigned char *)(v0 + 24);
  char v2 = (unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  uint64_t result = swift_beginAccess();
  *char v2 = v1;
  return result;
}

uint64_t sub_2179D56A8()
{
  return sub_2179CC228();
}

void sub_2179D56C0()
{
}

void sub_2179D56D8()
{
}

uint64_t sub_2179D56F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D568]);
}

double EnvironmentValues.backgroundViewOpacity.getter()
{
  sub_217991734();
  sub_2179E1E20();
  return v1;
}

uint64_t EnvironmentValues.backgroundViewOpacity.setter()
{
  return sub_2179E1E30();
}

uint64_t (*EnvironmentValues.backgroundViewOpacity.modify(uint64_t a1))(void *a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_217991734();
  sub_2179E1E20();
  return sub_2179D57D4;
}

uint64_t sub_2179D57D4(void *a1)
{
  a1[1] = *a1;
  return sub_2179E1E30();
}

uint64_t View.backgroundViewOpacity(_:)()
{
  return swift_release();
}

uint64_t sub_2179D5898()
{
  return swift_getWitnessTable();
}

unint64_t sub_2179D5908()
{
  unint64_t result = qword_267BA6958;
  if (!qword_267BA6958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA6950);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6958);
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundViewOpacityKey()
{
  return &type metadata for BackgroundViewOpacityKey;
}

unint64_t SearchResult.Item.Category.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 3;
  if (result < 3) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t SearchResult.Item.Category.rawValue.getter()
{
  return *v0;
}

unint64_t sub_2179D5990@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return SearchResult.Item.Category.init(rawValue:)(*a1, a2);
}

void sub_2179D5998(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t SearchResult.Item.category.getter@<X0>(char *a1@<X8>)
{
  uint64_t result = sub_2179E25D0();
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
    if (v4 == sub_2179E2B70() && v5 == v6)
    {
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t result = swift_bridgeObjectRelease();
      char v9 = 1;
      goto LABEL_11;
    }
    char v8 = sub_2179E2D50();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_10;
    }
    sub_2179E2760();
    if (v4 == sub_2179E2720() && v5 == v10)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      char v9 = 2;
    }
    else
    {
      char v11 = sub_2179E2D50();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v11) {
        char v9 = 2;
      }
      else {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }
LABEL_11:
  *a1 = v9;
  return result;
}

uint64_t sub_2179D5ADC@<X0>(void *a1@<X8>)
{
  return sub_2179D5DAC(a1);
}

uint64_t sub_2179D5AF0()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2179D5B4C(v0);
}

uint64_t sub_2179D5B1C()
{
  return sub_2179D5E68();
}

uint64_t sub_2179D5B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, sub_2179D5B4C);
}

uint64_t sub_2179D5B4C(uint64_t a1)
{
  return sub_2179D5F04(a1, (uint64_t)&unk_2179E6F90, (uint64_t)&unk_2179E6FB8, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (void (*)(void (*)(), uint64_t))sub_2179DF0D0);
}

void (*sub_2179D5B7C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  v3[6] = *v3;
  return sub_2179D5C28;
}

void sub_2179D5C28(uint64_t a1, char a2)
{
}

uint64_t sub_2179D5C58()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179D5C6C(uint64_t a1)
{
  return sub_2179D64D0(a1, &qword_26ACF6AC8, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_26ACF7510);
}

uint64_t (*sub_2179D5C88(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179D5D98@<X0>(void *a1@<X8>)
{
  return sub_2179D5DAC(a1);
}

uint64_t sub_2179D5DAC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2179D5E28()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2179D5ED4(v0);
}

uint64_t sub_2179D5E54()
{
  return sub_2179D5E68();
}

uint64_t sub_2179D5E68()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179D5ED4(uint64_t a1)
{
  return sub_2179D5F04(a1, (uint64_t)&unk_2179E6FD8, (uint64_t)&unk_2179E7000, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (void (*)(void (*)(), uint64_t))sub_2179DF0D0);
}

uint64_t sub_2179D5F04(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void (*)(), uint64_t))
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AF0();
  uint64_t v8 = v5 + *a4;
  uint64_t result = swift_beginAccess();
  uint64_t v10 = *(void (**)())v8;
  if (*(void *)v8)
  {
    uint64_t v11 = *(void *)(v8 + 8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    v10();
    a5(v10, v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*sub_2179D6024(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  v3[6] = *v3;
  return sub_2179D60D0;
}

void sub_2179D60D0(uint64_t a1, char a2)
{
}

void sub_2179D6100(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void (*)(void), uint64_t))
{
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(*(void *)a1 + 48);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v10 = v8[7];
  void *v8 = v9;
  swift_retain();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2179E1AF0();
    uint64_t v11 = v10 + *a5;
    swift_beginAccess();
    uint64_t v12 = *(void (**)(void))v11;
    if (*(void *)v11)
    {
      uint64_t v13 = *(void *)(v11 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2179E1AE0();
      swift_release();
      swift_release();
      v12(*v8);
      a6(v12, v13);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2179E1AF0();
    uint64_t v14 = v10 + *a5;
    swift_beginAccess();
    uint64_t v15 = *(void (**)(void))v14;
    if (!*(void *)v14) {
      goto LABEL_8;
    }
    uint64_t v16 = *(void *)(v14 + 8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    v15(v8[3]);
    a6(v15, v16);
  }
  swift_bridgeObjectRelease();
LABEL_8:

  free(v8);
}

uint64_t sub_2179D6324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2179D64A0()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_26ACF6AD0);
}

uint64_t sub_2179D64B4(uint64_t a1)
{
  return sub_2179D64D0(a1, &qword_26ACF6AB8, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_26ACF6AD0);
}

uint64_t sub_2179D64D0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2179D6600(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AB8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AD0);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179D6710@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DF0DC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D67B0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DF140;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D6878()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D6898(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D68B8())()
{
  return j_j__swift_endAccess;
}

void *sub_2179D6914()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  char v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_2179D6964(void *a1)
{
  sub_2179DD3A0(a1);
}

void (*sub_2179D699C(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2179D6A08;
}

void sub_2179D6A08(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    *id v3 = v4;
    id v5 = v4;
    swift_retain();
    sub_2179E1A60();
    swift_release();
  }

  free(v3);
}

char *sub_2179D6A80()
{
  uint64_t v1 = sub_2179E2820();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v5 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  uint64_t v6 = (char *)*v5;
  if (*v5)
  {
    uint64_t v7 = &v6[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
    swift_beginAccess();
    (*(void (**)(unsigned char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    uint64_t v8 = v6;
    uint64_t v6 = (char *)sub_2179E2800();
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

BOOL sub_2179D6BE0()
{
  return sub_2179D6C08();
}

BOOL sub_2179D6BF4()
{
  return sub_2179D6C08();
}

BOOL sub_2179D6C08()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_2179D6CC0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v0) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v2 != 0;
}

BOOL sub_2179D6E18()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2179E2820();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void **)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  uint64_t v7 = (char *)*v6;
  if (*v6)
  {
    uint64_t v8 = &v7[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = v7;
    uint64_t v10 = sub_2179E2800();
    unint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

    uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v14 = v13;
  }
  if (!v14) {
    return 0;
  }
  uint64_t v15 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  swift_beginAccess();
  return *v15 > 0;
}

uint64_t sub_2179D6FC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DEE0C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7064(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DECC8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D712C()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D714C(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D716C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D71C8@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179AA9FC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7268(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DF0C8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7330()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted, (void (*)(void, void))sub_2179902A4);
}

uint64_t sub_2179D7350(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted, (uint64_t (*)(uint64_t, uint64_t))sub_21798E45C);
}

uint64_t (*sub_2179D7370())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D73CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DED90;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D746C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DED8C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7534()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D7554(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D7574())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D75D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DED90;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7670(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DED8C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7738()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D7758(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D7778())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D77D4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DED90;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7874(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DED8C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D793C()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D795C(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D797C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D79D8@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179AA9FC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7A78(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DF0C8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7B40()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler, (void (*)(void, void))sub_2179902A4);
}

uint64_t sub_2179D7B60(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21798E45C);
}

uint64_t (*sub_2179D7B80())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D7BDC@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179A4E30;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7C7C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DED2C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7D44()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated, (void (*)(void, void))sub_2179902A4);
}

uint64_t sub_2179D7D64(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_21798E45C);
}

uint64_t (*sub_2179D7D84())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D7DE0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DF0D8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D7E80(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DF140;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D7F48()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D7F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, sub_2179D5ED4);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

uint64_t sub_2179D7FB8(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D7FD8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D8034@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DED00;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D80D4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DECC8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D819C()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D81BC(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t (*sub_2179D81DC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2179D8238@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DECA0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D82D8(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_2179DEC78;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2179902A4(v3);
  return sub_21798E45C(v8);
}

uint64_t sub_2179D83A0()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler, (void (*)(void, void))sub_2179DF0D4);
}

uint64_t sub_2179D83C0(uint64_t a1, uint64_t a2)
{
  return sub_2179D83E0(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler, (uint64_t (*)(uint64_t, uint64_t))sub_2179DF0D0);
}

uint64_t sub_2179D83E0(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_2179D8444())()
{
  return j__swift_endAccess;
}

uint64_t sub_2179D84A0@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2179DECA0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2179902A4(v4);
}

uint64_t sub_2179D8540(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_2179DEC78;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_2179902A4(v1);
  sub_2179DD430((uint64_t)v4, v3);

  return sub_21798E45C((uint64_t)v4);
}

void sub_2179D85E8(void *a1)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_2179D86E0(a1);
    swift_release();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
    swift_beginAccess();
    uint64_t v4 = (void (*)(void **))*v3;
    sub_2179902A4(*v3);
    swift_release();
    if (v4)
    {
      uint64_t v6 = a1;
      char v7 = 1;
      id v5 = a1;
      v4(&v6);
      sub_21798E45C((uint64_t)v4);
    }
  }
}

uint64_t sub_2179D86E0(void *a1)
{
  uint64_t v24 = a1;
  uint64_t v2 = sub_2179E24A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2179E24D0();
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2179E24B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery);
  if (v14)
  {
    sub_217986C94(0, (unint64_t *)&qword_26ACF75D0);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x263F8F040], v9);
    id v15 = v14;
    uint64_t v23 = v6;
    id v16 = v15;
    uint64_t v17 = (void *)sub_2179E2B30();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v18 = swift_allocObject();
    uint64_t v19 = v24;
    *(void *)(v18 + 16) = v16;
    *(void *)(v18 + 24) = v19;
    aBlock[4] = sub_2179DF0C0;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2179911FC;
    aBlock[3] = &block_descriptor_168;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = v16;
    id v22 = v19;
    sub_2179E24C0();
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_2179CE4DC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
    sub_21798D884((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
    sub_2179E2C20();
    MEMORY[0x21D451C00](0, v8, v5, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v23);
    return swift_release();
  }
  return result;
}

void sub_2179D8A78(void *a1)
{
  swift_beginAccess();
  if (swift_weakLoadStrong()) {
    swift_release();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
    swift_beginAccess();
    uint64_t v4 = (void (*)(void **))*v3;
    sub_2179902A4(*v3);
    swift_release();
    if (v4)
    {
      uint64_t v6 = a1;
      char v7 = 0;
      id v5 = a1;
      v4(&v6);
      sub_21798E45C((uint64_t)v4);
    }
  }
}

uint64_t sub_2179D8B5C()
{
  return sub_2179D8B7C(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected, (void (*)(void, void))sub_2179902A4);
}

uint64_t sub_2179D8B7C(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_2179D8BE4(uint64_t a1, uint64_t a2)
{
  sub_2179DD430(a1, a2);

  return sub_21798E45C(a1);
}

void (*sub_2179D8C2C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[6] = v1;
  swift_beginAccess();
  return sub_2179D8C98;
}

void sub_2179D8C98(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[6];
    uint64_t v5 = swift_allocObject();
    swift_weakInit();
    uint64_t v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
    swift_beginAccess();
    uint64_t v7 = *v6;
    uint64_t *v6 = (uint64_t)sub_2179DD5A4;
    v6[1] = v5;
    sub_21798E45C(v7);
    uint64_t v8 = swift_allocObject();
    swift_weakInit();
    uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
    swift_beginAccess();
    uint64_t v10 = *v9;
    *uint64_t v9 = (uint64_t)sub_2179DD5AC;
    v9[1] = v8;
    sub_21798E45C(v10);
  }

  free(v3);
}

uint64_t sub_2179D8DB4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_2179D8DFC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2179D8E48())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchResultsModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SearchResultsModel.init()();
  return v0;
}

uint64_t SearchResultsModel.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2179E1890();
  uint64_t v48 = *(void *)(v2 - 8);
  uint64_t v49 = v2;
  MEMORY[0x270FA5388](v2);
  int v47 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_2179E2820();
  uint64_t v4 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AD0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v52 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF75B8);
  sub_2179E1AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  uint64_t v16 = v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  uint64_t v52 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6B78);
  sub_2179E1AA0();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v16, v9, v6);
  uint64_t v17 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  *uint64_t v17 = 0;
  v17[1] = 0;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery) = 0;
  uint64_t v18 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v19 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  *uint64_t v20 = 0;
  v20[1] = 0;
  id v21 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  *id v21 = 0;
  v21[1] = 0;
  id v22 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  *id v22 = 0;
  v22[1] = 0;
  uint64_t v23 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  *uint64_t v23 = 0;
  v23[1] = 0;
  uint64_t v24 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  *uint64_t v24 = 0;
  v24[1] = 0;
  uint64_t v25 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  void *v25 = 0;
  v25[1] = 0;
  uint64_t v26 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  *uint64_t v26 = 0;
  v26[1] = 0;
  uint64_t v27 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  void *v27 = 0;
  v27[1] = 0;
  uint64_t v28 = (void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  *uint64_t v28 = 0;
  v28[1] = 0;
  uint64_t v29 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuerySubject;
  id v30 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  uint64_t v31 = (char *)objc_allocWithZone(v30);
  uint64_t v32 = &v31[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  id v33 = v31;
  uint64_t v34 = v45;
  sub_2179E27E0();
  uint64_t v35 = v34;
  uint64_t v36 = v46;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v32, v35, v46);
  uint64_t v37 = &v33[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(void *)&v33[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v32, v36);
  sub_2179E27E0();
  swift_endAccess();
  swift_beginAccess();
  *(void *)uint64_t v37 = 0;
  uint64_t v38 = v47;
  sub_2179E1880();
  uint64_t v39 = sub_2179E1870();
  uint64_t v41 = v40;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v38, v49);
  uint64_t v42 = (uint64_t *)&v33[OBJC_IVAR___TPSAppSearchQuery_identifier];
  uint64_t *v42 = v39;
  v42[1] = v41;

  v51.receiver = v33;
  v51.super_class = v30;
  id v50 = objc_msgSendSuper2(&v51, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AA8);
  swift_allocObject();
  *(void *)(v1 + v29) = sub_2179E1A70();
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_cancellables) = MEMORY[0x263F8EE88];
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount) = 0;
  sub_2179D9714();
  return v1;
}

void sub_2179D9424()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  swift_beginAccess();
  *uint64_t v1 = 0;
  sub_2179D9484();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults);
  *(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults) = 0;
}

uint64_t sub_2179D9484()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AF0();
  uint64_t v2 = (void (**)())(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (*v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    v3();
    sub_21798E45C((uint64_t)v3);
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2179E1AF0();
  uint64_t v4 = (void (**)())(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    v6();
    sub_21798E45C((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2179D9714()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AB8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v52 = v1;
  uint64_t v53 = v2;
  MEMORY[0x270FA5388](v1);
  uint64_t v49 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AC8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  int v47 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A40);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  uint64_t v55 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v48 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6BB0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_2179E2BF0();
  uint64_t v13 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A98);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v41 = v16;
  uint64_t v42 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A88);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v43 = v20;
  uint64_t v44 = v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6A68);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v45 = v24;
  uint64_t v46 = v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = *(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuerySubject);
  swift_retain();
  sub_2179E2BD0();
  id v57 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v28 = sub_2179E2BC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 1, 1, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AA8);
  sub_217986C94(0, &qword_26ACF6BC0);
  sub_21798D884(&qword_26ACF6AA0, &qword_26ACF6AA8);
  sub_2179A4E58();
  sub_2179E1B70();
  sub_21798B28C((uint64_t)v12, &qword_26ACF6BB0);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v40);
  swift_release();
  sub_21798D884(&qword_26ACF6A90, &qword_26ACF6A98);
  uint64_t v29 = v41;
  sub_2179E1B50();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v29);
  swift_allocObject();
  swift_weakInit();
  type metadata accessor for TPSAppSearchQuery();
  sub_21798D884(&qword_26ACF6A80, &qword_26ACF6A88);
  uint64_t v30 = v43;
  sub_2179E1B20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v30);
  swift_allocObject();
  swift_weakInit();
  sub_21798D884(&qword_26ACF6A60, &qword_26ACF6A68);
  uint64_t v31 = v45;
  sub_2179E1B80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v31);
  swift_beginAccess();
  sub_2179E1A30();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  uint64_t v32 = v47;
  sub_2179E1AB0();
  swift_endAccess();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AD0);
  id v33 = v49;
  sub_2179E1AB0();
  swift_endAccess();
  sub_21798D884(&qword_26ACF6AC0, &qword_26ACF6AC8);
  sub_21798D884(&qword_26ACF6AB0, &qword_26ACF6AB8);
  uint64_t v34 = v48;
  uint64_t v35 = v50;
  uint64_t v36 = v52;
  sub_2179E1B40();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v33, v36);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v35);
  swift_allocObject();
  swift_weakInit();
  sub_21798D884(&qword_26ACF6A38, &qword_26ACF6A40);
  uint64_t v37 = v54;
  sub_2179E1B80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v37);
  swift_beginAccess();
  sub_2179E1A30();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2179DA030(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_2179E2820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *a2;
  if (*a1)
  {
    uint64_t v9 = *a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
    swift_beginAccess();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
    uint64_t v10 = sub_2179E2800();
    uint64_t v12 = v11;
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    if (!v8)
    {
      if (!v12) {
        goto LABEL_17;
      }
LABEL_14:
      char v18 = 0;
LABEL_19:
      swift_bridgeObjectRelease();
      return v18 & 1;
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v12 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v13 = v8 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  uint64_t v14 = sub_2179E2800();
  uint64_t v16 = v15;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  if (v12)
  {
    if (v16)
    {
      if (v10 == v14 && v12 == v16)
      {
        swift_bridgeObjectRelease();
        char v18 = 1;
      }
      else
      {
        char v18 = sub_2179E2D50();
        swift_bridgeObjectRelease();
      }
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (v16)
  {
    char v18 = 0;
    goto LABEL_19;
  }
LABEL_17:
  char v18 = 1;
  return v18 & 1;
}

id sub_2179DA24C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_2179E2820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  if (!*a1) {
    goto LABEL_8;
  }
  uint64_t v9 = (uint64_t)v8 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  uint64_t v17 = v8;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  uint64_t v10 = sub_2179E2800();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v13 = v17;
  uint64_t v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v14 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (v14)
  {
    *a2 = v17;
    return v13;
  }
  else
  {
LABEL_8:
    swift_beginAccess();
    id result = (id)swift_weakLoadStrong();
    if (result)
    {
      sub_2179D9484();
      id result = (id)swift_release();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t sub_2179DA404(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    SearchResultsModel.query(searchQuery:)(v1);
    return swift_release();
  }
  return result;
}

uint64_t SearchResultsModel.query(searchQuery:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6270);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2179E2820();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2179E2570();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2179E2550();
  strcpy((char *)v26, "SearchTerm: ");
  HIBYTE(v26[6]) = 0;
  v26[7] = -5120;
  uint64_t v25 = a1;
  uint64_t v15 = (uint64_t)a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v15, v7);
  sub_2179E2800();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2179E2980();
  swift_bridgeObjectRelease();
  sub_2179E2840();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = (void *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  uint64_t result = swift_beginAccess();
  if (__OFADD__(*v16, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v16;
    uint64_t v18 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask;
    if (*(void *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask))
    {
      swift_retain();
      sub_2179E2A90();
      swift_release();
    }
    uint64_t v19 = sub_2179E2A80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
    uint64_t v20 = swift_allocObject();
    swift_weakInit();
    uint64_t v21 = (void *)swift_allocObject();
    void v21[2] = 0;
    v21[3] = 0;
    uint64_t v22 = v25;
    v21[4] = v25;
    v21[5] = v20;
    id v23 = v22;
    *(void *)(v2 + v18) = sub_2179DB8D4((uint64_t)v6, (uint64_t)&unk_267BA6970, (uint64_t)v21);
    return swift_release();
  }
  return result;
}

uint64_t sub_2179DA7F0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = (uint64_t *)(result + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
    swift_beginAccess();
    uint64_t v2 = (void (*)(uint64_t))*v1;
    sub_2179902A4(*v1);
    uint64_t result = swift_release();
    if (v2)
    {
      v2(result);
      return sub_21798E45C((uint64_t)v2);
    }
  }
  return result;
}

uint64_t sub_2179DA894(uint64_t a1, uint64_t a2)
{
  return sub_2179DA8E4(a1, a2, (uint64_t)&unk_2179E6F90, (uint64_t)&unk_2179E6FB8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2179DD08C);
}

uint64_t sub_2179DA8BC(uint64_t a1, uint64_t a2)
{
  return sub_2179DA8E4(a1, a2, (uint64_t)&unk_2179E6FD8, (uint64_t)&unk_2179E7000, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2179DD234);
}

uint64_t sub_2179DA8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v8 = a5(v10, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_2179DA9A0(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  if (!a2) {
    goto LABEL_11;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2179DD08C(v13, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v7)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2179DD234(v13, a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7)
    {
      uint64_t v11 = (void (**)(void *))(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
      swift_beginAccess();
      uint64_t v12 = *v11;
      if (*v11)
      {
        swift_retain();
        v12(v7);
        sub_21798E45C((uint64_t)v12);
      }
      char v10 = 2;
      goto LABEL_10;
    }
LABEL_11:
    char v10 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = (void (**)(void *))(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  uint64_t v9 = *v8;
  if (*v8)
  {
    swift_retain();
    v9(v7);
    sub_21798E45C((uint64_t)v9);
  }
  char v10 = 1;
LABEL_10:

LABEL_12:
  *a3 = v10;
}

uint64_t SearchResultsModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler));

  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler));
  sub_21798E45C(*(void *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t SearchResultsModel.__deallocating_deinit()
{
  SearchResultsModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2179DADEC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SearchResultsModel();
  uint64_t result = sub_2179E2C70();
  *a1 = result;
  return result;
}

uint64_t sub_2179DAE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a4;
  v5[14] = a5;
  uint64_t v6 = sub_2179E2A40();
  v5[15] = v6;
  v5[16] = *(void *)(v6 - 8);
  v5[17] = swift_task_alloc();
  uint64_t v7 = sub_2179E2570();
  v5[18] = v7;
  v5[19] = *(void *)(v7 - 8);
  v5[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6270);
  v5[21] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v5[22] = v8;
  void *v8 = v5;
  v8[1] = sub_2179DAFAC;
  return sub_21799BDE4();
}

uint64_t sub_2179DAFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 184) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_2179DB2AC;
  }
  else
  {
    *(void *)(v6 + 192) = a2;
    *(void *)(v6 + 200) = a1;
    uint64_t v7 = sub_2179DB0E0;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_2179DB0E0()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[25];
  uint64_t v3 = v0[21];
  uint64_t v4 = (void *)v0[13];
  uint64_t v5 = sub_2179E2A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  uint64_t v6 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_2179E2A60();
  swift_retain();
  id v7 = v2;
  id v8 = v1;
  id v9 = v4;
  uint64_t v10 = sub_2179E2A50();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v11[7] = v9;
  swift_release();
  sub_2179DB8D4(v3, (uint64_t)&unk_267BA69A0, (uint64_t)v11);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2179DB2AC()
{
  uint64_t v1 = *(void **)(v0 + 184);
  *(void *)(v0 + 88) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA62C0);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v5 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = *(void **)(v0 + 88);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v9 = *(void *)(v0 + 144);

    sub_2179E2550();
    sub_2179E2C50();
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    sub_2179E2DA0();
    sub_2179E2980();
    swift_bridgeObjectRelease();
    sub_2179E2980();
    sub_2179E2850();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    uint64_t v11 = *(void **)(v0 + 184);
    if (Strong)
    {
      sub_2179D9484();

      swift_release();
      goto LABEL_7;
    }
    uint64_t v6 = *(void **)(v0 + 184);
  }

LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_2179DB4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[16] = a6;
  v7[17] = a7;
  v7[14] = a4;
  v7[15] = a5;
  sub_2179E2A60();
  v7[18] = sub_2179E2A50();
  uint64_t v9 = sub_2179E2A10();
  return MEMORY[0x270FA2498](sub_2179DB56C, v9, v8);
}

uint64_t sub_2179DB56C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    uint64_t v3 = v0 + 5;
    uint64_t v4 = (void *)v0[15];
    uint64_t v5 = *(void **)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults);
    *(void *)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults) = v4;
    id v6 = v4;

    unint64_t v7 = sub_2179E2650();
    unint64_t v8 = sub_2179E2650();
    sub_2179DCA84(v8);
    swift_retain();
    uint64_t v9 = sub_2179DCF48(MEMORY[0x263F8EE78], MEMORY[0x263F8EE78], v7, v2);
    uint64_t v11 = v10;
    swift_release();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    v0[5] = v9;
    swift_retain();
    sub_2179E1AF0();
    uint64_t v12 = (void (**)(void))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
    swift_beginAccess();
    unint64_t v13 = *v12;
    if (*v12)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2179E1AE0();
      swift_release();
      swift_release();
      v13(*v3);
      sub_21798E45C((uint64_t)v13);
      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *uint64_t v3 = v11;
    swift_retain();
    sub_2179E1AF0();
    uint64_t v14 = (void (**)(void))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if (*v14)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2179E1AE0();
      swift_release();
      swift_release();
      v15(v0[11]);
      sub_21798E45C((uint64_t)v15);
      swift_bridgeObjectRelease();
    }
    uint64_t v16 = (void *)v0[17];
    uint64_t v17 = (void *)v0[15];
    uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery);
    *(void *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery) = v16;
    id v19 = v16;

    sub_2179DD6BC(v17, (uint64_t)v19);
    uint64_t v20 = (void (**)(uint64_t))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
    swift_beginAccess();
    uint64_t v21 = *v20;
    if (*v20)
    {
      uint64_t v22 = swift_retain();
      v21(v22);
      sub_21798E45C((uint64_t)v21);
    }
    swift_release();
  }
  id v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_2179DB8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2179E2A80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2179E2A70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21798B28C(a1, &qword_267BA6270);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2179E2A10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall SearchResultsModel.updateSearchQuery(text:identifier:)(Swift::String text, Swift::String_optional identifier)
{
  uint64_t v3 = v2;
  object = identifier.value._object;
  uint64_t countAndFlagsBits = identifier.value._countAndFlagsBits;
  uint64_t v6 = text._object;
  uint64_t v7 = text._countAndFlagsBits;
  uint64_t v8 = sub_2179E2820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (id *)(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  unint64_t v13 = (char *)*v12;
  uint64_t v32 = countAndFlagsBits;
  uint64_t v33 = (uint64_t)object;
  if (v13)
  {
    uint64_t v14 = &v13[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
    uint64_t v15 = v13;
    uint64_t v16 = sub_2179E2800();
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    if (v16 != v7) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v18 = 0xE000000000000000;
    if (v7) {
      goto LABEL_7;
    }
  }
  if ((void *)v18 == v6)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  char v19 = sub_2179E2D50();
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
    uint64_t v24 = (void *)(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
    swift_beginAccess();
    *uint64_t v24 = 0;
    sub_2179D9484();
    uint64_t v25 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults);
    *(void *)(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults) = 0;

    id v26 = objc_allocWithZone((Class)type metadata accessor for TPSAppSearchQuery());
    uint64_t v27 = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v28 = TPSAppSearchQuery.init(searchTerm:origin:identifier:)(v7, (uint64_t)v6, 0, v32, v27);
    id v29 = *v12;
    id *v12 = v28;
    id v30 = v28;

    id v34 = *v12;
    id v31 = v34;
    swift_retain();
    sub_2179E1A60();

    swift_release();
    return;
  }
LABEL_8:
  uint64_t v20 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_lastTipResults);
  if (v20)
  {
    id v21 = *v12;
    if (*v12)
    {
      id v22 = v20;
      id v23 = v21;
      sub_2179DD6BC(v22, (uint64_t)v23);
    }
  }
}

void sub_2179DBD48(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2179E25D0();
  if (!v6) {
    return;
  }
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  sub_217986C94(0, (unint64_t *)&qword_26ACF77C0);
  if (v7 != sub_2179E2B70() || v8 != v9)
  {
    char v11 = sub_2179E2D50();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_9;
    }
    unint64_t v18 = (objc_class *)sub_2179E2760();
    if (v7 == sub_2179E2720() && v8 == v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_2179E2D50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        return;
      }
    }
    sub_2179E25F0();
    sub_2179E25E0();
    id v21 = objc_allocWithZone(v18);
    id v22 = (void *)sub_2179E2710();
    sub_2179E2620();
    sub_2179E2740();
    sub_2179E2610();
    sub_2179E2730();
    unint64_t v24 = a1[1];
    ++a1;
    unint64_t v23 = v24;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_2179E2CD0();
      swift_bridgeObjectRelease();
      if (v27 <= 49) {
        goto LABEL_20;
      }
    }
    else if (*(uint64_t *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 49)
    {
LABEL_20:
      id v17 = v22;
      goto LABEL_21;
    }

    return;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  swift_bridgeObjectRelease();
  uint64_t v12 = (uint64_t (**)(uint64_t))(a3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  unint64_t v13 = *v12;
  if (!*v12) {
    return;
  }
  swift_retain();
  uint64_t v14 = sub_2179E25E0();
  uint64_t v15 = (void *)v13(v14);
  swift_bridgeObjectRelease();
  sub_21798E45C((uint64_t)v13);
  if (!v15) {
    return;
  }
  unint64_t v16 = a1[1];
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
    if (v26 <= 49) {
      goto LABEL_13;
    }
LABEL_25:

    return;
  }
  if (*(uint64_t *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) > 49) {
    goto LABEL_25;
  }
LABEL_13:
  id v17 = v15;
LABEL_21:
  uint64_t v25 = v17;
  MEMORY[0x21D451AA0]();
  if (*(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2179E29F0();
  }
  sub_2179E2A00();
  sub_2179E29E0();
}

void sub_2179DC064(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v9 = sub_2179E2650();
  unint64_t v10 = v9;
  uint64_t v11 = v9 >> 62;
  if (v9 >> 62) {
    goto LABEL_29;
  }
  if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 10) {
    uint64_t v12 = 10;
  }
  else {
    uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0 && v12)
    {
      sub_2179E2640();
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = v13 + 1;
        sub_2179E2C80();
        uint64_t v13 = v14;
      }
      while (v12 != v14);
    }
    if (v11)
    {
      swift_bridgeObjectRetain();
      sub_2179E2CE0();
      uint64_t v11 = v16;
      uint64_t v15 = v17;
      unint64_t v19 = v18;
      swift_bridgeObjectRelease_n();
      uint64_t v12 = v19 >> 1;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v11 = (v10 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    unint64_t v10 = MEMORY[0x263F8EE78];
    unint64_t v34 = MEMORY[0x263F8EE78];
    if (v15 == v12) {
      break;
    }
    swift_unknownObjectRetain();
    unint64_t v10 = 0;
    while (v15 < v12)
    {
      id v33 = *(id *)(v11 + 8 * v15);
      id v4 = v33;
      sub_2179DC518(&v34, (uint64_t)&v33, a2, a3, a1, (unint64_t)a4);

      if (v12 == ++v15)
      {
        swift_unknownObjectRelease();
        unint64_t v10 = v34;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
    if (v28 < 0)
    {
      __break(1u);
      a4 = (void *)v34;
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_42;
    }
    if (v27 >= 10) {
      uint64_t v29 = 10;
    }
    else {
      uint64_t v29 = v27;
    }
    if (v27 >= 0) {
      uint64_t v12 = v29;
    }
    else {
      uint64_t v12 = 10;
    }
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
    if (v30 < v12)
    {
      __break(1u);
      goto LABEL_38;
    }
  }
LABEL_17:
  unint64_t v34 = v10;
  swift_unknownObjectRelease();
  if (!(v10 >> 62))
  {
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_38:
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_2179E2CD0();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_23;
  }
LABEL_19:
  char v20 = (void *)sub_2179E2900();
  id v21 = (void *)sub_2179E2660();
  sub_2179E25B0();

  id v22 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  if ((unint64_t)a4 >= 3)
  {
LABEL_42:
    id v33 = a4;
    sub_2179E2D80();
    __break(1u);
    return;
  }
  sub_2179E2930();
  unint64_t v23 = self;
  unint64_t v24 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v23, sel_eventWithSearchID_searchTerm_invocationMethod_, v20, v22, v24);

  MEMORY[0x21D451AA0]();
  if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2179E29F0();
  }
  sub_2179E2A00();
  sub_2179E29E0();
  unint64_t v10 = v34;
LABEL_23:
  id v26 = objc_msgSend(self, sel_sharedInstance);
  if (v10 >> 62)
  {
    sub_217986C94(0, &qword_267BA6980);
    swift_bridgeObjectRetain();
    sub_2179E2CC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2179E2D60();
    sub_217986C94(0, &qword_267BA6980);
  }
  swift_bridgeObjectRelease();
  sub_217986C94(0, &qword_267BA6980);
  id v32 = (id)sub_2179E29C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_logAnalyticsEvents_, v32);
}

void sub_2179DC518(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (void *)sub_2179E2900();
  unint64_t v9 = (void *)sub_2179E2660();
  sub_2179E25B0();

  unint64_t v10 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  if (a6 < 3)
  {
    sub_2179E2930();
    uint64_t v11 = self;
    uint64_t v12 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v11, sel_eventWithSearchID_searchTerm_invocationMethod_, v8, v10, v12);

    sub_2179E25E0();
    uint64_t v14 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setTipID_, v14);

    sub_2179E2600();
    if (v15)
    {
      uint64_t v16 = (void *)sub_2179E2900();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    objc_msgSend(v13, sel_setCorrelationID_, v16);

    sub_2179E25F0();
    uint64_t v17 = (void *)sub_2179E2900();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setCollectionID_, v17);

    sub_2179E2630();
    objc_msgSend(v13, sel_setRelevance_);
    if (*a1 >> 62)
    {
      swift_bridgeObjectRetain();
      id v18 = (id)sub_2179E2CD0();
      swift_bridgeObjectRelease();
      if (!__OFADD__(v18, 1))
      {
LABEL_7:
        objc_msgSend(v13, sel_setResultOrder_);
        id v18 = v13;
        MEMORY[0x21D451AA0]();
        if (*(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_8:
          sub_2179E2A00();
          sub_2179E29E0();

          return;
        }
LABEL_12:
        sub_2179E29F0();
        goto LABEL_8;
      }
    }
    else
    {
      id v18 = *(id *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!__OFADD__(v18, 1)) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
  sub_2179E2D80();
  __break(1u);
}

void sub_2179DC7C8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2179E2820();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_2179E2900();
  uint64_t v9 = a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  sub_2179E2800();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v10 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(a2, sel_identifier);
  if (!v11)
  {
    sub_2179E2930();
    id v11 = (id)sub_2179E2900();
    swift_bridgeObjectRelease();
  }
  id v12 = objc_msgSend(a2, sel_collectionIdentifiers);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = sub_2179E29D0();

    if (*(void *)(v14 + 16)) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(a2, sel_correlationID);
  id v18 = objc_msgSend(v15, sel_eventWithSearchID_searchTerm_tipID_collectionID_correlationID_, v8, v10, v11, v16, v17);

  id v19 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v19, sel_logAnalyticsEvent_, v18);
}

uint64_t sub_2179DCA84(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2179E2CD0();
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
    uint64_t v5 = sub_2179E2CD0();
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
    unint64_t v4 = MEMORY[0x21D451D90](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2179DCD88(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2179E2CD0();
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

  return sub_2179E29E0();
}

void (*sub_2179DCC50(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2179DCD00(v6, a2, a3);
  return sub_2179DCCB8;
}

void sub_2179DCCB8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_2179DCD00(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x21D451D80](a2, a3);
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
    *(void *)uint64_t v3 = v4;
    return _s5ValueOwxx;
  }
  __break(1u);
  return result;
}

void _s5ValueOwxx(id *a1)
{
}

uint64_t sub_2179DCD88(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2179E2CD0();
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
      uint64_t v8 = sub_2179E2CD0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21798D884(&qword_267BA69B0, &qword_267BA69A8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267BA69A8);
            unint64_t v10 = sub_2179DCC50(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
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
        sub_2179E2640();
        swift_arrayInitWithCopy();
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

void *sub_2179DCF48(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1;
  v14[0] = a1;
  v14[1] = a2;
  if (a3 >> 62) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_2179E2CD0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v10 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x21D451D80](i - 4, a3) : *(id *)(a3 + 8 * i);
      uint64_t v7 = v10;
      uint64_t v11 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v10;
      sub_2179DBD48(v14, (uint64_t)&v13, a4);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return v7;
      }

      if (v11 == v8)
      {
        swift_bridgeObjectRelease();
        return (void *)v14[0];
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_2179DD08C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2179E2CD0();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x21D451D80](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        id v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_identifier, v22);
        uint64_t v16 = sub_2179E2930();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_2179E2D50();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_2179DD234(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_2179E2CD0())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x21D451D80](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v9 = v8;
      uint64_t v10 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      uint64_t v11 = sub_2179E2750();
      if (v12)
      {
        if (v11 == a2 && v12 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_15:
          swift_bridgeObjectRelease();
          return v9;
        }
        char v7 = sub_2179E2D50();
        swift_bridgeObjectRelease();
        if (v7) {
          goto LABEL_15;
        }
      }

      ++v6;
      if (v10 == v5) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2179DD3A0(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  id v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  id v6 = *v3;
  swift_retain();
  sub_2179E1A60();
  return swift_release();
}

uint64_t sub_2179DD430(uint64_t a1, uint64_t a2)
{
  id v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  sub_2179902A4(a1);
  sub_21798E45C(v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  id v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t *v8 = (uint64_t)sub_2179DD5A4;
  v8[1] = v7;
  sub_21798E45C(v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  uint64_t v11 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  uint64_t v12 = *v11;
  *uint64_t v11 = (uint64_t)sub_2179DD5AC;
  v11[1] = v10;
  return sub_21798E45C(v12);
}

uint64_t sub_2179DD56C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2179DD5A4(void *a1)
{
}

void sub_2179DD5AC(void *a1)
{
}

uint64_t sub_2179DD5B4()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2179DD5FC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_21799DA74;
  return sub_2179DAE30(a1, v4, v5, v7, v6);
}

uint64_t sub_2179DD6BC(void *a1, uint64_t a2)
{
  unint64_t v24 = a1;
  uint64_t v25 = sub_2179E24A0();
  uint64_t v28 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2179E24D0();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2179E24B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 + OBJC_IVAR___TPSAppSearchQuery_identifier);
  uint64_t v13 = *(void *)(a2 + OBJC_IVAR___TPSAppSearchQuery_identifier + 8);
  uint64_t v14 = (uint64_t *)(a2 + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  uint64_t v15 = *v14;
  sub_217986C94(0, (unint64_t *)&qword_26ACF75D0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F040], v8);
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_2179E2B30();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v24;
  _OWORD v17[2] = v24;
  v17[3] = v12;
  v17[4] = v13;
  v17[5] = v15;
  aBlock[4] = sub_2179DEE78;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2179911FC;
  aBlock[3] = &block_descriptor_7;
  BOOL v19 = _Block_copy(aBlock);
  id v20 = v18;
  sub_2179E24C0();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_2179CE4DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7598);
  sub_21798D884((unint64_t *)&qword_26ACF75A0, &qword_26ACF7598);
  uint64_t v21 = v25;
  sub_2179E2C20();
  MEMORY[0x21D451C00](0, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v21);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
  return swift_release();
}

unint64_t sub_2179DDA7C()
{
  unint64_t result = qword_267BA6978;
  if (!qword_267BA6978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA6978);
  }
  return result;
}

uint64_t sub_2179DDAD0()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_2179DDADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179DDB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179D6324(a1, a2, a3, a4, &qword_26ACF6AC8, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179DDB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_26ACF6AD0);
}

uint64_t sub_2179DDB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179D6324(a1, a2, a3, a4, &qword_26ACF6AB8, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_26ACF6AD0);
}

id sub_2179DDB94@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_2179DDBF8(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_2179DD3A0(v1);
}

uint64_t sub_2179DDCA0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2179DDCF4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t _s5ValueOwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

uint64_t _s5ValueOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t _s5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2179DDE98(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2179DDEA0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SearchResult.Item.Value()
{
  return &type metadata for SearchResult.Item.Value;
}

unsigned char *_s8CategoryOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2179DDF88);
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

ValueMetadata *type metadata accessor for SearchResult.Item.Category()
{
  return &type metadata for SearchResult.Item.Category;
}

uint64_t sub_2179DDFC0()
{
  return type metadata accessor for SearchResultsModel();
}

uint64_t type metadata accessor for SearchResultsModel()
{
  uint64_t result = qword_26ACF68D8;
  if (!qword_26ACF68D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2179DE014()
{
  sub_217987524(319, &qword_26ACF7518, &qword_26ACF75B8);
  if (v0 <= 0x3F)
  {
    sub_217987524(319, &qword_26ACF6AD8, &qword_26ACF6B78);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SearchResultsModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SearchResultsModel);
}

uint64_t dispatch thunk of SearchResultsModel.tips.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SearchResultsModel.tips.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SearchResultsModel.tips.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of SearchResultsModel.searchTerm.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of SearchResultsModel.hasTips.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of SearchResultsModel.hasTopics.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of SearchResultsModel.hasSearchResults.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of SearchResultsModel.hasStartedSearch.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of SearchResultsModel.shouldShowEmptyStateView.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 824))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 832))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 840))();
}

uint64_t dispatch thunk of SearchResultsModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 848))();
}

uint64_t dispatch thunk of SearchResultsModel.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 856))();
}

uint64_t dispatch thunk of SearchResultsModel.tipForIdentifier(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 872))();
}

uint64_t dispatch thunk of SearchResultsModel.userGuideForIdentifier(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 880))();
}

uint64_t dispatch thunk of SearchResultsModel.updateSelection(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 888))();
}

uint64_t sub_2179DEC78()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2179DECA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2179DECC8(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_2179DED00(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2179DED2C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2179DED54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179DED94(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t *__return_ptr, void *);
  uint64_t v5;
  void v6[2];

  int v3 = *(void (**)(uint64_t *__return_ptr, void *))(v2 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v3(&v5, v6);
  return v5;
}

uint64_t sub_2179DEDD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_2179DEE0C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2179DEE38()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2179DEE78()
{
  sub_2179DC064(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_2179DEE84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21799DA74;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BA6988 + dword_267BA6988);
  return v6(a1, v4);
}

uint64_t sub_2179DEF3C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2179DEF94(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_21799ED6C;
  return sub_2179DB4D0(a1, v4, v5, v6, v7, v9, v8);
}

id sub_2179DF068@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_2179DA24C(a1, a2);
}

uint64_t sub_2179DF070(void **a1)
{
  return sub_2179DA404(a1);
}

uint64_t sub_2179DF078()
{
  return sub_2179DA7F0();
}

uint64_t sub_2179DF080()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2179DF0C0()
{
  sub_2179DC7C8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t View.readScrollOffset(onChange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26ACF7748);
  uint64_t v5 = sub_2179E1D20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - v7;
  BOOL v19 = sub_2179DF388;
  uint64_t v20 = 0;
  sub_2179E2420();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7720);
  sub_21798D884(&qword_26ACF7718, &qword_26ACF7720);
  sub_2179E2160();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v15;
  *(void *)(v9 + 16) = v14;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = sub_21798D884(&qword_26ACF7740, &qword_26ACF7748);
  uint64_t v17 = a3;
  uint64_t v18 = v11;
  swift_retain();
  swift_getWitnessTable();
  sub_2179DF524();
  sub_2179DF578();
  sub_2179E21B0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2179DF388@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2179E1F80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2179E2250();
  v12[0] = 0x69566C6C6F726353;
  v12[1] = 0xEA00000000007765;
  sub_2179E1FD0();
  sub_2179E1C60();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  a1[2] = v10;
  return result;
}

uint64_t sub_2179DF4C0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2179DF4F8(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_2179DF524()
{
  unint64_t result = qword_26ACF76A0;
  if (!qword_26ACF76A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF76A0);
  }
  return result;
}

unint64_t sub_2179DF578()
{
  unint64_t result = qword_26ACF77D0;
  if (!qword_26ACF77D0)
  {
    type metadata accessor for CGPoint(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACF77D0);
  }
  return result;
}

uint64_t sub_2179DF5D0()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for ScrollOffsetPreferenceKey()
{
  return &type metadata for ScrollOffsetPreferenceKey;
}

void sub_2179DF6E8()
{
  xmmword_267BA69B8 = 0uLL;
}

double sub_2179DF6F8@<D0>(_OWORD *a1@<X8>)
{
  if (qword_267BA6128 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_267BA69B8;
  *a1 = xmmword_267BA69B8;
  return result;
}

uint64_t sub_2179DF7E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179DF8D0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_2179E1AF0();
}

uint64_t sub_2179DF93C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2179DF9C0(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_2179E1AF0();
}

uint64_t (*sub_2179DFA38(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

uint64_t sub_2179DFAC4()
{
  return sub_2179882B0((uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_26ACF7530);
}

uint64_t sub_2179DFAD8(uint64_t a1)
{
  return sub_2179E00D8(a1, &qword_267BA69D8, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_26ACF7530);
}

uint64_t (*sub_2179DFAF4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA69D8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___TipNavigationViewModel__currentTip;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7530);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179DFCB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2179DFDB4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2179DFE38(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_2179E1AF0();
}

uint64_t (*sub_2179DFEB4(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2179E1AD0();
  return sub_2179A1570;
}

uint64_t sub_2179DFF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2179E00BC(uint64_t a1)
{
  return sub_2179E00D8(a1, &qword_26ACF6AC8, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179E00D8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2179E1AC0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2179E0208(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF6AC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___TipNavigationViewModel__tips;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACF7510);
  sub_2179E1AB0();
  swift_endAccess();
  return sub_2179A16A0;
}

uint64_t sub_2179E034C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (!v5) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  sub_2179E043C((uint64_t)v5, (unint64_t)v5);
  uint64_t v1 = v0;
  char v3 = v2;
  swift_bridgeObjectRelease();

  if (v3) {
    return 0;
  }
  else {
    return v1;
  }
}

void sub_2179E043C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x21D451D80](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_2179CBC9C();
      char v6 = sub_2179E2BB0();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x21D451D80](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_2179E2BB0();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_2179E2CD0();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

BOOL sub_2179E05FC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (!v6) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  sub_2179E043C((uint64_t)v6, (unint64_t)v6);
  uint64_t v1 = v0;
  char v3 = v2;
  swift_bridgeObjectRelease();

  return (v3 & 1) == 0 && v1 > 0;
}

uint64_t sub_2179E07D0()
{
  uint64_t v0 = sub_2179E034C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFSUB__(v1, 1)) {
    return v0 < v1 - 1;
  }
  __break(1u);
  return result;
}

void sub_2179E08A4()
{
  uint64_t v0 = sub_2179E034C();
  BOOL v1 = __OFSUB__(v0, 1);
  uint64_t v2 = v0 - 1;
  if (v1)
  {
    __break(1u);
  }
  else
  {
    sub_2179E09C4(v2);
  }
}

void sub_2179E0934()
{
  uint64_t v0 = sub_2179E034C();
  BOOL v1 = __OFADD__(v0, 1);
  uint64_t v2 = v0 + 1;
  if (v1)
  {
    __break(1u);
  }
  else
  {
    sub_2179E09C4(v2);
  }
}

void sub_2179E09C4(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2179E2CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) == 0 && v3 > a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    if ((v7 & 0xC000000000000001) != 0)
    {
      id v4 = (id)MEMORY[0x21D451D80](a1);
    }
    else
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a1)
      {
        __break(1u);
        return;
      }
      id v4 = *(id *)(v7 + 8 * a1 + 32);
    }
    uint64_t v5 = v4;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    char v6 = v1;
    sub_2179E1AF0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    if (v5)
    {
      (*(void (**)(void *))((*MEMORY[0x263F8EED0] & *v6) + 0xF8))(v5);
    }
  }
}

void sub_2179E0C3C(void *a1, char a2)
{
  uint64_t v3 = v2;
  if ((a2 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2179E1AE0();
    swift_release();
    swift_release();
    if (v10)
    {
      if (a1)
      {
        sub_2179CBC9C();
        id v5 = a1;
        id v6 = v10;
        char v7 = sub_2179E2BB0();

        if (v7) {
          return;
        }
      }
      else
      {
      }
    }
    else if (!a1)
    {
      return;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = a1;
  uint64_t v9 = v3;
  sub_2179E1AF0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2179E1AE0();
  swift_release();
  swift_release();
  if (a1)
  {
    (*(void (**)(void *))((*MEMORY[0x263F8EED0] & *v9) + 0xF8))(a1);
  }
}

id TipNavigationViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id TipNavigationViewModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipNavigationViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2179E0EC8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TipNavigationViewModel();
  uint64_t result = sub_2179E1A40();
  *a1 = result;
  return result;
}

uint64_t sub_2179E0F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_26ACF7530);
}

uint64_t sub_2179E0F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179DFF40(a1, a2, a3, a4, &qword_267BA69D8, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_26ACF7530);
}

uint64_t sub_2179E0F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2179A1CE8(a1, a2, a3, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179E0F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2179DFF40(a1, a2, a3, a4, &qword_26ACF6AC8, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_26ACF7510);
}

uint64_t sub_2179E0FB8()
{
  return type metadata accessor for TipNavigationViewModel();
}

uint64_t method lookup function for TipNavigationViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipNavigationViewModel);
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTipIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.canGoBack.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.canGoNext.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.goBack()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.goNext()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.selectTip(atIndex:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.updateSelectedTip(_:forceUpdate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.selectedTipDidChange(toTip:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

id static UIColor.widgetBackgroundColor.getter()
{
  uint64_t v0 = (void *)sub_2179E2900();
  id v1 = self;
  id v2 = objc_msgSend(v1, sel_colorNamed_, v0);

  if (v2) {
    return v2;
  }
  id v4 = objc_msgSend(v1, sel_systemBackgroundColor);

  return v4;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2179E1740()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_2179E1750()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_2179E1760()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2179E1770()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2179E1780()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2179E1790()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2179E17A0()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_2179E17B0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2179E17C0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2179E17D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2179E17E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2179E17F0()
{
  return MEMORY[0x270F7E908]();
}

uint64_t sub_2179E1800()
{
  return MEMORY[0x270F7E910]();
}

uint64_t sub_2179E1810()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2179E1820()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2179E1830()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2179E1840()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2179E1850()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2179E1860()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2179E1870()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2179E1880()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2179E1890()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2179E18A0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_2179E18B0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_2179E18C0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2179E18D0()
{
  return MEMORY[0x270EF0FF8]();
}

uint64_t sub_2179E18E0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_2179E18F0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_2179E1900()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_2179E1910()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2179E1920()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2179E1930()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2179E1940()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2179E1950()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2179E1960()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2179E1970()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2179E1990()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_2179E19A0()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_2179E19B0()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_2179E19C0()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2179E19D0()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2179E19E0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2179E19F0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2179E1A00()
{
  return MEMORY[0x270F81A10]();
}

uint64_t sub_2179E1A10()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_2179E1A20()
{
  return MEMORY[0x270EE3878]();
}

uint64_t sub_2179E1A30()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2179E1A40()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2179E1A50()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_2179E1A60()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_2179E1A70()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_2179E1A80()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_2179E1A90()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_2179E1AA0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2179E1AB0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2179E1AC0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2179E1AD0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2179E1AE0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2179E1AF0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2179E1B00()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2179E1B10()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_2179E1B20()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_2179E1B30()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_2179E1B40()
{
  return MEMORY[0x270EE3E50]();
}

uint64_t sub_2179E1B50()
{
  return MEMORY[0x270EE3E68]();
}

uint64_t sub_2179E1B60()
{
  return MEMORY[0x270EE3EA8]();
}

uint64_t sub_2179E1B70()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_2179E1B80()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2179E1B90()
{
  return MEMORY[0x270EE4018]();
}

uint64_t sub_2179E1BA0()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_2179E1BB0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2179E1BC0()
{
  return MEMORY[0x270EFEDE0]();
}

uint64_t sub_2179E1BD0()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2179E1BE0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2179E1BF0()
{
  return MEMORY[0x270EFEF40]();
}

uint64_t sub_2179E1C00()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2179E1C20()
{
  return MEMORY[0x270EFF260]();
}

uint64_t sub_2179E1C30()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_2179E1C40()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2179E1C50()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2179E1C60()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_2179E1C70()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_2179E1C80()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_2179E1C90()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_2179E1CB0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_2179E1CC0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2179E1CD0()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_2179E1CE0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2179E1CF0()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_2179E1D00()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_2179E1D10()
{
  return MEMORY[0x270F00120]();
}

uint64_t sub_2179E1D20()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2179E1D30()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2179E1D40()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_2179E1D50()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2179E1D60()
{
  return MEMORY[0x270F07E38]();
}

uint64_t sub_2179E1D70()
{
  return MEMORY[0x270F07E40]();
}

uint64_t sub_2179E1D80()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_2179E1D90()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_2179E1DA0()
{
  return MEMORY[0x270F00898]();
}

uint64_t sub_2179E1DB0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2179E1DC0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2179E1DD0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2179E1DE0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2179E1DF0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2179E1E00()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2179E1E10()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2179E1E20()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_2179E1E30()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_2179E1E40()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2179E1E50()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2179E1E60()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_2179E1E70()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_2179E1E80()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2179E1E90()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_2179E1EA0()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_2179E1EB0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_2179E1ED0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_2179E1EE0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_2179E1EF0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_2179E1F00()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_2179E1F10()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_2179E1F20()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_2179E1F40()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_2179E1F50()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2179E1F60()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2179E1F70()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2179E1F80()
{
  return MEMORY[0x270F018F0]();
}

uint64_t sub_2179E1F90()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_2179E1FA0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_2179E1FB0()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_2179E1FC0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2179E1FD0()
{
  return MEMORY[0x270F01F90]();
}

uint64_t sub_2179E1FE0()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_2179E1FF0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_2179E2000()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2179E2010()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2179E2020()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2179E2030()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2179E2040()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2179E2050()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2179E2060()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2179E2070()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_2179E2080()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_2179E2090()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_2179E20A0()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_2179E20B0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_2179E20C0()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_2179E20D0()
{
  return MEMORY[0x270F02F50]();
}

uint64_t sub_2179E20E0()
{
  return MEMORY[0x270F02F60]();
}

uint64_t sub_2179E20F0()
{
  return MEMORY[0x270F02F68]();
}

uint64_t sub_2179E2100()
{
  return MEMORY[0x270F02F70]();
}

uint64_t sub_2179E2110()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2179E2120()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2179E2130()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2179E2140()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2179E2150()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2179E2160()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_2179E2170()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_2179E2180()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_2179E2190()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2179E21A0()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_2179E21B0()
{
  return MEMORY[0x270F03A88]();
}

uint64_t sub_2179E21C0()
{
  return MEMORY[0x270F03B98]();
}

uint64_t sub_2179E21D0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_2179E21E0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_2179E21F0()
{
  return MEMORY[0x270F03F20]();
}

uint64_t sub_2179E2200()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_2179E2210()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2179E2220()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_2179E2230()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2179E2240()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2179E2250()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2179E2260()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2179E2270()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2179E2280()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2179E2290()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2179E22A0()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_2179E22B0()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_2179E22C0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2179E22E0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2179E22F0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2179E2300()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_2179E2310()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2179E2320()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2179E2330()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2179E2340()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2179E2350()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2179E2360()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2179E2370()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2179E2380()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2179E2390()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2179E23A0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_2179E23B0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_2179E23C0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2179E23D0()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_2179E23E0()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_2179E23F0()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_2179E2400()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_2179E2410()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_2179E2420()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2179E2430()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2179E2440()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_2179E2450()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_2179E2460()
{
  return MEMORY[0x270F05370]();
}

uint64_t sub_2179E2470()
{
  return MEMORY[0x270F05378]();
}

uint64_t sub_2179E2480()
{
  return MEMORY[0x270F05380]();
}

uint64_t sub_2179E2490()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2179E24A0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2179E24B0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2179E24C0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2179E24D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2179E24E0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2179E24F0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2179E2500()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_2179E2510()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_2179E2520()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_2179E2530()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2179E2540()
{
  return MEMORY[0x270F7E918]();
}

uint64_t sub_2179E2550()
{
  return MEMORY[0x270F7E920]();
}

uint64_t sub_2179E2560()
{
  return MEMORY[0x270F7E928]();
}

uint64_t sub_2179E2570()
{
  return MEMORY[0x270F7E930]();
}

uint64_t sub_2179E2580()
{
  return MEMORY[0x270F7E938]();
}

uint64_t sub_2179E2590()
{
  return MEMORY[0x270F7E940]();
}

uint64_t sub_2179E25A0()
{
  return MEMORY[0x270F7E948]();
}

uint64_t sub_2179E25B0()
{
  return MEMORY[0x270F7E950]();
}

uint64_t sub_2179E25C0()
{
  return MEMORY[0x270F7E958]();
}

uint64_t sub_2179E25D0()
{
  return MEMORY[0x270F7E960]();
}

uint64_t sub_2179E25E0()
{
  return MEMORY[0x270F7E968]();
}

uint64_t sub_2179E25F0()
{
  return MEMORY[0x270F7E970]();
}

uint64_t sub_2179E2600()
{
  return MEMORY[0x270F7E978]();
}

uint64_t sub_2179E2610()
{
  return MEMORY[0x270F7E980]();
}

uint64_t sub_2179E2620()
{
  return MEMORY[0x270F7E988]();
}

uint64_t sub_2179E2630()
{
  return MEMORY[0x270F7E990]();
}

uint64_t sub_2179E2640()
{
  return MEMORY[0x270F7E998]();
}

uint64_t sub_2179E2650()
{
  return MEMORY[0x270F7E9A0]();
}

uint64_t sub_2179E2660()
{
  return MEMORY[0x270F7E9A8]();
}

uint64_t sub_2179E2670()
{
  return MEMORY[0x270F7E9B0]();
}

uint64_t sub_2179E2680()
{
  return MEMORY[0x270F7E9D0]();
}

uint64_t sub_2179E2690()
{
  return MEMORY[0x270F7E9D8]();
}

uint64_t sub_2179E26A0()
{
  return MEMORY[0x270F7E9E0]();
}

uint64_t sub_2179E26B0()
{
  return MEMORY[0x270F7E9E8]();
}

uint64_t sub_2179E26C0()
{
  return MEMORY[0x270F7E9F0]();
}

uint64_t sub_2179E26D0()
{
  return MEMORY[0x270F7E9F8]();
}

uint64_t sub_2179E26E0()
{
  return MEMORY[0x270F7EA00]();
}

uint64_t sub_2179E26F0()
{
  return MEMORY[0x270F7EA08]();
}

uint64_t sub_2179E2700()
{
  return MEMORY[0x270F7EA10]();
}

uint64_t sub_2179E2710()
{
  return MEMORY[0x270F7EA18]();
}

uint64_t sub_2179E2720()
{
  return MEMORY[0x270F7EA20]();
}

uint64_t sub_2179E2730()
{
  return MEMORY[0x270F7EA28]();
}

uint64_t sub_2179E2740()
{
  return MEMORY[0x270F7EA30]();
}

uint64_t sub_2179E2750()
{
  return MEMORY[0x270F7EA38]();
}

uint64_t sub_2179E2760()
{
  return MEMORY[0x270F7EA40]();
}

uint64_t sub_2179E2770()
{
  return MEMORY[0x270F7EA48]();
}

uint64_t sub_2179E2780()
{
  return MEMORY[0x270F7EA50]();
}

uint64_t sub_2179E2790()
{
  return MEMORY[0x270F7EA58]();
}

uint64_t sub_2179E27A0()
{
  return MEMORY[0x270F7EA60]();
}

uint64_t sub_2179E27B0()
{
  return MEMORY[0x270F7EA80]();
}

uint64_t sub_2179E27C0()
{
  return MEMORY[0x270F7EA88]();
}

uint64_t sub_2179E27D0()
{
  return MEMORY[0x270F7EA90]();
}

uint64_t sub_2179E27E0()
{
  return MEMORY[0x270F7EA98]();
}

uint64_t sub_2179E27F0()
{
  return MEMORY[0x270F7EAA0]();
}

uint64_t sub_2179E2800()
{
  return MEMORY[0x270F7EAA8]();
}

uint64_t sub_2179E2810()
{
  return MEMORY[0x270F7EAB0]();
}

uint64_t sub_2179E2820()
{
  return MEMORY[0x270F7EAB8]();
}

uint64_t sub_2179E2830()
{
  return MEMORY[0x270F7EAC0]();
}

uint64_t sub_2179E2840()
{
  return MEMORY[0x270F7EAC8]();
}

uint64_t sub_2179E2850()
{
  return MEMORY[0x270F7EAD0]();
}

uint64_t sub_2179E2860()
{
  return MEMORY[0x270F7EAD8]();
}

uint64_t sub_2179E2870()
{
  return MEMORY[0x270F7EAE0]();
}

uint64_t sub_2179E2880()
{
  return MEMORY[0x270F7EAE8]();
}

uint64_t sub_2179E2890()
{
  return MEMORY[0x270F7EAF8]();
}

uint64_t sub_2179E28A0()
{
  return MEMORY[0x270F7EB00]();
}

uint64_t sub_2179E28B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2179E28C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2179E28D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2179E28E0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2179E28F0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2179E2900()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2179E2910()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2179E2920()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2179E2930()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2179E2940()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2179E2950()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2179E2960()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2179E2970()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2179E2980()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2179E2990()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2179E29A0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2179E29B0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2179E29C0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2179E29D0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2179E29E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2179E29F0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2179E2A00()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2179E2A10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2179E2A20()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2179E2A30()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2179E2A40()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2179E2A50()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2179E2A60()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2179E2A70()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2179E2A80()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2179E2A90()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2179E2AA0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2179E2AC0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2179E2AD0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2179E2AE0()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_2179E2AF0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2179E2B00()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2179E2B10()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2179E2B20()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2179E2B30()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2179E2B40()
{
  return MEMORY[0x270F825B0]();
}

uint64_t sub_2179E2B50()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_2179E2B60()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_2179E2B70()
{
  return MEMORY[0x270F7EB08]();
}

uint64_t sub_2179E2B80()
{
  return MEMORY[0x270F828B8]();
}

uint64_t sub_2179E2B90()
{
  return MEMORY[0x270F828C0]();
}

uint64_t sub_2179E2BA0()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_2179E2BB0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2179E2BC0()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_2179E2BD0()
{
  return MEMORY[0x270EF2320]();
}

uint64_t sub_2179E2BE0()
{
  return MEMORY[0x270EF2330]();
}

uint64_t sub_2179E2BF0()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_2179E2C00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2179E2C10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2179E2C20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2179E2C30()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2179E2C40()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2179E2C50()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2179E2C60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2179E2C70()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_2179E2C80()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2179E2C90()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2179E2CA0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2179E2CB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2179E2CC0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2179E2CD0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2179E2CE0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2179E2CF0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2179E2D00()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2179E2D10()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2179E2D20()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_2179E2D30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2179E2D40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2179E2D50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2179E2D60()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2179E2D80()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2179E2D90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2179E2DA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2179E2DB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2179E2DC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2179E2DD0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2179E2DE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2179E2E00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2179E2E10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2179E2E20()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2179E2E30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2179E2E40()
{
  return MEMORY[0x270FA0128]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x270F99740]();
}