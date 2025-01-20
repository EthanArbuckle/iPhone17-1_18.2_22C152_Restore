@interface StickersDaemon
- (_TtC9stickersd14StickersDaemon)init;
- (void)runOn:(id)a3;
@end

@implementation StickersDaemon

- (void)runOn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000719C(v4);
}

- (_TtC9stickersd14StickersDaemon)init
{
  v2 = self;
  Logger.init(subsystem:category:)();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC9stickersd14StickersDaemon_services) = (Class)&_swiftEmptyArrayStorage;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for StickersDaemon();
  return [(StickersDaemon *)&v4 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9stickersd14StickersDaemon_logger;
  uint64_t v3 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end