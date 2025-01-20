@interface SUIAnimationKitPrototypeSettings
+ (id)settingsControllerModule;
- (SUIAShockwavePrototypeSettings)shockwaveSettings;
- (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings)scanwaveSettings;
- (void)setDefaultValues;
- (void)setScanwaveSettings:(id)a3;
- (void)setShockwaveSettings:(id)a3;
@end

@implementation SUIAnimationKitPrototypeSettings

- (SUIAShockwavePrototypeSettings)shockwaveSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  return (SUIAShockwavePrototypeSettings *)*v2;
}

- (void)setShockwaveSettings:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings)scanwaveSettings
{
  return (_TtC20SystemUIAnimationKit25ScanwavePrototypeSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_scanwaveSettings);
}

- (void)setScanwaveSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_scanwaveSettings);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_scanwaveSettings) = (Class)a3;
  id v3 = a3;
}

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SUIAnimationKitPrototypeSettings;
  v2 = self;
  [(PTSettings *)&v4 setDefaultValues];
  id v3 = [(SUIAnimationKitPrototypeSettings *)v2 shockwaveSettings];
  [(SUIAShockwavePrototypeSettings *)v3 setDefaultValues];

  objc_msgSend(*(id *)((char *)&v2->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_scanwaveSettings), sel_setDefaultValues);
}

+ (id)settingsControllerModule
{
  _sSo32SUIAnimationKitPrototypeSettingsC017SystemUIAnimationB0E24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SUIAnimationKitPrototypeSettings_scanwaveSettings);
}

@end