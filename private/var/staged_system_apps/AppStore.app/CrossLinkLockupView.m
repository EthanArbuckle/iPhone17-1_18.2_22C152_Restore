@interface CrossLinkLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore19CrossLinkLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore19CrossLinkLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CrossLinkLockupView

- (_TtC8AppStore19CrossLinkLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19CrossLinkLockupView *)sub_1001AE768(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore19CrossLinkLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B0A84();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1001AED8C((uint64_t)v7);
  [(CrossLinkLockupView *)v8 layoutMargins];
  id v9 = [(CrossLinkLockupView *)v8 traitCollection];
  double v10 = sub_100709D3C((uint64_t)v7);
  double v12 = v11;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_lockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1001AF57C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_crossLinkSubtitleLabel));

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_crossLinkTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore19CrossLinkLockupView_crossLinkSubtitleLabel));
}

@end