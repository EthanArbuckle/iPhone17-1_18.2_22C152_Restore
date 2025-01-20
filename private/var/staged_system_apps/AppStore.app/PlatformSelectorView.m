@interface PlatformSelectorView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC8AppStore20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC8AppStore20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (void)didTapSelectorView;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC8AppStore20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20PlatformSelectorView *)sub_100135AF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20PlatformSelectorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_numberOfBadges) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_didSelectHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore20PlatformSelectorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didTapSelectorView
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_didSelectHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013631C();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  uint64_t v3 = type metadata accessor for BadgeDisplayStyle();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  static BadgeDisplayStyle.style(forBadgeCount:pageTraits:indentForBadges:)();
  id v8 = sub_100136704((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_descriptionWithBadgesAsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_descriptionWithBadgesInlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_descriptionWithTwoColumnsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_accessoryImageView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_didSelectHandler);

  sub_10006012C(v3);
}

@end