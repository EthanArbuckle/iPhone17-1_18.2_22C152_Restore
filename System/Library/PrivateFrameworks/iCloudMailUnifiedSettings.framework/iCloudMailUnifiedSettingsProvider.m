@interface iCloudMailUnifiedSettingsProvider
- (iCloudMailUnifiedSettingsProvider)init;
- (iCloudMailUnifiedSettingsProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (iCloudMailUnifiedSettingsProvider)initWithPresenter:(id)a3;
- (id)accountsForAccountManager:(id)a3;
- (void)navigateToiCloudMailSettings;
- (void)navigateToiCloudMailSettingsWith:(id)a3;
@end

@implementation iCloudMailUnifiedSettingsProvider

- (iCloudMailUnifiedSettingsProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  return (iCloudMailUnifiedSettingsProvider *)iCloudMailUnifiedSettingsProvider.init(accountManager:presenter:)(a3, a4);
}

- (iCloudMailUnifiedSettingsProvider)initWithPresenter:(id)a3
{
  return (iCloudMailUnifiedSettingsProvider *)iCloudMailUnifiedSettingsProvider.init(presenter:)(a3);
}

- (void)navigateToiCloudMailSettings
{
  v2 = self;
  sub_26298F3E8(0, 0);
}

- (void)navigateToiCloudMailSettingsWith:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_262991A08();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_26298F3E8(v4, v6);

  swift_bridgeObjectRelease();
}

- (iCloudMailUnifiedSettingsProvider)init
{
  result = (iCloudMailUnifiedSettingsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___iCloudMailUnifiedSettingsProvider____lazy_storage___serviceOwnersManager);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s25iCloudMailUnifiedSettings01iabcD8ProviderC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0();

  type metadata accessor for AIDAServiceType();
  sub_262991720();
  sub_262991954(&qword_26A983850);
  uint64_t v6 = (void *)sub_2629919C8();
  swift_bridgeObjectRelease();

  return v6;
}

@end