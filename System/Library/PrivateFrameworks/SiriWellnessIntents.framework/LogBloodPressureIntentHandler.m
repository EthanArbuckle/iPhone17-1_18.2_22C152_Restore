@interface LogBloodPressureIntentHandler
- (_TtC19SiriWellnessIntents29LogBloodPressureIntentHandler)init;
- (void)handleLogBloodPressure:(LogBloodPressureIntent *)a3 completion:(id)a4;
@end

@implementation LogBloodPressureIntentHandler

- (void)handleLogBloodPressure:(LogBloodPressureIntent *)a3 completion:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents29LogBloodPressureIntentHandler)init
{
  return (_TtC19SiriWellnessIntents29LogBloodPressureIntentHandler *)LogBloodPressureIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end