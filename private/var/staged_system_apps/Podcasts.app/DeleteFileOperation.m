@interface DeleteFileOperation
- (_TtC8Podcasts19DeleteFileOperation)init;
@end

@implementation DeleteFileOperation

- (_TtC8Podcasts19DeleteFileOperation)init
{
  result = (_TtC8Podcasts19DeleteFileOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100050358(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_input]);

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19DeleteFileOperation_file;
  uint64_t v4 = type metadata accessor for URL();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end