@interface WiFiObserver
- (_TtC13SeymourClient12WiFiObserver)init;
- (void)dealloc;
@end

@implementation WiFiObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient12WiFiObserver_wifiInterface);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for WiFiObserver();
  [(WiFiObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1D59586BC((uint64_t)self + OBJC_IVAR____TtC13SeymourClient12WiFiObserver_delegate);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient12WiFiObserver_queue);
}

- (_TtC13SeymourClient12WiFiObserver)init
{
  result = (_TtC13SeymourClient12WiFiObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end