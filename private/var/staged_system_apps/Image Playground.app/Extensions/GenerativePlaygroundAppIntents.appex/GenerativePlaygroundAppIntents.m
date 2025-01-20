uint64_t sub_100003980(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003B90();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

unint64_t sub_1000039D0()
{
  sub_100003C04(&qword_100008010);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100003D50;
  uint64_t v1 = sub_100003CB0();
  unint64_t result = sub_100003C48();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = result;
  qword_1000081B0 = v0;
  return result;
}

uint64_t sub_100003A30()
{
  if (qword_100008020 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1000081B0;

  return _swift_bridgeObjectRetain(v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003AE8()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003B40()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003B90()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativePlaygroundAppIntentsExtensionPackage()
{
  return &type metadata for GenerativePlaygroundAppIntentsExtensionPackage;
}

ValueMetadata *type metadata accessor for GenerativePlaygroundAppIntentsExtension()
{
  return &type metadata for GenerativePlaygroundAppIntentsExtension;
}

uint64_t sub_100003C04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003C48()
{
  unint64_t result = qword_100008018;
  if (!qword_100008018)
  {
    sub_100003CB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_100003CB0()
{
  return type metadata accessor for ImagePlaygroundIntentsPackage();
}

uint64_t sub_100003CC0()
{
  return static AppExtension.main()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}