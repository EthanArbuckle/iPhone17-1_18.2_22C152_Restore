@interface JSStoreFlowSegue
@end

@implementation JSStoreFlowSegue

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__url;
  uint64_t v4 = sub_100063814(&qword_1010D3AA0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__sourceApplicationBundleIdentifier;
  uint64_t v7 = sub_100063814(&qword_10109F4D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__referrerURL, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__userInfo;
  uint64_t v9 = sub_100063814(&qword_1010D4568);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__scriptingMetricsOverlay;
  uint64_t v11 = sub_100063814(&qword_1010D43D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didCompleteSubscriptionPurchase;
  uint64_t v13 = sub_100063814(&qword_1010D4580);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__subscriptionStatus;
  uint64_t v15 = sub_100063814(&qword_1010D4598);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didFinishLinkingWithCarrier;
  uint64_t v17 = sub_100063814(&qword_10109C180);
  v18 = *(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8);

  v18(v16, v17);
}

@end