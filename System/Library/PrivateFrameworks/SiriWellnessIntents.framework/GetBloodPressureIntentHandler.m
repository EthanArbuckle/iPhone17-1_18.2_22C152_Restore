@interface GetBloodPressureIntentHandler
- (_TtC19SiriWellnessIntents29GetBloodPressureIntentHandler)init;
- (void)handleGetBloodPressure:(GetBloodPressureIntent *)a3 completion:(id)a4;
@end

@implementation GetBloodPressureIntentHandler

- (void)handleGetBloodPressure:(GetBloodPressureIntent *)a3 completion:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents29GetBloodPressureIntentHandler)init
{
  return (_TtC19SiriWellnessIntents29GetBloodPressureIntentHandler *)GetBloodPressureIntentHandler.init()();
}

- (void).cxx_destruct
{
  uint64_t v3 = OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter;
  uint64_t v2 = type metadata accessor for OSSignposter();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_provider);
}

@end