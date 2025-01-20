@interface STOnBoardingConfiguration
- (BOOL)updateExistingSettings;
- (STOnBoardingConfigurationDelegate)delegate;
- (STOnBoardingConfigurationUser)user;
- (_TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration)init;
- (void)setDelegate:(id)a3;
@end

@implementation STOnBoardingConfiguration

- (STOnBoardingConfigurationUser)user
{
  return (STOnBoardingConfigurationUser *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_user));
}

- (BOOL)updateExistingSettings
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_updateExistingSettings);
}

- (STOnBoardingConfigurationDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x22A63CD40](v2);

  return (STOnBoardingConfigurationDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration)init
{
  result = (_TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI25STOnBoardingConfiguration_delegate;

  sub_225BFF3C0((uint64_t)v3);
}

@end