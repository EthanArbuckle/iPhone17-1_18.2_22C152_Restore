@interface TestServer
- (NSString)description;
- (_TtC12SidecarRelay10TestServer)init;
- (void)activateWithCompletion:(id)a3;
@end

@implementation TestServer

- (NSString)description
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)activateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1000138A4;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_10005C650((uint64_t)v7, v6, (uint64_t)&unk_100097CD0, (uint64_t)sub_10005DC10, (uint64_t)&unk_100097CE8);
  sub_100012A1C((uint64_t)v7);
}

- (_TtC12SidecarRelay10TestServer)init
{
  return (_TtC12SidecarRelay10TestServer *)sub_10005C95C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end