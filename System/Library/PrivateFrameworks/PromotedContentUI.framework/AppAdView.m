@interface AppAdView
- (id)metricsActivityForAdLockupView:(id)a3 toPerformActionOfOffer:(id)a4 inState:(id)a5;
- (id)metricsActivityForPresentingProductDetailsOfAdLockupView:(id)a3 inState:(id)a4;
- (id)presentingViewControllerForAdLockupView:(id)a3;
- (void)adLockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)adLockupView:(id)a3 didSelectOfferWithState:(id)a4;
- (void)adLockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6;
- (void)adLockupViewDidCancelScreenshotsFetchRequest:(id)a3;
- (void)adLockupViewDidFinishRequest:(id)a3;
- (void)adLockupViewDidFinishScreenshotsFetchRequest:(id)a3;
- (void)adLockupViewDidInvalidateIntrinsicContentSize:(id)a3;
- (void)adLockupViewDidSelectAdMarker:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AppAdView

- (id)presentingViewControllerForAdLockupView:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = _s17PromotedContentUI9AppAdViewC010presentingF10Controller3forSo06UIViewH0CSgSo011ASCAdLockupF0C_tF_0();

  return v6;
}

- (void)adLockupViewDidCancelScreenshotsFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5D5A614(MEMORY[0x1E4FBD380]);
}

- (void)adLockupViewDidFinishScreenshotsFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5D5A614(MEMORY[0x1E4FBD370]);
}

- (void)adLockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5D5A614(MEMORY[0x1E4FBD370]);
}

- (void)adLockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s17PromotedContentUI9AppAdViewC08adLockupF16DidFinishRequestyySo05ASCAdhF0CF_0();
}

- (void)adLockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1B5D5AA84();
}

- (void)adLockupView:(id)a3 didSelectOfferWithState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1B5D5ADB8();
}

- (void)adLockupViewDidSelectAdMarker:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s17PromotedContentUI9AppAdViewC08adLockupf9DidSelectE6MarkeryySo05ASCAdhF0CF_0();
}

- (void)adLockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  v9 = _Block_copy(a6);
  _Block_copy(v9);
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = a5;
  v12 = self;
  sub_1B5D5C2E4(v11, (char *)v12, (void (**)(void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_unknownObjectRelease();
}

- (id)metricsActivityForPresentingProductDetailsOfAdLockupView:(id)a3 inState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  v9 = (void *)_s17PromotedContentUI9AppAdViewC42metricsActivityForPresentingProductDetails2of7inStateSo010ASCMetricsH0CSo011ASCAdLockupF0C_So06ASCAppO0atF_0();

  return v9;
}

- (id)metricsActivityForAdLockupView:(id)a3 toPerformActionOfOffer:(id)a4 inState:(id)a5
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  id v10 = self;
  objc_msgSend(objc_msgSend(v7, sel_metricsHelper), sel_interacted);
  swift_unknownObjectRelease();
  id v11 = sub_1B5D59B60();

  swift_unknownObjectRelease();
  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8498A0);
  id v5 = a3;
  id v6 = self;
  if (sub_1B5D0EB54())
  {
    uint64_t v7 = 2;
  }
  else
  {
    id v8 = [(AppAdView *)v6 traitCollection];
    uint64_t v7 = (uint64_t)objc_msgSend(v8, sel_userInterfaceStyle);
  }
  id v9 = sub_1B5D7EE5C();
  objc_msgSend(v9, sel_setOverrideUserInterfaceStyle_, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___appView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___topBorder));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___bottomBorder);
}

@end