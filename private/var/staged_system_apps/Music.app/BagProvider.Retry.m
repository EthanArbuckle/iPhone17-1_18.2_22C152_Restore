@interface BagProvider.Retry
- (_TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry)init;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
@end

@implementation BagProvider.Retry

- (_TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry)init
{
  swift_weakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_bindings) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BagProvider.Retry();
  return [(BagProvider.Retry *)&v4 init];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if (swift_weakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    sub_100044C44(0);

    swift_release();
  }
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  swift_bridgeObjectRelease();
}

@end