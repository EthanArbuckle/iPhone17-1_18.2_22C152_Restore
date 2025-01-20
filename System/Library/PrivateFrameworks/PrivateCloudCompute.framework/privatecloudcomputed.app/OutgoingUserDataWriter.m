@interface OutgoingUserDataWriter
- (_TtC20privatecloudcomputed22OutgoingUserDataWriter)init;
@end

@implementation OutgoingUserDataWriter

- (_TtC20privatecloudcomputed22OutgoingUserDataWriter)init
{
  return (_TtC20privatecloudcomputed22OutgoingUserDataWriter *)sub_1000F55C0();
}

- (void).cxx_destruct
{
  sub_100010360((uint64_t)self + OBJC_IVAR____TtC20privatecloudcomputed22OutgoingUserDataWriter_stateLock, &qword_10020D428);
  v3 = (char *)self + OBJC_IVAR____TtC20privatecloudcomputed22OutgoingUserDataWriter_waiterIDGenerator;
  uint64_t v4 = sub_100003918(&qword_10020D430);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end