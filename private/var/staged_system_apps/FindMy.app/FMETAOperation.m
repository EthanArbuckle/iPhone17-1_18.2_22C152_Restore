@interface FMETAOperation
- (BOOL)isAsynchronous;
- (BOOL)isFinished;
- (_TtC6FindMy14FMETAOperation)init;
- (void)main;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation FMETAOperation

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy14FMETAOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  [(FMETAOperation *)v4 willChangeValueForKey:v5];

  *((unsigned char *)&v4->super.super.isa + OBJC_IVAR____TtC6FindMy14FMETAOperation__isFinished) = a3;
  NSString v6 = String._bridgeToObjectiveC()();
  [(FMETAOperation *)v4 didChangeValueForKey:v6];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v2 = self;
  if ([(FMETAOperation *)v2 isCancelled])
  {
    if (qword_1006AE190 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_1000606BC(v3, (uint64_t)qword_1006D1E98);
    oslog = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      NSString v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "FMETAOperation: operation cancelled", v5, 2u);
      swift_slowDealloc();
    }

    NSString v6 = (_TtC6FindMy14FMETAOperation *)oslog;
  }
  else
  {
    NSString v6 = v2;
  }
}

- (void)start
{
  v2 = self;
  sub_100428464();
}

- (_TtC6FindMy14FMETAOperation)init
{
  result = (_TtC6FindMy14FMETAOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->request[OBJC_IVAR____TtC6FindMy14FMETAOperation_request + 8];

  swift_bridgeObjectRelease();

  swift_release();
}

@end