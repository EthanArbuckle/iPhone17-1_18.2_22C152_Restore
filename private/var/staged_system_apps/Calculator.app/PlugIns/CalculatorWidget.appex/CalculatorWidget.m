uint64_t sub_100003B48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_100003CF0(&qword_10000C148);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003D34();
  sub_100006D80();
  sub_100003D88();
  sub_100006D70();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003C70()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterExtensionBundle()
{
  return &type metadata for ControlCenterExtensionBundle;
}

uint64_t sub_100003CD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003CF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003D34()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_100003D88()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    sub_100003DE4(&qword_10000C148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

uint64_t sub_100003DE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003E2C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CalculatorControl()
{
  return &type metadata for CalculatorControl;
}

uint64_t sub_100003E98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003EB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v35 = sub_100006D10();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  v44 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006D50();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100006E30();
  __chkstk_darwin(v4 - 8);
  uint64_t v45 = sub_100006D20();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  v38 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100003CF0(&qword_10000C170);
  uint64_t v41 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100003CF0(&qword_10000C178);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  uint64_t v47 = v9;
  __chkstk_darwin(v8);
  v37 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003CF0(&qword_10000C180);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v48 = v11;
  uint64_t v49 = v12;
  __chkstk_darwin(v11);
  v40 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100003CF0(&qword_10000C188);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v50 = v14;
  uint64_t v51 = v15;
  __chkstk_darwin(v14);
  v42 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_100003CF0(&qword_10000C190);
  sub_10000486C(&qword_10000C198, &qword_10000C190);
  sub_100006E10();
  sub_100006E20();
  sub_100006D40();
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v17 = *(void (**)(void))(v1 + 104);
  uint64_t v34 = v1 + 104;
  v36 = (void (*)(char *, void, uint64_t))v17;
  v18 = v44;
  v17(v44);
  v32[1] = 0x8000000100006FE0;
  v19 = v38;
  sub_100006D30();
  uint64_t v20 = sub_10000486C(&qword_10000C1A0, &qword_10000C170);
  uint64_t v21 = v39;
  sub_100006DA0();
  uint64_t v43 = *(void *)(v43 + 8);
  uint64_t v22 = v45;
  ((void (*)(char *, uint64_t))v43)(v19, v45);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v21);
  sub_100006E20();
  sub_100006D40();
  v36(v18, v33, v35);
  sub_100006D30();
  uint64_t v53 = v21;
  uint64_t v54 = v20;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v24 = v40;
  uint64_t v25 = v46;
  v26 = v37;
  sub_100006D90();
  ((void (*)(char *, uint64_t))v43)(v19, v22);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v25);
  uint64_t v53 = v25;
  uint64_t v54 = OpaqueTypeConformance2;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  v28 = v42;
  uint64_t v29 = v48;
  sub_100006DC0();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v29);
  uint64_t v53 = v29;
  uint64_t v54 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v50;
  sub_100006DB0();
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v28, v30);
}

uint64_t sub_1000045DC()
{
  return sub_100006E00();
}

