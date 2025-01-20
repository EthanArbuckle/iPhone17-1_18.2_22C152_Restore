@interface FindFriendIntentHandler
- (_TtC10SiriFindMy23FindFriendIntentHandler)init;
- (void)confirmFindFriend:(id)a3 completion:(id)a4;
- (void)handleFindFriend:(id)a3 completion:(id)a4;
- (void)resolveFriendForFindFriend:(id)a3 withCompletion:(id)a4;
@end

@implementation FindFriendIntentHandler

- (void)resolveFriendForFindFriend:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmFindFriend:(id)a3 completion:(id)a4
{
}

- (void)handleFindFriend:(id)a3 completion:(id)a4
{
}

- (_TtC10SiriFindMy23FindFriendIntentHandler)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy23FindFriendIntentHandler_deviceState);
  sub_1D4514794((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy23FindFriendIntentHandler_sessionManager, (void (*)(void))type metadata accessor for FindFriendSessionManager);

  swift_release();
}

@end