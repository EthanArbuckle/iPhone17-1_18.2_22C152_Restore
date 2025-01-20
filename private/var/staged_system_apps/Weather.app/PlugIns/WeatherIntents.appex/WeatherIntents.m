uint64_t LocationSearchCompleter.onUpdate.getter()
{
  return sub_100003198(&OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, (void (*)(void, void))sub_1000030F0);
}

uint64_t sub_1000030F0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t LocationSearchCompleter.onUpdate.setter(uint64_t a1, uint64_t a2)
{
  return sub_100003220(a1, a2, &OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, (uint64_t (*)(uint64_t, uint64_t))sub_100003120);
}

uint64_t sub_100003120(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*LocationSearchCompleter.onUpdate.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t LocationSearchCompleter.onError.getter()
{
  return sub_100003198(&OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError, (void (*)(void, void))sub_1000045F8);
}

uint64_t sub_100003198(void *a1, void (*a2)(void, void))
{
  v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t LocationSearchCompleter.onError.setter(uint64_t a1, uint64_t a2)
{
  return sub_100003220(a1, a2, &OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError, (uint64_t (*)(uint64_t, uint64_t))sub_1000045FC);
}

uint64_t sub_100003220(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*LocationSearchCompleter.onError.modify())()
{
  return j__swift_endAccess;
}

char *LocationSearchCompleter.__allocating_init(searchCompleter:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return LocationSearchCompleter.init(searchCompleter:)(a1);
}

char *LocationSearchCompleter.init(searchCompleter:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter] = a1;
  v13.receiver = v1;
  v13.super_class = ObjectType;
  id v6 = a1;
  v7 = [super init];
  v8 = *(void **)&v7[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter];
  uint64_t v9 = v7;
  [v8 wi_applyLocalitiesAndLandmarksFilterType];
  uint64_t v10 = v9;
  id v11 = v8;
  [v11 setDelegate:v10];

  return v10;
}

Swift::Void __swiftcall LocationSearchCompleter.searchLocations(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter);
  id v5 = [v4 queryFragment];
  uint64_t v6 = sub_100010470();
  v8 = v7;

  if (v6 == countAndFlagsBits && v8 == object)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_100010690();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      NSString v11 = sub_100010460();
      [v4 setQueryFragment:v11];

      return;
    }
  }

  _s14WeatherIntents23LocationSearchCompleterC25completerDidUpdateResultsyySo07MKLocaldE0CF_0();
}

uint64_t _s14WeatherIntents23LocationSearchCompleterC25completerDidUpdateResultsyySo07MKLocaldE0CF_0()
{
  uint64_t v1 = (void (**)(uint64_t))(v0 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate);
  uint64_t result = swift_beginAccess();
  id v3 = *v1;
  if (*v1)
  {
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter);
    swift_retain();
    id v5 = [v4 results];
    sub_1000045B8();
    uint64_t v6 = sub_1000104B0();

    v3(v6);
    sub_100003120((uint64_t)v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id LocationSearchCompleter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void LocationSearchCompleter.init()()
{
}

id LocationSearchCompleter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t LocationSearchCompleter.completer(_:didFailWithError:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010380();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010360();
  id v8 = v2;
  swift_errorRetain();
  uint64_t v9 = (char *)v8;
  swift_errorRetain();
  char v10 = sub_100010370();
  os_log_type_t v11 = sub_1000104E0();
  int v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v5;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v28 = v15;
    *(_DWORD *)uint64_t v14 = 141558531;
    uint64_t v30 = 1752392040;
    v31[0] = v15;
    HIDWORD(v26) = v12;
    sub_100010570();
    *(_WORD *)(v14 + 12) = 2085;
    id v16 = [*(id *)&v9[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter] queryFragment];
    uint64_t v27 = v4;
    id v17 = v16;
    uint64_t v18 = sub_100010470();
    unint64_t v20 = v19;

    uint64_t v30 = sub_100003BFC(v18, v20, v31);
    sub_100010570();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2082;
    uint64_t v30 = a2;
    swift_errorRetain();
    sub_1000043B4(&qword_1000193E0);
    uint64_t v21 = sub_100010480();
    uint64_t v30 = sub_100003BFC(v21, v22, v31);
    sub_100010570();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, BYTE4(v26), "Received an error while requesting a local search completion. searchQuery=%{sensitive,mask.hash}s, error=%{public}s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v27);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v23 = &v9[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
  uint64_t result = swift_beginAccess();
  v25 = *(void (**)(uint64_t))v23;
  if (*(void *)v23)
  {
    swift_retain();
    v25(a2);
    return sub_100003120((uint64_t)v25);
  }
  return result;
}

uint64_t variable initialization expression of LocalSearchRequestManager.geocodeRequestDeduper()
{
  return sub_100010270();
}

double variable initialization expression of LocalSearchRequestManager.$__lazy_storage_$_store@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)&double result = 1;
  *(_OWORD *)(a1 + 24) = xmmword_1000118B0;
  return result;
}

uint64_t variable initialization expression of WeatherIntentResponse.code()
{
  return 0;
}

