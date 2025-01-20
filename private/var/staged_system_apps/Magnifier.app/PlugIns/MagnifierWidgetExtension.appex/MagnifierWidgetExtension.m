uint64_t sub_100002FC0()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MagnifierWidgetReferenceClass()
{
  return self;
}

ValueMetadata *type metadata accessor for MagnifierWidget()
{
  return &type metadata for MagnifierWidget;
}

uint64_t sub_100003004()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  sub_100003980();
  __chkstk_darwin();
  uint64_t v1 = sub_1000034F4(&qword_1000081D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v19 = v1;
  uint64_t v20 = v2;
  __chkstk_darwin();
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000034F4(&qword_1000081D8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = qword_100008128;
  sub_100003900();
  type metadata accessor for MagnifierWidgetReferenceClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = self;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)[v10 bundleForClass:ObjCClassFromMetadata];
  v17._countAndFlagsBits = 0x8000000100003AD0;
  v26._countAndFlagsBits = 0x545F544547444957;
  v26._object = (void *)0xEC000000454C5449;
  v27.value._countAndFlagsBits = 0;
  v27.value._object = 0;
  v12.super.isa = v11;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  sub_1000038F0(v26, v27, v12, v28, v17);

  sub_100003970();
  sub_1000034F4(&qword_1000081E0);
  sub_10000353C();
  sub_1000035DC(&qword_1000081F0, &qword_1000081E0);
  sub_100003990();
  sub_100003920();
  uint64_t v13 = sub_1000035DC(&qword_1000081F8, &qword_1000081D0);
  uint64_t v14 = v19;
  sub_100003940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v14);
  uint64_t v24 = v14;
  uint64_t v25 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v15 = v21;
  sub_100003950();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v8, v15);
}

uint64_t sub_1000033F0()
{
  type metadata accessor for MagnifierWidgetReferenceClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v4._countAndFlagsBits = 0x8000000100003AD0;
  v5._countAndFlagsBits = 0x545F544547444957;
  v5._object = (void *)0xEC000000454C5449;
  v6.value._countAndFlagsBits = 0;
  v6.value._object = 0;
  v2.super.isa = v1;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_1000038F0(v5, v6, v2, v7, v4);

  sub_100003620();
  return sub_100003960();
}

uint64_t sub_1000034F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000353C()
{
  unint64_t result = qword_1000081E8;
  if (!qword_1000081E8)
  {
    sub_100003900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000081E8);
  }
  return result;
}

uint64_t sub_100003594(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000035DC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003594(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100003620()
{
  unint64_t result = qword_100008200;
  if (!qword_100008200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008200);
  }
  return result;
}

uint64_t sub_100003674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003730()
{
  unint64_t v0 = sub_10000382C();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for MagnifierWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000037AC()
{
  unint64_t result = qword_100008208;
  if (!qword_100008208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008208);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierWidgetBundle()
{
  return &type metadata for MagnifierWidgetBundle;
}

uint64_t sub_100003810()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000382C()
{
  unint64_t result = qword_100008210;
  if (!qword_100008210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008210);
  }
  return result;
}

uint64_t sub_100003880()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000038F0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100003900()
{
  return type metadata accessor for MagnifierIntent();
}

uint64_t sub_100003910()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100003920()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100003940()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100003950()
{
  return WidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100003960()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_100003970()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100003980()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100003990()
{
  return ControlButton.init<A>(kind:intent:displayName:preferredSize:title:affordances:)();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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