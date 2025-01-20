uint64_t sub_1000029DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_100002B84(&qword_100008098);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002BC8();
  sub_1000038A8();
  sub_100002C1C();
  sub_100003898();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002B04()
{
  unint64_t result = qword_100008090;
  if (!qword_100008090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for LauncherControlBundle()
{
  return &type metadata for LauncherControlBundle;
}

uint64_t sub_100002B68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002B84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002BC8()
{
  unint64_t result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

unint64_t sub_100002C1C()
{
  unint64_t result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    sub_100002C78(&qword_100008098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100002C78(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002CC0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LaunchAppControl()
{
  return &type metadata for LaunchAppControl;
}

uint64_t sub_100002D2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002D48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v33 = sub_100003828();
  uint64_t v49 = *(void *)(v33 - 8);
  __chkstk_darwin();
  v2 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003868();
  __chkstk_darwin();
  sub_100003968();
  __chkstk_darwin();
  uint64_t v3 = sub_100003838();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  __chkstk_darwin();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100002B84(&qword_1000080B0);
  uint64_t v38 = *(void *)(v36 - 8);
  __chkstk_darwin();
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002B84(&qword_1000080B8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  uint64_t v43 = v9;
  __chkstk_darwin();
  v35 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002B84(&qword_1000080C0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v44 = v11;
  uint64_t v45 = v12;
  __chkstk_darwin();
  v37 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002B84(&qword_1000080C8);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v46 = v14;
  uint64_t v47 = v15;
  __chkstk_darwin();
  v39 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002B84(&qword_1000080D0);
  sub_100003630(&qword_1000080D8, &qword_1000080D0);
  sub_100003948();
  sub_100003958();
  sub_100003858();
  unsigned int v32 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v17 = *(void (**)(void))(v49 + 104);
  v49 += 104;
  v34 = (void (*)(char *, void, uint64_t))v17;
  v31 = v2;
  v17(v2);
  sub_100003848();
  uint64_t v18 = sub_100003630(&qword_1000080E0, &qword_1000080B0);
  uint64_t v19 = v36;
  sub_1000038C8();
  uint64_t v20 = v41;
  uint64_t v40 = *(void *)(v40 + 8);
  ((void (*)(char *, uint64_t))v40)(v5, v41);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v19);
  sub_100003958();
  sub_100003858();
  v34(v31, v32, v33);
  sub_100003848();
  uint64_t v50 = v19;
  uint64_t v51 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v22 = v37;
  uint64_t v23 = v42;
  v24 = v35;
  sub_1000038B8();
  ((void (*)(char *, uint64_t))v40)(v5, v20);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v23);
  uint64_t v50 = v23;
  uint64_t v51 = OpaqueTypeConformance2;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  v26 = v39;
  uint64_t v27 = v44;
  sub_1000038D8();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v27);
  uint64_t v50 = v27;
  uint64_t v51 = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v46;
  sub_1000038E8();
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v26, v28);
}

uint64_t sub_100003458()
{
  return sub_100003938();
}

uint64_t sub_100003508()
{
  return Label.init(title:icon:)(sub_10000355C, 0, sub_1000035E8, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_10000355C@<X0>(uint64_t a1@<X8>)
{
  sub_100003888();
  uint64_t result = sub_1000038F8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000035E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003908();
  *a1 = result;
  return result;
}

uint64_t sub_100003630(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002C78(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100003674()
{
  unint64_t result = qword_1000080F8;
  if (!qword_1000080F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080F8);
  }
  return result;
}

uint64_t sub_1000036C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000037F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100003828()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100003838()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100003848()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100003858()
{
  return static Locale.current.getter();
}

uint64_t sub_100003868()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100003878()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100003888()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100003898()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000038A8()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_1000038B8()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_1000038C8()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_1000038D8()
{
  return ControlWidgetConfiguration.showsContextualMenu(_:)();
}

uint64_t sub_1000038E8()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_1000038F8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100003908()
{
  return Image.init(systemName:)();
}

uint64_t sub_100003928()
{
  return LaunchAppIntent.init()();
}

uint64_t sub_100003938()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_100003948()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_100003958()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100003968()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t self
{
  return _self;
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