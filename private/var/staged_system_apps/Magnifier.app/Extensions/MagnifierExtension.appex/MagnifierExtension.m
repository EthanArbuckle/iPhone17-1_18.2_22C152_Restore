uint64_t sub_100002B14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t KeyPath;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v1 = sub_100003818();
  v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000311C(&qword_100008040);
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000311C(&qword_100008030) - 8;
  __chkstk_darwin();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000311C(&qword_100008068);
  sub_100003350();
  sub_100003828();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for ColorScheme.dark(_:), v1);
  v13 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  v14 = sub_10000311C(&qword_100008050);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v13 + *(int *)(v14 + 28), v4, v1);
  *v13 = KeyPath;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = sub_100003938();
  v16 = swift_getKeyPath();
  v17 = v21;
  sub_100003478((uint64_t)v11, v21);
  v18 = (uint64_t *)(v17 + *(int *)(sub_10000311C(&qword_100008018) + 36));
  *v18 = v16;
  v18[1] = v15;
  return sub_1000034E0((uint64_t)v11);
}

uint64_t sub_100002DE8()
{
  return sub_100003848();
}

uint64_t sub_100002E0C(uint64_t a1)
{
  sub_100003818();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100003858();
}

uint64_t sub_100002ED4()
{
  uint64_t v0 = sub_10000311C(&qword_100008018);
  unint64_t v1 = sub_100003160();

  return LockedCameraCaptureUIScene.init(content:)(sub_100002B14, 0, v0, v1);
}

uint64_t sub_100002F3C(uint64_t a1)
{
  unint64_t v2 = sub_1000030C8();

  return LockedCameraCaptureExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002FE8()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierExtension()
{
  return &type metadata for MagnifierExtension;
}

uint64_t sub_100003050(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003BE4, 1);
}

unint64_t sub_100003070()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    sub_1000037B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

unint64_t sub_1000030C8()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

uint64_t sub_10000311C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003160()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    sub_100003200(&qword_100008018);
    sub_100003248();
    sub_10000357C(&qword_100008058, &qword_100008060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100003200(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003248()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    sub_100003200(&qword_100008030);
    sub_10000357C(&qword_100008038, &qword_100008040);
    sub_10000357C(&qword_100008048, &qword_100008050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_10000330C@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  uint64_t v3 = sub_100003838();
  uint64_t result = sub_100003918();
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = result;
  return result;
}

unint64_t sub_100003350()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    sub_100003200(&qword_100008068);
    sub_1000033CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

unint64_t sub_1000033CC()
{
  unint64_t result = qword_100008078;
  if (!qword_100008078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008078);
  }
  return result;
}

uint64_t sub_100003420@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003868();
  *a1 = result;
  return result;
}

uint64_t sub_10000344C()
{
  return sub_100003878();
}

uint64_t sub_100003478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000311C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000034E0(uint64_t a1)
{
  uint64_t v2 = sub_10000311C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003540()
{
  return sub_10000357C(&qword_100008080, &qword_100008088);
}

uint64_t sub_10000357C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003200(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierExtensionViewRepresentable()
{
  return &type metadata for MagnifierExtensionViewRepresentable;
}

uint64_t sub_1000035D4()
{
  swift_retain();
  uint64_t v0 = sub_1000037D8();

  return static CompositionRoot.magnifierExtensionViewController.getter(v0);
}

uint64_t sub_100003610()
{
  return sub_1000038A8();
}

void *sub_10000364C()
{
  return &protocol witness table for Never;
}

uint64_t sub_100003658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100003764();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000036BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100003764();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100003720()
{
  return sub_100003928();
}

void sub_10000373C()
{
}

unint64_t sub_100003764()
{
  unint64_t result = qword_100008090;
  if (!qword_100008090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

uint64_t sub_1000037B8()
{
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_1000037D8()
{
  return static CompositionRoot.magnifierLockedCameraCaptureSession.setter();
}

uint64_t sub_1000037E8()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100003818()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100003828()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_100003838()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_100003848()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100003858()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100003868()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_100003878()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100003888()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_100003898()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_1000038A8()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1000038C8()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_1000038D8()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_1000038E8()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_100003908()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_100003918()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100003928()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100003938()
{
  return static Color.black.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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