uint64_t sub_100003BFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003CD0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004558((uint64_t)v12, *a3);
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
      sub_100004558((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004508((uint64_t)v12);
  return v7;
}

uint64_t sub_100003CD0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100003E28((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100010580();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100003F00(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000105D0();
    if (!v8)
    {
      uint64_t result = sub_100010630();
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

void *sub_100003E28(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100010670();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100003F00(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_100003F98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_100004174(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_100004174((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100003F98(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100010490();
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
  unint64_t v3 = sub_10000410C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1000105A0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100010670();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100010630();
  __break(1u);
  return result;
}

void *sub_10000410C(uint64_t a1, uint64_t a2)
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
  sub_1000043B4(&qword_100019490);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100004174(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000043B4(&qword_100019490);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100004324(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000424C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000424C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100010670();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100004324(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100010670();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1000043B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000043F8()
{
  unint64_t result = qword_1000193E8;
  if (!qword_1000193E8)
  {
    sub_100010290();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000193E8);
  }
  return result;
}

unint64_t sub_100004448()
{
  unint64_t result = qword_1000193F8;
  if (!qword_1000193F8)
  {
    sub_10000449C(&qword_1000193F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000193F8);
  }
  return result;
}

uint64_t sub_10000449C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for LocationSearchCompleter()
{
  return self;
}

uint64_t sub_100004508(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004558(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000045B8()
{
  unint64_t result = qword_100019498;
  if (!qword_100019498)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100019498);
  }
  return result;
}

uint64_t sub_100004604()
{
  return swift_beginAccess();
}

uint64_t _s14WeatherIntents23LocationSearchCompleterC8onUpdateySaySo07MKLocalD10CompletionCGcSgvpfi_0()
{
  return 0;
}

uint64_t sub_100004634@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000043B4(&qword_100019500);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000043B4(&qword_100019508);
  __chkstk_darwin(v7 - 8);
  int64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000FDF0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)v36 - v15;
  v38[0] = 0;
  v38[1] = 0;
  if (!objc_msgSend(a1, "wi_getCoordinate:", v38))
  {

LABEL_10:
    uint64_t v31 = 1;
    goto LABEL_11;
  }
  uint64_t v37 = a2;
  id v17 = [a1 wi_mapItem];
  id v18 = [v17 timeZone];

  if (!v18)
  {
    sub_100004A24((uint64_t)v9, 1, 1, v10);
    goto LABEL_8;
  }
  sub_10000FDE0();

  unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v19(v9, v14, v10);
  sub_100004A24((uint64_t)v9, 0, 1, v10);
  if (sub_100004AAC((uint64_t)v9, 1, v10) == 1)
  {
LABEL_8:

    sub_100004A4C((uint64_t)v9);
LABEL_9:
    a2 = v37;
    goto LABEL_10;
  }
  v19(v16, v9, v10);
  uint64_t v20 = [a1 wi_mapItem];
  if (!v21)
  {

    uint64_t v34 = sub_100004B44();
    v35(v34);
    goto LABEL_9;
  }
  v36[5] = v20;
  uint64_t v22 = sub_100010560();
  v36[3] = v23;
  v36[4] = v22;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  sub_10000FDC0();
  uint64_t v24 = sub_10000FDD0();
  sub_100004A24((uint64_t)v6, 0, 1, v24);
  id v25 = [a1 title];
  uint64_t v26 = sub_100010470();
  v36[1] = v27;
  v36[2] = v26;

  id v28 = [a1 subtitle];
  sub_100010470();

  a2 = v37;
  sub_100010230();

  uint64_t v29 = sub_100004B44();
  v30(v29);
  uint64_t v31 = 0;
LABEL_11:
  uint64_t v32 = sub_100010260();
  return sub_100004A24(a2, v31, 1, v32);
}

uint64_t sub_100004A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100004A4C(uint64_t a1)
{
  uint64_t v2 = sub_1000043B4(&qword_100019508);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100004AD4(void *a1)
{
  id v2 = [a1 name];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100010470();

  return v3;
}

uint64_t sub_100004B44()
{
  return v0;
}

uint64_t *WeatherLocation.currentLocationID.unsafeMutableAddressor()
{
  if (qword_1000193B0 != -1) {
    swift_once();
  }
  return &static WeatherLocation.currentLocationID;
}

uint64_t *WeatherLocation.alternateCurrentLocationID.unsafeMutableAddressor()
{
  if (qword_1000193B8 != -1) {
    swift_once();
  }
  return &static WeatherLocation.alternateCurrentLocationID;
}

uint64_t sub_100004BF4()
{
  uint64_t result = sub_100010190();
  static WeatherLocation.currentLocationID = result;
  unk_100019920 = v1;
  return result;
}

uint64_t static WeatherLocation.currentLocationID.getter()
{
  return sub_100004C94(&qword_1000193B0, &static WeatherLocation.currentLocationID);
}

void sub_100004C40()
{
  static WeatherLocation.alternateCurrentLocationID = 0x69436C61636F6C5FLL;
  unk_100019930 = 0xEB000000005F7974;
}

uint64_t static WeatherLocation.alternateCurrentLocationID.getter()
{
  return sub_100004C94(&qword_1000193B8, &static WeatherLocation.alternateCurrentLocationID);
}

uint64_t sub_100004C94(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t MKPlacemark.safeTitle.getter()
{
  return sub_100004D00((SEL *)&selRef_title);
}

uint64_t MKPlacemark.safeSubtitle.getter()
{
  return sub_100004D00((SEL *)&selRef_subtitle);
}

uint64_t sub_100004D00(SEL *a1)
{
  if ([v1 respondsToSelector:*a1]) {
    return sub_100004D50(v1, a1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004D50(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_100010470();

  return v4;
}

uint64_t sub_100004DB0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for BundleLookup()
{
  return self;
}

id sub_100004DE4()
{
  type metadata accessor for BundleLookup();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100019938 = (uint64_t)result;
  return result;
}

unint64_t static LocalSearchRequestManager.dependencyKey.getter()
{
  return 0xD00000000000001DLL;
}

double sub_100004E58()
{
  uint64_t v1 = sub_10000FF80();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C64((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_100010140();
  sub_10000FF70();
  double v6 = v5;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_100004F54@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_100006D04(v1 + 80, (uint64_t)v4, &qword_1000195A8);
  if (v5 != 1) {
    return sub_100006DD0((uint64_t)v4, a1);
  }
  sub_100006CA8((uint64_t)v4, &qword_1000195A8);
  sub_100005024(v1, a1);
  sub_100006D04(a1, (uint64_t)v4, &qword_100019688);
  swift_beginAccess();
  sub_100006D68((uint64_t)v4, v1 + 80);
  return swift_endAccess();
}

uint64_t sub_100005024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100010380();
  uint64_t v4 = __chkstk_darwin();
  (*(void (**)(void *__return_ptr, uint64_t))(a1 + 120))(v8, v4);
  sub_10000FE80();
  sub_10000FE70();
  sub_10000FE00();
  sub_10000FE60();
  swift_release();
  swift_release();
  sub_100006C64(v8, v8[3]);
  sub_10000FFC0();
  if (v7 == 1)
  {
    sub_10000FE00();
    sub_100006F88(&qword_100019698, v5, (void (*)(uint64_t))type metadata accessor for LocalSearchRequestManager);
    sub_10000FEC0();
    swift_release();
  }
  sub_100006EE4((uint64_t)v8, a2);
  return sub_100004508((uint64_t)v8);
}

uint64_t static WeatherLocation.supportsSecureCoding.getter()
{
  return 1;
}

BOOL sub_1000053D8()
{
  sub_1000043B4(&qword_100019500);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v1 = (char *)&v14 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000FDD0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  double v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - v7;
  sub_1000101F0();
  if (sub_100004AAC((uint64_t)v1, 1, v2) == 1)
  {
    sub_100006CA8((uint64_t)v1, &qword_100019500);
    return 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v1, v2);
    double v10 = sub_100004E58();
    sub_10000FDC0();
    sub_10000FDB0();
    double v12 = v11;
    uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
    v13(v6, v2);
    v13(v8, v2);
    return v10 <= v12;
  }
}

uint64_t LocalSearchRequestManager.__allocating_init(service:store:appConfigurationManager:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1000055E0(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100006560);
}

uint64_t LocalSearchRequestManager.init(service:store:appConfigurationManager:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1000055E0(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000066F8);
}

uint64_t sub_1000055E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = a7;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v15 = *(void *)(a5 + 24);
  uint64_t v14 = *(void *)(a5 + 32);
  sub_1000066A8(a5, v15);
  sub_10000703C();
  __chkstk_darwin();
  id v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  uint64_t v19 = v22(a1, a3, a4, v17, a6, v21, ObjectType, v15, a2, v14);
  sub_100004508(a5);
  return v19;
}

uint64_t LocalSearchRequestManager.performLocalSearch(with:)(uint64_t a1, uint64_t a2)
{
  sub_100007054();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v2;
  sub_100010260();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v6 = sub_100010320();
  swift_release();
  return v6;
}

uint64_t sub_1000057B4()
{
  return sub_100010280();
}

uint64_t sub_100005810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v32 = *a4;
  uint64_t v7 = sub_1000043B4(&qword_100019680);
  __chkstk_darwin(v7 - 8);
  int64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100010260();
  uint64_t v30 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v25 - v14;
  sub_10000FE80();
  sub_10000FE70();
  sub_10000FE10();
  sub_10000FE60();
  swift_release();
  swift_release();
  if (v35[0]) {
    goto LABEL_9;
  }
  uint64_t v27 = v9;
  uint64_t v28 = a3;
  id v25 = v13;
  uint64_t v26 = v15;
  uint64_t v29 = v10;
  uint64_t v31 = a2;
  sub_100004F54((uint64_t)v35);
  if (!v36)
  {
    sub_100006CA8((uint64_t)v35, &qword_100019688);
    uint64_t v16 = (uint64_t)v27;
    sub_100004A24((uint64_t)v27, 1, 1, v29);
    a3 = v28;
    goto LABEL_8;
  }
  sub_100006EE4((uint64_t)v35, (uint64_t)v33);
  sub_100006CA8((uint64_t)v35, &qword_100019688);
  sub_100006C64(v33, v34);
  uint64_t v16 = (uint64_t)v27;
  a3 = v28;
  sub_10000FFA0();
  sub_100004508((uint64_t)v33);
  uint64_t v17 = v29;
  if (sub_100004AAC(v16, 1, v29) == 1)
  {
LABEL_8:
    sub_100006CA8(v16, &qword_100019680);
    a2 = v31;
    goto LABEL_9;
  }
  uint64_t v18 = v30;
  uint64_t v19 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v26, v16, v17);
  if (!sub_1000053D8())
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v25, v19, v17);
    sub_1000043B4(&qword_100019690);
    swift_allocObject();
    uint64_t v23 = sub_100010300();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
    return v23;
  }
  sub_100004F54((uint64_t)v35);
  if (v36)
  {
    sub_100006EE4((uint64_t)v35, (uint64_t)v33);
    sub_100006CA8((uint64_t)v35, &qword_100019688);
    sub_100006C64(v33, v34);
    sub_10000FFB0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
    sub_100004508((uint64_t)v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
    sub_100006CA8((uint64_t)v35, &qword_100019688);
  }
  a2 = v31;
  a3 = v28;
LABEL_9:
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8))(a2, a3, ObjectType, v20);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a2;
  *(void *)(v22 + 24) = a3;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1000102E0();
  swift_release();
  swift_release();
  return v23;
}

uint64_t LocalSearchRequestManager.performLocalSearch(with:calloutTitle:)(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100007054();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = a1;
  v7[5] = v3;
  sub_100010260();
  swift_bridgeObjectRetain();
  id v8 = a1;
  swift_retain();
  uint64_t v9 = sub_100010320();
  swift_release();
  return v9;
}

uint64_t sub_100005D4C()
{
  return sub_100010280();
}

uint64_t sub_100005DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v32 = *a5;
  uint64_t v33 = a3;
  uint64_t v9 = sub_1000043B4(&qword_100019680);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010260();
  uint64_t v30 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v26 - v16;
  sub_10000FE80();
  sub_10000FE70();
  sub_10000FE10();
  sub_10000FE60();
  swift_release();
  uint64_t v18 = v12;
  uint64_t v19 = v33;
  swift_release();
  if (v36[0]) {
    goto LABEL_9;
  }
  uint64_t v27 = v15;
  uint64_t v28 = a5;
  uint64_t v29 = a2;
  uint64_t v31 = a1;
  sub_100004F54((uint64_t)v36);
  if (!v37)
  {
    sub_100006CA8((uint64_t)v36, &qword_100019688);
    sub_100004A24((uint64_t)v11, 1, 1, v18);
    a2 = v29;
    goto LABEL_8;
  }
  sub_100006EE4((uint64_t)v36, (uint64_t)v34);
  sub_100006CA8((uint64_t)v36, &qword_100019688);
  sub_100006C64(v34, v35);
  a2 = v29;
  sub_10000FFA0();
  sub_100004508((uint64_t)v34);
  if (sub_100004AAC((uint64_t)v11, 1, v18) == 1)
  {
LABEL_8:
    sub_100006CA8((uint64_t)v11, &qword_100019680);
    a1 = v31;
    goto LABEL_9;
  }
  uint64_t v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v17, v11, v18);
  if (!sub_1000053D8())
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v27, v17, v18);
    sub_1000043B4(&qword_100019690);
    swift_allocObject();
    uint64_t v24 = sub_100010300();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v18);
    return v24;
  }
  sub_100004F54((uint64_t)v36);
  if (v37)
  {
    sub_100006EE4((uint64_t)v36, (uint64_t)v34);
    sub_100006CA8((uint64_t)v36, &qword_100019688);
    sub_100006C64(v34, v35);
    sub_10000FFB0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v18);
    sub_100004508((uint64_t)v34);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v18);
    sub_100006CA8((uint64_t)v36, &qword_100019688);
  }
  a1 = v31;
  a2 = v29;
LABEL_9:
  uint64_t v21 = *(void *)(v19 + 64);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(a4, a1, a2, ObjectType, v21);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a1;
  *(void *)(v23 + 24) = a2;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_1000102E0();
  swift_release();
  swift_release();
  return v24;
}

uint64_t sub_100006224(uint64_t a1)
{
  uint64_t v3 = sub_100010260();
  sub_10000703C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  id v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004F54((uint64_t)v11);
  if (v12)
  {
    sub_100006EE4((uint64_t)v11, (uint64_t)v10);
    sub_100006CA8((uint64_t)v11, &qword_100019688);
    uint64_t v13 = v1;
    sub_100006C64(v10, v10[3]);
    sub_10000FF90();
    sub_100004508((uint64_t)v10);
  }
  else
  {
    sub_100006CA8((uint64_t)v11, &qword_100019688);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v3);
  sub_1000043B4(&qword_100019690);
  swift_allocObject();
  return sub_100010300();
}

uint64_t LocalSearchRequestManager.deinit()
{
  sub_100004508(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  sub_100006CA8(v0 + 80, &qword_1000195A8);
  swift_release();

  return v0;
}

uint64_t LocalSearchRequestManager.__deallocating_deinit()
{
  LocalSearchRequestManager.deinit();

  return _swift_deallocClassInstance(v0, 144, 7);
}

uint64_t sub_100006414()
{
  return sub_10000FEC0();
}

uint64_t sub_100006444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Updatable.reset<A>(setting:)(a1, *v5, a5);
}

uint64_t sub_100006474(uint64_t a1)
{
  return Updatable.apply(preset:)(a1, *v1);
}

uint64_t sub_1000064A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Configurable.setting<A>(_:)(a1, *v5, a5);
}

uint64_t sub_1000064D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100006500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_100006530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_100006560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v21 = a5;
  uint64_t v22 = a7;
  uint64_t v15 = *(void *)(a8 - 8);
  __chkstk_darwin();
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a4, a8);
  uint64_t v19 = sub_1000066F8(a1, a2, a3, (uint64_t)v17, v21, v18, v22, a8, a9, a10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, a8);
  return v19;
}

