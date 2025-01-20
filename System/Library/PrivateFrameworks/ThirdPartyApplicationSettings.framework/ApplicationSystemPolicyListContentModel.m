@interface ApplicationSystemPolicyListContentModel
- (_TtC29ThirdPartyApplicationSettings39ApplicationSystemPolicyListContentModel)init;
- (void)reloadSpecifiers;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3;
@end

@implementation ApplicationSystemPolicyListContentModel

- (_TtC29ThirdPartyApplicationSettings39ApplicationSystemPolicyListContentModel)init
{
  result = (_TtC29ThirdPartyApplicationSettings39ApplicationSystemPolicyListContentModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC29ThirdPartyApplicationSettings39ApplicationSystemPolicyListContentModel____lazy_storage___systemSettingsSpecifiersProvider);
}

- (void)reloadSpecifiers
{
  sub_25F608068();
  v4[2] = self;
  v3 = self;
  sub_25F601F28((uint64_t)sub_25F60438C, (uint64_t)v4);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  sub_25F608068();
  v9[2] = a3;
  BOOL v10 = a4;
  id v7 = a3;
  v8 = self;
  sub_25F601F28((uint64_t)sub_25F60436C, (uint64_t)v9);
}

- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3
{
  sub_25F608068();
  v7[2] = self;
  id v5 = a3;
  v6 = self;
  sub_25F601F28((uint64_t)sub_25F604340, (uint64_t)v7);
}

- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  sub_25F608068();
  v12[2] = a4;
  BOOL v13 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_25F601F28((uint64_t)sub_25F604238, (uint64_t)v12);
}

@end