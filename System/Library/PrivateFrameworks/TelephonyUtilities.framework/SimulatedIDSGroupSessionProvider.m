@interface SimulatedIDSGroupSessionProvider
- (BOOL)isAVLess;
- (CSDIDSGroupSessionProviderDelegate)delegate;
- (NSArray)participantDestinationIDs;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)UUID;
- (NSString)clientUUIDString;
- (NSString)destination;
- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)init;
- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)initWithGroupUUID:(id)a3 participantDestinationIDs:(id)a4 localMember:(id)a5 queue:(id)a6 simulatedConversationManager:(id)a7;
- (uint64_t)setLocalParticipantType:memberDestinations:;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)endedReason;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)joinWithOptions:(id)a3;
- (void)kickParticipants:(id)a3;
- (void)leaveWithOptions:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)registerPluginWithOptions:(id)a3;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)sendParticipantData:(id)a3 withContext:(id)a4;
- (void)setClientUUIDString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredLackOfCapabilities:(id)a3;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantInfo:(id)a3;
@end

@implementation SimulatedIDSGroupSessionProvider

- (NSString)clientUUIDString
{
  return (NSString *)sub_100303568((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100302468);
}

- (void)setClientUUIDString:(id)a3
{
}

- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)initWithGroupUUID:(id)a3 participantDestinationIDs:(id)a4 localMember:(id)a5 queue:(id)a6 simulatedConversationManager:(id)a7
{
  uint64_t v10 = type metadata accessor for UUID();
  __chkstk_darwin(v10 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  sub_1003024C8();
  return result;
}

- (BOOL)isAVLess
{
  return 0;
}

- (NSArray)participantDestinationIDs
{
  v2 = self;
  sub_100303418();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (unsigned)endedReason
{
  return sub_100303540();
}

- (NSString)destination
{
  return (NSString *)sub_100303568((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1003035B8);
}

- (void)setDestination:(id)a3
{
}

- (NSString)UUID
{
  v2 = self;
  sub_10030370C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CSDIDSGroupSessionProviderDelegate)delegate
{
  v2 = (void *)sub_10030376C();

  return (CSDIDSGroupSessionProviderDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1003037DC();
}

- (void)setPreferences:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)joinWithOptions:(id)a3
{
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  if (a4)
  {
    id v8 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0xF000000000000000;
  }
  sub_100303EA0();
  sub_1001FCB18((uint64_t)a4, v10);

  swift_bridgeObjectRelease();
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a5;
  id v12 = a6;
  id v13 = self;
  if (a4)
  {
    id v14 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;
  }
  else
  {
    unint64_t v16 = 0xF000000000000000;
  }
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100303F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1001FCB18((uint64_t)a4, v16);

  swift_bridgeObjectRelease();
}

- (void)sendParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  sub_1001F7498(v11, v13);
  sub_1001F7498(v8, v10);
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  sub_1001F7498(v5, v7);
}

- (void)leaveWithOptions:(id)a3
{
}

- (void)kickParticipants:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)registerPluginWithOptions:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  unint64_t v9 = self;
  sub_100304848(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  if (a3)
  {
    sub_1001F6204(0, (unint64_t *)&qword_100585590);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_1001F7498(v8, v10);
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  id v7 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_1001F7498(v8, v10);
  return a3;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a4;
  unint64_t v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100304B50(a3, v10, v12, (uint64_t)v13, (void (**)(void, void))v8);
  _Block_release(v8);
  sub_1001F7498(v10, v12);
}

- (NSSet)requiredCapabilities
{
  return (NSSet *)sub_100304CB8((uint64_t)self, (uint64_t)a2, sub_100304C68);
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (NSSet)requiredLackOfCapabilities
{
  return (NSSet *)sub_100304CB8((uint64_t)self, (uint64_t)a2, sub_100304D24);
}

- (void)setRequiredLackOfCapabilities:(id)a3
{
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  if (a3)
  {
    static Set._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    static Set._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (uint64_t)setLocalParticipantType:memberDestinations:
{
  sub_1001F081C(&qword_100587330);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return swift_bridgeObjectRelease();
}

- (_TtC13callservicesd32SimulatedIDSGroupSessionProvider)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  type metadata accessor for UUID();
  sub_10020233C();
  sub_1001F7664();
  v3();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_simulatedConversationManager));
  swift_release();
  swift_bridgeObjectRelease();
  sub_100222678((uint64_t)self + OBJC_IVAR____TtC13callservicesd32SimulatedIDSGroupSessionProvider_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end