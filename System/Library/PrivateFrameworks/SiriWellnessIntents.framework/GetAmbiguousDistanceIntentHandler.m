@interface GetAmbiguousDistanceIntentHandler
- (_TtC19SiriWellnessIntents33GetAmbiguousDistanceIntentHandler)init;
- (void)handleGetAmbiguousDistance:(GetAmbiguousDistanceIntent *)a3 completion:(id)a4;
@end

@implementation GetAmbiguousDistanceIntentHandler

- (void)handleGetAmbiguousDistance:(GetAmbiguousDistanceIntent *)a3 completion:(id)a4
{
  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GetAmbiguousDistanceIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents33GetAmbiguousDistanceIntentHandler)init
{
  return (_TtC19SiriWellnessIntents33GetAmbiguousDistanceIntentHandler *)GetAmbiguousDistanceIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end