uint64_t sub_1000066A8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000066F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v25 = a9;
  uint64_t v26 = a2;
  uint64_t v24 = sub_100010520();
  uint64_t v22 = *(void *)(v24 - 8);
  __chkstk_darwin();
  uint64_t v23 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = sub_100010510();
  __chkstk_darwin();
  v21[2] = (char *)v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010430();
  __chkstk_darwin();
  sub_100010290();
  __chkstk_darwin();
  v28[3] = a8;
  v28[4] = a10;
  uint64_t v18 = sub_100006E80(v28);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(v18, a4, a8);
  uint64_t v27 = &_swiftEmptyArrayStorage;
  sub_100006F88((unint64_t *)&qword_1000193E8, 255, (void (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags);
  sub_1000043B4(&qword_1000193F0);
  sub_100006FD0((unint64_t *)&qword_1000193F8, &qword_1000193F0);
  sub_100010590();
  sub_1000043B4(&qword_100019400);
  swift_allocObject();
  *(void *)(a6 + 72) = sub_100010270();
  *(void *)(a6 + 80) = 0;
  *(void *)(a6 + 88) = 0;
  *(void *)(a6 + 96) = 0;
  *(_OWORD *)(a6 + 104) = xmmword_1000118B0;
  uint64_t v19 = v25;
  *(void *)(a6 + 56) = a1;
  *(void *)(a6 + 64) = v19;
  *(void *)(a6 + 120) = v26;
  *(void *)(a6 + 128) = a3;
  sub_100006EE4((uint64_t)v28, a6 + 16);
  if (!a5)
  {
    sub_100006F48();
    swift_unknownObjectRetain();
    swift_retain();
    sub_100010420();
    uint64_t v27 = &_swiftEmptyArrayStorage;
    sub_100006F88(&qword_1000196A8, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_1000043B4(&qword_1000196B0);
    sub_100006FD0(&qword_1000196B8, &qword_1000196B0);
    sub_100010590();
    (*(void (**)(char *, void, uint64_t))(v22 + 104))(v23, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v24);
    a5 = sub_100010530();
    swift_unknownObjectRelease();
    swift_release();
  }
  sub_100004508((uint64_t)v28);
  *(void *)(a6 + 136) = a5;
  return a6;
}

uint64_t sub_100006B04()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006B44()
{
  return sub_1000057B4();
}

uint64_t sub_100006B64()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100006BAC()
{
  return sub_100005D4C();
}

uint64_t sub_100006BCC(uint64_t a1, uint64_t a2)
{
  return sub_100006F88(&qword_1000195B0, a2, (void (*)(uint64_t))type metadata accessor for LocalSearchRequestManager);
}

uint64_t type metadata accessor for LocalSearchRequestManager()
{
  return self;
}

uint64_t sub_100006C38()
{
  return sub_100005DAC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_100006C48(uint64_t a1)
{
  return sub_100006224(a1);
}

void *sub_100006C64(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006CA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000043B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006D04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000043B4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000043B4(&qword_1000195A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000043B4(&qword_100019688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006E3C()
{
  return sub_100005810(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t **)(v0 + 40));
}

uint64_t sub_100006E48()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t *sub_100006E80(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006F48()
{
  unint64_t result = qword_1000196A0;
  if (!qword_1000196A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000196A0);
  }
  return result;
}

uint64_t sub_100006F88(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100006FD0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000449C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007024(uint64_t a1)
{
  return sub_100006C48(a1);
}

uint64_t sub_100007068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager;
  swift_beginAccess();
  sub_10000CB08(v3, (uint64_t)&v12, &qword_100019768);
  if (!v13)
  {
    sub_10000CB64((uint64_t)&v12, &qword_100019768);
    uint64_t v4 = sub_1000071C8();
    type metadata accessor for LocalSearchRequestService();
    uint64_t v5 = (void *)swift_allocObject();
    v5[5] = sub_1000100A0();
    v5[6] = &protocol witness table for AppConfigurationManager;
    v5[2] = v4;
    uint64_t v6 = sub_1000071C8();
    uint64_t v7 = type metadata accessor for LocalSearchRequestManager();
    uint64_t v8 = swift_allocObject();
    uint64_t v9 = sub_10000C304((uint64_t)v5, (uint64_t)sub_100007230, 0, v6, 0, v8);
    uint64_t v13 = v7;
    uint64_t v14 = &off_100014BF8;
    *(void *)&long long v12 = v9;
    sub_100006EE4((uint64_t)&v12, (uint64_t)v11);
    swift_beginAccess();
    sub_10000CBB8((uint64_t)v11, v3, &qword_100019768);
    swift_endAccess();
  }
  return sub_10000CAB4(&v12, a1);
}

uint64_t sub_1000071C8()
{
  uint64_t v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager;
  if (*(void *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager);
  }
  else
  {
    uint64_t v2 = sub_1000075DC(v0);
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_100007230@<X0>(uint64_t a1@<X8>)
{
  v16[0] = a1;
  uint64_t v1 = sub_1000103C0();
  uint64_t v20 = *(void *)(v1 - 8);
  uint64_t v21 = v1;
  __chkstk_darwin(v1);
  uint64_t v19 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000103E0();
  uint64_t v3 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000103B0();
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010400();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_1000103A0();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_1000103F0();
  __chkstk_darwin(v11 - 8);
  v16[1] = sub_100010410();
  uint64_t v12 = sub_10000FF40();
  sub_10000FF30();
  sub_100010390();
  sub_10000FF10();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Database.VacuumMode.incremental(_:), v17);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Database.JournalingMode.wal(_:), v18);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v19, enum case for Database.RecoveryMode.throw(_:), v21);
  char v23 = 1;
  uint64_t v13 = v22;
  uint64_t result = sub_1000103D0();
  if (!v13)
  {
    swift_allocObject();
    uint64_t result = sub_10000FF20();
    uint64_t v15 = (uint64_t *)v16[0];
    *(void *)(v16[0] + 24) = v12;
    v15[4] = (uint64_t)&protocol witness table for GeocodeStore;
    *uint64_t v15 = result;
  }
  return result;
}

uint64_t sub_1000075DC(uint64_t a1)
{
  uint64_t v2 = sub_10000FDA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = sub_10000FF00();
  sub_10000FEB0();
  sub_10000FE90();
  sub_10000FEA0();
  swift_release();
  sub_10000FD90();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v8 = sub_10000FEF0();
  uint64_t v29 = v7;
  uint64_t v30 = &protocol witness table for WeatherConfigurationManager;
  uint64_t v28 = v8;
  uint64_t v9 = sub_100010020();
  swift_allocObject();
  uint64_t v10 = sub_100010010();
  uint64_t v26 = v9;
  uint64_t v27 = &protocol witness table for PermanentURLFactory;
  uint64_t v25 = v10;
  uint64_t v11 = sub_100010160();
  uint64_t v12 = sub_100010150();
  uint64_t v23 = v11;
  uint64_t v24 = &protocol witness table for UbiquitousKeyValueStoreProvider;
  uint64_t v22 = v12;
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler_iCloudStatusProvider);
  void v21[3] = sub_100010060();
  v21[4] = &protocol witness table for iCloudStatusProvider;
  v21[0] = v13;
  uint64_t v14 = sub_10000FF60();
  swift_allocObject();
  swift_retain();
  uint64_t v15 = sub_10000FF50();
  uint64_t v23 = v14;
  uint64_t v24 = &protocol witness table for IdentityService;
  uint64_t v22 = v15;
  uint64_t v16 = sub_100010180();
  swift_allocObject();
  uint64_t v17 = sub_100010170();
  uint64_t v23 = v16;
  uint64_t v24 = &protocol witness table for AppConfigurationRemoteSettingsProvider;
  uint64_t v22 = v17;
  sub_1000100C0();
  swift_allocObject();
  sub_1000100B0();
  sub_10000C718(&qword_100019770, (void (*)(uint64_t))&type metadata accessor for AppConfigurationService);
  uint64_t v18 = sub_100010080();
  swift_allocObject();
  uint64_t v19 = sub_100010070();
  uint64_t v29 = v18;
  uint64_t v30 = &protocol witness table for AppConfigurationStore;
  uint64_t v28 = v19;
  sub_1000100A0();
  swift_allocObject();
  return sub_100010090();
}

uint64_t sub_1000078E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory;
  swift_beginAccess();
  sub_10000CB08(v3, (uint64_t)&v8, &qword_1000197A8);
  if (!v9)
  {
    sub_10000CB64((uint64_t)&v8, &qword_1000197A8);
    uint64_t v4 = sub_1000100E0();
    swift_allocObject();
    uint64_t v5 = sub_1000100D0();
    uint64_t v9 = v4;
    uint64_t v10 = &protocol witness table for LocationDataModelFactory;
    *(void *)&long long v8 = v5;
    sub_100006EE4((uint64_t)&v8, (uint64_t)v7);
    swift_beginAccess();
    sub_10000CBB8((uint64_t)v7, v3, &qword_1000197A8);
    swift_endAccess();
  }
  return sub_10000CAB4(&v8, a1);
}

uint64_t sub_1000079E0()
{
  uint64_t v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler;
  if (*(void *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler);
  }
  else
  {
    uint64_t v3 = v0;
    sub_100007A70();
    sub_100010110();
    swift_allocObject();
    uint64_t v2 = sub_100010100();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_100007A70()
{
  uint64_t v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)WCDefaultCityManager) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_100007AE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader;
  swift_beginAccess();
  sub_10000CB08(v3, (uint64_t)&v7, &qword_100019790);
  if (!v8)
  {
    sub_10000CB64((uint64_t)&v7, &qword_100019790);
    uint64_t v4 = sub_100007BCC();
    uint64_t v8 = sub_100010040();
    uint64_t v9 = &protocol witness table for SavedLocationsReader;
    *(void *)&long long v7 = v4;
    sub_100006EE4((uint64_t)&v7, (uint64_t)v6);
    swift_beginAccess();
    sub_10000CBB8((uint64_t)v6, v3, &qword_100019790);
    swift_endAccess();
  }
  return sub_10000CAB4(&v7, a1);
}

uint64_t sub_100007BCC()
{
  uint64_t v0 = sub_1000043B4(&qword_100019798);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100010160();
  uint64_t v4 = sub_100010150();
  uint64_t v22 = v3;
  uint64_t v23 = &protocol witness table for UbiquitousKeyValueStoreProvider;
  uint64_t v21 = v4;
  sub_1000078E4((uint64_t)v20);
  uint64_t v5 = sub_100010000();
  uint64_t v6 = sub_10000FDA0();
  sub_100004A24((uint64_t)v2, 1, 1, v6);
  uint64_t v7 = sub_100010130();
  swift_allocObject();
  uint64_t v8 = sub_100010120();
  uint64_t v18 = v7;
  uint64_t v19 = &protocol witness table for SyncedDataContextProvider;
  uint64_t v17 = v8;
  uint64_t v9 = sub_1000079E0();
  uint64_t v15 = sub_100010110();
  uint64_t v16 = &protocol witness table for SavedLocationsReconciler;
  uint64_t v14 = v9;
  uint64_t v10 = sub_10000FFF0();
  uint64_t v18 = v5;
  uint64_t v19 = &protocol witness table for SyncedDataManager;
  uint64_t v17 = v10;
  uint64_t v11 = sub_10000CACC(0, &qword_1000197A0);
  uint64_t v12 = sub_100010500();
  uint64_t v15 = v11;
  uint64_t v16 = &protocol witness table for NSUserDefaults;
  uint64_t v14 = v12;
  sub_100010040();
  swift_allocObject();
  return sub_100010030();
}

void *sub_100007D80()
{
  uint64_t v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations;
  if (*(void *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations))
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations);
  }
  else
  {
    uint64_t v2 = sub_100007DE8();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_100007DE8()
{
  uint64_t v0 = sub_100010260();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10000FFE0();
  uint64_t v65 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v5 = (char *)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000101C0();
  uint64_t v66 = *(void *)(v6 - 8);
  uint64_t v67 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v59 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v59 - v13;
  sub_100007AE4((uint64_t)v69);
  v64 = (char *)v69[4];
  sub_100006C64(v69, v69[3]);
  uint64_t v15 = sub_1000100F0();
  uint64_t v16 = &_swiftEmptyArrayStorage;
  v61 = v9;
  if (v15)
  {
    int64_t v17 = *(void *)(v15 + 16);
    if (v17)
    {
      v68 = &_swiftEmptyArrayStorage;
      uint64_t v18 = v15;
      sub_10000BC54(0, v17, 0);
      uint64_t v19 = *(char **)(v65 + 16);
      uint64_t v20 = *(unsigned __int8 *)(v65 + 80);
      v59[1] = v18;
      uint64_t v21 = v18 + ((v20 + 32) & ~v20);
      v63 = *(void (***)(char *, uint64_t))(v65 + 72);
      v64 = v19;
      v65 += 16;
      uint64_t v22 = (void (**)(char *, uint64_t))(v65 - 8);
      uint64_t v62 = v66 + 32;
      uint64_t v23 = v60;
      do
      {
        ((void (*)(char *, uint64_t, uint64_t))v64)(v5, v21, v23);
        sub_10000FFD0();
        (*v22)(v5, v23);
        uint64_t v16 = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000BC54(0, v16[2] + 1, 1);
          uint64_t v16 = v68;
        }
        unint64_t v25 = v16[2];
        unint64_t v24 = v16[3];
        if (v25 >= v24 >> 1)
        {
          sub_10000BC54(v24 > 1, v25 + 1, 1);
          uint64_t v16 = v68;
        }
        void v16[2] = v25 + 1;
        uint64_t v26 = v66;
        (*(void (**)(unint64_t, char *, uint64_t))(v66 + 32))((unint64_t)v16+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v25, v14, v67);
        v68 = v16;
        v21 += (uint64_t)v63;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = v66;
    }
    sub_100004508((uint64_t)v69);
  }
  else
  {
    sub_100004508((uint64_t)v69);
    id v27 = sub_100007A70();
    uint64_t v28 = sub_100010540();

    int64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      v69[0] = &_swiftEmptyArrayStorage;
      sub_10000BC54(0, v29, 0);
      uint64_t v31 = *(char **)(v1 + 16);
      uint64_t v30 = v1 + 16;
      uint64_t v32 = *(unsigned __int8 *)(v30 + 64);
      uint64_t v60 = v28;
      uint64_t v33 = v28 + ((v32 + 32) & ~v32);
      v63 = *(void (***)(char *, uint64_t))(v30 + 56);
      v64 = v31;
      uint64_t v65 = v30;
      uint64_t v34 = (void (**)(char *, uint64_t))(v30 - 8);
      uint64_t v62 = v66 + 32;
      uint64_t v35 = v0;
      do
      {
        ((void (*)(char *, uint64_t, uint64_t))v64)(v3, v33, v0);
        sub_1000101E0();
        (*v34)(v3, v0);
        uint64_t v16 = (void *)v69[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000BC54(0, v16[2] + 1, 1);
          uint64_t v16 = (void *)v69[0];
        }
        unint64_t v37 = v16[2];
        unint64_t v36 = v16[3];
        if (v37 >= v36 >> 1)
        {
          sub_10000BC54(v36 > 1, v37 + 1, 1);
          uint64_t v16 = (void *)v69[0];
        }
        void v16[2] = v37 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v66 + 32))((unint64_t)v16+ ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80))+ *(void *)(v66 + 72) * v37, v12, v67);
        v69[0] = v16;
        v33 += (uint64_t)v63;
        --v29;
        uint64_t v0 = v35;
      }
      while (v29);
    }
    swift_bridgeObjectRelease();
    uint64_t v26 = v66;
  }
  uint64_t v38 = v16[2];
  if (v38)
  {
    v69[0] = &_swiftEmptyArrayStorage;
    sub_100010600();
    uint64_t v39 = type metadata accessor for WeatherLocation();
    uint64_t v41 = *(void *)(v26 + 16);
    uint64_t v40 = v26 + 16;
    uint64_t v65 = v41;
    uint64_t v66 = v39;
    v42 = (char *)v16 + ((*(unsigned __int8 *)(v40 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 64));
    v43 = *(char **)(v40 + 56);
    v63 = (void (**)(char *, uint64_t))(v40 - 8);
    v64 = v43;
    v44 = v61;
    uint64_t v45 = v67;
    do
    {
      ((void (*)(char *, char *, uint64_t))v65)(v44, v42, v45);
      sub_1000101A0();
      double v47 = v46;
      double v49 = v48;
      uint64_t v50 = sub_1000101B0();
      uint64_t v52 = v51;
      uint64_t v53 = v40;
      uint64_t v54 = sub_100010550();
      uint64_t v56 = v55;
      swift_bridgeObjectRetain();
      sub_10000B61C(v54, v56, v50, v52, v47, v49);
      (*v63)(v44, v45);
      sub_1000105E0();
      sub_100010610();
      uint64_t v40 = v53;
      sub_100010620();
      sub_1000105F0();
      v42 = &v64[(void)v42];
      --v38;
    }
    while (v38);
    uint64_t v57 = v69[0];
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v57;
}

void *sub_100008458(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      uint64_t v12 = &_swiftEmptyArrayStorage;
      uint64_t result = (void *)sub_100010600();
      if (v5 < 0) {
        break;
      }
      uint64_t v7 = 0;
      while (v5 != v7)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v8 = (id)sub_1000105B0();
        }
        else {
          id v8 = *(id *)(a1 + 8 * v7 + 32);
        }
        uint64_t v9 = v8;
        id v10 = v8;
        sub_10000B1B0(&v10, &v11);

        if (v2)
        {

          swift_release();
          return v9;
        }
        ++v7;
        sub_1000105E0();
        sub_100010610();
        sub_100010620();
        sub_1000105F0();
        if (v5 == v7)
        {
          uint64_t v9 = v12;

          return v9;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100010660();
      swift_bridgeObjectRelease();
      if (!v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:

    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000085E0(uint64_t a1)
{
  uint64_t v3 = sub_100010260();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v7)
  {
    v24[1] = v1;
    uint64_t v31 = &_swiftEmptyArrayStorage;
    sub_100010600();
    uint64_t v29 = sub_1000043B4(&qword_100019750);
    uint64_t v9 = *(void *)(v29 - 8);
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v28 = type metadata accessor for WeatherLocation();
    uint64_t v27 = *(void *)(v9 + 72);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v30 = v4 + 16;
    unint64_t v25 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v26 = v11;
    do
    {
      v26(v6, v10, v3);
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_100010200();
      uint64_t v13 = v3;
      uint64_t v15 = v14;
      sub_1000101D0();
      double v17 = v16;
      double v19 = v18;
      uint64_t v20 = sub_100010250();
      uint64_t v22 = v21;
      uint64_t v23 = v15;
      uint64_t v3 = v13;
      sub_10000B61C(v12, v23, v20, v22, v17, v19);
      (*v25)(v6, v13);
      sub_1000105E0();
      sub_100010610();
      sub_100010620();
      sub_1000105F0();
      v10 += v27;
      --v7;
    }
    while (v7);
    return v31;
  }
  return result;
}

uint64_t sub_10000883C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a1;
  v9[6] = a2;
  id v10 = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100010340();

  return swift_release();
}

void sub_1000088E0(uint64_t a1, void (*a2)(void, void), uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v32 = sub_100010380();
  uint64_t v10 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter;
  uint64_t v14 = *(char **)(a1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter);
  if (v14
    || (id v15 = [objc_allocWithZone((Class)MKLocalSearchCompleter) init],
        id v16 = objc_allocWithZone((Class)type metadata accessor for LocationSearchCompleter()),
        double v17 = LocationSearchCompleter.init(searchCompleter:)(v15),
        double v18 = *(void **)(a1 + v13),
        *(void *)(a1 + v13) = v17,
        v18,
        (uint64_t v14 = *(char **)(a1 + v13)) != 0))
  {
    v31._uint64_t countAndFlagsBits = a4;
    v31._object = a5;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a2;
    *(void *)(v19 + 24) = a3;
    uint64_t v20 = (uint64_t *)&v14[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
    swift_beginAccess();
    uint64_t v21 = *v20;
    *uint64_t v20 = (uint64_t)sub_10000C13C;
    v20[1] = v19;
    uint64_t v22 = v14;
    swift_retain();
    sub_100003120(v21);
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v24 = (void *)swift_allocObject();
    void v24[2] = v23;
    v24[3] = a2;
    v24[4] = a3;
    unint64_t v25 = (uint64_t *)&v22[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate];
    swift_beginAccess();
    uint64_t v26 = *v25;
    *unint64_t v25 = (uint64_t)sub_10000C18C;
    v25[1] = (uint64_t)v24;
    swift_retain();
    sub_100003120(v26);
    sub_100010360();
    uint64_t v27 = sub_100010370();
    os_log_type_t v28 = sub_1000104F0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Starting a search ...", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v32);
    LocationSearchCompleter.searchLocations(for:)(v31);
  }
  else
  {
    a2(0, 0);
  }
}

uint64_t sub_100008BD0(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v3 = sub_100010380();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010360();
  uint64_t v7 = sub_100010370();
  os_log_type_t v8 = sub_1000104E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "We encountered an error while updating the search term.", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(0, 0);
}

void sub_100008D28(uint64_t a1, uint64_t a2, void (*a3)(void, void), uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    __chkstk_darwin(Strong);
    sub_1000043B4(&qword_100019748);
    sub_100010330();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    *(void *)(v8 + 24) = a4;
    swift_retain();
    uint64_t v9 = (void *)sub_1000102B0();
    sub_1000102D0();
    swift_release();
    swift_release();

    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a3;
    *(void *)(v10 + 24) = a4;
    swift_retain();
    uint64_t v11 = (void *)sub_1000102B0();
    sub_1000102F0();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    a3(0, 0);
  }
}

uint64_t sub_100008EE4(unint64_t a1)
{
  sub_100008458(a1, v1);
  uint64_t v2 = (void *)sub_1000102B0();
  sub_1000043B4(&qword_100019750);
  uint64_t v3 = sub_1000102A0();
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t sub_100008F68(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v5;
  v6[3] = a2;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100010340();
  return swift_release();
}

void sub_100008FFC(uint64_t a1, void (*a2)(void, void))
{
  uint64_t v4 = sub_100010380();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000085E0(a1);
  if (qword_1000193C0 != -1) {
    swift_once();
  }
  uint64_t v8 = (objc_class *)(id)qword_100019938;
  v34._uint64_t countAndFlagsBits = 0x80000001000123A0;
  v44._uint64_t countAndFlagsBits = 0x6F4C20726568744FLL;
  v44._object = (void *)0xEF736E6F69746163;
  v45.value._uint64_t countAndFlagsBits = 0;
  v45.value._object = 0;
  v9.super.Class isa = v8;
  v46._uint64_t countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  uint64_t v10 = sub_10000FD70(v44, v45, v9, v46, v34);
  uint64_t v12 = v11;

  id v13 = objc_allocWithZone((Class)INObjectSection);
  id v14 = sub_10000B7EC(v10, v12);
  sub_1000043B4(&qword_100019738);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100011A20;
  *(void *)(v15 + 32) = v14;
  uint64_t v43 = v15;
  sub_1000104D0();
  id v16 = objc_allocWithZone((Class)INObjectCollection);
  id v17 = v14;
  sub_1000043B4(&qword_100019740);
  Class isa = sub_1000104A0().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [v16 initWithSections:isa];

  sub_100010360();
  id v20 = v19;
  uint64_t v21 = sub_100010370();
  os_log_type_t v22 = sub_1000104F0();
  if (os_log_type_enabled(v21, v22))
  {
    id v41 = v17;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v43 = v39;
    unint64_t v36 = v23;
    *(_DWORD *)uint64_t v23 = 136446210;
    v35[1] = v23 + 4;
    id v24 = v20;
    id v25 = [v24 description];
    uint64_t v40 = v4;
    id v26 = v25;
    uint64_t v27 = sub_100010470();
    uint64_t v37 = v5;
    uint64_t v38 = v7;
    os_log_type_t v28 = a2;
    uint64_t v29 = v27;
    unint64_t v31 = v30;

    uint64_t v32 = v29;
    a2 = v28;
    uint64_t v42 = sub_100003BFC(v32, v31, &v43);
    sub_100010570();

    id v17 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "We have an updated search term and the collection was just updated. Collection=%{public}s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  id v33 = v20;
  a2(v20, 0);
}

id sub_100009410()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  uint64_t v3 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler_iCloudStatusProvider;
  sub_100010060();
  swift_allocObject();
  uint64_t v4 = v0;
  *(void *)&v0[v3] = sub_100010050();
  *(void *)&v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager] = 0;
  uint64_t v5 = &v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager] = 0;
  uint64_t v6 = &v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(void *)&v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter] = 0;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return [super init];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void sub_100009638(uint64_t a1, uint64_t a2, unint64_t a3, void (**a4)(void, void, void), void (**a5)(void, void, void))
{
  v59 = a4;
  uint64_t v8 = sub_100010380();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v58 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v53 - v13;
  __chkstk_darwin(v12);
  id v16 = (char *)&v53 - v15;
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = a5;
  _Block_copy(a5);
  sub_100010360();
  id v17 = sub_100010370();
  os_log_type_t v18 = sub_1000104F0();
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "About to provide locations options collection for intent handling", v19, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v20 = v9 + 8;
  uint64_t v21 = v22;
  v22(v16, v8);
  if (!a3) {
    goto LABEL_10;
  }
  uint64_t v23 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v23 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    sub_100010360();
    id v24 = sub_100010370();
    os_log_type_t v25 = sub_1000104F0();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "We have a search term so we need to reverse geocode that term ...", v26, 2u);
      swift_slowDealloc();
    }

    v21(v14, v8);
    sub_10000883C(a2, a3, (uint64_t)sub_10000C0DC, v60);
    swift_release();
  }
  else
  {
LABEL_10:
    if (qword_1000193C0 != -1) {
      swift_once();
    }
    uint64_t v27 = (objc_class *)(id)qword_100019938;
    v52._uint64_t countAndFlagsBits = 0x8000000100012360;
    v63._uint64_t countAndFlagsBits = 0x636F4C2072756F59;
    v63._object = (void *)0xEE00736E6F697461;
    v64.value._uint64_t countAndFlagsBits = 0;
    v64.value._object = 0;
    v28.super.Class isa = v27;
    v65._uint64_t countAndFlagsBits = 0;
    v65._object = (void *)0xE000000000000000;
    uint64_t v29 = sub_10000FD70(v63, v64, v28, v65, v52);
    uint64_t v31 = v30;

    sub_100009C14();
    id v32 = objc_allocWithZone((Class)INObjectSection);
    id v33 = sub_10000B7EC(v29, v31);
    sub_1000043B4(&qword_100019738);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_100011A20;
    *(void *)(v34 + 32) = v33;
    uint64_t v62 = v34;
    sub_1000104D0();
    id v35 = objc_allocWithZone((Class)INObjectCollection);
    id v36 = v33;
    sub_1000043B4(&qword_100019740);
    Class isa = sub_1000104A0().super.isa;
    swift_bridgeObjectRelease();
    id v38 = [v35 initWithSections:isa];

    uint64_t v39 = v58;
    sub_100010360();
    id v40 = v38;
    id v41 = sub_100010370();
    os_log_type_t v42 = sub_1000104F0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v57 = v20;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v56 = v21;
      uint64_t v62 = v55;
      *(_DWORD *)uint64_t v43 = 136446210;
      uint64_t v53 = v43 + 4;
      id v44 = v40;
      v59 = a5;
      id v45 = v44;
      id v46 = v36;
      id v47 = [v44 description];
      uint64_t v48 = sub_100010470();
      uint64_t v54 = v8;
      uint64_t v49 = v48;
      unint64_t v51 = v50;

      id v36 = v46;
      uint64_t v61 = sub_100003BFC(v49, v51, &v62);
      sub_100010570();

      a5 = v59;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "We have NO search term so we need to reverse provide the zero locations list. Collection=%{public}s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v56(v58, v54);
    }
    else
    {

      v21(v39, v8);
    }
    ((void (**)(void, id, void))a5)[2](a5, v40, 0);
    swift_release();
  }
  _Block_release(a5);
}

