@interface TapTestParameter
- (BOOL)managesTestStartAndEnd;
- (NSString)testName;
- (_TtC7Weather16TapTestParameter)init;
- (id)completionHandler;
- (id)composerBlock;
- (void)setTestName:(id)a3;
@end

@implementation TapTestParameter

- (NSString)testName
{
  sub_100B0EBE8();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setTestName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_100B0ECA4(v4, v6);
}

- (id)completionHandler
{
  uint64_t v2 = sub_100B0ED68();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10010A4D4;
    v6[3] = &unk_100E37A28;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)managesTestStartAndEnd
{
  return 0;
}

- (id)composerBlock
{
  sub_100B0EDB4();
  v5[4] = sub_100B0EFCC;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100B0EB30;
  v5[3] = &unk_100E379D8;
  uint64_t v3 = _Block_copy(v5);
  swift_release();

  return v3;
}

- (_TtC7Weather16TapTestParameter)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather16TapTestParameter_completionHandler);

  sub_1001361AC(v3);
}

@end