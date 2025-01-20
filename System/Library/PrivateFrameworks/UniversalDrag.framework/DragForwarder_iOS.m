@interface DragForwarder_iOS
- (_TtC13UniversalDrag17DragForwarder_iOS)init;
- (void)dragMonitorSession:(id)a3 didAcceptDropRequestWithItems:(id)a4;
- (void)dragMonitorSession:(id)a3 didConcludeDragNormally:(BOOL)a4;
- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4;
- (void)dragMonitorSession:(id)a3 didUpdateRegisteredItems:(id)a4;
@end

@implementation DragForwarder_iOS

- (_TtC13UniversalDrag17DragForwarder_iOS)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_260760550((uint64_t)self + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_delegate);
  swift_release();

  sub_26075EB08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_pasteboardCompletion));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_logger;
  sub_2607BD3B0();
  OUTLINED_FUNCTION_5_0();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);

  v6(v3, v4);
}

- (void)dragMonitorSession:(id)a3 didUpdateRegisteredItems:(id)a4
{
  sub_260760514(0, (unint64_t *)&unk_26A8A8F40);
  sub_2607BD5E0();

  swift_bridgeObjectRelease();
}

- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_260759A08();
}

- (void)dragMonitorSession:(id)a3 didAcceptDropRequestWithItems:(id)a4
{
  sub_260760514(0, (unint64_t *)&unk_26A8A8F40);
  unint64_t v6 = sub_2607BD5E0();
  id v7 = a3;
  v8 = self;
  sub_26075A0F8((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)dragMonitorSession:(id)a3 didConcludeDragNormally:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_26075A358((uint64_t)v7, a4);
}

@end