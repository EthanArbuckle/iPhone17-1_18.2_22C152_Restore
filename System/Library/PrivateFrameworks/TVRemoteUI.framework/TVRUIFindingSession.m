@interface TVRUIFindingSession
- (BOOL)isFindingSessionActive;
- (TVRUIFindingSession)init;
- (id)startFindingSessionForDevice:(id)a3 dismissedHandler:(id)a4;
- (void)stopFindingSession;
@end

@implementation TVRUIFindingSession

- (BOOL)isFindingSessionActive
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingVC);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_isBeingPresented);
  }
  return (char)v2;
}

- (id)startFindingSessionForDevice:(id)a3 dismissedHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = TVRUIFindingSession.start(for:dismissedHandler:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v7);
  swift_unknownObjectRelease();

  swift_release();
  return v9;
}

- (void)stopFindingSession
{
  v2 = self;
  TVRUIFindingSession.stop()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (TVRUIFindingSession)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingVC) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingSessionPresentationController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_device) = 0;
  v3.receiver = self;
  v3.super_class = (Class)TVRUIFindingSession;
  return [(TVRUIFindingSession *)&v3 init];
}

@end