uint64_t variable initialization expression of AudioUnitFactory.observation()
{
  return 0;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)(AudioComponentDescription with)
{
  v2 = (objc_class *)sub_1000036B8(*(unint64_t *)&with.componentType, *(unint64_t *)&with.componentManufacturer, with.componentFlagsMask);
  v3.super.isa = v2;
  if (!v1) {
    v4 = v2;
  }
  return v3;
}

id AudioUnitFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit] = 0;
  *(void *)&v0[OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_observation] = 0;
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

uint64_t sub_1000036B8(unint64_t a1, unint64_t a2, int a3)
{
  int v5 = a2;
  int v6 = a1;
  unint64_t v7 = HIDWORD(a1);
  unint64_t v8 = HIDWORD(a2);
  sub_100003858();
  v17 = 0;
  v16[0] = v6;
  v16[1] = v7;
  v16[2] = v5;
  v16[3] = v8;
  v16[4] = a3;
  id v9 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithComponentDescription:v16 error:&v17];
  v10 = v17;
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v11 = OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit;
  v12 = *(void **)(v3 + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit);
  *(void *)(v3 + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit) = v9;
  id v13 = v10;

  if (!*(void *)(v3 + v11) || (uint64_t result = swift_dynamicCastClass()) == 0)
  {
    sub_100003868();
    __break(1u);
LABEL_5:
    id v15 = v10;
    sub_100003848();

    return swift_willThrow();
  }
  return result;
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return self;
}

uint64_t sub_100003838()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003848()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100003858()
{
  return type metadata accessor for MauiAUSPAudioUnit();
}

uint64_t sub_100003868()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}