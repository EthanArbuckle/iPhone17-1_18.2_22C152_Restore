@interface AsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC13appleaccountd14AsyncOperation)init;
- (void)start;
@end

@implementation AsyncOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC13appleaccountd14AsyncOperation_state)
    && *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC13appleaccountd14AsyncOperation_state) == 1)
  {
    char v2 = 1;
  }
  else
  {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  return v2 & 1;
}

- (BOOL)isFinished
{
  char v2 = self;
  char v3 = sub_10002916C();

  return v3 & 1;
}

- (void)start
{
  char v2 = self;
  sub_1000292B8();
}

- (_TtC13appleaccountd14AsyncOperation)init
{
  result = (_TtC13appleaccountd14AsyncOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end