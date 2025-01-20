uint64_t sub_10000334C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unsigned char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned char v13[64];
  void v14[9];
  char v15;

  sub_1000037CC(&qword_100008058);
  __chkstk_darwin();
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14[3] = sub_100003C38();
  v14[4] = &protocol witness table for Subsystems;
  v14[0] = a1;
  swift_retain();
  swift_retain();
  sub_100003C48();
  v6 = sub_100003C08();
  v7 = sub_100003C18();
  sub_1000039C8((uint64_t)v13, (uint64_t)v14);
  v14[8] = v6;
  v15 = v7;
  sub_100003A24((uint64_t)v13);
  v8 = enum case for ColorScheme.dark(_:);
  v9 = sub_100003BF8();
  v10 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104))(v5, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  v11 = sub_1000037CC(&qword_100008020);
  sub_100003A78((uint64_t)v5, a2 + *(int *)(v11 + 36), &qword_100008058);
  sub_100003A78((uint64_t)v14, a2, &qword_100008038);
  sub_100003ADC((uint64_t)v5, &qword_100008058);
  return sub_100003ADC((uint64_t)v14, &qword_100008038);
}

uint64_t sub_100003510()
{
  uint64_t v1 = *v0;
  swift_retain();
  uint64_t v2 = sub_1000037CC(&qword_100008020);
  unint64_t v3 = sub_100003810();

  return LockedCameraCaptureUIScene.init(content:)(sub_1000037C4, v1, v2, v3);
}

uint64_t sub_10000358C(uint64_t a1)
{
  unint64_t v2 = sub_100003770();

  return LockedCameraCaptureExtension.configuration.getter(a1, v2);
}

id sub_1000035D8@<X0>(uint64_t *a1@<X8>)
{
  sub_100003C38();
  swift_allocObject();
  uint64_t v2 = sub_100003C28();
  id result = [self preheatCaptureResources];
  *a1 = v2;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003690()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for LockScreenCamera()
{
  return &type metadata for LockScreenCamera;
}

uint64_t sub_1000036F8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003DC0, 1);
}

unint64_t sub_100003718()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    sub_100003BB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

unint64_t sub_100003770()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_1000037C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000334C(v1, a1);
}

uint64_t sub_1000037CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003810()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    sub_1000038B0(&qword_100008020);
    sub_1000038F8();
    sub_100003B74(&qword_100008048, &qword_100008050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_1000038B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000038F8()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    sub_1000038B0(&qword_100008038);
    sub_100003974();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

unint64_t sub_100003974()
{
  unint64_t result = qword_100008040;
  if (!qword_100008040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008040);
  }
  return result;
}

uint64_t sub_1000039C8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100003A24(uint64_t a1)
{
  return a1;
}

uint64_t sub_100003A78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000037CC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003ADC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000037CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003B38()
{
  return sub_100003B74(&qword_100008060, &qword_100008068);
}

uint64_t sub_100003B74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000038B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003BB8()
{
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_100003BC8()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100003BF8()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100003C08()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_100003C18()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100003C28()
{
  return Subsystems.init()();
}

uint64_t sub_100003C38()
{
  return type metadata accessor for Subsystems();
}

uint64_t sub_100003C48()
{
  return ViewfinderViewController.init(provider:session:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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

uint64_t swift_retain()
{
  return _swift_retain();
}