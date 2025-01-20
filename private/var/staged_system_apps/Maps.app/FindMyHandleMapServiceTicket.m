@interface FindMyHandleMapServiceTicket
- (BOOL)isCancelled;
- (_TtC4Maps28FindMyHandleMapServiceTicket)init;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
@end

@implementation FindMyHandleMapServiceTicket

- (BOOL)isCancelled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_isCancelled);
}

- (void)setCancelled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_isCancelled) = a3;
}

- (void)cancel
{
  v2 = self;
  sub_1001D9750();
}

- (_TtC4Maps28FindMyHandleMapServiceTicket)init
{
  result = (_TtC4Maps28FindMyHandleMapServiceTicket *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_handle;
  uint64_t v3 = type metadata accessor for Handle();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_unknownObjectRelease();
}

@end