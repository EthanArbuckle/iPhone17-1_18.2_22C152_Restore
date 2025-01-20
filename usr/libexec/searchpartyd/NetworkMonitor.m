@interface NetworkMonitor
- (_TtC12searchpartyd14NetworkMonitor)init;
@end

@implementation NetworkMonitor

- (_TtC12searchpartyd14NetworkMonitor)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_evaluator) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NetworkMonitor();
  return [(NetworkMonitor *)&v4 init];
}

- (void).cxx_destruct
{
  sub_1000A1534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock));

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue);
}

@end