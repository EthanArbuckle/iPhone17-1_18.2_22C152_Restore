@interface CarouselItemModuleHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemModuleHeaderView

- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CarouselItemModuleHeaderView *)sub_1004FCAB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004FE4D8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemModuleHeaderView *)&v5 layoutSubviews];
  sub_1004FD620(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CarouselItemModuleHeaderView *)v3 traitCollection];
  sub_1004FD620(v11);
  sub_100081D90(v11, v11[3]);
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v6 = v5;
  double v8 = v7;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_titleLabel));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_displayOptions;
  uint64_t v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_badgeLabel));
  double v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_titleLabel);
}

@end