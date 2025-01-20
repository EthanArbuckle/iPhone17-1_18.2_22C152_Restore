@interface iCloudCalendarUnifiedSettingsProvider
- (iCloudCalendarUnifiedSettingsProvider)init;
- (iCloudCalendarUnifiedSettingsProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (iCloudCalendarUnifiedSettingsProvider)initWithPresenter:(id)a3;
- (id)accountsForAccountManager:(id)a3;
- (void)navigateToiCloudCalendarSettings;
- (void)navigateToiCloudCalendarSettingsWith:(id)a3;
@end

@implementation iCloudCalendarUnifiedSettingsProvider

- (iCloudCalendarUnifiedSettingsProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  return (iCloudCalendarUnifiedSettingsProvider *)iCloudCalendarUnifiedSettingsProvider.init(accountManager:presenter:)(a3, a4);
}

- (iCloudCalendarUnifiedSettingsProvider)initWithPresenter:(id)a3
{
  return (iCloudCalendarUnifiedSettingsProvider *)iCloudCalendarUnifiedSettingsProvider.init(presenter:)(a3);
}

- (void)navigateToiCloudCalendarSettings
{
  v2 = self;
  sub_26293C3A0(0, 0);
}

- (void)navigateToiCloudCalendarSettingsWith:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_26293E9B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_26293C3A0(v4, v6);

  swift_bridgeObjectRelease();
}

- (iCloudCalendarUnifiedSettingsProvider)init
{
  result = (iCloudCalendarUnifiedSettingsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___iCloudCalendarUnifiedSettingsProvider____lazy_storage___serviceOwnersManager);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s29iCloudCalendarUnifiedSettings01iabcD8ProviderC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0();

  type metadata accessor for AIDAServiceType();
  sub_26293E6D0();
  sub_26293E904(&qword_26A97F700);
  uint64_t v6 = (void *)sub_26293E978();
  swift_bridgeObjectRelease();
  return v6;
}

@end