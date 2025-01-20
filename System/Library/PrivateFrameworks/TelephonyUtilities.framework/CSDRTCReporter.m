@interface CSDRTCReporter
- (CSDRTCReporter)init;
- (CSDRTCReporter)initWithQueue:(id)a3;
- (CSDRTCReporter)initWithQueue:(id)a3 chManager:(id)a4;
- (void)reportingController:(id)a3 AVCBlobRecoveryStartedForConversation:(id)a4;
- (void)reportingController:(id)a3 AVCBlobRecoveryTimedOutForConversation:(id)a4;
- (void)reportingController:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 addedActiveConversation:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 callUUID:(id)a4 withUserScore:(int)a5;
- (void)reportingController:(id)a3 createConversationReportingSessionForConversation:(id)a4;
- (void)reportingController:(id)a3 messageRetryFailedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 messageRetryStartedForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 messageRetrySucceededForConversationGroupUUID:(id)a4;
- (void)reportingController:(id)a3 oneToOneModeSwitchFailureForConversation:(id)a4 isOneToOneMode:(BOOL)a5;
- (void)reportingController:(id)a3 pickedRoute:(id)a4 forCall:(id)a5;
- (void)reportingController:(id)a3 receivedConnectionSetupReport:(id)a4 eventType:(int64_t)a5 forConversation:(id)a6;
- (void)reportingController:(id)a3 receivedGroupActivitiesReports:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedHandoffReport:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedIDSChat:(id)a4;
- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forConversation:(id)a5;
- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forSessionWithUUID:(id)a5;
- (void)reportingController:(id)a3 receivedLetMeInRequestForConversation:(id)a4;
- (void)reportingController:(id)a3 remoteMemberNotInMemberListForConversation:(id)a4;
- (void)reportingController:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 removedActiveConversation:(id)a4;
- (void)reportingController:(id)a3 sentLetMeInResponseForConversation:(id)a4 isApproved:(BOOL)a5;
- (void)reportingController:(id)a3 stateChangedForConversation:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)reportingController:(id)a3 timedOutPickingRoute:(id)a4 forCall:(id)a5;
- (void)reportingController:(id)a3 transitionAttemptForConversation:(id)a4;
- (void)reportingController:(id)a3 voipAppBecameDisabledFromLaunching:(id)a4;
- (void)reportingController:(id)a3 voipAppFailedToPostIncomingCall:(id)a4;
- (void)reportingController:(id)a3 voipDOSCallIgnored:(id)a4;
- (void)reportingController:(id)a3 voipPushDroppedOnTheFloor:(id)a4;
@end

@implementation CSDRTCReporter

- (CSDRTCReporter)initWithQueue:(id)a3
{
  return (CSDRTCReporter *)sub_100210DAC(a3);
}

- (CSDRTCReporter)initWithQueue:(id)a3 chManager:(id)a4
{
  return (CSDRTCReporter *)sub_100210F98(a3, a4);
}

- (void)reportingController:(id)a3 createConversationReportingSessionForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 timedOutPickingRoute:(id)a4 forCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10021596C();
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_100211988();
}

- (void)reportingController:(id)a3 pickedRoute:(id)a4 forCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10021596C();
}

- (void)reportingController:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100217FF0();
}

- (void)reportingController:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100217FF0();
}

- (void)reportingController:(id)a3 AVCBlobRecoveryStartedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 remoteMemberNotInMemberListForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 transitionAttemptForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 AVCBlobRecoveryTimedOutForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 oneToOneModeSwitchFailureForConversation:(id)a4 isOneToOneMode:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_10021BCD8();
}

- (void)reportingController:(id)a3 messageRetryStartedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 messageRetryFailedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 messageRetrySucceededForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a4
{
}

- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forConversation:(id)a5
{
}

- (void)reportingController:(id)a3 receivedIDSChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100217FF0();
}

- (void)reportingController:(id)a3 receivedIDSReports:(id)a4 forSessionWithUUID:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001F081C((uint64_t *)&unk_100586DF0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_10021879C();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)reportingController:(id)a3 receivedHandoffReport:(id)a4 forConversation:(id)a5
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = a5;
  id v10 = self;
  sub_10021A904();

  swift_bridgeObjectRelease();
}

- (void)reportingController:(id)a3 receivedConnectionSetupReport:(id)a4 eventType:(int64_t)a5 forConversation:(id)a6
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a6;
  id v11 = self;
  sub_100219F44();

  swift_bridgeObjectRelease();
}

- (void)reportingController:(id)a3 receivedGroupActivitiesReports:(id)a4 forConversation:(id)a5
{
}

- (void)reportingController:(id)a3 voipAppFailedToPostIncomingCall:(id)a4
{
}

- (void)reportingController:(id)a3 voipAppBecameDisabledFromLaunching:(id)a4
{
}

- (void)reportingController:(id)a3 voipPushDroppedOnTheFloor:(id)a4
{
}

- (void)reportingController:(id)a3 voipDOSCallIgnored:(id)a4
{
}

- (void)reportingController:(id)a3 receivedLetMeInRequestForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10021B950();
}

- (void)reportingController:(id)a3 sentLetMeInResponseForConversation:(id)a4 isApproved:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_10021BCD8();
}

- (void)reportingController:(id)a3 callUUID:(id)a4 withUserScore:(int)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100213C54();

  swift_bridgeObjectRelease();
}

- (CSDRTCReporter)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDRTCReporter_chManager);
}

@end