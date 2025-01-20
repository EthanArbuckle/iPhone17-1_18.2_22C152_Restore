@interface GroupFaceTimeNotificationProvider
- (_TtC13callservicesd33GroupFaceTimeNotificationProvider)init;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 conversation:(id)a4 requestedScreenShareForParticipant:(id)a5;
- (void)conversationManager:(id)a3 handoffEligibilityChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 handoffEligibilityChangedToConversation:(id)a4 fromPreviousConversation:(id)a5;
- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 pendingMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)dealloc;
- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3;
- (void)momentsStartedRemoteCapture:(id)a3;
@end

@implementation GroupFaceTimeNotificationProvider

- (_TtC13callservicesd33GroupFaceTimeNotificationProvider)init
{
}

- (void)dealloc
{
  v2 = self;
  sub_100226314();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_contactsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_ftNetworkSupport));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_featureFlags));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_faceTimeNotificationCenter));
  swift_unknownObjectRelease();
  sub_1001FCD14();
  sub_100235C28(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_openURL);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_unlockAndOpenSensitiveURL);
  sub_1001FCD14();
  sub_1001FCD14();
  sub_1001FCD14();
  swift_bridgeObjectRelease();
  sub_100235C28(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_add);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_replace);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_removeNotification);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13callservicesd33GroupFaceTimeNotificationProvider_updateBadgeValue);

  sub_100208490(v3);
}

- (void)momentsStartedRemoteCapture:(id)a3
{
}

- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3
{
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022E898();
}

- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022F4DC((int)v8, v7);
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022F74C();
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022FE0C((int)v8, v7);
}

- (void)conversationManager:(id)a3 pendingMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10022FF6C();
}

- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10023030C();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10023084C();
}

- (void)conversationManager:(id)a3 conversation:(id)a4 requestedScreenShareForParticipant:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10023108C((uint64_t)v11, (uint64_t)v9, v10);
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002313C8();
}

- (void)conversationManager:(id)a3 handoffEligibilityChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100232D1C();
}

- (void)conversationManager:(id)a3 handoffEligibilityChangedToConversation:(id)a4 fromPreviousConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100233138();
}

@end