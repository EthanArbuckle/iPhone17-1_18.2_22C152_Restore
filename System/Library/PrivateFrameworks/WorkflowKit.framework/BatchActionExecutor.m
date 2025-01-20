@interface BatchActionExecutor
- (_TtC11WorkflowKit19BatchActionExecutor)init;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation BatchActionExecutor

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C8149714((uint64_t)v6, (uint64_t)v7);
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C814979C((uint64_t)v6, (uint64_t)v7);
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C8149824((uint64_t)v6, (uint64_t)v7);
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = a5;
  sub_1C8149934((uint64_t)v10, a4, a5);
}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1C8149F00((uint64_t)v8, (uint64_t)sub_1C814A864, v7);

  swift_release();
}

- (_TtC11WorkflowKit19BatchActionExecutor)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  sub_1C7F782F8((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit19BatchActionExecutor_provider);
  v3 = (char *)self + OBJC_IVAR____TtC11WorkflowKit19BatchActionExecutor_continuation;
  sub_1C814A504((uint64_t)v3);
}

@end