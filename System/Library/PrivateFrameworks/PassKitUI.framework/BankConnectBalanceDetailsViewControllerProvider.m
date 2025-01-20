@interface BankConnectBalanceDetailsViewControllerProvider
+ (id)makeViewControllerWithBankConnectItem:(id)a3;
- (_TtC9PassKitUI47BankConnectBalanceDetailsViewControllerProvider)init;
@end

@implementation BankConnectBalanceDetailsViewControllerProvider

+ (id)makeViewControllerWithBankConnectItem:(id)a3
{
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94A9AF8));
  id v5 = a3;
  v6 = (void *)sub_1A03B29C8();

  return v6;
}

- (_TtC9PassKitUI47BankConnectBalanceDetailsViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectBalanceDetailsViewControllerProvider();
  return [(BankConnectBalanceDetailsViewControllerProvider *)&v3 init];
}

@end