uint64_t sub_100009C14()
{
  uint64_t v0 = sub_100010380();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v25 - v5;
  sub_100010360();
  uint64_t v7 = sub_100010370();
  os_log_type_t v8 = sub_1000104F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "About to determine zero keyword locations for (current location + saved locations)", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v11 = v1 + 8;
  uint64_t v10 = v12;
  v12(v6, v0);
  sub_1000043B4(&qword_100019738);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100011A20;
  *(void *)(v13 + 32) = sub_10000A2E8();
  uint64_t v29 = v13;
  sub_1000104D0();
  uint64_t v14 = v29;
  uint64_t v15 = sub_100007D80();
  uint64_t v29 = v14;
  sub_10000BE10((unint64_t)v15);
  uint64_t v16 = v29;
  sub_100010360();
  swift_bridgeObjectRetain_n();
  id v17 = sub_100010370();
  os_log_type_t v18 = sub_1000104F0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v27 = v10;
    *(_DWORD *)uint64_t v19 = 141558275;
    uint64_t v28 = 1752392040;
    uint64_t v29 = v20;
    uint64_t v26 = v0;
    sub_100010570();
    *(_WORD *)(v19 + 12) = 2081;
    v25[1] = v11;
    type metadata accessor for WeatherLocation();
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000104C0();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_100003BFC(v21, v23, &v29);
    sub_100010570();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Returning zero keyword locations=%{private,mask.hash}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v27(v4, v26);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v10(v4, v0);
  }
  return v16;
}

