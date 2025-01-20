@interface LogSpecificMedicationsIntentHandler
- (_TtC19SiriWellnessIntents35LogSpecificMedicationsIntentHandler)init;
- (void)handleLogSpecificMedications:(LogSpecificMedicationsIntent *)a3 completion:(id)a4;
@end

@implementation LogSpecificMedicationsIntentHandler

- (void)handleLogSpecificMedications:(LogSpecificMedicationsIntent *)a3 completion:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in LogSpecificMedicationsIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents35LogSpecificMedicationsIntentHandler)init
{
  return (_TtC19SiriWellnessIntents35LogSpecificMedicationsIntentHandler *)LogSpecificMedicationsIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end