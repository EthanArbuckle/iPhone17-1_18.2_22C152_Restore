@interface ConversationPublishers
- (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers)init;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationsChangedForConversationManager:(id)a3;
@end

@implementation ConversationPublishers

- (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers)init
{
  return (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers *)sub_1000D9EAC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager);
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000DA288(v4);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000DC708(v9, v10);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000DCC10(v7);
}

@end