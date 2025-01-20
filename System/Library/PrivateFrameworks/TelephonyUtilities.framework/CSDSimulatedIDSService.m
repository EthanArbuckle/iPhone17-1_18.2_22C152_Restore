@interface CSDSimulatedIDSService
+ (CSDSimulatedIDSService)sharedInstance;
- (BOOL)defaultPairedDeviceExists;
- (BOOL)hasActiveAccounts;
- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3;
- (BOOL)pairedDeviceExists;
- (BOOL)relayCapableDeviceExists;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)telephonyCapableDeviceExists;
- (CSDIDSServiceDependencies)service;
- (CSDSimulatedIDSService)init;
- (IDSAccount)account;
- (IDSDevice)defaultPairedDevice;
- (IDSDevice)pairedDevice;
- (NSArray)allAliases;
- (NSArray)devices;
- (NSSet)aliases;
- (NSSet)availableOutgoingRelayCallerIDs;
- (NSString)callerID;
- (NSString)countryCode;
- (NSString)localDeviceUniqueID;
- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4;
- (id)deviceWithUniqueID:(id)a3;
- (id)devicesWithCapability:(id)a3;
- (id)pseudonymForPseudonymURI:(id)a3;
- (void)addFirewallEntriesForHandleToDate:(id)a3;
- (void)addFirewallEntriesForHandles:(id)a3 lastSeenDate:(id)a4;
- (void)addFirewallEntryForHandle:(id)a3 lastSeenDate:(id)a4;
- (void)addServiceDelegate:(id)a3 queue:(id)a4;
- (void)noteApprovedHandle:(void *)a3 completionHandle:(void *)aBlock;
- (void)removeFirewallEntries:(id)a3;
- (void)removeServiceDelegate:(id)a3;
- (void)setAccount:(id)a3;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5;
- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7;
@end

@implementation CSDSimulatedIDSService

+ (CSDSimulatedIDSService)sharedInstance
{
  id v2 = sub_100305BE8();

  return (CSDSimulatedIDSService *)v2;
}

- (CSDSimulatedIDSService)init
{
  return (CSDSimulatedIDSService *)sub_100305C6C();
}

- (CSDIDSServiceDependencies)service
{
  sub_100307488();

  return (CSDIDSServiceDependencies *)self;
}

- (NSString)countryCode
{
  return (NSString *)0;
}

- (BOOL)telephonyCapableDeviceExists
{
  return 0;
}

- (BOOL)relayCapableDeviceExists
{
  return 0;
}

- (BOOL)defaultPairedDeviceExists
{
  return 0;
}

- (BOOL)pairedDeviceExists
{
  return 0;
}

- (BOOL)hasActiveAccounts
{
  return 1;
}

- (IDSDevice)defaultPairedDevice
{
  return (IDSDevice *)0;
}

- (IDSDevice)pairedDevice
{
  return (IDSDevice *)0;
}

- (NSSet)availableOutgoingRelayCallerIDs
{
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (NSString)localDeviceUniqueID
{
  return (NSString *)0;
}

- (IDSAccount)account
{
  NSSet v2 = self;
  id v3 = sub_100307580();

  return (IDSAccount *)v3;
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10030773C((uint64_t)a3);
}

- (NSArray)allAliases
{
  NSSet v2 = self;
  sub_1003077B4();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)devices
{
  sub_1001F6204(0, (unint64_t *)&qword_100585F20);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSString)callerID
{
  sub_1003078B8();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (NSSet)aliases
{
  uint64_t v2 = self;
  sub_10030796C();

  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (id)deviceWithUniqueID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  return 0;
}

- (id)devicesWithCapability:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  sub_1001F6204(0, (unint64_t *)&qword_100585F20);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  sub_1001F081C(&qword_100587330);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (void)addServiceDelegate:(id)a3 queue:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_100307B00((uint64_t)a3, (uint64_t)v7);
  swift_unknownObjectRelease();
}

- (void)removeServiceDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_100307BA4((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3
{
  return 0;
}

- (void)addFirewallEntriesForHandleToDate:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  type metadata accessor for Date();
  sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)addFirewallEntryForHandle:(id)a3 lastSeenDate:(id)a4
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)addFirewallEntriesForHandles:(id)a3 lastSeenDate:(id)a4
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)removeFirewallEntries:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  id v17 = a7;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v17)
  {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1001F7498(v18, v20);
  return 1;
}

- (void)noteApprovedHandle:(void *)a3 completionHandle:(void *)aBlock
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = a1;
  sub_100308040((uint64_t)v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a12;
  v24 = self;
  sub_100308110(v16, v18, v19, v25, v26, v27, v21, 0, v22);
  v29 = v28;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v29;
}

- (void).cxx_destruct
{
  swift_release();
  NSArray v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDSimulatedIDSService____lazy_storage___account);

  sub_100308CD8(v3);
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  v10 = a3;
  if (a3)
  {
    id v12 = a4;
    id v13 = a6;
    id v14 = self;
    id v15 = v10;
    v10 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v17 = v16;

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  id v18 = a4;
  id v19 = a6;
  id v20 = self;
  unint64_t v17 = 0xF000000000000000;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if (a6)
  {
LABEL_4:
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1001FCB18((uint64_t)v10, v17);
  return 1;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (a7) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  uint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100308678(v10, v12, a4, (uint64_t)v13, (void (**)(void, void, void))v8);
  _Block_release(v8);
  sub_1001F7498(v10, v12);
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 completion:(id)a7
{
  unint64_t v12 = _Block_copy(a7);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v22 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  _Block_copy(v12);
  sub_100308788(v16, v18, v19, v21, (uint64_t)v15, a6, (uint64_t)v22, (void (**)(void, void, void))v12);
  _Block_release(v12);
  sub_1001F7498(v19, v21);
  sub_1001F7498(v16, v18);
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  return 0;
}

@end