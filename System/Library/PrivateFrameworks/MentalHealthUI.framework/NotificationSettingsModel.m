@interface NotificationSettingsModel
- (_TtC14MentalHealthUI25NotificationSettingsModel)init;
- (void)dealloc;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
- (void)updateNotificationAuthorizationStatus;
@end

@implementation NotificationSettingsModel

- (_TtC14MentalHealthUI25NotificationSettingsModel)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F55050]), sel_init);
  sub_256177EE8();
  id v4 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  v5 = (void *)sub_256177EA8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  id v7 = objc_allocWithZone(ObjectType);
  v8 = NotificationSettingsModel.init(settingsManager:userNotificationCenter:)(v3, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC14MentalHealthUI25NotificationSettingsModel *)v8;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(NotificationSettingsModel *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_settingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_userNotificationCenter));
  id v3 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel__areNotificationsDisabled;
  sub_255FB5A58(0, &qword_26B2AD268, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)updateNotificationAuthorizationStatus
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_userNotificationCenter);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_notificationSettings);
  objc_msgSend(v4, sel_authorizationStatus);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_256175C98();
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  swift_getObjectType();
  sub_255FB30BC();
  id v5 = a3;
  id v6 = self;
  sub_256175C08();
  sub_256175C28();

  swift_release();
}

@end