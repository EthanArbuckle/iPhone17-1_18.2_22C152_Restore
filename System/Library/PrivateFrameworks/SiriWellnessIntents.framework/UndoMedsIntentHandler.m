@interface UndoMedsIntentHandler
- (_TtC19SiriWellnessIntents21UndoMedsIntentHandler)init;
- (void)handleUndoMeds:(UndoMedsIntent *)a3 completion:(id)a4;
@end

@implementation UndoMedsIntentHandler

- (void)handleUndoMeds:(UndoMedsIntent *)a3 completion:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in UndoMedsIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents21UndoMedsIntentHandler)init
{
  return (_TtC19SiriWellnessIntents21UndoMedsIntentHandler *)UndoMedsIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end