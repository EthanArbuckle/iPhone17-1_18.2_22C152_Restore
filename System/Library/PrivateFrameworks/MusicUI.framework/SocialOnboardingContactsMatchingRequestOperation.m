@interface SocialOnboardingContactsMatchingRequestOperation
- (_TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation SocialOnboardingContactsMatchingRequestOperation

- (void)execute
{
  v2 = self;
  sub_229958E94();
}

- (void)finishWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_229959504((uint64_t)a3);
}

- (_TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation)init
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation_accessQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation_contactStore));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation__responseHandler);

  sub_22948636C(v3);
}

@end