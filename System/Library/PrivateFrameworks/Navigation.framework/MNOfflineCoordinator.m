@interface MNOfflineCoordinator
- (MNNavigationSessionState)navigationSessionState;
- (_TtC10Navigation20MNOfflineCoordinator)init;
- (_TtC10Navigation20MNOfflineCoordinator)initWithNavigationSessionState:(id)a3;
- (_TtP10Navigation28MNOfflineCoordinatorDelegate_)delegate;
- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MNOfflineCoordinator

- (_TtC10Navigation20MNOfflineCoordinator)initWithNavigationSessionState:(id)a3
{
  return (_TtC10Navigation20MNOfflineCoordinator *)MNOfflineCoordinator.init(navigationSessionState:)(a3);
}

- (_TtP10Navigation28MNOfflineCoordinatorDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1BA99BA60](v2);
  return (_TtP10Navigation28MNOfflineCoordinatorDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)start
{
  v2 = self;
  sub_1B543A2F4();
}

- (_TtC10Navigation20MNOfflineCoordinator)init
{
  result = (_TtC10Navigation20MNOfflineCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B543D694((uint64_t)self + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
}

- (MNNavigationSessionState)navigationSessionState
{
  result = *(MNNavigationSessionState **)((char *)&self->super.isa
                                        + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (void)setNavigationSessionState:(id)a3
{
  v4 = a3;
  v5 = self;
  MNOfflineCoordinator.navigationSessionState.setter(v4);
}

- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4
{
  v4 = *(__CFString **)&a4.var0;
  id v6 = a3;
  v7 = self;
  sub_1B543D248(v4);
}

- (void)stop
{
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1B5531EA0();
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9D578F8);
  v1 = sub_1B5531E80();
  os_log_type_t v2 = sub_1B5531F90();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B542B000, v1, v2, "Releasing control of offline service state.", v3, 2u);
    MEMORY[0x1BA99BA00](v3, -1, -1);
  }

  id v4 = objc_msgSend(self, sel_shared);
  objc_msgSend(v4, sel_setDelegate_, 0);
  objc_msgSend(v4, sel_shutdownService);
}

@end