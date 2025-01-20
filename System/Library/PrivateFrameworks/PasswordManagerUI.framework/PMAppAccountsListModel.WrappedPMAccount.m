@interface PMAppAccountsListModel.WrappedPMAccount
- (NSString)effectiveTitleForSorting;
- (_TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount)init;
- (void)setEffectiveTitleForSorting:(id)a3;
@end

@implementation PMAppAccountsListModel.WrappedPMAccount

- (NSString)effectiveTitleForSorting
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setEffectiveTitleForSorting:(id)a3
{
  uint64_t v4 = sub_258D6F498();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount_effectiveTitleForSorting);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount)init
{
  result = (_TtCC17PasswordManagerUI22PMAppAccountsListModel16WrappedPMAccount *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end