uint64_t sub_10000468C()
{
  return Label.init(title:icon:)(sub_1000046E0, 0, sub_100004820, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_1000046E0@<X0>(uint64_t a1@<X8>)
{
  sub_100006D50();
  __chkstk_darwin();
  sub_100006E30();
  __chkstk_darwin();
  sub_100006E20();
  sub_100006D40();
  sub_100006E40();
  sub_100004904();
  uint64_t result = sub_100006DD0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100004820@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006DE0();
  *a1 = result;
  return result;
}

uint64_t sub_10000486C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003DE4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000048B0()
{
  unint64_t result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

unint64_t sub_100004904()
{
  unint64_t result = qword_10000C1C0;
  if (!qword_10000C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C0);
  }
  return result;
}

uint64_t sub_100004958()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004A84()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Utility()
{
  return self;
}

unint64_t sub_100004AB8(uint64_t a1)
{
  uint64_t v2 = sub_100003CF0(&qword_10000C328);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003CF0(&qword_10000C330);
  uint64_t v6 = sub_100006E60();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100006B54(v10, (uint64_t)v5);
    unint64_t result = sub_100006AF4();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[7];
    uint64_t v16 = sub_100006CA0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v5, v16);
    uint64_t v17 = v7[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v7[2] = v19;
    v10 += v11;
    if (!--v8)
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

uint64_t sub_100004C7C()
{
  uint64_t v0 = sub_100003CF0(&qword_10000C308);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_100006D10();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006D50();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100006E30();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100006D20();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100006CF0();
  sub_100006A64(v10, static CalculatorAppView.typeDisplayRepresentation);
  sub_100004FC4(v10, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
  sub_100006E20();
  sub_100006D40();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100006D30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100006CE0();
}

uint64_t CalculatorAppView.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_10000C120 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100006CF0();

  return sub_100004FC4(v0, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
}

uint64_t sub_100004FC4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static CalculatorAppView.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C120 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006CF0();
  uint64_t v3 = sub_100004FC4(v2, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000050A4()
{
  uint64_t v0 = sub_100003CF0(&qword_10000C318);
  __chkstk_darwin(v0 - 8);
  uint64_t v17 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100003CF0(&qword_10000C308);
  __chkstk_darwin(v2 - 8);
  uint64_t v16 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006D10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006D50();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100006E30();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100006D20();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100003CF0(&qword_10000C320);
  sub_100003CF0(&qword_10000C328);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100007230;
  sub_100006E20();
  sub_100006D40();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_100006D30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  uint64_t v13 = sub_100006C80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v17, 1, 1, v13);
  sub_100006C90();
  unint64_t result = sub_100004AB8(v12);
  static CalculatorAppView.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CalculatorAppView.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10000C128 != -1) {
    swift_once();
  }
  return &static CalculatorAppView.caseDisplayRepresentations;
}

uint64_t static CalculatorAppView.caseDisplayRepresentations.getter()
{
  if (qword_10000C128 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

BOOL CalculatorAppView.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008750;
  v6._object = a2;
  Swift::Int v4 = sub_100006E70(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

_UNKNOWN **static CalculatorAppView.allCases.getter()
{
  return &off_100008788;
}

uint64_t CalculatorAppView.rawValue.getter()
{
  return 7368801;
}

uint64_t sub_1000055A4()
{
  return 1;
}

uint64_t sub_1000055AC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_1000087B0;
  v7._object = v3;
  Swift::Int v5 = sub_100006E70(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100005600(void *a1@<X8>)
{
  *a1 = 7368801;
  a1[1] = 0xE300000000000000;
}

unint64_t sub_100005618()
{
  unint64_t result = qword_10000C268;
  if (!qword_10000C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C268);
  }
  return result;
}

Swift::Int sub_10000566C()
{
  return sub_100006E90();
}

uint64_t sub_1000056B8()
{
  return sub_100006E50();
}

Swift::Int sub_1000056C8()
{
  return sub_100006E90();
}

unint64_t sub_100005714()
{
  unint64_t result = qword_10000C270;
  if (!qword_10000C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C270);
  }
  return result;
}

unint64_t sub_10000576C()
{
  unint64_t result = qword_10000C278;
  if (!qword_10000C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C278);
  }
  return result;
}

unint64_t sub_1000057C4()
{
  unint64_t result = qword_10000C280;
  if (!qword_10000C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C280);
  }
  return result;
}

void *sub_100005818()
{
  return &protocol witness table for String;
}

unint64_t sub_100005828()
{
  unint64_t result = qword_10000C288;
  if (!qword_10000C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C288);
  }
  return result;
}

unint64_t sub_100005880()
{
  unint64_t result = qword_10000C290;
  if (!qword_10000C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C290);
  }
  return result;
}

unint64_t sub_1000058D8()
{
  unint64_t result = qword_10000C298;
  if (!qword_10000C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

unint64_t sub_100005930()
{
  unint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_100005988@<X0>(uint64_t a1@<X8>)
{
  return sub_100006224(&qword_10000C120, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static CalculatorAppView.typeDisplayRepresentation, a1);
}

uint64_t sub_1000059C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000616C(a1, a2, a3, (void (*)(void))sub_1000059EC);
}

unint64_t sub_1000059EC()
{
  unint64_t result = qword_10000C2A8;
  if (!qword_10000C2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A8);
  }
  return result;
}

uint64_t sub_100005A40(uint64_t a1)
{
  unint64_t v2 = sub_1000059EC();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005A90()
{
  unint64_t result = qword_10000C2B0;
  if (!qword_10000C2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2B0);
  }
  return result;
}

unint64_t sub_100005AE8()
{
  unint64_t result = qword_10000C2B8;
  if (!qword_10000C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2B8);
  }
  return result;
}

unint64_t sub_100005B40()
{
  unint64_t result = qword_10000C2C0;
  if (!qword_10000C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2C0);
  }
  return result;
}

