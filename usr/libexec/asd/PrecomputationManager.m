@interface PrecomputationManager
+ (_TtC3asd21PrecomputationManager)shared;
- (_TtC3asd21PrecomputationManager)init;
- (void)captureWithBindings:(id)a3;
- (void)clearAllBindings;
- (void)notifyCachesWereRemovedWithCompletionHandler:(id)a3;
- (void)pausePrecomputationsWithCompletionHandler:(id)a3;
- (void)resumePrecomputationsWithCompletionHandler:(id)a3;
- (void)triggerAllPrecomputationsWithCompletionHandler:(id)a3;
- (void)triggerDuePrecomputationsWithDataProtectionClass:(int64_t)a3 shouldDefer:(id)a4 completionHandler:;
- (void)triggerPrecomputationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4;
- (void)triggerPregenerationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation PrecomputationManager

+ (_TtC3asd21PrecomputationManager)shared
{
  id v2 = static PrecomputationManager.shared.getter();

  return (_TtC3asd21PrecomputationManager *)v2;
}

- (_TtC3asd21PrecomputationManager)init
{
  return (_TtC3asd21PrecomputationManager *)PrecomputationManager.init()();
}

- (void)triggerDuePrecomputationsWithDataProtectionClass:(int64_t)a3 shouldDefer:(id)a4 completionHandler:
{
  v5 = v4;
  v8 = _Block_copy(a4);
  v9 = _Block_copy(v5);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = self;
  v11 = self;

  sub_1000B14E8((uint64_t)&unk_100698818, (uint64_t)v10);
}

- (void)triggerAllPrecomputationsWithCompletionHandler:(id)a3
{
}

- (void)triggerPrecomputationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)triggerPregenerationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)notifyCachesWereRemovedWithCompletionHandler:(id)a3
{
}

- (void)pausePrecomputationsWithCompletionHandler:(id)a3
{
}

- (void)resumePrecomputationsWithCompletionHandler:(id)a3
{
}

- (void)clearAllBindings
{
  id v2 = self;
  PrecomputationManager.clearAllBindings()();
}

- (void)captureWithBindings:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  PrecomputationManager.capture(bindings:)((Swift::OpaquePointer)v4);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  type metadata accessor for Logger();
  sub_100051B88();
  sub_10003F240();
  v3();
  sub_10002EB9C((uint64_t)self + OBJC_IVAR____TtC3asd21PrecomputationManager_analyticsManager);
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC3asd21PrecomputationManager_configurationManager;

  sub_10002EB9C((uint64_t)v4);
}

@end