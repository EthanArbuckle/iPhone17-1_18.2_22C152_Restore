@interface SocialOnboardingNetworkFriendsMatchingRequestOperation
- (_TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation SocialOnboardingNetworkFriendsMatchingRequestOperation

- (void)execute
{
  v2 = self;
  sub_109120();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_109C38((uint64_t)a3);
}

- (_TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation)init
{
  result = (_TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(void *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation_responseHandler]);

  swift_bridgeObjectRelease();
}

@end