void sub_10000A040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10000FD80();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_10000A0B0(void *a1)
{
  uint64_t v2 = sub_100010380();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010360();
  id v6 = a1;
  uint64_t v7 = sub_100010370();
  os_log_type_t v8 = sub_1000104F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = v3;
    uint64_t v10 = v9;
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 141558275;
    uint64_t v17 = 1752392040;
    sub_100010570();
    *(_WORD *)(v10 + 12) = 2113;
    uint64_t v17 = (uint64_t)v6;
    uint64_t v11 = v6;
    uint64_t v16 = v2;
    uint64_t v12 = v11;
    sub_100010570();
    *uint64_t v14 = v6;

    uint64_t v2 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "About to determine default location for intent:%{private,mask.hash}@", (uint8_t *)v10, 0x16u);
    sub_1000043B4(&qword_100019730);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v15;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v7 = v6;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_10000A2E8();
}

id sub_10000A2E8()
{
  uint64_t v0 = sub_100010380();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000193B0 != -1) {
    swift_once();
  }
  uint64_t v4 = static WeatherLocation.currentLocationID;
  uint64_t v5 = unk_100019920;
  type metadata accessor for WeatherLocation();
  uint64_t v6 = qword_1000193C0;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = (objc_class *)(id)qword_100019938;
  v25._uint64_t countAndFlagsBits = 0x8000000100012310;
  v32._uint64_t countAndFlagsBits = 0x7461636F4C20794DLL;
  v32._object = (void *)0xEB000000006E6F69;
  v33.value._uint64_t countAndFlagsBits = 0;
  v33.value._object = 0;
  v8.super.Class isa = v7;
  v34._uint64_t countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10000FD70(v32, v33, v8, v34, v25);

  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v10 = sub_10000B87C(v4, v5);
  sub_100010360();
  id v11 = v10;
  uint64_t v12 = sub_100010370();
  os_log_type_t v13 = sub_1000104F0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = v15;
    *(_DWORD *)uint64_t v14 = 141558275;
    uint64_t v30 = 1752392040;
    uint64_t v31 = v15;
    sub_100010570();
    *(_WORD *)(v14 + 12) = 2081;
    uint64_t v26 = v14 + 14;
    id v16 = v11;
    uint64_t v28 = v3;
    uint64_t v17 = v1;
    id v18 = v16;
    id v19 = [v16 description];
    uint64_t v20 = sub_100010470();
    uint64_t v27 = v0;
    uint64_t v21 = v20;
    unint64_t v23 = v22;

    uint64_t v30 = sub_100003BFC(v21, v23, &v31);
    sub_100010570();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "currentLocation=%{private,mask.hash}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v17 + 8))(v28, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v11;
}

id sub_10000A6D8@<X0>(void *a1@<X8>)
{
  a1[3] = swift_getObjectType();
  *a1 = v3;

  return v3;
}

void sub_10000A790(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = sub_100010380();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = &v36[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  id v11 = &v36[-v10];
  id v12 = [a1 location];
  if (v12)
  {
    os_log_type_t v13 = v12;
    sub_100010360();
    id v14 = a1;
    id v15 = v13;
    id v16 = v14;
    id v17 = v15;
    id v18 = sub_100010370();
    os_log_type_t v19 = sub_1000104F0();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      os_log_t v39 = v18;
      unint64_t v22 = (void *)v38;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v40 = v23;
      *(_DWORD *)uint64_t v21 = 141558787;
      uint64_t v41 = v5;
      uint64_t v42 = v6;
      uint64_t v44 = 1752392040;
      uint64_t v45 = v23;
      sub_100010570();
      *(_WORD *)(v21 + 12) = 2113;
      uint64_t v43 = a3;
      uint64_t v44 = (uint64_t)v16;
      id v24 = v16;
      int v37 = v20;
      id v25 = v24;
      sub_100010570();
      *unint64_t v22 = v16;

      *(_WORD *)(v21 + 22) = 2160;
      uint64_t v44 = 1752392040;
      sub_100010570();
      *(_WORD *)(v21 + 32) = 2081;
      id v26 = v17;
      id v27 = [v26 description];
      uint64_t v28 = sub_100010470();
      unint64_t v30 = v29;

      uint64_t v44 = sub_100003BFC(v28, v30, &v45);
      sub_100010570();

      a3 = v43;
      swift_bridgeObjectRelease();
      os_log_t v31 = v39;
      _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v37, "Resolving location for intent with success. intent %{private,mask.hash}@. location: %{private,mask.hash}s", (uint8_t *)v21, 0x2Au);
      sub_1000043B4(&qword_100019730);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v11, v41);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
    }
    type metadata accessor for WeatherLocationResolutionResult();
    id v35 = static WeatherLocationResolutionResult.success(with:)((uint64_t)v17);
    ((void (**)(void, id))a3)[2](a3, v35);
  }
  else
  {
    sub_100010360();
    Swift::String v32 = sub_100010370();
    os_log_type_t v33 = sub_1000104F0();
    if (os_log_type_enabled(v32, v33))
    {
      Swift::String v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Resolving location for intent not required.", v34, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
    type metadata accessor for WeatherLocationResolutionResult();
    id v35 = [(id)swift_getObjCClassFromMetadata() notRequired];
    ((void (**)(void, id))a3)[2](a3, v35);
  }

  _Block_release(a3);
}

void sub_10000AC24(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v41 = 7104878;
  uint64_t v5 = sub_100010380();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [a1 location];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [v9 displayString];

    uint64_t v12 = sub_100010470();
    unint64_t v14 = v13;
  }
  else
  {
    unint64_t v14 = 0xE300000000000000;
    uint64_t v12 = 7104878;
  }
  id v15 = [a1 location];
  uint64_t v42 = v6;
  uint64_t v43 = v5;
  uint64_t v40 = v12;
  if (v15 && (uint64_t v16 = sub_10000C03C(v15), v17))
  {
    unint64_t v18 = v17;
    uint64_t v41 = v16;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v18 = 0xE300000000000000;
  }
  sub_100010360();
  id v19 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int v20 = sub_100010370();
  os_log_type_t v21 = sub_1000104F0();
  unint64_t v22 = v8;
  int v23 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v24 = swift_slowAlloc();
    os_log_t v39 = a3;
    uint64_t v25 = v24;
    id v26 = (void *)swift_slowAlloc();
    v35[1] = v26;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v37 = v27;
    *(_DWORD *)uint64_t v25 = 141559299;
    uint64_t v44 = 1752392040;
    uint64_t v45 = v27;
    uint64_t v38 = v22;
    sub_100010570();
    *(_WORD *)(v25 + 12) = 2113;
    uint64_t v44 = (uint64_t)v19;
    id v28 = v19;
    int v36 = v23;
    id v29 = v28;
    sub_100010570();
    *id v26 = v19;

    *(_WORD *)(v25 + 22) = 2160;
    uint64_t v44 = 1752392040;
    sub_100010570();
    *(_WORD *)(v25 + 32) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100003BFC(v40, v14, &v45);
    sub_100010570();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 42) = 2160;
    uint64_t v44 = 1752392040;
    sub_100010570();
    *(_WORD *)(v25 + 52) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100003BFC(v41, v18, &v45);
    sub_100010570();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v36, "Handling intent %{private,mask.hash}@. displayString: %{private,mask.hash}s. identifier: %{private,mask.hash}s", (uint8_t *)v25, 0x3Eu);
    sub_1000043B4(&qword_100019730);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v39;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v38, v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
  }
  id v30 = objc_allocWithZone((Class)type metadata accessor for WeatherIntentResponse());
  os_log_t v31 = WeatherIntentResponse.init(code:userActivity:)(2, 0);
  id v32 = [v19 location];
  NSString v33 = v32;
  if (v32)
  {
    id v34 = [v32 displayString];

    sub_100010470();
    NSString v33 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  [v31 setLocationName:v33];

  ((void (**)(void, char *))a3)[2](a3, v31);
  _Block_release(a3);
}

void sub_10000B124(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
}

uint64_t sub_10000B1B0@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000043B4(&qword_100019750);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v29[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000043B4(&qword_100019680);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v29[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100010260();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v29[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = *a1;
  sub_100004634(v14, (uint64_t)v9);
  if (sub_100004AAC((uint64_t)v9, 1, v10) == 1)
  {
    sub_10000CB64((uint64_t)v9, &qword_100019680);
    sub_100007068((uint64_t)v29);
    sub_100006C64(v29, v29[3]);
    id v15 = [v14 wi_calloutTitle];
    uint64_t v16 = sub_100010470();
    uint64_t v18 = v17;

    LocalSearchRequestManager.performLocalSearch(with:calloutTitle:)(v14, v16, v18);
    swift_bridgeObjectRelease();
    *(void *)(swift_allocObject() + 16) = v14;
    id v19 = v14;
    int v20 = (void *)sub_1000102B0();
    uint64_t v21 = sub_1000102C0();
    swift_release();
    swift_release();

    uint64_t result = sub_100004508((uint64_t)v29);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    id v23 = [v14 wi_calloutTitle];
    uint64_t v24 = sub_100010470();
    uint64_t v26 = v25;

    uint64_t v27 = (uint64_t *)&v6[*(int *)(v4 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v6, v13, v10);
    *uint64_t v27 = v24;
    v27[1] = v26;
    sub_1000043B4(&qword_100019760);
    swift_allocObject();
    uint64_t v21 = sub_100010300();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  *a2 = v21;
  return result;
}

uint64_t sub_10000B4EC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1000043B4(&qword_100019750);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a2 wi_calloutTitle];
  uint64_t v9 = sub_100010470();
  uint64_t v11 = v10;

  uint64_t v12 = (uint64_t *)&v7[*(int *)(v5 + 56)];
  uint64_t v13 = sub_100010260();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v7, a1, v13);
  *uint64_t v12 = v9;
  v12[1] = v11;
  sub_1000043B4(&qword_100019760);
  swift_allocObject();
  return sub_100010300();
}

id sub_10000B61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7 = v6;
  id v14 = objc_allocWithZone(v7);
  NSString v15 = sub_100010460();
  swift_bridgeObjectRelease();
  id v16 = sub_10000BFD8(a1, a2, (uint64_t)v15, v14);

  id v17 = objc_allocWithZone((Class)CLLocation);
  id v18 = v16;
  id v19 = [v17 initWithLatitude:a5 longitude:a6];
  sub_10000CACC(0, &qword_100019758);
  id v20 = v19;
  id v21 = sub_10000B750(v20, a3, a4, 0);
  [v18 setGeolocation:v21];

  return v18;
}

