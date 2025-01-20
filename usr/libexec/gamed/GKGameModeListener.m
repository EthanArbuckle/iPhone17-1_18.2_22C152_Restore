@interface GKGameModeListener
- (_TtC14GameDaemonCore18GKGameModeListener)init;
- (_TtC14GameDaemonCore18GKGameModeListener)initWithHandler:(id)a3;
- (void)dealloc;
@end

@implementation GKGameModeListener

- (_TtC14GameDaemonCore18GKGameModeListener)initWithHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC14GameDaemonCore18GKGameModeListener *)GKGameModeListener.init(handler:)((uint64_t)sub_1001E0880, v4);
}

- (void)dealloc
{
  v2 = self;
  GKGameModeListener.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14GameDaemonCore18GKGameModeListener_gameModeNotificationQueue);
}

- (_TtC14GameDaemonCore18GKGameModeListener)init
{
}

@end