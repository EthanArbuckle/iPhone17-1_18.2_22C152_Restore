@interface CSDConversationLocalParticipantBlobTracker
- (CSDConversationLocalParticipantBlobTracker)init;
- (CSDConversationLocalParticipantBlobTracker)initWithConversation:(id)a3 idsGroupSession:(id)a4 queue:(id)a5;
- (void)handleConversationStateUpdated;
- (void)invalidateLocalParticipantBlobWantsDeliveryOverPush:(BOOL)a3;
@end

@implementation CSDConversationLocalParticipantBlobTracker

- (CSDConversationLocalParticipantBlobTracker)initWithConversation:(id)a3 idsGroupSession:(id)a4 queue:(id)a5
{
  return (CSDConversationLocalParticipantBlobTracker *)sub_100296748((uint64_t)a3, a4, (uint64_t)a5);
}

- (void)handleConversationStateUpdated
{
  v2 = self;
  sub_100296874();
}

- (void)invalidateLocalParticipantBlobWantsDeliveryOverPush:(BOOL)a3
{
  v4 = self;
  sub_100296BC0(a3);
}

- (CSDConversationLocalParticipantBlobTracker)init
{
}

- (void).cxx_destruct
{
  sub_100222678((uint64_t)self + OBJC_IVAR___CSDConversationLocalParticipantBlobTracker_conversation);
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDConversationLocalParticipantBlobTracker_queue);
}

@end