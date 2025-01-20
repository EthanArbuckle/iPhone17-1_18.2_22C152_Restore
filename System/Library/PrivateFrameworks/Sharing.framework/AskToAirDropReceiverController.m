@interface AskToAirDropReceiverController
- (BOOL)hasPendingOrActiveConnections;
- (BOOL)hasSeenPrivacyPrompt;
- (BOOL)isLegacyMode;
- (BOOL)isNearbyDeviceClose;
- (NSArray)connectedNearbyDeviceNames;
- (NSString)nearbyDevicesDisplayName;
- (NSString)sharingName;
- (OS_dispatch_queue)queue;
- (_TtC7Sharing30AskToAirDropReceiverController)init;
- (_TtC7Sharing30AskToAirDropReceiverController)initWithQueue:(id)a3;
- (id)connectionStateChangedHandler;
- (id)errorHandler;
- (id)nearbyDeviceCloseChangedHandler;
- (id)pendingOrActiveConnectionsChangedHandler;
- (id)stateChangedHandler;
- (int64_t)connectionState;
- (void)connectToAllNearbyDevices;
- (void)disconnectFromAllNearbyDevices;
- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3;
- (void)fetchSharingNameWithCompletion:(id)a3;
- (void)setConnectedNearbyDeviceNames:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setConnectionStateChangedHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHasPendingOrActiveConnections:(BOOL)a3;
- (void)setHasSeenPrivacyPrompt:(BOOL)a3;
- (void)setIsLegacyMode:(BOOL)a3;
- (void)setIsNearbyDeviceClose:(BOOL)a3;
- (void)setNearbyDeviceCloseChangedHandler:(id)a3;
- (void)setNearbyDevicesDisplayName:(id)a3;
- (void)setPendingOrActiveConnectionsChangedHandler:(id)a3;
- (void)setSharingName:(id)a3;
- (void)setStateChangedHandler:(id)a3;
@end

@implementation AskToAirDropReceiverController

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_queue));
}

- (BOOL)isNearbyDeviceClose
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isNearbyDeviceClose;
  swift_beginAccess();
  return *v2;
}

- (void)setIsNearbyDeviceClose:(BOOL)a3
{
}

- (BOOL)hasPendingOrActiveConnections
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_hasPendingOrActiveConnections;
  swift_beginAccess();
  return *v2;
}

- (void)setHasPendingOrActiveConnections:(BOOL)a3
{
}

- (BOOL)isLegacyMode
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isLegacyMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLegacyMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_isLegacyMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)nearbyDevicesDisplayName
{
  return (NSString *)sub_1A5610220();
}

- (void)setNearbyDevicesDisplayName:(id)a3
{
}

- (int64_t)connectionState
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionState);
  swift_beginAccess();
  return *v2;
}

- (void)setConnectionState:(int64_t)a3
{
  v4 = self;
  sub_1A560E80C(a3);
}

- (id)stateChangedHandler
{
  return sub_1A560F13C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler, (uint64_t)&block_descriptor_109);
}

- (void)setStateChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A55DC6A4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (id)connectionStateChangedHandler
{
  return sub_1A560F13C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler, (uint64_t)&block_descriptor_102);
}

- (void)setConnectionStateChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A55DC6A4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (id)pendingOrActiveConnectionsChangedHandler
{
  return sub_1A560F13C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler, (uint64_t)&block_descriptor_95);
}

- (void)setPendingOrActiveConnectionsChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A55DC6A4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (id)nearbyDeviceCloseChangedHandler
{
  return sub_1A560F13C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler, (uint64_t)&block_descriptor_88);
}

- (void)setNearbyDeviceCloseChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A55DBDF0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (id)errorHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A560F61C;
    aBlock[3] = &block_descriptor_82;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setErrorHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A56142C4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A54F5EA8(v7);
}

- (BOOL)hasSeenPrivacyPrompt
{
  return sub_1A560F998(self);
}

- (void)setHasSeenPrivacyPrompt:(BOOL)a3
{
}

- (NSArray)connectedNearbyDeviceNames
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A56D5348();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setConnectedNearbyDeviceNames:(id)a3
{
  uint64_t v4 = sub_1A56D5358();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectedNearbyDeviceNames);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)sharingName
{
  return (NSString *)sub_1A5610220();
}

- (void)setSharingName:(id)a3
{
}

- (_TtC7Sharing30AskToAirDropReceiverController)init
{
}

- (_TtC7Sharing30AskToAirDropReceiverController)initWithQueue:(id)a3
{
  return (_TtC7Sharing30AskToAirDropReceiverController *)AskToAirDropReceiverController.init(queue:)(a3);
}

- (void)connectToAllNearbyDevices
{
  v2 = self;
  AskToAirDropReceiverController.connectToAllNearbyDevices()();
}

- (void)disconnectFromAllNearbyDevices
{
  v2 = self;
  AskToAirDropReceiverController.disconnectFromAllNearbyDevices()();
}

- (void)fetchPrivacyPromptInformationWithCompletion:(id)a3
{
}

- (void)fetchSharingNameWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_stateChangedHandler));
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_connectionStateChangedHandler));
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_pendingOrActiveConnectionsChangedHandler));
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_nearbyDeviceCloseChangedHandler));
  sub_1A54F5EA8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing30AskToAirDropReceiverController_errorHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end