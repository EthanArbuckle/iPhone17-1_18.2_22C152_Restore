@interface CSDConversationPersistenceController
- (CSDConversationPersistenceController)init;
- (CSDConversationPersistenceController)initWithQueue:(id)a3;
- (void)enumerateActiveConversations:(id)a3;
- (void)removeAllConversations;
- (void)removeConversation:(id)a3;
- (void)updateConversation:(id)a3;
@end

@implementation CSDConversationPersistenceController

- (CSDConversationPersistenceController)initWithQueue:(id)a3
{
  return (CSDConversationPersistenceController *)sub_10030E2A0(a3);
}

- (void)updateConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10030E324();
}

- (void)removeConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10030E96C();
}

- (void)removeAllConversations
{
  v2 = self;
  sub_10030EF68();
}

- (void)enumerateActiveConversations:(id)a3
{
  id v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_10030F438();

  swift_release();
}

- (CSDConversationPersistenceController)init
{
}

- (void).cxx_destruct
{
  sub_10021E23C((uint64_t)self + OBJC_IVAR___CSDConversationPersistenceController_storage, &qword_100586EF8);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDConversationPersistenceController_lockStateObserver);
}

@end