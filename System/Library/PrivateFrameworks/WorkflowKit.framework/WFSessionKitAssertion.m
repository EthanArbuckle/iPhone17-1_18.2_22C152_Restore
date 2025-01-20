@interface WFSessionKitAssertion
- (BOOL)takeWithError:(id *)a3;
- (WFSessionKitAssertion)init;
- (WFSessionKitAssertion)initWithBundleIdentifier:(id)a3;
- (WFSessionKitAssertion)initWithSessionIdentifier:(id)a3;
- (id)failureHandler;
- (id)resultHandler;
- (void)addCompletionHandlerIfRunning:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)setFailureHandler:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)startTimeoutTimer;
@end

@implementation WFSessionKitAssertion

- (id)resultHandler
{
  uint64_t v2 = SessionKitAssertion.resultHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1C8167234;
    v6[3] = &block_descriptor_48_0;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setResultHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1C816BCCC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  SessionKitAssertion.resultHandler.setter((uint64_t)v4, v5);
}

- (id)failureHandler
{
  uint64_t v2 = SessionKitAssertion.failureHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1C81678F0;
    v6[3] = &block_descriptor_28;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setFailureHandler:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1C816F400;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  SessionKitAssertion.failureHandler.setter((uint64_t)v4, v5);
}

- (WFSessionKitAssertion)initWithBundleIdentifier:(id)a3
{
  uint64_t v3 = sub_1C8532658();
  return (WFSessionKitAssertion *)SessionKitAssertion.init(bundleIdentifier:)(v3, v4);
}

- (WFSessionKitAssertion)initWithSessionIdentifier:(id)a3
{
  uint64_t v3 = sub_1C8532658();
  return (WFSessionKitAssertion *)SessionKitAssertion.init(sessionIdentifier:)(v3, v4);
}

- (BOOL)takeWithError:(id *)a3
{
  uint64_t v4 = self;
  SessionKitAssertion.take()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1C8530048();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (void)startTimeoutTimer
{
  uint64_t v2 = self;
  SessionKitAssertion.startTimeoutTimer()();
}

- (void)cancel
{
  uint64_t v2 = self;
  SessionKitAssertion.cancel()();
}

- (void)dealloc
{
  uint64_t v2 = self;
  SessionKitAssertion.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1C809C878(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSessionKitAssertion_resultHandler));
  sub_1C809C878(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSessionKitAssertion_failureHandler));
  sub_1C816B814();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (WFSessionKitAssertion)init
{
}

- (void)addCompletionHandlerIfRunning:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1C816A4D8((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

@end