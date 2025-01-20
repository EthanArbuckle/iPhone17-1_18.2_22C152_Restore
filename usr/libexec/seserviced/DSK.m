@interface DSK
+ (OS_dispatch_queue)queue;
+ (_TtC10seserviced3DSK)shared;
+ (void)mandatoryInit;
- (_TtC10seserviced3DSK)init;
- (void)startWithModule:(int64_t)a3;
- (void)stop;
- (void)stopWithModule:(int64_t)a3;
@end

@implementation DSK

+ (_TtC10seserviced3DSK)shared
{
  return (_TtC10seserviced3DSK *)sub_1002B6BF8((uint64_t)a1, (uint64_t)a2, &qword_100453920, (void **)&qword_100468A30);
}

+ (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)sub_1002B6BF8((uint64_t)a1, (uint64_t)a2, &qword_100453928, (void **)&qword_100468A38);
}

- (_TtC10seserviced3DSK)init
{
  return (_TtC10seserviced3DSK *)sub_1002B6F28();
}

- (void)startWithModule:(int64_t)a3
{
  v4 = self;
  sub_1002B749C(a3);
}

- (void)stopWithModule:(int64_t)a3
{
  v4 = self;
  sub_1002B7BF0(a3);
}

- (void)stop
{
  v2 = self;
  sub_1002B830C();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10seserviced3DSK_logger;
  uint64_t v3 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)mandatoryInit
{
  uint64_t v0 = type metadata accessor for DispatchPredicate();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (uint64_t *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_100453928 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100468A38;
  void *v4 = qword_100468A38;
  uint64_t v6 = enum case for DispatchPredicate.onQueue(_:);
  v7 = *(void (**)(void *, uint64_t, uint64_t))(v1 + 104);
  v7(v4, enum case for DispatchPredicate.onQueue(_:), v0);
  id v8 = (id)v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)();
  v9 = *(void (**)(void *, uint64_t))(v1 + 8);
  v9(v4, v0);
  if ((v5 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v10 = qword_100468A38;
  void *v4 = qword_100468A38;
  v7(v4, v6, v0);
  id v11 = (id)v10;
  LOBYTE(v10) = _dispatchPreconditionTest(_:)();
  v9(v4, v0);
  if ((v10 & 1) == 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1001F7718();
  v12 = (void *)qword_100468A38;
  void *v4 = qword_100468A38;
  v7(v4, v6, v0);
  id v13 = v12;
  char v14 = _dispatchPreconditionTest(_:)();
  v9(v4, v0);
  if (v14)
  {
    sub_100089824();
    return;
  }
LABEL_9:
  __break(1u);
}

@end