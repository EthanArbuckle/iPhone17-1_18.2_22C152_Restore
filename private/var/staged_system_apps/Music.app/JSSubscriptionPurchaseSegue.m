@interface JSSubscriptionPurchaseSegue
@end

@implementation JSSubscriptionPurchaseSegue

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__buyParameters;
  uint64_t v4 = sub_100063814(&qword_10109F4D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__metricsOverlay;
  uint64_t v6 = sub_100063814(&qword_1010D43D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__shouldShowLoadingIndicator;
  uint64_t v8 = sub_100063814(&qword_10109C180);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end