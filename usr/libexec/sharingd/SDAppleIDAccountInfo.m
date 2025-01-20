@interface SDAppleIDAccountInfo
- (NSDictionary)personInfo;
- (SFAppleIDAccount)account;
- (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo)init;
- (void)setAccount:(id)a3;
@end

@implementation SDAppleIDAccountInfo

- (SFAppleIDAccount)account
{
  return (SFAppleIDAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account));
}

- (void)setAccount:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)personInfo
{
  sub_10000B740(0, &qword_1009749D8);
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo)init
{
  result = (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end