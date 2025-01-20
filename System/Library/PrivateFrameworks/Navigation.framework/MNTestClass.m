@interface MNTestClass
- (_TtC10Navigation11MNTestClass)init;
- (void)testFunction;
@end

@implementation MNTestClass

- (void)testFunction
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54FF0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  *(_OWORD *)(v3 + 16) = xmmword_1B55424B0;
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 32) = 1953719668;
  *(void *)(v3 + 40) = 0xE400000000000000;
  v5 = self;
  sub_1B5532160();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(objc_allocWithZone((Class)MNParkedVehicleDetector), sel_init);
  objc_msgSend(v6, sel_startMonitoring);
}

- (_TtC10Navigation11MNTestClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MNTestClass();
  return [(MNTestClass *)&v3 init];
}

@end