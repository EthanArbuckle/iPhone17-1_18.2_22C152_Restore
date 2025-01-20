@interface PUIFMLDevice
- (BOOL)isThisDevice;
- (NSString)deviceName;
- (_TtC17PrivacySettingsUI12PUIFMLDevice)init;
@end

@implementation PUIFMLDevice

- (NSString)deviceName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E4B3E7F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isThisDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17PrivacySettingsUI12PUIFMLDevice_isThisDevice);
}

- (_TtC17PrivacySettingsUI12PUIFMLDevice)init
{
  result = (_TtC17PrivacySettingsUI12PUIFMLDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end