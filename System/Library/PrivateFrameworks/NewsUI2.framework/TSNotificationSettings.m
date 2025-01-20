@interface TSNotificationSettings
- (BOOL)badge;
- (BOOL)showBanners;
- (BOOL)showInNotificationCenter;
- (BOOL)showOnLockScreen;
- (BOOL)sound;
- (TSNotificationSettings)init;
- (TSNotificationSettings)initWithSystemSettings:(id)a3;
- (int)scheduledDeliverySetting;
- (int64_t)authorizationStatus;
@end

@implementation TSNotificationSettings

- (int64_t)authorizationStatus
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_authorizationStatus);
}

- (BOOL)sound
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_sound);
}

- (BOOL)badge
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_badge);
}

- (BOOL)showOnLockScreen
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showOnLockScreen);
}

- (BOOL)showInNotificationCenter
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showInNotificationCenter);
}

- (BOOL)showBanners
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showBanners);
}

- (int)scheduledDeliverySetting
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_scheduledDeliverySetting);
}

- (TSNotificationSettings)initWithSystemSettings:(id)a3
{
  id v3 = a3;
  v4 = (TSNotificationSettings *)sub_1DF9E16CC(v3);

  return v4;
}

- (TSNotificationSettings)init
{
  result = (TSNotificationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end