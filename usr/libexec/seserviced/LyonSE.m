@interface LyonSE
+ (_TtC10seserviced6LyonSE)shared;
- (_TtC10seserviced6LyonSE)init;
@end

@implementation LyonSE

+ (_TtC10seserviced6LyonSE)shared
{
  if (qword_100453658 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100468500;

  return (_TtC10seserviced6LyonSE *)v2;
}

- (_TtC10seserviced6LyonSE)init
{
  return (_TtC10seserviced6LyonSE *)sub_10006DAAC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced6LyonSE_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100075868(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6LyonSE_cachedInitiateAccessProtocolData), *(void *)&self->cachedInitiateAccessProtocolData[OBJC_IVAR____TtC10seserviced6LyonSE_cachedInitiateAccessProtocolData]);

  swift_release();
}

@end