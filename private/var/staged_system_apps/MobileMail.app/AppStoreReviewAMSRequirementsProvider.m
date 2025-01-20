@interface AppStoreReviewAMSRequirementsProvider
- (_TtC10MobileMail37AppStoreReviewAMSRequirementsProvider)init;
- (void)checkPromptAllowed:(id)a3;
- (void)didAttemptPrompt;
- (void)didForeground;
@end

@implementation AppStoreReviewAMSRequirementsProvider

- (void)didForeground
{
  v2 = self;
  sub_100258858();
}

- (void)checkPromptAllowed:(id)a3
{
  v5 = _Block_copy(a3);
  v4 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  sub_1002588EC((uint64_t)sub_100259E84, v6);
  swift_release();
}

- (void)didAttemptPrompt
{
  v2 = self;
  sub_100259E90();
}

- (_TtC10MobileMail37AppStoreReviewAMSRequirementsProvider)init
{
  return (_TtC10MobileMail37AppStoreReviewAMSRequirementsProvider *)sub_100259F24();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37AppStoreReviewAMSRequirementsProvider_storeReview));
}

@end