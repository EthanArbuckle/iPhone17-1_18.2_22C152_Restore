const char *sub_3FA0()
{
  return "SiriSettings";
}

const char *sub_3FB4()
{
  return "settings_adoption_siri_help";
}

uint64_t sub_3FC8()
{
  return 1;
}

void sub_3FD0()
{
}

Swift::Int sub_3FF8()
{
  return sub_A190();
}

Swift::Int sub_4048()
{
  return sub_A190();
}

Swift::Bool __swiftcall SuggestionsPluginFeatureFlagsImpl.isSiriHelpEnabled()()
{
  v3 = &type metadata for SettingsSuggestionsPluginFeatures;
  unint64_t v4 = sub_40E4();
  char v0 = sub_9DC0();
  sub_4130((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_40E4()
{
  unint64_t result = qword_104E8;
  if (!qword_104E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_104E8);
  }
  return result;
}

uint64_t sub_4130(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for SuggestionsPluginFeatureFlagsImpl()
{
  return &type metadata for SuggestionsPluginFeatureFlagsImpl;
}

uint64_t getEnumTagSinglePayload for SettingsSuggestionsPluginFeatures(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsSuggestionsPluginFeatures(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x4288);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_42B0()
{
  return 0;
}

ValueMetadata *type metadata accessor for SettingsSuggestionsPluginFeatures()
{
  return &type metadata for SettingsSuggestionsPluginFeatures;
}

unint64_t sub_42CC()
{
  unint64_t result = qword_104F0;
  if (!qword_104F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_104F0);
  }
  return result;
}

unint64_t sub_4318(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 2:
      unint64_t result = 0x7041664F65707974;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000022;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_4414(char a1, char a2)
{
  unint64_t v3 = sub_7B0C(a1);
  uint64_t v5 = v4;
  if (v3 == sub_7B0C(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_A150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_449C(uint64_t a1, char a2)
{
  sub_7B0C(a2);
  sub_A060();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_44F0(uint64_t a1, char a2)
{
  return sub_A190();
}

uint64_t sub_4550()
{
  sub_6194(&qword_108A8);
  uint64_t v0 = sub_9FE0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_A610;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for BinarySettingIdentifier.airplaneMode(_:), v0);
  v6(v5 + v2, enum case for BinarySettingIdentifier.assistiveTouch(_:), v0);
  v6(v5 + 2 * v2, enum case for BinarySettingIdentifier.bluetooth(_:), v0);
  v6(v5 + 3 * v2, enum case for BinarySettingIdentifier.cellularData(_:), v0);
  v6(v5 + 4 * v2, enum case for BinarySettingIdentifier.doNotDisturb(_:), v0);
  v6(v5 + 5 * v2, enum case for BinarySettingIdentifier.heySiri(_:), v0);
  v6(v5 + 6 * v2, enum case for BinarySettingIdentifier.siri(_:), v0);
  v6(v5 + 7 * v2, enum case for BinarySettingIdentifier.nightShift(_:), v0);
  v6(v5 + 8 * v2, enum case for BinarySettingIdentifier.powerSaving(_:), v0);
  v6(v5 + 9 * v2, enum case for BinarySettingIdentifier.wifi(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 10 * v2, enum case for BinarySettingIdentifier.invertColors(_:), v0);
  qword_11620 = v4;
  return result;
}

uint64_t sub_4798()
{
  sub_6194(&qword_108B8);
  uint64_t v0 = sub_A000();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_A620;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for NumericSettingIdentifier.displayBrightness(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + v2, enum case for NumericSettingIdentifier.voice(_:), v0);
  qword_11628 = v4;
  return result;
}

uint64_t sub_48A0()
{
  sub_6194(&qword_108E0);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_A630;
  *(void *)(result + 32) = 0xD000000000000013;
  *(void *)(result + 40) = 0x800000000000AF40;
  *(void *)(result + 48) = 0xD000000000000010;
  *(void *)(result + 56) = 0x800000000000AF60;
  *(void *)(result + 64) = 0xD000000000000014;
  *(void *)(result + 72) = 0x800000000000AF80;
  *(void *)(result + 80) = 0xD000000000000013;
  *(void *)(result + 88) = 0x800000000000AFA0;
  strcpy((char *)(result + 96), "com.apple.news");
  *(unsigned char *)(result + 111) = -18;
  qword_11630 = result;
  return result;
}

uint64_t sub_4964()
{
  sub_69B8();
  uint64_t v1 = sub_9FE0();
  sub_699C(v1);
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = swift_task_alloc();
  return _swift_task_switch(sub_49F4, 0, 0);
}

uint64_t sub_49F4()
{
  if (qword_10460 != -1) {
    swift_once();
  }
  unint64_t v2 = qword_11620;
  int64_t v3 = *(void *)(qword_11620 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 64);
    swift_bridgeObjectRetain();
    sub_6060(0, v3, 0);
    uint64_t v5 = sub_9F70();
    v7 = *(void (**)(uint64_t))(v4 + 16);
    uint64_t v6 = v4 + 16;
    unint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 64));
    uint64_t v14 = *(void *)(v6 + 56);
    v15 = v7;
    do
    {
      uint64_t v9 = sub_69C4();
      v15(v9);
      sub_9FD0();
      *(void *)(v0 + 48) = 0;
      swift_stdlib_random();
      uint64_t v10 = sub_9F60();
      *(void *)(v0 + 40) = v5;
      *(void *)(v0 + 16) = v10;
      (*(void (**)(unint64_t, unint64_t))(v6 - 8))(v1, v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_6060(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 3);
      unint64_t v1 = v2 + 1;
      if (v2 >= v11 >> 1) {
        sub_6060((char *)(v11 > 1), v2 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v1;
      sub_6080((_OWORD *)(v0 + 16), (_OWORD *)&_swiftEmptyArrayStorage + 2 * v2 + 2);
      v8 += v14;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  v12 = *(uint64_t (**)(void *))(v0 + 8);
  return v12(&_swiftEmptyArrayStorage);
}

uint64_t type metadata accessor for iOSBinarySettingSuggestionsResolver()
{
  return self;
}

uint64_t sub_4C50()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_6984;
  return sub_4964();
}

uint64_t sub_4CE0()
{
  sub_69B8();
  uint64_t v1 = sub_A000();
  sub_699C(v1);
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = swift_task_alloc();
  return _swift_task_switch(sub_4D70, 0, 0);
}

uint64_t sub_4D70()
{
  if (qword_10468 != -1) {
    swift_once();
  }
  unint64_t v2 = qword_11628;
  int64_t v3 = *(void *)(qword_11628 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 64);
    swift_bridgeObjectRetain();
    sub_6060(0, v3, 0);
    uint64_t v5 = sub_9F90();
    v7 = *(void (**)(uint64_t))(v4 + 16);
    uint64_t v6 = v4 + 16;
    v15 = v7;
    uint64_t v16 = v5;
    unint64_t v8 = v2 + ((*(unsigned __int8 *)(v6 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 64));
    uint64_t v14 = *(void *)(v6 + 56);
    do
    {
      uint64_t v9 = sub_69C4();
      v15(v9);
      sub_9FF0();
      *(void *)(v0 + 48) = 0;
      swift_stdlib_random();
      [objc_allocWithZone((Class)NSNumber) initWithInteger:*(void *)(v0 + 48) >> 63];
      uint64_t v10 = sub_9F80();
      *(void *)(v0 + 40) = v16;
      *(void *)(v0 + 16) = v10;
      (*(void (**)(unint64_t, unint64_t))(v6 - 8))(v1, v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_6060(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 3);
      unint64_t v1 = v2 + 1;
      if (v2 >= v11 >> 1) {
        sub_6060((char *)(v11 > 1), v2 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v1;
      sub_6080((_OWORD *)(v0 + 16), (_OWORD *)&_swiftEmptyArrayStorage + 2 * v2 + 2);
      v8 += v14;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  v12 = *(uint64_t (**)(void *))(v0 + 8);
  return v12(&_swiftEmptyArrayStorage);
}

uint64_t type metadata accessor for iOSNumericSettingSuggestionsResolver()
{
  return self;
}

uint64_t sub_4FDC()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_6984;
  return sub_4CE0();
}

uint64_t sub_5068()
{
  return sub_6990((uint64_t)sub_507C);
}

uint64_t sub_507C()
{
  sub_69B8();
  unint64_t v2 = sub_5F10(v1, (uint64_t)&off_C710) & 1;
  sub_6194(&qword_108A0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_A640;
  *(void *)(v3 + 56) = &type metadata for Bool;
  *(unsigned char *)(v3 + 32) = v2;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t type metadata accessor for iOSSettingSuggestionsActionResolver()
{
  return self;
}

uint64_t sub_5138()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_516C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_5210;
  return _swift_task_switch(sub_507C, 0, 0);
}

uint64_t sub_5210()
{
  sub_69B8();
  uint64_t v2 = v1;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t sub_5308()
{
  return sub_6990((uint64_t)sub_531C);
}

uint64_t sub_531C()
{
  if (qword_10470 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_11630;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_5F68(v2, v1);
  swift_bridgeObjectRelease();
  sub_61DC();
  id v3 = sub_54C0();
  if (v3)
  {
    uint64_t v4 = sub_684C(v3);
    if (v4)
    {
      sub_5524(0xD000000000000013, 0x800000000000AF20, v4, (_OWORD *)(v0 + 48));
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 72))
      {
        sub_6080((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 16));
        sub_6194(&qword_108A0);
        uint64_t v5 = (_OWORD *)swift_allocObject();
        v5[1] = xmmword_A640;
        sub_6080((_OWORD *)(v0 + 16), v5 + 2);
        goto LABEL_9;
      }
      sub_68C4(v0 + 48);
    }
  }
  uint64_t v5 = &_swiftEmptyArrayStorage;
LABEL_9:
  uint64_t v6 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v6(v5);
}

id sub_54C0()
{
  NSString v0 = sub_A040();
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() bundleWithIdentifier:v0];

  return v1;
}

double sub_5524@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_63B8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_6924(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_5588(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_6430(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for iOSSettingSuggestionsAppNameResolver()
{
  return self;
}

uint64_t sub_55F0()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_6984;
  return _swift_task_switch(sub_531C, 0, 0);
}

uint64_t sub_5694()
{
  *(void *)(v1 + 16) = v0;
  return sub_6990((uint64_t)sub_56AC);
}

uint64_t sub_56AC()
{
  sub_69B8();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_6194(&qword_108A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_A640;
  char v3 = *(unsigned char *)(v1 + 32);
  *(void *)(v2 + 56) = &type metadata for Bool;
  *(unsigned char *)(v2 + 32) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_573C()
{
  return sub_5744(33);
}

uint64_t sub_5744(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v1, a1, 7);
}

uint64_t type metadata accessor for iOSSettingDisplayModeSuggestionsResolver()
{
  return self;
}

uint64_t sub_57AC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_6984;
  return sub_5694();
}

uint64_t sub_583C()
{
  return sub_5B0C((unint64_t *)&unk_10820, (void (*)(void))type metadata accessor for iOSSettingDisplayModeSuggestionsResolver);
}

uint64_t sub_5884()
{
  return sub_5B0C(&qword_10830, (void (*)(void))type metadata accessor for iOSSettingDisplayModeSuggestionsResolver);
}

uint64_t sub_58CC()
{
  return sub_5B0C((unint64_t *)&unk_10838, (void (*)(void))type metadata accessor for iOSSettingSuggestionsAppNameResolver);
}

uint64_t sub_5914()
{
  return sub_5B0C(&qword_10848, (void (*)(void))type metadata accessor for iOSSettingSuggestionsAppNameResolver);
}

uint64_t sub_595C()
{
  return sub_5B0C((unint64_t *)&unk_10850, (void (*)(void))type metadata accessor for iOSSettingSuggestionsActionResolver);
}

uint64_t sub_59A4()
{
  return sub_5B0C(&qword_10860, (void (*)(void))type metadata accessor for iOSSettingSuggestionsActionResolver);
}

uint64_t sub_59EC()
{
  return sub_5B0C((unint64_t *)&unk_10868, (void (*)(void))type metadata accessor for iOSNumericSettingSuggestionsResolver);
}

uint64_t sub_5A34()
{
  return sub_5B0C(&qword_10878, (void (*)(void))type metadata accessor for iOSNumericSettingSuggestionsResolver);
}

uint64_t sub_5A7C()
{
  return sub_5B0C((unint64_t *)&unk_10880, (void (*)(void))type metadata accessor for iOSBinarySettingSuggestionsResolver);
}

uint64_t sub_5AC4()
{
  return sub_5B0C(&qword_10890, (void (*)(void))type metadata accessor for iOSBinarySettingSuggestionsResolver);
}

uint64_t sub_5B0C(unint64_t *a1, void (*a2)(void))
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

char *sub_5B50(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_A130();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_5BE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_A130();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_9DB0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_9DB0();
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

uint64_t sub_5D14(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 32 * a2 > a1) ? (v6 = a1 + 32 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_A130();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return _swift_arrayInitWithCopy(v7, v5);
}

uint64_t sub_5DF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_9DB0() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t v9 = sub_A130();
    __break(1u);
  }
  else
  {
    uint64_t v9 = a3;
    unint64_t v10 = a1;
  }
  return _swift_arrayInitWithCopy(v9, v10);
}

unint64_t sub_5F10(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 2;
  }
  unint64_t result = sub_5FD4(*(void *)(a2 + 16));
  if (result < v2) {
    return *(unsigned __int8 *)(a2 + result + 32);
  }
  __break(1u);
  return result;
}

unint64_t sub_5F68(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  unint64_t result = sub_5FD4(*(void *)(a2 + 16));
  if (result < v2)
  {
    uint64_t v5 = *(void *)(a2 + 16 * result + 32);
    swift_bridgeObjectRetain();
    return v5;
  }
  __break(1u);
  return result;
}

unint64_t sub_5FD4(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    unint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_6060(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_60B0(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

_OWORD *sub_6080(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

size_t sub_6090(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_621C(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

char *sub_60B0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_6194(&qword_108A0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_5B50(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5D14((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_6194(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_61DC()
{
  unint64_t result = qword_108D0;
  if (!qword_108D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_108D0);
  }
  return result;
}

size_t sub_621C(size_t result, int64_t a2, char a3, uint64_t a4)
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
    v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_6194(&qword_108F0);
  uint64_t v10 = *(void *)(sub_9DB0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_9DB0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_5BE4(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5DF8(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_63B8(uint64_t a1, uint64_t a2)
{
  sub_A170();
  sub_A060();
  Swift::Int v4 = sub_A190();
  return sub_64B8(a1, a2, v4);
}

unint64_t sub_6430(char a1)
{
  sub_A170();
  sub_7B0C(a1);
  sub_A060();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_A190();
  return sub_659C(a1, v2);
}

unint64_t sub_64B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_A150() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_A150() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_659C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000013;
      unint64_t v8 = 0x800000000000ABB0;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v9 = "notificationSetting";
          goto LABEL_6;
        case 2:
          uint64_t v9 = "readBatteryStatus";
LABEL_6:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000011;
          break;
        case 3:
          unint64_t v7 = 0x695365676E616863;
          unint64_t v8 = 0xEF6563696F566972;
          break;
        case 4:
          unint64_t v7 = 0x65537972616E6962;
          unint64_t v8 = 0xED0000676E697474;
          break;
        case 5:
          unint64_t v7 = 0x53636972656D756ELL;
          unint64_t v8 = 0xEE00676E69747465;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xD000000000000013;
      unint64_t v11 = 0x800000000000ABB0;
      switch(v6)
      {
        case 1:
          uint64_t v12 = "notificationSetting";
          goto LABEL_13;
        case 2:
          uint64_t v12 = "readBatteryStatus";
LABEL_13:
          unint64_t v11 = (unint64_t)v12 | 0x8000000000000000;
          unint64_t v10 = 0xD000000000000011;
          break;
        case 3:
          unint64_t v10 = 0x695365676E616863;
          unint64_t v11 = 0xEF6563696F566972;
          break;
        case 4:
          unint64_t v10 = 0x65537972616E6962;
          unint64_t v11 = 0xED0000676E697474;
          break;
        case 5:
          unint64_t v10 = 0x53636972656D756ELL;
          unint64_t v11 = 0xEE00676E69747465;
          break;
        default:
          break;
      }
      if (v7 == v10 && v8 == v11) {
        break;
      }
      char v14 = sub_A150();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_684C(void *a1)
{
  id v2 = [a1 localizedInfoDictionary];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_A020();

  return v3;
}

uint64_t sub_68C4(uint64_t a1)
{
  uint64_t v2 = sub_6194(&qword_108D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_6924(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6988()
{
  return sub_5744(32);
}

uint64_t sub_6990(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_699C(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return a1 - 8;
}

uint64_t sub_69C4()
{
  return *(void *)(v0 + 72);
}

Swift::Int sub_69DC(char a1)
{
  return sub_A190();
}

uint64_t sub_6A40()
{
  sub_9AB0();
  uint64_t result = sub_A0B0();
  qword_108F8 = result;
  return result;
}

uint64_t sub_6AA8()
{
  sub_9E20();
  swift_allocObject();
  uint64_t result = sub_9E30();
  qword_11638 = result;
  return result;
}

void sub_6AFC()
{
  qword_11640 = 0x676E6974746573;
  *(void *)algn_11648 = 0xE700000000000000;
}

void sub_6B20()
{
  qword_11650 = 0x61567972616E6962;
  *(void *)algn_11658 = 0xEB0000000065756CLL;
}

void sub_6B4C()
{
  qword_11660 = 0x6F4D6B7261446E69;
  *(void *)algn_11668 = 0xEA00000000006564;
}

void sub_6B74()
{
  qword_11688 = (uint64_t)&type metadata for SuggestionsPluginFeatureFlagsImpl;
  unk_11690 = &protocol witness table for SuggestionsPluginFeatureFlagsImpl;
}

uint64_t sub_6B94(uint64_t a1)
{
  return sub_6C14(a1, qword_10900);
}

uint64_t sub_6BB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_6CD4(a1, (void (*)(void))&type metadata accessor for SettingsBinarySetting, (void (*)(void))&SettingsBinarySetting.name.getter, a2);
}

uint64_t sub_6BF4(uint64_t a1)
{
  return sub_6C14(a1, qword_10918);
}

uint64_t sub_6C14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6194(&qword_10A50);
  sub_9A04(v3, a2);
  sub_99CC(v3, (uint64_t)a2);
  sub_6194(&qword_108D8);
  return sub_9DD0();
}

uint64_t sub_6C94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_6CD4(a1, (void (*)(void))&type metadata accessor for SettingsNumericSetting, (void (*)(void))&SettingsNumericSetting.name.getter, a2);
}

uint64_t sub_6CD4@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_9DF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  unint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6924(a1, (uint64_t)v18);
  a2(0);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    a3();
    uint64_t v13 = sub_9DE0();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t result = swift_release();
    *a4 = v13;
    a4[1] = v15;
    unint64_t v16 = &type metadata for String;
  }
  else
  {
    *(unsigned char *)a4 = 0;
    unint64_t v16 = &type metadata for Bool;
  }
  a4[3] = (uint64_t)v16;
  return result;
}

uint64_t sub_6E40(uint64_t a1, uint64_t a2)
{
  v3[49] = a2;
  v3[50] = v2;
  v3[48] = a1;
  uint64_t v4 = sub_9DB0();
  v3[51] = v4;
  v3[52] = *(void *)(v4 - 8);
  v3[53] = swift_task_alloc();
  return _swift_task_switch(sub_6F04, 0, 0);
}

uint64_t sub_6F04()
{
  if (qword_104A0 != -1) {
    swift_once();
  }
  sub_82D8((uint64_t)&unk_11670, (uint64_t)(v0 + 32));
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[36];
  sub_9004(v0 + 32, v1);
  char v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  sub_4130((uint64_t)(v0 + 32));
  if (v3)
  {
    uint64_t v4 = v0[52];
    sub_6194(&qword_108E0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_AA30;
    *(void *)(inited + 32) = 0x45442D6564;
    *(void *)(inited + 40) = 0xE500000000000000;
    *(void *)(inited + 48) = 0x55412D6E65;
    *(void *)(inited + 56) = 0xE500000000000000;
    *(void *)(inited + 64) = 0x41432D6E65;
    *(void *)(inited + 72) = 0xE500000000000000;
    *(void *)(inited + 80) = 0x42472D6E65;
    *(void *)(inited + 88) = 0xE500000000000000;
    *(void *)(inited + 96) = 0x4E492D6E65;
    *(void *)(inited + 104) = 0xE500000000000000;
    *(void *)(inited + 112) = 0x53552D6E65;
    *(void *)(inited + 120) = 0xE500000000000000;
    *(void *)(inited + 128) = 0x53452D7365;
    *(void *)(inited + 136) = 0xE500000000000000;
    *(void *)(inited + 144) = 0x584D2D7365;
    *(void *)(inited + 152) = 0xE500000000000000;
    *(void *)(inited + 160) = 0x53552D7365;
    *(void *)(inited + 168) = 0xE500000000000000;
    *(void *)(inited + 176) = 0x52462D7266;
    *(void *)(inited + 184) = 0xE500000000000000;
    *(void *)(inited + 192) = 0x504A2D616ALL;
    *(void *)(inited + 200) = 0xE500000000000000;
    *(void *)(inited + 208) = 0x4E432D687ALL;
    *(void *)(inited + 216) = 0xE500000000000000;
    *(void *)(inited + 224) = 0x4B482D687ALL;
    *(void *)(inited + 232) = 0xE500000000000000;
    sub_6090(0, 13, 0);
    for (uint64_t i = 0; i != 208; i += 16)
    {
      swift_bridgeObjectRetain();
      sub_9DA0();
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v8 >= v7 >> 1) {
        sub_6090(v7 > 1, v8 + 1, 1);
      }
      v0[56] = &_swiftEmptyArrayStorage;
      uint64_t v9 = v0[53];
      uint64_t v10 = v0[51];
      *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))((char *)&_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v8, v9, v10);
    }
    swift_setDeallocating();
    sub_872C();
    if (qword_10480 != -1) {
      swift_once();
    }
    uint64_t v13 = (int *)v0[48];
    uint64_t v14 = qword_11638;
    v0[40] = sub_9E20();
    v0[41] = sub_9A68(&qword_10A08, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
    v0[37] = v14;
    unint64_t v16 = (uint64_t (*)(void *))((char *)v13 + *v13);
    swift_retain();
    uint64_t v15 = (void *)swift_task_alloc();
    v0[54] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_7398;
    return v16(v0 + 37);
  }
  else
  {
    sub_A0A0();
    if (qword_10478 != -1) {
      swift_once();
    }
    sub_A010();
    swift_task_dealloc();
    unint64_t v11 = (uint64_t (*)(void *))v0[1];
    return v11(&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_7398()
{
  sub_9D88();
  uint64_t v1 = v0 + 296;
  *(void *)(v0 + 440) = v2;
  swift_task_dealloc();
  sub_4130(v1);
  return _swift_task_switch(sub_7480, 0, 0);
}

uint64_t sub_7480()
{
  uint64_t v24 = v0;
  uint64_t v19 = sub_78A4();
  os_log_type_t v1 = sub_A0A0();
  if (qword_10478 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_108F8;
  if (os_log_type_enabled((os_log_t)qword_108F8, v1))
  {
    swift_bridgeObjectRetain_n();
    char v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)char v3 = 136315138;
    swift_bridgeObjectRetain();
    sub_6194(&qword_10A18);
    sub_8F54();
    uint64_t v4 = sub_A030();
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    *(void *)(v20 + 376) = sub_8770(v4, v6, &v22);
    sub_A0C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v2, v1, "SiriSettingsSuggestionsPlugin Signals Dictionary: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v7 = 6;
  unint64_t v8 = (char *)(swift_bridgeObjectRetain() + 32);
  do
  {
    unsigned int v9 = *v8;
    v21 = v8 + 1;
    unint64_t v10 = sub_7B0C(*v8);
    uint64_t v12 = v11;
    if (v9 < 4)
    {
      uint64_t v22 = 0;
      unint64_t v23 = 0xE000000000000000;
      sub_A0E0(22);
      swift_bridgeObjectRelease();
      uint64_t v22 = 0xD000000000000014;
      unint64_t v23 = 0x800000000000B220;
      v26._countAndFlagsBits = v10;
      v26._object = v12;
      sub_A070(v26);
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = *(void *)(v20 + 448);
    uint64_t v14 = *(void *)(v20 + 400);
    uint64_t v15 = swift_task_alloc();
    *(void *)(v15 + 16) = v14;
    *(unsigned char *)(v15 + 24) = v9;
    *(void *)(v15 + 32) = v19;
    *(void *)(v15 + 40) = v13;
    *(void *)(v15 + 48) = 0xD000000000000049;
    *(void *)(v15 + 56) = 0x800000000000B170;
    sub_9EE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    --v7;
    unint64_t v8 = v21;
  }
  while (v7);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_release();
  sub_9EF0();
  sub_6194(&qword_10A10);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_A640;
  sub_8F3C((long long *)(v20 + 336), v16 + 32);
  swift_release();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(uint64_t))(v20 + 8);
  return v17(v16);
}

uint64_t sub_78A4()
{
  if (qword_104E0 != -1) {
LABEL_21:
  }
    swift_once();
  uint64_t v0 = &off_10958;
  swift_beginAccess();
  if (*(void *)((char *)&dword_10 + (void)off_10958)) {
    return swift_bridgeObjectRetain();
  }
  if (qword_104D8 != -1) {
    swift_once();
  }
  for (uint64_t i = 0; ; ++i)
  {
    if (__OFADD__(i, 1))
    {
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v20 = i + 1;
    char v2 = *((unsigned char *)&off_C738 + i + 32);
    uint64_t v3 = qword_10950;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v5 = *v0;
    v21 = *v0;
    unint64_t v6 = v0;
    *uint64_t v0 = (int *)0x8000000000000000;
    unint64_t v7 = sub_6430(v2);
    uint64_t v9 = *(void *)((char *)&dword_10 + (void)v5);
    BOOL v10 = (v8 & 1) == 0;
    Swift::Int v11 = v9 + v10;
    if (__OFADD__(v9, v10)) {
      goto LABEL_19;
    }
    unint64_t v12 = v7;
    char v13 = v8;
    sub_6194(&qword_10A68);
    if (sub_A110(isUniquelyReferenced_nonNull_native, v11)) {
      break;
    }
LABEL_11:
    if (v13)
    {
      *(void *)(*((void *)v21 + 7) + 8 * v12) = v3;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(void *)&v21[2 * (v12 >> 6) + 16] |= 1 << v12;
      *(unsigned char *)(*((void *)v21 + 6) + v12) = v2;
      *(void *)(*((void *)v21 + 7) + 8 * v12) = v3;
      uint64_t v16 = *((void *)v21 + 2);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17) {
        goto LABEL_20;
      }
      *((void *)v21 + 2) = v18;
    }
    off_10958 = v21;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v0 = v6;
    if (v20 == 6)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRetain();
    }
  }
  unint64_t v14 = sub_6430(v2);
  if ((v13 & 1) == (v15 & 1))
  {
    unint64_t v12 = v14;
    goto LABEL_11;
  }
  uint64_t result = sub_A160();
  __break(1u);
  return result;
}

_UNKNOWN **sub_7B00()
{
  return &off_C738;
}

unint64_t sub_7B0C(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x695365676E616863;
      break;
    case 4:
      unint64_t result = 0x65537972616E6962;
      break;
    case 5:
      unint64_t result = 0x53636972656D756ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_7BFC(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  os_log_type_t v6 = sub_A0A0();
  if (qword_10478 != -1) {
    swift_once();
  }
  unint64_t v7 = qword_108F8;
  if (os_log_type_enabled((os_log_t)qword_108F8, v6))
  {
    char v8 = (uint8_t *)swift_slowAlloc();
    v50[0] = swift_slowAlloc();
    *(_DWORD *)char v8 = 136315138;
    uint64_t v9 = sub_A050();
    v48[0] = sub_8770(v9, v10, v50);
    sub_A0C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v7, v6, "Set up suggestion: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  char v28 = a3;
  sub_8FA0((uint64_t)a1, (uint64_t)v50);
  uint64_t v11 = v51;
  long long v31 = v52;
  sub_9004(v50, v51);
  sub_5588(a3, a4);
  *(void *)v49 = v11;
  *(_OWORD *)&v49[8] = v31;
  sub_9048(v48);
  sub_9E00();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)&v49[16];
  long long v32 = *(_OWORD *)v49;
  sub_9004(v48, *(uint64_t *)v49);
  long long v46 = v32;
  uint64_t v47 = v12;
  sub_9048(v45);
  sub_9EB0();
  uint64_t v13 = v47;
  long long v33 = v46;
  sub_9004(v45, v46);
  sub_6194(&qword_10A30);
  uint64_t v14 = sub_9E10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_A620;
  unint64_t v19 = v18 + v17;
  uint64_t v20 = *(void (**)(unint64_t, void, uint64_t))(v15 + 104);
  v20(v19, enum case for DeviceType.iPhone(_:), v14);
  v20(v19 + v16, enum case for DeviceType.iPad(_:), v14);
  long long v43 = v33;
  uint64_t v44 = v13;
  sub_9048(v42);
  sub_9EA0();
  swift_bridgeObjectRelease();
  uint64_t v21 = v44;
  long long v34 = v43;
  sub_9004(v42, v43);
  sub_7B0C(v28);
  long long v40 = v34;
  uint64_t v41 = v21;
  sub_9048(v39);
  sub_9EC0();
  swift_bridgeObjectRelease();
  uint64_t v22 = v41;
  long long v35 = v40;
  sub_9004(v39, v40);
  long long v37 = v35;
  uint64_t v38 = v22;
  sub_9048(v36);
  sub_9E90();
  sub_4130((uint64_t)v36);
  sub_4130((uint64_t)v39);
  sub_4130((uint64_t)v42);
  sub_4130((uint64_t)v45);
  sub_4130((uint64_t)v48);
  sub_4130((uint64_t)v50);
  uint64_t v23 = a1[3];
  uint64_t v24 = a1[5];
  uint64_t v25 = sub_9004(a1, v23);
  uint64_t v51 = v23;
  *(void *)&long long v52 = v24;
  Swift::String v26 = sub_9048(v50);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v26, v25, v23);
  sub_90AC((uint64_t)v26, v28, a2, v23, v24);
  return sub_4130((uint64_t)v50);
}

uint64_t sub_80E8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SettingsSuggestionsPluginOwnerDefinitionFactory()
{
  return self;
}

unint64_t sub_8120(char a1)
{
  if (a1) {
    return 0xD000000000000017;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_815C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_8200;
  return sub_6E40(a1, a2);
}

uint64_t sub_8200(uint64_t a1)
{
  sub_9D88();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_82D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_833C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_C760;
  v6._object = a2;
  unint64_t v4 = sub_A140(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

uint64_t sub_8388(char *a1, char *a2)
{
  return sub_4414(*a1, *a2);
}

uint64_t sub_8394@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_833C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_83C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_7B0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_83F0(void *a1@<X8>)
{
  *a1 = &off_C738;
}

Swift::Int sub_8400()
{
  return sub_69DC(*v0);
}

uint64_t sub_8408(uint64_t a1)
{
  return sub_449C(a1, *v1);
}

Swift::Int sub_8410(uint64_t a1)
{
  return sub_44F0(a1, *v1);
}

uint64_t sub_8418()
{
  sub_9F40();
  uint64_t v0 = sub_9E40();
  v3[3] = v0;
  v3[4] = sub_9A68(&qword_10A78, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  os_log_type_t v1 = sub_9048(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for CoreSignalTypes.app(_:), v0);
  uint64_t result = sub_9F10();
  qword_10930 = result;
  return result;
}

uint64_t sub_8500()
{
  sub_9F40();
  uint64_t result = sub_9F00();
  qword_10938 = result;
  return result;
}

uint64_t sub_8534()
{
  sub_9F40();
  uint64_t result = sub_9F30();
  qword_10940 = result;
  return result;
}

uint64_t sub_8568()
{
  sub_9F40();
  uint64_t result = sub_9F20();
  qword_10948 = result;
  return result;
}

uint64_t sub_859C()
{
  sub_6194(&qword_10A70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_AA40;
  if (qword_104B8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_10930;
  uint64_t v1 = qword_104C0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_10938;
  uint64_t v2 = qword_104C8;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_10940;
  uint64_t v3 = qword_104D0;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(v0 + 56) = qword_10948;
  sub_A090();
  qword_10950 = v0;
  return swift_retain();
}

void sub_8718()
{
  off_10958 = (int *)&_swiftEmptyDictionarySingleton;
}

uint64_t sub_872C()
{
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_8770(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_8844(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6924((uint64_t)v12, *a3);
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
      sub_6924((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_4130((uint64_t)v12);
  return v7;
}

uint64_t sub_8844(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_899C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_A0D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_8A74(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_A100();
    if (!v8)
    {
      uint64_t result = sub_A120();
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

void *sub_899C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A130();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_8A74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_8B0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_8CE8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_8CE8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_8B0C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_A080();
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
  unint64_t v3 = sub_8C80(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_A0F0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_A130();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_A120();
  __break(1u);
  return result;
}

void *sub_8C80(uint64_t a1, uint64_t a2)
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
  sub_6194(&qword_10A28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_8CE8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_6194(&qword_10A28);
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
    sub_8E98(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_8DC0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_8DC0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A130();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_8E98(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_A130();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_8F28(void *a1)
{
  return sub_7BFC(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_8F3C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_8F54()
{
  unint64_t result = qword_10A20;
  if (!qword_10A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A20);
  }
  return result;
}

uint64_t sub_8FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_9004(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *sub_9048(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_90AC(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v9 = a2;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  uint64_t v10 = sub_9048(v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v10, a1, a4);
  switch(v9)
  {
    case 0:
      uint64_t v11 = v24;
      uint64_t v12 = v25;
      sub_9004(v23, v24);
      if (qword_10490 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for iOSSettingSuggestionsActionResolver();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = 0xD00000000000002DLL;
      *(void *)(v14 + 24) = 0x800000000000B080;
      uint64_t v20 = v13;
      uint64_t v21 = sub_9A68(&qword_10A48, (void (*)(uint64_t))type metadata accessor for iOSSettingSuggestionsActionResolver);
      v19[0] = v14;
      sub_9E70();
      goto LABEL_8;
    case 2:
      sub_9FC0();
      sub_9FB0();
      char v15 = sub_9FA0();
      swift_release();
      uint64_t v11 = v24;
      uint64_t v12 = v25;
      sub_9004(v23, v24);
      if (qword_10498 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for iOSSettingDisplayModeSuggestionsResolver();
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = 0xD000000000000017;
      *(void *)(v17 + 24) = 0x800000000000B0B0;
      *(unsigned char *)(v17 + 32) = v15 & 1;
      uint64_t v20 = v16;
      uint64_t v21 = sub_9A68(&qword_10A38, (void (*)(uint64_t))type metadata accessor for iOSSettingDisplayModeSuggestionsResolver);
      v19[0] = v17;
      sub_9E70();
LABEL_8:
      sub_9E60();
      v22[3] = v11;
      v22[4] = v12;
      sub_9048(v22);
      sub_9ED0();
      swift_release();
      sub_9414((uint64_t)v19);
      sub_4130((uint64_t)v22);
      break;
    case 4:
      sub_9474((uint64_t)v10, 4, a3, a4, a5);
      break;
    case 5:
      sub_9720((uint64_t)v10, 5, a3, a4, a5);
      break;
    default:
      return sub_4130((uint64_t)v23);
  }
  return sub_4130((uint64_t)v23);
}

uint64_t sub_9414(uint64_t a1)
{
  uint64_t v2 = sub_6194(&qword_10A40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_6194(&qword_10A50);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v12 = sub_9048(v22);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v12, a1, a4);
  uint64_t v13 = v23;
  uint64_t v14 = v24;
  v19[2] = sub_9004(v22, v23);
  if (qword_10488 != -1) {
    swift_once();
  }
  v19[1] = qword_11640;
  uint64_t v15 = type metadata accessor for iOSBinarySettingSuggestionsResolver();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0xD000000000000013;
  *(void *)(v16 + 24) = 0x800000000000B010;
  v20[3] = v15;
  v20[4] = sub_9A68(&qword_10A58, (void (*)(uint64_t))type metadata accessor for iOSBinarySettingSuggestionsResolver);
  v20[0] = v16;
  sub_9E70();
  if (qword_104A8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_99CC(v8, (uint64_t)qword_10900);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
  sub_9E50();
  v21[3] = v13;
  v21[4] = v14;
  sub_9048(v21);
  sub_9ED0();
  swift_release();
  sub_9414((uint64_t)v20);
  sub_4130((uint64_t)v21);
  return sub_4130((uint64_t)v22);
}

uint64_t sub_9720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_6194(&qword_10A50);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v12 = sub_9048(v22);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v12, a1, a4);
  uint64_t v13 = v23;
  uint64_t v14 = v24;
  v19[2] = sub_9004(v22, v23);
  if (qword_10488 != -1) {
    swift_once();
  }
  v19[1] = qword_11640;
  uint64_t v15 = type metadata accessor for iOSNumericSettingSuggestionsResolver();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0xD000000000000014;
  *(void *)(v16 + 24) = 0x800000000000AFF0;
  v20[3] = v15;
  v20[4] = sub_9A68(&qword_10A60, (void (*)(uint64_t))type metadata accessor for iOSNumericSettingSuggestionsResolver);
  v20[0] = v16;
  sub_9E70();
  if (qword_104B0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_99CC(v8, (uint64_t)qword_10918);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
  sub_9E50();
  v21[3] = v13;
  v21[4] = v14;
  sub_9048(v21);
  sub_9ED0();
  swift_release();
  sub_9414((uint64_t)v20);
  sub_4130((uint64_t)v21);
  return sub_4130((uint64_t)v22);
}

uint64_t sub_99CC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_9A04(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_9A68(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_9AB0()
{
  unint64_t result = qword_10A80;
  if (!qword_10A80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10A80);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SettingsSuggestion(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsSuggestion(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsSuggestion(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x9C50);
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

uint64_t sub_9C78(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_9C80(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SettingsSuggestion()
{
  return &type metadata for SettingsSuggestion;
}

unint64_t sub_9C9C()
{
  unint64_t result = qword_10A88;
  if (!qword_10A88)
  {
    sub_9CF0(&qword_10A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A88);
  }
  return result;
}

uint64_t sub_9CF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_9D3C()
{
  unint64_t result = qword_10A98;
  if (!qword_10A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A98);
  }
  return result;
}

uint64_t sub_9DA0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_9DB0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_9DC0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_9DD0()
{
  return Transformer.init(transform:)();
}

uint64_t sub_9DE0()
{
  return SpeakableString.print.getter();
}

uint64_t sub_9DF0()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_9E00()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_9E10()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_9E20()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_9E30()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_9E40()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_9E50()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
}

uint64_t sub_9E60()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t sub_9E70()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_9E80()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_9E90()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_9EA0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_9EB0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_9EC0()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_9ED0()
{
  return dispatch thunk of SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:shownOnLockscreen:)();
}

uint64_t sub_9EE0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_9EF0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_9F00()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_9F10()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_9F20()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_9F30()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_9F40()
{
  return type metadata accessor for Signal();
}

uint64_t sub_9F50()
{
  return Wrappable.getRoot()();
}

uint64_t sub_9F60()
{
  return SettingsBinarySetting.__allocating_init(settingId:value:)();
}

uint64_t sub_9F70()
{
  return type metadata accessor for SettingsBinarySetting();
}

uint64_t sub_9F80()
{
  return SettingsNumericSetting.__allocating_init(settingId:value:)();
}

uint64_t sub_9F90()
{
  return type metadata accessor for SettingsNumericSetting();
}

uint64_t sub_9FA0()
{
  return dispatch thunk of AppearanceUtils.isDarkModeOn()();
}

uint64_t sub_9FB0()
{
  return static AppearanceUtils.shared.getter();
}

uint64_t sub_9FC0()
{
  return type metadata accessor for AppearanceUtils();
}

uint64_t sub_9FD0()
{
  return BinarySettingIdentifier.rawValue.getter();
}

uint64_t sub_9FE0()
{
  return type metadata accessor for BinarySettingIdentifier();
}

uint64_t sub_9FF0()
{
  return NumericSettingIdentifier.rawValue.getter();
}

uint64_t sub_A000()
{
  return type metadata accessor for NumericSettingIdentifier();
}

uint64_t sub_A010()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_A020()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A030()
{
  return Dictionary.description.getter();
}

NSString sub_A040()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A050()
{
  return String.init<A>(describing:)();
}

uint64_t sub_A060()
{
  return String.hash(into:)();
}

void sub_A070(Swift::String a1)
{
}

Swift::Int sub_A080()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_A090()
{
  return specialized Array._endMutation()();
}

uint64_t sub_A0A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_A0B0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_A0C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A0D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_A0E0(Swift::Int a1)
{
}

uint64_t sub_A0F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_A100()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_A110(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_A120()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A130()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_A140(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_A150()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A160()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_A170()
{
  return Hasher.init(_seed:)();
}

void sub_A180(Swift::UInt a1)
{
}

Swift::Int sub_A190()
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}