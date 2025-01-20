@interface RPWirelessPairingSession_Internal
- (BOOL)invalidated;
- (RPWirelessPairingSession_Internal)init;
- (void)dealloc;
- (void)endSession;
- (void)registerInvalidationHandlerWithInvokingOnQueue:(id)a3 handler:(id)a4;
@end

@implementation RPWirelessPairingSession_Internal

- (BOOL)invalidated
{
  v2 = self;
  BOOL v3 = sub_1D75AD6D4();

  return v3;
}

- (void)endSession
{
  v2 = self;
  sub_1D75AD858();
}

- (void)registerInvalidationHandlerWithInvokingOnQueue:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1D75AD938(v8, (uint64_t)sub_1D75AB824, v7);

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  WirelessPairingSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___RPWirelessPairingSession_Internal__state);
  sub_1D75AD76C(v3);
}

- (RPWirelessPairingSession_Internal)init
{
}

@end