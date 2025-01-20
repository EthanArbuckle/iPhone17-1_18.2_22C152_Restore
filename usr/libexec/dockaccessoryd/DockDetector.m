@interface DockDetector
- (_TtC14dockaccessoryd12DockDetector)init;
- (void)dealloc;
@end

@implementation DockDetector

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_hidManager);
  v3 = self;
  IOHIDManagerClose(v2, 0);
  v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisTimer);
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisTimer) = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for DockDetector(0);
  [(DockDetector *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_super v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_dockStatus;
  uint64_t v6 = type metadata accessor for DockStatus();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd12DockDetector_jarvisCallback);

  sub_1000BF118(v7);
}

- (_TtC14dockaccessoryd12DockDetector)init
{
  result = (_TtC14dockaccessoryd12DockDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end