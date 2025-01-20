@interface ANFDebugLayoutOptionsProvider
- (CGSize)overrideViewportSize:(CGSize)a3;
- (_TtC12NewsArticles29ANFDebugLayoutOptionsProvider)init;
- (double)overrideContentScaleFactor:(double)a3;
- (id)overrideConditionKeys:(id)a3;
- (id)overrideContentSizeCategory:(id)a3;
- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3;
- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3;
- (int64_t)overrideOfferUpsellScenario:(int64_t)a3;
- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3;
- (unint64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3;
- (unint64_t)overrideViewingLocation:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation ANFDebugLayoutOptionsProvider

- (_TtC12NewsArticles29ANFDebugLayoutOptionsProvider)init
{
  result = (_TtC12NewsArticles29ANFDebugLayoutOptionsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF5C9BEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v3);
  sub_1BF5C9DCC((uint64_t)v3);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (CGSize)overrideViewportSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  sub_1BF5C9BEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v7);
  sub_1BF5C9BEC((uint64_t)v7, (uint64_t)v8);
  if (sub_1BF5C9DA8((uint64_t)v8) != 1 && (v9 & 1) == 0)
  {
    CGFloat width = *(double *)v8;
    CGFloat height = *(double *)&v8[1];
  }
  double v5 = width;
  double v6 = height;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (id)overrideContentSizeCategory:(id)a3
{
  sub_1BF5C9BEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v9);
  sub_1BF5C9BEC((uint64_t)v9, (uint64_t)v10);
  int v4 = sub_1BF5C9DA8((uint64_t)v10);
  id v5 = v11;
  if (v11) {
    BOOL v6 = v4 == 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    id v5 = a3;
  }
  id v7 = v5;
  return v7;
}

- (double)overrideContentScaleFactor:(double)a3
{
  sub_1BF5C9BEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v6);
  sub_1BF5C9BEC((uint64_t)v6, (uint64_t)v7);
  BOOL v4 = sub_1BF5C9DA8((uint64_t)v7) == 1;
  double result = v8;
  if ((v4 | v9)) {
    return a3;
  }
  return result;
}

- (unint64_t)overrideViewingLocation:(unint64_t)a3
{
  BOOL v4 = self;
  unint64_t v5 = sub_1BF5C91E8(a3);

  return v5;
}

- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3
{
  BOOL v4 = self;
  int64_t v5 = sub_1BF5C9368(a3);

  return v5;
}

- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3
{
  BOOL v4 = self;
  int64_t v5 = sub_1BF5C94E8(a3);

  return v5;
}

- (unint64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3
{
  BOOL v4 = self;
  unint64_t v5 = sub_1BF5C9660(a3);

  return v5;
}

- (int64_t)overrideOfferUpsellScenario:(int64_t)a3
{
  BOOL v4 = self;
  int64_t v5 = sub_1BF5C97E0(a3);

  return v5;
}

- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3
{
  BOOL v4 = self;
  int64_t v5 = sub_1BF5C9984(a3);

  return v5;
}

- (id)overrideConditionKeys:(id)a3
{
  if (a3) {
    BOOL v4 = (void *)sub_1BF7E3EE8();
  }
  else {
    BOOL v4 = 0;
  }
  sub_1BF5C9BEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v6);
  sub_1BF5C9BEC((uint64_t)v6, (uint64_t)v7);
  if (sub_1BF5C9DA8((uint64_t)v7) == 1 || !v8)
  {
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  BOOL v4 = (void *)sub_1BF7E3ED8();
  swift_bridgeObjectRelease();
LABEL_9:
  return v4;
}

@end