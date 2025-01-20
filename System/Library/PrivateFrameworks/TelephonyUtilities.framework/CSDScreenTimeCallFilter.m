@interface CSDScreenTimeCallFilter
- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)containsRecentsRestrictedHandle:(id)a3;
- (BOOL)containsRestrictedHandle:(id)a3;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (CSDScreenTimeCallFilter)initWithCallProviderManager:(id)a3 delegate:(id)a4 queue:(id)a5;
- (CSDScreenTimeCallFilter)initWithQueue:(id)a3;
- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)handleCallRemoteParticipantsChanged:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)startMonitoringCall:(id)a3;
- (void)stopMonitoringCall:(id)a3;
@end

@implementation CSDScreenTimeCallFilter

- (CSDScreenTimeCallFilter)initWithCallProviderManager:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  sub_10039E848();
  return result;
}

- (void)startMonitoringCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10039ED80();
}

- (void)stopMonitoringCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10039F6CC();
}

- (BOOL)containsRestrictedHandle:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10039F998((uint64_t)a3);

  return 0;
}

- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  if (a4)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  v12 = self;
  char v13 = sub_10039FBE0((uint64_t)a3, v8, v10, a5);

  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_10039FD68(v6, v7);

  return v9 & 1;
}

- (BOOL)containsRecentsRestrictedHandle:(id)a3
{
  return 0;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  char v9 = self;
  sub_10039FEFC(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1001F6204(0, (unint64_t *)&qword_100585590);
  v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v10.super.isa;
}

- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  int64_t v6 = sub_1003A0158();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  char v6 = sub_1003A0430();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = self;
  char v12 = sub_1003A05E8(v7, v8, v10, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (BOOL)isUnknownCaller:(id)a3
{
  return 0;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003A0778();
}

- (void)handleCallRemoteParticipantsChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003A07DC();
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1003A0AC0();
}

- (CSDScreenTimeCallFilter)initWithQueue:(id)a3
{
  id v3 = a3;
  sub_1003A33C8();
}

- (void).cxx_destruct
{
  sub_100222678((uint64_t)self + OBJC_IVAR___CSDScreenTimeCallFilter_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end