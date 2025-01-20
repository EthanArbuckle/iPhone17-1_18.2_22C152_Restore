@interface StartJobPipelinesOperation
- (_TtC8Podcasts26StartJobPipelinesOperation)init;
@end

@implementation StartJobPipelinesOperation

- (_TtC8Podcasts26StartJobPipelinesOperation)init
{
  result = (_TtC8Podcasts26StartJobPipelinesOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts26StartJobPipelinesOperation_serialQueue));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Podcasts26StartJobPipelinesOperation_beforeTakeOff));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts26StartJobPipelinesOperation_input);
  char v4 = self->super.lock[OBJC_IVAR____TtC8Podcasts26StartJobPipelinesOperation_input];

  sub_10004B094(v3, v4);
}

@end