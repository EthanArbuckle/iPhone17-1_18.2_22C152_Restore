uint64_t variable initialization expression of AudioUnitFactory.context()
{
  return 0;
}

Swift::Void __swiftcall AudioUnitFactory.beginRequest(with:)(NSExtensionContext with)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context);
  *(NSExtensionContext *)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = with;
  v2 = with.super.isa;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)(AudioComponentDescription with)
{
  sub_100003918();
  result.super.isa = (Class)sub_100003908();
  if (!v2)
  {
    uint64_t v4 = OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit;
    v5 = *(void **)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit);
    *(AUAudioUnit *)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = result;

    v6 = *(void **)(v1 + v4);
    if (v6) {
      return (AUAudioUnit)v6;
    }
    else {
      __break(1u);
    }
  }
  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id AudioUnitFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return self;
}

uint64_t sub_1000038F8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003908()
{
  return TTSSiriSynthAudioUnit.__allocating_init(componentDescription:options:)();
}

uint64_t sub_100003918()
{
  return type metadata accessor for TTSSiriSynthAudioUnit();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}