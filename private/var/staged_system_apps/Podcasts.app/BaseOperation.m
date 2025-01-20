@interface BaseOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (_TtC8Podcasts13BaseOperation)init;
- (void)addDependency:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation BaseOperation

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_errorRelease();
  swift_bridgeObjectRelease();
  sub_1000536BC(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation_onError);

  sub_1000536BC(v3);
}

- (BOOL)isReady
{
  v2 = self;
  char v3 = sub_10003B238();

  return v3 & 1;
}

- (BOOL)isFinished
{
  v2 = self;
  BOOL v3 = sub_10003B330();

  return v3;
}

- (BOOL)isExecuting
{
  v2 = self;
  BOOL v3 = sub_10003B3C4();

  return v3;
}

- (void)start
{
  v2 = self;
  sub_1000467F8();
}

- (_TtC8Podcasts13BaseOperation)init
{
  return (_TtC8Podcasts13BaseOperation *)sub_1000490A4();
}

- (void)setExecuting:(BOOL)a3
{
  BOOL v3 = self;
  sub_10004690C();
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = self;
  sub_10004A068();
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003FDD04(v4);
}

@end