id sub_10000B750(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    NSString v6 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [(id)swift_getObjCClassFromMetadata() placemarkWithLocation:a1 name:v6 postalAddress:a4];

  return v7;
}

id sub_10000B7EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  type metadata accessor for WeatherLocation();
  Class isa = sub_1000104A0().super.isa;
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithTitle:v3 items:isa];

  return v5;
}

id sub_10000B87C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100010460();
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithIdentifier:v3 displayString:v4];

  return v5;
}

uint64_t sub_10000B910(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_100010670();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_1000101C0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_1000101C0();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_10000BA40(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((v6 = sub_1000101C0(), v7 = *(void *)(*(void *)(v6 - 8) + 72) * a2, v8 = a3 + v7, unint64_t v9 = a1 + v7, v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    uint64_t v12 = sub_100010670();
    __break(1u);
  }
  else
  {
    uint64_t v11 = v6;
    uint64_t v12 = a3;
    unint64_t v13 = a1;
    uint64_t v14 = a2;
  }
  return _swift_arrayInitWithCopy(v12, v13, v14, v11);
}

uint64_t sub_10000BB58(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_100010670();
    __break(1u);
  }
  else
  {
    uint64_t v7 = type metadata accessor for WeatherLocation();
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return _swift_arrayInitWithCopy(v8, v9, v10, v7);
}

size_t sub_10000BC54(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10000BC74(a1, a2, a3, *v3);
  *NSString v3 = result;
  return result;
}

size_t sub_10000BC74(size_t result, int64_t a2, char a3, uint64_t a4)
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
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000043B4(&qword_100019788);
  uint64_t v10 = *(void *)(sub_1000101C0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_1000101C0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_10000B910(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000BA40(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_10000BE10(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100010660();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100010660();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000105C0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_10000C8C0(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100010660();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
  }
  swift_bridgeObjectRelease();

  return sub_1000104D0();
}

id sub_10000BFD8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_100010460();
  swift_bridgeObjectRelease();
  id v7 = [a4 initWithIdentifier:v6 displayString:a3];

  return v7;
}

uint64_t sub_10000C03C(void *a1)
{
  id v2 = [a1 identifier];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100010470();

  return v3;
}

uint64_t sub_10000C0AC()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = sub_10000CC2C();

  return _swift_deallocObject(v1, v2, v3);
}

void sub_10000C0DC(uint64_t a1, uint64_t a2)
{
  sub_10000A040(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000C0E4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000C12C()
{
  sub_1000088E0(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_10000C13C(uint64_t a1)
{
  return sub_100008BD0(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

uint64_t sub_10000C144()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v0 = sub_10000CC2C();

  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_10000C174()
{
  return sub_10000C264((void (*)(void))&_swift_release);
}

void sub_10000C18C(uint64_t a1)
{
  sub_100008D28(a1, *(void *)(v1 + 16), *(void (**)(void, void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000C198()
{
  return sub_100008EE4(*(void *)(v0 + 24));
}

uint64_t sub_10000C1C8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C200(uint64_t *a1)
{
  return sub_100008F68(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000C21C()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(0, 0);
}

uint64_t sub_10000C24C()
{
  return sub_10000C264((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_10000C264(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  swift_release();

  return _swift_deallocObject(v1, 40, 7);
}

void sub_10000C2AC()
{
  sub_100008FFC(*(void *)(v0 + 16), *(void (**)(void, void))(v0 + 24));
}

uint64_t sub_10000C2B8()
{
  uint64_t v1 = sub_10000CC2C();

  return _swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000C2E8(uint64_t a1)
{
  return sub_10000B4EC(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000C304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = a2;
  uint64_t v19 = sub_100010520();
  uint64_t v17 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v18 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_100010510();
  __chkstk_darwin(v16[0]);
  v16[1] = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100010430();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100010290();
  __chkstk_darwin(v14);
  v22[3] = sub_1000100A0();
  v22[4] = &protocol witness table for AppConfigurationManager;
  v22[0] = a4;
  id v21 = &_swiftEmptyArrayStorage;
  sub_10000C718((unint64_t *)&qword_1000193E8, (void (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags);
  sub_1000043B4(&qword_1000193F0);
  sub_10000CA70((unint64_t *)&qword_1000193F8, &qword_1000193F0);
  sub_100010590();
  sub_1000043B4(&qword_100019400);
  swift_allocObject();
  *(void *)(a6 + 72) = sub_100010270();
  *(void *)(a6 + 80) = 0;
  *(void *)(a6 + 88) = 0;
  *(void *)(a6 + 96) = 0;
  *(_OWORD *)(a6 + 104) = xmmword_1000118B0;
  *(void *)(a6 + 56) = a1;
  *(void *)(a6 + 64) = &protocol witness table for LocalSearchRequestService;
  *(void *)(a6 + 120) = v20;
  *(void *)(a6 + 128) = a3;
  sub_100006EE4((uint64_t)v22, a6 + 16);
  if (!a5)
  {
    sub_10000CACC(0, (unint64_t *)&qword_1000196A0);
    swift_retain();
    swift_retain();
    sub_100010420();
    id v21 = &_swiftEmptyArrayStorage;
    sub_10000C718(&qword_1000196A8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_1000043B4(&qword_1000196B0);
    sub_10000CA70(&qword_1000196B8, &qword_1000196B0);
    sub_100010590();
    (*(void (**)(char *, void, uint64_t))(v17 + 104))(v18, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v19);
    a5 = sub_100010530();
    swift_release();
    swift_release();
  }
  sub_100004508((uint64_t)v22);
  *(void *)(a6 + 136) = a5;
  return a6;
}

uint64_t sub_10000C718(unint64_t *a1, void (*a2)(uint64_t))
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

void (*sub_10000C760(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  NSString v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_10000C810(v6, a2, a3);
  return sub_10000C7C8;
}

void sub_10000C7C8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10000C810(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_10000C89C(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)sub_1000105B0();
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_10000C890;
}

void sub_10000C890(id *a1)
{
}

unint64_t sub_10000C89C(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_10000C8C0(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100010660();
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
      uint64_t v8 = sub_100010660();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000CA70(&qword_100019780, &qword_100019778);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_1000043B4(&qword_100019778);
            uint64_t v10 = sub_10000C760(v13, i, a3);
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
        sub_10000BB58((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

uint64_t sub_10000CA70(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000449C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CAB4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000CACC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CB08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000043B4(a3);
  sub_10000CC1C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000CB64(uint64_t a1, uint64_t *a2)
{
  sub_1000043B4(a2);
  sub_10000CC1C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10000CBB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000043B4(a3);
  sub_10000CC1C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_10000CC2C()
{
  return v0;
}

uint64_t LocalSearchRequestService.__allocating_init(appConfigurationManager:)(uint64_t a1)
{
  return sub_10000CC7C(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_10000E234);
}

uint64_t LocalSearchRequestService.init(appConfigurationManager:)(uint64_t a1)
{
  return sub_10000CC7C(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_10000E344);
}

uint64_t sub_10000CC7C(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = sub_1000066A8(a1, v5);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = a2(v9, v2, v5, v6);
  sub_100004508(a1);
  return v11;
}

uint64_t LocalSearchRequestService.performLocalSearch(with:calloutTitle:)(uint64_t a1)
{
  id v3 = [objc_allocWithZone((Class)MKLocalSearchRequest) initWithCompletion:a1];
  sub_1000043B4(&qword_100019690);
  swift_allocObject();
  uint64_t v1 = sub_100010310();

  return v1;
}

uint64_t LocalSearchRequestService.performLocalSearch(with:)(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)MKLocalSearchRequest) init];
  sub_10000E1DC(a1, a2, v4);
  sub_1000043B4(&qword_100019690);
  swift_allocObject();
  uint64_t v5 = sub_100010310();

  return v5;
}

void sub_10000CEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  sub_10000E1DC(a6, a7, a5);
  id v14 = [objc_allocWithZone((Class)MKLocalSearch) initWithRequest:a5];
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a6;
  v15[3] = a7;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a1;
  v15[7] = a2;
  v17[4] = sub_10000E42C;
  v17[5] = v15;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10000E0C8;
  v17[3] = &unk_100014E08;
  unint64_t v16 = _Block_copy(v17);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  [v14 startWithCompletionHandler:v16];
  _Block_release(v16);
}

void sub_10000D010(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(char *), uint64_t a8)
{
  uint64_t v123 = a8;
  v124 = a7;
  uint64_t v130 = a6;
  v131 = a5;
  unint64_t v132 = a4;
  id v128 = a1;
  uint64_t v129 = a3;
  uint64_t v9 = sub_1000043B4(&qword_100019500);
  __chkstk_darwin(v9 - 8);
  v125 = (char *)v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100010260();
  uint64_t v122 = *(void *)(v126 - 8);
  uint64_t v11 = __chkstk_darwin(v126);
  uint64_t v13 = (char *)v113 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v113 - v14;
  uint64_t v16 = sub_1000043B4(&qword_100019508);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)v113 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  unint64_t v22 = (char *)v113 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v113 - v23;
  uint64_t v25 = sub_10000FDF0();
  uint64_t v127 = *(void *)(v25 - 8);
  uint64_t v26 = __chkstk_darwin(v25);
  id v28 = (char *)v113 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  id v30 = (char *)v113 - v29;
  uint64_t v31 = sub_100010380();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v133 = v31;
  uint64_t v134 = v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v35 = __chkstk_darwin(v34);
  __chkstk_darwin(v35);
  if (a2)
  {
    uint64_t v40 = (char *)v113 - v37;
    swift_errorRetain();
    sub_100010350();
    swift_errorRetain();
    unint64_t v41 = v132;
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_100010370();
    os_log_type_t v43 = sub_1000104E0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 141558531;
      uint64_t v135 = 1752392040;
      v136[0] = v45;
      sub_100010570();
      *(_WORD *)(v44 + 12) = 2085;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_100003BFC(v129, v41, v136);
      sub_100010570();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v44 + 22) = 2082;
      uint64_t v135 = a2;
      swift_errorRetain();
      sub_1000043B4(&qword_1000193E0);
      uint64_t v46 = sub_100010480();
      uint64_t v135 = sub_100003BFC(v46, v47, v136);
      sub_100010570();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Failed to geocode. searchString=%{sensitive,mask.hash}s, error=%{public}s", (uint8_t *)v44, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v134 + 8))(v40, v133);
    sub_10000E454();
    uint64_t v64 = swift_allocError();
    *Swift::String v65 = a2;
    swift_errorRetain();
    ((void (*)(uint64_t))v131)(v64);
    swift_errorRelease();
LABEL_20:
    swift_errorRelease();
    return;
  }
  uint64_t v118 = (uint64_t)v19;
  v120 = v22;
  v116 = v13;
  v119 = v30;
  uint64_t v121 = v25;
  v117 = v15;
  unint64_t v48 = v132;
  if (!v128)
  {
LABEL_16:
    uint64_t v66 = v36;
    sub_100010350();
    swift_bridgeObjectRetain_n();
    uint64_t v67 = sub_100010370();
    os_log_type_t v68 = sub_1000104E0();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 141558275;
      uint64_t v135 = 1752392040;
      v136[0] = v70;
      sub_100010570();
      *(_WORD *)(v69 + 12) = 2085;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_100003BFC(v129, v48, v136);
      sub_100010570();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v66, v133);
    sub_10000E454();
    swift_allocError();
    void *v71 = 0;
    v131();
    goto LABEL_20;
  }
  uint64_t v49 = v36;
  uint64_t v114 = v39;
  uint64_t v115 = v38;
  id v50 = [v128 mapItems];
  sub_10000E4A0();
  unint64_t v51 = sub_1000104B0();

  if (v51 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_100010660();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v53 = v121;
  uint64_t v54 = v127;
  if (!v52)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = v49;
    goto LABEL_16;
  }
  sub_10000C898(0, (v51 & 0xC000000000000001) == 0, v51);
  if ((v51 & 0xC000000000000001) != 0) {
    id v55 = (id)sub_1000105B0();
  }
  else {
    id v55 = *(id *)(v51 + 32);
  }
  uint64_t v56 = v55;
  swift_bridgeObjectRelease();
  id v57 = [v56 placemark];
  id v58 = [v57 timeZone];

  if (!v58)
  {
    sub_100004A24((uint64_t)v120, 1, 1, v53);
    uint64_t v62 = v118;
    goto LABEL_22;
  }
  sub_10000FDE0();

  v59 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
  uint64_t v60 = (uint64_t)v120;
  v59(v120, v28, v53);
  sub_100004A24(v60, 0, 1, v53);
  int v61 = sub_100004AAC(v60, 1, v53);
  uint64_t v62 = v118;
  if (v61 == 1)
  {
LABEL_22:
    id v72 = [v56 timeZone];
    if (v72)
    {
      v73 = v72;
      sub_10000FDE0();

      uint64_t v74 = 0;
    }
    else
    {
      uint64_t v74 = 1;
    }
    Swift::String v63 = v119;
    sub_100004A24(v62, v74, 1, v53);
    sub_10000E4E0(v62, (uint64_t)v24);
    sub_100004A4C((uint64_t)v120);
    goto LABEL_26;
  }
  v59(v24, v120, v53);
  sub_100004A24((uint64_t)v24, 0, 1, v53);
  Swift::String v63 = v119;
LABEL_26:
  if (sub_100004AAC((uint64_t)v24, 1, v53) == 1)
  {
    sub_100004A4C((uint64_t)v24);
    uint64_t v75 = v114;
    sub_100010350();
    swift_bridgeObjectRetain_n();
    v76 = sub_100010370();
    os_log_type_t v77 = sub_1000104E0();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      *(_DWORD *)uint64_t v78 = 141558275;
      uint64_t v135 = 1752392040;
      v136[0] = v79;
      sub_100010570();
      *(_WORD *)(v78 + 12) = 2085;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_100003BFC(v129, v48, v136);
      sub_100010570();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "Time zone missing while geocoding, searchString=%{sensitive,mask.hash}s.", (uint8_t *)v78, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v75, v133);
    sub_10000E454();
    swift_allocError();
    void *v112 = 1;
    v131();
    swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v63, v24, v53);
    id v80 = [v56 placemark];
    [v80 coordinate];

    uint64_t v81 = sub_100010560();
    uint64_t v130 = v82;
    v131 = (void (*)(void))v81;
    id v83 = [v56 wc_weatherDisplayName];
    id v128 = (id)sub_100010470();
    v120 = (char *)v84;

    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v28, v63, v53);
    uint64_t v85 = (uint64_t)v125;
    sub_10000FDC0();
    uint64_t v86 = sub_10000FDD0();
    sub_100004A24(v85, 0, 1, v86);
    id v87 = [v56 placemark];
    uint64_t v118 = MKPlacemark.safeTitle.getter();
    uint64_t v114 = v88;

    id v89 = [v56 placemark];
    v113[1] = MKPlacemark.safeSubtitle.getter();
    v90 = v56;
    v113[0] = v91;

    id v92 = [v56 wc_weatherLocationName];
    sub_100010470();

    id v93 = [v56 wc_weatherLocationName];
    sub_100010470();

    id v94 = [v56 wc_weatherDisplayName];
    sub_100010470();

    sub_100010210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v95 = v117;
    sub_100010220();
    sub_100010350();
    uint64_t v96 = v122;
    v97 = v116;
    uint64_t v98 = v126;
    (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v116, v95, v126);
    swift_bridgeObjectRetain_n();
    id v99 = v90;
    v100 = sub_100010370();
    os_log_type_t v101 = sub_1000104F0();
    int v102 = v101;
    if (os_log_type_enabled(v100, v101))
    {
      uint64_t v103 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      v131 = (void (*)(void))v104;
      *(_DWORD *)uint64_t v103 = 141559299;
      uint64_t v135 = 1752392040;
      v136[0] = v104;
      sub_100010570();
      *(_WORD *)(v103 + 12) = 2085;
      LODWORD(v130) = v102;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_100003BFC(v129, v48, v136);
      sub_100010570();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v103 + 22) = 2160;
      uint64_t v135 = 1752392040;
      sub_100010570();
      *(_WORD *)(v103 + 32) = 2081;
      uint64_t v105 = sub_100010240();
      uint64_t v135 = sub_100003BFC(v105, v106, v136);
      sub_100010570();
      swift_bridgeObjectRelease();
      v107 = *(void (**)(char *, uint64_t))(v96 + 8);
      v107(v97, v126);
      *(_WORD *)(v103 + 42) = 2160;
      uint64_t v135 = 1752392040;
      sub_100010570();
      *(_WORD *)(v103 + 52) = 2081;
      id v108 = [v99 wc_weatherLocationName];
      uint64_t v109 = sub_100010470();
      unint64_t v111 = v110;

      uint64_t v135 = sub_100003BFC(v109, v111, v136);
      v95 = v117;
      sub_100010570();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v100, (os_log_type_t)v130, "Successfully geocoded location. searchString=%{sensitive,mask.hash}s, location=%{private,mask.hash}s, unsanitizedSecondaryName=%{private,mask.hash}s", (uint8_t *)v103, 0x3Eu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v98 = v126;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v107 = *(void (**)(char *, uint64_t))(v96 + 8);
      v107(v97, v98);
    }
    (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v115, v133);
    v124(v95);

    v107(v95, v98);
    (*(void (**)(char *, uint64_t))(v127 + 8))(v119, v121);
  }
}

void sub_10000E0C8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t LocalSearchRequestService.deinit()
{
  sub_100004508(v0 + 16);
  return v0;
}

uint64_t LocalSearchRequestService.__deallocating_deinit()
{
  sub_100004508(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_10000E1AC(uint64_t a1, uint64_t a2)
{
  return LocalSearchRequestService.performLocalSearch(with:)(a1, a2);
}

uint64_t sub_10000E1C4(uint64_t a1)
{
  return LocalSearchRequestService.performLocalSearch(with:calloutTitle:)(a1);
}

void sub_10000E1DC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100010460();
  [a3 setNaturalLanguageQuery:v4];
}

uint64_t *sub_10000E234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  uint64_t v11 = sub_10000E344((uint64_t)v9, v10, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v11;
}

uint64_t *sub_10000E344(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  a2[5] = a3;
  a2[6] = a4;
  uint64_t v7 = sub_100006E80(a2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v7, a1, a3);
  return a2;
}

void sub_10000E3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000CEC0(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32));
}

uint64_t type metadata accessor for LocalSearchRequestService()
{
  return self;
}

uint64_t sub_10000E3E4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10000E42C(void *a1, uint64_t a2)
{
  sub_10000D010(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(void))(v2 + 32), *(void *)(v2 + 40), *(void (**)(char *))(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_10000E43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E44C()
{
  return swift_release();
}

unint64_t sub_10000E454()
{
  unint64_t result = qword_100019850;
  if (!qword_100019850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019850);
  }
  return result;
}

unint64_t sub_10000E4A0()
{
  unint64_t result = qword_100019858;
  if (!qword_100019858)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100019858);
  }
  return result;
}

uint64_t sub_10000E4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000043B4(&qword_100019508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for LocalSearchRequestService.LocalSearchRequestError(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    swift_errorRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_errorRelease();
  }
  return result;
}

unint64_t *assignWithCopy for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v3 >= 0xFFFFFFFF) {
      swift_errorRetain();
    }
    *a1 = v3;
  }
  else if (v3 < 0xFFFFFFFF)
  {
    swift_errorRelease();
    *a1 = *a2;
  }
  else
  {
    swift_errorRetain();
    *a1 = v3;
    swift_errorRelease();
  }
  return a1;
}

void *initializeWithTake for LocalSearchRequestService.LocalSearchRequestError(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_errorRelease();
LABEL_6:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_errorRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalSearchRequestService.LocalSearchRequestError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LocalSearchRequestService.LocalSearchRequestError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10000E750(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10000E76C(void *result, int a2)
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
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for LocalSearchRequestService.LocalSearchRequestError()
{
  return &type metadata for LocalSearchRequestService.LocalSearchRequestError;
}

char *WeatherIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return WeatherIntentResponse.init(code:userActivity:)(a1, a2);
}

id WeatherIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntent();
  return [super init];
}

id WeatherIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntent();
  id v9 = sub_10000F3FC((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id WeatherIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for WeatherIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id WeatherIntent.__allocating_init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10000F414();
  swift_bridgeObjectRelease();
  NSString v3 = sub_100010460();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.Class isa = sub_100010440().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  id v5 = [objc_allocWithZone(v0) initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10000F414();
  swift_bridgeObjectRelease();
  NSString v3 = sub_100010460();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.Class isa = sub_100010440().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WeatherIntent();
  id v5 = [super initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.__deallocating_deinit()
{
  return sub_10000F308(type metadata accessor for WeatherIntent);
}

unint64_t WeatherIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

BOOL sub_10000EC64(uint64_t *a1, uint64_t *a2)
{
  return sub_10000EC70(*a1, *a2);
}

BOOL sub_10000EC70(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int sub_10000EC7C()
{
  return sub_10000EC84(*v0);
}

Swift::Int sub_10000EC84(Swift::UInt a1)
{
  return sub_100010710();
}

void sub_10000ECCC(uint64_t a1)
{
  sub_10000ECD4(a1, *v1);
}

void sub_10000ECD4(uint64_t a1, Swift::UInt a2)
{
}

Swift::Int sub_10000ECFC(uint64_t a1)
{
  return sub_10000ED04(a1, *v1);
}

Swift::Int sub_10000ED04(uint64_t a1, Swift::UInt a2)
{
  return sub_100010710();
}

unint64_t sub_10000ED48@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = WeatherIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10000ED7C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t WeatherIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___WeatherIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000EE1C(uint64_t a1)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR___WeatherIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *NSString v3 = a1;
  return result;
}

char *WeatherIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___WeatherIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for WeatherIntent()
{
  return self;
}

id WeatherIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  return [super init];
}

uint64_t type metadata accessor for WeatherIntentResponse()
{
  return self;
}

id WeatherLocation.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id WeatherIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_10000F3FC((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id WeatherIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_10000F3FC((uint64_t)v11.super_class, "initWithBackingStore:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_100010440().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id WeatherIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_100010440().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_10000F3FC((uint64_t)v11.super_class, "initWithPropertiesByName:", v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id WeatherIntentResponse.__deallocating_deinit()
{
  return sub_10000F308(type metadata accessor for WeatherIntentResponse);
}

id sub_10000F308(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_10000F344()
{
  unint64_t result = qword_100019868;
  if (!qword_100019868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019868);
  }
  return result;
}

uint64_t sub_10000F390@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F3BC(uint64_t *a1)
{
  return sub_10000EE1C(*a1);
}

ValueMetadata *type metadata accessor for WeatherIntentResponseCode()
{
  return &type metadata for WeatherIntentResponseCode;
}

id sub_10000F3FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return [super a2:v9];
}

NSString sub_10000F414()
{
  return sub_100010460();
}

id WeatherLocation.__allocating_init(identifier:display:pronunciationHint:)()
{
  sub_10000FD5C();
  if (v2)
  {
    NSString v3 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100010460();
  swift_bridgeObjectRelease();
  if (v1)
  {
    NSString v5 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [objc_allocWithZone(v0) initWithIdentifier:v3 displayString:v4 pronunciationHint:v5];

  return v6;
}

id WeatherLocation.init(identifier:display:pronunciationHint:)()
{
  sub_10000FD5C();
  if (v2)
  {
    NSString v3 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100010460();
  swift_bridgeObjectRelease();
  if (v1)
  {
    NSString v5 = sub_100010460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for WeatherLocation();
  id v6 = [super initWithIdentifier:v3 displayString:v4 pronunciationHint:v5];

  return v6;
}

uint64_t type metadata accessor for WeatherLocation()
{
  return self;
}

id WeatherLocation.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for WeatherLocation();
  [super initWithCoder:a1];

  return v3;
}

id WeatherLocation.__deallocating_deinit()
{
  return sub_10000FCFC(type metadata accessor for WeatherLocation);
}

id static WeatherLocationResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static WeatherLocationResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_10000F8D4();
    swift_bridgeObjectRetain();
    sub_100010650();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000106A0();
    sub_10000F8D4();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_10000F8D4();
  Class isa = sub_1000104A0().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_10000F8D4()
{
  unint64_t result = qword_1000198E8;
  if (!qword_1000198E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000198E8);
  }
  return result;
}

id static WeatherLocationResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static WeatherLocationResolutionResult.success(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void static WeatherLocationResolutionResult.disambiguation(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void static WeatherLocationResolutionResult.confirmationRequired(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

id WeatherLocationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_100010440().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id WeatherLocationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100010440().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for WeatherLocationResolutionResult();
  id v5 = [super initWithJSONDictionary:isa a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for WeatherLocationResolutionResult()
{
  return self;
}

id WeatherLocationResolutionResult.__deallocating_deinit()
{
  return sub_10000FCFC(type metadata accessor for WeatherLocationResolutionResult);
}

id sub_10000FCFC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_10000FD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, 0, 0xE000000000000000, a6, 36, 2);
}

uint64_t sub_10000FD70(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10000FD80()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000FD90()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10000FDA0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000FDB0()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10000FDC0()
{
  return Date.init()();
}

uint64_t sub_10000FDD0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000FDE0()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000FDF0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10000FE00()
{
  return static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter();
}

uint64_t sub_10000FE10()
{
  return static Settings.Geocoding.bypassGeocodingCache.getter();
}

uint64_t sub_10000FE60()
{
  return SettingReader.read<A>(_:)();
}

uint64_t sub_10000FE70()
{
  return static SettingReader.shared.getter();
}

uint64_t sub_10000FE80()
{
  return type metadata accessor for SettingReader();
}

uint64_t sub_10000FE90()
{
  return static AppGroup.weather.getter();
}

uint64_t sub_10000FEA0()
{
  return AppGroup.cachesDirectoryURL.getter();
}

uint64_t sub_10000FEB0()
{
  return type metadata accessor for AppGroup();
}

uint64_t sub_10000FEC0()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t sub_10000FEF0()
{
  return WeatherConfigurationManager.__allocating_init(contentDirectoryURL:)();
}

uint64_t sub_10000FF00()
{
  return type metadata accessor for WeatherConfigurationManager();
}

uint64_t sub_10000FF10()
{
  return static GeocodeStore.preferredCacheSize.getter();
}

uint64_t sub_10000FF20()
{
  return GeocodeStore.init(database:)();
}

uint64_t sub_10000FF30()
{
  return static GeocodeStore.location.getter();
}

uint64_t sub_10000FF40()
{
  return type metadata accessor for GeocodeStore();
}

uint64_t sub_10000FF50()
{
  return IdentityService.init(keyValueStoreProvider:iCloudStatusProvider:)();
}

uint64_t sub_10000FF60()
{
  return type metadata accessor for IdentityService();
}

uint64_t sub_10000FF70()
{
  return AppConfiguration.reverseGeocodingRefreshTimeInterval.getter();
}

uint64_t sub_10000FF80()
{
  return type metadata accessor for AppConfiguration();
}

uint64_t sub_10000FF90()
{
  return dispatch thunk of GeocodeStoreType.saveLocation(_:for:)();
}

uint64_t sub_10000FFA0()
{
  return dispatch thunk of GeocodeStoreType.queryLocation(for:)();
}

uint64_t sub_10000FFB0()
{
  return dispatch thunk of GeocodeStoreType.deleteLocation(for:)();
}

uint64_t sub_10000FFC0()
{
  return dispatch thunk of GeocodeStoreType.deleteAllLocations(satisfying:)();
}

uint64_t sub_10000FFD0()
{
  return LocationDataModel.identifier.getter();
}

uint64_t sub_10000FFE0()
{
  return type metadata accessor for LocationDataModel();
}

uint64_t sub_10000FFF0()
{
  return SyncedDataManager.__allocating_init(syncedDataContextProvider:savedLocationsReconciler:)();
}

uint64_t sub_100010000()
{
  return type metadata accessor for SyncedDataManager();
}

uint64_t sub_100010010()
{
  return PermanentURLFactory.init()();
}

uint64_t sub_100010020()
{
  return type metadata accessor for PermanentURLFactory();
}

uint64_t sub_100010030()
{
  return SavedLocationsReader.init(keyValueStoreProvider:locationDataModelFactory:syncedDataManager:localKeyValueStore:testConfigurable:)();
}

uint64_t sub_100010040()
{
  return type metadata accessor for SavedLocationsReader();
}

uint64_t sub_100010050()
{
  return iCloudStatusProvider.init()();
}

uint64_t sub_100010060()
{
  return type metadata accessor for iCloudStatusProvider();
}

uint64_t sub_100010070()
{
  return AppConfigurationStore.init()();
}

uint64_t sub_100010080()
{
  return type metadata accessor for AppConfigurationStore();
}

uint64_t sub_100010090()
{
  return AppConfigurationManager.init(appConfigurationService:appConfigurationStore:)();
}

uint64_t sub_1000100A0()
{
  return type metadata accessor for AppConfigurationManager();
}

uint64_t sub_1000100B0()
{
  return AppConfigurationService.init(appConfigurationDataService:urlFactory:settingsProvider:)();
}

uint64_t sub_1000100C0()
{
  return type metadata accessor for AppConfigurationService();
}

uint64_t sub_1000100D0()
{
  return LocationDataModelFactory.init()();
}

uint64_t sub_1000100E0()
{
  return type metadata accessor for LocationDataModelFactory();
}

uint64_t sub_1000100F0()
{
  return dispatch thunk of SavedLocationsReaderType.fetchSavedLocations()();
}

uint64_t sub_100010100()
{
  return SavedLocationsReconciler.init(defaultCityManager:)();
}

uint64_t sub_100010110()
{
  return type metadata accessor for SavedLocationsReconciler();
}

uint64_t sub_100010120()
{
  return SyncedDataContextProvider.init(dataStorageURL:useTransientContext:)();
}

uint64_t sub_100010130()
{
  return type metadata accessor for SyncedDataContextProvider();
}

uint64_t sub_100010140()
{
  return dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
}

uint64_t sub_100010150()
{
  return static UbiquitousKeyValueStoreProvider.shared.getter();
}

uint64_t sub_100010160()
{
  return type metadata accessor for UbiquitousKeyValueStoreProvider();
}

uint64_t sub_100010170()
{
  return AppConfigurationRemoteSettingsProvider.init(identityService:)();
}

uint64_t sub_100010180()
{
  return type metadata accessor for AppConfigurationRemoteSettingsProvider();
}

uint64_t sub_100010190()
{
  return static Location.currentLocationIntentID.getter();
}

uint64_t sub_1000101A0()
{
  return Location.Identifier.coordinate.getter();
}

uint64_t sub_1000101B0()
{
  return Location.Identifier.name.getter();
}

uint64_t sub_1000101C0()
{
  return type metadata accessor for Location.Identifier();
}

uint64_t sub_1000101D0()
{
  return Location.coordinate.getter();
}

uint64_t sub_1000101E0()
{
  return Location.identifier.getter();
}

uint64_t sub_1000101F0()
{
  return Location.lastRefreshDate.getter();
}

uint64_t sub_100010200()
{
  return Location.intentIdentifier.getter();
}

uint64_t sub_100010210()
{
  return static Location.sanitizedSecondaryName(_:name:)();
}

uint64_t sub_100010220()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)();
}

uint64_t sub_100010230()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)();
}

uint64_t sub_100010240()
{
  return Location.id.getter();
}

uint64_t sub_100010250()
{
  return Location.name.getter();
}

uint64_t sub_100010260()
{
  return type metadata accessor for Location();
}

uint64_t sub_100010270()
{
  return PromiseDeduper.init(options:)();
}

uint64_t sub_100010280()
{
  return PromiseDeduper.promise(key:createBlock:)();
}

uint64_t sub_100010290()
{
  return type metadata accessor for PromiseDeduperFlags();
}

uint64_t sub_1000102A0()
{
  return when<A>(on:_:)();
}

uint64_t sub_1000102B0()
{
  return zalgo.getter();
}

uint64_t sub_1000102C0()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000102D0()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000102E0()
{
  return Promise.then<A, B>(on:disposeOn:closure:)();
}

uint64_t sub_1000102F0()
{
  return Promise.error(on:closure:)();
}

uint64_t sub_100010300()
{
  return Promise.init(value:)();
}

uint64_t sub_100010310()
{
  return Promise.init(resolver:)();
}

uint64_t sub_100010320()
{
  return firstly<A, B>(on:disposeOn:closure:)();
}

uint64_t sub_100010330()
{
  return firstly<A>(closure:)();
}

uint64_t sub_100010340()
{
  return asyncMain(block:)();
}

uint64_t sub_100010350()
{
  return static Logger.geocode.getter();
}

uint64_t sub_100010360()
{
  return static Logger.intents.getter();
}

uint64_t sub_100010370()
{
  return Logger.logObject.getter();
}

uint64_t sub_100010380()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100010390()
{
  return static AssertionOptions.weatherAssertions.getter();
}

uint64_t sub_1000103A0()
{
  return type metadata accessor for AssertionOptions();
}

uint64_t sub_1000103B0()
{
  return type metadata accessor for Database.VacuumMode();
}

uint64_t sub_1000103C0()
{
  return type metadata accessor for Database.RecoveryMode();
}

uint64_t sub_1000103D0()
{
  return Database.init(location:assertions:journalingMode:recoveryMode:preferredCacheSize:vacuumMode:busyTimeout:)();
}

uint64_t sub_1000103E0()
{
  return type metadata accessor for Database.JournalingMode();
}

uint64_t sub_1000103F0()
{
  return type metadata accessor for Database.Location();
}

uint64_t sub_100010400()
{
  return type metadata accessor for Database.CacheSize();
}

uint64_t sub_100010410()
{
  return type metadata accessor for Database();
}

uint64_t sub_100010420()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100010430()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100010440()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100010450()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100010460()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100010470()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010480()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_100010490()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000104A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000104B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000104C0()
{
  return Array.description.getter();
}

uint64_t sub_1000104D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000104E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000104F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100010500()
{
  return static NSUserDefaults.weatherShared.getter();
}

uint64_t sub_100010510()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100010520()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100010530()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100010540()
{
  return WCDefaultCityManager.defaultLocations()();
}

uint64_t sub_100010550()
{
  return CLLocationCoordinate2D.intentIdentifier.getter();
}

uint64_t sub_100010560()
{
  return CLLocationCoordinate2D.id.getter();
}

uint64_t sub_100010570()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100010580()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100010590()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000105A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000105B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000105C0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000105D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000105E0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000105F0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100010600()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100010610()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100010620()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100010630()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100010650()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100010660()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100010670()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100010680()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100010690()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000106A0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000106B0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000106C0()
{
  return Error._code.getter();
}

uint64_t sub_1000106D0()
{
  return Error._domain.getter();
}

uint64_t sub_1000106E0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000106F0()
{
  return Hasher.init(_seed:)();
}

void sub_100010700(Swift::UInt a1)
{
}

Swift::Int sub_100010710()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend__weatherDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 _weatherDisplayName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}