uint64_t sub_100005B94(uint64_t a1)
{
  unint64_t v2 = sub_100005930();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005BE4()
{
  unint64_t result = qword_10000C2C8;
  if (!qword_10000C2C8)
  {
    sub_100003DE4(&qword_10000C2D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2C8);
  }
  return result;
}

void sub_100005C40(void *a1@<X8>)
{
  *a1 = &off_1000087E8;
}

unint64_t sub_100005C54()
{
  unint64_t result = qword_10000C2D8;
  if (!qword_10000C2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2D8);
  }
  return result;
}

uint64_t sub_100005CA8()
{
  uint64_t v0 = sub_100006D10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::OpaquePointer v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006D50();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100006E30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100006D20();
  sub_100006A64(v6, qword_10000CD70);
  sub_100004FC4(v6, (uint64_t)qword_10000CD70);
  sub_100006E20();
  sub_100006D40();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006D30();
}

uint64_t sub_100005E94()
{
  uint64_t v0 = sub_100006D00();
  sub_100006A64(v0, qword_10000CD88);
  uint64_t v1 = sub_100004FC4(v0, (uint64_t)qword_10000CD88);
  uint64_t v2 = enum case for IntentAuthenticationPolicy.alwaysAllowed(_:);
  Swift::OpaquePointer v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t sub_100005F1C()
{
  return sub_100006C50();
}

uint64_t sub_100005F40()
{
  return sub_100006C60();
}

void (*sub_100005F64(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006C40();
  return sub_100005FC0;
}

void sub_100005FC0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100006010()
{
  unint64_t result = qword_10000C2E0;
  if (!qword_10000C2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2E0);
  }
  return result;
}

unint64_t sub_100006068()
{
  unint64_t result = qword_10000C2E8;
  if (!qword_10000C2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2E8);
  }
  return result;
}

unint64_t sub_1000060C0()
{
  unint64_t result = qword_10000C2F0;
  if (!qword_10000C2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2F0);
  }
  return result;
}

uint64_t sub_100006114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000616C(a1, a2, a3, (void (*)(void))sub_1000048B0);
}

uint64_t sub_100006140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000616C(a1, a2, a3, (void (*)(void))sub_100006010);
}

uint64_t sub_10000616C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000061B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100006224(&qword_10000C130, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD70, a1);
}

uint64_t sub_1000061EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100006224(&qword_10000C138, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10000CD88, a1);
}

uint64_t sub_100006224@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100004FC4(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000062D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000048B0();
  *uint64_t v5 = v2;
  v5[1] = sub_100006388;
  return OpenIntent.perform()(a1, a2, v6);
}

uint64_t sub_100006388()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000647C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006604();
  *a1 = result;
  return result;
}

unint64_t sub_1000064A4()
{
  return 0xD00000000000001ALL;
}

uint64_t getEnumTagSinglePayload for CalculatorAppView(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CalculatorAppView(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000065B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000065DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CalculatorAppView()
{
  return &type metadata for CalculatorAppView;
}

ValueMetadata *type metadata accessor for LaunchCalculatorOpenIntent()
{
  return &type metadata for LaunchCalculatorOpenIntent;
}

uint64_t sub_100006604()
{
  uint64_t v0 = sub_100006CB0();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v22 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003CF0(&qword_10000C300);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - v4;
  uint64_t v6 = sub_100003CF0(&qword_10000C308);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006D10();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006D50();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006E30();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100006D20();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v20 = sub_100003CF0(&qword_10000C310);
  sub_100006E20();
  sub_100006D40();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_100006D30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v25 = 0;
  uint64_t v17 = sub_100006C30();
  BOOL v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v21, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_1000059EC();
  return sub_100006C70();
}

uint64_t *sub_100006A64(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006AC8(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100006AF4()
{
  sub_100006E80();
  sub_100006E50();
  Swift::Int v0 = sub_100006E90();

  return sub_100006AC8(v0);
}

uint64_t sub_100006B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003CF0(&qword_10000C328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100006BF0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006C00()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100006C10()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006C30()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006C40()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006C50()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006C60()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006C70()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006C80()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006C90()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100006CA0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006CB0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006CD0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006CE0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006D00()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t sub_100006D10()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006D20()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006D30()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006D40()
{
  return static Locale.current.getter();
}

uint64_t sub_100006D50()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006D60()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006D70()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006D80()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100006D90()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100006DA0()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100006DB0()
{
  return ControlWidgetConfiguration.showsContextualMenu(_:)();
}

uint64_t sub_100006DC0()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100006DD0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100006DE0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100006E00()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_100006E10()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_100006E20()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006E30()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006E40()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100006E50()
{
  return String.hash(into:)();
}

uint64_t sub_100006E60()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006E70(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006E80()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006E90()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}