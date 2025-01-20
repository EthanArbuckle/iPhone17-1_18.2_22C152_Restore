@interface STUsageDetailsSelection
+ (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)shared;
- (NSNumber)usageReportTypeForLocalUser;
- (NSString)deviceIdentifierForLocalUser;
- (NSUserDefaults)userDefaults;
- (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)init;
- (id)deviceIdentifierForChildUserDSID:(id)a3;
- (id)observeDeviceIdentifierChangesForChildUserDSID:(id)a3 onChange:(id)a4;
- (id)usageReportTypeForChildUserDSID:(id)a3;
- (void)setDeviceIdentifierForLocalUser:(id)a3;
- (void)setDeviceIdentifierTo:(id)a3 forChildUserDSID:(id)a4;
- (void)setUsageReportTypeForLocalUser:(id)a3;
- (void)setUsageReportTypeTo:(id)a3 forChildUserDSID:(id)a4;
@end

@implementation STUsageDetailsSelection

+ (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)shared
{
  if (qword_268116370 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268116A40;

  return (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *)v2;
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults));
}

- (NSString)deviceIdentifierForLocalUser
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
  v3 = self;
  v4 = (void *)sub_225C08400();
  id v5 = objc_msgSend(v2, sel_stringForKey_, v4);

  if (v5)
  {
    sub_225C08420();

    v6 = (void *)sub_225C08400();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setDeviceIdentifierForLocalUser:(id)a3
{
  if (a3)
  {
    sub_225C08420();
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
    id v5 = self;
    uint64_t v6 = sub_225C08400();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
    v7 = self;
    uint64_t v6 = 0;
  }
  id v8 = (id)sub_225C08400();
  objc_msgSend(v4, sel_setObject_forKey_, v6, v8);

  swift_unknownObjectRelease();
}

- (NSNumber)usageReportTypeForLocalUser
{
  v2 = self;
  v3 = (void *)sub_225BDC2D0();

  return (NSNumber *)v3;
}

- (void)setUsageReportTypeForLocalUser:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = (id)sub_225C08400();
  objc_msgSend(v4, sel_setObject_forKey_, v5, v7);
}

- (id)deviceIdentifierForChildUserDSID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_225BDC74C(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    id v8 = (void *)sub_225C08400();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setDeviceIdentifierTo:(id)a3 forChildUserDSID:(id)a4
{
  if (a3)
  {
    uint64_t v6 = sub_225C08420();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a4;
  v10 = self;
  sub_225BDC9F0(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (id)observeDeviceIdentifierChangesForChildUserDSID:(id)a3 onChange:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  id v10 = sub_225BDCD60(v8, (uint64_t)sub_225BDEF78, v7);

  swift_release();

  return v10;
}

- (id)usageReportTypeForChildUserDSID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)sub_225BDD994(v4);

  return v6;
}

- (void)setUsageReportTypeTo:(id)a3 forChildUserDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_225BDDBEC(a3, v8);
}

- (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection)init
{
  result = (_TtC20ScreenTimeSettingsUI23STUsageDetailsSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_logger;
  uint64_t v4 = sub_225C07AF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection_userDefaults));
  swift_unknownObjectRelease();
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ScreenTimeSettingsUI23STUsageDetailsSelection____lazy_storage___localUserDSID);

  sub_225BDEF80(v5);
}

@end