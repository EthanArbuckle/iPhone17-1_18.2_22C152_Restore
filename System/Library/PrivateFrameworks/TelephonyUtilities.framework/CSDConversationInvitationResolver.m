@interface CSDConversationInvitationResolver
- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4;
- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4 invitationMessagePreferences:(id)a5;
- (BOOL)shouldShowInvitationUserNotificationForConversation:(id)a3 handle:(id)a4;
- (BOOL)shouldStartRingingTimeoutForConversation:(id)a3 handle:(id)a4;
- (CSDConversationInvitationResolver)init;
@end

@implementation CSDConversationInvitationResolver

- (CSDConversationInvitationResolver)init
{
  return (CSDConversationInvitationResolver *)sub_10030B134();
}

- (BOOL)shouldShowInvitationUserNotificationForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_10030B674(v6, a4, 2);

  return a4 & 1;
}

- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_10030B674(v6, a4, 4);

  return a4 & 1;
}

- (BOOL)shouldShowInvitationRingingUIForConversation:(id)a3 handle:(id)a4 invitationMessagePreferences:(id)a5
{
  sub_10030BB0C();
  sub_10030BB4C();
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  LOBYTE(a4) = sub_10030B7D0(v9, a4, v8);

  swift_bridgeObjectRelease();
  return a4 & 1;
}

- (BOOL)shouldStartRingingTimeoutForConversation:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  LOBYTE(a4) = sub_10030B980(v6, a4);

  return a4 & 1;
}

- (void).cxx_destruct
{
}

@end