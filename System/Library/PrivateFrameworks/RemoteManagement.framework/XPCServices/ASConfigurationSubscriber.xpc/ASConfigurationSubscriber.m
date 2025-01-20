int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100003E6C(&qword_100008008);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100003F30;
  *(void *)(v4 + 32) = sub_100003EB0();
  sub_100003E6C(&qword_100008010);
  isa = sub_100003EC0().super.isa;
  swift_bridgeObjectRelease();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:0];

  return 0;
}

uint64_t sub_100003E6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003EB0()
{
  return type metadata accessor for ASPasskeyConfigurationSubscriberApplicator();
}

NSArray sub_100003EC0()
{
  return Array._bridgeToObjectiveC()();
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}