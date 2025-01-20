@interface NewsletterSubscriptionStatusProvider
- (_TtC12NewsArticles36NewsletterSubscriptionStatusProvider)init;
- (unint64_t)newsletterSubscriptionStatus;
- (void)addObserver:(id)a3;
- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NewsletterSubscriptionStatusProvider

- (_TtC12NewsArticles36NewsletterSubscriptionStatusProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(self, sel_weakObjectsHashTable);

  result = (_TtC12NewsArticles36NewsletterSubscriptionStatusProvider *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers);
}

- (unint64_t)newsletterSubscriptionStatus
{
  v2 = self;
  unint64_t v3 = sub_1BF601BD0();

  return v3;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  v4 = self;
  sub_1BF601D54(a3);
}

@end