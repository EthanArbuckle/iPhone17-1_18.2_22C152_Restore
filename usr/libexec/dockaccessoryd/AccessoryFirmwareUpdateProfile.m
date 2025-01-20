@interface AccessoryFirmwareUpdateProfile
- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile)init;
@end

@implementation AccessoryFirmwareUpdateProfile

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile)init
{
  return (_TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile *)sub_10013927C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_stagingNotReadyReasons));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_updateNotReadyReasons));
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end