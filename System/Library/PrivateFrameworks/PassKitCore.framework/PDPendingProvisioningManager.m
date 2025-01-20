@interface PDPendingProvisioningManager
- (BOOL)hasPendingProvisioningsOfTypes:(id)a3;
- (BOOL)isTrackingProvisioningOfPass:(id)a3;
- (BOOL)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 success:(BOOL)a5;
- (PDPendingProvisioningManager)init;
- (PDPendingProvisioningManager)initWithDatabaseManager:(id)a3 applicationMessageManager:(id)a4 webServiceCoordinator:(id)a5 carKeyRequirementsChecker:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 notificationStreamManager:(id)a8 cloudStoreCoordinator:(id)a9 sharingChannelManager:(id)a10 notificationManager:(id)a11;
- (PDPendingProvisioningManagerDelegate)delegate;
- (id)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4;
- (id)retrievePendingProvisioningsOfType:(id)a3;
- (void)passAddedOrUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)storePendingProvisioning:(id)a3;
@end

@implementation PDPendingProvisioningManager

- (BOOL)hasPendingProvisioningsOfTypes:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  v5 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  LOBYTE(v4) = [v4 hasPendingProvisioningsOfTypes:isa];

  swift_bridgeObjectRelease();
  return (char)v4;
}

- (PDPendingProvisioningManagerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (PDPendingProvisioningManagerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (PDPendingProvisioningManager)init
{
}

- (PDPendingProvisioningManager)initWithDatabaseManager:(id)a3 applicationMessageManager:(id)a4 webServiceCoordinator:(id)a5 carKeyRequirementsChecker:(id)a6 peerPaymentWebServiceCoordinator:(id)a7 notificationStreamManager:(id)a8 cloudStoreCoordinator:(id)a9 sharingChannelManager:(id)a10 notificationManager:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  swift_unknownObjectRetain();
  return (PDPendingProvisioningManager *)sub_1004D0B2C(v16, v17, v18, v19, v20, v21, (uint64_t)a9, a10, a11);
}

- (void)storePendingProvisioning:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004D1A7C(v4);
}

- (id)retrievePendingProvisioningsOfType:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_1004D295C(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_1004DE1C0(0, &qword_100807D88);
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  return v9.super.isa;
}

- (id)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  uint64_t v6 = self;
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v5 pendingProvisioningOfType:v7 withUniqueIdentifier:v8];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 success:(BOOL)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_databaseManager);
  NSString v8 = self;
  NSString v9 = String._bridgeToObjectiveC()();
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v7 pendingProvisioningOfType:v9 withUniqueIdentifier:v10];

  if (v11)
  {
    sub_1004D2BB0(v11, a5);
    char v13 = v12;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v13 = 0;
  }
  return v13 & 1;
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004D33D8(v4);
}

- (BOOL)isTrackingProvisioningOfPass:(id)a3
{
  v3 = self;
  id v4 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___PDPendingProvisioningManager_taskLock) + 16);
  id v5 = a3;
  uint64_t v6 = v3;
  os_unfair_lock_lock(v4);
  sub_1004D3E94((uint64_t)v6, v5, &v8);
  LOBYTE(v3) = v8;
  os_unfair_lock_unlock(v4);

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PDPendingProvisioningManager_peerPaymentWebServiceCoordinator));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PDPendingProvisioningManager_pendingProvisioningMessageManager));
  sub_1004DE198((uint64_t)self + OBJC_IVAR___PDPendingProvisioningManager_delegate);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

@end