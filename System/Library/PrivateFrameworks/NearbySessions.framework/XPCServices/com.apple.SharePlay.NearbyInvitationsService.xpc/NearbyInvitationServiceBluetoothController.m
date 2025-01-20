@interface NearbyInvitationServiceBluetoothController
- (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController)init;
@end

@implementation NearbyInvitationServiceBluetoothController

- (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController)init
{
  return (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController *)NearbyInvitationServiceBluetoothController.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController_queue;
  uint64_t v3 = type metadata accessor for AsyncSerialQueue();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end