@interface MoveFileOperation
- (_TtC8Podcasts17MoveFileOperation)init;
@end

@implementation MoveFileOperation

- (_TtC8Podcasts17MoveFileOperation)init
{
  result = (_TtC8Podcasts17MoveFileOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100050358(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input]);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_destination;
  uint64_t v4 = type metadata accessor for URL();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_source, v4);
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts17MoveFileOperation_log);
}

@end