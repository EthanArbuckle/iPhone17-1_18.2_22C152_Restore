@interface SocialOnboardingContactsMatchingRequestOperation
- (_TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation SocialOnboardingContactsMatchingRequestOperation

- (void)execute
{
  v2 = self;
  sub_331EA0();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_3324EC((uint64_t)a3);
}

- (_TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation)init
{
  result = (_TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation__responseHandler];

  sub_1A528(v3);
}

@end