@interface DragSurrogate_iOS
- (_TtC13UniversalDrag17DragSurrogate_iOS)init;
- (void)dragRelaySession:(id)a3 didEndDragWithDrop:(BOOL)a4;
- (void)dragRelaySession:(id)a3 didUpdateDragPresentation:(id)a4;
- (void)dragRelaySessionDidBegin:(id)a3;
- (void)dragRelaySessionDidEndDataTransfer:(id)a3;
- (void)dragRelaySessionDidFail:(id)a3;
@end

@implementation DragSurrogate_iOS

- (_TtC13UniversalDrag17DragSurrogate_iOS)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13UniversalDrag17DragSurrogate_iOS_logger;
  sub_2607BD3B0();
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_release();
  swift_unownedRelease();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)dragRelaySessionDidBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26075BD18();
}

- (void)dragRelaySession:(id)a3 didEndDragWithDrop:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_26075BE14((uint64_t)v7, a4);
}

- (void)dragRelaySessionDidFail:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26075C3D4();
}

- (void)dragRelaySessionDidEndDataTransfer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26075C5A0();
}

- (void)dragRelaySession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6 = a3;
  v7 = (_UNKNOWN **)a4;
  v8 = self;
  sub_26075C77C((uint64_t)v8, v7);
}

@end