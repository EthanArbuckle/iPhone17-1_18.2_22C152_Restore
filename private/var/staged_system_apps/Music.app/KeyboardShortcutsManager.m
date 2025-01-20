@interface KeyboardShortcutsManager
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (NSArray)keyCommands;
- (_TtC5Music24KeyboardShortcutsManager)init;
- (void)find:(id)a3;
- (void)newPlaylistAction:(id)a3;
- (void)nextTrackAction:(id)a3;
- (void)playPauseAction:;
- (void)previousTrackAction:(id)a3;
- (void)volumeDownAction:(id)a3;
- (void)volumeKeyUpAction:(id)a3;
- (void)volumeUpAction:(id)a3;
@end

@implementation KeyboardShortcutsManager

- (NSArray)keyCommands
{
  v2 = self;
  sub_100508A7C();

  sub_1003BB35C();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = sub_1005091CC((uint64_t)a3, (uint64_t)v10);

  sub_10005DDF8((uint64_t)v10);
  return v8 & 1;
}

- (void)find:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1005094F0();

  sub_10005DDF8((uint64_t)v6);
}

- (void)newPlaylistAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100509FB0();
}

- (void)volumeUpAction:(id)a3
{
}

- (void)volumeDownAction:(id)a3
{
}

- (void)volumeKeyUpAction:(id)a3
{
}

- (void)nextTrackAction:(id)a3
{
}

- (void)previousTrackAction:(id)a3
{
}

- (_TtC5Music24KeyboardShortcutsManager)init
{
  result = (_TtC5Music24KeyboardShortcutsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)playPauseAction:
{
  uint64_t v0 = sub_100063814(&qword_10109BA40);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_101097EA8 != -1) {
    swift_once();
  }
  NSArray v3 = (void *)(*(uint64_t (**)(void))(*(void *)qword_101129410 + 432))();
  if (!v3 || (id v4 = v3, v5 = [v3 state], v4, v5 != (id)5))
  {
    uint64_t v6 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
    type metadata accessor for MainActor();
    uint64_t v7 = static MainActor.shared.getter();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    *(void *)(v8 + 24) = &protocol witness table for MainActor;
    sub_100194A54((uint64_t)v2, (uint64_t)&unk_1010AD7B0, v8);
    swift_release();
  }
}

@end