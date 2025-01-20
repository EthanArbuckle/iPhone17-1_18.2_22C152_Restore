@interface BankConnectAccountCredentialsViewControllerProvider
+ (id)makeViewControllerWithAccountCredentials:(id)a3 title:(id)a4;
- (_TtC9PassKitUI51BankConnectAccountCredentialsViewControllerProvider)init;
@end

@implementation BankConnectAccountCredentialsViewControllerProvider

+ (id)makeViewControllerWithAccountCredentials:(id)a3 title:(id)a4
{
  sub_19F612AD0();
  unint64_t v4 = sub_1A03B4C58();
  uint64_t v5 = sub_1A03B4988();
  uint64_t v7 = v6;
  unint64_t v8 = sub_19F61223C(v4);
  sub_1A03AE138();
  sub_19F625DF4(v8, v5, v7, (uint64_t)v12);
  swift_bridgeObjectRelease();
  id v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94A28E8));
  v10 = (void *)sub_1A03B29C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC9PassKitUI51BankConnectAccountCredentialsViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAccountCredentialsViewControllerProvider();
  return [(BankConnectAccountCredentialsViewControllerProvider *)&v3 init];
}

@end